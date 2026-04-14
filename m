Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CAEED7B9F
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:38:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15838.1776163133350051810
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jNJWoADF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163134; x=1807699134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mFU6sE0flYiEyEsm4DD6BdjGGgeDDfuwikeyq8aXgJU=;
  b=jNJWoADFz3FxtfQD62tNGFKFbFPS3E2Zg1TIyLq4pMO3Kfk32ma6610U
   RRig1fbGXYKi1c+QQ/9JMg1dpGBE5Z1VPuPvKz4Bmp2Ud31KYOK8HxZNc
   a1E7KgIKogQSOhUViboB1Swct8snGuMyNgyD84eCJQ246JziEonAVvc7e
   qnhycsQoYgdK7mLgGlp8LBnK3QxF08g0OFWyRNGt/rSCiKsShn/Mh8fM9
   mAjyVqRCRkB+FwJeom5h3Kw4qZXEye+FIASqwrKbCd8hhXwXwhdHJoHTg
   rTqxIyXUV97m28JpFmRuMV928NtfaES4IdAWFw0277qepOhKvhdzwEf7O
   Q==;
X-CSE-ConnectionGUID: XJR6VqdDQ3aKie13qdVCxQ==
X-CSE-MsgGUID: 8NDAAwwdSr2SkqNlnNAX8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236866976"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236866976"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:38:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 84B7E21D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:38:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 355C81800085
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:38:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 95D1314001CD;
	Tue, 14 Apr 2026 10:38:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/32] atftp: upgrade 0.8.0 -> 0.8.1
Date: Tue, 14 Apr 2026 18:38:14 +0800
Message-ID: <20260414103845.1728-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126305

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: update LICENSE from https://www.gnu.org/licenses/

Changelog:
=============
- merge README* to single README.md
- Merge pull request #2 from feckert/pr/20250902-build-fixes
- Fix fortify abort when LTO is enabled
- Fix uninitialized buffer data.
- Enable listening on IPv6
- test.sh: redirect stderr to /dev/null when counting lines
- Declare variable D as local in stop_and_clean
- Fix pthread_t format warning for fprintf
- Fix incompatible-pointer-types for pcre2_substring_list_free

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/atftp/{atftp_0.8.0.bb => atftp_0.8.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/atftp/{atftp_0.8.0.bb => atftp_0.8.1.bb} (91%)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
similarity index 91%
rename from meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
rename to meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
index 9db0aebccb..ecd55684f5 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Advanced TFTP server and client"
 SECTION = "net"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f65159f73e603f89d6867d43191900e5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
-SRCREV = "d5c27eb7a9695d83569767e27ef69674173db39a"
+SRCREV = "7238b7b6753157d0c4ad739df3d87a958f78d70b"
 
 SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master;protocol=https \
            file://atftpd.init \
-- 
2.43.0


