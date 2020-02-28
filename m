Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 41AAB61962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:15:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j16so2925303wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 05:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Nop+riWcBApL5UgSrX6cxTDiGPpx97iMX/Iio2P2EkU=;
	b=LL5cEMtjZCd5DHqYXqPf0OaUHpqmwWFsCrol0AyUwSz2nHBZYnBrkMmEQh9qhNV0DG
	jnLjgd96iaFDKV0AtBnIFDVBwBcyDL0ASSnQsflsXHW28N20gXL5CLONmXz3UITQnDfB
	176gW/Xwyk2oUMfSUQlnRU0Y3wr+JqA1uM90o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Nop+riWcBApL5UgSrX6cxTDiGPpx97iMX/Iio2P2EkU=;
	b=gyv0DUuuqfu5BsiY4/0eD5UNcWs5ZNt3PWupTkks3mQz4mwdi/U/3EhpJXZMECzK+g
	Q+MJR5MLyFIBCLmlWuXPgdme75gk4FU0V6YlXKp6Os0amAMnCWTejCHXyvSaRcruMDFU
	sdM7AV3wfaXqoTKhyorAUNXCXEBGK85GJtI998ZUtZWS4NSAOlUOpuBazFAchpKjmcOe
	F8ZFqT4Ej9dYk3snvQPCuzdSVlaGXl3yHSusqtC+JsHMc+MkRQUhqVj9pFxdkbaIgysp
	7Y3Lam19p3TmNClL/7zQ615DRaju2Sw/evWyFRkcK0tI1sGgXqJEI5xsjA7NxTO6UyT2
	Jo+A==
X-Gm-Message-State: APjAAAXYuad6UUQ6y13hDngVhjsDEBRgsRRyjcoDiJJc1ExCVY6lNrgz
	b1Arct7bJ4QMyUdB4Hb8gmphW0LtHRcLXQ==
X-Google-Smtp-Source: APXvYqy3EvLYgjY9tG+4Js7t7fJkCTZ8DLpFmeL+1ikjcm1Om4RQMi602qzErSpIy7zOSVCv0G6+xQ==
X-Received: by 2002:adf:a746:: with SMTP id e6mr4801743wrd.329.1582895734291; 
	Fri, 28 Feb 2020 05:15:34 -0800 (PST)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	f65sm2097382wmf.29.2020.02.28.05.15.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 05:15:33 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 13:15:25 +0000
Message-Id: <20200228131525.3587-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] lmsensors: Fix sensord dependencies
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
X-List-Received-Date: Fri, 28 Feb 2020 13:15:34 -0000
Content-Transfer-Encoding: 8bit

If sensord is removed from PACKAGECONFIG, the recipe should not depend
on rrdtool and the lmsensors package should not depend on
lmsensors-sensord.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 48490e8d8..890db55bc 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = " \
     bison-native \
     flex-native \
-    rrdtool \
     virtual/libiconv \
 "
 
@@ -91,7 +90,7 @@ ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} += " \
     ${PN}-libsensors \
     ${PN}-sensors \
-    ${PN}-sensord \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
     ${PN}-fancontrol \
     ${PN}-sensorsdetect \
     ${PN}-sensorsconfconvert \
-- 
2.20.1


