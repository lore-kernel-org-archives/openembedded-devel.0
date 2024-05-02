Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610F5C25B7D
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6639.1714628968804437873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=inoFTjDo;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628973; x=1746164973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UEg3KR7rdD0gfURHfT9ii7Dnw/BnFoOopaTK8RtkTek=;
  b=inoFTjDowMpgHBINDZws+05m9oZJ22BCNOka0EYKs0GlfS6BuVKu1KPp
   i1JSXBbXv4sKQ0L4R48gAZHPc4NzmS+DfZiEn1FflkVmDaUxseKN+MHRk
   NOQtU7oVO0hdg37nxYg7jFEsR+ljc6RNf7WE2arao4DSZRu3M0DhscZyA
   dldWPHZwmY/o5kOJlWR8/5Wufh+fzTGNATilmw/EiR7ZfAFuSlycN1udm
   21J+Ok5XYXuZPU9cK759uFOf5naC44vTBwKBeSXEZhcIL5B5YpkpCLEH+
   4k6/RA4s6umSGm6r3X+kKp0l0dMEOvvbZ0Vcbh57e6+MQ+zr/Dy/3Ao0f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136526440"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136526440"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10730C6911
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E2D415C47
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFC2A223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:28 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E6261A0002;
	Thu,  2 May 2024 13:49:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/30] python3-tox: upgrade 4.14.2 -> 4.15.0
Date: Thu,  2 May 2024 10:48:18 -0400
Message-Id: <20240502144829.241208-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--2.632900-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwYUgimQSEKPNko
	t/+2LaVUzmNdfCAdgnNCNEei2kg1tNz4cH5hW96YjoyKzEmtrEdpkBMYDn8FeC/zYor4jTnuGKT
	DyLhZb0zjXzhJIC7OIWTGACzFi38WEQt7acrBPADsQeQyqY+GpVQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaIMCLEGW7c2cDsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olKE0Je8DR/D4Es/H1wMyspt0H8LFZNFG76sBnwpOylLO/MEnyyEMlFbkn/X31CxVrl5Tm
	ppfA6z70ifQ83coC+wx4z5TY3uXRySg2EGJJm56Azz8EyTQn4Dk06G8PoCbKM/cJLu1mnTkhyad
	lGFXHKsTgfCdKUS4cicSkmYsAV+kLUU1zqiphVX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110223

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add support for multiple appending override options (-x, -override) on command line
- Add support for inverting exit code success criteria using bang
- Fix issue that the leading character c was dropped from packages in constraints files
- Allow appending to deps with --override testenv.deps+=foo
- Fix non-existing branch rewrite in the documentation to main.
- Update test typing for build 1.2.0, which has an explicit Distribution type
- Fix broken input parsing for --discover flag.
- Rephrase --discover flag's description to avoid confusion between paths and executables.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.14.2.bb => python3-tox_4.15.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.14.2.bb => python3-tox_4.15.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.14.2.bb b/meta-python/recipes-devtools/python/python3-tox_4.15.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.14.2.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.15.0.bb
index f451de321..4296738ec 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.15.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "0defb44f6dafd911b61788325741cc6b2e12ea71f987ac025ad4d649f1f1a104"
+SRC_URI[sha256sum] = "7a0beeef166fbe566f54f795b4906c31b428eddafc0102ac00d20998dd1933f6"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


