Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F374BC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 09:26:40 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.12415.1699781198700459126
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 01:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TRS5S5tr;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo5352977a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699781197; x=1700385997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hvtWlJyNS5OLBxVSvNxpPz4Jv0vi20UUVVbgJbdeuOQ=;
        b=TRS5S5trYD5pc8pYqFmvE3SePE9JklbiNJmEOP5G/paXpIYLgVdeNBQvYg+Oq1aToo
         T9VfBtgT76vxrIWt2GDI/nodqnBaIjkpof7/RStmhMWF65+CU2uOXA/1bL+zuRNyKvPt
         hl4s2DwHk4/4zMjjbF6KFu1bqtRc1UZFeVkI9CYwJxUWXg/x+Q52ZDp89KoEHoWqnHjQ
         HKZakieY06zDGxD3cxgl6ExcXCKRhE0xSm0RZw/1G2VbjhjJsJ23qB4Eka+tNq3KPph4
         dzAf7vyWz+7bebNnaEG06Mzp5fRFwO+9r6RcJGPVXSB9OrwJLISmf1esaiOE502i0LLN
         WLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699781197; x=1700385997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvtWlJyNS5OLBxVSvNxpPz4Jv0vi20UUVVbgJbdeuOQ=;
        b=MQfqTijjxOYyTj5dTidHdC1BCm6b1cIfSOkq2NK7MZHBvIhekSgW4VbqjrJ0nQ3Tyl
         l6g58rk0gWuaGeQqu32uFt4Airyhek0HueW5CdSUYJsWAbS8rRv1R40FhjpFsASCWyvT
         hUtxTkdjsvXUdW8/N0TLdBd24qO5sAvoekXeqsr1ttfMndg3FDYD7qUb3vhpwPUUHgSS
         coDzLq/upm/WeuTAJc2ytRnLUZz8LPeSt/R/TJ6bP3g7e0bzN0WoibvEaQcDmykw6vzG
         zOnLuR/LSVlrFFQXP/yJQDzjBfTOl1b3jjgxMuaKQCU4hEGs5abt+aCl609VjQOK3EX4
         HdkA==
X-Gm-Message-State: AOJu0Yyvzn9zU2nJ2aRp2atGnhRXwxHmKElRbrKWWuQFnfvZ4kXg34KM
	PRrJmgTIfi+rMjo+mU4+JKBweSB4FDLxVw==
X-Google-Smtp-Source: AGHT+IG80eMd8moBIMPhRC7Bu0OiN93daRLMTcASBt4jBEYocCl7nWw5Oz+dRQwbhCSAy74L6p6DDQ==
X-Received: by 2002:a17:906:3754:b0:9c8:f128:2fdb with SMTP id e20-20020a170906375400b009c8f1282fdbmr2731251ejc.13.1699781196366;
        Sun, 12 Nov 2023 01:26:36 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id u7-20020a1709063b8700b009b9a1714524sm2323756ejf.12.2023.11.12.01.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 01:26:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] libisofs: upgrade 1.5.4 -> 1.5.6
Date: Sun, 12 Nov 2023 12:26:20 +0300
Message-Id: <20231112092620.101889-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 09:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106580

Changelog:

* Bug fix: iso_write_opts_set_part_like_isohybrid() did not cause a MBR
           partition table if the partitions are data files in the ISO
           rather than appended
* Bug fix: The lseek methods of IsoFileSource for local filesystem and loaded
           ISO returned libisofs error codes as positive off_t numbers
* Bug fix: Freshly cloned data files from imported image were not marked as
           imported. Thanks to Ivan Shmakov. (Closes: #1022851)
* Bug fix: Size of further CE area was calculated wrong if its CE entry ended
           exactly at a block boundary
* New iso_write_opts_set_system_area() option bits 16:
  GPT "Legacy BIOS bootable" and 17: GPT writable
* New API calls iso_assess_written_features(), iso_read_image_feature_named(),
  iso_read_image_features_text()
* Allowed lseekable device files with iso_tree_add_new_cut_out_node().
  Proof-of-concept by Ivan Shmakov.
* New API call iso_write_opts_set_max_ce_entries()

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../burnia/{libisofs_1.5.4.bb => libisofs_1.5.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/burnia/{libisofs_1.5.4.bb => libisofs_1.5.6.bb} (82%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
similarity index 82%
rename from meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb
rename to meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
index 1754db7f7..0add3777f 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=1c1e5a960562d65f6449bb1d21e1dffc"
 
 SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "aaa0ed80a7501979316f505b0b017f29cba0ea5463b751143bad2c360215a88e"
+SRC_URI[sha256sum] = "0152d66a9d340b659fe9c880eb9190f3570fb477ac07cf52e8bcd134a1d30d70"
 
 DEPENDS = "acl zlib"
 
-- 
2.25.1


