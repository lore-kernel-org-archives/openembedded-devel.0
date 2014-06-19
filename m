Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5AC6FE86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:09:32 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so2061244wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V2vyS6APKxWM/BbbtTq3eUg1lv57Zcpwazp+FcDTWR4=;
	b=f45WvclgXBxAtLQxoib4IErGBzDnVnLNmbMzF2TJIPfhuPAsC/phct6gerDWIxfRXI
	8eqzz7IyHbixVW7X6dVHe93UTDC45PUibiqGLfaLlUk82eq0P+PXDMXlkpLO8Jj80eQS
	s51xozZJAnYiLQ+//dj/I+7JVv3Y3/gM0zUKUEoEnvXXLASyPM3J4ubGU+aQFG8v6/7V
	ZuJZzZg9QZouKIVFM1Z8ZAtI0eI+bnSPOq3ZeW3ZQ+EFzmbMyD+Gzn0MVGxuqoIOQqeg
	BN6IEifKvcRqfrXLky9YbSD1F0e5AVGNn0kaeYPD/rO0OX6bQCr9OtdwH77XzLBbCPHF
	a34g==
X-Received: by 10.194.204.170 with SMTP id kz10mr3673756wjc.38.1403168973423; 
	Thu, 19 Jun 2014 02:09:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v15sm7412132wjq.17.2014.06.19.02.09.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:09:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:09:29 +0200
Message-Id: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH 1/4] libsocketcan: Fix build with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 09:09:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
index df3c163..98ef73f 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
@@ -16,5 +16,5 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 do_configure_prepend() {
-    sed -i -e s:tests/GNUmakefile::g -e s:trunk:0.0.9: configure.ac
+    sed -i -e s:tests/GNUmakefile::g -e s:trunk:0.0.9: ${S}/configure.ac
 }
-- 
2.0.0


