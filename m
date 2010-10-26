Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PAm1D-0005Mh-AV
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 18:05:01 +0200
Received: by gyg13 with SMTP id 13so3058627gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=hBHEBLwH2+D7LRNv62ECgHFxfxEyOrHysPo74xpl7uI=;
	b=dfW+kt4oDE8Ms9q7Zwjyf6MlwbaEHK3h4puOdEpl7wSjmbQugPZg1ta4XyPPvacvSZ
	K6pMFGkDGratCgwNmMfOiSM7tjQ7qNZNxl0uxrldHRmfOyLhl0cnr40+jxxyLls99gCL
	7N2SRwuv2a53I+k2uQswGOzmHyS8RkKeBp5+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Kwql7U4DTs3dD0/axh2L7Dw2ZdCpHigryb+sgSyvHAckq7BPcoc0eqxjpHYYvULyxT
	07xjzu5t0M9vjeCHyA8IMA5lBWRw5pao8zT9ss+FhNrJKWwGYaFUUNh2LaYWtyCaSAnx
	mshyInnFoMQJCXzTwD7emER56v4fTv/VIytwA=
Received: by 10.216.55.208 with SMTP id k58mr7776248wec.90.1288109056025; Tue,
	26 Oct 2010 09:04:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Tue, 26 Oct 2010 09:03:55 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0803110B3CFC@dlee06.ent.ti.com>
References: <4CC6F440.10509@opendreambox.org>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3CFC@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 26 Oct 2010 09:03:55 -0700
X-Google-Sender-Auth: mW6Y2ijhDKZDLsEywS4bEEv3TcM
Message-ID: <AANLkTi=Nq0nGQ7gS_5b0fTUEP344Xk-4UnZn-qTPN4BT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Tue, 26 Oct 2010 16:05:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 26, 2010 at 8:51 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Andreas Oberritter
> > Sent: Tuesday, October 26, 2010 10:31 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] Use of == in shell scripts
> >
> > Dear all,
> >
> > I noticed a common mistake in various OE recipes, classes and contrib
> > scripts: Instead of =, == is used as equality operator, in at least 91
> > places in 64 files (without recipes/obsolete: 83 in 60 files). This
> > isn't a problem with bash, but it isn't the standard syntax and at least
> > dash does not support it.
>
> Isn't bash the supported shell?  If I remember correctly in bash "==" will
> also work with numbers whereas "=" is only for strings.


For now, it's required, but not by our choice.  We were forced to it due to
portability issues with scripts in the buildsystems of things we build.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

