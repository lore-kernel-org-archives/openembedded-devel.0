Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F29C31D97
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13623.1719816261747094529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m42Aqq/8;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816263; x=1751352263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fFD3eWJECUTTb+VwYo3p4TxbHN1aeKU5Ba9lm/ePJFI=;
  b=m42Aqq/8WtTMsg0bd/GhoCrCNZ1GM8rnKPGcgqg8BYPEFOQLHF7nV1+C
   gzeRg5zmaDImyXxsNqJDgGEdHtpf4Y80M/gyHyVBBq9J7+o9D/4p7lXY+
   6hyd/7/ZqBW64tq/WFtJqrwschwCz5TL9qcVQG3ofdDE9Vx+xyeEJyju3
   rReHHmewjJlvOqi/UJrj0Qt42VSGMBKD/QyQiChsVHcTwi3P6YZMoUfwN
   XLT7Vc6FGJsTmdZt1/ut4a7a+tihRPxvs6veXRZIDjfkwocOJoV0TnZB1
   BoVQCctMEF0W0Ya3/C0xwGCY570mXIRZv3FBh0P7//7jdqjxa8saNpG9p
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144534133"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144534133"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CAA53CA1F2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1402AD8B01
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA32620071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A6371A000C;
	Mon,  1 Jul 2024 14:44:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/25] python3-pdm: upgrade 2.15.4 -> 2.16.1
Date: Mon,  1 Jul 2024 14:43:56 +0800
Message-Id: <1719816242-11839-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--5.203700-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yUIIxwDaU5mrTfK5j0EZbytYC5LPd7BvbZmj
	18Axvjh06LmRq4bR/xfoE3TAn9uEtr1MabCtVw9LuLt50vtxBA5vQ1w4VLB58hlLPW+8b7Sa1sz
	jPj9v8/nu1n8nf0rCSwQRGrExv7Scr34zwKXxmIFi71i5on34KggqPpbA7sp1BoEbvAs8Vxl5Ct
	BZx4r6VLn0lL0R68EzyafsDxMauamwe+/4lI4Ac6ML2eLfzGFuCZa9cSpBObm15eNIExieacmx2
	INk/XeysCq9Qz19HtBGHu+DJMxDS6c3w8LXZ2a4upDIC9422DpUENBIMyKD0QfxTM57BPHD7v0M
	lFSLfmlNDQmQ8bbzv+affHI8kAmifnzmcpBzOrs7Cl8sx4HBG30tCKdnhB589yM15V5aWpj6C0e
	Ps7A07fk39LXMSri6W6oyrMPykfiR8NuhK70qWdiYVj0eCIecLwvSF7gt7No=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111186

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix new interface from pbs_installer regarding build_dir and best match
  auto-install strategy for pdm use (same as for pdm python install --list)
- Fix crash when pdm is used with importlib-metadata version 8.0.
- Add --no-extras to pdm export to strip extras from the requirements.
  Now the default behavior is to keep extras.
- Support PEP 723: running scripts with inline metadata in standalone
  environment with dependencies.
- pdm use and pdm python install now take requires-python into account
  (incl. from pyproject.toml) if python version not specified and pdm use
  provides auto installation by that.
- --no-isolation no longer installs build-requires nor dynamic build
  dependencies, to be consistent with pip.
- Add notifiers in CLI output when global project is being used.
- Use tool.pdm.resolution table when calculating the content hash of project
  file, previously only overrides table was used. This will change the hash
  already stored in the lockfile, so bump the lockfile version to 4.4.2.
- Add max retries on read timeout or bad connection.
- Don't update local files if they don't change.
- Don't list python versions that don't have any installation link for the
  current platform.
- Clarify the purposes of pdm outdated and --unconstrained option.
- Some clarifications on the interpreter selection and central package cache.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.15.4.bb => python3-pdm_2.16.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.15.4.bb => python3-pdm_2.16.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.15.4.bb b/meta-python/recipes-devtools/python/python3-pdm_2.16.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.15.4.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.16.1.bb
index 364c7c81e..91ec75938 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.15.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.16.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "58e225850567dcadce42418db4638996df2b1378cd0830cd48afda1b455d9c72"
+SRC_URI[sha256sum] = "b8680028b3aff3af8e15b483467da36bb9f02fcd402cf939da8ab6375d955131"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


