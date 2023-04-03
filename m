Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05B7C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:02:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.65540.1680512561808965973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Xz3j0E+9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512560; i=@fujitsu.com;
	bh=mikjc7ABfQ+0Ay3IuEZTYCXcrP/DbQXI3dpUVk0lHl8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Xz3j0E+9nJ5qGBnNTeWZdFAoHYzabCfX+6jXZvpFc0fVAt9qo4X+6QhyJ+/ndckJN
	 ro4vp+aCshpEJKd8fiKg1xK9UOQF3YDfuqzLWi8wBd+O/taXcpaCZx5Ou46Uukb5+W
	 tdlXgSHDZCQaaVeDDEAwI0czdiZcmEam1KPVuN8XXgCkpxuKb9JktjazcdoxTVpVS2
	 jAQxtpWLGWT8E7y5Jkubk2nhwiAmDbIzuy9UWB9H/WNxMeVZBMvYfM6kIjeH92wtGE
	 IXIFMa7O8frZ5bs8MtAwK5Q5W1wdLmgLekZSml4IC5kVyv5iDfUHABQVupvRcq2Fh/
	 32uOregSLnlBA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWVd/mla
  KwbO3NhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aeJT2MBRM4K35PucvewLiTo4uRi0NI4CGj
  xL91XewQzmUmibN3DjFBOLsZJWYv+gjkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPU
  DcHh7CAt8TH95IgYRag8N9zh9lBbF4BJ4meG5/ByiUEFCSmPHwPZnMKOEtcWPyCFcQWAqpZdb
  KbDaJeUOLkzCcsEOMlJA6+eAHVqygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNpcWpRWWqRrpFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcQlQJrG8WC+1uFivuDI3OSdFLy+1
  ZBMjMHRTilX7dzCu7f2rd4hRkoNJSZRXsF4rRYgvKT+lMiOxOCO+qDQntfgQowwHh5IE78EJQ
  DnBotT01Iq0zBxgHMGkJTh4lER4g3uB0rzFBYm5xZnpEKlTjIpS4rx+U4ASAiCJjNI8uDZY7F
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz7aiLQFJ7MvBK46a+AFjMBLW6N0gBZXJKIkJJ
  qYOJk894eU9MzwzTLZeWfN8pXc8WZ69cnFqxsPt8l+YWhaZHQPJO8bC9jpe2PPxsX/NnD43DK
  OX7LzT+CQexFMZ9czmic/7P1AFt+4FpDcRWP7gf/3jlrPli40rj94R9tB90368wjs9sz9jFkT
  55W1qxeuXzt7XhtS6ZbihKXRU9pbA1teBX7sHr/31lbj19ZuETJ9O3kFXv3ZNdKM6Ws4Vx/3a
  3wob+l1fewhXo8XZHCzT+EKpgXxRrV7112e8ruA9fl/xpb/XRRSL+82SPVrjGyeMnmmtr5OkX
  WaS7/gj/xMvOEizjsTfjZfGXtwbTb+m8SC4/qxiw6oZoxc05K/4dL0znCG17fSNCST9oRq8RS
  nJFoqMVcVJwIAGnAmTRYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1680512559!350109!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17639 invoked from network); 3 Apr 2023 09:02:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:02:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AC752162
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:39 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9F9FC7B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:02:38 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aenum: upgrade 3.1.11 -> 3.1.12
Date: Mon, 3 Apr 2023 17:02:05 +0800
Message-ID: <1680512525-30501-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
References: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101906

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aenum_3.1.11.bb => python3-aenum_3.1.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.11.bb => python3-aenum_3.1.12.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.11.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.12.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.11.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.12.bb
index b2fba6f01..e3c43823e 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "aed2c273547ae72a0d5ee869719c02a643da16bf507c80958faadc7e038e3f73"
+SRC_URI[sha256sum] = "3e531c91860a81f885f7e6e97d219ae9772cb899580084788935dad7d9742ef0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


