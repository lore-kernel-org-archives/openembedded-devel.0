Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F3107BCFF
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 07:39:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5705.1773473985195286599
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 00:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GF+yfzv7;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so3306725f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773473983; x=1774078783; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A3Xkrt+C0r4HwV/Y6YiKQ4zgbEKNIZM18dZIJfYP3Ms=;
        b=GF+yfzv7nuMItoAIUUmFfXTc8gw5UtjJiYSgcBZbuxGzsIPilcyJEY3DF04FondhQQ
         BK/t1ZzviRGLSQMT6BCr7h802N6JgkEpt0Ezp6EAcNM5YMbthCk8rYE4k0bE1/7miUQw
         iXaP6MRTjmvt1veudQdsfkXxZF50JxtE9agdaSHya5REfe2a54Ueb4f+z89q+HqXw+Bc
         nJhSJUF8sx41oLmiUmVUk8qR573ANnTcXgBV2EQ9f9t4xsnBaiCBHgLvUAbJ7khMOGh1
         A3Dc3OAuUIHHRVgz1rgt0WuLb69Gs2sARA1ubdo33SbrAqttREMiMog0hu0F6wan9S11
         is5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773473983; x=1774078783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3Xkrt+C0r4HwV/Y6YiKQ4zgbEKNIZM18dZIJfYP3Ms=;
        b=L3PtooZ8yhC0K2d5Ee6D/21jhFZlFnix/GA3O6oaF480QyoCqVu6XUr9GCXgdZKEHA
         HH2YwFQG7NMeXHoqUA+F7LanHDWQZS8w8xn3iC+s9xVlEkrwgLGFauJGUGRDDun5d65N
         p85wJpFAEN2uSrRtdBUAaDMgNPGnnFXUg6DEcmC953NMW2gvKCcpQKGv63XDaVIto67P
         0l817XEj8kcTodK8OMt4zl23PWLyBKvWFeCXBQPO3KSDQnOuNfhs/HL9pajM0Jsg1lKb
         EFfdr4SFnDTQm3MnBIDh6yD8lNcl4VRTEe8LulIYgTQ+QC5j4R8x9/DHvbNbThKqGmFZ
         Pluw==
X-Forwarded-Encrypted: i=1; AJvYcCXsICKWJiBmwv521ZUI9Sus7XCZON3pRoX236fO6sBaiVwnLF9WtuXopnytDTumri3Ukfx0JKoQLrvG6dWZW/rbbUU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxeKBN1P0xvVPr7OfO5DKopi/F1SB1Q1k3dpFtYhru+nrEOpbIP
	GZiwpZjqoMblVRgiEVx77VJrFXx9Xx/pEQNKDVrGOpPDwOdfLx6kiNc3
X-Gm-Gg: ATEYQzyapyQfYxLyRA5Kc4xT/5MZBv8DzsmBcfiGyDa0Nwn8DBthamJTrBaah/lxBST
	Pv/4CV6Oo6STghxY0we2AN4Ju/DtZU1xwiXBonkuROWpGDjauIixyeWK3NS6UccQ8WyuDH25Mjr
	lLLFI7RvMN9kzhOVWrJt5sGHaAYAfZm+r4FJoip+C+NF+C/kXlF1DgY1Gsap3f53V9LCS2H+2vr
	hxkou8Ilb+pl87M+YrQmJzYLhSRoNRx3gvqAeiddNplfWtbQBnCUN3VVISghwpYd1GEhDm1GSFx
	eSrj1BBAktpyGWyB1rMh+jfROn3FTQJAl2mL0+wpmLCtQQ2uVJ8UWWeOGRKbxitp5UrIkN+Sqg6
	3JWPGCoU/dTYgnT9JN+WU+kg6zfNqu8I177Hm7q96t2+oHYRhzUe69uhStmhiRimVnAQSPf+BCf
	cVzldbx5ymecO3llYICqgkvTTulz1Bpuc=
X-Received: by 2002:a05:600c:a4a:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-485566f79c7mr95709205e9.21.1773473983010;
        Sat, 14 Mar 2026 00:39:43 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557784c18sm89874675e9.4.2026.03.14.00.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:39:41 -0700 (PDT)
Message-ID: <e45b5a63-885e-4e61-be96-2782366f571a@gmail.com>
Date: Sat, 14 Mar 2026 08:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libnice: make crypto library configurable
 via PACKAGECONFIG
To: sujeetnayak1976@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260310231055.70877-1-sujeetnayak1976@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260310231055.70877-1-sujeetnayak1976@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 07:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125198

This doesn't seem to apply - could you please rebase this on the top of
master branch?

On 3/11/26 00:10, sujeetnayak1976 via lists.openembedded.org wrote:
> From: Sujeet Nayak <sujeetnayak1976@gmail.com>
> 
> Move gnutls from a hard dependency to a PACKAGECONFIG option,
> defaulting to gnutls. This allows users to select openssl as an
> alternative crypto library by setting PACKAGECONFIG.
> 
> Signed-off-by: Sujeet Nayak <sujeetnayak1976@gmail.com>
> ---
>  meta-oe/recipes-support/libnice/libnice_0.1.22.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
> index 175e10fdf6..5c5436dd8d 100644
> --- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
> +++ b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
> @@ -11,7 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
>  SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
>  SRC_URI[sha256sum] = "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e"
>  
> -DEPENDS = "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
> +DEPENDS = "glib-2.0 ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
> +
> +PACKAGECONFIG ??= "gnutls"
> +PACKAGECONFIG[gnutls] = "-Dcrypto-library=gnutls,,gnutls"
> +PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,,openssl"
>  
>  PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
>  PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125045): https://lists.openembedded.org/g/openembedded-devel/message/125045
> Mute This Topic: https://lists.openembedded.org/mt/118254151/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


