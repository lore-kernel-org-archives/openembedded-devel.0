Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0510D6554A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:32:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.53898.1732645969192399840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVCMG+nH;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3824709ee03so4286750f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 10:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732645967; x=1733250767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypFWSEFT1fdBPQc6nP6U9m0As5nltJC27zhDD0TYEpQ=;
        b=HVCMG+nHDviCav691ZKrJWXiN4XdS0u5wOIqq9WuQIHrykXaPqpZMYvZNwXS/R+DBb
         9ABfVcW4swMtl0kcJqkmPnGdkZe5a5XWS7IgExOpk5dSOAF0ZKWgeUDf/BvnrHIuWwBI
         S5OsqL+P84abk4jS2vea2GbGCTFSaVeem1TNsb8VL6nr+mIngzmWLHMQ1np7z2PQbRkA
         yvTcEMy8RYsFPf/LjzCMPDqQ1pkqzVLO8MdRMn44d57ie9YmfU0INwLjToId7B1WrPk6
         DmdUmAjTfI/simC+TD1jZ1m9TLwQUb5kXBxGgzCcxhAaDB2BXVgP9DgCIUIObVlQ8Uk0
         erRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645967; x=1733250767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypFWSEFT1fdBPQc6nP6U9m0As5nltJC27zhDD0TYEpQ=;
        b=ozsQPokLmpj24AH5iCLb4C4xdC/JbsS7DRL1+nRPx0tYsbIGHlDzxkEqlUffQbgIqH
         Y9mx//RZ0bPZqtle5Bv7+yS1voxMFY1WMa15R8szvRmi+2tWRSWQuuqu1K5cjd/ubd1c
         4MUDwUqLQT+cR0AnucY+NnMCJSQ/h1xR/xcNW6qsftn7y+nyt9M+pXpmL3rSsogMLlEe
         r39jx3/K6U72dJEa7GZXQ2XnprUnrqEA0iL4UeyL00nKhZJut+cCarXbfVsrvJOOveNP
         IsFofhJlQhFxiTdkHHSBfFF328RSK5WOYKp8w+zr/hlMNFqyOCAmarSoSjgptkapz6BM
         eX3Q==
X-Gm-Message-State: AOJu0YyvJlWbJz0WLpqnFRwr3YHJUIIiiVkPymHqHey3Nv2/rJsLG6yH
	7nwaO7WlFrTCY6dftmrL8ZYP2s4vW1NMIVdWh0KKnj5vf3UhjGtGcBTkFA==
X-Gm-Gg: ASbGncvL6Quxrpgthu+bmGiyOpk7bIwwKXp9jWNrrN+8MQ3LInnrNmlgLYeS0KkboyE
	cYEwJOiDGaTyluRCT/rLt7+4cuPUm2c1AyAROtuxljXQwHBSsc2VSXBjFCX2mKIcyQctUIPXb7V
	hQqTyz6imbJHyqJhORii57TAW6jwxvN1pfxtfr+MLXz8MNnW6HtOb9vNUu9B0JjhPSosMKJZL54
	OSuz++wLHOXbCx6RTzoGji68/2CfAOHl9/efslMn691FH+jVcdgdCPBdhXXraJBLVRWExzz6W8=
X-Google-Smtp-Source: AGHT+IHKgkBfmKa7F2BlHTZLZZmBL/6vWp9/fsQm1XG05zzQfhxhCBl2MtKfCitYMNaCTxLrln7IuA==
X-Received: by 2002:a05:6000:20c2:b0:382:49b7:cbc0 with SMTP id ffacd0b85a97d-38260be6237mr12844251f8f.52.1732645967047;
        Tue, 26 Nov 2024 10:32:47 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafedbcsm14176267f8f.41.2024.11.26.10.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 10:32:46 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-isodate: move from oe-core to meta-python
Date: Tue, 26 Nov 2024 18:32:34 +0000
Message-ID: <20241126183234.7438-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 18:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114077

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../python/python3-isodate_0.6.1.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
new file mode 100644
index 000000000..293fb0827
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "ISO 8601 date/time parser"
+HOMEPAGE = "https://github.com/gweis/isodate/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c127bde9"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-numbers \
+    python3-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


