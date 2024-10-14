Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BABCFC523
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.50493.1728896165961240273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=traNRdcB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896167; x=1760432167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Yn2ulYrAGEYbATGw8Xc/8pu5iyDRcJuK5ScOUoDLLq0=;
  b=traNRdcBG4yY7nyxV4Fpn70MeMfnnbuXF04Ox8nZNN7g/LOBUGfJGKa0
   hMBwtDOxBYccuN8Ut1rhhFnBcZb5spqLIaswz+dpw0moTK47lOKFN6G1v
   ei5M9F5/Dc4v1J+rPQDB/Ry03rr4jrO+aOJgrc6Av/D+PZ28kFIykvHpe
   BXiUBChVlDiQWowIOfIdc9W5Qye+nNoH8VvuoXDj0lRaj+Z7G+DT5zQU/
   r5BnPSUwfzblEHq+YewX39JbqA6IVQdn8ZlXJDTuAOttH/gqdZIQGxQ7a
   GJ3g5py2oBbCRC7LPbFr+F7c2H30FnjF8dOwNChSQ2MiUi+KDT62N/Pb/
   A==;
X-CSE-ConnectionGUID: cmn4Fji7REqpSEKBEOLPDg==
X-CSE-MsgGUID: tp+n6/riSte69prXvv6nVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176739238"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176739238"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9214CD6E0
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D8CFD5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8872D6BA73
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 531FF1A01ED;
	Mon, 14 Oct 2024 16:56:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/54] python3-distlib: upgrade 0.3.8 -> 0.3.9
Date: Mon, 14 Oct 2024 16:54:44 +0800
Message-Id: <1728896115-2944-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.493900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrNNNNLDf7belUjspoiX02FwOk
	uVkkJKW7D2jkw6aM/N7XeRIHS1+6hzSlhKpTX2bVA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG30tCKdnhB589yM15V5aWpj6C0
	ePs7A07foJlcuVXWZJqRyEMLN/Bu240aaYbQBRFHq3gprHGgImnsjlfSm+imIFIXCfOvP8gUTeC
	4NNCQqbuve5VQ3s4/TSMf3QxkzotZOMoanrLygq8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
=========
- preload script wrappers on Windows to assist with a pip issue
- Remove duplicated newline in shebang of windows launcher
- Add handling for cross-compilation environments
- Do not use the absolute path to cache wheel extensions
- Support mounting wheels that use extensions without an EXTENSIONS file
- Add support for wheel compatibility with the limited API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-distlib_0.3.8.bb => python3-distlib_0.3.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.3.8.bb => python3-distlib_0.3.9.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.8.bb b/meta-python/recipes-devtools/python/python3-distlib_0.3.9.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-distlib_0.3.8.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.3.9.bb
index 41a66479c..33e79d53e 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.3.9.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "1530ea13e350031b6312d8580ddb6b27a104275a31106523b8f123787f494f64"
+SRC_URI[sha256sum] = "a60f20dea646b8a33f3e7772f74dc0b2d0772d2837ee1342a00645c81edf9403"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


