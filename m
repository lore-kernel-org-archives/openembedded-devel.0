Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.4437.1626255287578403320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=byiHF+bA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255285; i=@fujitsu.com;
	bh=dVK9yyhgIlgdG2srI8sNPd+kHzrpUTqSnDrfeSaMmCI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=byiHF+bAa08ysCenXa1PB0EsN54OOXAZKXYbEAccQtQ7y1JWmJPEsxz1Rl+/B5q1C
	 dw51xNckI8QPuXr7VYRzC4oMene5i4hU2/CgAGGGzUS3y+DGksHJkyYC/wuxyQNcw3
	 3BdIrCycI8HVT77hkPtm/E9iFEqZHPXRKZPttnplE+1SwjjTJyq1kEEQcisp+uo3PZ
	 0TFsTpUNPoZWnS8gnrdQO8jRsrN+ywJkL84MaF4bCsc2kD8DyA9Tjp2PLWRhBPDW0v
	 ix0k6AvV4OdWETBkWkEWk3ie/8CiHoL3qG4qRKIGe3CiOwMhvqhboQeKIHNHkaoYbL
	 E/pzi4Svo4ZjQ==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 3D/8E-07839-5BFAEE06; Wed, 14 Jul 2021 09:34:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1d2y/l2
  CwY8jchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXp+nMBVe4K/7NvcDawHiaq4uRk0NIYBuT
  xLzTzBD2SUaJrgmMIDabgI5Ex4tuFhBbREBfYunsPWA1wgJBEvNaf7GC2CwCqhK3Pi1hArF5B
  dwkJjdfYwexJQQUJKY8fM8MEReUODnzCdgcZgEJiYMvXjBD1ChKbN95hgXCrpTYM6ufaQIjzy
  wkLbOQtCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmsa2ypl1ilm6iXWqpbnlpcomuol1h
  erFdcmZuck6KXl1qyiREYQikFB9V3MH58/UHvEKMkB5OSKO8Nn7cJQnxJ+SmVGYnFGfFFpTmp
  xYcYZTg4lCR4Gde+SxASLEpNT61Iy8wBhjNMWoKDR0mE1x0kzVtckJhbnJkOkTrFqCglzuu9D
  ighAJLIKM2Da4PF0CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxnQcbzZOaVwE1/BbSYCW
  ix9pq3IItLEhFSUg1MvYbdTlGHrA5NvV8VZ9Dm/qYkMPPVv5Ovl2yQ/rX1Ff/an2+XM/c2fzE
  MTGTYIaWpaSjdzPaqUW9B76HJ3O9XFb0LP6L4RMXB+h5bqu4UtZos71OG14/+eOBtOvNK5zzl
  yfePZd8wn3YkeCfby5NROxn3PjEt5C6+rR6/NfPas9tO3IJsbEGHjzzZZf3sl9g80/1f29SPt
  Nqu/Fs7KW9id9PZvqXqCu0PlFeE6989979RSV2u2G/zh9dv/6jVSS4xUO4JyLnKotRyxm/eg1
  cJs37lLV932OVY1Zb3ay07OAOPXzQWeZ391ur+5j9//hzxW7Fjwg79r1fWbH1m+vDxbDXzKqY
  LUQJFem4TJ8/7LafEUpyRaKjFXFScCAAspMiXHAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-267.messagelabs.com!1626255284!98729!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32420 invoked from network); 14 Jul 2021 09:34:44 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:34:44 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9Yhu4030064
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:34:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:34:41 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.0.3 -> 5.1.0
Date: Thu, 15 Jul 2021 05:34:35 +0800
Message-ID: <1626298475-4659-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Add reloader_options argument to socketio.run#1556 (commit)
Pass auth data from client in connect event handler #1555 (commit)
Do not show simple-websocket install prompt if it is already installed (commit)
Fix namespace bug in example #1543 (commit)
Added index to documentation #724 (commit)
Fixed typo in documentation #1551 (commit) (thanks Mayank Anuragi!)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-flask-socketio_5.0.3.bb => python3-flask-socketio_5.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.0.3.bb => python3-flask-socketio_5.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.3.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.1.0.bb
index 5def7621e0..5a6b83bfec 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.0.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "4fb968c43bc384f184cd1a25c1842297c2e3d6efc2f755a61be6d4406858220f"
+SRC_URI[sha256sum] = "b41b9f6fb0d7f3fcadd54c44653307a9b96e985c7da73f92779480248b5b6874"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1

