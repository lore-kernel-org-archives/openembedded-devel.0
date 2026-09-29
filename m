Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C151CA5FBD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1490.1790722676206570866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFxFs5JG;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4541233eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722676; x=1791327476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpVWx64ZIgwm2pJzUZV20f/YZB0cUfixaNP5SQtIYQE=;
        b=XFxFs5JGUQ1/Q5FtF6bwgisXWnSO8J5CNfiA22wNyhXK7ChKCCAPW8VigsXoDGKrW3
         ZGLbrezuDp5eNcIawSpmUJuLnt7Heov9exE3Yh7rcUZbKOuAotWA7uppeUyzklkPYgcC
         HnwKKjpDUVMeQ5ZuK/WDxw2/uTm0hqonJwU4OfMSj17Ia2qFwymKpb6Y5f8W59DCgp7q
         I/T5lB6jioipYCnwA6mC0vJnsz7EdCEr0AZYPKz0XS+LDmfyzNLTuWW7aew9OSmApzu6
         hMQ1zZcy2N/VUj4/lgrdrrvqcz/NhWcBH7pfmbp4IWgWWHry0/fvd0P9/4OkHpvyPK+B
         2FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722676; x=1791327476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpVWx64ZIgwm2pJzUZV20f/YZB0cUfixaNP5SQtIYQE=;
        b=egleZIiIdzHU7aoMHEN4hgVxA1eAU/BxJuhcd5GINo60smWTQbfcLYKRzSIMK+SD3A
         U86j9G+EaAhsjiCaxi1n4agkByynvtrwVgMZem1CxiXiHp3AWWzId7hItCPnICoNxaMn
         6qNE25S6tSKWkxj3vdobbfdn92YH/0hhuKlavmaXWy1i4jN8r+CA0dLu0WPHjoF4TZEy
         yimJjV7WMkI/rFDw6q9qqZTE9plGbainptJ7BSU/1FwFvJ4iv5feZLGH20kYperwWVYj
         5POaPYBVjkyaWd/It2WOuJUkflvRRjoDsIycjaRzg0irFKf86kU3P7cvkRPwzw725ixk
         vqHQ==
X-Gm-Message-State: AFq9FYJfYOn9uf2TOUDEJYV4qeWnAhDLF2Ybj+XJ2/FDVr0GEzFRM5ih
	zGpm35po/6kbiLNDuv290poYGM9sLaPQ3H78/+NjYAk3cbI8biLF+/mtNjf8wXjpe8Y=
X-Gm-Gg: AYBFou3ld6RBL607dNQR1/1JlVt2/Sh8ui5SnDkY0ukNhhuYP3zx7QT+ZtmX98stbMY
	ZLFZS3bt2t/QIu6zza3/VK6TG5C5bQxKVWKQW5HRgEJ/5xmJZmHID6OYWryylREu+0QaaYY2DY4
	OZrdC3yC5NLSa9F0P3YtgPDv2NlIepXxdYaO9HREYXrlUsEIQUMZIfrHf6dZcrFH5HfQ0cPrD/o
	3rzux2w30GMryk/G6anuKhwtRX5XPiD5FTwVJxPi94DLwYBUGdXJ5rsOM5DgiaEQ2ucQxQdMrKz
	ky4EIMbGKH6lReS8DULSWy3/U+jcVJHnzR8o6JvXeBjdQXtRaljsOH3e+twM65LODW+wf1c6nj5
	4H9V/gPWAu8wrR36659zroMkHdAo0SNKJ/B40H1/UnV6iACWO2wRESguUiPX98T5A6uWx0v+Enr
	5p6w9MUQHsGlLHIgw9sI6UOsahsSrGU2yKaPdg1uRijKrzbmsy6VmoCTPLz+TmJ1pafT1GGM13p
	beXT1pJlKZ9JaXKCFgRUcqeIEgTNwpjIjGDt23FJKK50wYZ5WM+RM8+QCVDD1hS7NP1hTRa57gW
	eLEl3yvWB3WWcnE82P1AQBQXtzH8SeaU0oSgT3FOFFM4jMz8sciz+qra1cLuDVZTeV9EdA+AA91
	Bdqx1q4ioWYlCM56E2CRYpzJsf8D7w2D5xweQb+TP3eh2Alhm+6ZsmVPqHFjSyWvQbvltNYO2JU
	L63BCeZ0IGz1WfwwAE364R4Cud8DXjwUuF/02Akjc=
X-Received: by 2002:a05:7301:9c:b0:344:7aad:8eb5 with SMTP id 5a478bee46e88-34c6672f3damr903870eec.23.1790722675425;
        Tue, 29 Sep 2026 15:57:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 19/26] netcat-openbsd: define IPTOS_DSCP_VA for musl
Date: Tue, 29 Sep 2026 15:57:16 -0700
Message-ID: <20260929225723.1046705-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130506

netcat.c uses IPTOS_DSCP_VA, which glibc's <netinet/ip.h> defines but
musl's doesn't. Add a guarded fallback definition.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...netcat-define-IPTOS_DSCP_VA-for-musl.patch | 34 +++++++++++++++++++
 .../netcat/netcat-openbsd_1.238.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd/0002-netcat-define-IPTOS_DSCP_VA-for-musl.patch

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0002-netcat-define-IPTOS_DSCP_VA-for-musl.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0002-netcat-define-IPTOS_DSCP_VA-for-musl.patch
new file mode 100644
index 0000000000..2b642b26b6
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0002-netcat-define-IPTOS_DSCP_VA-for-musl.patch
@@ -0,0 +1,34 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] netcat: define IPTOS_DSCP_VA for musl
+
+netcat.c uses IPTOS_DSCP_VA (the RFC 5865 Voice-Admit DSCP codepoint)
+as one of the recognized --tos names. glibc's <netinet/ip.h> defines
+IPTOS_DSCP_VA as 0xb0, but musl's <netinet/ip.h> does not define it at
+all, so the build fails with "use of undeclared identifier
+'IPTOS_DSCP_VA'".
+
+Add the same fallback definition already used here for the other
+IPTOS_DSCP_* codepoints missing on musl (see the neighboring
+IPTOS_DSCP_EF block). 0xb0 is DSCP value 44 (decimal) shifted into the
+TOS byte's DSCP field, i.e. (44 << 2), matching glibc's value.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/netcat.c
++++ b/netcat.c
+@@ -89,6 +89,13 @@
+ # define	IPTOS_DSCP_EF		0xb8
+ #endif /* IPTOS_DSCP_EF */
+
++/* Voice-Admit DSCP codepoint (RFC 5865): decimal 44 shifted into the TOS
++ * byte's DSCP field, i.e. (44 << 2). glibc's netinet/ip.h defines this as
++ * 0xb0; musl's does not carry it at all yet. */
++#ifndef IPTOS_DSCP_VA
++# define	IPTOS_DSCP_VA		0xb0
++#endif /* IPTOS_DSCP_VA */
++
+
+ #include <ctype.h>
+ #include <err.h>
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb
index 01eafa06d0..e7272dc0a9 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb
@@ -10,6 +10,7 @@ do_patch[depends] = "quilt-native:do_populate_sysroot"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20260519T203124Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
            http://snapshot.debian.org/archive/debian/20260519T203124Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
+           file://0002-netcat-define-IPTOS_DSCP_VA-for-musl.patch \
            "

 SRC_URI[netcat.sha256sum] = "9f72a37d85dec1366309fdb0172be4e67e09ec26e89f13156315149e17c02479"

