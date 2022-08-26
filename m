Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10750ECAAD1
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:56:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.32784.1661482558568379553
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=phwYmCxs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482556; i=@fujitsu.com;
	bh=dGUyM7gHN/fQGqdbnbNLzMcH/1XAxPMcHLelBGt02q0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=phwYmCxsdxMZ5NjyVwkyr6HV3MaMMdYwOjlSo0wz/6yC3VDUlTWE18xuPy4VUtgLz
	 DfJ6SBvz2mAEhPYxcF1j6TDmN9Of9uMfWiSa//dwQ3+eqxgMWTdoiJoTENxLjh7ZZw
	 HJf25sJtPmkjNMD1VTHldHdrh1pY31D46cgXczBCxMktmAFw9L8AUo5q0zk5Nx8fEU
	 eEuc4P/Gc5cAqxLYoc373RrqzNFNlXpazoE1Dv8dX5w5DK55+xUSpwH3LRPWGNhNok
	 HfZ8sQTaczBUwDR2bc0kyLBBLf/KflEDmKqUkqAkALmuFwh1lLY6DtMImbU2Dgaeph
	 Sy6ruwAyzFCMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSdfajCP
  ZYNlFM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePb0dtMBbu5Kj4sO8jSwPiEs4uRi0NI4Amj
  xPXzB9kgnBtMEqt/fGbvYuQAck4xSvwt6GLk5GATUJd4fPM1I4gtIqAvsXT2HmYQm1lAVaL74
  hp2EFtYIE6iu28PG4jNAhQ//+0UWA2vgLvEkcWnwOISAgoSUx6+B4tzCnhIfNy/lQXEFgKqeX
  ZuE1S9oMTJmU9YIOZLSBx88YIZoldJ4sSKj0wgp0kIVErceJwKEVaTuArUOoFRcBaS7llIuhc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNW1NNM1NNNLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYr
  rsxNzknRy0st2cQIDOGU4gSBHYx79/3SO8QoycGkJMqr/4w9WYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEr5oJR7KQYFFqempFWmYOMJ5g0hIcPEoivNKiQGne4oLE3OLMdIjUKUZFKXFeX1OghA
  BIIqM0D64NFsOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzphoCTeHJzCuBm/4KaDET0GK
  pDewgi0sSEVJSDUyM06Sqw1bYhH1lZF5YdeHJj59fFtZH77luXl5z6epvyaedxccDv7ZHKq9k
  ezBh4klr6/9felpfLZWeyXZOwsdzkyyfp/v+KXub8jnEQk6wGH5fslPUQ4d/3sXm38UJNw8yp
  11v2Phe5/urjvmRk049Niya/C8mdPPOrcwvvnzhP3iHaf+um3fiemov9r8tNW2552IVs+7f++
  lKwreebEpdvCj23g6xaU+OlvuUNbalqm5+xXIh/N6/m473d06PfLFtn5IBB9firkvVYZ6H3+p
  LLnmmXHqu8pDqutNTWNuTQl4EGIfpbbjRtSZUKSjHkXWrndvJld83Vr+fbS2jIfvm4tnM/zcE
  Vzb8adRY5XtoixJLcUaioRZzUXEiAAwOgpdcAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1661482555!164540!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26935 invoked from network); 26 Aug 2022 02:55:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:55:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 514E31000CC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:55 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 451801000C1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:55 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:55:53 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.56.0 -> 2.57.0
Date: Fri, 26 Aug 2022 10:57:03 +0800
Message-ID: <1661482626-30776-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:56:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98456

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ent_2.56.0.bb => python3-google-api-python-client_2.57.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.56.0.bb => python3-google-api-python-client_2.57.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.56.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.57.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.56.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.57.0.bb
index b8f7ff97b2..fdbad826bd 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.57.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "70d33203a4752bf4144b33fc689e997a2b5ed42c696d57149e4b3f5082682436"
+SRC_URI[sha256sum] = "ec4412545b0c5978a833bb03993a46121ad2c700f32af0cba23f8439b3f5fb02"
 
 inherit pypi setuptools3
 
-- 
2.25.1


