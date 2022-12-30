Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A2FC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:41:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.3837.1672803696743905905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rL7u8UCT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803695; i=@fujitsu.com;
	bh=YRa92LaIfyv/DrLLtEO7bxtVjfiRowNyw4uufOZZMms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rL7u8UCTpFevkWHNe14zngv5xeQ4LMkNmYcLoAms1zk5g98hTCgl/f40+DaNPM5hW
	 nDQAZjAC/ziLWzVUSh9xe+UaihPnqBiYuBH9OeZvqFEc8mSICiPPoZbOumUSrb4paw
	 HkUdYfp2UZdUkGtyajgMyqXKPQ6wiM+KOoF7JxTlolfQ4zvDJI89yZwq6fosa/o6QM
	 W0dgvPscSFz0HyEuvWYlbnAEY0ovXjWPIQtdtO3TML/zybmgux69U7N7Gi/usr47LK
	 PSFwr7qkIhlyTdNyxaMrNN2CdeShuCq9WDORfGZJBxnV0USLUhcjyXLdlTzFUTqzzx
	 KDtPq4WWXLGLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSTfv65Z
  kg6WzdS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owrm56wFSzjqrj44jhbA+NOzi5GLg4hgSeM
  Etd3dDFCONeZJO6cX8wE4exmlDjwp5W9i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  8BqhAV8JC4//wA0iYODRUBVYssRQ5Awr4CTxMm7sxlBbAkBBYkpD98zg5RwCjhLdLUJgISFgE
  qaPzazQJQLSpyc+YQFYrqExMEXL5ghWhUlZl+GqJEQqJCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRrDi1qCy1SNfQQi+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHRTilke7GDcseyP3iFGSQ4mJVHeks9bkoX4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8Kp/AsoJFqWmp1akZeYA4wgmLcHBoyTCmwXSyltckJhbnJkOkTrFqMtxd+HevcxCLHn5ea
  lS4ryuX4CKBECKMkrz4EbAYvoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe1SCreDLzSuA
  2vQI6ggnoiKQ1G0GOKElESEk1MOWqtwV/O/zW+/7SObaRrlN7syptv97yXzVL+JdpcLfCNQt7
  ifS7q93yNt++//3Vp5zl6kGtwXnsKkERjrk/eCoPvd/hm7Ijb0Vp9EmFc0ujFgX+nvjeJH/ap
  kdcOzvuPvF4p84sdNm08bd29AZLhheZVRNFXOf5PI3Yv5KF62TA+X/qVWuPMDWxf5ok6LvHe7
  +WwuI20Zb2tHltAmtnRqbamswwXy/RlGwR6+RlsMQ0tok7OYtxv5eu65u8PYwKB7f93j9P01N
  cbP+7m/YdNyZflT8x2fbTAnnnxb185r+O9Cr7ZnCYWd74lP5k89qJuWy9/lonev40iZidO/LR
  KtNAM+PO3NtNGgJ5uwz+K7EUZyQaajEXFScCAP+C9YxkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1672803694!359063!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27035 invoked from network); 4 Jan 2023 03:41:34 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:41:34 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 59C9E1000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4D8AF1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:41:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.6.1 -> 2.6.2
Date: Fri, 30 Dec 2022 12:57:59 +0800
Message-ID: <1672376281-25331-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
References: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * optimize 'richcompare()' for opposite endianness
  * improve some docstrings add tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.6.1.bb => python3-bitarray_2.6.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.6.1.bb => python3-bitarray_2.6.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.6.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.6.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.6.2.bb
index 1138ef44f..1b225c3fa 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "8440a5493221f6ed6c4e0d9cb2ba6e4e600a5fb639f66003eaf15b7150a49230"
+SRC_URI[sha256sum] = "90bac83ba6c37ab5048b43e07eba7d0de12f301ad6641633656fa269618a7301"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


