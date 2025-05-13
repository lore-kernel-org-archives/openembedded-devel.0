Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B804AC3ABD8
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 20:04:14 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.86192.1747166648237975593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 13:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4wsktMa;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7b391ba6a1so583292276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 13:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747166647; x=1747771447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGKB9s4t44BWc2/hoWDorD+gW5r5wz2JM4mkVlOqF0I=;
        b=m4wsktMaiVUdDMx7TJpI3a5JEwFtOmLHjbKtcvP9z+YQoZ2CzjUvqoW8RKMWLtiefX
         Pzu0B9eRifm+jo9oA2T4C3EpsOB3CNAK2K9BMEhVlBGvBQX3eTOwOdYYjnVuIhAW3N+j
         s8qbwazxZNfzC111W9516bRPks4LYKpwnkvuFMza4yJtbPchNX/QvmMBA0cJGY0ENZnX
         DojVx5XmmyraQQYX1tFIz097uQPytgwiYCve6JxbRXdISfLox3/ny1vh7bPTB6enZweR
         feRIIMy7UyIcoG+FxJiLLS5xFfZeKp6HYL6G77H2enlFYmyFN9JsDyw65DHqqgAFPIqt
         ffwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166647; x=1747771447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGKB9s4t44BWc2/hoWDorD+gW5r5wz2JM4mkVlOqF0I=;
        b=LUg9tc3XVwrMp3TvlG4aYSRHvCbjTEcbDIGnf2eVdpwx5GTL9FMo1QE6agrOTYv3jY
         gMs7wbDo6oA+J6jFLmKDUh2mPYmfzlWsUacywuK6zoPfcfWkaN/D8f6kAfcj2+riDdxo
         MesqoyCgBY9N8beCnB5IWqkO/u2n84Tto0JaOCy/Z9ZeawPSMb1n69xC5p9uAoNPGY6l
         2feM3LbKLQk9GB3jIN/c/dbm8mr5WemxXZq7OgynHAaDEcFKLZKahzyWnK1RZnS9tS8S
         dgrd3f4mM+OpoRcqbr6V9hblFXthlLc0oWem3SixkNmmqFNvwJ9GcgjS/Aofkjuvf9Mw
         nlUA==
X-Gm-Message-State: AOJu0YylxdHIy/LwSV1hTYT2vGPGIrJW2Up/O2kg44o3sJ42JyzDXf+k
	mCQmxmW39j7+p56+6H7PLKcvEFJUO6cCG3hIuN0CLovkdcXdpNqEyzxREmTf
X-Gm-Gg: ASbGncu4UhluZwT/whZR52CMhnqbQRgSZe5+E+iZjEAlLjCrd/ideaKKlUdC3U3metZ
	hgfGRaQyHIw1idQvW2X+YPC1tv44FxESqWO/8N5pxfeoRpX93IUxEnQmthH7rLBx91gjopwjr+/
	O7xA9RH7nD3GN2CGfO8z7kxDPufdtIptcl9cjRU7TJ97lXb9W+cL9nfFia5W9TyrJEkrAvJYC5h
	x4czbW90TPFLiafkJJFZeVqIBv82VNu5g9kQrINwk05CZTZqPjmQjtJ0MjGXKRlTEMwD642VAqC
	6PlGGoabWKloQpMYp+GeEfNfSLNyCOBpzeJe8198yHWcSfCDj86dJC8NRttSTEHarg==
X-Google-Smtp-Source: AGHT+IFk29Uq3qe1CcKEWgBmLHIlbJRUjBhVkwsQfj+wQ9CYQX8ha3r4GMs/1FfQqQfuQNgr0/h64g==
X-Received: by 2002:a05:6902:1893:b0:e7a:b120:4ae3 with SMTP id 3f1490d57ef6-e7b3d70ca44mr800773276.46.1747166647306;
        Tue, 13 May 2025 13:04:07 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:6ade:98e4:ba03:461d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7ab5fb741asm1513944276.21.2025.05.13.13.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:04:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 1/5] c-ares: upgrade 1.34.1 -> 1.34.2
Date: Tue, 13 May 2025 14:04:02 -0600
Message-ID: <20250513200406.26830-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 20:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117401

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.2

This release contains a fix for downstream packages detecting the c-ares
version based on the contents of the header file rather than the
distributed pkgconf or cmake files.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b0cc9ddc32e9e81a95606cb47bd7a5bf9b674a26)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../c-ares/{c-ares_1.34.1.bb => c-ares_1.34.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.1.bb => c-ares_1.34.2.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
index 877e29d9f2..21a0e37e6c 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "7e846f1742ab5998aced36d170408557de5292b92ec404fb0f7422f946d60103"
+SRC_URI[sha256sum] = "35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


