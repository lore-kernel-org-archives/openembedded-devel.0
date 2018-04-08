Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id CEFC975540
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:05 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p6so156212pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cB2lpbBy2QCfWs3KOTKu4fCaYp5sw8hMRBltIkxlH9g=;
	b=Bj0k37eKE88mxm4F1S2C6QiQhdfoWugRWAbGic7ddNc4Ox542uFnTJIoAts7JiHFIe
	GaTXq7d8Yy8XAW1riXgSfxG4KqaCViHezJminEiaUFpxb5FIbEKm+8rzph0t8gQUdw4J
	c7Bs5kTTAxudIRCPvNCM3YF2V14a/xhtF53bP5G9dTaIj2HpHbrKyWN4Ejfx78PAmOkp
	B8XbDFvN2lbmlz9hojfVmX0g7ZJ1lxaCUS+BzkBasPDGxzqRbOVE2Lw4wBsLFkfj8rhq
	1NPYbRLDQqyBlZYGeuaDJ/FfbGNKQhPhReOGOOhJWTtTjL7IYz36OscAPnXT73orV066
	754A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cB2lpbBy2QCfWs3KOTKu4fCaYp5sw8hMRBltIkxlH9g=;
	b=asULd4JoYQy8FYpfHQV4IoBQJqtrDz3D48sOUjmLyvwZkEm/t0asltbKeGJr7W0kn7
	WdI/2e6LSdH/sMqBrE9vM8v9TfyJnusFxChGPvH7q+jqdXb0j6ukhPI3LyUuWFxNfgF+
	skxLq3jFg379QmBJXSS47dyEyiblkuyEIykSDMS/o808Y4PMffUgsv8wnKKzlFouFnbm
	OMSz6blqDB6hHDRjdVPdfYHmrYti+t8qeKFtPy1x2Dqsy8P1ThrKilAtpYAIpF/bDeYu
	4k14idFID85ed2XN2Y7dfD2svfRl68Vji3qKsHsBKw8+/Y+++fHunLolw8gaHZEcn6W0
	MteA==
X-Gm-Message-State: ALQs6tBCQw04BKhbRkaZqZmCO1KzTUSXlnNrbngLykWuxteP0gJmjSwE
	Li6zM1P3sVLouP/j0U3ID1xNSw==
X-Google-Smtp-Source: AIpwx4/6qw7Kn7qWIY/Shmmxh2IkeVjblvVkBLAd2Qp7rZ2t6xeFQLqzJDGmY+/ZnouvVI3bolVhaw==
X-Received: by 10.167.128.194 with SMTP id a2mr7386072pfn.130.1523170747150;
	Sat, 07 Apr 2018 23:59:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:27 -0700
Message-Id: <1523170729-26321-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 15/37] strongswan: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:05 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
Hunk #1 succeeded at 192 (offset 50 lines).
Hunk #2 succeeded at 255 with fuzz 1 (offset 58 lines).
checking file src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
Hunk #1 succeeded at 43 (offset -1 lines).
checking file src/libstrongswan/plugins/openssl/openssl_plugin.c
Hunk #1 succeeded at 609 (offset 221 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-memory.h-Include-stdint.h-for-uintptr_t.patch |  8 +++---
 .../strongswan/files/fix-funtion-parameter.patch   | 31 +++++++++++-----------
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
index 7ebc398..00178c8 100644
--- a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
+++ b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
@@ -1,15 +1,16 @@
-From 2a3ab04bbdc4624792886aa51579eadb427ef99e Mon Sep 17 00:00:00 2001
+From 33a53dc13fd924949a582109b45fedd8d0bed59b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 07:42:11 -0700
 Subject: [PATCH] memory.h: Include stdint.h for uintptr_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/libstrongswan/utils/utils/memory.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/libstrongswan/utils/utils/memory.h b/src/libstrongswan/utils/utils/memory.h
-index b978e7c..55aaaf5 100644
+index e840330..8a356a8 100644
 --- a/src/libstrongswan/utils/utils/memory.h
 +++ b/src/libstrongswan/utils/utils/memory.h
 @@ -22,6 +22,8 @@
@@ -21,6 +22,3 @@ index b978e7c..55aaaf5 100644
  /**
   * Helper function that compares two binary blobs for equality
   */
--- 
-2.13.2
-
diff --git a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
index 846e0c6..be660d1 100644
--- a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
+++ b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
@@ -1,4 +1,7 @@
-fix the function parameter
+From 9f97479373f3fceedc471074b81486d77a49618d Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Tue, 4 Mar 2014 14:38:42 +0800
+Subject: [PATCH] fix the function parameter
 
 Upstream-Status: pending
 
@@ -31,9 +34,10 @@ on PPC, Now we simply correct the number of parameters.
     #11 0x4836c378 in process_message (this=0x514005f0, message=0x51500778)
          at sa/ike_sa.c:1317
     #12 0x48362270 in execute (this=0x515008d0)
-         at processing/jobs/process_message_job.c:74 
+         at processing/jobs/process_message_job.c:74
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
 ---
  src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c | 8 +++++++-
  src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h | 4 +++-
@@ -41,20 +45,20 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-index ff33824..bd21446 100644
+index 8e9c118..a73b038 100644
 --- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
 +++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-@@ -142,7 +142,7 @@ METHOD(diffie_hellman_t, destroy, void,
+@@ -192,7 +192,7 @@ METHOD(diffie_hellman_t, destroy, void,
  /*
   * Described in header.
   */
 -openssl_diffie_hellman_t *openssl_diffie_hellman_create(
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
-											diffie_hellman_group_t group, ...)
+ 											diffie_hellman_group_t group, ...)
  {
  	private_openssl_diffie_hellman_t *this;
-@@ -197,5 +197,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
- 
+@@ -255,5 +255,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
+ 	DBG2(DBG_LIB, "size of DH secret exponent: %d bits", BN_num_bits(privkey));
  	return &this->public;
  }
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create( diffie_hellman_group_t group)
@@ -66,26 +70,26 @@ index ff33824..bd21446 100644
  
  #endif /* OPENSSL_NO_DH */
 diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-index 53dc59c..eb69eaa 100644
+index 5de5520..22586e0 100644
 --- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
 +++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-@@ -44,8 +44,10 @@ struct openssl_diffie_hellman_t {
+@@ -43,8 +43,10 @@ struct openssl_diffie_hellman_t {
   * @param ...			expects generator and prime as chunk_t if MODP_CUSTOM
   * @return				openssl_diffie_hellman_t object, NULL if not supported
   */
 -openssl_diffie_hellman_t *openssl_diffie_hellman_create(
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
-											diffie_hellman_group_t group, ...);
+ 											diffie_hellman_group_t group, ...);
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create(
 +							diffie_hellman_group_t group);
  
  #endif /** OPENSSL_DIFFIE_HELLMAN_H_ @}*/
  
 diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-index ff25086..c76873d 100644
+index 8b0a7c5..114d575 100644
 --- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
 +++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-@@ -388,6 +388,7 @@ METHOD(plugin_t, get_features, int,
+@@ -609,6 +609,7 @@ METHOD(plugin_t, get_features, int,
  			PLUGIN_PROVIDE(DH, MODP_1024_BIT),
  			PLUGIN_PROVIDE(DH, MODP_1024_160),
  			PLUGIN_PROVIDE(DH, MODP_768_BIT),
@@ -93,6 +97,3 @@ index ff25086..c76873d 100644
  			PLUGIN_PROVIDE(DH, MODP_CUSTOM),
  #endif
  #ifndef OPENSSL_NO_RSA
--- 
-1.8.3
-
-- 
2.7.4


