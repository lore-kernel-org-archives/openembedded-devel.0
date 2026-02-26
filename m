Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453CAFCE09F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71420.1772117191018465547
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fgg7+8o1;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so8813735e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117189; x=1772721989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZIzVES58nMD8d0Zfv/KakDR4OR1P2SqKam57pxMoFc=;
        b=Fgg7+8o1I8iL0oeFai7C90c/JTQZ8OFu39gx0Jn+seo4iR0M7E/VXBoQpghzuQi+/O
         T7bY5+7AdDgNnIRjbP3ORhr4xxgm0dju68UJZsST4ciAGJ9plHQK11ktWULu4Eqza1NB
         FxxayQjVWzrwI7VJDQiQzvqLeBd0uZK3NI73TpaYg1KEEfaa5sBOezHkEbmgnQXu0ws2
         twZ97riKHh6XCxhhUYBGAIRI6Um3TDRm53L2L2AtEwgelwYUsVVcR90L45HkQlMjUQY1
         A2Y/zs4FFtyAoo/9hIKTLtKUANbGUlSqxJeWoCbeA2DtQcXh25FFDCWfDUcrFBBFw341
         Jpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117189; x=1772721989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZIzVES58nMD8d0Zfv/KakDR4OR1P2SqKam57pxMoFc=;
        b=sEI2cZG2XaKguSF6K3SxdFHQxWUjqJow2xnatpolZlwginyMetzUenYNNItpVRO0tY
         GuU7vKmGGKxPL3gtoHftvn0NRwCmzV40d36APNLe3G+SJQ5LHMGR7KTOilAYhL+sX0UO
         dXJt9nl08MPVn1+61R7Fw/5RlqlhoC5FuX0FfhCIseHTuPxv4jBpxPprZhNYHdu8GKKr
         p0GFuGshlMLQ5rShEg8s0/STTNIRR39EtaElZrImKTo1r+r+wO1Paj+wCn1KAEM/peXQ
         0aVsrgexXt5sLdGCi2tIGJgkMlBcKB8Zg+3OfHp9brjJ/UJ2urRs8BCgP63dJYzbbD8G
         lRvQ==
X-Gm-Message-State: AOJu0YwuQinO8zkTXBPAMka3Bep8uK7UlhYgW8wiAhPGEzN+/HryC0eR
	LPXtAVA+DMauP29cRCa6tGqnXLOY3S48a9CBau+Izdp2fjFVdHiLRVjd9zMieg==
X-Gm-Gg: ATEYQzzhvQXYnsPqBEqWt1/pd8OlFE+qsC5YPd3nEKQ+l4BYW4vZTJe1qDCK8e2DG1y
	frVp61ka6OB3VlYbrz4m9yIYGdWRJzwhR6CKnZn2Q+fALwltoB8KV3BO/wAp89DjF3oY9RWRpP4
	aAuuevNYFBHZf1ld7mxsOSwQmxGUTzzyWrQgDxWol8DEoL8CzH27v0lf67lwT/miA7n9/nlvDKa
	7sK7Yc6tmFFoe+eH50AXJQcE1m/dZU7qh84vyAbhG3wtit7SwgVweqKy2TSRPTvTxZ/voUQt0io
	rr/2yqwnO1cKRwynAoFOSp3tOD9NKr38gGJYQ+/ALttHQOXQepN1y574k0j/fB+wypRH+9Jjtc7
	inRC7va10D85rbyigIrQtQx2wfawbEj+kQOZli0giYlyA2RcZkOvFcHRECH0KY8LGjSE0+DAmxh
	3tPwI7kcm2ulfKLbCMBRQc
X-Received: by 2002:a05:600c:8b44:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-483a95eabccmr329844685e9.27.1772117189172;
        Thu, 26 Feb 2026 06:46:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/7] fontforge: patch CVE-2025-15270
Date: Thu, 26 Feb 2026 15:46:22 +0100
Message-ID: <20260226144624.3743168-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226144624.3743168-1-skandigraun@gmail.com>
References: <20260226144624.3743168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124682

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15270

Pick the patch that mentions this vulnerbaility explicitly
in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15270.patch  | 44 +++++++++++++++++++
 .../fontforge/fontforge_20190801.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
new file mode 100644
index 0000000000..b70a395f79
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
@@ -0,0 +1,44 @@
+From c36b95c57f85a34ad85ca2be34f62ff1100d52f1 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Sat, 31 Jan 2026 21:23:41 +0100
+Subject: [PATCH] Fix CVE-2025-15270: Heap buffer overflow in SFD kern class
+ parsing (#5743)
+
+Fixes: CVE-2025-15270 | ZDI-25-1194 | ZDI-CAN-28563
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15270
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/d01333a5bfa2ac4ed698c24b323d02107deacad7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index 940627a3b..99d92b051 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -8276,6 +8276,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	for ( i=classstart; i<kc->first_cnt; ++i ) {
+ 	  if (kernclassversion < 3) {
+ 	    getint(sfd,&temp);
++	    if (temp < 0) {
++	      LogError(_("Corrupted SFD file: Invalid kern class name length %d. Aborting load."), temp);
++	      return false;
++	    }
+ 	    kc->firsts[i] = malloc(temp+1); kc->firsts[i][temp] = '\0';
+ 	    nlgetc(sfd);	/* skip space */
+ 	    fread(kc->firsts[i],1,temp,sfd);
+@@ -8293,6 +8297,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	for ( i=1; i<kc->second_cnt; ++i ) {
+ 	  if (kernclassversion < 3) {
+ 	    getint(sfd,&temp);
++	    if (temp < 0) {
++	      LogError(_("Corrupted SFD file: Invalid kern class name length %d. Aborting load."), temp);
++	      return false;
++	    }
+ 	    kc->seconds[i] = malloc(temp+1); kc->seconds[i][temp] = '\0';
+ 	    nlgetc(sfd);	/* skip space */
+ 	    fread(kc->seconds[i],1,temp,sfd);
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index 41d43114bf..39f434bfd4 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2020-25690-2.patch \
            file://CVE-2024-25081-25082.patch \
            file://CVE-2025-15269.patch \
+           file://CVE-2025-15270.patch \
            "
 S = "${WORKDIR}/git"
 

