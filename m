Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7E8C433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 21:24:36 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.3246.1639344275257077749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 13:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=SLPdJVUF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id m12so21163050ljj.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 13:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0yXy75xKu5mhp5bIfptZHXNTXb+XYD+kFJzO8hN3DeE=;
        b=SLPdJVUFslDSXADKPefwnVMMRKnGqZsFcN99BzwjksX9BV3Tg3umSqB3l+2ROVkK4i
         Ff2ygMpemZ3b5TGhzy0XY8h6iK2jEOZ+EPHFvX6+s1b1pij3kp3ODwPtenGRVRI5KSvE
         LTYCYPioeGTR8qSIhwb5qqWjmpEl5ZCHUIirCCQIpzRM1xaUC4cEf7aSpmbfvylZoLWD
         gD+Wo+oHrUu6Q9FVzlg7nHPo+N+EnnecJUBj5qhqyq+/8FE6cX/axoSCuXw0b781WK7e
         BUv06j2OeyKKMaIHWTdqnAjA4gbSDIDbOwgXZPD5XO6EEAQr/Q78yAQjsTdJfRzqud9t
         NdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0yXy75xKu5mhp5bIfptZHXNTXb+XYD+kFJzO8hN3DeE=;
        b=FbcuNStErFhuMij81aawemwQx0JuI9tISw3sIY4nfnmP62j7fGVb3ZwUSN6oFtWux6
         plorg2BT9KAxWqKwdx2IfjB63O4q5Jwza1eorY64MdLwY8wy4iMTzY2iJm+0/FOrkO+s
         qki5JvVTiKKbttCOeBqwQ7QMP0C1f/aM9SpdJyBZYgklCufe/qC08S4OLi3xLNgRifLp
         kOQeUPbCbTGpSFTgbkfhdDr+/j/6icRnuZJRKprA5wnLmJ++7IwJbQLK1XS5vwuklfXT
         nm/VJK1xVyK7vMz5PST0JX39enLNyEAZVCNCyLzzMddNBMT22b1OtO8ejL/TnlCzjUAU
         PlaA==
X-Gm-Message-State: AOAM531YPrcVElQlZGoM42jMFSCqmBd+sEXaCXJDzdxOJspgoPpYDI7D
	9rqSsjuZ2MmZyKZNppjJGKnH7EIm/Od1+OBw
X-Google-Smtp-Source: 
 ABdhPJyHukhu1JpA9ibIjXlH6UR2eeChf5TssZChAww6DdYdlNXcOwbzzGvFH2ClPnCfelVAJf1y4g==
X-Received: by 2002:a2e:b171:: with SMTP id a17mr25312113ljm.56.1639344272682;
        Sun, 12 Dec 2021 13:24:32 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 f10sm1160946lfu.122.2021.12.12.13.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:24:32 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-multimedia][PATCH] libsrtp: update to 2.4.2
Date: Sun, 12 Dec 2021 22:24:24 +0100
Message-Id: <20211212212424.4081887-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Dec 2021 21:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94307

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/libsrtp/libsrtp_2.3.0.bb  | 20 -------------------
 .../recipes-support/libsrtp/libsrtp_2.4.2.bb  | 16 +++++++++++++++
 2 files changed, 16 insertions(+), 20 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
 create mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
deleted file mode 100644
index 5b4f34592..000000000
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "library implementing Secure RTP (RFC 3711)"
-HOMEPAGE = "https://github.com/cisco/libsrtp"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
-
-S = "${WORKDIR}/git"
-SRCREV = "d02d21111e379c297e93a9033d7b653135f732ee"
-SRC_URI = "git://github.com/cisco/libsrtp.git;branch=master;protocol=https"
-
-inherit autotools pkgconfig
-
-EXTRA_OEMAKE += "shared_library"
-
-do_configure:prepend() {
-    cp ${STAGING_DATADIR_NATIVE}/automake-*/ar-lib ${S}
-}
-
-ALLOW_EMPTY:${PN} = "1"
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
new file mode 100644
index 000000000..0946aec60
--- /dev/null
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Library implementing Secure RTP (RFC 3711)"
+DESCRIPTION = "This package provides an implementation of the Secure Real-time Transport Protocol (SRTP), \
+               the Universal Security Transform (UST), and a supporting cryptographic kernel. The SRTP API \
+               is documented in include/srtp.h, and the library is in libsrtp2.a (after compilation)."
+HOMEPAGE = "https://github.com/cisco/libsrtp"
+BUGTRACKER = "https://github.com/cisco/libsrtp/issues"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
+
+SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_4_x_throttle;protocol=https"
+SRCREV = "90d05bf8980d16e4ac3f16c19b77e296c4bc207b"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
-- 
2.25.1


