Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915EDEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:46:37 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.11752.1687441593612448829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 06:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=K2Acd8pz;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51be61663c8so1043353a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687441592; x=1690033592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk2YbU78FL+ZgtVL3dR8X5d8De2r8xhZ2NiRT/CNEUg=;
        b=K2Acd8pzDHxfPmj6U8niXDzR5fibfarBXgKZyNjoL4PpyQ9eeas00Kz1POr91rj8br
         5d9PVUy83984cmZcFKMl2qcyGzxb7iMvkDMtfXm6yWq42x6i+kcVjepM+fXqUVXOpRP7
         zahdGz0Ne2RvHcnG5LS/ir/9p4JFdl97aeSdfnE57R1e3tNZAjoWyZ67g9EO2MHoL8JP
         Y6U7m+oizyOPTqKGt0AArwfSIawMGg3rx9W5J+yIItEVgR9Z3eJzGpeyfxBngPfSFB/1
         VnoO1e2xDoXNZSsT8tRx4qBJhtwBCCIuwaDzCX+2cOhIAnNAps9rAO9lx4/p5Wj/sLys
         tS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687441592; x=1690033592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk2YbU78FL+ZgtVL3dR8X5d8De2r8xhZ2NiRT/CNEUg=;
        b=Izb+YWgBdUHkhpuNuEqSLyPH906EdRmlScKUvKSpXbzxFYzof3H+jUIlx8oE+GMWfk
         V12cNhwZqHF4s7mfIq1+96IoTb7Jyt2X8rk4/RWXsssmrcwX4rCz6Gj9NgllkzfEGPWY
         qxdedqUb60DlRcTkICmW32p4/R1DO0BaQ6WHqnpJiEH4lu6RG0bw1/H5YPh0A9XxcGuv
         Hw73ArZteJwtMLngLLxB5DGAcq9QZBmWgb8niwuDaSgFaf2mayB7Tld/uOBWa6WxSiBM
         9JhNqD90ERqbFkpkV217XNHHVg28yQGWPiiG9UZ+p+9a0RlZ/DUaUoZ423JEJCGR2qPi
         Tvzw==
X-Gm-Message-State: AC+VfDyXmO9zDjuwkPd9fQNcg8GGpAK4q7LIO0yvQT6Ha5utNxgtt5do
	jTuOO0Fq1MltpNkG9IpIM8TktQ+FJoTkbQ==
X-Google-Smtp-Source: ACHHUZ4s3TFKX2JruCvPCcX4/P1Id2oNqYhyx1BlVgSLS2U9UwIUEO+djCCyr3eC6NwQq7gsiY3K7w==
X-Received: by 2002:a17:907:9706:b0:988:b921:6e86 with SMTP id jg6-20020a170907970600b00988b9216e86mr11457747ejc.38.1687441591795;
        Thu, 22 Jun 2023 06:46:31 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id w10-20020a1709062f8a00b009662b4230cesm4823509eji.148.2023.06.22.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 06:46:31 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] rasdaemon: upgrade to 0.8.0
Date: Thu, 22 Jun 2023 16:46:11 +0300
Message-Id: <20230622134611.97665-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 13:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103486

* drop the strerror_r patch as it's now included
* now builds with out-of-tree libtraceevent

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...-version-of-strerror_r-on-non-glibc-.patch | 35 -------------------
 ...{rasdaemon_0.6.8.bb => rasdaemon_0.8.0.bb} |  4 +--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.6.8.bb => rasdaemon_0.8.0.bb} (93%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch
deleted file mode 100644
index fef71afde..000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e415152b51eacab8705b6b3274cc0d1a274772e0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 30 Aug 2022 19:54:35 -0700
-Subject: [PATCH] libtrace: Use XSI version of strerror_r on non glibc systems
-
-The version used is glibc specific therefore make it so
-and provide a fallback for non-glibc systems
-
-Upstream-Status: Submitted [https://github.com/mchehab/rasdaemon/pull/70]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtrace/event-parse.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libtrace/event-parse.c b/libtrace/event-parse.c
-index 6c705c3..6b651d5 100644
---- a/libtrace/event-parse.c
-+++ b/libtrace/event-parse.c
-@@ -5071,7 +5071,13 @@ int pevent_strerror(struct pevent *pevent, enum pevent_errno errnum,
- 	const char *msg;
- 
- 	if (errnum >= 0) {
-+#if defined(__GLIBC__)
- 		msg = strerror_r(errnum, buf, buflen);
-+#else
-+		if (strerror_r(errnum, buf, buflen) != 0)
-+			snprintf(buf, buflen, "unknown error %i", errnum);
-+		msg = buf;
-+#endif
- 		if (msg != buf) {
- 			size_t len = strlen(msg);
- 			memcpy(buf, msg, min(buflen - 1, len));
--- 
-2.37.3
-
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.8.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
similarity index 93%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.8.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
index 3a525e8a1..c083a3a37 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.8.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
@@ -4,14 +4,14 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
 SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
-           file://0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "c2255178a49f62c53009a456bc37dd5e37332f09"
+SRCREV = "4e83b848e7961af25028f3a2cecf37a63279a2bf"
 
 S = "${WORKDIR}/git"
 
+DEPENDS = "libtraceevent"
 RDEPENDS:${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
 	perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite-perl"
 
-- 
2.25.1


