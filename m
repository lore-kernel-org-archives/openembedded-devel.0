Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4B01A702A7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2014 14:19:11 +0000 (UTC)
Received: from [99.240.204.5] (port=39874 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6KcR-0007sr-W7 for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jul 2014 10:19:12 -0400
Date: Sun, 13 Jul 2014 10:19:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407130915280.31826@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: overriding tasks with EXPORT_FUNCTIONS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Jul 2014 14:19:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  followup to last post -- all of the methods for "overriding" task
definitions in the last post can be used without predeclaring that
you're about to do that; you just go ahead and do it in either a class
file or a recipe file. on the other hand, EXPORT_FUNCTIONS allows you
to retain the base definition of a task (or non-task function, as i
read it), then define a more general enhanced version.

  (side note: i don't see a single mention of "EXPORT_FUNCTIONS" in
any of the numerous yocto docs -- i think this feature needs some
explanation *somewhere*. :-)

  first question -- as long as you're using any of the techniques
described in my last post, there is no need for EXPORT_FUNCTIONS,
correct? this feature is only necessary if you want to redefine a task
in terms of the underlying task definition that doesn't fall into one
of those earlier categories.

  i notice that base.bbclass does use this thusly:

EXPORT_FUNCTIONS do_fetch do_unpack do_configure do_compile do_install do_package

which now means that inheriting classes have access to the functions

 * base_do_fetch
 * base_do_unpack

and so on. and now, the questions.

  first, i can see that you can redefine a basic task in terms of the
underlying base task, as in eglibc_2.19.bb:

  do_compile () {
        # -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
        unset LDFLAGS
        base_do_compile
        ... snip ...

at this point, you now have a new, overriding definition for the
"compile" task for this recipe, although that's the only recipe file
example for that i found in all of oe-core, so obviously it's not used
all that often. oh, and the fact that you've defined "do_compile"
above means that you've redefined the underlying name, so that any
other recipe that includes this one also picks up that new definition
for the compile task, yes?

  on the other hand, a second way to use this can be seen in
cmake.bbclass:

    cmake_do_compile()  {
        cd ${B}
        base_do_compile
    }

but this form does *not* override the base definition, it simply
defines a second, alternative form of compiling that inheriting
classes or recipes can invoke explicitly if they wish.

  here's an example from autotools.bbclass:

autotools_do_install() {
        oe_runmake 'DESTDIR=${D}' install
        # Info dir listing isn't interesting at this point so remove it if it exists.
        if [ -e "${D}${infodir}/dir" ]; then
                rm -f ${D}${infodir}/dir
        fi
}
... snip ...
EXPORT_FUNCTIONS do_configure do_install

  (i note that the cmake routine turns around and invokes
base_do_compile, while the autotools routine does not -- it simply
redefines the entire routine. both forms perfectly acceptable.)

  so as long as i understand this correctly, the above defines a new
task/function, autotools_do_install(), that inheriting classes *may*
invoke if they wish, but the base form (base_do_install) is also still
available and is, in fact, still the default install task.

  and here's the tail end of cmake.bbclass that shows this in action:

cmake_do_compile()  {
        cd ${B}
        base_do_compile
}

cmake_do_install() {
        cd ${B}
        autotools_do_install
}

EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file

  so, to sum up, the first form of taking advantage of
EXPORT_FUNCTIONS is the way eglibc does it as above:


  do_compile () {
        unset LDFLAGS
        base_do_compile
        ... snip ...

which overrides the underlying do_compile task with this new one, so
that *everyone* from here on who includes this recipe will pick up
this redefined compile task. and in a case like this, there is no need
to use EXPORT_FUNCTIONS further.

  the second form is to define additional, alternative forms of some
tasks, as is done in cmake.bbclass:

cmake_do_compile()  {
        cd ${B}
        base_do_compile
}

cmake_do_install() {
        cd ${B}
        autotools_do_install
}

EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file

  and in this case, the underlying "base_do*" tasks definitions are
still available and are the default behaviours, but you can now
*explicitly* call these alternatives if you so choose, and you would
need to use EXPORT_FUNCTIONS on them.

  am i missing anything?

rday

p.s. oh, terminology. there is no need for anything to be a "task" for
the above; these really are all just functions being exported for use,
it just so happens that some of them represent underlying tasks, but
that's not necessary.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

