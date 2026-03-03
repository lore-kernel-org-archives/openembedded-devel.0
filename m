Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECD1EC0482
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:55:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14732.1772531712022151096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 01:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPmWPW1v;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48372efa020so47385675e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772531710; x=1773136510; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lj8SlIjgsHMriK7bVfBtAdJZTE5ah8BfLCSnEUh8s4I=;
        b=XPmWPW1vGLFyqvnkOMSQwtkNI87ns5X3oEdoY1ZwQJEQ35ZUO4FovDmX1fc2aE7IO5
         RIS1+R5+JgUjEuC6CcT4kISNBvFeMKTwwe8vCGc4j2mLo6vwzz9NQDzbozumGcnU8sTn
         WYjae+OSZDk6V4zFjmafjqq+jLuIinHcX/ZPq89rr9zP2D2E+ykYc6rA9pzrTjfO8uIF
         rdEoz71Arg6pmOjKo5DEnXku90vHVo87pNOmVrsMTS/PM0vqrg67OXNv/FSZrQyJ2Xi1
         JLOTykIu15u76kOyhxVyR2FvUytMApgStOS8vI6oHOyCrxZ22hwihhYY/GkDCoUozb1Y
         8e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531710; x=1773136510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lj8SlIjgsHMriK7bVfBtAdJZTE5ah8BfLCSnEUh8s4I=;
        b=EnxIHp21ZGgJGuQvUy/3gUlfV68XhGzLyEsfjD3bOE44FBQt9glyDPZCrejb9uyZw/
         JqRhMndKQ3aEud9DnSn7uU75HDHL8t2ixTACK2UmEp/UvYUnOTtToxx640PmM9l74x7a
         WSYynufCTwQMGn/SvIySAgkj3HEwYYvXej8YSjiMHSiUBIba4xfgNz0YFBrC4gtOhzbr
         DLDLYNtK1wXq4q7b9jKhMKcaGPAsPEpjAXOZv6UNSPgjdqLeCodzJ52nNoqVVPQF2nbJ
         3HMg9H22iChotdcgaKejLdw1A88GvRDyGNM7dJAiRTeUd/Ha8QMN1ldeNnKYuWEncLIb
         7qgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOg8uJA66p6hCWSdZBlO9lXkSsbO0aVvTsTnVv1nNqr1QP3YhpxztZ0mViObGTbDm9lwLuoL/UgGzv2pPMt/Rq/3c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YysEi3y3QKnd22j5l1O8Nx9sCisvxXOVzIcVL1yPl5kt4e3zLJh
	CLlX4rpGt7x/qT58YdVA9NTul5yM5eNeNTF1Wr4xlISsxib0YlEWSDNw
X-Gm-Gg: ATEYQzy2VaAFJhEJ6P1xdF+O4SCnJ9W6ZHCCKimEHTBGOV4kLRRDroUW/j+5VBh6YfT
	yilApM7wVj88wBjGqlEqnxaucmNcv3dCz698qhEARmbTpgjj6jMSMzfUz7pXfMUSL3HNGo9GAXf
	mBZqs2ZqO3ZmFz+cFIljax5na0qh9EkZnXfTa+I0yz/VUgET5IfFOcidCyyluNb+8gxS7Kng6L0
	+Z/fFj+8jtqljZt0R+9YLa0cNzB8+MCsCeEoZrQW5WMLNMGUMPknX+0Xzi+fkOMI7X1IARR64Ub
	QDnSjdJ8rdzNJE9kApAIaKbqJzUIkFjmB5aVUTUq1jToq/fMQRPee89MWLkxsQea+Fnjzu0c4u4
	/Alq1s+VgN2YPLYoO0KJV1mjhWk1l3Vlv3a9Gychh/rY7JbjfeiowehLZm4SxCPdo4KKAkKTHp+
	/DNEc71Ovs01AH4xZByi9gDqxKMBrqrxw=
X-Received: by 2002:a05:600c:444f:b0:483:702d:2df with SMTP id 5b1f17b1804b1-483c9c1cc7dmr245357545e9.32.1772531710094;
        Tue, 03 Mar 2026 01:55:10 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c4489279sm350929f8f.20.2026.03.03.01.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:55:09 -0800 (PST)
Message-ID: <b45eb2b6-2d7a-47ae-987b-61532f40818b@gmail.com>
Date: Tue, 3 Mar 2026 10:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] wowlan-udev: add udev rule to
 enable WoWLAN magic-packet
To: miaoqing.pan@oss.qualcomm.com, openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20260303023409.4016900-1-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260303023409.4016900-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 09:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124830



On 3/3/26 03:34, Miaoqing Pan via lists.openembedded.org wrote:
> On some platforms (for example, QCx6490), XO (Crystal Oscillator) shutdown
> is prevented by Wireless Processor Subsystem votes on interconnect
> bandwidth and XO unless the WoWLAN magic-packet trigger is enabled. These
> votes are released only after running:
>   iw phy0 wowlan enable magic-packet
>
> Add an udev rule to automatically enable WoWLAN magic-packet support when
> a Wi-Fi PHY is registered. This rule is provided via a dedicated
> wowlan-udev package and is not enabled by default.
>
> Integrators should include this package only if their platform requires
> automatic WoWLAN magic-packet enablement.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wowlan-udev/files/99-wowlan.rules               |  4 ++++
>  .../recipes-connectivity/wowlan-udev/wowlan-udev.bb | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
>  create mode 100644 meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
>
> diff --git a/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules b/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
> new file mode 100644
> index 0000000000..ba41eef896
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
> @@ -0,0 +1,4 @@
> +# Enable WoWLAN when Wi-Fi PHY is registered
> +ACTION=="add", SUBSYSTEM=="ieee80211", KERNEL=="phy*", \
> +  RUN+="/usr/sbin/iw %k wowlan enable magic-packet"
> +
> diff --git a/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
> new file mode 100644
> index 0000000000..06664c8e10
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Enable WoWLAN via udev on Wi-Fi PHY registration"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

Here ${COMMON_LICENSE_DIR}/MIT would be a better instead of ${COREBASE}/...

> +
> +SRC_URI = "file://99-wowlan.rules"
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/udev/rules.d
> +    install -m 0644 ${UNPACKDIR}/99-wowlan.rules \
> +        ${D}${sysconfdir}/udev/rules.d/
> +}

Since it's just a single file copy, adding INHIBIT_DEFAULT_DEPS = "1"
could save a few file copy calls during build.

> +
> +RDEPENDS:${PN} = "iw udev"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124823): https://lists.openembedded.org/g/openembedded-devel/message/124823
> Mute This Topic: https://lists.openembedded.org/mt/118108140/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


