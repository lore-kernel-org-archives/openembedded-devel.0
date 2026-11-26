Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4143.1795720563618047307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 11:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FZcIeiEj;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so75486525e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 11:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795720562; x=1796325362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjJcVFjl4VfSgwS0qmxioFTNj1Fqe+tFH+cvMWzEeVo=;
        b=FZcIeiEj/9ju0PVBNbsEf8yaThuiDxUNXxW9ASpmEi6QoXcw2XSDFIcfM/4kEO5gcx
         16pfWz5veKO3jJZh8mXF4WMFBkbewOMxlBKwQTBRGgiiZkWCGdBm9lcSfzVHyUkUE/GH
         gEi7qDjqa25hxZMbRmHT5FoXKTlFzFEPElJUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720562; x=1796325362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjJcVFjl4VfSgwS0qmxioFTNj1Fqe+tFH+cvMWzEeVo=;
        b=ES0rtHsp7ONpsJSNmWhkkZI3VclNgllQ6SQV+xZ1bQXeT2JorLaxbhpaEWl+XtBENz
         kGvcXzp1LLNmNl4Wum16bYSnk8VnS/wXayyphVzMiy2qQt1k2dbZ39vkqCBfggunp8f+
         a3vWiA5ia/h0CgpeKHIqLo6L3fHJ8dCiioJPKH3eKG3ZoxY1mgDxpP9cH5VO1D+yKrZt
         dFZj9C74ToASnvgCjOYX615+p/mlEDojN1kjrDuuoEBU9u4ePakoBRLGugcRn3S7OB3F
         Nd4/+UPBOHMtmCKn3SFv+DIRCwGSzzUSpFXhtFS/FR0mlVZuCiou/APXLKfpr2YUfkvP
         P+Pw==
X-Gm-Message-State: APuU4Z8CFX1DDmN9ShOKGZYKYahWRKZ/D7QDcZ12qGxmQWSY20gmwku2
	QkIaoRlVLdSGiy1x1cjb9YL5NDF7hUnx0DKybMJu+rSl/eCNbmq5DgD4iohT14wJ3PTVzIwguez
	qpu6Y
X-Gm-Gg: AZFdTZdRfG/QXNXcQXxUxc7s9dc0twByBfkuKDFwYCAcQkB0xmnyWWbiTfwCwtzcGKG
	57v74k2/H5QRxrPXWkU57y9hfYkQu7gzrqtry8SI5bBdXofTnGA4gFppZtB271yq+l88HUvtuND
	CNywtp97z5Zko5EI4u2QwE1GSOGPoLrALFMfkl1saZ0I3yviC8s2ucNbNsMay5A9uuqVkR/rXO/
	YNVRAYNATu9iTvgXeMIrL2F+ZYmcnLuenVr2CnuCT+r5ia+8fXRzyJmxNC0Iiv1fFrdb/vLlcS/
	joLAOYbCbyNPezdQG3EL7a+42gXs21gwB38PiRLwaHWju2wRuKvE+lPUFz48oJoW2QMXuIH3r9w
	qSO6u/41J1XOTrUVDNTfT0BdejuJzB6QFqTj/sxhocPex7W3TAiiAeCXM60BKnh7HgLK4/ZuZHw
	scEH3vWK/qdoTWTwgCaZN/Hi+QYQQMOQ0XFF9bRRapcKe0fQFgIbaK03eIcauUiT2HsKs3+U7Je
	k4eWxDfauyN1x7PDAKCJZIAUT7pnady+mFZBbNW9vLI0yTgcSJzEdP3BBJR3bmZw/h/ASBiohke
	vsEYeowYN0g6BEAme48kGpy2jJjxogWj8ga89eUXRV9deDhiLZoZ94xJlHScqgfRQdAWus9Tlyb
	SdpaNVwc5L6fJ10xJLjbBpYT6sgmC9RR3rm8lasqmA0YlgdnNNgOVYQ==
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr475961805e9.20.1795720561660;
        Thu, 26 Nov 2026 11:16:01 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm697871515e9.3.2026.11.26.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:16:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-semver: Upgrade 3.1.2 -> 3.1.3
Date: Thu, 26 Nov 2026 21:15:54 +0200
Message-ID: <20261126191555.7597-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 19:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133091
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.1.3:

- Security fix GHSA-3qgw-g8j9-rcg4
- Fix empty-input validation in the prefixed version example
- Fix hash contract: equal Versions must hash equal

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-semver_3.1.2.bb => python3-semver_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.1.2.bb => python3-semver_3.1.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.1.2.bb b/meta-python/recipes-devtools/python/python3-semver_3.1.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-semver_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.1.3.bb
index 2d2f9f2bd7..8268095a4d 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.1.3.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "bea193552413194252d33ff26ce0962b76669bd1c6fb17e8e203ac37f072feaf"
+SRC_URI[sha256sum] = "87c113ec65f76e40fa471cce41041382cecf8516240d97e0d8b29d866a0557d1"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

