Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B7DC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 04:53:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.35802.1674449625434143616
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 20:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gI6baKIy;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id jm10so10245832plb.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 20:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ+tCYZihp/H6qYmJsn0zFc5HWqNgW8Gb2G81oRloBY=;
        b=gI6baKIyqjDLFhGanbiU6XsEB6+VnMiOoPzSHYnOaDL8igRCq1pvsTvBb+T59oiJPV
         3ai8X2Ax5gFqumHyzq51oKP0Fgu3+8OW7P401XugkI0uXaIgwZzVKkCl1/Zs1w14pEI3
         mF5IY6cKttPJ2K34kzN7VM4IxY3p5Co3LRATs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQ+tCYZihp/H6qYmJsn0zFc5HWqNgW8Gb2G81oRloBY=;
        b=Wgql8qYgglR4A7iCmLSNkc+gJ2fck2aMz4Ne2V0PZ9p+jK2LtwMcgi+/p5OFtAzr+s
         CCMDRHCH4sfwWOCuB6VQPAh1NslX1+yLMo8hlFfROGto4SS3BWX1Ms882b8RUY2wM3a6
         WRR2/RmpMYnY3OM+s5BCoF74XRVhURpe4maG0ebxH9d6KN8EPOrdQZQPEu3LOEmiSmR4
         XSuYv1DWB1iOLro7uzuf245soRMNZJjY3OFKYpwnxFwqN9iXcTgSwPj4/Q3QMJongYMH
         nigo4/h0hqMNfIJUzShq9boBljwaAxDR/DUsqQXwjTDZR4adZd9ujtj1dr3Wjw1NHJDL
         PY2A==
X-Gm-Message-State: AFqh2kqd/kC7J7VHjS/t6LVcUjtDWccsniFNbsvTQPC0TCRCX2dpTX30
	2S42ET1bcX6OXJNJpEKLOiLRqcm1GogPGpDv
X-Google-Smtp-Source: AMrXdXsyhor6VnxeLJ1c1uNP7SQuSpX4riJtaPrg4XXt3bWyvBL2iFSR2zqOmrjBA19Yn0PkMHOpTg==
X-Received: by 2002:a17:903:2306:b0:194:7b59:bfe4 with SMTP id d6-20020a170903230600b001947b59bfe4mr36433582plh.54.1674449624732;
        Sun, 22 Jan 2023 20:53:44 -0800 (PST)
Received: from MVIN00024 ([103.250.136.192])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e85100b0018f6900a183sm17773971plg.140.2023.01.22.20.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 20:53:44 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 23 Jan 2023 10:23:39 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing
Date: Mon, 23 Jan 2023 10:23:37 +0530
Message-Id: <20230123045337.6914-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jan 2023 04:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100710

Upstream-Status: Backport from https://github.com/krb5/krb5/commit/4e661f0085ec5f969c76c0896a34322c6c432de4

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../krb5/krb5/CVE-2022-42898.patch            | 110 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.1.bb  |   1 +
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
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
index ae58e2df35..ebcfbc524c 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
            file://CVE-2021-36222.patch \
+           file://CVE-2022-42898.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "417d654c72526ac51466e7fe84608878"
 SRC_URI[sha256sum] = "3706d7ec2eaa773e0e32d3a87bf742ebaecae7d064e190443a3acddfd8afb181"
-- 
2.25.1


