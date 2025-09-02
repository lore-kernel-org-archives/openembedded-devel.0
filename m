Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48DDCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 10:11:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.73341.1756807090188420433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 02:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1utNmC-0001bZ-Bc; Tue, 02 Sep 2025 11:58:08 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Erik Schumacher <erik.schumacher@iris-sensing.com>,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][PATCH] image_types_verity.bbclass: remove breaking unit suffix from machine-readable verity parameters
Date: Tue,  2 Sep 2025 11:57:54 +0200
Message-ID: <20250902095754.174852-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 10:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119177

Since cryptsetup 2.8.0 [1], "veritysetup format" prints " [bytes]"
suffixes for "Data block size" and "Hash block size" parameters:

  UUID:
  Hash type:              1
  Data blocks:            34655
  Data block size:        4096 [bytes]
  Hash blocks:            275
  Hash block size:        4096 [bytes]
  Hash algorithm:         sha256
  Salt:                   8a8d8d807bd9838a80397a13b3bc13c55780ff1677ee4489366b17dab1b29316
  Root hash:              bd85312151dc5c69efce943038e0ac4b92e14d8954cce5d3cc90513837f854bf

This output is directly converted to a shell sourcable form in
"${DEPLOY_DIR_IMAGE}/<IMAGE_LINK_NAME>.verity-params" used to
create the desired block device via "dmsetup" during runtime. The unit
suffix becomes part of the VERITY_DATA_BLOCK_SIZE and
VERITY_HASH_BLOCK_SIZE variables, breaking its consumers:

  /init: /verity-params: line 4: [bytes]: not found
  /init: /verity-params: line 6: [bytes]: not found
  verity root hash: bd85312151dc5c69efce943038e0ac4b92e14d8954cce5d3cc90513837f854bf
  [    3.323577] device-mapper: table: 253:0: verity: Invalid data device block size (-EINVAL)
  [    3.323595] device-mapper: ioctl: error adding target to table
  [    3.345301] /dev/dm-0: Can't lookup blockdev

Fix this by removing the unit suffixes from the values.

Ideally veritysetup should support machine-readable output, but that did
not spark joy on the maintainer's side [2] (at least in veritysetup
itself).

[1] commit f8788f34 ("Mark all sizes in status and dump output in the
correct units.")
[2] https://gitlab.com/cryptsetup/cryptsetup/-/issues/638

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta-oe/classes/image_types_verity.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/image_types_verity.bbclass b/meta-oe/classes/image_types_verity.bbclass
index d77bc20a13..24462277af 100644
--- a/meta-oe/classes/image_types_verity.bbclass
+++ b/meta-oe/classes/image_types_verity.bbclass
@@ -145,6 +145,7 @@ python do_image_verity () {
         k, v = line.split(':', 1)
         k = k.strip().upper().replace(' ', '_')
         v = v.strip()
+        v = v.removesuffix(' [bytes]')
         bb.debug(1, f"{k} {v}")
         params.append('VERITY_{}={}'.format(k, v))
 
-- 
2.47.2


