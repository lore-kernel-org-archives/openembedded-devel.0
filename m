Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D53C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:21:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.1772.1668396093119041866
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QU+nGTUL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396091; i=@fujitsu.com;
	bh=iLU22axR3Silc8j9zL4u9OMzFJozwn4TP6jAq8xRHug=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QU+nGTULI0FLk31KZ+1bC64zK9KwaP3ce47W3j4k9s/L6nO/FystVX+LsOqk1KdKa
	 A8fjnW+hlLLZ6b+gus76BY1qnDgOGhFf1+xOX04JIOymBZnzvNWe6TO5QL9U/HJnl4
	 HlJuR/Jn2M2YhK6G1x2ei4jKsRT4hCaS34i5yRbrlkASAkszTY+FYLXQA8S/C8YlCR
	 pBPFGUZsfvQdWsBMPvomIDpYtNBfrqX+ED1aN0dIb0VvkTzd9i7Grh50vAnqqgGtL9
	 PAJR+MEgXIzXmH6P/1GROMbuR7Sz7Ot7Mq5Ex6xoHq3rsf/JzWv00V2eZxpuzFiZn1
	 2rYLQuKFntFEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8ORpGu1pTD
  ZYOV0BYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP7zibWgjMcFZ+uPWBrYHzP3sXIxSEk8JBR
  YnfjNSYI5wqTxNvFR6CcA4wSPd1bGbsYOTnYBBQkFm49wwpiiwjoSyydvYcZxBYWcJDYdnUmW
  JxFQFXi6dUFYPW8Ah4SH269A7MlgHqnPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8h
  DlFRKzZrUxQdhqElfPbWKewMg3C0n3LCTdCxiZVjGaFacWlaUW6Roa6SUVZaZnlOQmZuboJVb
  pJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBl1KMXvyDsb/y/7oHWKU5GBSEuXl
  X1+YLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC98JmoJxgUWp6akVaZg4wAmDSEhw8SiK8pZuA0
  rzFBYm5xZnpEKlTjIpS4rwqIH0CIImM0jy4NljUXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwa
  gkzHsHZDxPZl4J3PRXQIuZgBZ/j8wDWVySiJCSamCy0G8M+9QocVnr1OHuX4WlL9isSotNWf5
  f0os6NlurOzy4evGyqcHfuL+afyh77/e96ilH/N/nwnfjbmv/3fu9oY+xTSH3jaDoVc3vu+19
  zunJ7nWuK/+5d05//N51FdVun7t/TTyxoN9bw2a1mOvPb9+1NN/9+2XsIv3ofL5gSNR8gXqva
  Na1vDpZdzobo9OOzgmexH1B/JQ6v1Lc27h7q5W2lfNO2p5Z8rDHpoxvlwHvjqppIj/YV/QsuP
  /0Ue4R+cq03tU3Vye4Zd8Q22l/waiMe90thlmK+16+0HOddP5+6i1ZSelH8Xrhb9ekP+HclfL
  v0BXr+gsevrEZ+fzneq+b7dDMmj7/oPsP9iAlluKMREMt5qLiRAAFZKvONQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1668396090!378764!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13776 invoked from network); 14 Nov 2022 03:21:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:21:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2C4541AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 214921AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:30 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:21:28 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.9 -> 4.3.10
Date: Mon, 14 Nov 2022 11:21:19 +0800
Message-ID: <1668396079-24497-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99582

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.9.bb => ser2net_4.3.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.9.bb => ser2net_4.3.10.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.9.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.10.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.9.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.10.bb
index e149bb568..f52921f22 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.9.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.10.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "bcb8ae31d00c6b4392d1cd1c9ecc9390a8b241029c42c5eb951af090edaf56db"
+SRC_URI[sha256sum] = "bfad2b5d98c56f957daf2be975a5a2cefd645f27ef02d54817fadd6e4bf291b3"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


