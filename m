Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB1170234
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:18 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so4803745wes.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4fHxnkugUWJGHpvH4PGi2z/ugfZBLPSAX3kEgprzmjo=;
	b=dQZ+fpqDT9bbij4jVtd47DLw4qiYJlCxlIPCQx3nboRRfF3nPBf23igA2UALQtw1lL
	PPJbuvBSyGNoBhhky6COYOzUlaVIV5fwzAFQ7cqlY5TRJKpYSYSKUlwAmemEsm47SlfD
	NxNiOF0HPExC3S8kK3YRTmoyUM4YKxv4fPcw67IITCsnvO9dLD3IJ87li3nFof+3zNxw
	WlUzhrQrdcJemrnV2osswexxkMqsynlkFsAVDC99tW2nlLOA367kgs/HhesYOGV49xeV
	MRaFWwHN2NhgB/D+LSpsvWWB9+HBmCRrkQylOlmpyqhr1b1VXvs+rbI5jywB8e4tgySF
	yKpQ==
X-Received: by 10.194.86.164 with SMTP id q4mr10868424wjz.88.1403342359123;
	Sat, 21 Jun 2014 02:19:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i8sm12408724wiw.22.2014.06.21.02.19.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:06 +0200
Message-Id: <1403342349-11180-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 09/12] mkvtoolnix: fix build with B!=S
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:18 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
index 3b8eb32..abb0e95 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
 
 # remove some hardcoded searchpaths
 do_configure_prepend() {
-    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ac/ebml.m4
+    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
 }
 
 # Yeah, no makefile
-- 
2.0.0


