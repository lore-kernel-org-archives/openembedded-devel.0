Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33668.1794851718939943637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oR2LKZcs;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6022227eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851718; x=1795456518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThMOLhZ9Y88Uei6UOmGT81TRqpFoFwncAW49yjEBkNs=;
        b=oR2LKZcsCHVuEspanFNsTXUcYKk2nMyFiAP1sb1oxtXHo66Mu/q7Xj21n6SzwpX0SK
         s9VZjCLNMonZI4eW7OCRAg8wyHE+X29mwBjOcQKIIoRymvUusnNIA4Wuak+AOj3qQs3X
         nH7O8tkXXSWShZb10YMlidcNN3K1x5AZN2I96/mF2BkR5erDWNVpPSGKMoEj7+lZ6q5Q
         X9FtxkONKpuNXe7ei11COG73ofuEdAijvIGNc7QvXumNcV0HeQgUA1OlgalzR/Qu7gjw
         gs9wg/uXu1yByoYpzrfZg4Eb9eZx+MYgD78e1OkyAY4jLnkYVzGHHIBdG3TIfhLacQue
         VJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851718; x=1795456518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ThMOLhZ9Y88Uei6UOmGT81TRqpFoFwncAW49yjEBkNs=;
        b=lh1QhuxN4spv0K4JBtV9hm2XjtMOEF7qRPnmrXdTOA5ZHRklwGKRpWodHzfzi4m0Nv
         OgoObeCxCThb+qprfxXS15nmAz05rgrCM/C5sG8rqz8Z4a+efpsliLOqGQ9mr+Ku+QNI
         zVRatc1/FUCn5o9LM6UpABy6WR6FYRFNSbe60afHaPNYTDlZyCAjmbKpNu43tmuHKzNS
         cuZ+ypwMjsDbNXfgOSCwetGN6yYql7P8gLr1WYTg/3Kc3JCYCb0UHE5DXNUIY6GlbZ+Q
         zmL5tiOPYsIXj5Du8cU1tr8WmYYgI22cox9vCvPUacKgxyjOifF6KZzAvFm2wK8gWMpW
         o+6w==
X-Gm-Message-State: APuU4Z/cWMHLzCq82IITBKLRm6XAq9EqLv7obI6kOPx9JTp916evVgmE
	N3A04SzdgRSghZk2Z7p1BPtjNfmlVO4YQ6KBcCxWfpPVvzLkGhUaHtC3PzAJCF/4
X-Gm-Gg: AZFdTZe8lkg2wJGkjMGmDdMgqiF98xz3Ws2c2H2omntyEEz5Q88yJjU0qjUjjzOwJEI
	HiS7LKR022Y3R7iSg+dd+6kfoSafD/V7tiJLzE7RCMFCxkMcjnjQtT9nioE8yO0cjL/AkqbofQl
	QqIaMcC4rHBiijY3TJTqTkWYxuSeK1nTcOTh4gnJtyWFH780S+8nEHwQkL0aCTgEuYX9JzPaVsD
	M7B0o/a/8F65aMAPI9T/fEpOiUGuhd8jCwh5GD4op4OiUoDZ6vtGjnp2cp+HnUeXlarroOhBai6
	QFSz57cWpmofFH9eEr37s1zM9iJ1Ve6OjVKQ1XFBFLwjWYgpQ0f/sEHBErOFkGKCNLbV4fHvRyT
	mxbMgOMST0bX8GaX4WAkQr0omvkGpL2WkIOyc+nJVzhtITJ8Yhh49aGCm8uF5zo/RbBq4/Jd06/
	oID6Aw7Ak7j+FMkmi8HDYxY6ITP/z6s3GLjzRIRaJyHObBpQm9VCZPEJoXz+DudLHXmlMaGLoBl
	YAQO8MrtYZHZdP3+eCFkWYUdqwZrzIpUT6ahl28i9m177AuNIBl8885FOiCN1/DawE3O0+4qP/9
	I9RCTrUUTZjcR/HIt+5grmGbs5UTqVT4eQpwwEe8UhVsmxhzU/o+g6RzdZzgtGfpAWcoHiiL0O+
	MV4SRiCpgjt8aMwuZdpFadmsXOM4fzvnWIZLR/8Kciklpsasbj49reRl2PeqxjC+9UrwVTkmUyQ
	Uad9sdcDFL88TrPTKJADLA8eMtWAxKu7CVZBvCTiGm4CWrVfTqvB77F8jQ9kkWTNjeRGWK2LUc2
	xfKVlxVs+hY9RICSqBRmphOF+pHkSqUErvNVrsxKGRCwcO9HdfIizq9AfTu4ODSbfCzuRBya34J
	t47G
X-Received: by 2002:a05:7300:f590:b0:37a:ca9:b661 with SMTP id 5a478bee46e88-37a0ca9b92amr10753686eec.22.1794851718213;
        Mon, 16 Nov 2026 09:55:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 052/105]  python3-opentelemetry-semantic-conventions: upgrade 0.66b1 -> 0.66b2
Date: Mon, 16 Nov 2026 09:53:04 -0800
Message-ID: <20261116175359.342679-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132508
Content-Type: text/plain; charset="utf-8"

Changes:
- Release 0.66b2 of the opentelemetry-python repo; no change specific
  to the semantic-conventions package is listed upstream.
- Repo-wide: metric cardinality limits (default 2000) in the SDK;
  traceparent header extraction limited to 512 characters.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ....bb => python3-opentelemetry-semantic-conventions_0.66b2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-opentelemetry-semantic-conventions_0.66b1.bb => python3-opentelemetry-semantic-conventions_0.66b2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
rename to meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb
index 44a333255a..f330ef4464 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b2.bb
@@ -5,7 +5,7 @@ observability framework for cloud native software."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "497ca63bf383723411e8eaf60c8779e9877633c936bb641080adab59d0eb6ec8"
+SRC_URI[sha256sum] = "7da5f1a5dc4383eb66711d4d3d3e71824d9403ac1559fea021cc103c1a4c4976"
 
 inherit pypi python_hatchling
 
