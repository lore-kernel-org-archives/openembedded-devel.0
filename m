Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B09C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 03:14:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.6315.1670382851280280215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 19:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mPPdjbzY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670382849; i=@fujitsu.com;
	bh=lwjz79aioHxb5hD/UxHtRfSH+iihgbJ1JK9k9PSCLsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mPPdjbzYZced1IOOnp/OQuY/cg1oI17jiqHZ/+Zqw5S532AMiCXbUoiaNewTlByTq
	 Z21XJ1Ey3z82V2Vt8XoI9ySOI89m0cM32KM36XwIzgDTSojulTtPlun6aNOtmHnKOi
	 l1w9I80OQ7CEA4347cu2M/ihTIxUq6/SZJS7YBVdabfx2jT38qMk+qmRx6vWwyFg/4
	 lYoOlPkTB99Zw4Gz5oYzWwn+afEVvITdSTB7Jnzow5eZOuGk9WiMaRF3Fi/VlQVC9M
	 OVm8YNk0N0OuLEtFwZUQbWqODF/qI4sxWrSNkSg1Qj4KXggzskAXDta/frO75tqmk0
	 yVYKWGx8R7rUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqMvAOiH
  Z4PF3OYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPlm/vsBZs4Kk6u28fewLiIvYuRi0NI4Amj
  xMvGHijnOpPE0/+n2SCcPYwS76+9B8pwcrAJaEjsnnqZGcQWEdCXWDp7D5jNLKAmcfTlT2aQB
  mGBiYwS33ddYwNJsAioSJx5cwTM5hVwkbg8sxesQUJAQWLKw/fMEHFBiZMzn7BADJKQOPjiBV
  SNksTbS3sYIewKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGM2KU4vKUot0DY31kooy0zN
  KchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQIDMqWYYesOxo7lf/QO
  MUpyMCmJ8r6o7k8W4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7m2lCspBgUWp6akVaZg4wOmDSE
  hw8SiK8s5mB0rzFBYm5xZnpEKlTjLocO99f2sssxJKXn5cqJc4bA1IkAFKUUZoHNwIWqZcYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMKg0zhycwrgdv0CugIJqAj7v3vBTmiJBEhJdXApOB
  eYGb0Jent9YVX05Lfd/aLZF8Trl13QmNSh2vXNp/1pSVHBGVmtNhKzF16MJfXJvbOOu121c5X
  nWKzJDzWxZ6cNv3HKcX6rgQOjw1/DBievgvXezlbJad/03w+VQeFrStWpTBb8Bct27v0gqhpb
  Vwwi8+hoLfBx35EtyfwOdrfOnXouC2Lf5Rzldgv7jKRw352RyddFu4rPGCxb4KoMEfN+sneyY
  e0N7AdKgx31D/Bd/D1u92Tpr3xEDn59uY6vkJujl2SOcFc80rFdFd7FnFe+PXu6sVZE+49+Be
  5tpPt4me9U4pCwZndh4L6+acfU0l4IJBovVegY+0ii4K/H9YtsXtVzd6sm/+57J6YEktxRqKh
  FnNRcSIAKwygYU8DAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1670382848!75593!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 921 invoked from network); 7 Dec 2022 03:14:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Dec 2022 03:14:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 24969100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Dec 2022 03:14:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 185F0100043
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Dec 2022 03:14:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 7 Dec 2022 03:14:06 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] polkit: Recover  ${nonarch_libdir}/${BPN}-1 into FILES:${PN} to fix install do_package error when enable multilib.
Date: Wed, 7 Dec 2022 11:13:37 +0800
Message-ID: <1670382817-3426-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 03:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99968

ERROR: polkit-122-r0 do_package: QA Issue: polkit: Files/directories were installed but not shipped in any package:
  /usr/lib/polkit-1/polkit-agent-helper-1
  /usr/lib/polkit-1/polkitd
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
polkit: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-extended/polkit/polkit_122.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/recipes-extended/polkit/polkit_122.bb
index dfa6c14a4..a7cfbdd62 100644
--- a/meta-oe/recipes-extended/polkit/polkit_122.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
@@ -46,4 +46,6 @@ do_install:append() {
 	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
 }
 
-FILES:${PN} += "${libdir}/polkit-1 ${datadir}"
+FILES:${PN} += "${libdir}/polkit-1 ${datadir} \
+                ${nonarch_libdir}/${BPN}-1 \
+               "
-- 
2.25.1


