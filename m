Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A164605BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 15:21:54 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z10so16218507qti.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 07:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8QpPek/rc+fwZzAgFHpjiprFl6Pyud7n90ZV+c1EaNs=;
	b=SE+qIlSlCrpOlLJCaZqfHmxJICB+/ixSovC2LUqdp9QgoMqjYuWHhKXPw89uhlWE0z
	zKVDlITlGAYF8nSVzleqob31btk3nasyHs5BY1ueN4czHRjny7E5fUMppzwDY5gdGgHp
	kWRHb+3UbGjsDHH7ICS0XSfEo1N9ls2U6TAaq+cf8ck19tq3vMLZ6YSug2CBWYT5JswM
	958Tfu/L8rx3ET8mgoIjYCs73T4FglnjYJR4bbWBCaa+tRTJ7g29x0QRTuHwYtuPmQmb
	2qRznqN3+yPjWgO3dmXBnXSKaF1OdLEgPUDzjmoYRi6xy/lWyITiZvG0tD066l92l3q/
	boNw==
X-Gm-Message-State: APf1xPBXk2eHfHjYUkTNfKdOx1P3kRdTZSvU+/4fP7n/mNePtEAEdc5a
	r5M/OEuvb5e/8ooeXn9Y6Wr2KPxu
X-Google-Smtp-Source: AH8x224B1maosFEQOUPNYvy0u3/sDtr+BCVkY/B//DOY9F6dWoi/BEs3ro+bQhW4n9dvfXeeXmfNNw==
X-Received: by 10.237.59.74 with SMTP id q10mr14441381qte.222.1518362515580;
	Sun, 11 Feb 2018 07:21:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	a50sm4862314qtc.94.2018.02.11.07.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 07:21:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Feb 2018 10:21:43 -0500
Message-Id: <1518362503-1336-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-msgpack: update to version 0.5.2
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
X-List-Received-Date: Sun, 11 Feb 2018 15:21:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc                | 4 ++--
 .../python/{python-msgpack_0.5.1.bb => python-msgpack_0.5.2.bb}       | 0
 .../python/{python3-msgpack_0.5.1.bb => python3-msgpack_0.5.2.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.5.1.bb => python-msgpack_0.5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.5.1.bb => python3-msgpack_0.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index 2729c6a..e6f6681 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "29ef230aab635b7d3daaa349c735a1a0"
-SRC_URI[sha256sum] = "69aa1eb0e13be1d3bd495ca937eae66df4431126f5cfd5491dc40370e5644853"
+SRC_URI[md5sum] = "b7759a382dc6309b35e0a0eecc1f23f1"
+SRC_URI[sha256sum] = "23f688905bb9fbf00faa7346e72a72e670e68f3f5d94aeea5c123dd0e07de49c"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.5.1.bb b/meta-python/recipes-devtools/python/python-msgpack_0.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.5.1.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.5.1.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_0.5.2.bb
-- 
2.7.4


