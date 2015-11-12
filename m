Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 71F2F771DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:03:45 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so149064750wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 03:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=08cyufqjS69Jak4VwYziOMNxx6GlXKafqxIbfWy/7n8=;
	b=g7KnqP/GFm0DZ3JYSgDiN9dZQ7+pylPyyrqT+5TB23rRLdQMqY4HEZ2+Mrbtc4IDIm
	ECDVrP6AdGpqiwvHW0ZrzpOh4cWeQ5ReH7eOfWFMIMCFPWkRmqB77Mz2hS1UodeNXzxd
	d6qmNdLUCVK4ate782iMrQkElVvoWkqOR8wGEyTxP5WP483XpHh3j90s+4GjdsBWLMwQ
	5rfDcS0510Eph5QIsJ6BVnigaTUqGtsFNvmPgxWbeAA+VInkXmHSMRk3+SV+MLE6lx6B
	gjFycLD2w2TrLmRuSvonjFPpQKvHkikUZXnj5wXbWSPAq8hAXgOxHRSEPJCDiOqMEqvM
	QyjA==
X-Received: by 10.28.8.205 with SMTP id 196mr46718463wmi.50.1447326225673;
	Thu, 12 Nov 2015 03:03:45 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	71sm14407167wmm.24.2015.11.12.03.03.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 03:03:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 12:03:59 +0100
Message-Id: <1447326239-15529-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-oe] fbida: add PACKAGECONFIG for lirc
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
X-List-Received-Date: Thu, 12 Nov 2015 11:03:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index e763221..8a4c083 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG[png] = ",,libpng"
 PACKAGECONFIG[tiff] = ",,tiff"
 PACKAGECONFIG[motif] = ",,libx11 libxext libxpm libxt openmotif"
 PACKAGECONFIG[webp] = ",,libwebp"
+PACKAGECONFIG[lirc] = ",,lirc"
 
 do_compile() {
     sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
@@ -48,6 +49,9 @@ do_compile() {
     if [ -z "${@base_contains('PACKAGECONFIG', 'webp', 'webp', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBWEBP/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
+    if [ -z "${@base_contains('PACKAGECONFIG', 'lirc', 'lirc', '', d)}" ]; then
+        sed -i -e '/^HAVE_LIBLIRC/s/:=.*$/:= no/' ${S}/GNUmakefile
+    fi
 
     oe_runmake
 }
-- 
2.6.3


