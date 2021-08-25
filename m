Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web11.27283.1629962314803155686
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 00:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SiW1KlTM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629962312; i=@fujitsu.com;
	bh=Zt3NHs0om42IEMWr4snwOV78hieRANcAVe5JUUnZp+I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SiW1KlTMgTHI6m1ohMTes51R+ujo9G/Rlp1xOJfzfKy3hsOP5RIOi/2HGZ4tcM5kL
	 bKLoX3CikRJA8Px+M7d+VTmkoj2J1GVdg7pAiuAu9kd1MBmEnkII8tcjct9e8I0Jtk
	 f0/toHiuK0XuamtZ8jdbFt4IddNVKmhhg3CzuLdBkjkQlklbrWiUd1AAuAW/jFPCGw
	 FySpPEuc0C6lk6ZGQWDpkjIDqtk0S/mP/+/bUhPlLbo3uOoj8ePVPgzkoeLU1mMZFM
	 VWIp+EKCs8HWqaWjLa8USDN5WTFShwE8levZoGnp27dksWO8k8QIxau8W3esmYyg8J
	 9QybFmvhb311A==
Received: from [100.112.192.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 07/85-28466-84047216; Thu, 26 Aug 2021 07:18:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1XV3UE8
  0WH3T1OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXi75S5zwSGOirNrDjI1MN5g72Lk5BASmM0k
  cemeSBcjF5C9h1Gi5+8MFpAEm4CuxLnHa8GKRAT0JZbO3sMMYgsLWErMXLyXEcRmEVCV6F86g
  QnE5hXwlJi48w1YXEJAQWLKw/fMEHFBiZMzn4DNZBaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxjNk4oy0zNKchMzc3QNDQx0DQ2NdA0tTXVNzPQSq3QT9VJLdctTi0t
  0DfUSy4v1iitzk3NS9PJSSzYxAkMopeCw3g7GCW8+6B1ilORgUhLl3aCknijEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgvedLVBOsCg1PbUiLTMHGM4waQkOHiUR3n12QGne4oLE3OLMdIjUKUZFK
  XFeUzOghABIIqM0D64NFkOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzHgMZz5OZVwI3/R
  XQYiagxQV8qiCLSxIRUlINTLLX1Zx66za/+r7ooP27qDqnWdsWX5C3WtIqlJPLZ1VS//NiNId
  SZtiDmc6XTV6sr129dlpDi6MNP8+R/Lq8mfOK97MLJX1gVD1/PC9ye821pvlbPu15fmS9XEuy
  wBJehnWLjuXLGIc7mlx49vcAw6rOf7vaNIXECzcZfFspVfLzV19C52/H0PjrD6Wab3A9++Lk7
  1+icXanV0pK5f8bix8VigkyhN48PCEm+np9wM3lzlfZ33tvsLe2sDqsuC02ar3ONf0lfxlcJQ
  p1vuxiuGnfu2Ld42tTZqsas4bffcnBqVigwOh+d7NJ/aonN1h7Ge5OUX7dXmKbOGe1rKAXxzy
  nKsaSummXks737jk6WYmlOCPRUIu5qDgRAL+s7TQcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-32.tower-271.messagelabs.com!1629962311!250251!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25904 invoked from network); 26 Aug 2021 07:18:31 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-32.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 07:18:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q7IOtW007241
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:18:31 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 08:18:23 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.16 -> 1.17
Date: Wed, 25 Aug 2021 12:28:39 +0800
Message-ID: <1629865719-121796-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.16.bb => iwd_1.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.16.bb => iwd_1.17.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.16.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
index 6bace616a3..00d94f36e9 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRC_URI[sha256sum] = "af548398aea2089a3a5103e5586561f24791090a17d4b2e50785e2faab5ed03a"
+SRC_URI[sha256sum] = "6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1

