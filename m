Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB75DC47088
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:16:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.101765.1670066210270482713
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A3UobyUC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066208; i=@fujitsu.com;
	bh=Pdx4Wh9vVc3iHT3yUM36fzfrPh9YyxfU68medQC4CjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A3UobyUCjzbAqnmAvHjsTuU7EG+NNu+EoHMsCKkVMl3s3lyCAPbHeFAckkv+hpu4h
	 nVy6M+ghdCiHzhEDrmluuvKpnM5zmCEJE4/ImhhtkV01rwJ+0zpi+GcXysugp/TpbX
	 ipb4hYdY1KEo5Jlu1dXC1RvTCvd+vuWcmlKsqpNut6An2tawV6sfDvT5OlpRAak64+
	 Ys1Tm/nfFXWiJXfV8kswknMAmo/+J/qrmB85+vmTYdXCFnwqbYlu0OVjptehcu1yuG
	 sJl5mCwFTI7ncAwCGty4yk4J6w8yxIjcRqdJLhOMzgE0TlIBFUH4eYG/3rXN5CqyIR
	 YmjX5ipc0MFcw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWVfeoDv
  Z4MF+DouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPiifssBT1sFTN77zE1MO5h7WLk4hASeMgo
  Mfv7BuYuRk4g5wqTxObDTBCJ3YwSn7f2gSXYBKQkbtz/zwZiiwjoSyydvQcsziygIvHidw97F
  yMHh7CAtUT7DlGQMAtQeOnFl4wgNq+Ak8T+z9/ZQWwJAQWJKQ/fg7VyCjhL7Om9yQLSKgRU8/
  amCES5oMTJmU9YIKZLSBx88YIZolVRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG8+LUorLUIl1Dc72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OSc
  FL281JJNjMDQTSlOfb2D8diyP3qHGCU5mJREeY+FdSUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uAN1O9OFhIsSk1PrUjLzAHGEUxagoNHSYS3SxUozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  Qpcd5NekBFAiBFGaV5cCNgMX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvGMgUnsy8Erh
  Nr4COYAI6YiN/F8gRJYkIKakGJteGXR82p8Qw/Xu8QD6+98KPyc+Vhfrvf3fV3/fq58MvD3Sv
  LElN2v9SdJVK6kXRvb3HpM49DVpX+VfefQ9Do4ZBHse6mbG3+fxdxA7JvRfo61oc/4bFR8da+
  ODPsss3GI4v+HZlc+JNHxeec0bFTm9lUhoyl6hK2z1PdlDq1w1euWblYsZTPIuF2RdMe/J05u
  NW0W1JRvaBdU+0GnaXK10JCNQImLXHeplopsbtx4pXXmsd2XFWX6JG7dPdTeG3LtdtLFWREW1
  a/vfoZ9cTd08eU/rw/9BdDq1/vaapN+vFbrUdnSS31/3QVJ6ti2Ns2t15FhxY/WLrTM3PPeIb
  nlTkhjHetGFlPvDW/vOWYE4lluKMREMt5qLiRADUFzBiZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1670066206!49540!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13023 invoked from network); 3 Dec 2022 11:16:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:16:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9D177156
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 908A3150
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:16:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ply: upgrade 2.2.0 -> 2.3.0
Date: Sat, 3 Dec 2022 19:16:14 +0800
Message-ID: <1670066176-24685-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99928

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index 84a79c13e..61a0092c8 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "bison-native"
 
-PV = "2.2.0"
+PV = "2.3.0"
 
 SRC_URI = "git://github.com/iovisor/ply;branch=master;protocol=https"
-SRCREV = "771c32b299355fb31fc296110e90ae0166409b95"
+SRCREV = "864fac79116870df1ab7aa21e639578807e41e75"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


