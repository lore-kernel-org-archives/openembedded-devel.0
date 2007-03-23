Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HUfwd-0002Nm-Hl
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 10:20:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2N9KMLh006797;
	Fri, 23 Mar 2007 09:20:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05950-09; Fri, 23 Mar 2007 09:20:20 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2N9KGhp006782
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 23 Mar 2007 09:20:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: markgross@thegnar.org
In-Reply-To: <20070323043126.GA893@thegnar.org>
References: <20070320033120.GA8678@thegnar.org>
	<1174574086.5949.32.camel@localhost.localdomain>
	<20070323043126.GA893@thegnar.org>
Date: Fri, 23 Mar 2007 09:20:15 +0000
Message-Id: <1174641616.5813.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: bitbake and OE opperation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2007 09:20:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-03-22 at 21:31 -0700, Mark Gross wrote:
> On Thu, Mar 22, 2007 at 02:34:45PM +0000, Richard Purdie wrote:
> Yup, I read it.  I still have questions (I've figured out a number of
> things since I posted this email.) Like, what triggers a given bbclass
> file to be parsed, and what determines when if the functions withing the
> class definition are executed.  I think I "get" the tasks and bb files
> but the classes are still a bit mysterious.

To trigger the inclusion of autotools.bbclass, you'd see "inherit
autotools". Each .bb file has an assumed "inherit base". Also, conf
files can add a class file for inclusion with IHHERIT = "xyz".

> Mostly I was looking for the starting point in the dynamical program
> space that the represent the dependency tree within the OE recipe
> trees.  I think I get this.
> 
> BB parses all the bb files which build up a network of dependencies that
> is then traversed based on a seed point defined by the command line.

Or seed points as it can have more than one, but yes.

> > > How does bitbake push in the ./configure command line options?
> > 
> > Bitbake knows nothing about this, it just knows about a list of tasks.
> > autotools.bbclass defines a do_configure task which knows how to pass
> > options set in an EXTRA_OECONF variable to a configure commandline. The
> > classes are a powerful abstraction feature but are part of OE, not
> > bitbake.
> 
> How is autotools.bbclass identified to be parsed?

See above.

> What triggers do_configure to be executed and when?

Read base.bbclass. It sets up a number of tasks and a default task,
"build". You'd add configure after patch, before compile. compile would
be before build. "bitbake somefile" would cause the default task (and
its dependent tasks) to be executed. You could also do "bitbake somefile
-c configure" to specifically execute the configure task.

> What do I need to hack if I want to change the way or when they are
> called?
> There has to be some initial entry points for the classes.

An assumed inherit base, then inheriting other classes like autotools
which can change things. The order of the inherits matters.

> Are there a set of pre-defined class functions that will be called or
> does some bb file reference the class member functions?  (I haven't found
> them referenced in the bb files I looked at, and it makes me think there
> is some meta knowledge in the bitbake code that expects to call things
> like do_configure, or do_patch, or do_build, but I'm having a hard time
> finding them.
> 
> basically I'm trying to understand the glue that holds everything
> together.  I'm staring to feel dangerous at hacking the OK bb tasks but
> I'm still lost on the classes.

Hopefully I've covered this above.

> Dependency trees, configuration tweaking, the export of a minimal tree
> of bbfiles for a specific build, a build browsing tool for exploring the
> OE dependency cloud, for providers-bb files, classes and config files.

You might fine bitbake -g interesting, particularly in trunk. It will
dump a number of dependency graph files.

bitbake -DDD (enabling a ton of debugging) will also show you which
files it touches and why.

> Its taken me a long time figure out all the OE files that effect the
> build of my image.  It be nice to make things easier for folks that come
> after me to do the same type of thing....

Help with the documentation is more than welcome!

Cheers,

Richard




