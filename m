Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBB2EFCD8A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:43 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10843.1773050801096224492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=Yyb/ZYpy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1334352-2026030910063982fcc07f310002070d-zcfcyn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026030910063982fcc07f310002070d
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lgdp9Iez80mx16DDthVB0v05j/dMAcQhZm1t1rCDSUw=;
 b=Yyb/ZYpypdT0YYRhEoW8VRkPekak37Oe9JIoNBnxvCm0sVP3yogvh6oEjrXjMUI6jSGHIx
 3deOpgZTsv4cFiPdG+J9O7do0HLU3xr+UD2T7HR/XvsxpxVSANOeICQHS39kfMHJfBLtwFdk
 LhtSMWYqZp91/ame0mBhzdIkQcjYIedl6FmkeulX2xfiKB0j3584z4hm8yttnSH5bM6dAtDs
 CcQxusiRjNHwatAzBUZSofJj1F/T5GlBLUQDS9xdS6qFMKBLVBpOURjHwJgphIV88aEq3igO
 iintlcuF1rsI5K2ra7Kmp6kbbGME7bfBs/CoBkZ1DU1LNh7VBoOEyUfA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 05/14] libmodbus: upgrade 3.1.11 -> 3.1.12
Date: Mon,  9 Mar 2026 11:06:21 +0100
Message-ID: <20260309100630.404637-5-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124977

Changelog:
  https://github.com/stephane/libmodbus/releases/tag/v3.1.12

Changes:
- Fix FD_SET overflow when socket fd >= FD_SETSIZE.
- Check dest pointer not null and nb in read functions.
- NULL check for src and nb < 1 validation in write functions.
- modbus_reply: don't compute address for FC 0x07/0x11.
- Use O_NONBLOCK instead of deprecated O_NDELAY
- Explicit cast for Coverity CID 416366.
- Document required buffer size of modbus_receive.
- Document macros for error codes corresponding to Modbus exceptions
- Fix example of modbus_rtu_set_serial_mode
- Test filesystem provides symlink in autogen.sh
- Sync API signatures with the documentation.
- Many documentation fixes and typo corrections.
- Add coverage target and helper script.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../libmodbus/{libmodbus_3.1.11.bb => libmodbus_3.1.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.1.11.bb => libmodbus_3.1.12.bb} (92%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
similarity index 92%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
index ffbb3a8c8e..06a4049b31 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
-SRCREV = "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
+SRCREV = "9af6c16074df566551bca0a7c37443e48f216289"
 
 
 inherit autotools pkgconfig
-- 
2.47.3


