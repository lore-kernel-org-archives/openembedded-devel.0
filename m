Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 30A4F6025E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 21:10:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a20so19149999wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gl4JZopq1tDsktKqL1wJ7EgtXM9l73krkSN2qiuX488=;
	b=lvNkbZtjVFHux6F3FPiqX1IPAnUruShusLXnpS92EF6lbkjCLHS0354xnVaeJQ/Mh2
	qPl42udGVvX6vO2gyYGehLOru/zDycZ08SrpuTI0ELyrQIehMDL/DPQ7eq5bYPF3HhEQ
	1LfP4OzOPfIefIQToLjU+AwVVHpTplVqlXmoafC8VNKs37zuS04TNJnIr5829nnod8Ws
	NX7nyT7UE2hQEMiAoGkqFWqCRXv/kS1dw4R9MuJq8YJ+olDPzFQNW6StsTnbVIFQClSa
	cC3rmMV9ZQSFbuJW2l7a5EVon0Oc1WUOW5Ncja6YzTgCdKFo68oIAmCglw4hxPTTpMeV
	eOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gl4JZopq1tDsktKqL1wJ7EgtXM9l73krkSN2qiuX488=;
	b=U8dLstdYcktOV3BWHVwirI1vE3FuO+keXIsEVR/dDYi9MQa/KOaM9jTyuAgN0bfrbS
	iGMSZTftBFLPFWHnJnCeAS1jrPXmUK0YRKp7qTx8WLyl+KRXmYzwSwMU46GzWt7iP7J2
	FHmfun5eIrXefztcVYKd6h129gKYfN6hyIjY8lUYJ0ejR2ACkoBN11MGIteG0FFk7VpX
	t4+YVmuQ+QXq/+9YviHm+AUQM80mpTJivol2CpbJ4m4j4+xA7VCYu7ZHSF621XTumRrQ
	e8b/XJeg3ZbrgAwAYAuXEl7fqGcmsTpJPda4NFp3h18iWQVfwE+P3tctWbM3K7eIDYPM
	O+Kw==
X-Gm-Message-State: ABUngveF9O1zVuT46e4xV8BQ4D3k/y/6b91+lNgsAOaHZjXUplajke1+wfrUbsBTxhocXfLW+8jOlig+YNkd6w==
X-Received: by 10.28.184.88 with SMTP id i85mr290895wmf.49.1479157848833; Mon,
	14 Nov 2016 13:10:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Mon, 14 Nov 2016 13:10:48 -0800 (PST)
In-Reply-To: <1479156633-20878-1-git-send-email-joe_macdonald@mentor.com>
References: <1479156633-20878-1-git-send-email-joe_macdonald@mentor.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Nov 2016 22:10:48 +0100
Message-ID: <CA+chaQeV6Cr4FfKra6XT18h5K9V=9qkjva59H2uW61V7BvQhcQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] iscsi-initiator-utils: Update SRC_URI and homepage
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
X-List-Received-Date: Mon, 14 Nov 2016 21:10:48 -0000
Content-Type: text/plain; charset=UTF-8

Github archives are regenerated from time to time, please use the tag and
git fetcher.

On Mon, Nov 14, 2016 at 9:50 PM, Joe MacDonald <joe_macdonald@mentor.com>
wrote:

> open-iscsi.org is defunct, the new home is at open-iscsi.com, update the
> SRC_URI and homepage accordingly.
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  ...utils_2.0-873.bb => iscsi-initiator-utils_2.0.873.bb} | 16
> +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-daemons/iscsi-initiator-utils/{
> iscsi-initiator-utils_2.0-873.bb => iscsi-initiator-utils_2.0.873.bb}
> (90%)
>
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-
> daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.873.bb
> similarity index 90%
> rename from meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0-873.bb
> rename to meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0.873.bb
> index 4b13155..d540085 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0-873.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0.873.bb
> @@ -4,16 +4,17 @@ independent, multi-platform implementation of RFC3720.
> The iscsi package \
>  provides the server daemon for the iSCSI protocol, as well as the utility
> \
>  programs used to manage it. iSCSI is a protocol for distributed \
>  disk access using SCSI commands sent over Internet Protocol networks."
> -HOMEPAGE = "http://www.open-iscsi.org/"
> +HOMEPAGE = "http://www.open-iscsi.com/"
>  LICENSE = "GPLv2 & LGPLv2.1"
>  SECTION = "net"
>  DEPENDS = "openssl flex-native bison-native"
>
> -LIC_FILES_CHKSUM = \
> -        "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
> -         file://utils/open-isns/COPYING;md5=
> 7fbc338309ac38fefcd64b04bb903e34"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
> +    file://utils/open-isns/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
> +    "
>
> -SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
> +SRC_URI = "https://github.com/open-iscsi/open-iscsi/archive/${PV}.tar.gz
> \
>             file://iscsi-initiator-utils-use-var-for-config.patch \
>             file://iscsi-initiator-utils-dont-use-static.patch \
>             file://initd.debian \
> @@ -23,8 +24,9 @@ SRC_URI = "http://www.open-iscsi.org/
> bits/open-iscsi-${PV}.tar.gz \
>             file://iscsi-initiator-targets.service \
>             file://set_initiatorname \
>  "
> -SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
> -SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4f
> cfe98bfd5ef284240a2cc4ff8e88ac7cd9"
> +SRC_URI[md5sum] = "77ef4d5f5aceb4c7f0bef743fa7fc05c"
> +SRC_URI[sha256sum] = "c51f6fad45afb7c059f10776de721c
> 6d5fd0336ff927daacea6a7e0a3ad02f18"
> +
>
>  S = "${WORKDIR}/open-iscsi-${PV}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

