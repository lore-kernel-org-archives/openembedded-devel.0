Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A791C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 20:42:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.18812.1654807316647830786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 13:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WhjOhcVF;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id gl15so35879640ejb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGWEnLcsmhHugUeJIZPeTJNgijfSdFr/XEqb9sQdbJo=;
        b=WhjOhcVFX4jy5mOG8o125LugUMF6/0QixyG2/VTZhry9JRqYoSaxLmXop+etqW/w6M
         2gpvXPQxCjlcpB2v0BTo6gxG/AXrHxK+qNsKnYLihnTlBx7ZkmoNELgS6Xc0mum9b5Kw
         PN6rV7v1UsaR2pEjzOI4ow6qGWZHRQefamDhDj/3Pra+5RUBy/YfBpFgLfK9NbrX/fSo
         kYRIZ8I+Yrh3clk9Wgz1tu8Ml1bccuai3kY7iAhRe7PmpxGmhO2fFVsN7EZ0WAuoH7P8
         vRIoELBH0EFQlCJZVb9pZWtZeEDOmp01v3Aid+5pWBxDPE0hqC1X3TnIsroimLK2Yw2e
         ebtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGWEnLcsmhHugUeJIZPeTJNgijfSdFr/XEqb9sQdbJo=;
        b=ZYdNU9NT4TVzuezWCwqlfpJ+tpN7TQgjF08IFVVFYaA7O6Izz7L8DCQVRMO2U+T9zu
         aYrvOm0vSMuGdBBtD9cW0iAfHQNnOxsdxhOzTi/68iBZN1GDce61ScOzTwCc2KdC0maA
         CA6WF9mFbw0wXVGHUBFEgjFFp3d9z+fKyKFeYP0sAibU+fkvzY/FNNrk2ifn01+MI/Pf
         ijd8CzPdr8J/x+iIUbGd6U6Q+3JIm6y4Y0DhuAPo388PtnIMVfy98v7okfK3grWyxutf
         gKAeQqvdsHkmhqtdCQlsIMmkr/YJK0OiIkACBmJOrT+Z/6GKRQlLXrD3rBJoFp3n4Dg5
         k4ag==
X-Gm-Message-State: AOAM532W6sKz8waICOzNhBR1oRj3NkyWePk7XE4z14u/QX89hpIxM2KC
	4wByKxzfpL3iQ77/HGfiTW2vtNI+3Mr+GQ==
X-Google-Smtp-Source: 
 ABdhPJzkkU+q6Zamkf5KW2nVGd9llx5mSaDrQ+UpIBnTN9P/d81NmVgIsF+dXZcqtbNND4+rLBv2rw==
X-Received: by 2002:a17:907:6d15:b0:711:d2d8:4818 with SMTP id
 sa21-20020a1709076d1500b00711d2d84818mr19291223ejc.336.1654807314915;
        Thu, 09 Jun 2022 13:41:54 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id
 m11-20020a056402050b00b0042dd7e13391sm14977582edv.45.2022.06.09.13.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:41:54 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH v2] netdata: version bump 1.34.1 -> 1.35.0
Date: Thu,  9 Jun 2022 22:41:41 +0200
Message-Id: <20220609204141.499283-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 20:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97469

Do note that some collectors (a.k.a. plugins) moved from Python to
Go.  And Go is not (yet) part of this recipe.
More info at https://github.com/netdata/netdata/releases/tag/v1.35.0
under 'Deprecated in this release'

The patch should be handled by recoding upstream.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...plicit-typecast-to-enum-rrdset_flags.patch | 39 -------------------
 .../{netdata_1.34.1.bb => netdata_1.35.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.34.1.bb => netdata_1.35.0.bb} (94%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
deleted file mode 100644
index e3c7a7cd2..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e8ec0a0f3a353a8167687a8fdb26773e45927aac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Apr 2022 09:49:12 -0700
-Subject: [PATCH] Use explicit typecast to enum rrdset_flags
-
-specifications say
-An enumerator can be promoted to an integer value. However,
-converting an integer to an enumerator requires an explicit
-cast, and the results are not defined.
-
-Therefore The bitwise OR operation you are performing results
-in an int, which you then attempt to assign to a variable of
-type rrdset_flags without a cast.
-
-Fixes
-| ml/Host.cc:167:9: error: assigning to 'RRDSET_FLAGS' (aka 'rrdset_flags') from incompatible type 'int'
-|         rrdset_flag_set(RS, RRDSET_FLAG_ANOMALY_DETECTION);
-|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/netdata/netdata/pull/12750]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- database/rrd.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/database/rrd.h
-+++ b/database/rrd.h
-@@ -489,8 +489,8 @@ typedef enum rrdset_flags {
- #define rrdset_flag_clear(st, flag) __atomic_and_fetch(&((st)->flags), ~flag, __ATOMIC_SEQ_CST)
- #else
- #define rrdset_flag_check(st, flag) ((st)->flags & (flag))
--#define rrdset_flag_set(st, flag)   (st)->flags |= (flag)
--#define rrdset_flag_clear(st, flag) (st)->flags &= ~(flag)
-+#define rrdset_flag_set(st, flag)   (st)->flags = (RRDSET_FLAGS)((st)->flags | flag)
-+#define rrdset_flag_clear(st, flag) (st)->flags = (RRDSET_FLAGS)((st)->flags & ~(flag))
- #endif
- #define rrdset_flag_check_noatomic(st, flag) ((st)->flags & (flag))
- 
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
similarity index 94%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
index b777d2089..26dc62d29 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 DEPENDS += "libuv util-linux zlib"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
-           file://0001-Use-explicit-typecast-to-enum-rrdset_flags.patch \
 "
-SRC_URI[sha256sum] = "8ea0786df0e952209c14efeb02e25339a0769aa3edc029e12816b8ead24a82d7"
+SRC_URI[sha256sum] = "7981103c4ddd452de3a4565fb6c304454dc4c9adcc1954d716102f14df8ad4bb"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


