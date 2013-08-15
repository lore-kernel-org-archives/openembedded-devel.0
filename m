Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 953316B7CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:00 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so180448eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=i+EDYV+mbmPkyYK497xgGqr1K91Ihti9BC0YluLuzdg=;
	b=HjomWYD9S95tQE6XkWs4SwonC6I2pFJQmdZvaw5ehwuEdnN0PDiUm6gktUT4rFMZeF
	7Otf/Ml55OFfsjqYcAd+xdDpbhJ6fZmmY59lKkUNqiz4ZLHYbngSgs821YLZumbYgL+y
	AjvkI8ygkqQMvDdyRwj7eARZlvSijsT9EatX6T5rzK9/UbDOJjIAX+pLTnvp1xMvzoxd
	3XHkG4XF+kAl2hXsDr1NM2eO9dzX4gLt0q8w/fdq8u0qjvozWrY7a8Q5zfA4is73OkTR
	e3NLH3ubr64S7OMrqFfF+e72IcWLKm3AsuzDyykQArG2BLWGCs3el4zuPo516R4Gl6t5
	cmmA==
X-Received: by 10.14.111.9 with SMTP id v9mr20504136eeg.35.1376551140992;
	Thu, 15 Aug 2013 00:19:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm81924368eez.0.2013.08.15.00.19.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:46 +0200
Message-Id: <795d14125289fbb4a918b8932342a66a415ae630.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 06/60] xorg-sgml-doctools: add missing dependency on util-macros
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:01 -0000

* fails without:
  | configure.ac:32: error: must install xorg-macros 1.8 or later before
  running autoconf/autogen

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
index 502723c..80f1f00 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
@@ -2,6 +2,8 @@ require xorg-doc-common.inc
 PE = "1"
 PR = "${INC_PR}.0"
 
+DEPENDS += "util-macros"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
 
 SRC_URI[md5sum] = "2588efb3f49f7fc6ecf41ce42e0b2e5e"
-- 
1.8.3.2


