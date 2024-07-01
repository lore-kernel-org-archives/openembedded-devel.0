Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9DFC3065F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.13621.1719816259115150338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KxFZxcz4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816264; x=1751352264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qC4v4tLh41jBdimQRQMHy4oY3IvYXFhxxHbe4IJovro=;
  b=KxFZxcz4/KhJQ++y7sWDLyiXKzfWbXjZI6rjmCLUnWeLuPL8kn9rDBPW
   LJ56d9DVbFMIGTiQ0c/wcXZfUdQXfOg7OWEeJ2PSm3bE2UwzLsmBgrZiz
   LeJ4PZ5NB2I6tcwXP33WsBi/T6xj4l/gMce7EU/tsai+spLk0nSkICB5k
   9DFIM8BGTjRfUl7Be5HtiikmbWNnfKPQZKQg+Gkh5xvWbbByhgkae0/EA
   jgT69DSTbfRyBWta1OnxIZtxUI4TiRagKPYWcVv1EhDsag/eje4eCdrUF
   oXH0tOS4JgAbJE4k3x5QtOb28Ax4yM7plGP1ULJ5p/V28ue+iZzRx015u
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="167338987"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="167338987"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3726AD8011
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75B3CD748C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 161416B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA8D21A000A;
	Mon,  1 Jul 2024 14:44:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/25] python3-pymodbus: upgrade 3.6.8 -> 3.6.9
Date: Mon,  1 Jul 2024 14:43:57 +0800
Message-Id: <1719816242-11839-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--14.797300-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrMVx/3ZYby78yiHqxwIX2Mbe/
	RFw+ZyQESbSW5fy7dv07blYJVFl876+CQswOit7PuIDp7iOpqTOBs03RHrzjMzoUdFbHYUaw/ZV
	8xTPdRK2LVDMXzEGmRTH5fe642zAMgL/9h3sNaH/2TmdnNlUFIDqu3dM+YhFR0Z6fEMfqaeuC87
	HOMUCLAV55BHxiHZc3VHY4TuAmxSNDQYe+1GQPNbNE9DxPih7lmrN4LT7y8+AH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOOwpfLMeBwRt9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO3Ix3Icp6zuW7V8axpzZwDbPBLDOHVm86u+IyDX/YzRHGJMRB3RdVqn
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111187

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Remove python 3.8 from CI
- Log comm retries.
- Solve serial unrequested frame.
- test convert registers with 1234....
- Fix writing to serial (rs485) on windows os.
- Remember to remove serial writer.
- Update client.rst
- Fix usage file names
- Show error if example is run without support files.
- Solve pylint error.
- Describe zero_mode in ModbusSlaveContext.init
- Datastore will not return ExceptionResponse.
- call async datastore from modbus server
- Transaction id overrun.
- Add minimal devcontainer.
- Sphinx: do not turn warnings into errors.
- Fix usage of AsyncModbusTcpClient in client docs page
- Bump actions CI.
- Request/Response: change execute to be async method
- datastore: add async_setValues/getValues methods
- fixed kwargs not being expanded for actions on bit registers, adjusted tests to catch this issue
- Clean datastore setValues.
- modbus_server: call execute in a way that those can be either coroutines or normal methods
- Streamline message class.
- Fix decode for wrong mdap len.
- SOCKET/TLS framer using message decode().
- ASCII framer using message decode()
- Add generate_ssl() to TLS client as helper.
- add _legacy_decoder to message rtu

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.6.8.bb => python3-pymodbus_3.6.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.6.8.bb => python3-pymodbus_3.6.9.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.8.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.9.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.6.8.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.9.bb
index b94504f14..e33dbc02c 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "abb214716b56fc62bc0d5d9d964e2249439341746287e918d175f0e3ee241407"
+SRC_URI[sha256sum] = "f4223b72c20cd00a2cf25f6ddb31ecb2c0587309111a55283b2f4a1ac115e4cc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


