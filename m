Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C10C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 04:34:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.35586.1674448469873983068
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 20:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j3U62o1/;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id z13so10254428plg.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 20:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/jhw7461iFx8vfE+DKiCcyuvZJH5OfULv47LwJ2cVU=;
        b=j3U62o1/8v/kYbaMNYddwx7OOU1iYzQdbZGTFTGsXMs6o305ZJzEAE9N5gZ3IQW3tu
         v95E3FtXupd8XOykb6yNY88guLC6xvbOQkqXTtPj5UOdheEUieL8juNAjzE3f27oMHbl
         91cS49BimqfWtQY76cVlivKsEdp73+BLkCtjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/jhw7461iFx8vfE+DKiCcyuvZJH5OfULv47LwJ2cVU=;
        b=K/Xf7QWgoGqXUsljJZn5OB/Bny5Yn5G5yiS/7szX3fb/ER1e5vb/1sMg4IXHcmeHiF
         W7fx9C28LvHvoiqVIgRLbWYlJ/RFXGiFfnEP8qjoGwCSC+0mDn1m0HziFJH1124TC+VK
         hGdWksPG5Xtqe8zErucwI3GwaNCg480vgKEp3WqlVPgCnd6S81TE7AF4E8WJ+c8sB5aH
         FnKZeu0o+P3CmRJHBtDZmI+/dfK2GCJhknFybuLC1levVdumsePlajwyxpqYgeNx4a6w
         Nn4e8SSMpFdjhM8HeJQgnz8q9GmH+RoMro/o9yW/6n0pmdhwnP/MsN+dEeGtNz4MRp56
         epXA==
X-Gm-Message-State: AFqh2kqdO7UF2eKGAnAqTKGsrzogqchrQhP1LYeFgT8cIxKYE45DQLG6
	HwRLGH5K/GcrwvUFL2z/148KUJwaTzMWVO9K
X-Google-Smtp-Source: AMrXdXvELG/NBknq6+JucTR/o6hnXTF2tLm8PsGyHeJXXzNF0JLSgWQCCp6eIlw9Lu0iWubcRQo9sg==
X-Received: by 2002:a17:903:182:b0:194:7532:fb10 with SMTP id z2-20020a170903018200b001947532fb10mr31412122plg.40.1674448469161;
        Sun, 22 Jan 2023 20:34:29 -0800 (PST)
Received: from MVIN00024 ([103.250.136.192])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b001947b3ec2d7sm16696036plx.307.2023.01.22.20.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 20:34:28 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 23 Jan 2023 10:04:23 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing
Date: Mon, 23 Jan 2023 10:04:22 +0530
Message-Id: <20230123043422.6120-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jan 2023 04:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100709

Upstream-Status: Backport from https://github.com/krb5/krb5/commit/4e661f0085ec5f969c76c0896a34322c6c432de4

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


