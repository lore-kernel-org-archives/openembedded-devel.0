Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mdx1s-0006YM-C7
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 04:05:28 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CCDFA1B10C09;
	Thu, 20 Aug 2009 01:52:06 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
Date: Thu, 20 Aug 2009 03:43:28 +0200
MIME-Version: 1.0
Message-Id: <200908200343.29071.holger+oe@freyther.de>
Subject: Re: [Gumstix-users] Problem passing environment variables
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
X-List-Received-Date: Thu, 20 Aug 2009 02:05:28 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 19 August 2009 11:51:11 Stuart Gray wrote:
> Hi,
>
> Here is what I had tried within the recipe to export:
>
> do_configure_prepend () {
>         export WORKING_DIR=~/overo-oe/SA/trunk
>         export JSONHOME=$WORKING_DIR/JSON
>         export
> QTSTATE_DIR=$WORKING_DIR/build_dependencies/qtstatemachine-1.1-opensource
> }
>
> My qmake files are as follows:
>
> within my user.collections/recipes/dockamp/files I have the follwoing:
>
>
> TEMPLATE =subdirs
> COMFIG   +=ordered
> SUBDIRS  = \
>     ~/overo-oe/SA/trunk/JSON/trunk \
>     ~/overo-oe/SA/trunk/dockamp
>
> This is the first place where I would like to use the environment
> variables.
>
> Then within the ~/overo-oe/SA/trunk/dockamp/dockamp I have another
> dockamp.pro file
>
> TEMPLATE = app
> TARGET = dockamp
>
> include( $${WORKING_DIR}/settings.pri )
> include( $${WORKING_DIR}/util/util.pri )
> include( $${QTSTATE_DIR}/src/qtstatemachine.pri )
>
> DEPENDPATH += \
>     . \
>     $$(WORKING_DIR)
>
> INCLUDEPATH += \
>     . \
>     $$(WORKING_DIR)
>
>
> When qmake gets to compiling my cpp files it fails as it cannot find the
> .hpp file which is included, util.pri.
>
> Previously I had hard coded the paths and it was compiling, but now it
> fails no matter what I do. We had tried to add a do_compile as follows:
>
> do_configure() {
>     oenote Running our qmake work dir is $WORKING_DIR
>     WORKING_DIR=${WORKING_DIR} JSONHOME=${JSONHOME}
> QTSTATE_DIR=${QTSTATE_DIR} qmake2
> ~/overo-oe/user.collection/recipes/dockamp/files/dockamp.pro
>     oenote Finished our qmake
> }
>
> But again we get the same result of .hpp files not found.
>
> If the call to qmake2 can be made to pass the varaiable could you please
> show the complete example. I am new to Linux and OE and it gets confusing
> pretty quickly.

I have no real answer just some hints regarding qmake. include() can fail and 
there will be no error printed, variables are always a bit messy and I can't 
remember if $(FOO) $$FOO, $$[FOO] or $FOO should be used.

My two hints for debugging this are:
	- Use strace -f and run the "run.do_configure.OLD_PID" script by hand and see 
which files qmake tries to open.
	- Use "message" inside the pro files and see what gets printed when you run 
the above run.do_configure script from $WORKDIR/temp/.



your approach to change do_configure_prepend should work, you could skip that 
by using: export WORKING_DIR = "some/dir" inside the bb file... this should 
export variables too.

	z.


