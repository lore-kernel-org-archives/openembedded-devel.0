Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFAACD4842
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:50:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47940.1778500047701232952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 04:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kKMZpAc/;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA086600CB;
	Mon, 11 May 2026 11:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82541C2BCC9;
	Mon, 11 May 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500046;
	bh=+5vbsGox6XilCB8lzsiIiRsA8erKgKMZz2n9QVDq/xk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kKMZpAc/sVGNFyeA8alRacniWN8/O6vHoEImc8oeezkPDodmqRjF1imrIozCZLjCV
	 umqQAZ5RRKRss/Uuc9HqCXSZbLB3ZBrMX3RcBEqAT4YrcLyWQsNNKOD0Lp5QgymXcE
	 2m0yaC+/hqhXmqVtdPKfdJpz1dl5/5HF+qL2SRxFSNFql+PyFuYlJD3tGv9CecKNCp
	 iGH+/wDeEQVptZn2T+OttS83wwRwNfnlXCLqvUl7mQd1QIs085EVLJXLmUIWEV4JbU
	 ONGa9aYbetIRloGTkaHy7dVF6YnbFIDKFAPGn8m5voQSzo6MQQ/zNtqNb3AXLPr6cQ
	 6EZTnqF0+yQcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4ECCD4842;
	Mon, 11 May 2026 11:47:26 +0000 (UTC)
From: "Louis Rannou" <louis.rannou@non.se.com>
Date: Mon, 11 May 2026 13:47:23 +0200
Subject: [PATCH v2] openvpn: create an extra package for the dns-updown script
MIME-Version: 1.0
Message-Id: <20260511-bash-rr-v2-1-63833caf12aa@non.se.com>
X-B4-Tracking: v=1; b=H4sIAMrBAWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3aTE4gzdoiJd07QUAwsjA1NDy1QTJaDqgqLUtMwKsEnRsbW1AIz
 q2iVZAAAA
To: openembedded-devel@lists.openembedded.org
Cc: pascal.eberhard@non.se.com, Louis Rannou <louis.rannou@non.se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778500045; l=1832;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=Ak15XMMxbMKcTUukb9UZ6uXAq9ojZ6Vpr1NDZ+t4Frg=;
 b=OPr5cmufiFAydWmMOnef4SPjGdF+ciFlw8Rb8ZazgiMNiuW1Q3/QLvY/mBn4aXs+viVWqkKM6
 I5pH4mX0ke6AaByRrHwK98DTXJcBUkZRx7hRpjht4Nb1ctwxVRYAKul
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 11:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126847

From: Louis Rannou <louis.rannou@non.se.com>

The dns-updown script is written in bash which is under the GPLv3
license. As this script is optional, it is preffered to have it in an extra
package.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
change in v2: new package openvpn-dns-updown
---
 meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 0cbe4641cd..6ddebde4d1 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] = "--enable-iproute2,,iproute2,iproute2-ip"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
-RDEPENDS:${PN}:append = " bash"
+RDEPENDS:${PN}-dns-updown:append = " bash"
 RDEPENDS:${PN}-ptest:append = " bash"
 
 do_install:append() {
@@ -114,7 +114,7 @@ do_install_ptest() {
     cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
 }
 
-PACKAGES =+ " ${PN}-sample "
+PACKAGES =+ " ${PN}-dns-updown ${PN}-sample "
 
 RRECOMMENDS:${PN} = "kernel-module-tun"
 
@@ -124,5 +124,6 @@ FILES:${PN} += "${systemd_system_unitdir}/openvpn-server@.service \
                 ${systemd_system_unitdir}/openvpn-client@.service \
                 ${nonarch_libdir}/tmpfiles.d \
                "
+FILES:${PN}-dns-updown = "${libexecdir}/openvpn/dns-updown"
 FILES:${PN}-sample = "${sysconfdir}/openvpn/sample/ \
                      "

---
base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
change-id: 20260506-bash-rr-5fd0820519e4

Best regards,
-- 
Louis Rannou <louis.rannou@non.se.com>



