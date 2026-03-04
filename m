Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F34EEF9014
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:51:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23055.1772643111206857733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mL3ac1p+;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439bcec8613so2363427f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 08:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643110; x=1773247910; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRm/OQ87PKGprd1d33IHOrEuDoOmVbuw5ZTnAE1Rzno=;
        b=mL3ac1p+4gucXVzr3ej+JHLRQfhLelPhXYRyhzw/XD//Vxv2B9JQ/ev6lckZv4GnRf
         iV3fpk7zqPkEr7HQ9nDpiI42OeU3/5q3UVbn3IShISEPstSkoLpCMI2jjqH4vGO+17DY
         dETpYVtUcrAq1q4OPtu/mdptcBzCNKHYypVdrLH+X7jmaGEFjD5xlPI58D3A4dZheAfc
         inGpBpaYS7cA3V1tEsz4ZfgpmwO1m+7+WE5GxmiVajLRTfGedDLeogXckYgbQyyqCQea
         MHkJH6PnIs8BRyJKDo5SzJ2HyrEA3fT18N4JQ28C2d2twq0voEFo+OK61/yuluM1Nyb7
         7eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643110; x=1773247910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRm/OQ87PKGprd1d33IHOrEuDoOmVbuw5ZTnAE1Rzno=;
        b=Rpx8Rue3gBH0EJNmdVp1T8lR7bhXA6BrebQkV2XBTG4OLkHs7B64PDjoMTGYArQ1Xe
         sEV9FXf3W+BCDjPiMwc+FaBIXUoj6h79LYzNPtMRPFuyYVNuFVQrOWBwTgSXUw/S6C27
         cGLrpbbMPC4J74JAcXL74GPLlU1wO4Ut3aMmufGuwpPMBiKJ6lFLXrpehGxKobQI4a2G
         5OKUpHeeTmw8FCqCucFybVESoofaZwZwo57K58iw/6PFVofLIb6MqV1rgB3wEVUhZlYc
         4ajVH1J67LwvUALV3GsgK9C7DG8hbajY3TYfIVp84+DIZAdTPtY8VP3U0z9/WXG1OsJJ
         VGPw==
X-Forwarded-Encrypted: i=1; AJvYcCVM4LDqwFp4dwtnQexVstpLK78cPLUn7RwPv8XPP5IpS7vmO2EdTSIf8XzRwttW5BnSOyOmC44iDlxrQTd5+yK1+Ok=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJhx65yhVwNKOCaK9JL5j0k5oxHXj0JA16I1SUYJhdHbUh6ioF
	4hvKEJhorKLHpQ+396ALpId0U5qfB1p0n0cdzABNQQqvHGwd3fJ4VOx9xYxm/g==
X-Gm-Gg: ATEYQzx5W7fTk63+viMXzBboy/+usw0x4jqbdtdbBHuUzWnDRyGsQxPpdxaclXGn7kF
	f24M8rit/So3uRSaKsPKVK+yRwU5agx5YdSet17ugQpn3Z0SyyCMkVitH67zO3HoCbgxEqiQlWe
	QDhN0Q6D+f49Fb4aMfRzcRCxb8rSWnUzkWRPm39/MozRTomefHXU9ezkt+VUT+o0+sRgb/3DioQ
	RHjlvSVk1Ws5alAVCUjDSjWyYkvuugf/9vJaKunyih5u2au8HQphpG+5tSxQ/+oAAB3D5Zm5YcR
	KhxR411Y6KshH3ys7AI2faBNTePOptvm4OMzZLvnWa3bEtIGsG4ektpY7XTSnHbMtedTAcOCFYD
	KxnKSvbJ1MeBKZNLnlXUZCT4kyB9UHMZsAM59Jy1IzQCYbIT0YQwpqsrsE2k+7GFF2X5OOj4ffh
	LWLm+Ki27nXAYInlND0hrugtbmxN9Qwmo=
X-Received: by 2002:a05:6000:2283:b0:439:c3d1:a399 with SMTP id ffacd0b85a97d-439c7fa6989mr5251496f8f.21.1772643109425;
        Wed, 04 Mar 2026 08:51:49 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439bb69e098sm18653206f8f.9.2026.03.04.08.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 08:51:49 -0800 (PST)
Message-ID: <285c9b5c-1dfc-4eaf-b281-d01e96f29a39@gmail.com>
Date: Wed, 4 Mar 2026 17:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] meta-oe: libcppconnman: add recipe
To: andrea.ricchi@amarulasolutions.com,
 openembedded-devel@lists.openembedded.org
References: <20260304154425.623340-1-andrea.ricchi@amarulasolutions.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260304154425.623340-1-andrea.ricchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 16:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124854

On 3/4/26 16:44, Andrea Ricchi via lists.openembedded.org wrote:
> libcppconnman is a C++ library to control ConnMan via D-Bus. It exposes
> simple aync methods to perform all the controls that ConnMan allow via
> D-Bus.
>
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> ---
>  .../libcppconnman/libcppconnman_git.bb        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
> new file mode 100644
> index 0000000000..86d44e1806
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Amarula libcppconnman library"
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
> +
> +SECTION = "libs"
> +
> +SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main"
> +SRCREV = "d89262c2cd7336da8ba9eb06228d422847fe4b20"
> +
> +S = "${WORKDIR}/git"

Specifying ${S} is not needed anymore when using the default folder with
git fetcher - and the current form has been a fatal error since
Whinlatter. You can just drop this line.

> +
> +inherit cmake pkgconfig
> +
> +DEPENDS += "glib-2.0"
> +
> +EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_CONNMAN=ON"
> +
> +# LICENSE file
> +FILES:${PN} += "${datadir}/Amarula"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124853): https://lists.openembedded.org/g/openembedded-devel/message/124853
> Mute This Topic: https://lists.openembedded.org/mt/118134477/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


