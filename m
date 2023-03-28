Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F325C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 06:48:34 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.60037.1679986113547442074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 23:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fastmail.fm header.s=fm2 header.b=l1CgGiKD;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.29, mailfrom: cvubrugier@fastmail.fm)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 0B8325C00B6;
	Tue, 28 Mar 2023 02:48:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 28 Mar 2023 02:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679986111; x=1680072511; bh=COcdO7CB2y
	rXLpyTnHx1pfIr9T2Cl7JQ07G4A7eugTI=; b=l1CgGiKDZ8yWyoRblco23jDk39
	ZrXR550xYnU+vA1ucCJ9YMw0+LUMXMw/T+qo4VYBSTx1GO/GW66M5i5hmpzb7fVy
	DRcYtaMMvbxrim+ckpQmtmo4oVzmk9iVSgu3OBgtFMV+Rd7CSkehjJ3nlH0j4UQ0
	+StfamshUH/xsWQPKbBnBIK4mwy02HUQFTINVLAa5d6VmJ4EWT9vZttuRS/mPws3
	Y4j/vM/n0Y5jpWLFPlq9lUpK6pubQfKu+10Cp14wm7eGy8OKnT1dhUnFMTH8/OZp
	r8qgxFeJq8gqJP1DUHvlPG9SkLEzcMhti/d6iAIAVyJtEkznDT79smeIKETQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679986111; x=1680072511; bh=COcdO7CB2yrXL
	pyTnHx1pfIr9T2Cl7JQ07G4A7eugTI=; b=nmWRW/aIqxbNRbRx6VQrm5FBHsWtN
	XK/jeJ1VjE4AVqdRyhpxgngvroHM4tg5nC/9BnAOmzbPHaGZsm6LCJxbf/5Ws2bX
	UistneweZUvsIeHidPRcF7Fci2DIb89zIU8uBtDeA23KYoBYPtTON0Saaa4+A/cy
	70rnl5EIzApEcX422bV5kRy3DmJvcB2Gu0+WI23fEBXD++JXzDMCGw69aClZ2prk
	Vu3q1zzyTnMwi5I8L1baIgOIUkbW7sObZaaPXnQwmDftOcBNiWs735urzH0nRIRu
	8V7QfKr5bZ/5PEToV7Ec5x9EYMlrAUSSZlDjgbs8HDjoU3FULmDSqm8uA==
X-ME-Sender: <xms:vo0iZMHy82sC_2OW_WYog2Pj-ei0hPNqM9ngbg7KxM6NoNRrfMWtdQ>
    <xme:vo0iZFXe2ZK8Vulqn8OL8g16-QGS8Tdf6RVZbEnA99Wk2eoO_cH_OCcgEhdbAM1Jd
    RNL9Pi4B-7uJ76wrQ>
X-ME-Received: <xmr:vo0iZGJgQOg7y7sxtnhrD-YGeTmI-JIKXGdQeMocw81PTok1MVLUq97eoajVJAVS394_u3eTI-gGQE7cKxDRj2bVcqZ3KaCXOkDr8lcAyC4N5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehfedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeffhfehvdefje
    ekgfeiueeiveeifeefkeevveduvedvlefhleeihfeliedugfejhfenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmpdguvggsihgrnhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgr
    ihhlrdhfmh
X-ME-Proxy: <xmx:vo0iZOGBPNX4kkYz8RA-vCWIisqQ79t6hoBe4Pl4IBjup3tZEshcqw>
    <xmx:vo0iZCU3Iz2XCCk2wLC_HpZvvU4N5YRX3f9KCuJBoOk7ABCoyRHFYQ>
    <xmx:vo0iZBNVjBjv6hkoE7L3K6bj_m8RigeBhCNqX1tc4bRKf3oUZKx0FQ>
    <xmx:v40iZLdnoOCCRUA8rKZqn0zJx3_rFAbD84-dVhLaXVjsNVcGySWthg>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 02:48:30 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH 1/2] exfatprogs: add new recipe
Date: Tue, 28 Mar 2023 08:48:01 +0200
Message-Id: <20230328064802.42713-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101798

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

exfatprogs provides utilities to create, modify, and check exFAT file
systems on Linux. The developers of exfatprogs also maintain the Linux
kernel exFAT driver.

exfatprogs has replaced exfat-utils in Debian bookworm.

References:
 * https://github.com/exfatprogs/exfatprogs/
 * https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1002871

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfatprogs/exfatprogs_1.2.0.bb            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
new file mode 100644
index 000000000..0b26a215b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "exFAT filesystem userspace utilities"
+DESCRIPTION = "\
+As new exfat filesystem is merged into linux-5.7 kernel, exfatprogs is \
+created as an official userspace utilities that contain all of the standard \
+utilities for creating and fixing and debugging exfat filesystem in linux \
+system. The goal of exfatprogs is to provide high performance and quality \
+at the level of exfat utilities in windows. And this software is licensed \
+under the GNU General Public License Version 2."
+HOMEPAGE = "https://github.com/${BPN}/${BPN}"
+SECTION = "universe/otherosfs"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
+
+inherit autotools
+
+RCONFLICTS:${PN} = "exfat-utils"
+RREPLACES:${PN} = "exfat-utils"
-- 
2.39.2


