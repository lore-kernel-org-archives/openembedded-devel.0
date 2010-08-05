Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OgxYP-0000E4-4m
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 12:20:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o75AJson028346;
	Thu, 5 Aug 2010 11:19:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22390-06; Thu,  5 Aug 2010 11:19:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o75AJiru028322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Aug 2010 11:19:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
In-Reply-To: <1278323612.30247.3579.camel@rex>
References: <1278323612.30247.3579.camel@rex>
Date: Thu, 05 Aug 2010 11:19:27 +0100
Message-ID: <1281003567.16235.254.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] RFC: How to improve packaged-staging and setscene
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2010 10:20:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-05 at 10:53 +0100, Richard Purdie wrote:
> There are still some things bothering me about packaged-staging. As
> anyone who's looked into what it does behind the scenes will agree, its
> hard to follow what it does and the paths are insane.
> 
> Why? The simple reason is that its trying to capture the output from all
> the tasks in one step. The tricks it plays with the stamp files are also
> evil.

The code in my original proposal made my eyes and head hurt but the
underlying general principle was good. I've iterated over this several
times over the past few months and have something worth
sharing/discussing now.

First I'll skip to the punchline and show how to convert a task like
do_package_write_ipk to this new style task based staging. You need to:

a) Stage files in some directory in WORKDIR
b) As implied by a), split out usage of the final destination, in this
case DEPLOY_DIR_IPK
c) Add some code to handling the staging/packaging of the files

For package_write_ipk, this looks like:


SSTATETASKS += "do_package_write_ipk"
do_package_write_ipk[sstate-name] = "deploy-ipk"
do_package_write_ipk[sstate-inputdirs] = "${PKGWRITEDIRIPK}"
do_package_write_ipk[sstate-outputdirs] = "${DEPLOY_DIR_IPK}"

python do_package_write_ipk_setscene () {
	sstate_setscene(d)
}
addtask do_package_write_ipk_setscene


which is hopefully concise and clear. Behind the scenes is
packaged-staging2.bbclass which has some similarities to its predecessor
but is pretty much a rewrite learning from the mistakes made there.

The minor changes to bitbake this relies upon are:

a) Dedicated prefuncs and postfuncs hooks. These are flags against tasks
which list functions to run before and after the main body of a task
completes. Yes, we could use _prepend and _append but that assumes you
know a given function is python/shell and is fundamentally ugly. I
wanted a generic mechanism which would just work.

b) Added a BB_CURRENTTASK variable which has the name of the currently
running task in it. This means we can allow functions to be shared
between tasks.

I don't think there should be anything to controversial in adding that
functionality. 

The big major change to bitbake this code needs is the setscene task
handling. The idea behind this is simple. bitbake works out what tasks
its going to execute, e.g. foo:do_package_write_ipk and
bar:do_populate_sysroot as normal. It then looks for any of these task
names with "_setscene" on the end. For any of these that exist, for
example, foo:do_package_write_ipk_setscene and
bar:do_populate_sysroot_setscene, each is run and returns a
success/failure. If it returns success bitbake takes this to mean the
task has been "accelerated" and it does not need to run the non setscene
variant. It also means any dependencies that task had can be ignored.

So for example you're building an image and all the
do_package_write_ipk_setscene tasks return success, it will just skip to
building the image from those ipk files.

I have a patch to bitbake to implement this. It works as described and I
was able to reuse large amounts of code. I already merged most of the
refactoring into master as it made sense in its own right.

The big drawback with the current patch is the feedback to the user is
totally screwed up as it stands. We don't care about errors in setscene
functions for example yet bitbake will shows these in the way it would
for a normal build. This can be fixed with some time spent on the code.
At the moment I want to see whether people like the direction.

I should also talk about what packaged-staging2.bbclass does behind the
scenes and how it differs from packaged-staging.

The "sstate" name refers to the idea of "shared state" which is what
"staging" effectively is.

Each task has a data structure associated with it which details what
files it installs and where it expects these to go. This structure is
built from  the sstate-name, sstate-inputdirs and sstate-outputdirs
variables. A task can write multiple directories but sstate-inputdirs
and sstate-outputdirs should obviously have the same number of elements.
The class behind the scenes builds its own structure for this data as
using the flags fields directly looked prone to error. sstate_init(),
sstate_add() and sstate_state_fromvars() are all to do with handling the
data structures.

sstate_install() copies data from workdir to the staging are and handled
"package management". In this version I've thrown away any notion of
using a package manager as it doesn't fit our usecase. Instead we just
create a list of files/directories we install for a given recipe.

sstate_installpkg() finds any staging package and then decompresses it,
handles path relocations and then calls the installer above

sstate_clean() removes a set of files in the manifest from staging

sstate_package() builds a staging package

We wrap the task with a pre and post hook to handle first cleaning
staging, then building a staging package from the output of the task.

The other major difference compared to packaged-staging.bbclass is we
never need to mess with stamp files at all thanks to the setscene task.

To me, these changes deal with all the things I've disliked about
packaged-staging and this is a vast improvement on what we have today.
Its not 100% there yet but I think all the hard bits have a solution.
Discussion welcome!

Finally, links to the code:

The packaged-staging2.bbclass and sstate code:
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/scenequeue&id=7af6c4f02e2641b49547093632b206fe496b6f8a

Example changes to package_ipk.bbclass to enable this:
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/scenequeue&id=87822f22ecddfc5a0d351b168394ac1d4a5c6fd3

The major bitbake setscene change:
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/scenequeue&id=30c8e3dadfa7619398cdc6a56ca677a637addb0e

Minor bitbake tweaks:
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/scenequeue&id=7c8004c56a06fa0ae7bf2c27b37e918df4bbf717
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/scenequeue&id=0f516fe9a043276c670622895c4760ff6468f293

These links should continue to work although its likely further updates
will appear on that branch as I'm actively working on refining this.

Cheers,

Richard




