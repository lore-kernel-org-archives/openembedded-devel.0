Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4668C02190
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.15101.1737828197523476625
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELebAkiB;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21670dce0a7so64858065ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828197; x=1738432997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCVLp3tIOElgqAPs4lfJAFIcIiU7ibeVm8+1IOVl/Ws=;
        b=ELebAkiBzUo7LVrVD9TKaYUxTLTzlgZUbnA3yScT5W8gWY56+TrzIVlATyYWiLnfPL
         1ItBA9J5z03HhdsLWbr68gWiDGDNO+Ri17RzLuUYoLh73InAiIZecKkvVAlUvKsBverK
         8Q49rq/F0TKC1/8a3PmnzE51kPyuOKkWcRaA2wyvuxiACOBG0sHPk/pQVB6A0DTbwy6e
         sANAASvEcG2zXbHP5FJKFuyQSfpZMS39ePAs9QvEtHNqLSpWJrRf4BYtfCbchBEN28+d
         hHN7q1nzNTLXBLdfYSQsZuTfEoz7iPvRkBtawPYY/c4C4D8VORGmnVLuxrfPcf5IHWpS
         AdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828197; x=1738432997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCVLp3tIOElgqAPs4lfJAFIcIiU7ibeVm8+1IOVl/Ws=;
        b=QlGbHP9aPTYzpA8KPVzl/lVMT2HCCXAOgHxoHVX9t/cS2+5AEHsSPBUcAh6ooOcVgx
         PL3vHWgR6QFI06BmK3uoVwvJoN7REehU5XDr97hnUNP7Kuqwk0+CkTm3MDL6H5qDTOb5
         bG51x4wTv55l1aVdQh40TS9v6s9xwmwRqrynymemSIWzwHI/88XZv5o0R7dZ2WgC07y9
         /PT/eUBfInhQpefA8ElvlnPaQQTAAfSEhmttKPyzJ6h/bV+ICKHizqkKALB0FKFIRZ73
         BUB8A62/UZQOzL4TRZw+jScbJPMmJZr9TnIFPCftz8tMRcBJ4dDCXpglnC0BSAs9+YqK
         vgeQ==
X-Gm-Message-State: AOJu0YwVerr5uxLpWFRxElJDng6E5uACmKhCGu0W1v6dxLU7iPPNApoe
	8LAhLjufPOPlhYCCYh010Uns/TnCQ6hAKYBJC7mzRnNwtbTwlJVhGQAdmg==
X-Gm-Gg: ASbGncsD91eBX/tzG2alHWLislfUbvl5+HPDzFtVztq/73DTvmfWAdEePsoUMRwn5BZ
	RJLjbUV/onPfX5P+tT9Bprsw5LLaaVWW/ABHgqSD9PU8TZjtQuMAAmFQcbLj/r4Ta41eWd9MV2E
	Iyj+L/fFPKE2T0Uj49YBJo3Or86UEjsu5sQDfYDQL56xzyjH4oZX6WlBZRkqnJ+odiT/ftcK2tw
	dWHadDT4T/tv5pRqgg8IELfWJJwohbJfg+yE2PTDdAtfslTYDAXlqj5hVJ3bs3Udcpe3lN3LuHC
	yjMd1gZamoOMWXKbt8J2Ko/rkQ4=
X-Google-Smtp-Source: AGHT+IG3BvW+EXYaFIqufcCFzK52+Kp7SHKOrbvDeMsnBQyACpzUws/C+3ZNs2P/lWgV0Eb7lcQAkw==
X-Received: by 2002:a05:6a00:18a7:b0:725:f376:f4ff with SMTP id d2e1a72fcca58-72dafa46e92mr45179505b3a.13.1737828196794;
        Sat, 25 Jan 2025 10:03:16 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 07/14] libtinyxml2: set CVE product to tinyxml2
Date: Sat, 25 Jan 2025 10:03:01 -0800
Message-ID: <20250125180308.7856-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115090

From: Jörg Sommer <joerg.sommer@navimatix.de>

This library gets tracked with the product name tinyxml2:

https://nvd.nist.gov/products/cpe/detail/5A6C04CB-E6AD-4740-882A-34620AEC060A

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1c60b8ccf7a011fcac05714fc29d47bbc21c5ea3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index bcd309282b..2ee43ebc03 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://leethomason.github.io/tinyxml2"
 SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
+CVE_PRODUCT = "tinyxml2"
 
 SRCREV = "321ea883b7190d4e85cae5512a12e5eaa8f8731f"
 SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
-- 
2.43.0


