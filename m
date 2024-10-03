Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12C8CF34B9
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 15:50:47 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.109.1727970639513366132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 08:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4n48nIl;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e0719668e8so574850b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 08:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727970638; x=1728575438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPUNfEEQI/qQXg7Dac1Rfik4tv3vqL6wIDqCso/rBng=;
        b=K4n48nIlnQZuWgJFuoCbPCkCFM3jsz4j20fMS7fHmupNmPQBORUZpDi5OomqhkpcJS
         fVlof27QU0JhOGW4hUFo6Hib+W8Na4+DAKlSSYNqaY2c/dtzvi4k7CbS75nRbunmqVzh
         aheRPG0LGsm7VrjVp75lJBfS8dCt6m/GCEK0tHSyBj4Vs0A8UXlBR8FmfH5hQdfSFnSX
         EtMkQfebVIHeJLh+ItDCatzAoMKUxhcTGoUQATlvFaGHHTqDOTIXHEAOhODe7422gKeN
         yT6In3hr1xgLMnMH8yN9MpJRabhB4TTzwCXaB23fimVt3etLuWKoJCUJFHkoqDCY+aLg
         6weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970638; x=1728575438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPUNfEEQI/qQXg7Dac1Rfik4tv3vqL6wIDqCso/rBng=;
        b=fG/HJsDZRVAHRrD4Ltkft9DQE8JhiQJgKvG7mKSLqGcqqFyvSN09UH9KMkPGv79Cho
         uAnK1fg6WwbnKtjT5BnZwgBhgIDrbL/9vFiE0CRlrfubxbabv2lzKYhPmDf83Aob0rvY
         lPxmHgraoNps+d9TK6lS2nUiEKocISB+SphDSoQXWL4WG7cY0fhNI6/sHGRDZ7X/LhBr
         B5XkJ/8psiTLW5An/zpOjBLc6iSuSKqn6wSmYystztMmn4/H6jyZUuadowEJXKPaWjG2
         uolpnk30FhYXX26ksG0GKvOYAcmlOqkm0BgQ8Le0cTU7fcthloCcMF/S4oOoVrqMuvTd
         4sUQ==
X-Gm-Message-State: AOJu0YxO2+Bi93PmmULPApcINf8tvlWVcO9AD59/wHB67L/dWQe0SLyF
	OCzsewpB+r9TDOm2FFdt7B+DOX9ZKzAEuOCsYXA1SBNczLoWL/FaiB4FtC4K
X-Google-Smtp-Source: AGHT+IFHc2zgFgg2N4FrdYZdMsZyNRn28Xt2mc+Fq2HxljUn620OuCGLpWX0ucghtHxHIwi+97sG+Q==
X-Received: by 2002:a05:6808:1806:b0:3e3:8be6:c4f5 with SMTP id 5614622812f47-3e3b417b5cemr5116159b6e.45.1727970638605;
        Thu, 03 Oct 2024 08:50:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1340])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dbcf0a73sm983311a12.10.2024.10.03.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:50:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] webkitgtk3: Fix build break with latest gir
Date: Thu,  3 Oct 2024 08:50:35 -0700
Message-ID: <20241003155035.1070562-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003155035.1070562-1-raj.khem@gmail.com>
References: <20241003155035.1070562-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 15:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112651

Reported with clang-19

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...b1773bff2ef7c3b867ab019d69faa36c010d.patch | 33 +++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.44.3.bb            |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
new file mode 100644
index 0000000000..3d76aa4e4d
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
@@ -0,0 +1,33 @@
+From fff1b1773bff2ef7c3b867ab019d69faa36c010d Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 3 Jul 2024 13:36:54 -0700
+Subject: [PATCH] WebKitDOMEventTarget.h:95: Warning: WebKit2WebExtension:
+ invalid "scope" annotation: only valid on callback parameters
+ https://bugs.webkit.org/show_bug.cgi?id=276180
+
+Unreviewed build fix.
+
+Emmanuele recommends using (type gpointer) for the GCallback parameter
+of webkit_dom_event_target_remove_event_listener, since it won't be
+called and is therefore not functioning as a callback.
+
+* Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h:
+
+Canonical link: https://commits.webkit.org/280639@main
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/fff1b1773bff2ef7c3b867ab019d69faa36c010d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h           | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h
++++ b/Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h
+@@ -92,7 +92,7 @@ WEBKIT_DEPRECATED gboolean  webkit_dom_e
+  * webkit_dom_event_target_remove_event_listener:
+  * @target: A #WebKitDOMEventTarget
+  * @event_name: A #gchar
+- * @handler: (scope call): A #GCallback
++ * @handler: (type gpointer): A #GCallback
+  * @use_capture: A #gboolean
+  *
+  * Returns: a #gboolean
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 0dadf570e2..01eefe13de 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            file://0001-Fix-build-issues-with-latest-Clang.patch \
+           file://fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch \
            "
 SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 

