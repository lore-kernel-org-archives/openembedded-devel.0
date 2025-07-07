Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB77FC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:16 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.56132.1751879233924486135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ock5tfnO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879234; x=1783415234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KKV/2YRtQ4nMT0saFfBJUPTHRS7K+nadtefOWzqXlGQ=;
  b=ock5tfnOLRsY4oEPfCSZsjNl2lP+d1hxR6u91kQkdFfBlGf+w2V9NIlu
   PRxc6T6tNi/Lgr46C70jxNKHAFRyGWuh5OZ2vHBjVxfRa9LjXXI+/5L0E
   e27cTfSFaejBpcASGnyNXradIr4v6klLQoj50DgorTUULU3un/csG+iYM
   ld/8uIAGlcFUmP8OmTPGxO9knLA41gPAN2XJMCk0VF9ARMlZXvbzcbnu8
   Z/Sdni4IIEMZzOfOP6Lht9+tWSmwwrGYN+AEWXjXIbjeA+GRy+k/9BEQU
   kqsf4VBaMcM/EjjGZMHrUpUZ1MgPdORaaDNAeCetL8DB9+nzdhwKugKXe
   Q==;
X-CSE-ConnectionGUID: 6SmnBStdR7GkoB0/xhicvg==
X-CSE-MsgGUID: tMfl7PnlSZGqzswQWKvtug==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="206006870"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="206006870"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:13 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E264EC00093
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:13 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 64FBDC02F08
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:13 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B658825B93E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:12 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 031E11A000B;
	Mon,  7 Jul 2025 17:07:11 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/35] libssh: upgrade 0.11.1 -> 0.11.2
Date: Mon,  7 Jul 2025 17:06:35 +0800
Message-ID: <20250707090656.1216-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118260

From: Wang Mingyu <wangmy@fujitsu.com>

 * Security:
   * CVE-2025-4877 - Write beyond bounds in binary to base64 conversion
   * CVE-2025-4878 - Use of uninitialized variable in privatekey_from_file()
   * CVE-2025-5318 - Likely read beyond bounds in sftp server handle management
   * CVE-2025-5351 - Double free in functions exporting keys
   * CVE-2025-5372 - ssh_kdf() returns a success code on certain failures
   * CVE-2025-5449 - Likely read beyond bounds in sftp server message decoding
   * CVE-2025-5987 - Invalid return code for chacha20 poly1305 with OpenSSL
 * Compatibility
   * Fixed compatibility with CPM.cmake
   * Compatibility with OpenSSH 10.0
   * Tests compatibility with new Dropbear releases
   * Removed p11-kit remoting from the pkcs11 testsuite
 * Bugfixes
   * Implement missing packet filter for DH GEX
   * Properly process the SSH2_MSG_DEBUG message
   * Allow escaping quotes in quoted arguments to ssh configuration
   * Do not fail with unknown match keywords in ssh configuration
   * Process packets before selecting signature algorithm during authentication
   * Do not fail hard when the SFTP status message is not sent by noncompliant
     servers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libssh/{libssh_0.11.1.bb => libssh_0.11.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.1.bb => libssh_0.11.2.bb} (94%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
similarity index 94%
rename from meta-oe/recipes-support/libssh/libssh_0.11.1.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.2.bb
index bb2b0dc466..b50177ab9d 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11 \
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
+SRCREV = "dff6c0821ed54f6fbf5b755af43f54cbb723b1b1"
 
 
 inherit cmake ptest
-- 
2.43.0


