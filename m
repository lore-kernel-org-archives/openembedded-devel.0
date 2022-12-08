Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39198C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:20:13 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.7755.1670484011300977302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IOljoErI;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id 65so602554pfx.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 23:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0qUvnQggRhaHuqdxPsAfx2W25UF5eJCja5dFud9+EI=;
        b=IOljoErIrg2tfb98dCI6bCvETOzc2bI4oAmnwtsHShUngksskfud/YvRs80OsGh9XD
         88NV5FJ1hcMfWEPHU0aJqRq1dbKQbTZTmyxWb99fqa7CSrkt9OC/oIf0PBYdTzwFuvNl
         BMX0X0T0t1+zGYEOiA6L9LeU08Ccru17ycGr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0qUvnQggRhaHuqdxPsAfx2W25UF5eJCja5dFud9+EI=;
        b=HxgNtv/pa78x/cpIrS1FSqTN8hFchevvTfXFldiJA+1K6e5KMSs2/JSErOg+YS9ciI
         nU0bPMbvCdcIBrzVhdrPMYhoBLXAce3WMPtw7cdnMF7omrTHlXn3ki+vXy0geqbnDlSM
         LR4iG14R4N+PisV6ArM6gKDjrHm9MbuGTbJmT2ATv5EftiOD1Y5VzqfMJTrDwbCHeexR
         C+6D09KeGXR3c3zGk7Adq8ufs0tq9n1Seo1Z4TiDz4YwdCEEjHtIHHSj+xjIsACmoyVQ
         GPgRxKTOJES7j9/KIO2KaHt9sP2J9RmNf1PNhGEzbl0WZR8mZw3SpjSsQVRWvu4FTZE+
         OlQw==
X-Gm-Message-State: ANoB5pkWHEAe6TbnKiq5ZX/NcJAJGTZOW+N0Hi5pLfzCkLudStKTstco
	YwW1d3t5TVglcrGdcse0SFK6ssViyB4omha2
X-Google-Smtp-Source: AA0mqf5BbPaq/VxsCL4+FF1uLvUZPS2cpYjWsSA74bH3Wr3tmUz3fB5Zjhngfib45HYI4ltawCo+Pw==
X-Received: by 2002:aa7:92c7:0:b0:574:39dd:f162 with SMTP id k7-20020aa792c7000000b0057439ddf162mr72826715pfa.44.1670484010518;
        Wed, 07 Dec 2022 23:20:10 -0800 (PST)
Received: from MVIN00024 ([103.250.136.158])
        by smtp.gmail.com with ESMTPSA id 63-20020a17090a0fc500b00218fb3bec27sm2212995pjz.56.2022.12.07.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 23:20:10 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 08 Dec 2022 12:50:04 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][meta-networking][PATCH] proftpd: CVE-2021-46854 memory disclosure to radius server
Date: Thu,  8 Dec 2022 12:50:03 +0530
Message-Id: <20221208072003.30395-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 07:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99993

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


