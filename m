Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB95E782CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 16:50:41 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id g13so4350295qta.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=8x7lwnNMqwJGC9+TIKgXsMg1e497ftOdgm5xFZ2Og2c=;
	b=1BvdKmkl3NGnNtVcDAvari2dBWQSiiKzC4jlTkMrfeC/mbSvyTbF8cpaLzZTB/sF9B
	+sCGZM0dGXlwLO0IRDEXyMzDNHV2jk+5vutK1iokIiqJiAFpDRIGeaRc3Z87yap7RS+8
	WMB2RR5N/4Zs/13o1fz5X7R9v4CGRMGoochzrgb4WRuciIHPCCm4gupQTU7mZHBB7bsQ
	JC4sWuIlFN8S11kvlXhbJwOxEE6b6n3qI2vuIfC5gnWNUoIPlOQc+jCPZaW5j7z/E9TR
	bVxgiex2TpBQOc23iiXpYUAP1bVmFAwfbvRZMBhQMRmmEM/JBM0xsFjH7TPa31UC4SkB
	O5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=8x7lwnNMqwJGC9+TIKgXsMg1e497ftOdgm5xFZ2Og2c=;
	b=uNtTSqR+Ko7KDdpdHmgrXZ61CsWCBfTDS2+MX47BkCaxzAYJfTFOBJDgMXyzEU7D7D
	IeDWuFdX/6Zw0vaiFKnyJ5/w5RQhFhozLfEdD+OJIemFpDEjH9Rde/xET2BYu4z653Zx
	dO6rbou6OV9umXqnF+cbdOqjM8V5UDAcJ7Tc+BLq54GW8X/hRNKZcf2TArAIyPqlSxwe
	0vkjWKaFqJ5nSy5CywlC7SOwut0GYq9FKy9H5V/wVCVcEc6r2sGxEigMobhaB0mM9xOj
	YQTk4UIlfvSXg1EoLyYP51Zh68odSGPFTdXj+lgIoSZz/IPmTxUrjeKj1j6fatzt4gn0
	cAaA==
X-Gm-Message-State: AHYfb5j6A+2ZZWK50SJbyHV6ijw+0ZF92x8sV9arn9WGraiHDGwpULBA
	zEYAfUgR/9gddclJcDc=
X-Received: by 10.237.37.45 with SMTP id v42mr26302217qtc.333.1503334242764;
	Mon, 21 Aug 2017 09:50:42 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	p205sm129521qke.42.2017.08.21.09.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 09:50:42 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 13:49:59 -0300
Message-Id: <20170821164959.11955-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH] python-requests: Update to version 2.18.4
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
X-List-Received-Date: Mon, 21 Aug 2017 16:50:42 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-requests.inc               | 4 ++--
 .../python/{python-requests_2.18.3.bb => python-requests_2.18.4.bb}   | 0
 .../python/{python3-requests_2.18.3.bb => python3-requests_2.18.4.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.18.3.bb => python-requests_2.18.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.18.3.bb => python3-requests_2.18.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 03eb7dfd1..5d6dca5d3 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=979d6a23b143e13ea0e5e3aa81248820"
 
-SRC_URI[md5sum] = "c8f60cf816a35c0c3fef0a40d0e407a6"
-SRC_URI[sha256sum] = "fb68a7baef4965c12d9cd67c0f5a46e6e28be3d8c7b6910c758fbcc99880b518"
+SRC_URI[md5sum] = "081412b2ef79bdc48229891af13f4d82"
+SRC_URI[sha256sum] = "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-requests_2.18.3.bb b/meta-python/recipes-devtools/python/python-requests_2.18.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.18.3.bb
rename to meta-python/recipes-devtools/python/python-requests_2.18.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.3.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.18.3.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
-- 
2.11.0


