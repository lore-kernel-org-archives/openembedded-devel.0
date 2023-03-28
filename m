Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513D0C761AF
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 17:28:20 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.2602.1680024490790885730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 10:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fastmail.fm header.s=fm2 header.b=oaqkItJ8;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.21, mailfrom: cvubrugier@fastmail.fm)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 7393A32007D7;
	Tue, 28 Mar 2023 13:28:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 28 Mar 2023 13:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1680024489; x=1680110889; bh=hkX+yNAPHi
	C9OEaUkCH1chwcKlh6Kee5VFWaWxhXBdM=; b=oaqkItJ84DWarrSlHNIweaeXYR
	zb3DKS4t05JmTPGX/O6DhfyKSM08LZxHnqO7apOss7cqryD7Cs7YkwfenHOO+TOH
	CeXkacvu9E5fCvqT08xqZaDr23hsCtHQZzwaWYneTqH47N82Vn8nF4mW+W2NJuYx
	kW+FgbaPFG3EonQ3wdvLiCYX+723lxeXUcgbPlFdaoOIp/qFWgSCQf35A9Ap8MCA
	0VAAyGl+21KjedcM8KKm8yGaUNfHC41nWZClDaUUdDzC95qFu8s8PuggoL7J+FyN
	UHwtV/+uWEy8zSCkGje2Xj6wTBu247TospYryh6/YUO5VhDGvolMUslTxRqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680024489; x=1680110889; bh=hkX+yNAPHiC9O
	EaUkCH1chwcKlh6Kee5VFWaWxhXBdM=; b=nA8fKKl7YNgZ+v8g3xOUSn+/FZ00w
	szYm2FE0KeKqUTMz4Aa/po1Dvt+SkJTKZGaer29HgLIgI8i2rUBQlv8NixLs8ZSY
	3G5bpTkoXU5nDXZtN8yE/S11G0Y1gnS5nFO5MtMHBakoPLq692Vgt/N3UB+xOnJW
	UFxd5WBR0sblt2n0nXXYbmoN4srnGiHF7LlgHM48cwVARIxrG5H9TNnBhVFHOK6I
	L7oH43R0jdzHyo4LbOi5g6zrjFn3+ktmHZj878eEB/I+JX/4GRTNnDiN647HjS48
	zLPYfzhHV0UVMUL9FS+AswLaBTiZUzMaAmgKyYmMNVLdHPkKdcOzCo5Xw==
X-ME-Sender: <xms:qCMjZJdU7JNWAB8mqdB0A5JDza_PlG2oSO8lNmEN6Va95o7icKot4w>
    <xme:qCMjZHPKyYS0Q87vgopwGma3DnoxBRnMd_YuFqWprydbvV3DiG349qD-0y3n8RQSn
    cDcnScyAdV2eTINgw>
X-ME-Received: <xmr:qCMjZCjdMilYzzNBzbavAsKiyv2DOjYtvlnJpEal85S2yYfqFIE5YrooqwE6Js71LETOniJ9uGDTc-24L0WMz0BRv1Q0D_YIFSBoHjWYAa_9Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeffhfehvdefje
    ekgfeiueeiveeifeefkeevveduvedvlefhleeihfeliedugfejhfenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmpdguvggsihgrnhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgr
    ihhlrdhfmh
X-ME-Proxy: <xmx:qCMjZC-GHRPtyKvQG67_3Hq5tGp6fnAiGoTkDjZpz_bjAr9u5en1KQ>
    <xmx:qCMjZFsguFuTkvitKlzfhCN7HTFOaWcyDg3QGrXCwRb4vV0iwCWQ1w>
    <xmx:qCMjZBElQrmpspAwF1FTPYBU0UGunDS6HzV_-4iPt305-OgydY9ZAw>
    <xmx:qSMjZGWIR342pCaqtD_O8U_6FXjmOZItb__FFDf_HltfwQsO4Xlk5Q>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 13:28:08 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH v2 1/2] exfatprogs: add new recipe
Date: Tue, 28 Mar 2023 19:27:20 +0200
Message-Id: <20230328172721.10639-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 17:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101808

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
Changes v1 -> v2
 - Add RPROVIDES:${PN} as suggested by Martin Jansa

 .../exfatprogs/exfatprogs_1.2.0.bb            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
new file mode 100644
index 000000000..8cc59329f
--- /dev/null
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
@@ -0,0 +1,24 @@
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
+RPROVIDES:${PN} = "exfat-utils"
+RCONFLICTS:${PN} = "exfat-utils"
+RREPLACES:${PN} = "exfat-utils"
-- 
2.39.2


