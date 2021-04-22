Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web10.8483.1619071025057801107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tYBEd1Gz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071013; i=@fujitsu.com;
	bh=BUvQtWo63eTFa0U6nvJGv0a1WhxRthLY/PZ3OPAJMP0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tYBEd1GzCUQjh558s73ujAlKjiwuZ5n6HmvE+W7y9esfBk8m5sJ0Ehe0i2EV0Uk/R
	 B45f5ZLZWP4uOZLMDBSPtbttZlsE7aPuDfNqkCkCuFGJRPZR379Idth8EMXPtOf9zM
	 b9tVsNPfzb07J4T7iC8lZEueLykUPf0yxQvR8CG8JihbOSFKgmuFlmQGesC4DqIwVE
	 hzvSE1qH8P3HeR+Lg/kYN3+ZOg28nKgpsXZ9+Gi27DgySMsJJY2urCuSvv96PJcgLE
	 Wo0UKrap5QCKF9iaBVFKrrDuW1+YquAfS4w3RqKjFHeQzs3FNKWuE19Q6hVvToZiHQ
	 BZ+Bd84sCmZNg==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 7B/F6-55620-42011806; Thu, 22 Apr 2021 05:56:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1VURaEw
  wmPRS0eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdhwLKagjavi3P2rbA2MKzi7GLk4hARmM0ms
  /ridBcI5zihxcOccxi5GTg42AR2JjhfdLCC2iIC+xNLZe5i7GDk4hAUCJNpbjUDCLAKqElv2X
  GcHCfMKuEn83pMFEpYQUJCY8vA9M4jNKyAocXLmE7ApzAISEgdfvGCGqFGU2L7zDAuEXSmxfd
  pZxgmMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoaW5rqGxuV5ilW6SXmqpbnl
  qcYmuoV5iebFecWVuck6KXl5qySZGYAilFBzt3MH469UHvUOMkhxMSqK8C/kaE4T4kvJTKjMS
  izPii0pzUosPMcpwcChJ8B4ByQkWpaanVqRl5gDDGSYtwcGjJML7mxcozVtckJhbnJkOkTrFq
  CglzrsTpE8AJJFRmgfXBouhS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEec+CTOHJzCuBm/
  4KaDET0GLtKbUgi0sSEVJSDUwsK7Mrsz9dmbIpbLNQ8XQHmWdcJy4xXbc54XzpUV3O00NPXvX
  ZJZqJrZKu/Ha+z1d4hUda8tS9f958VuCcN0ep5kTuz2WRbgoeJ706HOtOzZ95KpSn7LSGwLWk
  Iw+n6W1v0rmmZ1P1JrBiT+zbMIX9u4/JLNm+1//DoThHTVbupiMtfLfM64JW/lys/0/39JuTH
  Qy8x31zJlavfxx54GDRRIvVCUc+PPo3Jeig48fYO68rNDsSt15y+T9bNELki9STgqyT6xKvCW
  bfUrY/+SBDaR3rkdWvQpn38EWuyfvLc+DJ/taWkO6krAk/2aq5wleb7YkIrztwQGSXysYPAe/
  4c+NfPy9Z0n7mgLZJy623SizFGYmGWsxFxYkAJlLUOxwDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-285.messagelabs.com!1619071012!1638138!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27436 invoked from network); 22 Apr 2021 05:56:52 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:56:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5uj8d020431
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:56:52 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:56:43 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.30.2 -> 1.30.4
Date: Fri, 23 Apr 2021 01:56:34 +0800
Message-ID: <1619114194-4717-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{networkmanager_1.30.2.bb => networkmanager_1.30.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.30.2.bb => networkmanager_1.30.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
index ec3bdd22bd..7c07b0a34d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
@@ -31,7 +31,7 @@ SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "0c8e80e77877860e4a4e6ab4a0f7cdc1186e356b65b042a751897188b88944d2"
+SRC_URI[sha256sum] = "6050b724212ea3ce7386113359bea9afa1f679a54f60d999a5999892e672c190"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1

