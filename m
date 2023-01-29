Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D13C636D6
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.25727.1675026046995950153
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZcFFqg1;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id bx13so2776984oib.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoTWEVP5cTSbFsQ6vVOg3ihl2GdzsnlJRAs+JIPRJYs=;
        b=EZcFFqg1tI3E+uUPkZ3cllmLnKAiYt5cjiOpmhuj8uRfZPQfLtuoxtqfOecxUPKGax
         MrOvv6QPybNI4Z+CHhcAnrpbc/gSifWls+OYGEl6M8KE4FSAvMZXn0wPEIi9ZImbfCoO
         K+N4RH/1QElXGTZb4vsKTX0vhY9Uoai1a951XKyLMpwKmaB7VzSi0kVWE7JCnEl1/QXJ
         55Zcxw8k1Glg/3EaDLAc1mbNHyyeHMHQ+454QQdocK/oxvTX9ieHMGV7lHAuGXUyHB92
         y+HjcjBVU2FYr7YTfWQisXRvtEyGT5HUkEMXHuriBBU9pp24YZz1Wqb0Pa3NP+ZsorYY
         JonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoTWEVP5cTSbFsQ6vVOg3ihl2GdzsnlJRAs+JIPRJYs=;
        b=Wl97HcxJF2Lt3FvWRSIA1TvBjtiwOy1epzqJSEmsl1kStvkSz5HwHPsuslyadZBDKF
         zvPg3zyb80ztTVEJcEmhMbB36T5fR9uOf++gZWBNeHE1zvXSdwwUEjFqWqHf+8xQujMe
         A9DaejbiimvnABdIXntNW7ctJOr9V1nTkSd4w3z4+0s9lKCfDRcm8f/AEx3qyWZY3LDJ
         5Qk0623jxsVHNO9PnW/vOWuaG8tU4BqOMynbTTqW0ZoH5JF7WQSnAcpqDl0M+pN5cpe5
         2ZWvMZVHRczekZjrcD6m3+vQKHDBnCBKcWS8tGZZ+PeYj6otStsBuHJ4I03eGW9VoGLv
         Q8BQ==
X-Gm-Message-State: AFqh2kpucWoykqptI2IHz/bDQbj159PUAuyotQ8vhVoNESk+Pac3Tejt
	JNJ2532fnjkhBoq1XuRFnPP95+bq52s=
X-Google-Smtp-Source: AMrXdXsWay8+3aZbwGEzobOyzPbf7T5d8v0DdegcmJFEHe+dK38ExQWBVcoi02DlBJ/vwcKLsenhig==
X-Received: by 2002:a05:6808:3a95:b0:35e:de13:2dea with SMTP id fb21-20020a0568083a9500b0035ede132deamr20347114oib.7.1675026046119;
        Sun, 29 Jan 2023 13:00:46 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 05/10] krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing
