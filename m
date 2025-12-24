Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E06E7848E
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:34:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126492.1766604884846183255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kku1xVY5;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3293164f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604883; x=1767209683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaMvdJ0AoAKAHVoJHq9tcXy4Ta/bdf+gkoTUioshrjc=;
        b=Kku1xVY5XOkwf6D3pZIut4+5EOddMrIKOjB7cRBQFryYyZO4Sz1CSdf4u9RWOXofDX
         E6lRyePg/WwZhL6uLQW+aOxyR7jkfdpOGfbImZn6GLiJvpUpWjLVh7I79TeuXVEaXzob
         YfB4ZjEpSSJJfUZQhJ6FIbsDfl/Y65aeUqAteWZ3vmZ6bJ8kSJqWn4cua/K8NyG4152s
         ScWZiJCZGqyzM0+8r1xmPxz/D8jpqzvE8x/KrY8lNiiAO+Im0oLIbqoWnFF8TI3fpUKi
         AGP3YgcuhHeg2nU4I6xwsizLj1mk+x62390SNeqWz9OzyMdqNQPdSo/JmrJN3wpWjPMA
         lH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604883; x=1767209683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SaMvdJ0AoAKAHVoJHq9tcXy4Ta/bdf+gkoTUioshrjc=;
        b=sb0DfhobMInpIQ1bJ7Dz8LBVQ5vxp4ARPQmRvJuiFM+wV6EO6Pke5tTUkVoihY00qS
         0CWM70DZKXoA8ecFaIqoG0mPitH/Mo5W33Vmle3jmi4HHR98dmBjINr3Q+v1/M6guLta
         gz66oCkH8Pp3lsXpQMdCtyAaIICmqiXiki0F08fzMqSXGryTC8pf64Rpvf14Ti3jANT4
         +TCHyY6JNfovBQ2wwrIEEye65ic38nJKTx1tbXmpkHdwkxOXJG01dS2rKixn21+AMSFv
         /Pxt3ikOhDPXXC4ua1CL7SZ12UudGaLGp5ZgrKnyHZqmM4oezP0bO3quOvlUsl2sJ95z
         /GEA==
X-Gm-Message-State: AOJu0YwysE60WRxi57E4/A/VQOh0CGMLJCs7SKkuUbTl50c2Ueu3Y3dq
	cmkIuc7NC1GlWM4FmGfzPbuAgc+XW3QFsNb3ML1u6vKYmZfZu18Lf2JmjMNcmQ==
X-Gm-Gg: AY/fxX7ICoX0Mbee4PgXESFXnrlnzj/kEQPYgbtS/ORX92MreZazkYyinGC/VJsl3d/
	dTMGvdK5G5Iw81NsRm6S8kkZT1DpHfCJKtWXsDm5+TKhV1hNOkeFGQ8N0f18uLa63ey/mQ15YqM
	ImDc9yvY5yNuWhOsDKwmMVo+0iYoIc52zyD3CUddOBgqSAiIDJ54upkuuZGHciz3oodwTManTjt
	bZVaYx07IHW+z/WsWYIHlm89vDTzmdw13MjGwb+o4GJH5e7gJW8wVqkAYAb2IlN/Jhvmd2pCMkm
	pvmsQLljVQ2g92mxROiRymG4AkVr08wG0/CxoKVfrjoEqk4RFmVdCaFNRE2Q6kFC3A5Uh5dXSdg
	AMZ5ttS876FMzhADIlLT0UXknj4VeY9oIh9ewIvWj8Xg0ucOcsbtj/sQKj33TPjNtH+qCuyldvN
	+zDhBfUchd
X-Google-Smtp-Source: AGHT+IExMxl7ZPYg07eMMRJvckNbeug/bQ79/bafWeoV5V0NwI5tuImekgmdNWYBnam9IioSE2qctQ==
X-Received: by 2002:a05:6000:22c8:b0:430:f6c0:6c47 with SMTP id ffacd0b85a97d-4324e4cbea8mr21264426f8f.21.1766604883067;
        Wed, 24 Dec 2025 11:34:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33750665f8f.2.2025.12.24.11.34.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] zabbix: patch CVE-2025-49643
Date: Wed, 24 Dec 2025 20:34:33 +0100
Message-ID: <20251224193434.2631122-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224193434.2631122-1-skandigraun@gmail.com>
References: <20251224193434.2631122-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122895

The actual patch was identified by checking the file that was modified
in the tag 6.0.42, and also by looking at the Jira item referenced by it:
the patch references DEV-4466, the same ID that is referenced in the
Jira ticket[1] referenced by the NVD report (look in the "All Activity" tab).

[1]: https://support.zabbix.com/browse/ZBX-27284

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zabbix/zabbix/CVE-2025-49643.patch        | 38 +++++++++++++++++++
 .../zabbix/zabbix_5.4.12.bb                   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
new file mode 100644
index 0000000000..c518880c7a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
@@ -0,0 +1,38 @@
+From 2fe5c1d761226d73fe49269eac96dcd99860efa6 Mon Sep 17 00:00:00 2001
+From: Ginta Berzina <ginta.berzina@zabbix.com>
+Date: Mon, 1 Sep 2025 14:10:12 +0300
+Subject: [PATCH] ..F....... [DEV-4466] fixed resource usage for image resize
+
+CVE: CVE-2025-49643
+Upstream-Status: Backport [https://github.com/zabbix/zabbix/commit/aeada86d3c8231e1e173c6a7ac19ea60bf899b86]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ui/imgstore.php | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/ui/imgstore.php b/ui/imgstore.php
+index 38661f5..6a616df 100644
+--- a/ui/imgstore.php
++++ b/ui/imgstore.php
+@@ -34,8 +34,8 @@ $fields = [
+ 	'css' =>			[T_ZBX_INT, O_OPT, P_SYS, null,				null],
+ 	'imageid' =>		[T_ZBX_STR, O_OPT, P_SYS, null,				null],
+ 	'iconid' =>			[T_ZBX_INT, O_OPT, P_SYS, DB_ID,				null],
+-	'width' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 2000),	null],
+-	'height' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 2000),	null],
++	'width' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 200),	null],
++	'height' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 200),	null],
+ 	'unavailable' =>	[T_ZBX_INT, O_OPT, null, IN([0, 1]),		null]
+ ];
+ check_fields($fields);
+@@ -58,10 +58,6 @@ if (isset($_REQUEST['css'])) {
+ 	foreach ($images as $image) {
+ 		$image['image'] = base64_decode($image['image']);
+ 		$ico = imagecreatefromstring($image['image']);
+-
+-		if ($resize) {
+-			$ico = imageThumb($ico, $width, $height);
+-		}
+ 		$w = imagesx($ico);
+ 		$h = imagesy($ico);
+ 
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index 75ba16a450..f55890a456 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/oldstable/5.4/${BPN}-${PV}.tar.
     file://CVE-2023-32726.patch \
     file://CVE-2023-32727_0001.patch \
     file://CVE-2023-32727_0002.patch \
+    file://CVE-2025-49643.patch \
 "
 
 SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"

