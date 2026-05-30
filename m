Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4FACD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 12:24:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5672.1780143894361459930
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 05:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ePeysO2j;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490426d72f7so76991745e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780143892; x=1780748692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xBfoYEIv0T+h339ompJXCA6r9NvL/mOI43GbwPnr0MY=;
        b=ePeysO2jkYdP7ZC+a9SYB/DVvZMaXPj8dBcGsHGQ7MJOlDwk/DiL4xphhvD75uZ2K/
         TBnO2M/Fd7lIILXy8AsdSdDuWvco5KCA/UBNJ/CUwB5uWDRfaDhhzdwr/gVDjqqES0tc
         Hg6zd35KXB0z+ojR4C6gcr8JUsjtU51/vm0fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780143892; x=1780748692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBfoYEIv0T+h339ompJXCA6r9NvL/mOI43GbwPnr0MY=;
        b=Xw0LGnvIfKh9yfS+ROvWlzlA0lKgjTCskRCp1nmHsohzTP94Oj+BjOX3wiSSx9UPBP
         9LbnF6Z9MLS7YIyOG8OVemyNRMCsdd3nEaoNE1qyHyEVEM/xcTOOCvLMxJw7zb6DFJCs
         Z4Z7pxlpawEBZ3KU23Kkv3z8uBpiOCzVrYAfmtT4mEtOs4SYTsARBcZ+Ggppp8g6k6e0
         27HgiqfPRQofxHIZ+s7IA55qdlyc/HYecR70ObU+h1f83o+93JGQ0ap6gtTN7EKbTVwx
         00s5gLuDsBZFTomRjqQ/L1IdRkQkbY2pHAra7FRBBaH//cv0izdFeFNbie9EY9o0vhS2
         1/SA==
X-Gm-Message-State: AOJu0YxWf56ZvBAlkg+y/M9vgeY/bkJOrZd1+ZrpmfQTqZotLYnOIOLf
	zoStkoM4ExEAvk7EyPg+bTS39uj/stP8Qp8XYE/OZHdUgO6mkM/Lk6b5Pg7OZsp6HG0h46/NK2C
	yLa8Vv8E=
X-Gm-Gg: Acq92OHieWs2jq3rmlAmA40XEOdaf6u57mx7C/57fPzG5qWDvLLbMZniInaCSJHIIL3
	4vuTXsQtum8qTHM+e7S3OXFF7X8f2WTFA2F+09nV/gixNpQdviNYUdI3fyta5yx1X5H3C+epO9S
	sVMOr7lcCT5lgU8RlltPbtC0jgvaJDtIauQGmcXjatJ1fc+p5/XlWtfUlZ5nw0L1dRuy9BZ0Qav
	OFJyS8CLeaJkUFaMDwpRymeV/NR3mavphZcGVZsFx2XqjszIe8dypC+JM060NeH4kq0pxoKqmZu
	FZHHCAn/+JInTVgFb97i/CU3j89FEB56yDgrRcR+tKPhAH+blmd0yQHSyjgkEnIlcwWPlZSM/Z2
	xQP+PgR0sxzQLBO/NI0RYl2zCMGmjsHWgj28hjkFCaSyFtlLpratY/Dr1E7XTsfz7Rl+yuo/6Lv
	/3fbj/MaoYPJwFS0nFG+Yo2GXJDbGUMx4uUTQ1GG0CaGzI
X-Received: by 2002:a05:600d:844a:10b0:48a:557e:6b4f with SMTP id 5b1f17b1804b1-490a293afe2mr44999625e9.23.1780143892439;
        Sat, 30 May 2026 05:24:52 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm10904347f8f.15.2026.05.30.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 05:24:51 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH] miniupnpd: upgrade 2.1.20191006 -> 2.3.10
Date: Sat, 30 May 2026 13:24:30 +0100
Message-ID: <20260530122430.3974914-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127301

From: Filipe Pires <filipe.pires@konsulko.com>

  Drop 0001-Add-OpenEmbedded-cross-compile-case.patch as genconfig.sh
  was removed upstream in 2.3.x.

Signed-off-by: Filipe Pires <filipe.pires@konsulko.com>
---
 ...-Add-OpenEmbedded-cross-compile-case.patch | 38 -------------------
 ...pd_2.1.20191006.bb => miniupnpd_2.3.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.1.20191006.bb => miniupnpd_2.3.10.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch b/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
deleted file mode 100644
index e33d8eac1d..0000000000
--- a/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 54698856e5602bbd9d61e855814c854a013b4840 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Dec 2018 18:47:45 -0800
-Subject: [PATCH] Add OpenEmbedded cross compile case
-
-Upstream-Status: Submitted [https://github.com/miniupnp/miniupnp/pull/410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- genconfig.sh | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
---- a/genconfig.sh
-+++ b/genconfig.sh
-@@ -103,6 +103,12 @@ if [ -f ../shared/tomato_version ]; then
- 	OS_VERSION="Tomato $TOMATO_VER"
- fi
- 
-+# OpenEmbedded special case
-+if [ -f ./os.openembedded ]; then
-+	OS_NAME=OpenEmbedded
-+	OS_VERSION=$(cat ./os.openembedded)
-+fi
-+
- ${RM} ${CONFIGFILE}
- 
- echo "/* MiniUPnP Project" >> ${CONFIGFILE}
-@@ -346,6 +352,11 @@ case $OS_NAME in
- 		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
- 		FW=iptables
- 		;;
-+	OpenEmbedded)
-+		OS_URL=http://www.openembedded.org/
-+		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
-+		FW=iptables
-+		;;
- 	AstLinux)
- 		OS_URL=http://www.astlinux.org/
- 		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
index b7ba37f290..f7e1518f2c 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
@@ -13,9 +13,8 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack openssl"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
-           file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-SRC_URI[sha256sum] = "218fad7af31f3c22fb4c9db28a55a2a8b5067d41f5b38f52008a057a00d2206d"
+SRC_URI[sha256sum] = "f9c34ed3632fb60cd248dd5897bd98479a103a75688b056ca2f069e68ab32987"
 
 UPSTREAM_CHECK_URI = "https://miniupnp.tuxfamily.org/files/"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.49.0


