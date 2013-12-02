Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62E256D87A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 15:56:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MX600D5YS9U2EWR@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	02 Dec 2013 09:56:23 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D6A2620094; Mon,
	02 Dec 2013 10:56:16 -0500 (EST)
Date: Mon, 02 Dec 2013 10:56:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20131202155616.GA17528@denix.org>
References: <529C78D0.8030902@pelagicore.com>
MIME-version: 1.0
In-reply-to: <529C78D0.8030902@pelagicore.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH 0/2] Add nativesdk tools for Qt5 SDK
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
X-List-Received-Date: Mon, 02 Dec 2013 15:56:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Sorry for top-posting, but I wanted to reply in general and couldn't find the 
right place for inlining...

Anyway, the below assumptions aren't exactly correct. And the main one being - 
you don't really need to source the environment-setup script. But you'd need a 
different and much simpler qt.conf, which I populate as part of the 
meta-toolchain recipe (still pending submission though). And you can use 
relative paths in that generated qt.conf so qmake can be used w/o sourcing the 
environment-setup script. But even with absolute paths those will be fixed 
automatically by the SDK setup script at the install time...

The thing is, you cannot re-use the same qt.conf that you generate for the 
nativesdk tools, because that one is for cross-compiling for SDK. Like you 
mentioned, it cross-compiles the tools for SDK_MACHINE, which is different 
from target MACHINE as well as the build host. When the tools are used, you 
need a different qt.conf with a makespec to run on SDK_MACHINE and build for 
target MACHINE.

Also, I wanted the things to be as simple as possible, so I decided to re-use 
linux-oe-g++ makespec, as it is already there and we've been using it 
successfully for a long time with Qt4. The only thing is, existing 
linux-oe-g++ relies on the OE-specific variables, because that was the way OE 
SDK always worked.

-- 
Denys


On Mon, Dec 02, 2013 at 01:10:56PM +0100, Dominik Holland wrote:
> Hi all,
> 
> i'm the author of the merge-request on github.
> 
> The patchset from Denys looks nice. Especially because it cross
> compiles the host tools for the SDK_MACHINE which i forgot todo in
> my patchset.
> 
> I think the best way would be a combined version of both patchsets.
> 
> Because some of you think my patchset is too complicated i want to
> highlight why i added the complicated creation of the qt.conf and
> the additional patching of the mkspec files etc.
> 
> I didn't tested Denys version but i think it only works if you
> source the environment scripts of the SDK before.
> 
> As a Qt developer it's the defacto standard to get a SDK which works
> out of the box for your projects by just invoking qmake and no need
> to source a script before which changes your environment.
> 
> To get this done you need to patch the mkspec folder and the qt.conf
> to use relative paths instead the hardcoded paths which where
> created during the yocto build.
> 
> In addition i created a linux-oe-sdk-g++ which contains the real
> values of the environment variables but without --sysroot. This will
> be set by qt itself by using the CROSS_COMPILE prefix.
> 
> 
> I hope you understand that this is really needed if you want to get
> a good qt5 integration into a OE SDK.
> 
> Best Reagrds
> 
>  Dominik
> 
> P.S. If you want to use the qmake inside qtcreator you would need to
> set all the env variable of the environment script inside qtcreator
> which is really inconvenient
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

