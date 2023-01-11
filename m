Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20385C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:28:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.16759.1673414928777908090
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Q9GZNRoK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414927; i=@fujitsu.com;
	bh=QvwWFDFpUHrqWRhfUcoalWF6YTsRABOLbWAriV06kqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Q9GZNRoKFsyb0aIIRrqmHrf88j8ktHLCk1PQ2rWC8DdpLDKhDT50qmTyObWRk+N4L
	 PdbpJnSgWg6ZhshzwhSQXrMxJhUy9iu2scsiDreiuIvaO9uEf34/R5ngh2cKylKgKp
	 7s0qTkOy1XSUmuigT/np0q5McsIbAfu2zWB25mBpBIu3mh1zU3zU46OJitgQxUT/4C
	 xUpZKWs9aesvvOQcYCIqYaXiEv4/uyWzWDiWnB96zD20minTYBFJEDm5Mldd47TEe8
	 9z9qOwnGRPl9AbFoIax/9C8lhODkDq9cT/aLFp9CBk7opt+F3DyGK3P0snUnr3XUCA
	 i8cId0tIQVHZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqMvnuS/
  Z4P8rOYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePA779sBZ0cFRtedDM3MC5g72Lk4hASeMIo
  8anhPxuEc4NJYtfOGYwQzl5GiQ23FwOVcXKwCUhJ3LgPUsXJISKgL7F09h5mEJtZQEXixe8es
  BphAUeJp++WM4HYLAKqEv8aIGxeASeJDxsuM4LYEgIKElMevgfq5eDgFHCWeLtFAiQsBFTSeH
  wHO0S5oMTJmU9YIMZLSBx88YIZolVRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXWO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL28
  1JJNjMDQTSlWVd7B+GXpH71DjJIcTEqivHkS+5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfBae
  wDlBItS01Mr0jJzgHEEk5bg4FES4a11BErzFhck5hZnpkOkTjHqcly9cmUvsxBLXn5eqpQ472
  13oCIBkKKM0jy4EbCYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcHyBSezLwSuE2vgI5
  gAjricNdekCNKEhFSUg1MlbJ3Pa6v5Epw2cA20WlRr92uVObD+5uDtv4Ul4hMNQrR6dQwPXV8
  YsR8nzWMNoW6hlNWcic+U32T9E9QNn2eiS3DvsORB15KT2s8cvzrLt57m2UWbVy1WsaVybvAb
  c/Jw6eZ+TtbsjKnnZvw6LS7z60TpjNWLko9NWtSlez32+1nU875zuezV1ux/WdzrUbp4Q8Nex
  2kNrX3u5UJqzH8v/mwpnAiZ4v9TYFf0y5eu7N40g1trxjNo39+uBTu843unDD3ncPTTY9OnGx
  nvbBLeWLeX804poQ7CboNz3t38k69+WGpTdXTBxv963mbL1xnfbbnrKKPtOJp09vbHG4v58rL
  X83w58757qtc5o/zpiixFGckGmoxFxUnAgAuo1reZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1673414926!439009!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2347 invoked from network); 11 Jan 2023 05:28:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:28:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 38FB3100191
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:46 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1F900100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:28:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tbb: upgrade 2021.7.0 -> 2021.8.0
Date: Wed, 11 Jan 2023 13:28:18 +0800
Message-ID: <1673414898-13896-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414898-13896-1-git-send-email-wangmy@fujitsu.com>
References: <1673414898-13896-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100541

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/tbb/{tbb_2021.7.0.bb => tbb_2021.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2021.7.0.bb => tbb_2021.8.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.7.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2021.7.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
index 8c72b349d..5606d38da 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.7.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
@@ -12,7 +12,7 @@ DEPENDS:append:libc-musl = " libucontext"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "7673da272f7e1592876b42cfe98b9f4cadf6ae41"
+SRCREV = "c9497714821c3d443ee44c732609eb6850195ffb"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
 "
-- 
2.25.1


