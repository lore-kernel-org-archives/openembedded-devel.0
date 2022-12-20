Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8697C46467
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:13:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.48568.1671538403455127653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ot18g7Ug;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538401; i=@fujitsu.com;
	bh=3i7OZaK+MMV9MRtT5arr1HCFaYAHN5H5MQitqkEyAjU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ot18g7UgniUZusV0RMfoIN4wUk0loIvC0Vq5Tx71LuUlTwI5bXMhFBiPTL3ufFM7n
	 CsfvOwnRWHLVUO4Vogiv2ZOjffkjkz4bB1CMIgDsPA0eY9v6RxqleGxOwEfR6ZdDGT
	 iyMG+uR9vJHJUVW1zfKyvP09ZMvJxyElkLitt5uGyBpAcDvw/47cpNbZyM5aYmwbLc
	 T0K2X3XAR7m5qkKa46g7WLwJHALZKMib8pQKZ+cP9zz3aw5kjyCHBqL5aNGiIIh9di
	 052QIJnI1hOGEAfX3sOpbjfwVyF7JgcF4JoYVi1rikB4DG8VcbDpxabcFeUmBqypis
	 dJSGTlFa5pRPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSffhsoX
  JBp9/sVlcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmHzpQWnOWoWPPiNnMD42f2LkYuDiGBJ4wS
  zzdNZ4FwrjNJ/Pq5hBHC2cMosffjd6AyTg42ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O4Bq
  xEWcJB40PkVLM4ioCrR8eQBE4jNK+AocaLpJSOILSGgIDHl4XuwGk4BJ4mbRy6CxYWAarb8XM
  UIUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itG8OLWoLLVI19BEL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHxTitNjdjD+XvZH7xCjJAeTkihvWPjCZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  DMWAeUEi1LTUyvSMnOAsQSTluDgURLh7ZkNlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlD
  hv81KgIgGQoozSPLgRsLi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtwtkCk9mXgncpld
  ARzABHXHo0lyQI0oSEVJSDUxTb4vLhs5Nef70rraj7nt9fx7LXgHJh47c02MUGX2n3fERT5zG
  e1z3HHda84s/hpfan7daSPfv2Sq+aONZ+4+qDzO4S5pqz81d/yY5K1nvkAt369IDVadPuSRFu
  M35t+Y13xnt6XXV6zS2L8/78H/HxW9T9A7F6wqntqU7ZDIJP79q/vuuldSbzqqnJ35OYVD4GF
  bcWeV3iH3fq4cJrottudtS69dxRP15rZDgn8v3SeyF6WeFOexqqo+6sxZwSU2aEbM293T22WB
  +S0Uu3njNJjORbU7Cq043MSYvT52l9SJUW+vApNBnpdczHs6pi250cX1xfMl0lolvIoyiO8zU
  uPNWmMV9uqp88nDVJSWW4oxEQy3mouJEAB1R/UlmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-728.messagelabs.com!1671538400!382466!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23226 invoked from network); 20 Dec 2022 12:13:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:13:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 89EE61000DC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:20 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7D49D1000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:13:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dash: upgrade 0.5.11.5 -> 0.5.12
Date: Tue, 20 Dec 2022 20:12:40 +0800
Message-ID: <1671538363-7066-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
References: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100131

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.11.5.bb => dash_0.5.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.11.5.bb => dash_0.5.12.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.12.bb
index ad3672f3e..9882ba6f8 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "db778110891f7937985f29bf23410fe1c5d669502760f584e54e0e7b29e123bd"
+SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.25.1


