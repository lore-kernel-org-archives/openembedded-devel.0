Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04919ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:56:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.32566.1661482556053106439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ERmuH+7f;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482560; i=@fujitsu.com;
	bh=TayTkud0O99iTp2dq9fy27YrUuYY0qod+CjCgNLVhsY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ERmuH+7fU/Zt7kHnhHv1xoEkWbfOUHTfFRYV7sCEwLWCKYIyoLbuxIB6OrA4+FrXu
	 JXBVEAuNDNxdB7LH377G3LG52RfGajDnWpn498k5pvbMoDrfxWacc0iu+Mi6+TKZj/
	 Z4u3fUzOxWwFRxe4zpD6L6+oUkfjzgujOwslC6VHyFJVpnhkRxk97ewITtLx0lgWRb
	 7vIK+o2DT/uSTjRbNXwfc+1io0kzzgrFiMTs0KuZVmrEJbtbyzXY7/riuN/QOH7tYn
	 p41z+Qqy3jHTpLTFJe8dicu8N6sOjsNtwwyZF9VqncDzrcswhse1auWAPSb7ChTPVd
	 o42vn2uE5J9eA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8OxWdfejCP
  ZYGmbjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG307bgLGfF9san7A2M3zi6GLk4hAQeMEps
  n/GaGcK5wiTx41sXC4RzilFi5uftjF2MnBxsAuoSj2++BrNFBPQlls7ewwxiMwuoSnRfXMMOY
  gsLBEusW9LPAmKzAMWb9neA2bwC7hJXfy8Aq5cQUJCY8vA9mM0p4CHxcf9WsBohoJpn5zYxQ9
  QLSpyc+YQFYr6ExMEXL6B6lSROrPjI1MXIAWRXStx4nAoRVpO4CtQ6gVFwFpLuWUi6FzAyrWK
  0TirKTM8oyU3MzNE1NDDQNTQ01TW21DUyMNBLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4pRi9RM7GJ+u/Kl3iFGSg0lJlFf/GXuyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QleNROOZCHBotT01Iq0zBxgRMGkJTh4lER4pUWB0rzFBYm5xZnpEKlTjJYcU2f/28/MsRxMzv
  zadoBZiCUvPy9VSpzX1xSoQQCkIaM0D24cLOovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mTTUEmsKTmVcCt/UV0EFMQAdJbWAHOagkESEl1cAUu/RsVn+QqPoMNbZFTgKnfih+Dchabid2
  sez39TTvT8Z3N0heSDojGxrZcPjVMuu7Klr1onoatu2sEq+Pbfv0bO25DOmEw8ssdzf+nCTx6
  Jkml0VXfOAD0wg5pXKLb2v5TraemaqtLHN9gstEmbUeacZLtt/T7ZBgEDm5onTVv+0fSnfsDs
  j0elpwV8hI17mU7YZwvcjFhzxv51R8dXUX+Px7z2FBpqOP9NcdSCvze5f6KJwl4aK4ZNd7J5l
  zNbrvvH3vfFiTd6OPO8RbYCPfomdN8yOPRCo6fu6Z/WDzrJ2hOQ8nzeuRZ7N+/mnmiw9ZB5nO
  Tij2XmLsqG97b0MJT++u+3VJlR9n7Vm7x2ClEktxRqKhFnNRcSIAZq5+T3UDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1661482559!161645!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19424 invoked from network); 26 Aug 2022 02:55:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:55:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6B2547B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:59 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5E67A73
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:59 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:55:57 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade  1.47.0 ->
 1.48.0
Date: Fri, 26 Aug 2022 10:57:05 +0800
Message-ID: <1661482626-30776-4-git-send-email-xuhuan.fnst@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98457

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.47.0.bb => python3-grpcio-tools_1.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.47.0.bb => python3-grpcio-tools_1.48.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.47.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.47.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.0.bb
index 90c8efeeca..fcd2840701 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI[sha256sum] = "f64b5378484be1d6ce59311f86174be29c8ff98d8d90f589e1c56d5acae67d3c"
+SRC_URI[sha256sum] = "dd7f757608e7dfae4ab2e7fc1e8951e6eb9526ebdc7ce90597329bc4c408c9a1"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


