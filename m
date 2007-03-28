Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HWfnC-0007qU-G8
	for openembedded-devel@openembedded.org; Wed, 28 Mar 2007 23:34:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2SLYpOu018066;
	Wed, 28 Mar 2007 22:34:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17793-02-7; Wed, 28 Mar 2007 22:34:48 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2SLY0kS017860
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 28 Mar 2007 22:34:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Tim Bird <tim.bird@am.sony.com>
In-Reply-To: <460ACBB8.8070501@am.sony.com>
References: <20070320033120.GA8678@thegnar.org>
	<1174574086.5949.32.camel@localhost.localdomain>
	<20070323043126.GA893@thegnar.org>
	<1174641616.5813.9.camel@localhost.localdomain>
	<460AABD1.4080409@am.sony.com>
	<1175109319.5829.30.camel@localhost.localdomain>
	<460ACBB8.8070501@am.sony.com>
Date: Wed, 28 Mar 2007 22:34:01 +0100
Message-Id: <1175117641.5829.77.camel@localhost.localdomain>
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
X-List-Received-Date: Wed, 28 Mar 2007 21:34:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-03-28 at 13:10 -0700, Tim Bird wrote:
> Richard Purdie wrote:
> >> addtask build after do_populate_staging
> >> do_build = ""
> >> do_build[func] = "1"
> > 
> > These are very much related, it defines that there is a build task (with
> > an associated function which defaults to empty). It says this build task
> > depends on a "populate_staging" task.
> 
> So this is similar to:
> 
> build: do_populate_staging
> 
> in a makefile.

Yes.

> >> Maybe I'm thinking procedurally, and this is all declarative, but where
> >> the heck are the actual statements executed during a "build"?
> > 
> > Nothing is executed by "build" itself, the key is in the dependency on
> > "populate_staging".
> > 
> In this case, since build has no actual
> commands associated with it, it is like a PHONY target in
> a makefile?

Yes.

> From base.bbclass, if I grep addtask, I see:
> addtask showdata
> addtask listtasks
> addtask clean
> addtask rebuild
> addtask mrproper
> addtask fetch
> addtask fetchall after do_fetch
> addtask unpack after do_fetch
> addtask configure after do_unpack do_patch
> addtask compile after do_configure
> addtask populate_staging after do_package_write
> addtask install after do_compile
> addtask build after do_populate_staging
> 
> So there appear to be "island" tasks (e.g.showdata, clean),
> that are not part of the main sequence for a build.  I presume these
> are accessible via the command line in bitbake?

Yes, e.g. "bitbake something -c listtasks".

> I don't see an addtask for "patch" in there.  Is this added
> to the dependency tree somewhere else?  Is this something
> that is package-specific?

base.bbclass has "inherit patch" and you'll find addtask patch in
patch.bbclass. The patch functionality became big enough to warrant its
own file. Its unconditionally included in the build.

> Also, there appear to be multiple parallel
> dependencies (fetchall and unpack are both after fetch).
> How are these ordered?  (What is "fetchall" anyway?)

fetchall is an independent task which fetches all sources for all
dependent packages as well as the sources for the package itself (e.g.
"bitbake busybox -c fetchall" would fetch busybox's sources but also
glibc amongst other things). It was one possible proposal for fetching
sources for subsequent offline use. Dependency wise, bitbake will make
sure fetch has run before fetchall runs.

> Tasks package and package_write are also referenced but not "addtask"ed
> to the graph.

This is because you have to specifically enable packaging by inheriting
package_ipk or package_deb or some combination of packaging classes.
This is normally done as part of the distribution configuration and the
addtasks appear in package.bbclass.

> > Incidentally, don't be put off by the "do_" prefix, this is just to
> > highlight things as tasks when their usage might otherwise be
> > ambiguous.
> 
> Is "do_" ignored in task declarations, references, or both?

Its present in task declarations and some references when its unclear
what you'd be referring to is the best summary I can give. Anything
passed to a -c option on the bitbake commandline is obviously a task
name for example, with a function definition, its not obvious so its
prefixed. I suspect there are some exceptions to the above syntax
summary but they existed before I worked with things and I don't know
the historical reasons.

> I assume that .bb files can arbitrarily define some new
> task and graft it into the dependency tree.

Correct, and some packages do this.

> In your experience, are there many other custom (package-specific)
> tasks like this?

glibc has the infamous "do_munge" which adds in the glibc ports tree.
There are also class related tasks like do_rootfs for generating images.
do_deploy is a convention for placing output of things like kernel
builds or bootloaders into tmp/deploy/whereever.

> Here is my idea of what each task does:
> Can you please check this?
> 
> build - meta-task to cover the whole build process
> populate_staging - (same as do_stage?) - put package contents in staging area?

Yes, there used to be two confusing staging functions, do_stage and
do_populate_staging. do_stage was removed.

> install - place files (e.g. built binaries) at install locations

Yes, as a prelude for splitting them for packaging in "package" below.

> package - collect files files from install locations into some kind of collection (dependent on package format)

Splits the into separate directories ready for packaging.

> package_write - ??

Actually writes the files into the specified package formats.

> compile - make
> configure - run configure
> patch - apply patches to source
> unpack - unpack tarballs
> fetch - grab sources from Internet - turn into tarballs

deploy - put some kind of output into tmp/deploy (kernel, bootloader)
rootfs - create an image
devshell - drop to a shell within the work directory (interactive, see 
		recent email discussion, need to inherit devshell)
listtasks - lists the available tasks for a target
clean - Delete the workdir and stamps (does not depopulate staging atm)
rebuild - "clean", then "build"
fetchall - fetch all sources + dependent sources


Cheers,

Richard





