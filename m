Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1LeR1K-0002AI-S0
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 10:34:40 +0100
Received: (qmail 5366 invoked from network); 3 Mar 2009 10:30:38 +0100
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 3 Mar 2009 10:30:38 +0100
Received: (qmail 2770 invoked by uid 9804); 3 Mar 2009 10:30:37 +0100
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 3 Mar 2009 10:30:31 +0100
Received: (qmail 2738 invoked by uid 9804); 3 Mar 2009 10:30:31 +0100
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 3 Mar 2009 10:30:31 +0100
Received: (qmail 5322 invoked from network); 3 Mar 2009 10:30:31 +0100
Received: from omsk.mi.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	3 Mar 2009 09:30:31 -0000
Received: from heinold by omsk.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1LeQxK-0004cZ-N3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 10:30:30 +0100
Date: Tue, 3 Mar 2009 10:30:30 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090303093030.GA17676@mi.fu-berlin.de>
References: <49AB1EB0.5090002@kernelconcepts.de>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[2741](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <49AB1EB0.5090002@kernelconcepts.de>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: Dependency tracking - or - how to get rid of kexec-tools
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
X-List-Received-Date: Tue, 03 Mar 2009 09:34:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2009 at 12:48:00AM +0100, Nils Faerber wrote:
> Hi!
> I just found a little bit of a problem and am now looking for the most
> correct solution to it...
> I am trying to build x11-image for a mipsel target. I am using the
> dev-head and angstrom-2009 or DISTRO_VERSION = "2009.X-test-20090301"
> respectively.
> The problem is that this constellation includes kexec-tools-static for
> something just that kexec-tools-1.101 does not support mipsel.
> As far as I have seen it I will not make use of kexec-tools later on. I
> just want to build a quite simple X11 image for that device.
> 
> So I can do two things:
> 1. Get rid of the dependency so that it will not be built. How can I
> find out which dependency pulls in kexec-tools?
> 

run bitbake -g which gives you 2 files which shows the deps, but
sometimes it doesnt really show why a package was included.

> 2. Upgrade kexec-tools to the version that is e.g. in Debian, like
> kexec-tools_20080324.orig.tar.gz which now include mipsel support.
> 
> So, what to do now?
> Even if 2. would be the best way to go I would still be interested how
> one can trace this kind of dependency - sometimes I would be really
> interested why certain packages are built.
> 
> 
> PS: I am planning on submitting this mipsel machine support. What would
> be the best way? Create a diff against dev-head and post here?
> 

Please post the patch here for review.

> Cheers
>   nils faerber

Bye Henning


