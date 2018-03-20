Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCFF778973
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:10:06 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y6so1455810qtm.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=18Nzv9xpFN+utQICZNwoRaPX3ABNrZlkNTJKRwj7OkE=;
	b=FDA+FdpdR3w2kNmuzBdpIH1PdiI6/VEg2IBn0mk8cJ5Tap1WyoGEgou27BU36HwdVv
	E/XcDeLiRyHLF5TBICZno7WhnH1n0DDUE+JPDHI0syInEiNs8iN8YggVt1TiUDhutKes
	kskUw5SUQplh6rwsWjqFZon85d+z85m9B24Kq/ZEPpFTK+Fi426dgGcIBp6UTrIrR49b
	2uPTeLnL8LI62fnsv2Mk4zfiVp8HrRqjOzNrJQrBa/sa5XVGvZwgK+1UTofsH94D+V+o
	rhxe9CL346WWV8zj9XFwasKoP4IvR0m2gyLJ8NbBOvCGggZlyRAHax99G1oQvlvnUyxt
	Kqyw==
X-Gm-Message-State: AElRT7Gxf1Kscq0plWFOE2JsxzmvSves85Sd0mI+wluitBLLoYqghm88
	Om6/4CLRkG9j15WQ/cWy+oBkjrDK
X-Google-Smtp-Source: AG47ELsPqCWQ9c5+CHSCsKfdAnmqs9VhIT9o08V3kkwHh3IHZPEDiNgKYj2NWyBfyyXFgn+1tA5iBQ==
X-Received: by 10.200.43.217 with SMTP id n25mr23871767qtn.20.1521551407743;
	Tue, 20 Mar 2018 06:10:07 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id q2sm1192282qtf.54.2018.03.20.06.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:10:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:09:59 -0400
Message-Id: <1521551399-30418-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-iso8601: add datetime to RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:10:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-iso8601.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
index 45da75f..61e9abb 100644
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
+++ b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -6,4 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
 SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


