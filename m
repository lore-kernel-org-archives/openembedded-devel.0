Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4F9D33998
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24.1764954697775132241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZDPvPBIn;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so30060085e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954696; x=1765559496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnLfxVLAjuzRZqFjVjHDs6L8U0nBd1pVUdgeSkMv1cw=;
        b=ZDPvPBInRep/mq3d1PiWLaM1HExCWfbT4gFDAVFjMlZGkIPphjMQI264vwGpr7T5j9
         jh4iDNFzhoiLWrVUUUiDhKa1ls/WE7L6N4Vp0N7MdWcsjb38wEhXAeexfvQUlQdDwdUm
         3hPy3VMvU71SNEf3DVYPKAmdil2c7TN+hUFTSALjDWXLqyB5ppW5zOad12RumnOFZtvZ
         khCNmZlaJRyAZBVavi2EN0JGmD+svTOczg/ho4BYviRjMPn5KXw3ma/xR3M3DhLSLsGV
         4t579MWYeBK4t0qurTi00D5lJ1agi+Qov2zZJkjPyObMJ4q6i2z85GuF04nmXM236Vlx
         aZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954696; x=1765559496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hnLfxVLAjuzRZqFjVjHDs6L8U0nBd1pVUdgeSkMv1cw=;
        b=Zf+9nPtP8BVn83vJsiFVYuHasuQqgy2Cq9vzEXCN6WpiNiZHhyXSwSd5OgB6uUVJNK
         cvAK5e1dkG3ks2Li0SjS7dtTwFLP5oSgSPKqY3hfClW/2kytRg9sx2wIlQKHNXpSviA7
         WkVDQs1rq6uFpPHgRzqVO2W//gIhvCiniIlHviJCTLjuoJCdvpnttH6kkpbP4l8yozAK
         ELaC7S5IdFvZXnRfBncIXgy4lj6kz1ye/mW6IdBQaEUJRF7I5cN2DUmYIUvR1Qyo94/u
         JGKH+/6ff92VXB8kjDa7p8q1csVPLFfyxrE+K3FuIq581dn4GR65SO4o4UpGX8sklVqf
         1Heg==
X-Gm-Message-State: AOJu0YwbcL2b+6fBlQD8wDXf/ImbS2R/lSpQY/Wuc1hXaoZgzIc/li9R
	DMOUpW2z5BaNqD/CLVZ0LWKMwKuZTo7nUziBTA6HbdHkMzHPkZjPo5NHaEwZ7g==
X-Gm-Gg: ASbGncvImZH9BuCkol5Qh69oF5hGfoErbo5OB87nYCTh1WI+aVRzPdKux+3TtIPi7hu
	YdtuZgk90Uu0JP8+Bc0cgCyOQ0j+NeMP+GzEOXgHsyNi3oXlrQBllliLji31x+Zn8sFAhfg1L0b
	y1CT3MnxcblUzaSPXRemw8v23kVfVzTgMA7IiD2MLyLa0XUaDwzgxUyiCHcoD94bECKDv2RAk+R
	tOlZm+OEM4RWixgjnk9ValRbTFmmggLGOh257tKulniPPppwnwtKfbhVLqXKs4vh80ddHZEyfGD
	B2K7v/tXJj0bSmP9ez/1FmdMqd/qYtR0PSaqg4qcjjjcW1LRNSlJqbmxq6gJSlWJicXcAkiXss6
	5MS8lAjQUV/6RnE+e6g99+FsPlrUbiCWXi2svfTb9aYirJtHAUbnpyiH5z0RbvdtdUSA5AgpWCI
	MLH7PXomU9tz2dCFIcbLo=
X-Google-Smtp-Source: AGHT+IHH1354UksQYjfj090VNEAlFFGqz6nJ44zoX4Xnsgdue0/MMy2W6nYtzUhkSiewnSjIBGuXQQ==
X-Received: by 2002:a05:600c:4f0f:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4792f38d58amr77373225e9.27.1764954695788;
        Fri, 05 Dec 2025 09:11:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/10] xrdp: patch CVE-2022-23468
Date: Fri,  5 Dec 2025 18:11:26 +0100
Message-ID: <20251205171134.1346494-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122348

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23468

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23468.patch            | 34 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
new file mode 100644
index 0000000000..6f8b3a0fb1
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
@@ -0,0 +1,34 @@
+From 43cf272b1138462c1bdfc48ef7e9142208194382 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 09:16:44 +0000
+Subject: [PATCH] CVE-2022-23468
+
+Login window - replace g_sprintf() withl g_snprintf() calls
+
+CVE: CVE-2022-23468
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/43cf272b1138462c1bdfc48ef7e9142208194382]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_login_wnd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xrdp/xrdp_login_wnd.c b/xrdp/xrdp_login_wnd.c
+index 7a3134fd3e..28748676a1 100644
+--- a/xrdp/xrdp_login_wnd.c
++++ b/xrdp/xrdp_login_wnd.c
+@@ -722,13 +722,13 @@ xrdp_login_wnd_create(struct xrdp_wm *self)
+     if (globals->ls_title[0] == 0)
+     {
+         g_gethostname(buf1, 256);
+-        g_sprintf(buf, "Login to %s", buf1);
++        g_snprintf(buf, sizeof(buf), "Login to %s", buf1);
+         set_string(&self->login_window->caption1, buf);
+     }
+     else
+     {
+         /*self->login_window->caption1 = globals->ls_title[0];*/
+-        g_sprintf(buf, "%s", globals->ls_title);
++        g_snprintf(buf, sizeof(buf), "%s", globals->ls_title);
+         set_string(&self->login_window->caption1, buf);
+     }
+ 
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 354eb11730..2a47b6c68f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
+           file://CVE-2022-23468.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

