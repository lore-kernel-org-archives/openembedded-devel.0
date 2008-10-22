Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1KsZ77-0006YI-UZ
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 10:30:45 +0200
Received: (qmail 23420 invoked from network); 22 Oct 2008 10:30:19 +0200
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 22 Oct 2008 10:30:19 +0200
Received: (qmail 5077 invoked by uid 9804); 22 Oct 2008 10:30:19 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 22 Oct 2008 10:30:07 +0200
Received: (qmail 5012 invoked by uid 9804); 22 Oct 2008 10:30:07 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 22 Oct 2008 10:30:07 +0200
Received: (qmail 23364 invoked from network); 22 Oct 2008 10:30:06 +0200
Received: from omsk.mi.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	22 Oct 2008 08:30:06 -0000
Received: from heinold by omsk.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1KsZ6U-00067e-IP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 10:30:06 +0200
Date: Wed, 22 Oct 2008 10:30:06 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081022083006.GA23378@mi.fu-berlin.de>
References: <5c5e5c350810140623t33258c83i6f945b8212b44eb6@mail.gmail.com>
	<5c5e5c350810220026o1adcbd70vad18af00ada90793@mail.gmail.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[5015](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <5c5e5c350810220026o1adcbd70vad18af00ada90793@mail.gmail.com>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: ctorrent recipes, a mistake of mine in the bugtracker and problems with autotools versions
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
X-List-Received-Date: Wed, 22 Oct 2008 08:30:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 22, 2008 at 09:26:35AM +0200, Elena of Valhalla wrote:
> === PROBLEM 4 (help required) ===
> 
> The next problem seems to be related to the autotools version:
> ctorrent dies in the do_configure task with the error:
> 
> aclocal.m4:14: error: this file was generated for autoconf dnh3.3.1.
> You have another version of autoconf.  If you want to use that,
> you should regenerate the build system entirely.
> 
> (full log attached - note that the same error happens also without icecc)

Hm,

normaly aclocal.m4 is overwritten by autoreconf. I do not know why it
yields here. So I would test to remove aclocal.m4 and try the build
again. There are serval recipes which you can looking how to do this
e.g.
http://gitweb.openembedded.net/?p=openembedded.git;a=blob;f=packages/libsdl/libsdl-image_1.2.6.bb;h=b458e19dbaf4b65866355609b82ab529a2d5eac7;hb=HEAD
> 
> 
> -- 
> Elena of Valhalla
> 
> homepage: http://www.trueelena.org
> email: elena.valhalla@gmail.com

Bye Henning


