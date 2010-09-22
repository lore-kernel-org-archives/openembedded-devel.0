Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OyKfq-0006H0-PB
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 10:27:31 +0200
Received: by qyk4 with SMTP id 4so531528qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cWX4UFcBz+uJzcAwDfsa7QGw1zb8bRQBJjXEmmoDd/M=;
	b=Yoj8Ng2fOtfiD1Bbjkry9ddDiKT2Ghcz8yg/k//cb/vUbsI8fe7+dkw+ZPM3sHhqlM
	HAMwSIh9gRNigNuY3DKiTEalyUS/m+T5G1z2besT7+xBwvhNSvpUBg2qoRZxynW+EHrU
	ZWxnl7uRG0w+gwlN8KgVgY6ydxyfzJvFbELj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hY7qf3GVI7mQSKhrjBYthlVmCu8GU/sew10uHaZua+IUFyJhkHD4ywDPrQumplHXYB
	u9a2S21H96PIWFMMzRgDopCiSe1TTHOudHomhzMJ9XG7tj9XAw0rq9kpAOUCXbxV0kol
	/t9pr4aGPQNfRDtAjtgbec2Qyhf8BmwCIB6MI=
MIME-Version: 1.0
Received: by 10.224.72.205 with SMTP id n13mr7779153qaj.286.1285144045379;
	Wed, 22 Sep 2010 01:27:25 -0700 (PDT)
Received: by 10.229.36.65 with HTTP; Wed, 22 Sep 2010 01:27:25 -0700 (PDT)
In-Reply-To: <4C995108.5070108@gmail.com>
References: <4C995108.5070108@gmail.com>
Date: Wed, 22 Sep 2010 10:27:25 +0200
Message-ID: <AANLkTi=bZiZt_Da57qAF3KjHR=jZ3JHQFfO2nVGnL5LX@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=spitz.
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
X-List-Received-Date: Wed, 22 Sep 2010 08:27:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2010 at 2:42 AM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> From 909e5617f2534b505c6940b9e409a1ce3cdae1e9 Mon Sep 17 00:00:00 2001
> From: Graham Gower <graham.gower@gmail.com>
> Date: Wed, 22 Sep 2010 09:47:53 +0930
> Subject: [PATCH 3/5] pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=3Dspi=
tz.
>
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/pivotinit/pivotinit_1.0.0.bb | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/pivotinit/pivotinit_1.0.0.bb b/recipes/pivotinit/piv=
otinit_1.0.0.bb
> index 912cfeb..8b40db2 100644
> --- a/recipes/pivotinit/pivotinit_1.0.0.bb
> +++ b/recipes/pivotinit/pivotinit_1.0.0.bb
> @@ -4,6 +4,7 @@ PRIORITY =3D "required"
> =A0LICENSE =3D "MIT"
> =A0PR =3D "r0"
>
> +COMPATIBLE_MACHINE =3D "(spitz)"
> =A0SRC_URI =3D "file://init"
>
> =A0do_install () {
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Hm...'pivot-init' is specific to old initrd.

Nowadays we are using modern initramfs so pivot-root doesn't apply:
initramfs is rootfs: you can neither pivot_root, nor unmount it (see
kernel/Documentation/filesystems/ramfs-rootfs-initramfs.txt).

I suspect this recipe has been obsoleted, I'll grep and see (AltBoot
was using this iirc).

Regards

Andrea


