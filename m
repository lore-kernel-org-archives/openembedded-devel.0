Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F01C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:21:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.7841.1670484081771849378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dVnp99gT;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id v3so531824pgh.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0qUvnQggRhaHuqdxPsAfx2W25UF5eJCja5dFud9+EI=;
        b=dVnp99gTiO1K8FTresM5vJ1ZKisCvRroKXgyMSGolbWoC1EeER6/56zoTlEWueRXgy
         qgjBmn2VuA4srkGKjJtQq+sfruBTKQXlKhcXT0/JAWl38NTrbtgiAT69di/3wIjf1b4Q
         DD9+deTf3sd4U7i35O89CyBRZl8CoDWoBw42M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0qUvnQggRhaHuqdxPsAfx2W25UF5eJCja5dFud9+EI=;
        b=kGGR2R7JoZ069cD3b3AdUMpPsUk6HpxowwwngJydOatvXU12DcXVqtpBFQT0bfNlSJ
         QmqTOQ2unKI6URNvpvpgpyjzLdgz5lgf2eRkq1HnYjtHoQBe7ShaIPYAB7EqpIHOn3qd
         fvgWiJcpH1tSKZ/OBxtTtT2JXy5srxNbdTb/TaKGed+1MpNWJxowh71g20NrEafkF3AE
         vjCrUw778Fw0P7Sm7mFUdDTrAblgX9lj4oI9v44w7nOHc7wCKh/rYb7/6aMfc+sb/A8n
         kzvvuwqgxbLytoBLBl4uV5/JmH6wgL5Uzy81v+eE/whdiqvk57fSLTRtn6f9PHxbpcbE
         3rWw==
X-Gm-Message-State: ANoB5pkoSBceoEZb586IR+90tkpZVAfVTcqTyPsidY1O4gK3rGfMGUx0
	a+XSV8///CWZwzBVY8MIls9i9lYt/5d/ql4k
X-Google-Smtp-Source: AA0mqf6mLEuXhsTSqSH81U/7SVlZoxAUr/PB1NPquqAn5HF36M2P3hFHkh6gqTT3xsTesvTiop2vEQ==
X-Received: by 2002:a63:4287:0:b0:478:a97c:a1f7 with SMTP id p129-20020a634287000000b00478a97ca1f7mr18249761pga.496.1670484081044;
        Wed, 07 Dec 2022 23:21:21 -0800 (PST)
Received: from MVIN00024 ([103.250.136.158])
        by smtp.gmail.com with ESMTPSA id y7-20020a170902d64700b00186c54188b4sm15696837plh.240.2022.12.07.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 23:21:20 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 08 Dec 2022 12:51:15 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] proftpd: CVE-2021-46854 memory disclosure to radius server
Date: Thu,  8 Dec 2022 12:51:14 +0530
Message-Id: <20221208072114.30455-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 07:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99994

Upstream-Status: Backport from https://github.com/proftpd/proftpd/commit/10a227b4d50e0a2cd2faf87926f58d865da44e43

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../proftpd/files/CVE-2021-46854.patch        | 51 +++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.6.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2021-46854.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2021-46854.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2021-46854.patch
new file mode 100644
index 000000000..712d5db07
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2021-46854.patch
@@ -0,0 +1,51 @@
+From ed31fe2cbd5b8b1148b467f84f7acea66fa43bb8 Mon Sep 17 00:00:00 2001
+From: Chris Hofstaedtler <chris.hofstaedtler@deduktiva.com>
+Date: Tue, 3 Aug 2021 21:53:28 +0200
+Subject: [PATCH] CVE-2021-46854
+
+mod_radius: copy _only_ the password
+
+Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/10a227b4d50e0a2cd2faf87926f58d865da44e43]
+CVE: CVE-2021-46854
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ contrib/mod_radius.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/contrib/mod_radius.c b/contrib/mod_radius.c
+index b56cdfe..f234dd5 100644
+--- a/contrib/mod_radius.c
++++ b/contrib/mod_radius.c
+@@ -2319,21 +2319,26 @@ static void radius_add_passwd(radius_packet_t *packet, unsigned char type,
+ 
+   pwlen = strlen((const char *) passwd);
+ 
++  /* Clear the buffers. */
++  memset(pwhash, '\0', sizeof(pwhash));
++
+   if (pwlen == 0) {
+     pwlen = RADIUS_PASSWD_LEN;
+ 
+   } if ((pwlen & (RADIUS_PASSWD_LEN - 1)) != 0) {
++    /* pwlen is not a multiple of RADIUS_PASSWD_LEN, need to prepare a proper buffer */
++    memcpy(pwhash, passwd, pwlen);
+ 
+     /* Round up the length. */
+     pwlen += (RADIUS_PASSWD_LEN - 1);
+ 
+     /* Truncate the length, as necessary. */
+     pwlen &= ~(RADIUS_PASSWD_LEN - 1);
++  } else {
++    /* pwlen is a multiple of RADIUS_PASSWD_LEN, we can just use it. */
++    memcpy(pwhash, passwd, pwlen);
+   }
+ 
+-  /* Clear the buffers. */
+-  memset(pwhash, '\0', sizeof(pwhash));
+-  memcpy(pwhash, passwd, pwlen);
+ 
+   /* Find the password attribute. */
+   attrib = radius_get_attrib(packet, RADIUS_PASSWORD);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index 1e4697a63..9ec97b923 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -12,6 +12,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://contrib.patch  \
            file://build_fixup.patch \
            file://proftpd.service \
+           file://CVE-2021-46854.patch \
            "
 SRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
 SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
-- 
2.25.1


