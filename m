Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010D3C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 16:09:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.32740.1747584587379346780
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 09:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oo4Rt8v+;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30e57a37294so3180753a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747584586; x=1748189386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1L5j2N337cQavlGrq2dZaYkDCtNXbJp+YCBBuCwCqkw=;
        b=Oo4Rt8v+kcurm0BqrZ66tqF4QW4j1jAIVg3z8t6WhmocNya/0DV6b5kM0r7Yi0uoJn
         GiB7hef+rLBho3OV91OyDVglgNSzPXJGcXg12Mi9IGZGi/uRhiHVp2NeGDo+K4dQkwoG
         rpdINwGbNPOUqUZzRrCJjd6VavBsslkaAbApwgbg8lrVC9unXifas1Hu9moorbn7Bm+1
         nClkU8ILvA42ia1lD6602mesn3Nx97sUMc916YTlwBukU+cTyc8KyTXyvsVI9GSyrmcD
         u4UT/HLtn10YsmmiLNEqbfG6/IvI+zGFGgCzZgNk4mZlQsftHd0jYVuHvsOzm84Xalgy
         kplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747584586; x=1748189386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1L5j2N337cQavlGrq2dZaYkDCtNXbJp+YCBBuCwCqkw=;
        b=H0kkj/ThOyDnK88YyI1p2Jn6rEdB04GT36X2kfIXL4mFtLzcXQjVuZNpQFhowYjlDj
         BT0rmIf/dhTbyA97/0Mzl8KGi4bTVX+7D6l+eHXbm//X3wU+yT4FCzKU1J79YtH28+NL
         5K4laHfpzOa7r2jQ1kFri7p3A3uT6rLUcn1ogSa7Kc16MK+c0P2e1sgWb5oAuBPjVkFM
         avc28CN3iUqrH8gjE0NMfeqYAJKXe7sDxGhIJvQ6/xENrhzRC67rbPjwwDZ+Jxq70SfY
         N5V+BaIdQCHMfuU5+unE6oJ/JCAPjmJwdQ5Y4h3FuUc4965ASOWAEnNDnEr1wdbgFly9
         8Ivw==
X-Gm-Message-State: AOJu0Ywyb5IsSrsiEi09sveZJ3PuCaSQT5vLq9Y9flWtRsCuXtSclosQ
	Kjqk0VcCxNnUIyJ0YZmYaqEOAR5BE5XZeriuCXilmnd5xgj8NUndm43jEDhF2XnT
X-Gm-Gg: ASbGncsyZdeL/QBP+d4VoRjXAtEbJddBa/vfPXff6g56kZv/y+bstZvdQyW017Tgox3
	x6b91Co0RXLoCEUtCaUSsPE5xqJM0Qi0nwYac85y9pZYT8+1cN0ioPUQ+Ylb7jhnsICMo3gpMKN
	3ivobc21c9tiMTN5Zo4GheJhjtnSuknicVV6F9pvFhy+96/4ZZl3x9+onQUOXRX44DB3W8zxOCh
	sw2Irrl8rBYvuQdcOjmGFUlNhQT0Tm6pOQG75lnxhFQtQP5gKeBB4YLe7zsPUBaiuQBXudLhHQH
	o/GvSKD6vR82fN3VFMjgatun/gsstnbygA3UkkrOzN8=
X-Google-Smtp-Source: AGHT+IFRJfVj1M/L4Cprk9WZsd5P+MFcqkRQoIEdnZ6TMU+//lW3WAIgnYhaIcvfOteFvP9XO4Qwmg==
X-Received: by 2002:a17:90b:4a83:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30e82fb9686mr17192733a91.0.1747584586490;
        Sun, 18 May 2025 09:09:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6d90654asm5625948a91.34.2025.05.18.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 09:09:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] influxdb,etcd: Skip from building
Date: Sun, 18 May 2025 09:09:44 -0700
Message-ID: <20250518160944.3402060-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 16:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117455

Latest layer compatibility checks have been enhanced to check for
network access during non-fetch tasks and flag it as failure, which
is now happening for these recipes since it calls go module fetcher
during do_compile

Latest gomod fetcher has got improvements and can be used for these
recipes but it needs some work. Skip them until it is fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb            | 1 +
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb                | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1d6c45c518..2055a0ff91 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -201,7 +201,6 @@ RDEPENDS:packagegroup-meta-oe-crypto = "\
 RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
 
 RDEPENDS:packagegroup-meta-oe-dbs = "\
-    influxdb \
     leveldb \
     libdbi \
     lmdb \
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index cc8161cc3d..580b92b3b3 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -77,3 +77,4 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE:${PN} = "influxdb.service"
 
 CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."
+SKIP_RECIPE[influxdb] ?= "QA Issue: task do_compile has network enabled"
diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index d665357702..dd30543a41 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -70,3 +70,4 @@ do_install:append() {
 
 FILES:${PN}:append = " ${sysconfdir}/etcd.d/etcd-existing.conf"
 
+SKIP_RECIPE[etcd] ?= "QA Issue: task do_compile has network enabled"

