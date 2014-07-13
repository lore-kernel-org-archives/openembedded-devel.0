Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id CCA1F7027F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2014 13:09:58 +0000 (UTC)
Received: from [99.240.204.5] (port=38253 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6JXS-0003IJ-Oo for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jul 2014 09:09:58 -0400
Date: Sun, 13 Jul 2014 09:09:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407130825500.24436@localhost>
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
Subject: some questions about overriding tasks
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
X-List-Received-Date: Sun, 13 Jul 2014 13:10:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i think i understand most of this but just want to make sure -- this
doesn't seem comprehensively documented in any of the OE or yocto
docs, and i'll use examples from the oe-core codebase, after which
i'm going to write all this up and wiki it.

  to begin with, we have a small number of fundamental tasks defined
in base.bbclass:

 * do_fetch
 * do_unpack
 * do_configure
 * do_compile
 * do_install
 * do_package

first, it's possible to simply override the entire task definition,
both in subsequent class files and recipe files, correct?  for
instance, here's something from cross.bbclass:

do_install () {
        oe_runmake 'DESTDIR=${D}' install
}

although it seems extremely uncommon to override those tasks from
another bbclass file. it's far more common to do that from recipe
files, like this from zlib_1.2.8.bb:

do_configure (){
        ./configure --prefix=${prefix} --shared --libdir=${libdir}
}

do_compile (){
        oe_runmake
}

  so, in both cases, one can simply override *totally* a base task
definition in both a class file and a recipe file, even though this is
done almost exclusively from within recipe files. so far, so good?

  the next option is to use "_append" or "_prepend" to enhance an
underlying task definition but, again, while this can be done in class
files, there's not a lot of that in the oe-core class files (here's
hoping i got my grep command correct):

$ grep -E "^do_.*(ap|pre)pend" *
binconfig-disabled.bbclass:do_install_append () {
gnomebase.bbclass:do_install_append() {
gtk-doc.bbclass:do_configure_prepend () {
icecc.bbclass:do_configure_prepend() {
icecc.bbclass:do_compile_prepend() {
icecc.bbclass:do_compile_kernelmodules_prepend() {
icecc.bbclass:do_install_prepend() {
kernel-module-split.bbclass:do_install_append() {
libc-package.bbclass:do_configure_prepend() {
$

  there is, unsurprisingly, waaaaaaaaay more in recipe files but,
again, the point is that the above can be done in both class and
recipe files, yes?

  the final kind of overriding i've seen is to simply deactivate a
task, and i've seen that done three different ways. first, you can
redefine it as the null task, as in xuser-account_0.1.bb:

do_configure() {
    :
}

do_compile() {
    :
}

do_install() {
    :
}

  the next option appears to be to use the "[noexec]" variable flag,
which can occur in both class and recipe files, like this in
packagegroup.bbclass:

packagegroup.bbclass:do_fetch[noexec] = "1"
packagegroup.bbclass:do_unpack[noexec] = "1"
packagegroup.bbclass:do_patch[noexec] = "1"
packagegroup.bbclass:do_configure[noexec] = "1"
packagegroup.bbclass:do_compile[noexec] = "1"
packagegroup.bbclass:do_install[noexec] = "1"
packagegroup.bbclass:do_populate_sysroot[noexec] = "1"

  and the *third* way to deactivate a task appears to be with
"deltask", as in the class files:

$ grep deltask *
cross.bbclass:deltask package
cross.bbclass:deltask packagedata
cross.bbclass:deltask package_write_ipk
cross.bbclass:deltask package_write_deb
cross.bbclass:deltask package_write_rpm
cross.bbclass:deltask package_write
externalsrc.bbclass:                bb.build.deltask(task, d)
externalsrc.bbclass:            bb.build.deltask(task, d)
native.bbclass:deltask package
native.bbclass:deltask packagedata
native.bbclass:deltask package_write_ipk
native.bbclass:deltask package_write_deb
native.bbclass:deltask package_write_rpm
native.bbclass:deltask package_write
ptest.bbclass:            bb.build.deltask(i, d)
$

  deltask seems to be used almost exclusively in .bbclass files, but i
found a single example searching through the numerous layers i have on
my system, in meta-oe/meta-initramfs/recipes/devtools/klibc:

klcc-cross_2.0.3.bb:deltask do_package
klcc-cross_2.0.3.bb:deltask do_packagedata
klcc-cross_2.0.3.bb:deltask do_package_write_ipk
klcc-cross_2.0.3.bb:deltask do_package_write_rpm
klcc-cross_2.0.3.bb:deltask do_package_write_deb
klcc-cross_2.0.3.bb:deltask do_package_write_tar

  so it appears that deltask is valid for both class and recipe files,
but the above is the only example i found across several layers of its
use in a recipe file.

  and about the three ways to "deactivate" a task:

1)

    do_configure() {
        :
    }

2)

    do_configure[noexec] = "1"

3)

    deltask do_package

is there a style guide, since it would appear that the above might
have very different effects. the first still defines a task which
runs, but simply does nothing.

  the second leaves the task defined, but it does *not* run.

  the third appears to delete the definition of the task entirely.

are there dependency issues related to which version you use? what
happens if you "delete" a task which is the dependency of some other
existing task? is this written up somewhere?

  i think i'll stop here, a post on EXPORT_FUNCTIONS coming up
shortly ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

