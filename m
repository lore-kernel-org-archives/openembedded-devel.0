Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D71CC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:16:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.16460.1666595789468412694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MydlVn4e;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666595787; i=@fujitsu.com;
	bh=g0VAJPCEwBiF+aTlsvBQhrPvT4ahnSyyifw8LPy8Vws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MydlVn4est6XYLQO/N9k1tFO65oLezlnCplD2utUjZji7iLv2R5pxzgquYqyQ7sf8
	 7U8IFO/mrfPHJBS28fAKnmU887mpLhxBsBt1+wKgTWOCgp/dbIM67DtyHUcX7d3gak
	 q8baAlBRw/6cQqmDWbQIsjQGl6J355bPR0yQk0c3qAhPzRMgePE4G8y6GgmQE9Npcs
	 iiCf+wMAtS7kQndLSldm6VDi2LOPIySS+ROFb3IL3WmkpHAp981Z5+TEiKnM49xxqO
	 fKeBpjwiMi2a0wKqpXtsbngAppDTs0eh/uDXmm/Aqdjip9BPfVvePtel/CARMJZbRF
	 isnaM5wunRelQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSfe0dVi
  ywZw2HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNlwwSWgkecFV9a77A1MHZwdjFycQgJPGGU
  WHTzBxuEc51JYs/p2YwQzh5GieuzzrB2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJ/Fx+i2wGhYBVYmv35aDxXkFnCTuXe0HmyMhoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypG0+LUorLUIl1DvaSizPS
  MktzEzBy9xCrdRL3UUt3y1OISoExiebFeanGxXnFlbnJOil5easkmRmAwphSzs+5gfLHkj94h
  RkkOJiVRXgbxsGQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErw1WkA5waLU9NSKtMwcYGTApCU4e
  JREeGcZAaV5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te0AsxBLXn5eqpQ4b6cVUIMASENGaR
  7cOFj0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHvMEmgKT2ZeCdzWV0AHMQEddGlFEMh
  BJYkIKakGppl/Nax6G1rzEjmLvmue0Dt/1C53mdg89yNZMU9PnnuT2lTg7yolY607841Z67kd
  0RbfkjU05khMbrhl0cZTMm0vQ7ao3L1jYSufX+dcHzNF4+vSIrm+41d6PaaVdR7lVc9PC9R4X
  19cs6B8K8/ri47+R5Vivv6Vd2a8VKK+WCd1pUHDc+NVolEHvyy9dW+Zn8equ2te90z1sude9H
  fa8bm/2ix9tZd4TK+V1YxhffN5qcHrb1xn9VzF3z3/m3fl5rKZflsmia/3aG4zPh9Secwt1mT
  m8pk+DOKi168FZa1aYG2ou+0s0/7bmavfW1i/7Jj3Jyw86rpMfGEct+l24dpDu6N6Lj1ZceRx
  25KAYiWW4oxEQy3mouJEAMk77wFZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1666595786!198172!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19819 invoked from network); 24 Oct 2022 07:16:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:16:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C5C2B1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:16:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B95EA1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:16:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:16:25 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.7 -> 4.21.8
Date: Mon, 24 Oct 2022 15:16:09 +0800
Message-ID: <1666595769-29738-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99288

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.7.bb => python3-protobuf_4.21.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.7.bb => python3-protobuf_4.21.8.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
index 24ce61cad7..1eb1832619 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "71d9dba03ed3432c878a801e2ea51e034b0ea01cf3a4344fb60166cb5f6c8757"
+SRC_URI[sha256sum] = "427426593b55ff106c84e4a88cac855175330cb6eb7e889e85aaa7b5652b686d"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


