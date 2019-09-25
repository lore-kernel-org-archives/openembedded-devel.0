Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 349037E6FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:14:19 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so7201040ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2hfh9+/9Xa9Bwozmi32juWJBXVfQ+0W+sTONHVOZDt0=;
	b=VxXyBut38iFsKgEvqWsiWXYqc6G7xfIC+rOJP8ipsozfhyXnArn851AmKZ8XvNm445
	XxYnZmHL9nEbTTT9zMQZhCpLirdOmszmp8I77Rm3f+V/xrEgR3Nd3tUk0xtexW7RoVRa
	+/pfn4/BJG2V8CkVK2L96X7VD1JxJxiiXrvBTzvLPO07PK5TWJekPcW3pHpe7r/+1iAk
	tSl0/ifScxLKOMJNnR3adRjJ7KpI3w8YqQMPv/5Iyjjhj7E3DeeI7NTiRSlS2WFRHxjO
	9L/wehjx087oM7+B3uTv1qMn58Omf5cj+fTliWuaF2SDJpdBis1bFwBcwUThv8gnDiJu
	wXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2hfh9+/9Xa9Bwozmi32juWJBXVfQ+0W+sTONHVOZDt0=;
	b=GKv39u/Vg+J8IwSjlskju9OvBbeg2m3BRUjM0oBhMJj0js3yH8o8+TdXKJ/4gqNIC/
	c8n7KVWSmUGpxwIejZESn0nhL+x4qBdhLisqAfZg2m3RO1T7TyKrt2lFIqEkEKjB7leA
	rRUAnFmE0ByceHXfKEpY3ToRU4hi8Uc/3xQKgiRdWPHS+LaaiqphG7h6OhOEWpOKa54c
	RIrGClxTfbx7xh9dX/qYmkzZmR0s4R4yn/Z64GSWEfjS/wvow+X1nTS3A+/hK3xR35qA
	SLiJg2AV+PG1XRgmtKQrpnqScnz3C4GTD4XH5Sb5RL3XQHFLcTW3qwcpjgzcVZEcG6XO
	ve/A==
X-Gm-Message-State: APjAAAWG27X4O1FUf/azn1I7661su6ccMHNhWrlvWpsdz64AuinfZXCk
	bTEesrjztFhhIsYrdRFKuwxQg/+RB+c=
X-Google-Smtp-Source: APXvYqw9Lz/gK5U7hACQ7WGN0pb7gtAflIsMbo9j/hFtJr4PGDQh9qH8NbNngmITRTwTmz/bAE1uEQ==
X-Received: by 2002:a2e:9015:: with SMTP id h21mr231421ljg.234.1569446059700; 
	Wed, 25 Sep 2019 14:14:19 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id z128sm38708lfa.1.2019.09.25.14.14.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:14:19 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:14:12 +0200
Message-Id: <20190925211412.23859-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] proj: update to 6.1.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2019 21:14:20 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../proj/{proj_4.9.3.bb => proj_6.1.1.bb}                   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_4.9.3.bb => proj_6.1.1.bb} (65%)

diff --git a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
similarity index 65%
rename from meta-oe/recipes-navigation/proj/proj_4.9.3.bb
rename to meta-oe/recipes-navigation/proj/proj_6.1.1.bb
index f45f8948d..4f53aa46b 100644
--- a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
+++ b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
@@ -6,9 +6,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
-SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
-SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
+SRC_URI[md5sum] = "9a82a3174cacf319d94360a759fbcc8a"
+SRC_URI[sha256sum] = "5cf0a2360a28b5d724c53edbb87f3f3b14fd96001265411ac4e56f369e2d503f"
 
 inherit autotools pkgconfig lib_package
 
+DEPENDS = "sqlite3 sqlite3-native"
+
 FILES_${PN} += "${datadir}/proj"
-- 
2.17.1


