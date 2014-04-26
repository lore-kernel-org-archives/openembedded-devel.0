Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id AC02465DC0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:56 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id x10so897403pdj.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qzrahaMBWtNf4Vbq49hS0O9eSnpdhlINyMJDbJ3O0Ns=;
	b=DhzSlZGaOSj9WS+TZLvT1uNKXE5d9TIVEnk2HM8wlaMohfGIpbfcw5nuwOaQEOroyi
	xfQk+6Qi/a7lb9xLY94Aiyu1k9H0QtQ2GYs42278eXdsaXjH6uFxPRHi6HJIY16XAf2z
	hwZf3QqbkWzbK/hOzEuB38mF4uvbc1+9E9wfAs42oT3F3LbfrZlA59r/AHw9AuvTI972
	wo/im7U4iqLVCinUGsEviw2YnA75AoqUoeftfRLpquhL+AqpqiVSX+NcHdqUxKfW0N4+
	SScmxNKzQEZoyJr8WPFM+oXhpPpCMz19YjSQYudI2hTPi4uUDEicANjNG3MV2Sj+cYqG
	ODBg==
X-Received: by 10.66.65.138 with SMTP id x10mr15965569pas.17.1398544377397;
	Sat, 26 Apr 2014 13:32:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:41 -0700
Message-Id: <1398544484-27299-18-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/21] gimp: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
index 68a669c..e7d9c45 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
@@ -18,8 +18,8 @@ EXTRA_OECONF = "--disable-python \
                 --without-wmf"
 
 do_configure_append() {
-    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
+    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
-- 
1.7.10.4


