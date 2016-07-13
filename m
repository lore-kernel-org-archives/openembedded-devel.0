Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC9B6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 17:53:54 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u25so1981238qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tkLL7zcNZBBab0PAUJqfcnBiSSpbDPXMF88pCNEnL+0=;
	b=dui3VkoB6NOzJN5/pqF8oTuZpMGSkG+7TB6PGX0kuyNZNTGjYF1loNs+DBq+HKRVfD
	NQficHRvaVmw2vAt7iaw66R7wsduWeCg4N67rymoSiuUzrWq3ux555/uxtpA0PGpA63W
	1FUbSyOkASF9mPFvsNYmzOx42RF/3t2Wd/OWNXBPrfG5yQ0LXDj8J5jvb0/LbrjNFp+I
	4ErK8BQMEZhkMafntNNv2SxCSxRqJh1yavQSuEcZFV3D+t7Af1jcobnV/K8HP2kzWRLN
	+KC7Ik53r+C0BNPYXUJb4JeXc0S2aeVLNc1FOPvlgTZciACATjjCLXWduUry9DVQBurE
	TL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tkLL7zcNZBBab0PAUJqfcnBiSSpbDPXMF88pCNEnL+0=;
	b=meZc09oq0eQsucIgMaO3ZBarbdaa9l1P2xBH48Vp4jpm1g5ZDY6wKB5wakWFbUEHgW
	2BOqfIxuHptnzJljNh1yXszQdPbkoYW5TX17+lstbV+29bxFxQz+QIWXCWIXVO2RxmD5
	GYKohsrbsZ6AZBO0q9Yxj77fN/GIn1hNDGdDARDGnfPcBgQrGMTJFp8b1JwHYu8dJH42
	Vy7zjl1A/kaWolG7qpWRFzTj8oXOuA0nPIVwf+s/EnMq+tqvS2VGmneow4BYuFP5Wfyv
	VVEoi486PE2acNcOsRxrbgowayE/mbQobKcToSWPLyzNicbkoVkduFPg1LEiUGv01mA7
	MN7Q==
X-Gm-Message-State: ALyK8tLSx+MEdt4TLE4kK/DfGvZPLUsr4OXKgfQFmeuXLi4sUIV/FY/0ZLs5g/wTKTAJP4U5HEb17YkF8MVCIA==
X-Received: by 10.200.33.172 with SMTP id 41mr14005424qty.26.1468432435301;
	Wed, 13 Jul 2016 10:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 13 Jul 2016 10:53:25 -0700 (PDT)
In-Reply-To: <1468416494-17044-1-git-send-email-philip@balister.org>
References: <1468416494-17044-1-git-send-email-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jul 2016 10:53:25 -0700
Message-ID: <CAMKF1sqK0p0Cmoa+bTVLq-TEDD+=zQQ8O0RzLgqr1sdzp2Q1+A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libsodium: Update to 1.0.10.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2016 17:53:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 13, 2016 at 6:28 AM, Philip Balister <philip@balister.org> wrote:
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb | 10 ++++++++++
>  meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb  | 11 -----------
>  2 files changed, 10 insertions(+), 11 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
>  delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
>

you should use -M when generating these patches or add

[diff]
        renames = copies

in your ~/.gitconfig file.

It shows that md5 for LICENSE file has changed and it would be better
to document what changed in the commit message.

> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
> new file mode 100644
> index 0000000..370f553
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "The Sodium crypto library"
> +HOMEPAGE = "http://libsodium.org/"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2278eb2755b451372dde7ffeae8cde98"
> +
> +SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ea89dcbbda0b2b6ff6a1c476231870dd"
> +SRC_URI[sha256sum] = "71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be"
> +
> +inherit autotools
> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
> deleted file mode 100644
> index a2eef4b..0000000
> --- a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "The Sodium crypto library"
> -HOMEPAGE = "http://libsodium.org/"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
> -
> -SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "0a66b86fd3aab3fe4c858edcd2772760"
> -SRC_URI[sha256sum] = "c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926"
> -
> -inherit autotools
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

