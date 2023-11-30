Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC08C10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 01:17:49 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.60614.1701307067595822001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 17:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CrRIo1oo;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cb74a527ceso378194b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 17:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701307067; x=1701911867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcp5RkBLxHobsb4J/Y4QJl7A3Te5o+/rMVpRIyTTHrA=;
        b=CrRIo1ooy9NijnVT2p/ik3xrGOlt1QmEV09ehYH1bUIVXYo1hPyZMDn0Siqb98MGzA
         /iSu9WwwM0c8oYvYl536vZZ+0R04vKA4gLevKD31R5orS7i11oQHm9IPS/UwtLqgUzqr
         GLoOAz96dzq71W7UyJ9Afq9ZGFAogGkUlxDTfQe1ZkawMDqxBnUkO0FLBGrKt8rjQ4gh
         2S+v0UqF13cctW68QgbxgXQZ7wK7nzBF22+Vkmctfg2kfeXYf6xs9HnaAKYReaSzb1oz
         RR9ikPXQU471/91ztxgO7QxfQEiI//5PESAbz+Fi0lslxWtKk5Cj+e7upmt6TpIEF+AB
         ZQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701307067; x=1701911867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcp5RkBLxHobsb4J/Y4QJl7A3Te5o+/rMVpRIyTTHrA=;
        b=Oe9q7CfMU1082f8t+RXNArW7gCHkBG/2fc4GwVWGR6KAA5W4Wz2F5JR8C3Ah0pXLJt
         nwEyDxFppW7Av+F8GQ/1dhdnoNQjXKWnZp2LTsNIdPnjDo9z1Mxx5VutY8WykicCCLHE
         6YtEk9catemLTnD99tHQc8nh4KsU5sysfpWBbuzHYRwaBerEeGsDmcPtdcyPsOPhrFAs
         kEtcV+33wN/0o7hM+TM9Cb1F85cxpNweyA5xJfe6VHZj7V6ncCDUU9zC7+3nthvM6sz1
         32h0R/vVz8hI4sB0kDLmcNACjthw3kDV8Raz7Q1yhklIXdsxNH0wmXXtzr8+iVOW/5mv
         pqUA==
X-Gm-Message-State: AOJu0Yxn83AFdPFw0jeJQLzpvoetVxro9Ite93IdPtDvFF0F3pgA7fkm
	7ZPWgIln/wqksgpnTR66tCSV1bCK8PulVw==
X-Google-Smtp-Source: AGHT+IGkQZe4J9cdI378FyK90imlfMjpuSv57/OoqDZla47SNcVF4RgayU2+uGFzosAEr5axpqcECQ==
X-Received: by 2002:a05:6a00:1402:b0:6c4:d628:2143 with SMTP id l2-20020a056a00140200b006c4d6282143mr21472028pfu.31.1701307066642;
        Wed, 29 Nov 2023 17:17:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p56-20020a056a0026f800b006c4d1bb81d6sm28359pfw.67.2023.11.29.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 17:17:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] /ptest-packagelists-meta-oe.inc: Move poco to slow tests
Date: Wed, 29 Nov 2023 17:17:43 -0800
Message-ID: <20231130011743.3527746-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 01:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107152

poco ptests take 7+ minutes on a kvm accelerated build system
so it should actually be part of slow test list

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 33aff7f442..9182acf449 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -31,7 +31,6 @@ PTESTS_FAST_META_OE = "\
     nlohmann-json \
     nodejs \
     onig \
-    poco \
     protobuf \
     sdbus-c++ \
     uthash \
@@ -51,6 +50,7 @@ PTESTS_SLOW_META_OE = "\
     libusb-compat \
     rsyslog \
     mariadb \
+    poco \
     re2 \
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
-- 
2.43.0


