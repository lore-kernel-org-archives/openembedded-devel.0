Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E1FCD6E67
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21221.1780394912976876901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gk9QGbUM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394917; x=1811930917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W8GySQblbHDtcuwO4R293/SgyvdO58TvPE6QahjLtQk=;
  b=Gk9QGbUMhk+lfogJv3fTScb87zhAPOo0rrQYQHQDHKV5kmlb23fi/+OH
   OzwmaT9HyPgHdNkQa2i/cji3Ug+t806UsjWgrtG85xIeGacwXiSZ/RKOO
   H+0j6NTcj30jKIDeVITEvVtyFLYoS8J+/fcYicHLegK4zjyiqmTuD2IDW
   EmzZl+bgk2palG6KSEfjBb4ExhLSRQkcO+o9Znh6T3yZ+FAPBprlnPYcA
   VHeHL0rcBqGJhkJs+B+vS6miJp4kng8RtPvlx91YiISHMvKMnGVIBJfdW
   OAeAJ1v+v5+yG4E7N2AMh9cib9vp1OkozbX+PdNHleK4uJu6DyW6vzZEy
   A==;
X-CSE-ConnectionGUID: n6Qzy4HaSBmF8KfNnosglQ==
X-CSE-MsgGUID: JDrWLFIbTRmRzU0fT+ioBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743067"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743067"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:37 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 45CD81C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:36 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E5773180CCDB
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0C708180051C;
	Tue,  2 Jun 2026 10:08:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/38] python3-ipython: upgrade 9.13.0 -> 9.14.0
Date: Tue,  2 Jun 2026 18:07:35 +0800
Message-ID: <20260602100755.2117-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127341

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.13.0.bb => python3-ipython_9.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.13.0.bb => python3-ipython_9.14.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.13.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.14.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.13.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.14.0.bb
index c563b110e1..bca4d9febe 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "7e834b6afc99f020e3f05966ced34792f40267d64cb1ea9043886dab0dde5967"
+SRC_URI[sha256sum] = "6f27ff0f1d9ea050e0551f71568bc4b34d8aba579e8f111c5b4175f44ac6b4aa"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


