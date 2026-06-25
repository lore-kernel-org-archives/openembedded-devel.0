Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6AECDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7004.1782378113498773788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QJYAKisQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378125; x=1813914125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YyFQiW8905Qje2nYxpnFUlUBTT4PbT11DqbJcFEO6PQ=;
  b=QJYAKisQClpYRFMA8FtbA1tTU4tz8+ba16+VF5/+ccFPzet+j2DwjMqF
   YEcQDOekOLUl0IM0zEPk5NPACl3Wth4ZRGUvzC/SIJ/sYZj79ReRlpX/d
   c85T0M8fP0X4DJwNcsKsN1hba5IrOxWLQvDucp75ic/iJwNDwC3i2FoUd
   g6GdCe8Td+Aatfq3SnhizQtM913m/WjI910kRFhMjT+MF+Kijj/ujumW0
   XWWIOin8SwMs93H0Pzi0ZhiE1dapiYl8DwTMKsuSk6hd3gXgkveNb2JIy
   pfrlVl0/4FkHWP7rs503p++29yUV5R+U1UjV4LMQ4btsLejmD/UGH7jbQ
   Q==;
X-CSE-ConnectionGUID: ec5vK43oQxCFpSjto7HsvQ==
X-CSE-MsgGUID: qM9UxNvcRJS5rWSncudAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="243444594"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="243444594"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:04 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 115EC820C2D
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BD4E11401233
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BB8EE1017329;
	Thu, 25 Jun 2026 09:02:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/47] python3-engineio: upgrade 4.13.2 -> 4.13.3
Date: Thu, 25 Jun 2026 17:01:00 +0800
Message-ID: <20260625090127.1563-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127752

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Make sure client disconnects when write loop exits
- Address flaky unit test
- Stop using codecov service, since it has been failing for a long time

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.13.2.bb => python3-engineio_4.13.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.13.2.bb => python3-engineio_4.13.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.13.2.bb b/meta-python/recipes-devtools/python/python3-engineio_4.13.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.13.2.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.13.3.bb
index 06518229a8..262715a6bc 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.13.3.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "a7732e99cfb7db6ed1aee31f18d7f73bbae086a92f31dee019bc646155d9684e"
+SRC_URI[sha256sum] = "572b7783e341fed21edbc7cea297ccd378dad79265fdde96aa4664420a7c06c9"
-- 
2.43.0


