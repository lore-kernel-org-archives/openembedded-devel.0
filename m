Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.3413.1618537411576090078
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cA52THLF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537410; i=@fujitsu.com;
	bh=OhJ+oU8L9E/+yH/s3MGyRVCijRq8fxTTw5NLTc6AVDA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cA52THLFhrls5QP89p1BchtfdVo/PnZE3RQWkIkfz3tFuWnkK9v/pP1Znlq3qedDc
	 bOUxK1lMvKjb3gzLp8Iw8p2bkjT+/T43saB9ORgP9q9R/sW3mX6/jQ6JmwIc/mc6Yw
	 RJBzDfmMIbjPBheHgq4wSr64+V8uUfhDqBwMb1IChHNqvZQJCNrmmpVQxgS0yczQdV
	 wtJseKRtHGTtPPCimt9n5idGth1u0W1rxueGW9eBMnEEJ7IO4va/Qm9Lctnp0pFD+w
	 SdQa6unXWJk9DerjsEFO5vaqPuIMyOCcrks8QpAiERwbK3d8shq4iwlMSVkowLSjPB
	 01bWnyVxcHkcA==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id B5/4F-24644-1CBE8706; Fri, 16 Apr 2021 01:43:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1T34uiL
  B4MFnJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNj52+WgikcFa19T9gbGDexdzFycQgJzGaS
  WLRoOjOEc5xR4vWiBSxdjJwcbAI6Eh0vusFsEQF9iaWz9zCD2MICHhKf1n5hBLFZBFQlVs+5B
  VbDK+AmsfbuerAaCQEFiSkP3zNDxAUlTs58AlbDLCAhcfDFC6gaRYntO8+wQNiVEtunnWWcwM
  gzC0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpaArGRmV5ilW6iXmqpbnlqcYmuoV5
  iebFecWVuck6KXl5qySZGYCClFByo28H44PUHvUOMkhxMSqK8h1aUJQjxJeWnVGYkFmfEF5Xm
  pBYfYpTh4FCS4F31qiJBSLAoNT21Ii0zBxjUMGkJDh4lEd4PL4HSvMUFibnFmekQqVOMilLiv
  C9B+gRAEhmleXBtsEi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9xjIFJ7MvBK46a+AFj
  MBLa5YVQqyuCQRISXVwCS3fEbXDb6sB+ebfJy/Mp08EC28gLnxsvH197fUl9zKm5LPdanirlr
  gNfuSY/OrU87UdWzInLBBJbZZ79dDxci0vUfvz7c+eNaK42DWZcf7ca2ua858LmblOnLU9q9J
  7sTy+c9u3S/a1DGJ5ddWfnHf7Vdd34jOXW16/opIt3xaAl8axz2fK8xBp8OkIqforfr/4a2Zx
  SY5p/4rrq8vGJh5FLio3VawEGSVUfk3WfitygM+zTdxXwRnXex4dtJxgfQXf5NPCzYvVDhguP
  4ps0ROZpn1cU1xzdjI9/+Fcl47at5gMQn5GCUUwrRb+nDlyt978w8sZzNjvKuu3F/g/NeFt6J
  ocfGSS5tNCwOaapRYijMSDbWYi4oTAa/7TxIfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-271.messagelabs.com!1618537409!1487376!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13803 invoked from network); 16 Apr 2021 01:43:29 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:43:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1hTV8027926
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 02:43:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:43:27 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.12 -> 6.13
Date: Fri, 16 Apr 2021 09:43:21 +0800
Message-ID: <1618537401-7385-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../cifs/{cifs-utils_6.12.bb => cifs-utils_6.13.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.12.bb => cifs-utils_6.13.bb} (96%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.12.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
similarity index 96%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.12.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
index c68b474cc..41a9b8e76 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.12.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "73008e3292e4d46fde3eab5d5f618886210ec4a1"
+SRCREV = "464a60344a324311a6f5bb326fdf5f422a3c9005"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

