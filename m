Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22048.1794808958512916084
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bcATeke5;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so4488871eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808958; x=1795413758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iFGzUpYqWQFTkQGoa5fg+E+N84I17MvthIln4kUSX4=;
        b=bcATeke5ulSYgLUIg9cuw5maEdiNQeS6XGfu0lNsPWyLp76Fy3dytlxeWP0cN+5UJI
         TpPNgMgQUeBpyc7EkCZou8y4q+Wgl7XGwR7sYJ7vZd9lDl9BJuxzj7npBgogaPuowdwP
         mrzIAWGVt7o5uU1KlzgBCcXZM3/YGI3oVQ/PWVa4JM2TwbLWTUtvMSN0v6OwE/U4bPVJ
         z41ueuovCUaPdn0mH1OuiU6u4aW7eqBrm2vymZ8joDvhKsKrhljm7BgTNWvP8VVLPNKw
         iY+lX1Mc6r9uI+LFhd3mRWCB6mTVVMpVcBDZcMLmtkzjit8BqoLzMzbcprvSr7tF7l7u
         f5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808958; x=1795413758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iFGzUpYqWQFTkQGoa5fg+E+N84I17MvthIln4kUSX4=;
        b=HoWGs7Sixvt/KxhwAwvoTjfQ2ORh+6W1wCtNGDm77xyRASE8wNy6xx6vLKuh6qPyLj
         aQ+ryMyLsVxXSXOhc8Ps+x4K1zARTKriNcItt921Z7YJBVg0hDTI/aOw3m+l4tQqX+ix
         hnZnWfmggIhm5UK0W96E0+STejV1arraRV1KAFxabPGGCD3V4/hrfllXX2/hpAu6HSwP
         36lPVoqa+4g+GtudvHpcw46JnOaxxpZtO5H6G0h1ZZYL3Qd9Fr6IBO1fR5D63iNsU5il
         Ikqhyj4Ine5jtZCEku8LcyAW9P3MVbaz+vkxP+P5MJ2hcfGA9S1jiFOcPnapJOxeIN+m
         uA0w==
X-Gm-Message-State: APuU4Z8J8WfgljKyYFtmyens5icSbUq5ckD3hY27jQwakxTp6o6qe8yZ
	9GetS0YfKWP5Sp13Lu0GXQ53FkflcumXOozRDMRuL9/abx3YW2K04f0T6fRT7xuA
X-Gm-Gg: AYBFou1/y5+vXHdp+6JfNBrv0t0Plg2fJ1xo6iR6qSHwDYBYPzougCR43+8MjHA33GI
	bevpgxgLhGcSlWFJ7J0rCP4g8Iv+DI+mzigp40g+KgSlZpZ787YwU7B7Fxm/Uogp7LoWo4oMoTd
	em34+hP8gPk9TKNl/N00kEDHLCWB9RXgOHA63X+G6UCI5rT2N44+SrAkxIVHkUH3W8FZQwr26fQ
	cw3qNPg6QYmSRayA9u+elNxmqzS57bhzfZKmQlHM+E7p21CQX6cObZ+7PSsBbddsmnmAr3Phiiq
	X202/L2R6V9KKRbZHMpSrZZYxeT7ZhAnSKs58kftH9T7xJT4waInY+RVer791mKu9tixytHS23R
	aEc738UJqx6/Mf3j+oyP8bLou2LHARP2jmEZi7IOBQ0AbE4Ue+3eO6FfSJFbuYOnTkhrvK2Y3XD
	yOdZr7dRuXVvt5XEmFAZsvRaQ7v/WQicV9wQsX1HoXx+ThTW9m71jmW1caz2n+5F5GbEfvs7WIm
	fEByYIRNUS9MayGUwsMIX13IuOqJ9WqE1amASmbyQvmG7gGz43IZ2MJUAfhqv6X0R8ygi6W/PqJ
	TGspVBZINyfg/Luypgpd1M0AJ9rG282T+LbADVvlbtEoNHrBHnxsWxY+3PVYI5GeNFL+WxrpRhy
	PHfP4AD/kiBJExs7UUIdZ5s6f0FnxSH6Kqk6YFofQHfMMoiO9BTIT+8Lq2yOB1yTTOfvd6cDT7w
	RrPBjvjp62cwXvbD0g7nUaCJpqgqARz3MVNKmMQK4HRpc2TLylhIXuAVoCY/Qtxw4iiSJN/DKQC
	B0RwhPElqi/hM5Ro38jsvAaULO6Cfmb+kWnRlCmuzl5POZewS8IiLKuQufqL3YwLt8Cx6zF5U48
	Xl/u
X-Received: by 2002:a05:7300:8a19:b0:377:1bfe:14d6 with SMTP id 5a478bee46e88-37965f9d236mr8533471eec.6.1794808957872;
        Sun, 15 Nov 2026 22:02:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 23/30] imsettings: upgrade 1.8.11 -> 1.8.12
Date: Sun, 15 Nov 2026 22:02:01 -0800
Message-ID: <20261116060209.2916444-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132421
Content-Type: text/plain; charset="utf-8"

License-Update: COPYING was updated to the current LGPL-2.1 text, the
license is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../imsettings/{imsettings_1.8.11.bb => imsettings_1.8.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.8.11.bb => imsettings_1.8.12.bb} (91%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.11.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.12.bb
similarity index 91%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.8.11.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.12.bb
index e3fe0241b3..3ee6361205 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.11.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.12.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://code.google.com/p/imsettings/"
 SECTION = "Applications/System"

 LICENSE = "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"

 inherit autotools gettext gtk-doc gobject-introspection features_check

@@ -20,7 +20,7 @@ SRC_URI = "git://gitlab.com/tagoh/imsettings.git;protocol=https;branch=main;tag=
            file://imsettings-gcc10.patch \
            file://0001-remove-man-page.patch \
           "
-SRCREV = "7fadd84fcbfe6c321dbe1c97b50cbb70efe20155"
+SRCREV = "e2d473f3a307d87d3f3bdac1412edd252165493b"


 do_configure:prepend() {
