Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1728C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 23:07:00 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.137.1643324819416482435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 15:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AT0PCN0I;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so4089094otf.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 15:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vO8nxdv55n4cM2VU+RYUJqm6THNQP25XKaJVf3TkmuI=;
        b=AT0PCN0IxcW7Lx8kIi8LzIAya6FZPOJ7FMsDKUGCKhzjr+1RFflFWTAfoOcsWaC2X4
         79mcPoNm+E8HQpfbrnY7hBSXGjeJ162zfeJgDBWOjV9TCIEuoFK2jllE9mHQWfG4VaQu
         jqIsOuTIkh6GpvnXexcs6PDgul7blC/Fxe6uRHCVYZpjXx2cb+2aaXJv3EwCUmielYSH
         /HQZ+ed0iA4deRQiwXrNcNF7iGLi1IcMe/IF+gWkRmnw3FWhdyPJce1V6L7ke/vPF/4G
         /An0bl0ZEhf3X/IPb6FWcucDxUWflsQuF8+umWfyp1jrk2i+mYTFOlTBaYyyt+yi/JtZ
         wZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vO8nxdv55n4cM2VU+RYUJqm6THNQP25XKaJVf3TkmuI=;
        b=LvTwiSswnAliyBQvPM/nmavi45ho/MX9aSw6gUK83AlfXPxsgNgXWOfrppTAgxjvtp
         vK60MmqQNp26Mi38QMeL3B8XuDDhexWAC0G4rDkht3cj/hq12sHiGql9yOGz0tKTUa/J
         KQbXmihLeJIfPVa5N09d5jdfGUWXSmdT1J+YP87lixaPRdv4bHZq1EZhFqpZrgPLIPpN
         x5c4O9ndvxu9brRfw45uKGHIVWnOmocpA7LM6TK3yJhL3wJHUaSVwTVh/lAcgFP7XWjc
         E9RjyKvlgqfZ2vLwA6rGMrEzwOBeIVpXRXBMw6dlETR072l4uYxBJKTJLfDWWaxoDp2u
         r8IA==
X-Gm-Message-State: AOAM532TnCd546Qi/UUhCEf4ja9Qz5KMUqqK28xNP2pMvOhZAm9BBfJJ
	neS7rbl64jYGg1vdpYhwX9KNwf3K144=
X-Google-Smtp-Source: 
 ABdhPJy6MyHEj5NpFggWxsE0dFMVx8juKKEr0QgbCxIi/unlVV6K8YMRiT7QLmF9+1PmDQAXZYK+7w==
X-Received: by 2002:a05:6830:43a6:: with SMTP id
 s38mr3393615otv.94.1643324818458;
        Thu, 27 Jan 2022 15:06:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:95a2:6da9:5705:29a2])
        by smtp.gmail.com with ESMTPSA id
 s64sm6496253oos.0.2022.01.27.15.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 15:06:57 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: otavio.salvador@ossystems.com.br,
	hs@denx.de,
	alexandre.belloni@bootlin.com,
	raj.khem@gmail.com,
	peter.kjellerstedt@axis.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 meta-oe] rtc-tools: Add a recipe
Date: Thu, 27 Jan 2022 20:06:07 -0300
Message-Id: <20220127230607.35740-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 23:07:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95130

From: Fabio Estevam <festevam@denx.de>

rtc-tools is a useful utility developed by Alexandre Belloni
for testing RTC kernel drivers, such as y2038 support.

Based on the initial recipe from Heiko Schocher <hs@denx.de>.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../0001-rtc-tools-Add-a-Makefile.patch       | 44 +++++++++++++++++++
 .../rtc-tools/rtc-tools_1.0.0.bb              | 18 ++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
 create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb

diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
new file mode 100644
index 000000000000..c1d1fa97eaa3
--- /dev/null
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
@@ -0,0 +1,44 @@
+From b19924f797d69475b1857272231500c97ba9959c Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Thu, 27 Jan 2022 18:40:29 -0300
+Subject: [PATCH rtc-tools v2] rtc-tools: Add a Makefile
+
+Add a Makefile to make installation and uninstallation
+process easier.
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-rtc&m=164332426030004&w=2]
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+---
+Changes since v1:
+- Simplify the Makefile by taking Peter Kjellerstedt's feedback in
+the oe-devel list.
+
+ Makefile | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+ create mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 0000000..71a4c9c
+--- /dev/null
++++ b/Makefile
+@@ -0,0 +1,16 @@
++prefix ?= /usr
++bindir ?= $(prefix)/bin
++
++EXEC = rtc-range rtc rtc-sync
++
++all: $(EXEC)
++
++clean:
++	$(RM) $(EXEC)
++
++install:
++	install -d $(DESTDIR)$(bindir)
++	install $(EXEC) $(DESTDIR)$(bindir)
++
++uninstall:
++	$(RM) -r $(addprefix $(DESTDIR)$(bindir)/,$(EXEC))
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
new file mode 100644
index 000000000000..64ea3173d8a4
--- /dev/null
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Useful programs to test rtc drivers"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BPN}.git;protocol=https;branch=master \
+           file://0001-rtc-tools-Add-a-Makefile.patch \
+           "
+SRCREV = "acc442e7af4e1e783432a43d37f1a7938c692659"
+
+S = "${WORKDIR}/git"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OEMAKE = "DESTDIR=${D}"
+
+do_install() {
+	oe_runmake install
+}
-- 
2.25.1


