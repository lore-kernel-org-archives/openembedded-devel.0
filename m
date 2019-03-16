Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id C9AB279D13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 20:40:46 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y6so2535016ljd.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sPxbxL3Wv2rp7l9Fv58zFmn/cuXPe1dahTLy2eEfvGo=;
	b=cbXjWwpgR+EpP78GgtARCYGRYNJis6vvsrOcO4f+uz2qlP+a3zaIUIwS7bG/Ra4l3B
	sDZuCwOz7vSOnoKVVTnhTL7o/r2He+RTJsSR1RP+xxcFkWHhwvKcszXEhcyTy1lgKWud
	j/wq9BewLtwy6mWQz8UnawAuR7IGUYNf7fbIjf3J4uj51OV+1GcG880dR5pxNncAVfIt
	E6TI3kS7MX2+blG0odcLml5nu7JrS5UOlTXgzr9LkZ/+WybK0QYHkiuPCJfvdv3v5z4N
	QipgDrId1Cw+LFqEKBZpme2JL0vFqse9hnahHPq1m+Qq6PRPBT0CuQNTUVVNfdMinK/+
	taJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sPxbxL3Wv2rp7l9Fv58zFmn/cuXPe1dahTLy2eEfvGo=;
	b=lJS9zHLf/IJesal8jgnuqdPW1L7K1rYHOSXeAj3UHs5Bl1h7+6mz6ELkF+/8f9RoWE
	bBTRUpMgTq+V/3X8tK7h6DW+j3izFXqCa6bKV8YkVY5qous8YWb948YCf1VYLxXYqoUq
	4Jdhj8WuqmN9tOKI1g5Tk/nx9QJFzI4aV3kJvwoFHI6wNRkPgncyEeaak0tso2SkilWt
	xHcF19VW/AF4/TXrg0A82Hj+ChjrMGCYfuTYjppt1Ke0s8j4DqGDKyyWs7NPm3DwtHVq
	tdEQQl+04Vkkcj0FcD6lFeKfETUbcwBKGxwbDYVfXnFjDuDuwDDlANnasJEkwmHtA7ii
	W1Vw==
X-Gm-Message-State: APjAAAW99xOPzFCWeuQRSSJdwEQbb6fWfh9b3sSWcj3s4mM6abaAgwli
	pWwN72QCDOQaNogdzVy3pE09lgrt82g=
X-Google-Smtp-Source: APXvYqzsx879tiLVQ/+BdeTDoAC2SdPN8pKtzQu+LISRfgbTLPPfHLMVizDN9r/I24k0E6DL0e7CoQ==
X-Received: by 2002:a2e:8701:: with SMTP id m1mr3718589lji.132.1552768846692; 
	Sat, 16 Mar 2019 13:40:46 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id i24sm171240ljb.31.2019.03.16.13.40.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 13:40:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 21:40:42 +0100
Message-Id: <20190316204042.31318-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] cppunit: update to 1.14.0
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
X-List-Received-Date: Sat, 16 Mar 2019 20:40:47 -0000

License checksum has been changed due to the minor indentation change
in the COPYING file.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cppunit/{cppunit_1.13.2.bb => cppunit_1.14.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/cppunit/{cppunit_1.13.2.bb => cppunit_1.14.0.bb} (67%)

diff --git a/meta-oe/recipes-test/cppunit/cppunit_1.13.2.bb b/meta-oe/recipes-test/cppunit/cppunit_1.14.0.bb
similarity index 67%
rename from meta-oe/recipes-test/cppunit/cppunit_1.13.2.bb
rename to meta-oe/recipes-test/cppunit/cppunit_1.14.0.bb
index 65b08b068..04327862c 100644
--- a/meta-oe/recipes-test/cppunit/cppunit_1.13.2.bb
+++ b/meta-oe/recipes-test/cppunit/cppunit_1.14.0.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "CppUnit is the C++ port of the famous JUnit framework for unit te
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/cppunit"
 LICENSE = "LGPL-2.1"
 SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b0e9ef921ff780eb328bdcaeebec3269"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRC_URI = " \
     http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz \
     file://0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch \
 "
-SRC_URI[md5sum] = "d1c6bdd5a76c66d2c38331e2d287bc01"
-SRC_URI[sha256sum] = "3f47d246e3346f2ba4d7c9e882db3ad9ebd3fcbd2e8b732f946e0e3eeb9f429f"
+SRC_URI[md5sum] = "7ad93022171710a541bfe4bfd8b4a381"
+SRC_URI[sha256sum] = "3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780"
 
 inherit autotools
-- 
2.17.1


