Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 44AF06B678
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:42:37 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so3611267eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gdt4bSas9lIlngLdLjQk1nJeSX0giX2nvjSBNStpH5E=;
	b=wcQJoBoiXSW14DVeLQy+ng+ZP9RbCOdIFvW2DD1A8q1Uuhq1h7UKUxn6XyYfnm54O+
	q+ivUBmsAmepwE8pTAH+tD9Nl+yvWLB7j4D4heyi0hGILomcbOpN0P8BGUp6Dlnz2YWU
	XoFpNfYUUHrz+VE11T3Y0JcVc+Csa1LMm1nndkNUBcKDMhK3Tdz+FKDusMVAFowAHxI5
	yJCWFIBtkMgDeVV3QHDvPOjnkAZd4uwWaOmkd2fIGE2tcjQlZ5kRmta9lbk7JRatFGLm
	JpWrtxDdMn+fPos2h/DzuNAU42aJvyNoccpGMTqW/e3XUJB8BarbimVfUJukScrhqfpA
	bG6w==
X-Received: by 10.14.148.138 with SMTP id v10mr19150851eej.37.1390239757970;
	Mon, 20 Jan 2014 09:42:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j46sm5426080eew.18.2014.01.20.09.42.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 09:42:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2014 18:42:34 +0100
Message-Id: <1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] elementary: Add PACKAGECONFIG for ewebkit and disable it by default
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
X-List-Received-Date: Mon, 20 Jan 2014 17:42:37 -0000

* with floating dependency some packages can fail to detect elementary:
  Package 'ewebkit', required by 'elementary', not found
* webkit-efl isn't in very good shape, so I don't want to force using
  it on everybody -> disable ewebkit by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index c0ef493..f5f1692 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -19,6 +19,7 @@ EXTRA_OECONF_append_class-target = "\
 BBCLASSEXTEND = "native"
 
 PACKAGECONFIG[eweather] = "--enable-eweather,--disable-eweather,libeweather"
+PACKAGECONFIG[ewebkit] = "--with-elementary-web-backend=ewebkit,--with-elementary-web-backend=none,webkit-efl"
 
 do_compile_append_class-target() {
     sed -i -e s:${STAGING_DIR_TARGET}::g \
-- 
1.8.5.3


