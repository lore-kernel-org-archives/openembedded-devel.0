Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C35AC27C6E
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.9832.1717664823201327645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gbd4XAun;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664823; x=1749200823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8LgDuLEIRucqxjbFeB3u1/Pcu7KkfRMp/q1g7t2ZlOs=;
  b=gbd4XAun7mCIUDYwbFXQZn+dH86CEwy66pQ7o4Ls6cK+axJGTH0cVIES
   LwsD6WCMiU76pM11DDDcMQ9QNA06Z76AuXNsjUZF/Ie5XrVy1K3kHINht
   37dOXJM3whskAHlIRgKxD0omndYRbzPc94cHqeqMjFYqkDGM3qP2+mMz3
   Y1z5VeuzafuM3ow4BP39GTZ0DqFF0vOYkoITc3Pouml8+QbVXTvmHJOQs
   oz6THCp2O3so3rgGwfXHlQXdaybITYulfthMvDBBK2P35t4O93aeygqB2
   Z02Ec4EVPrL60GgyY3gyXeZFsUmg8vYswgxdBCla3I4Lzy3e08Wm2kT4M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="164091933"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="164091933"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49328C68E6
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 932BCD50B5
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AEE5401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CC9931A000A;
	Thu,  6 Jun 2024 17:06:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 19/36] libiec61850: upgrade 1.5.1 -> 1.5.3
Date: Thu,  6 Jun 2024 17:06:18 +0800
Message-Id: <1717664795-13902-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.799700-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yUIIxwDaU5mrMaP9SSz/VBl/8zHJ6KkGg7qQ
	ldU8NEzp0Ki/SHE9q1qFVozH+8rFVGlef7RSxqqeuce7gFxhKa2fmd9HsjZ0U9P7VmP7Drr6+ci
	2X4BohDASnsBpULHZyx8Cr9lHU/NXOFN3EnLOvAYdZEkR8Y/meZqzeC0+8vPge/eKgB30qtIaT/
	e9Mxzf2LTpoYU8LId4ArXuL4Mzi/pHlxHk12qw0pjnsVPBNMvRLfNU/r2ov2enUdXHSmfttuRgE
	MvCxuZnJEd6YBWwTIBMNbrUuyXyo+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+E
	Y120A3oWm/gAtjCd7Oo1mJ1W6Noc4nM8SgEQxQpoMLOoNHsM9pHUt5D5WmclmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1kFmoecv+RE2ADB7nLoa06s6e1JeS2o5jBoBIZahJEIeo9PbllzkC0kGYb3
	4e10d52r1oWyYI0zij21UgsM3VJERv0UOFsf6TY4KPNbWjr8RTyZ1y9sjWHZLqPOO5dObQxMzMg
	JrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110728

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- config file parser dynamically allocates linebuffer to allow multithreaded applications
- parse time values in model configuration file
- config file generator: added missing code for GSEControl
- Config file generator: support multiple access points for GOOSE and SMV control blocks
- config file generator: added code to add SMVCBs to config files
- IED server: added code to create SMVCBs with the dynamic model API
- MMS server: added support for write access with component alternate access
- MMS client: added function MmsConnection_writeVariableComponent to write to variables with alternate component access
- make write access to RCB elements configurable according to ReportSettings
- Added function IedConnection_setLocalAddress to define local IP address and optionally local port of a client connection
- IED server: added ControlAction_getSynchroCheck and ControlAction_getInterlockCheck functions
- fixed - IEC 61580 server: dataset is not released when RCB.Datset is set to empty string by client
- PAL: fixed wrong order of function arguments for fread and fwrite functions
- MMS client: parsing of servicecsSupported in MMS init response is off by one
- fixed - potential memory leaks in goose publisher code
- fixed - server sends dchg report when only dupd is enabled in RCB
- GOOSE subscriber: fixed - possible heap corruption in parseAllData due to missing validity check in bit-string handling
- IED server: fixed problem with implicit ResvTms setting when reserved with RptEna
- IED server: fixed - segmentation fault when compiled with CONFIG_MMS_THREADLESS_STACK
- fixed - MMS server: messages can be corrupted when TCP buffer is full
- fixed - .NET: IedConenction.WriteDataSetValues throws a NullReferenceException
- fixed - server send invalid response- when client uses wrong ctlModel
- fixed - IedConnection_setRCBValuesAsync crashes when RCB is already reserved by other client
- fixed - outstanding call not released in IedConnection_getDataSetDirectoryAsync

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libiec61850/{libiec61850_1.5.1.bb => libiec61850_1.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.1.bb => libiec61850_1.5.3.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 63476d349..0e1f50164 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -13,7 +13,7 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "210cf30897631fe2006ac50483caf8fd616622a2"
+SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
-- 
2.34.1


