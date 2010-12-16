Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PTG69-0004Va-0r
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 16:50:31 +0100
Received: by pwi8 with SMTP id 8so467079pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=UNjV08eQ3n59rYdp2lAY65YXFxMzsXZu3vwjlJMoJeI=;
	b=dVZSYv/JtwsOsaapOzKfaV8oU+PU0OOGDCIyuPggGAHk1UGhPWYAK6WRotct6hwTQd
	cgRkjKnm/wizVuo65ZcLke4V+6hwKu/7HmYsCCBeA6r8oBIgQvw9Dw+GnLSXu91ll/Z/
	BNkitGecev8PpPgmdsIrn2wYdsbXlsMimpcr8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=eIVhaekhOdJjUPwIjofylCYfX+TDOxBed1/EpT7qbyBUrNAuB7uAc0xZX4k4vZzjjR
	F/NoBtet21p1rvEfA50X7jNF7VNx0HrtEdj7FP/gsO3CNED1P5rL9uihrFgbtR7gIH78
	HB2MishzL2e8kF+yDJQ1Wb8QznmHx/MKqdZy4=
Received: by 10.142.12.1 with SMTP id 1mr1049662wfl.246.1292514528445;
	Thu, 16 Dec 2010 07:48:48 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm231072wfh.0.2010.12.16.07.48.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 07:48:47 -0800 (PST)
Date: Thu, 16 Dec 2010 07:48:54 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216154854.GB22134@gmail.com>
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>
	<AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-12-10
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
X-List-Received-Date: Thu, 16 Dec 2010 15:50:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/12/10 08:55), Cliff Brake wrote:
> beagleboard beagleboard-linuxtag2010-demo-image is failing with:
> 
> http://tinderbox.openembedded.net/packages/1321155/
> 
> ti-c6accel
> 
> Linking c6accel_app from appMain.o c6accel_testfxns.o
> ../c6accelw/lib/c6accelw_omap3530.a470MV
> c6accel_app_config/linker.cmd..
> /lib/libgcc_s.so.1: file not recognized: File format not recognized


Have you tried with latest .dev ? It might work with latest .dev
I have fixed libgcc install locations

> 
> Thanks,
> Cliff
> 
> 
> On Fri, Dec 10, 2010 at 11:05 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> > Hello,
> >
> > We are resuming our weekly testing now that the 2010.12 release is
> > finished.  The testing-next branch has been synced with the master,
> > and is ready for builds.  Please update:
> >
> > http://wiki.openembedded.org/index.php/Testing
> >
> > with results.
> >
> > Please do not push to the testing-next branch.
> >
> > Thanks,
> > Cliff
> >
> > --
> > =================
> > http://bec-systems.com
> >
> 
> 
> 
> -- 
> =================
> http://bec-systems.com
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


