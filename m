Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C43CD4F4B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:10:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.18432.1695377441242815265
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g4YudUkV;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: pdoshi@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-690b8859c46so1733574b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695377440; x=1695982240; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FRVMpefvgOE/I8kl3gD7X4GraiO6zHFqCM5pf/XyK0=;
        b=g4YudUkVSjM8ioPsxxxF/GmgbnlNo2njcjKWqN5QLOXH5Oq19uXl+xYL8SMy144lzA
         OjwGoyGh1c79+Kx0aLafS531yxmRLXKfYdGXKTEzLqFdCMUPLMVMzYbefRiw5HMlVpq+
         Od1M5mO4aNKGijbZ2WwkgpPaieQQtovlvLH0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695377440; x=1695982240;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FRVMpefvgOE/I8kl3gD7X4GraiO6zHFqCM5pf/XyK0=;
        b=pGJkyAaXE5uq0w/Xol8kACbj/27GFv07W3WGb1UIKSplnJ45EdImOY8+PdkeWab8Kq
         s0ccwPjV3RLApYh5k3/JkxFc+F9uIo3wRvHauP0GDoLOKk+vq/6ds8BMiUBzJZy4tce5
         TsUvi7eH6/fvmWmWbDsKaYB8gPjXdVsa38KvB9Uusbb3vqoyTCI3PUUIpTZVg9Udt/8+
         XU++AljzMouWmamt4UBBygCuOzjRhorIn/fJkWHXcPt7lfbSq7akxs0oEKn7EEYkEadQ
         1IKjdR9YvcVUli8EgDzBAdQqOCdeO1v5GyV8wWFHcQKGMPFEcagnGiqoLb8TpgkfF8gc
         xefg==
X-Gm-Message-State: AOJu0YxoItD4Tn2xn1Y7kyWua/0sAMkxu57Y8kx8oiJAOsIl5Yj4uYjx
	G5JjI+V4+iTgjGaAZqMdNprKtXfsvpOQABsWhL8=
X-Google-Smtp-Source: AGHT+IE5LYZp0xPpYo4xIac8UC0zVnH4hEUrjfMTijofUqHDu6ErqDALzIfRsNHbme5Cb6xzVXQGAA==
X-Received: by 2002:a05:6a00:16d1:b0:68c:5cec:30d4 with SMTP id l17-20020a056a0016d100b0068c5cec30d4mr8781816pfc.27.1695377440368;
        Fri, 22 Sep 2023 03:10:40 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 22-20020aa79216000000b00690dbab1623sm2838939pfo.81.2023.09.22.03.10.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Sep 2023 03:10:39 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [oe] [meta-oe][dunfell][PATCH v2] open-vm-tools: Security fix for  CVE-2023-20900
Date: Fri, 22 Sep 2023 15:40:30 +0530
Message-Id: <1695377430-11566-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105049

From: Priyal Doshi <pdoshi@mvista.com>

Backport-from: https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f31c40c725fb0b8520b16

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 ...X509-certs-to-verify-the-SAML-token-signa.patch | 35 ++++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch
new file mode 100644
index 0000000..38daa05
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch
@@ -0,0 +1,35 @@
+From 7f3cced1e140ed36c6f8f66d7f4098323b0463b2 Mon Sep 17 00:00:00 2001
+From: Katy Feng <fkaty@vmware.com>
+Date: Fri, 25 Aug 2023 11:58:48 -0700
+Subject: [PATCH] Allow only X509 certs to verify the SAML token signature.
+
+Upstream-Status: Backport from https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f31c40c725fb0b8520b16
+CVE:  CVE-2023-20900
+Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
+---
+ open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
+index 2906d29..57db3b8 100644
+--- a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
++++ b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
+@@ -1275,7 +1275,14 @@ VerifySignature(xmlDocPtr doc,
+     */
+    bRet = RegisterID(xmlDocGetRootElement(doc), "ID");
+    if (bRet == FALSE) {
+-      g_warning("failed to register ID\n");
++      g_warning("Failed to register ID\n");
++      goto done;
++   }
++
++   /* Use only X509 certs to validate the signature */
++   if (xmlSecPtrListAdd(&(dsigCtx->keyInfoReadCtx.enabledKeyData),
++                        BAD_CAST xmlSecKeyDataX509Id) < 0) {
++      g_warning("Failed to limit allowed key data\n");
+       goto done;
+    }
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 9a1b3f4..e3b15e3 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
     file://0001-utilBacktrace-Ignore-Warray-bounds.patch;patchdir=.. \
     file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
     file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch;patchdir=.. \
+    file://0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch;patchdir=.. \
 "
 
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
-- 
2.7.4


