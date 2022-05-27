Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2244C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:36:35 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.2729.1653615390278552682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oyElNWad;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615388; i=@fujitsu.com;
	bh=bkSJFb1CjUqrZW6hVFtXtWODRgWT++1qkpVeUVCMvcw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oyElNWad32TgWGb44n1LjjuVBco5gK3FZ+UzRGb3LOjR3klp9iGZT1I4lJbOw2Gh+
	 lYPijlSksQoBWJEc0/6E1GY37BT8rynwfh9n764JgeVVRzfztbTaS76deqog4DZ3e5
	 VL3zInxFxRfhiVGO84JL8rQ7AqXzBocXFYK3S0CSkVm7J3IK0VbcAwYOctsZQtDNjj
	 V+Rwaso4tuNsYvTdGLNxo3xjEqyy4QEEs2fIDtqNUqW/KVr/DOhdhKGl+KOem4tbWC
	 Z6VI1yiGSXG+RIiEDaw2oyC40NqvEp95yjLmrrbSLgDIahE2dDXg4eZkuGRagt/R56
	 ojoLpRYDPwvlQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqCutPSH
  J4Px9KYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePus5usBU84K3Z86WdsYOzl7GLk4hASeMIo
  8XfvW3YI5wKTxJ8Ha1ggnD2MEitv7gJyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFgiQePV7KROIzSKgKrFo2h5GEJtXwEliw6M2sF4JAQWJKQ/fg/VyCjhLLN+6GaxGCKjm1b
  2FLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iQVZaZnlOQmZuboGhoY6BoamupamusaGlvqJVbpJuqllurm5ReVZOga6iWWF+ulFhfr
  FVfmJuek6OWllmxiBIZySnFi9w7G1ft+6R1ilORgUhLlzbzXnyTEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgveO2oQkIcGi1PTUirTMHGBcwaQlOHiURHiVZIDSvMUFibnFmekQqVOMilLivFc0gR
  ICIImM0jy4NlgsX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsUZApPZl4J3PRXQIuZgBb
  n8/aCLC5JREhJNTB5mQgukHA+/Wyb/nYO7uxm2ZOfHlXOPuKgbPD6geNnq3325ZPjd9o5dnus
  njszqMD58JEXSTb9jtaN+TLq23VXnElIljzz2qx4ht3U22Y20ow5JQ/811v97v1h9lv40K9r9
  pdbvQ8rPnoTt+TY38WJG1cefjjFbp7y/1UJaxYLh03dItVbbGP7dd3huSq3LxtphEb0zbxyJF
  zv4HGRtRdClzFqs3x47HePW5d1zi7Jqxl339pedPvCwrxiyUHNXUk34p2aP2oxz3paedcn3FQ
  tcmGIsTa/cmPdGe1HdRsnvN7Ec+TuZLft96OvH/0avl26oldyy8HVxzccTDiTfYMzag2Dd/wD
  51W/4197TBZgUWIpzkg01GIuKk4EAO3wijlgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1653615387!17943!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10855 invoked from network); 27 May 2022 01:36:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:36:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CE2FA100196
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C215B10018C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:36:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.35 ->
 1.4.36
Date: Fri, 27 May 2022 09:35:41 +0800
Message-ID: <1653615344-24799-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
References: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97294

Changelog:
https://github.com/sqlalchemy/sqlalchemy/releases/tag/rel_1_4_36

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.35.bb => python3-sqlalchemy_1.4.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.35.bb => python3-sqlalchemy_1.4.36.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.35.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.36.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.35.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.36.bb
index 5d199dbed..b20c6c8ba 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.35.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.36.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "2ffc813b01dc6473990f5e575f210ca5ac2f5465ace3908b78ffd6d20058aab5"
+SRC_URI[sha256sum] = "64678ac321d64a45901ef2e24725ec5e783f1f4a588305e196431447e7ace243"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


