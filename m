Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.82421.1629452266754373536
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 02:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wgf0AT55;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629452264; i=@fujitsu.com;
	bh=KCPnOEWgF79uHLsx7VZm9hn1dxeLiYtOnm6eZP0bUOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wgf0AT55bcU1a1LbOGDGprtWSEZctNvVQnho4HaOMgYi7MXpxok15fPiABpGauo/i
	 hv7Vtl2VAwURnuTCk4Knw9M3fIKnx0Gy6zGhBoHTiUOrauKSJBOyGdMrX49ZMxg0cp
	 6PFnR8zElnm2gQFb3XF2PuJNaZ48fkkyYAcB/OewhQZECFBhez9AC5pvdIvMbMv66Y
	 /lARjg2dpi9JOM1K+EquLjSPklThqZhSU8Mc+oNlUqSzhB8lEcuR42xeLHRmrT5hwh
	 E1qC6j/euFeumv8/zta1IkBS23jIHnfJMfZWqWz1cLTJo1SmjOL6I+IrfV7J9JzuM6
	 n+8q7W4v9BipA==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id A3/CC-09754-8E77F116; Fri, 20 Aug 2021 09:37:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqvuiXD7
  RoL+Ry+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzViwdC1jwRbuiq/b9zA3MK7m6mLk4hASmM0k
  8aKhl62LkRPIOcEo8Xe5CIjNJqAj0fGimwXEFhHQl1g6ew8ziC0sECTxrX8lK4jNIqAqcenpZ
  7BeXgF3iYk9M8FqJAQUJKY8fM8MEReUODnzCdgcZgEJiYMvXkDVKEps33mGBcKukHh9+BLzBE
  aeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNdI18jQTC+xSjdRL7VUNzk1r6QoESi
  rl1herFdcmZuck6KXl1qyiREYSCmFTDd2MH57/UHvEKMkB5OSKK+qmXyiEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQneS2VAOcGi1PTUirTMHGBQw6QlOHiURHiLi4DSvMUFibnFmekQqVOMilLiv
  EdB+gRAEhmleXBtsEi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdxbIFJ7MvBK46a+AFj
  MBLRZSlQVZXJKIkJJqYDrPv+VdurXImdomu9+sRksPTt4nm7F3fUrUyRvW97fcDJy2utfkI7/
  jsaI3wXu61q+q0cyXLPc/sDJnssDlNwu4vDy+Sbozaqcvu3LHaJt3hfG6g/8fzZn+6k771tC9
  3uGcNWt6H1mIuz3/uDCcb5mrx3benUebE/q+MJa/5fo/9/KbiuwZizJO3DV9Lbc3u016J59Az
  Z/SjP+1RdpZW0Umyy+JWdjuuc3Y4R7TZa+sg/pdC3IvnVf537H7abHIjy9XGoKror00pb6Kqi
  sfvi8j/erR87TS35W/P6ju+Km/eO9vAZOXrk8TnitdFXA+I2gs0/FEIfax+sPf7e19z54mmvT
  Jvj8yd14C27a8AlMlluKMREMt5qLiRAC2oJlCHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-232.messagelabs.com!1629452263!32083!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29477 invoked from network); 20 Aug 2021 09:37:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 09:37:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K9bhPu025157
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 10:37:43 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 10:37:42 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.1.0 -> 5.1.1
Date: Fri, 20 Aug 2021 17:37:36 +0800
Message-ID: <1629452256-16432-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 5.1.1 - 2021-08-02

Only use SSL socket if at least one SSL kwarg is not None #1639 (commit) (thanks JT Raber!)
Remove unused SSL arguments from eventlet server options #1639 (commit)
Remove executable permissions from files that lack shebang lines #1621 (commit) (thanks Ben Beasley!)
Improved project structure (commit)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-flask-socketio_5.1.0.bb => python3-flask-socketio_5.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.1.0.bb => python3-flask-socketio_5.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.0.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
index deca5f5d8e..3d7a1cb6a8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "b41b9f6fb0d7f3fcadd54c44653307a9b96e985c7da73f92779480248b5b6874"
+SRC_URI[sha256sum] = "1efdaacc7a26e94f2b197a80079b1058f6aa644a6094c0a322349e2b9c41f6b1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1

