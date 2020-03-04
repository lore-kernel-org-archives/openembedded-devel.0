Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2B75F60B41
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 06:43:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v15so602294qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 22:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2sFt/1U2PrHkczeSxyZ/Y7Q9vx3WVcaR4ipW97yO1i8=;
	b=rt264zH85gEf0zWAEtmLDArlxckgEcM74IU48ZpjgnAK54f7WppQqOmJo6ty78DVhT
	tN8AXUK8JE+G51WX6a8qTsCeI8xcY7jbVx8O5QUSxWhOHacGLSO/BPM/kUOl9//wKSJp
	6nbrsQXRoNQ7wIaKw6LGxSvBMAzSEyy9WDQCalaKTzN8Fj/AmstalYzZdH5KgdTd27xP
	5KTjg5np4R4vQB8NGFAxRLmvDynMlMs+m61G5uHhiwWt0haEXH5UpE3PWR2iWWYEHSAN
	RXXYuXRaXSLqyzN011HY2Tp4Y1PqTSymXrpLsVsJAMKlPy0Tmjv1+HMlwftmVHBtfrSt
	MeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2sFt/1U2PrHkczeSxyZ/Y7Q9vx3WVcaR4ipW97yO1i8=;
	b=Je6OliDjPygaBcPPc4XPQr3fS76oYgCtUqM5CgYRGgcaxlcJltUmxbjFp5h7UePbDn
	sfcZLYuUx8CrTt2T6X15xVpjMoM5N5m7k2H5cJcv+0DivU/jTuhmE4+NIs7Xz9b5lBgt
	CN5fvUpgBTo27U0QRPTF04ngLvnwOZeBIzpce8vAog1YD7g1rX6FfdNgQbfqWbkPO21C
	fEhHc3bxp0FW8Eflg0SMYGQkCOnYa1ds4MyJ6WiXd8DKCkZ+MYzGSSwdhCNRD5sIwsjs
	GN3SBTzEESZNVCwT0obYiUGX0zDUWNQ31eggirKMLGonYT9bZi7eZWjMh6MvVoL0sWnU
	QxTQ==
X-Gm-Message-State: ANhLgQ0U8AGGBFzV7NHpPJD6NncFfa7ORsasqkKsxvAZn69OMrjQgY10
	5/s4uOq8CplBM6+9m9cP38+AOcZ0/SogRsaRu34=
X-Google-Smtp-Source: ADFU+vv9F50cytEyxM1y6Xk4e313AJUBpFGeWolLq5bajLx45wYIF88bApZNlI6c9gifPKiKu0u8Hwvepfrq6ygANVs=
X-Received: by 2002:ac8:7511:: with SMTP id u17mr1103783qtq.316.1583304205750; 
	Tue, 03 Mar 2020 22:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20200215005402.18661-1-scott.branden@broadcom.com>
In-Reply-To: <20200215005402.18661-1-scott.branden@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2020 22:42:59 -0800
Message-ID: <CAMKF1srJLkYmt=uH7QWDW_-TpeS0FcrVjU3f1Ec_+1_rc4vtwA@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] x265: add x265 recipe
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
X-List-Received-Date: Wed, 04 Mar 2020 06:43:26 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Scott

I am getting a textrel issue reported on musl builds see
https://errors.yoctoproject.org/Errors/Details/393681/

this recipe is already applied but would be good to root cause this issue
and find appropriate fix

https://errors.yoctoproject.org/Errors/Details/393681/

On Fri, Feb 14, 2020 at 4:54 PM Scott Branden via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../recipes-multimedia/x265/x265_3.2.1.bb     | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>
> diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> new file mode 100644
> index 0000000000..21ae596e05
> --- /dev/null
> +++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> +
> +LICENSE = "GPLv2"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> +
> +DEPENDS = "nasm-native gnutls zlib libpcre"
> +
> +SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
> +
> +S = "${WORKDIR}/x265_${PV}/source"
> +
> +SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
> +SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
> +
> +inherit lib_package pkgconfig cmake
> +
> +AS[unexport] = "1"
> +
> +COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

