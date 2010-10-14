Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6PpN-0001HQ-Lz
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 17:34:46 +0200
Received: by fxm6 with SMTP id 6so1494318fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 08:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=C42vZk6XIZ5qlEhY0n/yMpUbyT5t0Ljq2d6Sa/NTSJs=;
	b=Vby42i9PkxJ4tI6EG7JsT3KIIR4nFCoDdlaJ8tM0OcGQ4IwK6mWSl42qI9mXfbR5Zw
	Y8BDCdQsjjATi76ZOCY4r7Jyb13sNMQdc0y/ClHPDmI57owcOj3wOi2a+dPjbIjV/FID
	6adGiK/2zbPv3Gx6NJI7mcPWbPRoqO0sRi52o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=c3otPK0ZC/0w2tPDp8Ec5KQB4djd4MesqVfVNoKOjrbWrOO3mX3e47cXE/GYgDO5c+
	meqeri6CB087wcMtwdEOJ0dWnLBDc+ksjEAIKrHS4EfsxuBtY4fxnsVeTPRfphMo49ZF
	P60PdJya/a8XBcDSqRddg/0aVxq5fUuVIFQRA=
Received: by 10.216.23.199 with SMTP id v49mr163029wev.43.1287070455859; Thu,
	14 Oct 2010 08:34:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 08:33:54 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFA982@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA982@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 08:33:54 -0700
X-Google-Sender-Auth: RK_QCJehciK8x4mJ7Qlec2zMDBg
Message-ID: <AANLkTimRwRDxmvDrPktrK=xjfrmRada_iWRuXH6tqa4o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 15:34:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 8:29 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

> So are you saying that we are just going to change the order of how
> OVERRIDES is appended to in OE like Denys was suggesting?  That would still
> lead to issues like local not being the highest priority unless we would
> also change bitbake.conf to define OVERRIDES as
> "${TARGET_ARCH}:${TARGET_OS}:${MACHINE}:local".  That way we could prepend
> OVERRIDES in OE and still have local be the last one evaluated.
>

No.  What I'm saying is, the definition of OVERRIDES in bitbake.conf will be
reversed.  Not that difficult to understand.  I don't know how I could
possibly be any clearer here.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

