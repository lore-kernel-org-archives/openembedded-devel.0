Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EDCCD4F43
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 09:37:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.17464.1695375448584366945
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 02:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VJMq6zVT;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: pdoshi@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-690bd8f89baso1717720b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695375448; x=1695980248; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SugIdqKRz10Ff4tRj+NiGxEjzP1QsHs3yUuIpj/MJ+0=;
        b=VJMq6zVT6HIGSfaPQ1hekO4UR7fdBdeKmN3dTEQLqk0Bq4DvbeEZ+oVbsgZKubVENb
         orwZ9C6XKMeDK+hXGavrQ4aoqdWLjWj+dBzvS9VXO1v/SG3xJojNpEmFXEvRNuATuONP
         0km/mOe+zqM+UhcZ4CrTC5tIgVox6PoHFKmXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695375448; x=1695980248;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SugIdqKRz10Ff4tRj+NiGxEjzP1QsHs3yUuIpj/MJ+0=;
        b=ejEoco8KqdPypSYCJ5AC/zI+mdRYBygzvZmyL+bP2TKBABTBAK0TCch29bv5OsrOgv
         dbr1sYtzZJgBMocxVT6HwDMRMxmkD2szEtB0OGj7iqtkeA91HF9G/NSbFRwEBgqZAtyK
         tTmH+vssUOQvLkDxoScyqp2sECuV0XnIewjSu6TN26e+MUnBeLV3N/z1C4DlxyWHIi+I
         ew8ldc/aayc1ZAhE+nsRYaSFbPEtwuVBnogO6OpUq8npIo0TvgtvWFywYl8ssVRDgm3x
         KnjaxUrZmal34eequZdUrNGggXgGN0fI1a6tclQ5MIJEz67JmAa8hOadA42TPSqX+uqa
         SGrw==
X-Gm-Message-State: AOJu0YxQClMWK3xYM/ACGxSFQLIC1xPct2HmknREP2xLPd70jyoKJiON
	6HBft5HlvQ3AG37WnEpzfQ7rkbrAjLrG5SR3BQg=
X-Google-Smtp-Source: AGHT+IHR9z9HWLzk6lr7WLWN8ZUcMbvACOZJo8edld0EqriE0QRsTOygEh1SQ9wsNFkGWRQc5hI8GQ==
X-Received: by 2002:a05:6a00:2404:b0:68f:f33a:7ee9 with SMTP id z4-20020a056a00240400b0068ff33a7ee9mr8536364pfh.29.1695375447691;
        Fri, 22 Sep 2023 02:37:27 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id n24-20020aa79058000000b0068fb5e44827sm2770313pfo.67.2023.09.22.02.37.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Sep 2023 02:37:27 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [oe] [meta-oe][dunfell][PATCH] Backport-from: https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f31c40c725fb0b8520b16 Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Date: Fri, 22 Sep 2023 15:07:17 +0530
Message-Id: <1695375437-11337-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 09:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105047

From: Priyal Doshi <pdoshi@mvista.com>

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


