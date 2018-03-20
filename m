Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 36FA578998
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 14:04:58 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b198so1711386qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 07:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X5V6nx9qLH0UrTlBWhfnE3WN2IM78+s2Tz9OyX378PY=;
	b=bZ9DqwXTFd02aDf+HC1HlUlU7fBGvYqNOY++ZOQKS4F3f0J6M9M2szimaWDGBbAb56
	0g4+HNBDsxUp+QhXOs0uha0olpwtZFQbDVQw28VQT5UU6Nm+e4LR6Hk0BTf+Z3ArYI5r
	Y094FIdjODxd5yXGJ3yo3FI8BNRTmV3YzoSwL1xbws2g7ZatQ3edVzUTjThModZPWwU/
	X3Qlqs+2wx3fotUOitardpW71sfIxnKktyTyzZdEZvH9WFCODBDtbx8B1xoADO/w5jFJ
	s4RdL84DRbT2MgWhri5BcAxiQvsK8QfrZZZj//nNOesnOHB4jRORStN3qjcJFhkaBT4X
	d1xA==
X-Gm-Message-State: AElRT7HMQWGCubzzTbsnzMX/wxCDjSPSE4KcksZs2Lp8mSbH8bHBc4Oa
	rW5r8p/ypECbzN7+b8AdKbsYjT6b
X-Google-Smtp-Source: AG47ELttsxr8IEPdG/ack9RY7REgEgXLG2PbfVaz52FS4fFcrM62F1s1yPenJgzfkIFYhm/LCmz7sQ==
X-Received: by 10.55.133.131 with SMTP id h125mr24279813qkd.79.1521554699495; 
	Tue, 20 Mar 2018 07:04:59 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n58sm1295948qta.34.2018.03.20.07.04.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 07:04:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:04:52 -0400
Message-Id: <1521554692-23906-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-attrs: add crypto to the RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 14:04:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 12410bf..360f9c6 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83
 inherit pypi
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-crypto \
     ${PYTHON_PN}-ctypes \
 "    
-- 
2.7.4


