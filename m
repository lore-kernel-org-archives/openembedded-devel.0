Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 512AE770D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:45:35 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v123so2201343qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rn7B+cQ83KvMuTywUbbdtEGjm5x5HnmlS9mVYUrIAF0=;
	b=miL009D/fJOuzF3+7B2FfEY0GM9UbkBQoUQxyeDbUu3m0lEdmUU05Iedg+rPiRuthj
	FZ34glAO64ouX6yldZAi2Md06ohZFOhATmDWtzMyuvj17+Ekm8BpR1Iibsb7htwWUnJj
	3aC8XPJjNLHDF2HILmAZSF67M8YS/nKOpWG5QtCVF64cJT5Hrs1sZGcBcA3j6whAzSol
	zJhHvHZcVhAet3RRZqixaGgIKW0zaAzbpBTxpQJObu7uCyjwadoKXvlDz/vrrBfAvavs
	wk6XDL13WwEVv7nGpIz8BvP776WqxIQs8qP4NoWPu0y1Zrs54U0/ISJvZXGlPSPuKi2D
	s5xQ==
X-Gm-Message-State: AEkooutAM4YpQRWx94mioMRCqKAPSCugaMWWD/llZRjwBU6RqKMcKGc7FNdpBZTO30a/RQ==
X-Received: by 10.55.212.200 with SMTP id s69mr13182892qks.166.1471016735755; 
	Fri, 12 Aug 2016 08:45:35 -0700 (PDT)
Received: from argos.minotaurinc.com (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id d2sm4687139qtd.44.2016.08.12.08.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 08:45:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 11:44:35 -0400
Message-Id: <1471016675-17996-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-certifi: update to version 2016.8.8
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
X-List-Received-Date: Fri, 12 Aug 2016 15:45:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2016.2.28.bb => python-certifi_2016.8.8.bb}       | 0
 .../{python3-certifi_2016.2.28.bb => python3-certifi_2016.8.8.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2016.2.28.bb => python-certifi_2016.8.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2016.2.28.bb => python3-certifi_2016.8.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 0fe8b15..8c4579a 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,5 +7,5 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "5d672aa766e1f773c75cfeccd02d3650"
-SRC_URI[sha256sum] = "5e8eccf95924658c97b990b50552addb64f55e1e3dfe4880456ac1f287dc79d0"
+SRC_URI[md5sum] = "b57513f7670482da45bb350b792f659e"
+SRC_URI[sha256sum] = "99864ed602d8a9d212e339b15ffa438895002eda7b7db20dca5309dac9605ae9"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2016.2.28.bb b/meta-python/recipes-devtools/python/python-certifi_2016.8.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2016.2.28.bb
rename to meta-python/recipes-devtools/python/python-certifi_2016.8.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2016.2.28.bb b/meta-python/recipes-devtools/python/python3-certifi_2016.8.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2016.2.28.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2016.8.8.bb
-- 
1.9.1


