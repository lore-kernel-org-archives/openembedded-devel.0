Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PMLm9-0000Te-Fp
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 15:29:17 +0100
Received: by wyb40 with SMTP id 40so2905586wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 06:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wdU46YECho/ORjGMkN4LMctxsj7S01f4gjKO9mE3ZpE=;
	b=C2CG8hVloalWwEm5u4PbHPI4gWrONfsRpTtjhoiZg3g9cb1jwZdvfqRIGFMz1ajGrX
	EUjfxQ9NXPo6OIVPSu9hgV2UD1gM7XweDgaTHFebOHAyt4mr10c1GVOEmX9xa1OMMloA
	OSfpU7w7GKYKx88ls2+wfneHTUERGKTRUhDjA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=csZD1V9VQfSYnqkgmCZVm6w8kLXgPnN9Jy6AgzO2GUs42LIPxUx4jvLAi2s2uIDFjj
	BBONn9QNGD1gJ3iuscgdt3EDlVSZ/fInQSzqzY4j3JrpbHW+wSsKeIkALDfRs9nF2Kv4
	miHPKJQ5pKIu5uAYv9n+DzkGS/w9tWnsoOyWs=
MIME-Version: 1.0
Received: by 10.216.52.11 with SMTP id d11mr2941387wec.0.1290868079830; Sat,
	27 Nov 2010 06:27:59 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Sat, 27 Nov 2010 06:27:59 -0800 (PST)
In-Reply-To: <AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
	<20101127140200.GH10755@ibawizard.net>
	<AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
Date: Sat, 27 Nov 2010 15:27:59 +0100
Message-ID: <AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Sat, 27 Nov 2010 14:29:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 27, 2010 at 3:13 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Ok, then I suggest to stay with 0.9.30.2 and add the two hacks documented here:
>
> 1) replacing log2f(i) with logf(i)/logf(2)
> http://www.mail-archive.com/uclibc@uclibc.org/msg04949.html

Patch courtesy of Bernhard Guillon already done (bad that OE Patchwork
is down...)
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November/027326.html

> 2) '--disable-tls' for e2fsprogs
> http://patchwork.openembedded.org/patch/2069/
>

Here the patch is trivial...my concern is both should be Angstrom-only, isn't?


Andrea


