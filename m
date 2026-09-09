Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D86C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:26 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7002.1788942740140842546
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KIxuiTMn;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so4513138a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942739; x=1789547539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhFC/KuQeyNYphQFfcWWvnzg7MLCbxVnxmQne32r6tI=;
        b=KIxuiTMn6tSe6nnkOpEV1YvfrL8Nr0G/xBS8lTnHGh4mbogNHqnDzV34LNJ0WwFFNz
         Zy+izRN8aJa3pLvnxWeRTpp+GJF+gDV4UDTuibBe/Hi+083XVfy7nyXzzxtdp0+clLy5
         Xkql/CopLHiqpvJX//OSdzj09G5W2VZi0hRkw6uHUR69eTbGChbLkqtyyk6LjuDx//Lf
         kUQkxTS+vzFHLSZyWAV/RogFagOe59nA4fKrf18+rt7Iic2jqsQ485IMi4uwLrbPQ2uP
         mo1nCYsnYpov+kO8gOHnNKF8aZ9l0WXPhs3efTmSd3DhwnWaF40/+pWeN1d74zzlt2LG
         +afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942739; x=1789547539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhFC/KuQeyNYphQFfcWWvnzg7MLCbxVnxmQne32r6tI=;
        b=lbXiB3raCzQvVioCDIEB3Di0PCaE5lit6FZ8Pbo5itCmRuDP71m9k72qTlgAJ6JAua
         4PhcGAMcNmoT/6mrbHOGMZZTrMtTn/m/u7WBW63h2esq6TPIBuMek3WqTI0geQef6zVe
         y1sP1+klTC6GMF4VSc54LdVOVKR2N+bjELFQuwFMErOSpkH45B6mnkwLthdyBGp/ORhr
         FCVvfC+gakaO5cDDoRPLPl20XnDxJn96JD8vIvy1C+OUV5yezPQ8jdG5D2aq+P/V0qyJ
         gDauN6mz10sRv8zY/ebGGkHFsEQMyCv0i5YFPPZ3N+RsRK46EoKb0L8qWzHtJuW4cs+Y
         hIZQ==
X-Gm-Message-State: AFuF++k2XjoKZd1bSVLurynCckPENRJ14uonywyidq0X1F+fn9NJv54b
	V6g76kTocmYr0Vcg7BuKgLTPazeaSMbJP/YOrZQG8/8SnnzD3v/fdl4o6GzXfw==
X-Gm-Gg: AYBFou2G/Ew5eiUnrFnoIYx9DfMxJE2DxcVAdkLDI2T0gQSbFb+i+HAfNIFUfnOOeme
	vQorZlksDzt8zM+PPgQMLf1bNuFE7UMjYbcgeFfqg/icikSoAV+QpeWA+4KAnT+dZV8c9hhXJUC
	YdAIwiwsS5pTaSXrCJISIjmzAf2vY2V0SMllTHnZWV7N18aDDzqJntyV4Os3uSlPSxbcbQXXEAt
	hXGisl89IemSjxyhWnTgE0NWfU52cvCMzj7kcS1Wmd7VDHJE9O+dd6jbyp2qZV4ZB6w58xXw9Wd
	dLqocbfl7SIZxJSHcVE846lF/SAeHO0EiwQYVwI/N3ZyBcuc7lAd3C8fnInPIEbvU/yZGVEaDya
	T0WXb+XKbht4THsIJU+nvQ56kDcusamm08DLwAhXuLf9dyRJ2aymB97Oy4aeEX8pUKB8m1UdLOa
	477MUibi5XdGNkNVrAWEbi6SdBKxF2xHWNDM8N4mjWhTpLSIIxLiBj90OREMYEYAwmBeYx/oJ7P
	LW8RMLaJgpvHgygHRHBIUs=
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr52975792a91.13.1788942739410;
        Wed, 09 Sep 2026 01:32:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/15] freerdp3: patch CVE-2026-64620
Date: Wed,  9 Sep 2026 20:31:35 +1200
Message-ID: <20260909083140.2494932-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129881

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit matching GitHub advisory[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-64620

[1]https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-pjqx-v446-x7fc

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-64620.patch     | 37 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64620.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64620.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64620.patch
new file mode 100644
index 0000000000..e154a92499
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64620.patch
@@ -0,0 +1,37 @@
+From c04d10f9586ce92d7a7a3307744e16d554e20cfd Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 2 Jul 2026 08:02:26 +0200
+Subject: [PATCH] [crypto] fix out buffer check
+
+(cherry picked from commit 27014741a8c22a34d3040c559c82f4ed82841bef)
+
+CVE: CVE-2026-64620
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/27014741a8c22a34d3040c559c82f4ed82841bef]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/crypto/crypto.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/libfreerdp/crypto/crypto.c b/libfreerdp/crypto/crypto.c
+index 3d210f2d9..60f7c6cee 100644
+--- a/libfreerdp/crypto/crypto.c
++++ b/libfreerdp/crypto/crypto.c
+@@ -103,11 +103,14 @@ static SSIZE_T crypto_rsa_common(const BYTE* input, size_t length, UINT32 key_le
+ 		goto fail;
+ 	if (BN_mod_exp(y, x, exp, mod, ctx) != 1)
+ 		goto fail;
+-	output_length = BN_bn2bin(y, output);
++	{
++		const int len = BN_num_bytes(y);
++		if ((len < 0) || (WINPR_ASSERTING_INT_CAST(size_t, len) > out_length))
++			goto fail;
++		output_length = BN_bn2bin(y, output);
++	}
+ 	if (output_length < 0)
+ 		goto fail;
+-	if (WINPR_ASSERTING_INT_CAST(size_t, output_length) > out_length)
+-		goto fail;
+ 	crypto_reverse(output, WINPR_ASSERTING_INT_CAST(size_t, output_length));
+ 
+ 	if ((size_t)output_length < key_length)
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 86999ffe94..a577916bef 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-55648.patch \
            file://CVE-2026-63633.patch \
            file://CVE-2026-63652.patch \
+           file://CVE-2026-64620.patch \
 "
 
 

