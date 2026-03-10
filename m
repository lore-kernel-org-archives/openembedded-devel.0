Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4989FFCC9CF
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 06:38:54 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34267.1773124723879500224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 23:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=evqS9you;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1334352-20260310063840c3bb7fea3500020757-r3bfbn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260310063840c3bb7fea3500020757
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 10 Mar 2026 07:38:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0Nf0pVaz7Bb2zlEenFfDmdVoUTuHdryDs3eYMM41JjE=;
 b=evqS9you2gfUygLoG5gMVkgRWteNZcC7COfx4aSKAnPLkH06f1BmXOfcmMhTU2dPxwUAPm
 YlDoymwjQPFgQZSQEmXWb8wA/SILmZraJb6Djw1u2UD8+JwD09oacOqTTipGWiqePCRP7iTJ
 6fnO9fQdhC6mvW/SkOvoDeuK8R9zorZEhWBlu1rZZ+hfSbFMdP05Dg3aXSaAxfbjH3Hg0mIM
 1uSCbi1t3WDpuSJQ0VQE1AGIrhIADMGW7AIDuPBJeJQHyWGDGWSQDqKG27n1uAp0462Tw0bN
 n166bKKx2zchJm/LoKD4iMWaP4eKLBPSxETESc0XeKC6Dtki+ji5fyug==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v2 05/14] libmodbus: upgrade 3.1.11 -> 3.1.12
Date: Tue, 10 Mar 2026 07:38:33 +0100
Message-ID: <20260310063833.766690-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 06:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125014

Add 'tag' to SRC_URI

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
 .../libmodbus/{libmodbus_3.1.11.bb => libmodbus_3.1.12.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.1.11.bb => libmodbus_3.1.12.bb} (88%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
similarity index 88%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
index ffbb3a8c8e..2e149580eb 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
-SRCREV = "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
+SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "9af6c16074df566551bca0a7c37443e48f216289"
 
 
 inherit autotools pkgconfig
-- 
2.47.3


