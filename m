Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1265EEB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:37 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4902.1688699670287778377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="111930540"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="111930540"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 72FF8C53D1
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:13 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 942F76CFB81
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A3799881D9;
	Fri,  7 Jul 2023 12:14:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-joblib: upgrade 1.2.0 -> 1.3.1
Date: Fri,  7 Jul 2023 11:13:42 +0800
Message-Id: <1688699627-2519-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--3.780600-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuAI7Mvq/sL59Bi
	hTOKX++2J2o10m2bLBIefeycEmxucKu/6lvVfpZrPKN38CLPK0HhEXiLZlbM8cI+ladxdCSDB82
	GyGpZHXvK8TJfpa0/ymgWB9k/Yp3Hidm++5gqe3E5/8HHX4y4wthQO8CvZj/XLKw4tMK/aDAC1S
	/6sf6YeOpBtVlfOe9X5tPA3/kabXo372ax+5lazTOgNHhlU7YMstmlQezwoxUktNN9I8qXDxXPQ
	cjpPoxTUsU2l8Z42eI6m0b+cRtPa5dW3P+FD/5O9QPBN24tSRwcsx3IH4sq3LwYtb0g7YwtHGp2
	3bat06DM0y3a6QxVo1B/D9lmIvK17VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGDr
	WRIrgOIGQRIwjTl3iKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm8
	QYBtMOdtjnCXbH1XCLTKYgrrObonAxKivUQtfYF2M+lqGA/G88wgttFRNi2puF65jKbNUFaT+q2
	2v8HjNjEqo5eywDJh4QQ9+RNtPfgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103707

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix compatibility with python 3.7 by vendor loky 3.4.1 which is compatible
  with this version. #1472
-Ensure native byte order for memmap arrays in joblib.load. #1353
-Add ability to change default Parallel backend in tests by setting the
 JOBLIB_TESTS_DEFAULT_PARALLEL_BACKEND environment variable. #1356
-Fix temporary folder creation in joblib.Parallel on Linux subsystems on
 Windows which do have /dev/shm but don't have the os.statvfs function #1353
-Drop runtime dependency on distutils. distutils is going away in Python 3.12
 and is deprecated from Python 3.10 onwards.
-A warning is raised when a pickling error occurs during caching operations.
-Avoid (module, name) collisions when caching nested functions.
-Add cache_validation_callback in :meth:'joblib.Memory.cache', to allow custom
 cache invalidation based on the metadata of the function call. #1149
-Add a return_as parameter for Parallel, that enables consuming results
 asynchronously. #1393, #1458
-Improve the behavior of joblib for n_jobs=1, with simplified tracebacks and
 more efficient running time. #1393
-Add the parallel_config context manager to allow for more fine-grained control
 over the backend configuration.
-Add items_limit and age_limit in :meth:'joblib.Memory.reduce_size' to make it
 easy to limit the number of items and remove items that have not been accessed
 for a long time in the cache. #1200
-Deprecate bytes_limit in Memory as this is not automatically enforced, the
 limit can be directly passed to :meth:'joblib.Memory.reduce_size' which needs
 to be called to actually enforce the limit. #1447
-Vendor loky 3.4.0 which includes various fixes. #1422
-Various updates to the documentation and to benchmarking tools.
-Move project metadata to pyproject.toml. #1382, #1433
-Add more tests to improve python nogil support. #1394, #1395

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.2.0.bb => python3-joblib_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.2.0.bb => python3-joblib_1.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-joblib_1.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.3.1.bb
index ec02265d1e..9186cbb19f 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.3.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "e1cee4a79e4af22881164f218d4311f60074197fb707e082e803b61f6d137018"
+SRC_URI[sha256sum] = "1f937906df65329ba98013dc9692fe22a4c5e4a648112de500508b18a21b41e3"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.34.1


