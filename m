Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E176C25B75
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6682.1714628967326746876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M68g4fXt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628967; x=1746164967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bB+uO8dqBmoodOVAlEsv5IVY79lN+8qiqa4PTD3qxAg=;
  b=M68g4fXtIh5ET086xEzb3/RUg1SkD/SIg1PxbyV527ImZSR8loEFONY0
   t19TTAdQNilggtLhlyrNdg1webs2LinmMx41Ik6CeAQzVsz2/fEueSWtL
   YMFS5Vp80sxBlE/vpj7xykT6YoVk7x9vp8qM5+/oJ4fwKCKfHOoGL89ne
   zYXJQrvqEVvhDC3w8tB/ksT4brFPcYEiKEKgvv5kCXgTat7djtPGIyYWK
   r5H6BWK+4E/7zjEedKRq3nqWahVyOIM82YJ72TLCIhRPz+Qy9NqSxml0I
   gJo/prd5gg/YhK8vX/7B6AXjTUkfAVaIsb6DBIks8acU9KVIAmLX0Ag4I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157281955"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157281955"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:25 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DD34A14C0F
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B251D6235
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A62E12008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:21 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 54D0E1A0002;
	Thu,  2 May 2024 13:49:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/30] libmxml: upgrade 3.3.1 -> 4.0.3
Date: Thu,  2 May 2024 10:48:04 -0400
Message-Id: <20240502144829.241208-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-3.514900-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrSxj0b9FncULRjBmBWsa9RLpY
	cE2YBNVCn+mousPnaDtkAJ626kUksPFRbCRQuTS5n6y0mNkW0aTxuhkRWK22GPQJJFxg7p4qoXf
	mZuk69TwTxXC00El2lmtb+2CMLj4BJ90IW74n84jN+qWlu2ZxaCthirXYhZk5PcFkClcmQNuaY/
	lzalOjex677uIVoGzrQmxnAL+vJQPe1nRHRbCEypdn0VaVcqOkVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOKwi7MItzaY0NVHotTvuv68EguqiGeZ5Jo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtHrqUSs3zlmyu3YEjOnBmePN5iw2tdslJeCKOzcnCE0ZU5En
	H+0aZ7PLzyYe//Zm6uucsbbNQZEqwl+3lirlKUYJEAFKrsP/xFcG3+ZRETICP9kUX1Z+buE3Lum
	kbQiNwVCqTSPu8tVR7AxIEOt4h2Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110214

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Now default the DSOFLAGS value to LDFLAGS in the configure script
-Now install the man page as "mxml4" to allow parallel installation of Mini-XML 4.x and 3.x
-Added MXML_ALLOC_SIZE define to control the allocation increment for attributes and indices
-Fixed mxmlSetDeclarationf implementation
-Fixed an issue with GNU make and parallel builds
-Fixed missing "docdir" definition in makefile
-Fixed missing CPPFLAGS, OPTIM, and WARNINGS in CFLAGS in makefile.
-Fixed configure script issues.
-Now require C99 support
-Now install as "libmxml4" to support installing both Mini-XML 3.x and 4.x at the same time (use --disable-libmxml4-prefix configure option to disable)
-Added mxmlLoadIO and mxmlSaveIO functions to load and save XML via callbacks
-Added new MXML_TYPE_CDATA, MXML_TYPE_COMMENT, MXML_TYPE_DECLARATION, and MXML_TYPE_DIRECTIVE node types
-Added mxmlLoadFilename and mxmlSaveFilename functions
-Added AFL fuzzing support
-Added mxmlOptions APIs to replace the long list of callbacks and options for each of the load and save functions
-Added string copy/free callbacks to support alternate memory management of strings.
-Renamed mxml_type_t enumerations to MXML_TYPE_xxx
-Updated APIs to use bool type instead of an int representing a boolean value.
-Updated the SAX callback to return a bool value to control processing
-Updated the load and save callbacks to include a context pointer
-Fixed some warnings
-Fixed real number support in non-English locales
-Updated the autoconf config.guess and config.sub scripts to support cross compilation for newer platforms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmxml/{libmxml_3.3.1.bb => libmxml_4.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_3.3.1.bb => libmxml_4.0.3.bb} (95%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.3.bb
similarity index 95%
rename from meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
rename to meta-oe/recipes-support/libmxml/libmxml_4.0.3.bb
index 38e270c03..54582e704 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
-SRCREV = "fd47c7d115191c8a6bce2c781ffee41e179530f2"
+SRCREV = "804c4f4d922e4ca240ce2cad3ec7bc5d00c08691"
 S = "${WORKDIR}/git"
 
 # Package does not support out of tree builds.
-- 
2.34.1


