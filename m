Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1NF1k3-0006Kc-4Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 09:36:22 +0100
Received: (qmail 8474 invoked from network); 30 Nov 2009 09:32:46 +0100
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 30 Nov 2009 09:32:46 +0100
Received: (qmail 24230 invoked by uid 9804); 30 Nov 2009 09:32:46 +0100
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 30 Nov 2009 09:32:39 +0100
Received: (qmail 24220 invoked by uid 9804); 30 Nov 2009 09:32:39 +0100
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 30 Nov 2009 09:32:39 +0100
Received: (qmail 8461 invoked from network); 30 Nov 2009 09:32:39 +0100
Received: from omsk.imp.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with SMTP; 30 Nov 2009 08:32:39 -0000
Received: from heinold by omsk.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1NF1gV-0001xC-7T
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 09:32:39 +0100
Date: Mon, 30 Nov 2009 09:32:39 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091130083239.GA7413@mi.fu-berlin.de>
References: <1259546542-24318-1-git-send-email-stephen@quaddro.net>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[24223](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <1259546542-24318-1-git-send-email-stephen@quaddro.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libdvb 0.5.5.1: Fix build on GCC 4.x
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
X-List-Received-Date: Mon, 30 Nov 2009 08:36:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 29, 2009 at 09:02:22PM -0500, Stephen Simpson wrote:
> Patches:
> * sample_progs/cam_menu.hh was missing #include <cstring>, does not error on gcc < 4.x
> * dvb-mpegtools/Makefile did not pass LDFLAGS when necessary for linking, causing QA Issues
> Recipe changes:
> * Change recipe to remove CFLAGS from config.mk to allow the CFLAGS variable passed to be used instead
> * Add patches to recipe
> ---


As told on irc I will test and check it in this evening with an oe conform commit-msg.

Bye and Thanks

Henning


