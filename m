Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2178CC3DA7A
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:29:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.57664.1671560963045290197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EvwlZsY7;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id v23so8024839pju.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl7oTwHtNL3luRmTz79WqDwaCDMe060lPB7jTy7GUzk=;
        b=EvwlZsY7yBI6JjkbXG9gpnEz+Txi9T2usF2rKoBi1MEXgE2/DXmBJu54qRCKAoSnPI
         usxTavCXLm0EybmR5l1IK+zkM4qcjnJVEHsX2xO5I/wJwIzL8j6Lsr8WYf/+T+C/KX7e
         AUjNecY5LfhFtV7jhoYjTMqWBW2+6jZsSfv/a8i1WfezoQMNmCh9AGf1OWIUL/D1nPWm
         lSf3snQWtwFBloDVH7OgzNB2UW7PSFzHMxs082MQsdJIzPG/gPjpkt1Qjl4E34wqS5iK
         NmlFUFUYpsy47KwzvI7fynMF3C/1jX5iCvvUTjkNHwpUTD1kx4uW7rJjAUq2lQEQoMfn
         3MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl7oTwHtNL3luRmTz79WqDwaCDMe060lPB7jTy7GUzk=;
        b=4ryC8R/LsIFRZ/iDwLJUJacql9LegZwBrjbPjQICJ0hKaAAIriM3BpG5C+WiChx8R5
         naMgIpimWEUY2AZAKdPDTzEfSABXde3KOlfjlvib992CbI6Zta8trAOYC5jvP96aqmGV
         uXQcl3Nf8y4XXdUSMxvQQHGGdrgIXJel7oevot9nFFmOI6nk4OhlkJFgxVdQTEw8aLIb
         +RNE/OAUZ/zSCqUAgTavuCVLPWx2uSfP0jaFHqpcAEk26AdeWztMpufCwcp+l5XQRPBy
         2rZUoFljuicRd9YwytOrrZJe8x7U5YV07cNAQdaxW/Lay1L7ZIh/MsTdlpDYm0wyyjVE
         cUXg==
X-Gm-Message-State: AFqh2kpHeU4fXw4Ox9K/Eyj/aUApUzGWP7P+lF3U7Xf/HIwMp2s/+aGw
	y+pLApOp1OI+kLgo2D7anWUlXpuJ3xc=
X-Google-Smtp-Source: AMrXdXvgBh+EaHyy+aXKVk13TiZ+CuHnT1KKtNwHxWChscya9bCQ6pVZGOpVMFLNTltQbM0jq33kow==
X-Received: by 2002:a17:90b:205:b0:223:f6c2:f21a with SMTP id fy5-20020a17090b020500b00223f6c2f21amr1463034pjb.35.1671560962137;
        Tue, 20 Dec 2022 10:29:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id z3-20020a17090acb0300b002199eaa80e1sm8267266pjt.13.2022.12.20.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:29:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-wxgtk4: Do not use GetAssertStackTrace with USE_STACKWALKER disabled
Date: Tue, 20 Dec 2022 10:29:19 -0800
Message-Id: <20221220182919.2420535-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220182919.2420535-1-raj.khem@gmail.com>
References: <20221220182919.2420535-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 18:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100164

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


