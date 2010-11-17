Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIbxF-0006Za-9K
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 07:57:18 +0100
Received: by iwn38 with SMTP id 38so504669iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 22:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+nnWYr1SBT3trTxrmPZU1LwwstYHlDRjUXAOOGy5/6M=;
	b=fzbdiC4/i93RVbeNoa58hBitszVasOGCppx2kZJpUJ0MF27q3pape8NpKtZKvkbHK6
	tCM53Tr9fEVQCqGKKJ0XtJB/mugwTE7HngYAu6BCETkCiwanUHN3cCUHYLRL0lA+8GHT
	qhQ2/HIWbytngwXsTvd0v7ELE9x5Jg3SyFMgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=s/poIuVw+WylIRaQ4gqodruhz1deSL9J0OXCo3C9Iba+bODglF3y+0EbuBShm8s+2q
	hk239TT5+dcszlLPZTDyB34XROvNHw0VH1E+skiaaOQRiyyjOREZOKSsjnGBiDCWPU5I
	RS8mZiAHrBUDIVQL5ATR9F6BcTZ3hdI7isWSk=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr6607145ibe.101.1289976971335; Tue,
	16 Nov 2010 22:56:11 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 22:56:11 -0800 (PST)
In-Reply-To: <4CE359C8.5030808@gmail.com>
References: <4CE359C8.5030808@gmail.com>
Date: Wed, 17 Nov 2010 07:56:11 +0100
Message-ID: <AANLkTi=aGx_TTG_sR_YDsO1PLdawYXxwJKWrG_cKH074@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: remove duplicate line.
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
X-List-Received-Date: Wed, 17 Nov 2010 06:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/17 Graham Gower <graham.gower@gmail.com>:
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0conf/distro/include/sane-toolchain.inc | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include=
/sane-toolchain.inc
> index 6d460a2..100009e 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -20,7 +20,6 @@ PREFERRED_GCC_VERSION_486sx =A0 =A0 =A0 =A0 =A0?=3D "4.=
3.2"
> =A0PREFERRED_GCC_VERSION_avr32 =A0 =A0 =A0 =A0 =A0?=3D "4.2.2"
> =A0PREFERRED_GCC_VERSION_bfin =A0 =A0 =A0 =A0 =A0 ?=3D "4.1.2"
> =A0PREFERRED_GCC_VERSION_xilinx-ml403 =A0 ?=3D "4.1.1"
> -PREFERRED_GCC_VERSION_xilinx-ml403 =A0 ?=3D "4.1.1"
>
> =A0# This is unrelated to the kernel version, but glibc and some userspac=
eapps require a recent version to build against
> =A0PREFERRED_VERSION_linux-libc-headers ?=3D "2.6.31"
> --
> 1.7.1

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

(actually personally I feel that trivial patches like this one do not
need review)


