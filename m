Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76578D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 19:41:44 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2328.1764272499677597163
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 11:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lY5azdk+;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: danismostlikely@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88242fc32c9so13385096d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 11:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764272498; x=1764877298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF4YFPK0u9xBhfTZFt5qJskrZ6qsnJ9PumMqmpK/HkI=;
        b=lY5azdk+seQE9xmlblUbF+5V6hXGZAGbOZQbUxJI4XWrmScHoUBoJl14sTdK29dFUR
         RJhCqPvH8nEoeOk/kDURFnyULwFoxQgyjAsyXW3kh2zoSmImaKuEvjDYRwWphMW1PeXP
         jKDC8kxG2aKKHP/w2SCc6rm7EqpZB+EVSsFBeUmEZr2BBOM2jaH6C7Ta5wJ/DXM7tD6p
         W3I46iLkVQ4i/5x0ZjyL2vRrrVsDB/SccmfqqZcRzHKEuW20SovZgzZ8bC8+ACR5BbJQ
         LczGPjLp5BIZdCgPbA+H+UUVY4pKtSzKZaxOdtAN6K3To33jTSP+Tj/mtXvZ6V3OD5E+
         pdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764272498; x=1764877298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF4YFPK0u9xBhfTZFt5qJskrZ6qsnJ9PumMqmpK/HkI=;
        b=bYbKUHxin9RyHncPSb/xSibA9tZSxA8d2NUALv2VuChZXRT5iAe3gDRVBlbuKcyXsW
         oZ97Rz/Zaqw2TDHEXf527MznmWm2nVKO5Rgs63PbthZtQxuhVIFIynJzsqaJ0q1Wg6Ru
         94Bl6O255cW+LmklVj9tpT2N9eD5rlensR8g7++FNzT8aStns9eee2fTgHRdUv+HSRo/
         9Uofdbhy78JIMnUF8Asqy8yr/qPhfZFJ3KwJdSTH4f+O0tzNIwRwpZetErl4GpX0EeUe
         ubwi8x6hBw0s1o+2TK0SE7eQWR4fdGYfgu41sSkO0HKGkjpU2ClQJ7D1h7/lA8gkNm/x
         DeMQ==
X-Gm-Message-State: AOJu0YwErS7kkO5p6Em66b+vsaz1lHkqhRiVoeKXIuS7b+nvI2PoMNJq
	t+olp3m0MWfBUhei9Z2yrS9Kt5L9jEOlGwQzeBCv89F7cPAXDcskAv2qDEN5Dw==
X-Gm-Gg: ASbGncusO8f1P1FYXpSG7lXwEwr2WrStvwxFJfKupdSZ4aAzKYVRWzZZAhjrvY7OPWO
	zKMJgMPpAz1FViZrJb5gjQjLMVXfZplmfNPgtiz+g3mPKvhuPKLLyJJ2P5fzOVVQgwS3T1eXhOR
	GYx7lJd71RRwn5ccjIFWNJE4Oaew5FxYKwC0f8+xx01lFPplmCyIk9A+TsK9tPY9O1EuAgUNKEQ
	PDLDzReqH2kD6El6XPTDjcOOh0BwTTT8/SZyoXllB0Hi0WGLNsrTZfUDeE+3LoIVDKZF3Tlrv4m
	cK6CXRX6jwbknkt44XoyxwUlL5ldZ3FGvLMpdbqb8tccdLLuhe1xdGGvLx9zqxo1F6t7QqC/JqI
	TmkV+4VgJUpP6Xk+gYX+gbV/bEI8dEAiuwIxaGc50sPdqrWkWGxw+JCHqaxFn/0fe2qqk6E6ADg
	cMXhTD+3XJv3IWSOtwOdqe6e8XDYSEZ7Mto91KTPRfDhPSG/n+luhA
X-Google-Smtp-Source: AGHT+IGBW4TVOsv63KQp9xJDvPxwRStYnDIJ4v/52kviR/1Vdy7uUAD5X5Vbn3rlTU7nJhbxgyIVZA==
X-Received: by 2002:a05:6214:2b9a:b0:880:61e1:f9ed with SMTP id 6a1803df08f44-8847c499074mr332057126d6.17.1764272498468;
        Thu, 27 Nov 2025 11:41:38 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524af138sm15645906d6.3.2025.11.27.11.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 11:41:37 -0800 (PST)
From: Anthony Del Frari <danismostlikely@gmail.com>
X-Google-Original-From: Anthony Del Frari <anthony.delfrari@vecima.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anthony Del Frari <anthony.delfrari@vecima.com>,
	Dan McGregor <dan.mcgregor@vecima.com>
Subject: [meta-python][PATCH] python3-requests-unixsocket: Update to 0.4.1
Date: Thu, 27 Nov 2025 13:40:10 -0600
Message-ID: <20251127194009.1607087-2-anthony.delfrari@vecima.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 19:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122114

python3-requests broke the http+unix url scheme with version 2.32.
Their position is that it's the responsibility of consuming libraries
to adopt their new interface. requests-unixsocket 0.4 adapts to the
new interface.

Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
---
 ...ket_0.3.0.bb => python3-requests-unixsocket_0.4.1.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-unixsocket_0.3.0.bb => python3-requests-unixsocket_0.4.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
index 94497b609bd..4485b89de7d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "https://pypi.org/project/requests-unixsocket/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "28304283ea9357d45fff58ad5b11e47708cfbf5806817aa59b2a363228ee971e"
+SRC_URI[sha256sum] = "b2596158c356ecee68d27ba469a52211230ac6fb0cde8b66afb19f0ed47a1995"
 
-PYPI_PACKAGE = "requests-unixsocket"
+PYPI_PACKAGE = "requests_unixsocket"
 
-inherit pypi
-inherit setuptools3
+inherit pypi python_setuptools_build_meta
 
-DEPENDS += "python3-pbr-native"
+DEPENDS += "python3-pbr-native python3-setuptools-scm-native"
 RDEPENDS:${PN} = "python3-requests python3-urllib3"

