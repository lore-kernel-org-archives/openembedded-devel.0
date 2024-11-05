Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91028D2B94E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.19561.1730817433992060080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=er44N+mF;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea053b5929so45600147b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817433; x=1731422233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyEbBqKvW4VAwbFUEMOBpPgk+Qpu/W7Z5W00eEokiK4=;
        b=er44N+mFuv8VEOMH/PWtzxWPTUDdPy8ISs7J8VvioErX3C+lpL7baEoGnbGwkHpozj
         0joUBLuhbjncMooES5P4zUD6TXJ1QzdF4BUH+eP8FconJWQdZi8zW3M5bOs/CUrLVbt5
         1uwqoKEW2OTGuAsuNRljdAPdRnCVBysrAPz38PJW6QjLYoOmb6RMBqbyiaU1P8GEO2mR
         RvXhT48XSC0YaQba5cxzyDYPB/V6WS5zyFUsuElTqgGUizO2L4+dxqsry8WdP1Si7c2x
         aRkO4tDN6w6HIDr5SjqedR5JdNzn8IGSRiUIj0IzVqcA2LaKk+tYLosbr6DirP3+2WCA
         9OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817433; x=1731422233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyEbBqKvW4VAwbFUEMOBpPgk+Qpu/W7Z5W00eEokiK4=;
        b=iX2X9UfVznMZY6Uz4IK5kjdtxsB6gF5S2jIseRnDgpwdcY4S+kZJlS1YSsXoim71Yp
         1nbi9TEvSu9bfeJUKN17QEnZFr/Qpv3n11tnhxfnN0WNwRkoJ26GZ+cZOnvxBqmsBhW4
         /7Ovsd2xFI+AfM1jgKrMxcsjU+aethFi8m3CvPNYJyMG5CA/85MTtb0xV/dJpwcYKpsU
         THNH9qB4qprubMEzmWeKloNknBAU03KgLrh6EIYJGbIMnpSSJrmYNk2rPR8jPfEtV3cw
         EBuuIXcL0H9BQerdiio67G49RbsjsRQnWz5vdrFqSy5AQVdHgnuIPa2VrySqIaT/Pnhe
         b6nQ==
X-Gm-Message-State: AOJu0YzAKvwt7cf/xhWKG2c4HxNO2R+LZVgNRKZizpVnA+hKqG9hVgis
	xAd8Q6+cy1+9MyZ0n+okcXrG3vSdJYPNCYqrxkvLUCbbdkqP4IFGeTaBTw==
X-Google-Smtp-Source: AGHT+IELQHsbUr0ZOwSPBK651WM1Yyo38ssfpNvDq1FXKaimrLWjOu6KB+1+u3IjoKh1Glf8UzVX7A==
X-Received: by 2002:a05:690c:6207:b0:6e3:1903:5608 with SMTP id 00721157ae682-6ea64b1fd6cmr160264337b3.21.1730817432911;
        Tue, 05 Nov 2024 06:37:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 72/90] webkitgtk3: Fix build break with latest gir
Date: Tue,  5 Nov 2024 09:35:37 -0500
Message-ID: <20241105143638.2301245-73-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113490

From: Khem Raj <raj.khem@gmail.com>

Reported with clang-19

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7be0d59669f9bc102895bc0596c30805be0eda23)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
 
-- 
2.43.0


