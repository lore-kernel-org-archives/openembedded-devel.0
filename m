Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C10BEB28E9
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7169.1770366051449445518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bpj5LxTJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4362d4050c1so106336f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366050; x=1770970850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ1521A1+82BUNlbkKdMAhlPLcZ54yhzqANuzblx0Do=;
        b=Bpj5LxTJTXKiOyLqhB7NpqljsnBBHDl9Ux5XmaL4YE6eYrNRk0TnEftVl/mCdUeYAF
         TsJ+FwfLoly1AfJsqRuI2XhHmj8zUmEB55BHbZm9H3hUU0gipPSM4bGvTaC0eawmxkVE
         T5lg9pAU68szfUFAWS4mGVWqGtOTR7CerKybcgnsm42+2iOZEp94CnZq+7CSSEYWnAUm
         Vdzl42462LhsTT0804hCeDndshZ9GH7YBJ1hEFffeoNljag+pAkLdpxa7Nz8VZfUoQWY
         cml+95df0ggEzjE2BbrQnTzlGFigF1ckc0P4BKx/NhMPHojie1pc6oazBQCe0GkUfCO0
         ++QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366050; x=1770970850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uJ1521A1+82BUNlbkKdMAhlPLcZ54yhzqANuzblx0Do=;
        b=RdmKmp+GY37gNPkXkVpp8bzIwqLO1yV7szxGBW2XmUcwNe/ES9BdkPuxRxNZQS1VrP
         o9IFAuJMw9kP1d3+EarhMvM9jUrnsBcotTd42dpuOaRDNv4hC9C8WfiDcoPl10W4AJSo
         1Q6afOkIknnyKAPdiQGGl2p00q1I8dYW4BGzvhcOYgcc1Dj62oNCQIE6SdJN3UMyUFyK
         OYHY9BsKMySExCYIe0+EPcKcapVciIe0DcIPdfHodU7PzX1Cj+Z8pYrgO/hX975cLy79
         Ch4TFLdg5Cucm/AShrEl4gV5V57+zARH3dDZCGzhNyU9hV6JXUIJ0o3JD1WjIDEiW9p0
         1eRQ==
X-Gm-Message-State: AOJu0YzRQfcyzjvOVfcfwtbugpLeg5CAMn4PKFmg8J3d4zrPP+8k5Yc0
	9bw45tKSCYEbxGOlmV+mt8n7B4AbexiveoV607uakI5dYkh6y7iKYw+LL8nAOg==
X-Gm-Gg: AZuq6aIyNe1HmTy6GjEzUTVtHGZ0VxoE7N+apB6LvgGY+O0mtfR+Kd83RXN7V0v/oKa
	74N45q2sjKZjOaLJMAxCwD7k3q2JElri2Abzre7GA9p0JGa/3xwYHjV+8rcA9JINuuGn3wp+DOY
	4/xBEFAEVPJoLlSsGEv3+BpLj4sqmFoPKIOwsoijfDafYcvuwVt8L96THY5fGPKRXFyPTlURBLW
	WN/1xX2NU13gJkF2XMkYZRcTy1J1wgihRVpTVFLYB7aHmQY2pHDEOeB80elcupJNsvRXtjEFRu1
	OuWOZ/DCQWLfl5nrhMT7J8Bu1Nuv4xp9JEh39XVsRaxiBnsf+t9K1SJSZROdN9jqEUpxlMOCavL
	59nzl+pr4okfFTfqjggOCpCwP/jjyU2ME/omII9WnfX5oNmFf5AmKG9te9oxso8LaJarDThGPeg
	W1ggFkcaUD
X-Received: by 2002:a05:6000:144c:b0:436:1893:f74b with SMTP id ffacd0b85a97d-4362933bd18mr2234423f8f.6.1770366049787;
        Fri, 06 Feb 2026 00:20:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/8] fontforge: patch CVE-2025-15275
Date: Fri,  6 Feb 2026 09:20:42 +0100
Message-ID: <20260206082048.1442403-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124231

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15275

Pick the patch that mentions this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit edc3b69cefe42c80e0cf8c5b64acc03a15da5ef7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15275.patch  | 33 +++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
new file mode 100644
index 0000000000..3574b8ee19
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
@@ -0,0 +1,33 @@
+From 4c0658f56faf6d64382721a230ee57038035110a Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Fri, 9 Jan 2026 16:58:23 +0100
+Subject: [PATCH] Fix CVE-2025-15275: Heap buffer overflow in SFD image parsing
+ (#5721)
+
+Fixes: CVE-2025-15275 | ZDI-25-1189 | ZDI-CAN-28543
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15275
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7195402701ace7783753ef9424153eff48c9af44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index cd661584b..4db9feebb 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -3724,6 +3724,10 @@ static ImageList *SFDGetImage(FILE *sfd) {
+     getint(sfd,&image_type);
+     getint(sfd,&bpl);
+     getint(sfd,&clutlen);
++    if ( clutlen < 0 || clutlen > 256 ) {
++        LogError(_("Invalid clut length %d in sfd file, must be between 0 and 256"), clutlen);
++        return NULL;
++    }
+     gethex(sfd,&trans);
+     image = GImageCreate(image_type,width,height);
+     base = image->list_len==0?image->u.image:image->u.images[0];
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index c625566f69..70667e7f65 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2024-25081_CVE-2024-25082.patch \
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
+           file://CVE-2025-15275.patch \
            "
 
 S = "${WORKDIR}/git"

