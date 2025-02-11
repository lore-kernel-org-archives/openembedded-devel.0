Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F7AC021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 12:57:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.11601.1739278655949093871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 04:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Fk+5kojk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2895933f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 04:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739278654; x=1739883454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zln5aiHib7WUhSovCu97K3y6kjXwx29oKKOn8j5UrpY=;
        b=Fk+5kojkwRbw264xbFSATrU07AIwNvztApfNlDq6Id2xPHN5Iahlk/7Jg0J2jbEHJg
         gT+HJK+RMx1EI1RFEw85j3nONNJVk/xq3HWQvwvwAyCooXqW6S9BcewB34tYb+GZSTEf
         eKCUnT1KZ+1tLM5e3M6nVDRdHHyejpxOHN2Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278654; x=1739883454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zln5aiHib7WUhSovCu97K3y6kjXwx29oKKOn8j5UrpY=;
        b=eZDX4sw1PW5QbbiSL99AZ6z8bd4mNxBjQOXsGCiORh3rRLNvHLKSyaJYxo37Q/4OGP
         xfqqWQDZBJO/4JS+VegJrwVcpPPCCLm83xmi3US0YPp0OJVTV+g5rCMh8o5949MN3KEi
         uR4U7EipO/HixT+tcZwzg/tM2c7OwrXW5mWgN/wSKDgRCVhw/VybYd22riAqUP4F+vdq
         R6Dyn9hrxsWTjrsYPv0RoWR+H7+kbQzLhr/5U/Ki8vhIBV7B3o8Y7x5CiWmhH1Sd7K0W
         AYY6AFC4CQNrty0QwwRUo/NbFNAoBcB6uZlqeUj8fI2ESnJO56Cwc/B0E524/Z9+1ndr
         nQOA==
X-Gm-Message-State: AOJu0YxT7WIR4ofqoDalEIGVUusRXdCBBfadp6QRbiTZhWBffGiXyri+
	aBdDrBlZ+EUm8Z+M3HU6Mn2C1QQXf8GC4opvg0Y4Pr2sW1c3VG9ymPXRJftK0lCX1jEDPFMUp/U
	M
X-Gm-Gg: ASbGncviafjdU/Zq9pvI9be4/qyz1r7S524MRZPuenNxPgAkuM0waj5Z1HTQ+48xAnX
	BUL9bb/ZadElSPQg+7eq6ZqTXZPIe2mlXk+Wpxy57lGreUf53ClyK4+X8NgigwEsMD1UHo+mdjd
	6SE4rnS6UHx5vxzSsQfZ0FOuiZnGRb6mlEX8vsIeBji81yCl2x+RqRVR9nh2xn2xMVH27EOFrnl
	tBnGkWk8N4arWt+Xq19LzI6LGZBEtN4m4E4ING2BTDW5YP6Xc8WM8r1Z4I0prZNXsYcdlOozJW+
	U6k4H/nVmOESBXo8rhNkTO2toIakLw==
X-Google-Smtp-Source: AGHT+IEu+Evm32FhwmuvQiHX8AGwCcMafSIfzhEVtOy2M//ml1+3wMqZk/OGhRTm5Dt9VSZh/bdTLg==
X-Received: by 2002:a5d:5f85:0:b0:38d:dc57:854b with SMTP id ffacd0b85a97d-38ddc5785cemr8240999f8f.36.1739278654089;
        Tue, 11 Feb 2025 04:57:34 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm13929843f8f.6.2025.02.11.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:57:33 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-python-vlc: Upgrade 3.0.2012 -> 3.0.21203
Date: Tue, 11 Feb 2025 14:57:29 +0200
Message-Id: <20250211125730.3477099-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211125730.3477099-1-leon.anavi@konsulko.com>
References: <20250211125730.3477099-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115425

Upgrade to release 3.0.21203:

- Update to pyproject.toml build system configuration
- Update doc generation to sphinx-autoapi
- Add missing rtd theme to requirements
- Add defined enum symbols in generated docstring

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon-vlc_3.0.20123.bb => python3-python-vlc_3.0.21203.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.20123.bb => python3-python-vlc_3.0.21203.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.20123.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.20123.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
index 960da1437c..44a14348b2 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.20123.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "244fbb9e392a0326841fca926d6d12a2a36c546982191f493f148fa19e66b1d4"
+SRC_URI[sha256sum] = "52d0544b276b11e58b6c0b748c3e0518f94f74b1b4cd328c83a59eacabead1ec"
 
-inherit pypi setuptools3
+PYPI_PACKAGE = "python_vlc"
+
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
-- 
2.39.5


