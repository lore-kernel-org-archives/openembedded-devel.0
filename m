Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.3098.1619678228643992218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KB7Qrt4L;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678227; i=@fujitsu.com;
	bh=ydmyLNkGqkeD2O1Cw93Hic4gW4FP12se3wEQ2PYYYts=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KB7Qrt4LA1/M9QNI8Nr9wapzR/BLkBSS3USOXlnycVXIEpdyi8Aw9qsGmtnb0XCjb
	 X3hZw2u8Gtqz1cJbisTe7Kc5HiIq5YG14GPAzGncqNrCjukUNBAmN9eZoGlzZc0/2v
	 9Amze6cD14+pGgkDDCij//jlJZsBVve/dq5+EYcLW5RUWvmwloV1nujAoTAprCcwFy
	 zdPhIoV9jg2In1towfCob0OuQL1TQM8zHe8spIpEJCrkqXdlk61A3tvWvzuaCWXlvt
	 FtZomaOnZPKH8CQkfY/UYy7124smVllIkd+m053QrdFC+uz6UXquE9jNup9AZ2MXlb
	 YDNYc5/FhNYHg==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 2B/28-53635-2145A806; Thu, 29 Apr 2021 06:37:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRoisU0pV
  g0NGkanHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZmy8dYC9YCZXRfvuWawNjFs4uxi5OIQEZjNJ
  /Jv0jRXCOc4osX/tR6YuRk4ONgEdiY4X3SwgtoiAvsTS2XuYuxg5OIQF3CUa7ruBhFkEVCXu7
  93HCGLzCrhJTHq0DaxcQkBBYsrD98wQcUGJkzOfgMWZBSQkDr54wQxRoyixfecZqPpKie3Tzj
  JOYOSZhaRlFpKWBYxMqxjNk4oy0zNKchMzc3QNDQx0DQ2NdA0tTXTNzPQSq3QT9VJLdctTi0t
  0DfUSy4v1iitzk3NS9PJSSzYxAoMopeCQ0w7G968/6B1ilORgUhLl3dLZmSDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgrc0uCtBSLAoNT21Ii0zBxjQMGkJDh4lEd7YAKA0b3FBYm5xZjpE6hSjK
  8eztUsWMXNsmLcUSP6/exdI9i84uJqZ42b7odXMQix5+XmpUuK8giCzBUCaM0rz4EbDovESo6
  yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeAJApPJl5JXAXvAI6jgnouGXn20COK0lESEk1MOm
  65XCXM9is0auRk+uQ6s/9xRYdNENhWYiDbZyHQVvw+Vn75FTceh2PHZKc2JgdFOJmnfhWM0DY
  szD4ytQN1T+UXrCtXZVsv+GiEvN1zkcpnvwbBL6dWtbfGiihHhBTsYDp86kvTk53eHfOMW9zz
  N0nNumZp9iOcE2/uQt3NyTfcVGe1lU0SZPz5q8K5bIvqS8ncWy5F3n5Ooto1PpdR/4VtbAxqw
  vKv/rywIq3x+Vh6rdy1jAOK7uWdzYPY1asbfFQmrVJvlIyzGdVrfORLN1axunlEhtVSh+K7S3
  5k8R1eq9Wjva5gzfzmSS+xbvEB/G8nrB++fzA/6XsvzhdvwpXmQnkLp/4PfqagbESS3FGoqEW
  c1FxIgAbakzoQQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-25.tower-271.messagelabs.com!1619678226!212235!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20196 invoked from network); 29 Apr 2021 06:37:06 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:37:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6b6hl028513
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:37:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:37:04 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.1 -> 2.5.2
Date: Fri, 30 Apr 2021 02:36:59 +0800
Message-ID: <1619721419-4675-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
index 6aa7b17be6..f82107dbee 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "b1c279e89d97849d5fcde31d76812f04"
-SRC_URI[sha256sum] = "e9582b8e9457994bd8d50012be82c23b2f465da51460c9b2360a81da0f4e06e6"
+SRC_URI[md5sum] = "7643f135b49aee49df7d83c1f434dc4e"
+SRC_URI[sha256sum] = "b9d295988b34e39964ac475b619c3585d667b36c350cf1adec19e5e3c843ba11"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.25.1

