Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C37E77191
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.30370.1735032452324353923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qn4lpE9k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032452; x=1766568452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fv8blKaQjO4ikAuQlHoWnvfabzlzhhxW87vy2c23s14=;
  b=Qn4lpE9kKuh3CE+0+CjAUA4X5zgB8a6ogbZH6UGoLFOswTVSc1jZzMuo
   3VYwUhoVrqkg/WGBtiv/vsSJDRcaqnMt5RkX+amggcEPDraYWMwidzLuP
   MGuM2RZGIz8U7/5CAfOiq7pztHfn6L5b6xHQdSAw/TZnX941nV21de/51
   kfhXe4IxN7PVi3G8hS/+IJMks33vvHwi3mlsxwMi9YKglQNoqmK9bgq1M
   2taK7nJKz3YuwfWaQByRReEBoCRVKFqpdgArCe8c4ERs3P2gx+dXl8+PL
   Wcs4cKStXJmQ4l0m6xBU0An6bLChUjDEX2JCx4nUVC+fNMoFTjWCHu1RB
   w==;
X-CSE-ConnectionGUID: zP34lwntSbqT0DFlF/m4YQ==
X-CSE-MsgGUID: t3zUFARWQGG9yZg8Ih381Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="183972689"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="183972689"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 082E796742
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D06F2D3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C5926B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1659F1A006C;
	Tue, 24 Dec 2024 17:27:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 58/67] python3-starlette: upgrade 0.39.2 -> 0.42.0
Date: Tue, 24 Dec 2024 17:26:52 +0800
Message-Id: <1735032421-13513-58-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--8.312500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwZbsAUeZcRzxZa
	DvoiUT/M2b0aOwxHPEZhRj0jlHx5KDWs2YGWPbxrOIQ9GP2P2u8nhzAhgvoq53v3ioAd9KrSXtW
	wHrfnL1Pto0qUT0KgSpPbLdxJyuSx7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3i64sVlliWKx8fE8yM4pjsDwtuKBGekqUpI/NGWt0UYPCg7KbbLW0vUd63k
	UaqpLjK1o5IawZ0FGOdTC/yp7bpqOz1WcjGXmBn
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114531

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add max_part_size to MultiPartParser to limit the size of parts in multipart/form-data requests
- Allow to raise HTTPException before websocket.accept()
- Bump minimum python-multipart version to 0.0.13
- Change python-multipart import to python_multipart
- Revert bump on python-multipart on starlette[full] extras
- Raise ClientDisconnect on StreamingResponse
- Use ETag from headers when parsing If-Range in FileResponse
- Follow directory symlinks in StaticFiles when follow_symlinks=True
- Bump minimum python-multipart version to 0.0.18
- Bump minimum httpx version to 0.27.0
- Exclude the query parameters from the scope[raw_path] on the TestClient
- Replace dict by Mapping on HTTPException.headers
- Correct middleware argument passing and improve factory pattern

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.39.2.bb => python3-starlette_0.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.39.2.bb => python3-starlette_0.42.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.39.2.bb b/meta-python/recipes-devtools/python/python3-starlette_0.42.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.39.2.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.42.0.bb
index 87080e9fe9..ed539ed9df 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.39.2.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.42.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "caaa3b87ef8518ef913dac4f073dea44e85f73343ad2bdc17941931835b2a26a"
+SRC_URI[sha256sum] = "91f1fbd612f3e3d821a8a5f46bf381afe2a9722a7b8bbde1c07fb83384c2882a"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


