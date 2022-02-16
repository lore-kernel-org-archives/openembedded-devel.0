Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE07EC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 21:06:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1321.1645045579792378198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 13:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B8E7240C2A;
	Wed, 16 Feb 2022 21:06:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmVYOipM8Smp; Wed, 16 Feb 2022 21:06:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9EB8A407E5;
	Wed, 16 Feb 2022 21:06:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E064617475F; Wed, 16 Feb 2022 16:06:16 -0500 (EST)
Date: Wed, 16 Feb 2022 16:06:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [hardknott 6/9] cryptsetup: Add runtime dependency on
 lvm2-udevrules for udev
Message-ID: <20220216210616.GQ26229@denix.org>
References: <cover.1631713963.git.akuster808@gmail.com>
 <32f1d758a14bba35d67a75778ae747f1ff5c5482.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <32f1d758a14bba35d67a75778ae747f1ff5c5482.1631713963.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 21:06:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95349

Can we also get this backported to Dunfell please?
Do you want me to submit a separate patch for this to happen?
Thanks!


On Wed, Sep 15, 2021 at 06:55:17AM -0700, Armin Kuster wrote:
> From: Kristian Klausen <kristian@klausen.dk>
> 
> Without the udevrules cryptsetup luksOpen will be hanging with "Udev
> cookie 0xd4de0f6 (semid 5) waiting for zero".
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 60b33e376b2331cd20950f0745336397790d2201)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
> index 9e83b90eab..498f333810 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
> @@ -50,7 +50,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
>  PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
>  PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
> -PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev"
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev lvm2-udevrules"
>  PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
>  # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
>  # recognized.
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

