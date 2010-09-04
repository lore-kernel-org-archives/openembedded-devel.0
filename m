Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OrxET-00059E-Ur
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 20:13:14 +0200
Received: by wwi14 with SMTP id 14so1962055wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=noUELrLSCCWOebeJLY7MCIrL3Vi/0OUhVhNDU2Wo84Q=;
	b=I8w5rEdYFPhyut9asKqZRGukP1n3wXHKgV/kqeO1lQNiMB0K6H2an86crepZcuOKcs
	pRzypLyesxDQ1EQ+X11qc+z5k5pLqRs7LKopLcWjP4vWkwHIE5OLrtmFUfLM3xez89ns
	q6YZEZ5Cks4hJE7LvnFjyYJVjES4ZbctXcx4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=H46n05s0e2YmJjJRPRuTlXUDR1B/+SZaLLrjuRfrxFtu3vIYTB2PrAW0CiVCBE4oaO
	lPKkVEmk+gFqmen4zCtvXRoGjQfU4js0+HlVE4FsekSRInJnbLIZFpcNSECzpSmb0FQH
	OyZXwFbX99kl8Jp6E1DgbPNKz7aqSRfj2lgmU=
Received: by 10.216.26.139 with SMTP id c11mr791966wea.6.1283623936331; Sat,
	04 Sep 2010 11:12:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Sat, 4 Sep 2010 11:11:56 -0700 (PDT)
In-Reply-To: <AANLkTimOpx8UcC3F0e+OVggMGSA6e_DK3GdM1g+nXo2=@mail.gmail.com>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<alpine.LNX.2.00.1008301851400.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTimOpx8UcC3F0e+OVggMGSA6e_DK3GdM1g+nXo2=@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 4 Sep 2010 11:11:56 -0700
X-Google-Sender-Auth: rNsmQP_1MxgM7rp26ZXCD70mqtA
Message-ID: <AANLkTik9cPFigtKTfvG8pqA7mib0XT0kk6wDpiKX-7=o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sat, 04 Sep 2010 18:13:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 30, 2010 at 10:28 AM, C Michael Sundius <msundius@sundius.com>wrote:

> I have been using a addition that I made to the stamp policy a while ago.
> I sent it to the OE list and the bitbake list but I don't think that it was
> ever adopted,
> eventhough I *think* that I got one or two positive replies to it:
>
> http://article.gmane.org/gmane.comp.handhelds.openembedded/29858/
>
> I would love to see this patch added to bitbake so I don't have to keep it
> around
> in my repository.
>
> do any of you have any ferther comments?
>

Hmm, should it always be used, the way the patch does currently, or should
it be more the way the whitelist is done, where it only affects for
fulldeptree?  I'm not opposed to this going into bitbake, personally.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

