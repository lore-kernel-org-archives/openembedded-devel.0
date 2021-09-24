Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.5399.1632471688352803794
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lTH62myc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471686; i=@fujitsu.com;
	bh=jc1I1Xlk9UfXhVxAHra0CLFzNoV57nVldxJPB8BqLp8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lTH62mycQc1c6slLcqHiFV/upnOEq01/92pQ4dzJrgNZdoVWRNrqO+45riWbMx3x5
	 XIgl6Ux/GXwbbJesLH0a/zZPfZ54yNxxJew+Jn36D90BqJoF9fghDQvHU8pCoPxB8p
	 v5rosMktkPrlfL+gPNQR8vNOHXUpftoH0q36cikJOFlLgNGWDEoCyrhjqaqI9P73ui
	 WNnHWLuz6eL60Uy7wYFdmZZcp3WUFhkYJ+c9OpwW2uQlQo8PpbwUeC2AwWUoyT8lVX
	 7MeeqAlgkbZ9Km/IiLv3twjQ0QRMM+gNmOnbA2F99sjwkDHDd3sFC8vzrfgAsYR6Ps
	 PHtCJtXjl77ow==
Received: from [100.112.195.47] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 5B/77-01625-68A8D416; Fri, 24 Sep 2021 08:21:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1W3r8k0
  02HRJzOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTh34CVLwXWOikXbDrI2MLZwdDFycQgJzGaS
  uLm9iRnCOcEosejLXdYuRk4ONgEdiY4X3SwgtoiAvsTS2XuYQWxhAW+JtSsmM3UxcnCwCKhKL
  GmuBAnzCrhJTJlxjA3ElhBQkJjy8D0zRFxQ4uTMJ2BjmAUkJA6+eMEMUaMosX3nGRYIu0Li9e
  FLzBMYeWYhaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sTIDbSS6zSTdRLLdUtTy0
  u0TXUSywv1iuuzE3OSdHLSy3ZxAgMo5SCQwd2MC5780HvEKMkB5OSKK9+p2+iEF9SfkplRmJx
  RnxRaU5q8SFGGQ4OJQneF01AOcGi1PTUirTMHGBIw6QlOHiURHiTQVp5iwsSc4sz0yFSpxgVp
  cR5v7UCJQRAEhmleXBtsDi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzfIeJ7MvBK46a
  +AFjMBLX4+1wdkcUkiQkqqgSmeMcdMYYu/dZBUr3+NsOQSLXfBLoNYVceG3OO7EsR0fU+G9eY
  rHRM9VnTA19Yi59jOE6H/j7eK7Vuw8e4XfzHzC6fSEsTattfH/78lFZXA+/3JbeNJzBnxEwx/
  nZzGnbBXMu+o3x2f3YunNc3q6zG1WR8xienafUmPkFilxy+jSyoOLxXPS5AvVNhV/JEx1y1f0
  FhE64bSS+XUpssxCUfeK5X/Ovbzb+/mqZ6pmu1MCv+nBVUUdMpPcfhgEBnz3FPS/qaCQt4jPx
  8n9et5rIzLrq/NtfTMaBZaqC8jnsf77VX59ZboK6HVt7ivRhfUsHwKLPq6c0JVxY9rEsW1sm7
  vXpyfVi1s1eHUnKLEUpyRaKjFXFScCACJx2yVHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1632471686!81865!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7347 invoked from network); 24 Sep 2021 08:21:26 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:21:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8LP0h016452
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:21:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:21:24 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 22.2.1 -> 22.3.0
Date: Sat, 25 Sep 2021 04:21:18 +0800
Message-ID: <1632514878-4581-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pyzmq_22.2.1.bb => python3-pyzmq_22.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_22.2.1.bb => python3-pyzmq_22.3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.2.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_22.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index f58074a9a9..3c91eee16f 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "6d18c76676771fd891ca8e0e68da0bbfb88e30129835c0ade748016adb3b6242"
+SRC_URI[sha256sum] = "8eddc033e716f8c91c6a2112f0a8ebc5e00532b4a6ae1eb0ccc48e027f9c671c"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.25.1