Date: Sun, 29 Jan 2023 16:00:33 -0500
Message-Id: <682c7c7a7bbe04927d3425895accf537c3ca994a.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100839

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/krb5/krb5/commit/4e661f0085ec5f969c76c0896a34322c6c432de4

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../krb5/krb5/CVE-2022-42898.patch            | 110 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch
new file mode 100644
index 0000000000..6d04bf8980
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch
@@ -0,0 +1,110 @@
+From 4e661f0085ec5f969c76c0896a34322c6c432de4 Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Mon, 17 Oct 2022 20:25:11 -0400
+Subject: [PATCH] Fix integer overflows in PAC parsing
+
+In krb5_parse_pac(), check for buffer counts large enough to threaten
+integer overflow in the header length and memory length calculations.
+Avoid potential integer overflows when checking the length of each
+buffer.  Credit to OSS-Fuzz for discovering one of the issues.
+
+CVE-2022-42898:
+
+In MIT krb5 releases 1.8 and later, an authenticated attacker may be
+able to cause a KDC or kadmind process to crash by reading beyond the
+bounds of allocated memory, creating a denial of service.  A
+privileged attacker may similarly be able to cause a Kerberos or GSS
+application service to crash.  On 32-bit platforms, an attacker can
+also cause insufficient memory to be allocated for the result,
+potentially leading to remote code execution in a KDC, kadmind, or GSS
+or Kerberos application server process.  An attacker with the
+privileges of a cross-realm KDC may be able to extract secrets from a
+KDC process's memory by having them copied into the PAC of a new
+ticket.
+
+(cherry picked from commit ea92d2f0fcceb54a70910fa32e9a0d7a5afc3583)
+
+ticket: 9074
+version_fixed: 1.19.4
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/4e661f0085ec5f969c76c0896a34322c6c432de4]
+CVE: CVE-2022-42898
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lib/krb5/krb/pac.c   |  9 +++++++--
+ src/lib/krb5/krb/t_pac.c | 18 ++++++++++++++++++
+ 2 files changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/krb5/krb/pac.c b/src/lib/krb5/krb/pac.c
+index cc74f37..70428a1 100644
+--- a/src/lib/krb5/krb/pac.c
++++ b/src/lib/krb5/krb/pac.c
+@@ -27,6 +27,8 @@
+ #include "k5-int.h"
+ #include "authdata.h"
+ 
++#define MAX_BUFFERS 4096
++
+ /* draft-brezak-win2k-krb-authz-00 */
+ 
+ /*
+@@ -316,6 +318,9 @@ krb5_pac_parse(krb5_context context,
+     if (version != 0)
+         return EINVAL;
+ 
++    if (cbuffers < 1 || cbuffers > MAX_BUFFERS)
++        return ERANGE;
++
+     header_len = PACTYPE_LENGTH + (cbuffers * PAC_INFO_BUFFER_LENGTH);
+     if (len < header_len)
+         return ERANGE;
+@@ -348,8 +353,8 @@ krb5_pac_parse(krb5_context context,
+             krb5_pac_free(context, pac);
+             return EINVAL;
+         }
+-        if (buffer->Offset < header_len ||
+-            buffer->Offset + buffer->cbBufferSize > len) {
++        if (buffer->Offset < header_len || buffer->Offset > len ||
++            buffer->cbBufferSize > len - buffer->Offset) {
+             krb5_pac_free(context, pac);
+             return ERANGE;
+         }
+diff --git a/src/lib/krb5/krb/t_pac.c b/src/lib/krb5/krb/t_pac.c
+index 7b756a2..2353e9f 100644
+--- a/src/lib/krb5/krb/t_pac.c
++++ b/src/lib/krb5/krb/t_pac.c
+@@ -431,6 +431,16 @@ static const unsigned char s4u_pac_ent_xrealm[] = {
+     0x8a, 0x81, 0x9c, 0x9c, 0x00, 0x00, 0x00, 0x00
+ };
+ 
++static const unsigned char fuzz1[] = {
++    0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00,
++    0x06, 0xff, 0xff, 0xff, 0x00, 0x00, 0xf5
++};
++
++static const unsigned char fuzz2[] = {
++    0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00,
++    0x20, 0x20
++};
++
+ static const char *s4u_principal = "w2k8u@ACME.COM";
+ static const char *s4u_enterprise = "w2k8u@abc@ACME.COM";
+ 
+@@ -646,6 +656,14 @@ main(int argc, char **argv)
+         krb5_free_principal(context, sep);
+     }
+ 
++    /* Check problematic PACs found by fuzzing. */
++    ret = krb5_pac_parse(context, fuzz1, sizeof(fuzz1), &pac);
++    if (!ret)
++        err(context, ret, "krb5_pac_parse should have failed");
++    ret = krb5_pac_parse(context, fuzz2, sizeof(fuzz2), &pac);
++    if (!ret)
++        err(context, ret, "krb5_pac_parse should have failed");
++
+     /*
+      * Test empty free
+      */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 6e0b2fdacb..cabae374e1 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-admin-server.service \
            file://CVE-2021-36222.patch;striplevel=2 \
            file://CVE-2021-37750.patch;striplevel=2 \
+           file://CVE-2022-42898.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.25.1


