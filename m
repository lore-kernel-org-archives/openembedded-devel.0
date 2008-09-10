Received: from [209.253.16.30] (helo=barracuda.pager.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mdarland@pager.net>) id 1KdSRu-0001xj-Ku
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Sep 2008 18:21:47 +0200
X-ASG-Debug-ID: 1221063534-5bf8000d0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 72831102E34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2008 11:18:54 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id T6AwVa8xMT6bmxOC for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2008 11:18:54 -0500 (CDT)
Received: from laptop-brad.longragesystems.local ([192.168.1.44]) by
	mail.pager.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 10 Sep 2008 11:19:24 -0500
From: Matt Darland <mdarland@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] libusb and libusb-compat: conflict
Date: Wed, 10 Sep 2008 11:18:55 -0500
User-Agent: KMail/1.9.9
References: <48C72166.7030000@dls.net> <ga81it$e8i$1@ger.gmane.org>
	<48C7CA95.2040708@dls.net>
In-Reply-To: <48C7CA95.2040708@dls.net>
MIME-Version: 1.0
Message-Id: <200809101118.55264.mdarland@pager.net>
X-OriginalArrivalTime: 10 Sep 2008 16:19:24.0578 (UTC)
	FILETIME=[FD648020:01C91360]
X-TM-AS-Product-Ver: SMEX-7.0.0.1607-5.5.1027-16148.004
X-TM-AS-Result: No--24.134200-4.000000-31
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1221063534
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=3.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.1.5195
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: Re: libusb and libusb-compat: conflict
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
X-List-Received-Date: Wed, 10 Sep 2008 16:21:47 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

FYI, libusb1 is broken on 2.6.26 kernels. If it tries to use sysfs, then it 
will expect every USB device to have a 'descriptors' file in sysfs, but that 
isn't necessarily the case in recent kernels.

http://sourceforge.net/mailarchive/message.php?msg_name=20080731112725.55310%40gmx.net


On Wednesday 10 September 2008 08:24:37 am Mike (mwester) wrote:
> Koen Kooi wrote:
> ...
>
> > Some background: libusb1 is the rewrite of libusb which brings up
> > goodness as better performance and more powersaving, but its ABI is
> > incompatible with libusb. That is why the libusb people create
> > libusb-compat, it's a drop-in replacement for libusb.
> >
> > When I added it to OE I made sure the runtime situation worked and
> > changed all packages to libusb-compat. It seems I missed a few.
>
> Grep comes up with a bunch, but probably a lot of those are just older
> recipes -- dfu-util and openocd are definitely broken, though.
>
> > It should be safe to change everything over to libusb-compat, unless
> > your favourite apps abuses private libusb API (as gnuradio does).
>
> I encountered simple linker failures (symbols not found).  I'll get rid
> of libusb out of staging entirely and see if dfu-util and openocd will
> link correctly against libusb-compat.  I can test dfu-util, but I hope
> someone else can test openocd.
>
> > And there's no such thing as CONFLICTS in OE, only RCONFLICTS.
>
> Bummer.  That would mean that we would need to switch to
> "virtual/libusb" I guess.  That seems a lot of effort for something
> that's obsolete -- it might be better to warn people if libusb is being
> built instead of libusb-compat.  I wonder if this might be a use case
> for a "WARNING" metadata item in a bitbake recipe.
>
> I will do nothing with any metadata then except attempt to build
> dfu-util and openocd with libusb-compat.
>
> > regards,
> >
> > Koen
>
> Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




