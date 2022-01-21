Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8987DC43217
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.538.1642801158036687837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eW4VIA20;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id r14so1979350wrp.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NNWWM8OnPtqwqxpw4hFe/xM1dYwcTFCVtBnWdZgIqLw=;
        b=eW4VIA20Gg8pCPbX3TZi4eSwQRQvI96kxfPuz7r298Ke3QGurTYgzGw7jUKH7Buu6I
         lNuo3nrNm+0qdfVInE5jGyX2ZT7OYPEZMKVEGgsnUwRByJ2o11bu31F7VUkpzeRZwAZa
         Dv+Cpel7nFr7qBOJi5dcGq15LhqCgIhu5Gr2g+BNGz4qME9iyqW7Vdbc7uxKEZhsNG3P
         hMk9yBSnbu2np0/ha4v+T0+O/hfFHAUMQza5Cxg6fMGyDNlROLiyGEQOauHMtgkfxR8z
         PiqvFT3yQpGaqqyb6b+899j+D0HN4caEyG4AIhtDRPCQXJcUMS3UvGUvlF1GwD3Ec4Ps
         vSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NNWWM8OnPtqwqxpw4hFe/xM1dYwcTFCVtBnWdZgIqLw=;
        b=YeNNgy2ezcwz6r865utcHBGaSN+pqynQMS9z8cfXIZZ43UMVXmKwzIQuDJ8yxrJK0u
         sDFH9mWjlczW7hyLXYIgvUdFOb/LHf/IektPGdTrNCsPnufTihi7KmTpLlRtTtYDzjHY
         +Gf9YkQtNyTNCsZsV660yQr4YG0NTPQ5gI0Mm+Rvt2Xl1BegjFUC/fKKsR91tJq96dCt
         a2vdBzxIaDkWiMsMB8ztqWm+j1I1vMhwcRERYzwW9FFV8Uj8antThe3c+4UT6OAT3VU4
         Kz6QjHn0CtuHcJOY0U0zTWh6L2lO26nrU99DdDwqIeVR88Y1MzuXOd75pn4CPvWqO+o7
         /hWg==
X-Gm-Message-State: AOAM531TMeeKSKPW9MNavxOr4X0K6GfLUGNVyi2qnZvKjRKiGmqZNGOg
	vo4d+UiFWG81B9mqaIuMEbNyjbMaeUU=
X-Google-Smtp-Source: 
 ABdhPJxPhbG1+E4J8bx0g5nCZAyjA4aU/PUC81ns5k6NCc41NQa8rtSoxCsbLNyINOabqU44GplKyw==
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr5178915wrf.549.1642801156681;
        Fri, 21 Jan 2022 13:39:16 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/19] gnome-calendar: fix meson 0.61 builds
Date: Fri, 21 Jan 2022 22:38:51 +0100
Message-Id: <20220121213858.762625-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94990

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-meson.build-fix-meson-0.61-builds.patch | 23 +++++++++++++++++++
 .../gnome-calendar/gnome-calendar_41.2.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar/0001-meson.build-fix-meson-0.61-builds.patch

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar/0001-meson.build-fix-meson-0.61-builds.patch b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar/0001-meson.build-fix-meson-0.61-builds.patch
new file mode 100644
index 000000000..8ec980bb1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar/0001-meson.build-fix-meson-0.61-builds.patch
@@ -0,0 +1,23 @@
+From 7060aa63abbb64e7c6cbacc167d5f939d2a77e41 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 21 Jan 2022 21:18:39 +0100
+Subject: [PATCH] meson.build: fix meson 0.61 builds
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-calendar/-/merge_requests/198]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/appdata/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/data/appdata/meson.build b/data/appdata/meson.build
+index b5ee6540..200c3507 100644
+--- a/data/appdata/meson.build
++++ b/data/appdata/meson.build
+@@ -1,7 +1,6 @@
+ appdata_conf = configuration_data()
+ appdata_conf.set('appid', application_id)
+ appdata = i18n.merge_file(
+-  'appdata',
+   input: configure_file(
+     input: files('org.gnome.Calendar.appdata.xml.in.in'),
+     output: 'org.gnome.Calendar.appdata.xml.in',
diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb
index a28913bfa..4b62a0c07 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb
@@ -22,6 +22,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-versi
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += " file://0001-meson.build-fix-meson-0.61-builds.patch"
 SRC_URI[archive.sha256sum] = "956b2f190322651c67fe667223896f8aa5acf33b70ada5a3b05a5361bda6611a"
 
 FILES:${PN} += " \
-- 
2.20.1


