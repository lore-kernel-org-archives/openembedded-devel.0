Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1DB6AF97
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:23:57 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so1052737eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Tgl8bAh+bI4qkmK9lrLrfgx2gNKG5EElqwzmPnC7FzA=;
	b=UdCmcpV/cq/8IwPTspfGAqeu7N/sypdpz4ie/nU+MEr7EQL82f9ZNQ8FDaVPgWy3LN
	/9cs/PLFv0amnu3ugYiuyAQfS3W1bhkbPTBPEmpksQAKP/Z78aX6+ZCppX9y90laV4XC
	myekpCRmUilDZKfH0vJzcJHp70Nt5iX5H2yhDhx5+D/sGao6ixAH/PdO3g2sKL5IBfJX
	7swN39/dwXapbJsrsZ43bW15l0DktJKZHrf4lAcgEx2Xq0ciBEDNSwnJMXdnQ9kvWewa
	rZQOzR5RLqlT8c3tScFbgmP3hpUQd4DiENsjuPaQJ5QPjEJmFxeRHUWSt/KdLMsXHcQF
	ZyYg==
X-Received: by 10.14.215.197 with SMTP id e45mr9071811eep.130.1372987437675;
	Thu, 04 Jul 2013 18:23:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm9753328eeu.2.2013.07.04.18.23.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:23:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:47 +0200
Message-Id: <788893827d50f72918440c9a71a00743e61aa543.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/10] xorg-gsml-doctools: add missing dependency on util-macros
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
X-List-Received-Date: Fri, 05 Jul 2013 01:23:57 -0000

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
1.8.2.1


