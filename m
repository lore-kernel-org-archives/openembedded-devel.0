Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C859CEDD90
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.15105.1728477019211358378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 05:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WP7LUe99;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so6367111f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728477017; x=1729081817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiN9oIK8brmBuarzy7+nxjaLnCQofGs5Rj7o92HCHlg=;
        b=WP7LUe99XQzGFMxtDhnvpb+9nuKLl1/EA+zBIUIj0cjngiMjvSP60E+KjLpTUcGdn9
         i6WqsWBd3H1pQEjJYW6nl/fLkIAqETO1tKiFMTkuaNxeL+fgS9t6vi8j7vp2Dv7zV1st
         lWklWm6305PleGYHUhFrEUnTWI4SqPkYhb0/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477017; x=1729081817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiN9oIK8brmBuarzy7+nxjaLnCQofGs5Rj7o92HCHlg=;
        b=Pa4WcpNRxd9cjYkmGKNAJkGP6vHS8sZtdO8Tu/s5n2JxfaCoKTti+r1BVq/jWtMhK/
         lNoiGn48HT57p7C6+4US/QPYECz0Qz1XFRsANpWPQ5nZMQR9ioqztMYnNnuErzl13u2Z
         TnBx9/uvALAW6ooIWzdWWuVAPi7HDEzLnHdIMUeYO/npV+U7Pq1BwYsVuKPBdJP1ZKqN
         6i2zVT8msS0ljVZlwPFe8MYLPKZ9zQyoe/qliHca6SOvPblosE4tBEq5y1qks9Yrgr79
         WW0CgtMidPF+37aeeKXuDrLZk74bub7vA5gpjHbRL2qooi4tjiV2UMyFkzTQmiyH3Pp9
         EbUw==
X-Gm-Message-State: AOJu0Ywpa8CSSvz15MzstG/4MjWYyrAEiwtAxBA1jKEqN16yo3qlSr2B
	JCCFFbH1X4QwyU8yo0Xd3epOC8BGB5J44rCqaFomV6420mHGK0pb/6RLTuVPsAwtQKrefxV2BXX
	y
X-Google-Smtp-Source: AGHT+IGsE1dzwL4lWeW3sv+M/6R76zBIq84LKJSo5KuP8loVg7nC7aIBZzy4UHuyO5CV6Sk5YxI6Lg==
X-Received: by 2002:a05:6000:12d0:b0:37d:37a6:f4e3 with SMTP id ffacd0b85a97d-37d3aa41f7fmr1800987f8f.23.1728477017336;
        Wed, 09 Oct 2024 05:30:17 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9944c6d6basm543582266b.145.2024.10.09.05.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:30:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pymodbus: Upgrade 3.7.2 -> 3.7.3
Date: Wed,  9 Oct 2024 15:30:07 +0300
Message-Id: <20241009123007.1023153-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241009123007.1023153-1-leon.anavi@konsulko.com>
References: <20241009123007.1023153-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112731

Upgrade to version 3.7.3:

- 100% test coverage of framers
- Framer, final touches
- Readme file renamed
- Remove old framers
- frameProcessIncomingPacket removed
- Cleanup framers (reduce old_framers)
- Run CI on PR targeted at wait_next_api
- Sync client, allow unknown recv msg size
- integrate old rtu framer in new framer
- Update README.rst
- Client.close should not allow reconnect=
- Remove async client.idle_time()
- Client doc, add common methods (base)
- Reset receive buffer with send()
- Remove unused protocol_id from pdu
- CI run on demand on non-protected branches
- Server listener and client connections have is_server set
- Reopen listener in server if disconnected
- Regroup test
- Improve docs around sync clients and reconnection
- transport 100% test coverage (again)
- Update actions to new node.js
- Bump 3rd party
- Documentation on_connect_callback
- Fixes the unexpected implementation of the
  ModbusSerialClient.connected property
- Forward error responses instead of timing out
- Add stacklevel=2 to logging functions
- Fix encoding & decoding of ReadFileRecordResponse
- Improvements for example/contib/solar
- Update solar.py
- Remove double conversion in int
- fixed type hints for write_register and write_registers
- Remove _header from framers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymodbus_3.7.2.bb => python3-pymodbus_3.7.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.7.2.bb => python3-pymodbus_3.7.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.7.3.bb
index b240837d4..9e4c80ebf 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "6cc63a14c8cca83f5b6d9dae3319565061bd49503ee7282df681201c16357eef"
+SRC_URI[sha256sum] = "603490162382fe34258992e3b8fe8d2da573a08aa49257ee7ab7b5b1d1a6653c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


