Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37958.1795594124786752322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z0Hfg0cp;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so7038775eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594124; x=1796198924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qn5sBuk6ro28twrmxt43XQYnRr5yav90arjMIdlYS8=;
        b=Z0Hfg0cp5uhPTly+2xpLNYdMdfNCFpguoYPV3unz3tyDy+l+C4mTf1nYxihnuPMtRC
         4NXqyshdcCmJ7CvrGjWVHrQK999/s2/8EFQ9zkCyS50lnvDjKDS1ZK6dornGXsRva+jW
         vl6SfedbdxTOWiCUgFvdk/0TTZKVR41NuBrarig23pUvOroKcYofat4uJMd5h2vLKpzo
         p4oo88O70rb/yGv7lhWlWVt4odMSohJ+E+FFqYXVzIyGFTX3fs3w2c7oHr716xZdZFvj
         omRr/fKg3kIKcYCUYHrLrVl7CkH6KVlhq8dqjb4ZXYIe1kR68h00kAtT5LtpmFCEhAuB
         /gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594124; x=1796198924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qn5sBuk6ro28twrmxt43XQYnRr5yav90arjMIdlYS8=;
        b=QKKOyd2aw/eNlIYTBM5/udSjAzBBpYNRJedNHAa24PyfoFNyZD2oAR/IqdHCxt/MPE
         92f3PLbfe95/nNOoh5iYQLBaN4CgCsxBRDJ2ugNweaVwFqcUXjhuaP5oPM9bDRCnBCqj
         KtihFDX/yEOfPSK24jNxcaY7qoJ7TG854CuZa4qiA8Ldquma5dhYPXavY2pa2PZ7YXjw
         qM6YGfpeNMNVkWadhdoM7fTxZQMEcGU37pegVU4Ok2qTbJiUDHqWa7iU+3DlECnAfrAa
         R9faVhhwGwR6vYO3jEwiAzwgxtFFNdIg0CBeak5N5JXInzcPfDFdXeVulRIsB02oHSCo
         udMQ==
X-Gm-Message-State: APuU4Z/mR+SMI03VFcBSYVtP/YIzF71TeAiWsp0me2iq26Z/6Q/cJ27m
	sTtKWRp3tI+kNu91SPmoez9zhuxG2x0u5jPuc+e+RLofABkdzvt1imtqHXSzuRD1
X-Gm-Gg: AZFdTZcmetV0hj35r/vaaqyRvRBkiDRAVc+bu6JiMrnMRqCnbCFsbHWgRRXr8dB9uPz
	IWdB+7oSuGRId/enPHUH8HJSszs8Sser7d67SRs9rczhsA/SEDPmXl+xhheLI+dim9Sh8xbKmFn
	5psiFK8flhMBfnUP/DWByooEKavgLNpv1lcacRGmta4lhCJIt4sPEeH/bXBGtoKVSb/4hzcxcjS
	JPtnTUcbIr+1Ppt0qLnp9DCqoIpQ1e7trBY3g6ibnzkmNfX3nTr9VgJv4bYXJxPz5PQu1PzPAfD
	/x2O9Ymn8QWB6yvDbiAEHUNDsyTfVzMC+QeRYOAUFOOljmd5HaYjmxdnDFGDgHOL8Dsvd2D4P1/
	jYoKZIxZsLnJKfvuuptJs96JixaxapiSKz7EcMLNebalc8+HK//JKF8za1FDDfgM0UJl768AL0M
	ElMOKchizfFaZ21wWV1hB5mspMBpzSEgttkjl0ldhoO+hrQlJCejjLYnIv0H1wOy5gnqyWN8BKy
	ODxJY0umDp3TMkDIyEw76PHei9rf3Sj0cC6RriKhWvRJOAgJowQDTcXkXqHI2tXDudwN6lqMI8d
	ZR/+bmRah5rUnJmZyv/rEanpGhna3xLEFEm62jxX0fJRsA0FSHVJ2hq0jZzJ2Vw17rvNUggRr/4
	GOshFaj/nksY2TWweRo4fKcY9+gmmrXN+VavVkvGrNG4M7/9GfIKfxpib172kYAae4G6n2DGXrW
	0LsOJucf0hGjrStQif7Pr9Qj8PEhodiZKkvWI3oiQI311UdfvLsdf4DfbvAzFA1ZB9HQjXnIWRG
	l6ZhCuhLM+uhVJF5JAWLZQoVGBacwDIRuKhFPam2zAsEbRIEoziS1mqquKjCylhLYPWDyNI1Xhn
	V9vKOUxg/9LiVxpw1BIlb9LZfw==
X-Received: by 2002:a05:7300:dd08:b0:386:ce6a:b256 with SMTP id 5a478bee46e88-386ce6ab415mr1841526eec.7.1795594124101;
        Wed, 25 Nov 2026 00:08:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 50/55] libmtp: Fix upstream version check
Date: Wed, 25 Nov 2026 00:07:06 -0800
Message-ID: <20261125080732.2419614-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133053
Content-Type: text/plain; charset="utf-8"

The unanchored UPSTREAM_CHECK_REGEX matches any dotted number on the
GitHub releases page, including ones from GitHub's own page markup, and
the check reports 11.28. Match only release tag links (v<version>).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb
index a991c0a670..6d724b8047 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.g
 SRC_URI[sha256sum] = "74a2b6e8cb4a0304e95b995496ea3ac644c29371649b892b856e22f12a0bdeed"
 
 UPSTREAM_CHECK_URI = "https://github.com/libmtp/libmtp/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools pkgconfig lib_package
 
