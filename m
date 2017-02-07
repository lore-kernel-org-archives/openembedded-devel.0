Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3763F600E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 05:10:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 194so11024491pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 21:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ikOEw+0iJ3yBOkEqY4G//KJwqCqSb7qI7NSDvoMOPvI=;
	b=jTLAdtdFDG6hDs9/CeLFdSRjB7k4BpGbC/KYoPaPZYFZhE44Y1VKj2dVaDNNJVYue/
	fgLPYD8h+y05b/P9hGfDZVsQLqJFV9MxeqPmnPP2v2YUIl9/WGSQTytnSQTAm3T2Ax5j
	AC+8e9Kw6BX2EdDA1ENpqytNQKE6IurRY6N90fd4jXO9ASF1RYKrmbBDy1o338kcdF1o
	23HJKWZmPGAsQyj3FXrBMp65DKiyDvCWZ9+2ETek8WxCAi6Ru1/QlglgD6g9MNIEcSHq
	SNsPFkqU5gxM9O7YwO4+h/NLo8sSGIlgnDHf51BnXrTrzmRWQ3PsMyi4BpA18ljh3XQQ
	tr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ikOEw+0iJ3yBOkEqY4G//KJwqCqSb7qI7NSDvoMOPvI=;
	b=LXsqrlf2sye5CGW8TuzuL3JxZJJAqWHYadOdnowOITvLv6Cz0S2PL8wjeMYLnclgFi
	YhwbkGgHCvPNLMsLtMhy3PIY1pEtC0Vn8oY0HQybvMLo5v+ZrFDjqsHgLxRG70g3uSE/
	3WsMtM1FaS1fglJ52z3G//3wldFZ+I+GlKJgwwIMpkkkzNrfcVJ2qEgZF8TZ6z6QTBjp
	ITIovs9j+rqdNUaR9Hvgsu/Sr8Hp+R8FIb9EIpM0J2FpGB341OncVHbpP1mi3NZ6r8Fd
	juYyvwwLtfjlJu16GwnHNG2d+LSZ3iPJ748ENvqfvYfpRH7kQ50yHWF2yDb104CbI1gS
	zUfw==
X-Gm-Message-State: AIkVDXIoKWAkRw/RwYHMvq/VXEEfuBSKYNyNUyGPgqGF9mdehAldDe+T8m6RdeR7C+nCtg==
X-Received: by 10.99.4.71 with SMTP id 68mr18211924pge.77.1486444241199;
	Mon, 06 Feb 2017 21:10:41 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id c2sm6670478pfl.61.2017.02.06.21.10.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 21:10:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  7 Feb 2017 00:10:38 -0500
Message-Id: <20170207051038.1469-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH] lm_sensors: update SRC_URI
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
X-List-Received-Date: Tue, 07 Feb 2017 05:10:41 -0000

RROR: lmsensors-3.4.0-r0 do_checkuri: Fetcher failure for URL: 'http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-3.4.0.tar.bz2'. URL http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-3.4.0.tar.bz2 doesn't work
ERROR: lmsensors-3.4.0-r0 do_checkuri: Function failed: do_checkur

The project moved to google.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index 8215d90..38bdb6f 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
 
-SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
            file://fancontrol.init \
            file://sensord.init \
            file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
-- 
2.9.3


