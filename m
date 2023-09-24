Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFC0CE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 14:39:02 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.40606.1695566338922024434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 07:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoB1FiKS;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d815a5eee40so5318810276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695566338; x=1696171138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPk9pdKMK4UWwsrplfwPrnlYj63KX3TOmg1bp08/XNw=;
        b=CoB1FiKS90hr4sQ69pYuIvxq3IG75qtxozvXh+3MAvXEX7o20JkuRg1VcA8QfsDOWj
         gtA6XMKRFnrQckllBt0mgTwEi7fQ0mw+Xp8cJN3cpkOxCezOTXsTjlHowDJoUSZ/iwhi
         4SWLUYtpO9vfov7/nHjfx9lvZYQJ5Cb9FL5hU14Xi0Q+odbgfo8WkFXUN+OyhTImMZic
         5Puh4vBQ/ISdJj0RJBZ3aSrHR0KfgYFGAGOG0ZYxpAq6OrwKO8p3Fo7JWcNHqtKE9ug0
         u4Xjroh3SBkhWvt/PF4O5JoayM5OxW2jmJgrDxNL9YDQvWUI/UKJPAiIm7e7eYRMbCG/
         go8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695566338; x=1696171138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPk9pdKMK4UWwsrplfwPrnlYj63KX3TOmg1bp08/XNw=;
        b=M/UACagYPEeoQ8z5Z/FCAK6zilRz9Y9/lBMMl27G5cr+jHOnp+E7+8mDZwOGbe2uX6
         BFpdDKO9ghOwfzntNhBCZp5oHjZ0lKI0tSIoaAP0metjIqx/VvN0gCl4Rt/B4sbbSoxd
         reu0ETBu1C69K+PfATgAElv7qJiyLBInJQKEjrj1rAe/kgxivMYfF6Xr54zD2fXBKK8R
         Abz8da/SqGbqZp3K/Zy1o5iQi9AARXhjWfMrfU4G+fYotjcPo0fcCh9QWRIYOuZcbWtg
         Ja9hlVaQiRGM1DnR+3Qpgh+JdrUyfSpzG/wpir8TU0xVJy89ArHZ+ujs3skv/s4kRQEI
         HfCQ==
X-Gm-Message-State: AOJu0YyJ7lv/iBYOZTrBlvLJclBqookFTflucjJkLtDeXKF9CNHX/gYL
	vagOsiNfRYXdAx+T8lqM8HySKvecwbE=
X-Google-Smtp-Source: AGHT+IGEIaYHCXXmcRwbp631B2ysYcX3Yg/E0Z2LyzqAW71msJfy/uaw6V0j8iSpGMYKS9bP8StH2g==
X-Received: by 2002:a0d:ff05:0:b0:59b:4f2d:231 with SMTP id p5-20020a0dff05000000b0059b4f2d0231mr4314695ywf.45.1695566337900;
        Sun, 24 Sep 2023 07:38:57 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id x125-20020a0dee83000000b0057a918d6644sm1919085ywe.128.2023.09.24.07.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 07:38:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sanjay Chitroda <sanjay.chitroda@einfochips.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH] netkit-telnet: Fix CVE-2022-39028
Date: Sun, 24 Sep 2023 10:38:57 -0400
Message-Id: <20230924143857.982969-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 14:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105106

From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-39028
https://security-tracker.debian.org/tracker/CVE-2022-39028

Upstream Patch:
https://cgit.freebsd.org/src/commit/?id=6914ffef4e23

- Patch is adopted from FreeBSD, as same vulnerability of
  telnetd is applicable to FreeBSD and netkit-telnet packages.

Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d629fe71e4242fc0557f5668d9f223777eb60a0f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-telnet/files/CVE-2022-39028.patch  | 53 +++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
new file mode 100644
index 0000000000..e8c3f1d84b
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
@@ -0,0 +1,53 @@
+From 4133a888aa256312186962ab70d4a36eed5920c1 Mon Sep 17 00:00:00 2001
+From: Brooks Davis <brooks@FreeBSD.org>
+Date: Mon, 26 Sep 2022 18:56:51 +0100
+Subject: [PATCH] telnetd: fix two-byte input crash
+
+Move initialization of the slc table earlier so it doesn't get
+accessed before that happens.
+
+For details on the issue, see:
+https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html
+
+Reviewed by:	cy
+Obtained from:	NetBSD via cy
+Differential Revision:	https://reviews.freebsd.org/D36680
+
+CVE: CVE-2022-39028
+Upstream-Status: Backport [https://cgit.freebsd.org/src/commit/?id=6914ffef4e23]
+
+(cherry picked from commit 6914ffef4e2318ca1d0ead28eafb6f06055ce0f8)
+Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
+
+---
+ telnetd/telnetd.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c
+index f36f505..efa0fe1 100644
+--- a/telnetd/telnetd.c
++++ b/telnetd/telnetd.c
+@@ -615,6 +615,11 @@ doit(struct sockaddr_in *who)
+ 	int level;
+ 	char user_name[256];
+ 
++	/*
++	 * Initialize the slc mapping table.
++	 */
++	get_slc_defaults();
++
+ 	/*
+ 	 * Find an available pty to use.
+ 	 */
+@@ -698,11 +703,6 @@ void telnet(int f, int p)
+     char *HE;
+     const char *IM;
+ 
+-    /*
+-     * Initialize the slc mapping table.
+-     */
+-    get_slc_defaults();
+-
+     /*
+      * Do some tests where it is desireable to wait for a response.
+      * Rather than doing them slowly, one at a time, do them all
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index e28eeae491..d3de038d16 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/netkit-telnet_${PV}.orig.tar.gz
            file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch \
            file://0001-utility-Include-time.h-form-time-and-strftime-protot.patch \
            file://0001-Drop-using-register-keyword.patch \
+           file://CVE-2022-39028.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
-- 
2.34.1


