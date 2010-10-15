Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6m2y-00082S-2L
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:18:18 +0200
Received: by wyb40 with SMTP id 40so815226wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=aATteedeLvymz+0t1uNDVoHfxUA+1nXyHfo70x56PTM=;
	b=ub9w1F5l/4ZHFHWObG9XgaS1RNA80zxHtEkO7p86ikXSRMb5dOsDCRVR8pk3gBj/wI
	NekooTzeEhUAEpEaEWH6JPfPYcCQd6kGSXIrm0SOk01sUrRxE01VTuwQfg19EoS6GgyW
	xocllBzQDOkIJYgWMqOT4VBnShxbDblfZ07PY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=rPxZvk3gIsPyyXx1vIQkctf/lk/3I9lTUV49Ej8E8EVn+NZoXTrvvAw1lYsy23yPqp
	LiJam+ODuQ+e3A8ZqSdwCkrg5lKkm37LAjdvalrPQtH8orQ3CHEuaV+MAaJ4FC+3pvJ3
	mhXEORLFLSXK9XYhlar3xc0Htq7ZSt+gXFAks=
Received: by 10.227.156.67 with SMTP id v3mr1094324wbw.147.1287155858578; Fri,
	15 Oct 2010 08:17:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 08:17:17 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFAB98@dlee06.ent.ti.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAB98@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 08:17:17 -0700
X-Google-Sender-Auth: BR0aYq_tcZzId93rjjXn0pch39I
Message-ID: <AANLkTi=dRxQmDwP9G8mgKHeHgrypb36Teowen5NV+Yi3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 15:18:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 15, 2010 at 7:12 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

> > diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
> > index 8259127..b4a2fa6 100644
> > --- a/conf/machine/kixrp435.conf
> > +++ b/conf/machine/kixrp435.conf
> > @@ -7,7 +7,7 @@ TARGET_ARCH = "arm"
> >  # Note: armv4 armv4t armv5te will be added by tune-xscale.inc
> > automatically.
> >  PACKAGE_EXTRA_ARCHS = "armv5e ixp4xxle"
> >
> > -OVERRIDES =
> >
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build
> > -${BUILD_OS}:fail-fast:pn-${PN}"
> > +MACHINE_OVERRIDES += "nslu2 ixp4xx"
>
> Should this be "ixp4xx nslu2"?  At least in order to keep the original
> behavior?


Yes, good catch, thanks, I'll fix it in the next version of the patch.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

