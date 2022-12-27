Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13963C3DA79
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 01:37:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.149944.1672105063284330260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 17:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UMjugU7n;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso15946487pjp.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 17:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaVz3dcQ9+rp9I9Fpx60of3IhTzgCEaJqLVo/Wnol14=;
        b=UMjugU7nVasXr+YdP9VhYY4Tqvd8d7PzNlVKVuSVQ88P9BnqBW86K4ObVaK2/iXTyM
         CUVsBMcRrtb1mWLLOJekTMHS5JLcLXi9guQakmPCNBhYVqdbebF+VZfo45khu1TVAJYb
         /pWOnDuQlaQ+vRWycyNFN1y/c3rdE5YrquPYtMLGHXbDeVvcdUMpD4n04rumrLTIyzWr
         NReF/fAgdEhtA8XD2HCq6RtZu7+pf58FJbkZZvlsd9NK1R7vOWMDxDEOK6VQ+E1q0ReM
         FP6SWBvCxOgOcTH6SiOKGwLNXuBd1DqUQ7pItQFAKlsjPZb4buH9yEdu+qXXu8HLWxTJ
         AuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaVz3dcQ9+rp9I9Fpx60of3IhTzgCEaJqLVo/Wnol14=;
        b=K3LI2q+99+qHRULErXZ2IDA7hVjt85wLN6qHHeyMjpUwDNZ+2RrLDftQZ3JkxW3lu9
         ED9ZU/JXCajvEmAClLyr14yPVGay0oevF0GInHHEC5e8k3szcqGO1RGxFoizfoX/QpfG
         GA4hdpTSDoG86IiPDqsHgFiygJkP3vVDMlFgj/FGYsj1EpPAkiRSFbT5+fcNOhzvoYAp
         8j4XnuCmF1yZE/txHLuEstEcIm/tm1qlfad1w0gqSO1SJEURIS5YQOWfPsHBxuxBRCzc
         nWcbVEFJMDLwYIDRsAbAzAawybrFjLfdbiIpaWGbilTvTzxRRz3vcgGXYVzk/hLg3MDU
         L3MA==
X-Gm-Message-State: AFqh2krX3WtH4j3ZcpIgDP41O+qVVRu++zmtiSeyg2v6CV5J6P+2GgdV
	6+AsrUzK2uIz6AyVM/D2Hk2z2bn6mRE=
X-Google-Smtp-Source: AMrXdXs2JTafqDDW1US//0uaE99HSKtxEVc3MJJVE+Brom0VzY2hYiSGG/Guexyo0e4dqGG/KhisbQ==
X-Received: by 2002:a17:902:ccd0:b0:189:6ab3:9e57 with SMTP id z16-20020a170902ccd000b001896ab39e57mr23087923ple.22.1672105062090;
        Mon, 26 Dec 2022 17:37:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709027e4d00b00183c6784704sm7596442pln.291.2022.12.26.17.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:37:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 2/6] wxwidgets: Fix locale on musl
Date: Mon, 26 Dec 2022 17:37:34 -0800
Message-Id: <20221227013738.3840802-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221227013738.3840802-1-raj.khem@gmail.com>
References: <20221227013738.3840802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 01:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100250

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wxwidgets/wxwidgets/musl-locale-l.patch   | 32 +++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.1.bb              |  4 +--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
new file mode 100644
index 0000000000..f83d2d4458
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
@@ -0,0 +1,32 @@
+these macro'd away functions don't exist in musl (yet)
+diff --git a/include/wx/xlocale.h b/include/wx/xlocale.h
+index c433d25..3ab9d84 100644
+--- a/include/wx/xlocale.h
++++ b/include/wx/xlocale.h
+@@ -33,6 +33,26 @@
+ #include "wx/crt.h"     // Includes wx/chartype.h, wx/wxcrt.h(wx/string.h)
+ #include "wx/intl.h"    // wxLanguage
+ 
++#ifndef strtol_l
++#define strtol_l(s, p, base, l) strtol(s, p, base)
++#endif
++
++#ifndef strtoul_l
++#define strtoul_l(s, p, base, l) strtoul(s, p, base)
++#endif
++
++#ifndef wcstod_l
++#define wcstod_l(s, p, l) wcstod(s, p)
++#endif
++
++#ifndef wcstol_l
++#define wcstol_l(s, p, base, l) wcstol(s, p, base)
++#endif
++
++#ifndef wcstoul_l
++#define wcstoul_l(s, p, base, l) wcstoul(s, p, base)
++#endif
++
+ // The platform-specific locale type
+ // If wxXLocale_t is not defined, then only "C" locale support is provided
+ #ifdef wxHAS_XLOCALE_SUPPORT
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index 03a75d8bd3..ae2995db20 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://not-append-system-name-to-lib-name.patch \
            file://wx-config-fix-libdir-for-multilib.patch \
            file://0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch \
+           file://musl-locale-l.patch \
            "
 SRCREV= "97e99707c5d2271a70cb686720b48dbf34ced496"
 S = "${WORKDIR}/git"
@@ -39,9 +40,6 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
 "
-EXTRA_OECMAKE:append:libc-musl = " \
-    -DHAVE_LOCALE_T=OFF \
-"
 EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 
 # OpenGL support currently seems tied to using libglu, which requires x11
-- 
2.39.0


