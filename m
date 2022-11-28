Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE04C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:12:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.111411.1669615956763386395
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IYYhSw8B;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615954; i=@fujitsu.com;
	bh=1VT1nlgGqY2dcyq6yq9LVMNu+TTePz2BtqNj+ypRf3A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IYYhSw8BnaQ6EiSdgvBV0G7ijAiYEQajoT8s7CWmVdv528uUPk2E0Z1ZphXiomIaS
	 BUrBICE2UOQ215sGfoCtuq/ToFn2k9g/2xD6vPs8QJFBEmJBiP0+fHKBQtlsm5cXap
	 aWQjcDNu65I750+gxo7qhQEXimKVw8K/ZFey0JJfFocRiTIfiLcnpqxRPuo86NSGEx
	 GnXDW/61hFBMyqUe+49abyQSQtSActFdnoqEJrhKgyv/XpjdrR6PoXuNKamclSzLJe
	 mQ7/0mRQt/c89+SRcS92VY0ofkEoFf/31149283n8Gi3OGKb9wqJXHdKGucsxK9oQO
	 E1z07I3EGHEtg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxSTcwsCX
  ZYO50I4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePItBssBcc5K47e2sfewHibo4uRi0NI4Amj
  xOYf+1kgnOtMEt+bZ7F2MXICOXsYJVY2+oDYbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwt4Scyc1wrWyyKgKtG+cypYnFfASeLF16tgvRICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0L04tKkst0jU010sqykz
  PKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzHlOLU1zsYjy37
  o3eIUZKDSUmUd+GlpmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzrPVuShQSLUtNTK9Iyc4CxA
  ZOW4OBREuFdbA+U5i0uSMwtzkyHSJ1iNOZY23BgLzPHzK9tB5iFWPLy81KlxHnP+QOVCoCUZp
  TmwQ2CxewlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK820Cm8GTmlcDtewV0ChPQKZsUm0B
  OKUlESEk1MHXG8DD1JRjJddWXqCU/X2Oz/7DEgwKbb2Z6N7VOFP46tkUihWf706MW235F1vO/
  zjzPH3DbSauqWeoQ3ytLl/ncTX8Xvaz5Y3ld3qSz+Xog3zXWRwd2CW15khDWYlB2LNjwdaF6h
  HCho1f+GvvlzUt3pVkwvWKZFJcWZH/z4/M0Ebku4R/OikdmVNsI322N99ExmqokkZLH4P2T6c
  i1j3VcJwP+zsj7/rXtxvPjoQ8EnRc8Obz059NnF2xmnJpoOOn46j/n8xlz17y7KOP4dWdWi06
  DpeoKlukSn4qfqTb5lQiGm168J2ywK2zVdw1Bt3mXm2Sudqpal+x5c3pJoGCfjO6dnLszVdYf
  fHf+gRJLcUaioRZzUXEiAARC0NNUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1669615953!272866!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22032 invoked from network); 28 Nov 2022 06:12:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:12:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 501B41000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 43AAA1000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:12:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xfstests: upgrade 2022.10.30 -> 2022.11.06
Date: Mon, 28 Nov 2022 14:12:05 +0800
Message-ID: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99796

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.10.30.bb => xfstests_2022.11.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.10.30.bb => xfstests_2022.11.06.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.30.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.06.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.30.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.06.bb
index 19e16c591..1c1a176a6 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.30.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.06.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "7d839ccc1a13148d1a41d32fb9be83a0c8d31496"
+SRCREV_xfstests = "41f2bbdec5faa5d6522e86e63c1f30473a99dbfe"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


