Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06531C4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 01:37:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.149947.1672105064859749098
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 17:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=exzm60cP;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u7so11925559plq.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 17:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl7oTwHtNL3luRmTz79WqDwaCDMe060lPB7jTy7GUzk=;
        b=exzm60cP9Gubo+MN4FHcIESCAf+KmLz92i9E10ne0OWdtPrxlVFUuJuvbqARIE+jCy
         NljNTr/Odg5LdTbUpH9nR/UjFYaVqtocElQf/e2TT9qKCfjxvSBDV5mrQ+sM9mAxd5g8
         cNTc7ayj8hycuddkUv/loAZ+xO7OFRXUPsEhkQonZWSEgPwBhdHGDlNFiDPss+NDiC7F
         9VsmO8KYXCVSaJjXNsgyF13UXEcypVekLSPr0E/RmuIH6NXoGObPhhk6WDmZaoZj8mvM
         eBvM/0bETXC+KA7eRD3qhsb06VeaPx5YfOU/b82Oo2YYZtySnD/gryFjpYAqT32gdhQA
         zoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl7oTwHtNL3luRmTz79WqDwaCDMe060lPB7jTy7GUzk=;
        b=x1jqmCt7b/Vb5CEs1qCGQd7cMLGg16CSYgXnIsm3bLiqRkG7hczcrHK1SC+D48Gh+I
         c94tByZPTY049XWrRQ7RU+sFclL3CZO9VR9VwZlwuCAUV4DXcf3eqKlIW6FzPv0PTcoM
         xTF3tNtBThP8AHFnytskUDnoR992ThX5Swxe+uoQRso5G18xQZhDsq8lamJLQtJCF5Tw
         lJUA8LixG7JhTQuBJCi4qTgGOJ/y60SZuOSNdKPLk7ZxnTUKy21EOEUoTtwFPcVwWF2l
         eSZpDgfMQ+Eb3SbU+xTpRpKxSxKp/LR110e2jGOpRzWOapJc9FsPNWD1SvifCoQf0z4x
         Jp2Q==
X-Gm-Message-State: AFqh2krkFIjadG7C2eYfVT9Wrqk3V72OgAJylHlXqw7dCEZXR/2R2Yij
	qZ8/sIy8PGLRS+S5FQMPgY2DOfo+QkY=
X-Google-Smtp-Source: AMrXdXuyV0TmYTsOYt8CgJ6jmhf3OmAGBrERmi3lW15TrHADSdACNDV0nWYC1Z8vdwMh2K1XBM3Rzw==
X-Received: by 2002:a17:902:904b:b0:186:95c9:ddc9 with SMTP id w11-20020a170902904b00b0018695c9ddc9mr25924172plz.55.1672105064082;
        Mon, 26 Dec 2022 17:37:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709027e4d00b00183c6784704sm7596442pln.291.2022.12.26.17.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:37:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2 4/6] python3-wxgtk4: Do not use GetAssertStackTrace with USE_STACKWALKER disabled
Date: Mon, 26 Dec 2022 17:37:36 -0800
Message-Id: <20221227013738.3840802-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221227013738.3840802-1-raj.khem@gmail.com>
References: <20221227013738.3840802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 01:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100252

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...y-use-GetAssertStackTrace-under-USE_.patch | 32 +++++++++++++++++++
 .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  9 +++---
 2 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch
new file mode 100644
index 0000000000..f8a3061ae0
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch
@@ -0,0 +1,32 @@
+From b9f95c06b2e7a525f4f93d705976882e8dcba6ab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Dec 2022 09:46:31 -0800
+Subject: [PATCH] sip: Conditionally use GetAssertStackTrace under
+ USE_STACKWALKER
+
+Musl eg. does not implement stack walker ( backtrace ) therefore it gets
+disabled for wxwidgets on those systems. This needs to be checked before using
+GetAssertStackTrace()
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sip/cpp/sip_corewxAppTraits.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sip/cpp/sip_corewxAppTraits.cpp b/sip/cpp/sip_corewxAppTraits.cpp
+index 9c9f9d5b..1d2d2f90 100644
+--- a/sip/cpp/sip_corewxAppTraits.cpp
++++ b/sip/cpp/sip_corewxAppTraits.cpp
+@@ -471,7 +471,11 @@ static PyObject *meth_wxAppTraits_GetAssertStackTrace(PyObject *sipSelf, PyObjec
+             PyErr_Clear();
+ 
+             Py_BEGIN_ALLOW_THREADS
++#if wxUSE_STACKWALKER
+             sipRes = new  ::wxString((sipSelfWasArg ? sipCpp-> ::wxAppTraits::GetAssertStackTrace() : sipCpp->GetAssertStackTrace()));
++#else
++            sipRes = new  ::wxString("");
++#endif
+             Py_END_ALLOW_THREADS
+ 
+             if (PyErr_Occurred())
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
index df23037fc6..bf87b0a73d 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
@@ -11,10 +11,11 @@ DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
 PYPI_PACKAGE = "wxPython"
 
 SRC_URI += "file://add-back-option-build-base.patch \
-            file://wxgtk-fixup-build-scripts.patch \
-            file://not-overwrite-cflags-cxxflags.patch \
-            file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
-            "
+           file://wxgtk-fixup-build-scripts.patch \
+           file://not-overwrite-cflags-cxxflags.patch \
+           file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
+           file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
+           "
 SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
 
 S = "${WORKDIR}/wxPython-${PV}"
-- 
2.39.0


