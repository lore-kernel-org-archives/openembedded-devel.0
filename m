Received: from [160.45.40.10] (helo=math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1I8EIP-0001UF-VG
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 13:54:21 +0200
Received: (qmail 28765 invoked from network); 10 Jul 2007 13:48:41 +0200
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 10 Jul 2007 13:48:41 +0200
Received: (qmail 29131 invoked by uid 9804); 10 Jul 2007 13:48:41 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 10 Jul 2007 13:48:41 +0200
Received: (qmail 29122 invoked by uid 9804); 10 Jul 2007 13:48:40 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 10 Jul 2007 13:48:40 +0200
Received: (qmail 28759 invoked from network); 10 Jul 2007 13:48:40 +0200
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with SMTP; 10 Jul 2007 11:48:40 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 3.36 #1
	(Debian)) id 1I8ECu-0004Ln-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2007 13:48:40 +0200
Date: Tue, 10 Jul 2007 13:48:40 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070710114840.GA16604@mi.fu-berlin.de>
References: <200707091724.32860.torsten.sadowski@tu-berlin.de>
	<20070710091946.GA14041@mi.fu-berlin.de>
X-Envelope-Sender: heinold@inf.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L40+ClamAV[29125](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
Mime-Version: 1.0
In-Reply-To: <20070710091946.GA14041@mi.fu-berlin.de>
User-Agent: Mutt/1.5.9i
Subject: Re: Conflicting qte patches for Simpad
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
X-List-Received-Date: Tue, 10 Jul 2007 11:54:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2007 at 11:19:46AM +0200, Henning Heinold wrote:
> On Mon, Jul 09, 2007 at 05:24:32PM +0200, Torsten Sadowski wrote:
> > Hi,
> > 
> > after some time I tried to build a Simpad opie-image again (from the devel 
> > branch) but I encountered conflicting patches for libqte (normal, static and 
> > mt).
> > 
> > It seems, that 
> > QWSTtyKeyboardHandler::QWSTtyKeyboardHandler
> > moved to:
> > kernelkeyboard.cpp
> > 
> > which is not accounted for in the devfs.patch.
> > 
> > Cheers, Torsten
> > 
> 
> Because linux 2.4 is unmaintained and linux 2.6 is the future devfs.patch is gone.
> 
> Please do mtn pull and mtn up.
> 
> Bye Henning

Sorry,

I am wrong, I thougt Mr. psokolovsky delete it with his last commit for
qte-common_2.3.10.inc. So please delete the line
SRC_URI_append_simpad       = "file://devfs.patch;patch=1 " alone
and try again.

Bye Henning
-- 
IBM Certified Specialist - eserver i5 iSeries Technical Solutions Designer V5R3


