Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 03D5960169
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:30:43 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so9912096wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=j5atmqtlG4R5+mySm3ZOXVJ7836cQ98X1fr+caDriEQ=;
	b=vfY3gA16ltc5+O1c2+QurSzykg1lIAOFYItpPz7e1XEm4kbXGCuO5h0hbRy+T4dICt
	r6fPIbWayX6A2cgFleY2Gavk07aL4VEM9Lgyq5t/Xauh2DMtn5KObmklo0khWmz4x7oS
	e9eNI9RfJlZNdc91RO1/NTWyUL3YWYt6Fyvqhz3FduUZukperHw6UenavrlxNtn3WuY3
	rtU4tzA/kuwhwMy7AcK3rkoxTxBrQaGlPzMlOroYnlMzo99XyarxhkkLq8cjP1IAR4PJ
	RD5nKkLp/+byAMGf/s1gTF/RsEH66eTVy7Qoiy0v9vN80jZ34mfeLPeG9FOmBe2+Jdwu
	3yOQ==
X-Received: by 10.180.97.102 with SMTP id dz6mr31935912wib.61.1407846644905;
	Tue, 12 Aug 2014 05:30:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u10sm55764519wix.14.2014.08.12.05.30.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:30:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:31:17 +0200
Message-Id: <b204347a39257d201b3b655292979e912555a6ad.1407846579.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846579.git.Martin.Jansa@gmail.com>
References: <cover.1407846579.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846579.git.Martin.Jansa@gmail.com>
References: <cover.1407846579.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [dora][PATCH] 1/2] daq: explicitly disable nfq and ipq modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Aug 2014 12:30:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
index 4c1be44..bbf7263 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
-DEPENDS = "libpcap libpcre "
+DEPENDS = "libpcap libpcre"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
             file://disable-run-test-program-while-cross-compiling.patch "
@@ -13,4 +13,9 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
 SRC_URI[sha256sum] = "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
 
+# these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
+# this error from test-dependencies script:
+# daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
+EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
+
 inherit autotools
-- 
2.0.4


