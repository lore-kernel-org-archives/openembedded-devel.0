Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D9AE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 19:44:18 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.104.1734032649553793042
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 11:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29645a83b1bso468178fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 11:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032648; x=1734637448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0L8Hm6qqZxIaD9RkD2u/OPz5/2rHt7YrGpj5TpvpEA=;
        b=iinWM/x7pRLRIffV/lxLCvpp7cUQiep1scoYiDN5eerekMKOv61PLjb9XBkyVBM83z
         NuZRpp/ycAgrXiX3UolFwCC0NS99fRrydiVTZQVTCjrCCEcwSgZ+gUATHjSVgUBBLJue
         5j4/SM+LWNorDJK1CIhCCYjjwY4dVxqtXuF5sx+uSTI4QVwQiXUVhvAGKa2arkWa9w+K
         s+OL+/FHfk9mjbDmQM6KsnYHoYx7V5evI6nNp6qr3MYjEVXYuJh3Lt57Wo3fidZDv2Xf
         bXhIWId0sO0rABEYZ6tfO1irArIJO3nh9140ri7qGYHOe+Ovpe9sVs/1tWQpuyGt7Lz2
         FhdA==
X-Gm-Message-State: AOJu0YyvUSNpjcmPg8s/0JnSGOxqMWw1973u4sGTvIVT+ryoYA2deyl+
	cU6r3nW1XzdlfuAbd//s1by9qQj3FpTniFJzIpMUX0YQef26FWvGx9Ezhw==
X-Gm-Gg: ASbGncuWmvhLNXv42CjfbhC2eqJXa7oTj0PcoYCKFo1JBq85jHw98XBOnl145ueplhr
	uaEyrZ8HYH3YVQ9nfUYqZnDAk8HF6aav1ba9sfor1pFwiJp1tAw3lBzisqlR8wSCmU3EwGttJhO
	fd+CvSFejJsDv8Vl6irWcd3IRSwfMAQlSvlTDk37c0X3lB9Zd0KVzwVJy5a7zoqMsxSWUYVstJz
	SMb4eUcrDUDlR73GxFVmj9WF2X3j/iisooYQy070PdNjytBkcbK1z3YJUq5TmVHj/NWFPOgpVry
	VlaIMg0maqjCy72I86xS8vXt/w==
X-Google-Smtp-Source: AGHT+IGi/kDyCa2F9gnPSPEDmGF1VzJXypOqrikk6YnicZhP7ddd7xaIXC2bOrxuAPo3SzAqtC+iTw==
X-Received: by 2002:a05:6871:5d0:b0:29e:3eff:dea with SMTP id 586e51a60fabf-2a012bb3bf7mr4533510fac.8.1734032648452;
        Thu, 12 Dec 2024 11:44:08 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29fc16f4664sm2815543fac.37.2024.12.12.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:44:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-luma-oled: update to version 3.14.0
Date: Thu, 12 Dec 2024 19:43:35 +0000
Message-Id: <20241212194335.2708667-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 19:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114298

License-Update: Copyright year updated for 2024

Remove unneded CLEANBROKEN
---
 ...n3-luma-oled_3.13.0.bb => python3-luma-oled_3.14.0.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.13.0.bb => python3-luma-oled_3.14.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
index 74b9be502..a95254c38 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
@@ -4,15 +4,13 @@ A small library to drive an OLED device with either SSD1306 , SSD1309, SSD1322,
 SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset"
 HOMEPAGE = "https://github.com/rm-hull/luma.oled"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5ec447eb69733e20a55838de7e8cb991"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=95cba8b3a40c6f55d5d901980fe6e067"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7e2a0d6a4c968c64980255d681ec27914d9abd5a66a9019b289bf3ad050c2125"
+SRC_URI[sha256sum] = "36218565eda0614c8cf44ef42cb9a5904ddf808e4516e99ddae111fc93c5a206"
 
-CLEANBROKEN = "1"
-
-PYPI_PACKAGE = "luma.oled"
+PYPI_PACKAGE = "luma_oled"
 
 RDEPENDS:${PN} += " \
 	python3-luma-core \
-- 
2.34.1


