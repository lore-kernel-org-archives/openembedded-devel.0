Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098F6C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:24:19 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.7726.1635312258266327064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xK5inTjD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312255; i=@fujitsu.com;
	bh=TprP4SuQMeaNlJfKa3VpEpAqMFBLVNAkCnENG3KHMLY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xK5inTjDObeJBSh/jSJKqybM2TJ6bCC1ynxInpx2AWyhTKkFeRUyL5U08b5l81m4O
	 JqmJjSTLzWohYT5KTMxeTtOmbTXAmMy/ou9DJZxTpPYiA4uzmJ4UhHEfSzcT8AwN8V
	 gS++sy4M8eO9yD3CNowxi5m0kdqXzs29GaHsX47LEj8LmN0VYEPE7c2G8/uUuer+PQ
	 lGft825XWtbmGQCd8S5gSzsrfcSqLM1f6Gn7XYH685+SuugbeBJKOXKu+yCSs9D2nl
	 wMcZpJIRiuxlRcXfuWRSTxhJzy6DUAMLb4habdOLPmUu1GwuHcNDy1NpRW+UkonLe4
	 97nWFxm51Kt5Q==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 94/72-11692-E72E8716;
 Wed, 27 Oct 2021 05:24:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYolv3qCL
  RYN1xaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPKyXbWgqmcFScetTE2MB7g6GLk5BASmM0k
  cfexeBcjF5B9glFiW+t7VpAEm4CORMeLbhYQW0RAX2Lp7D3MILawQIBEX/ccRhCbRUBV4u/2d
  qAaDg5eAQ+Jm9fiQMISAgoSUx6+ByvnFRCUODnzCdgYZgEJiYMvXjBD1ChKbN95hgXCrpB4ff
  gS8wRGnllIWmYhaVnAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXWNfQ0kQvsUo3US+1VDc5Na+
  kKBEoq5dYXqxXXJmbnJOil5dasokRGEYphcyHdjA+ef1B7xCjJAeTkiiv77aKRCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvEn3gHKCRanpqRVpmTnAkIZJS3DwKInwGjwASvMWFyTmFmemQ6ROM
  SpKifPeuwmUEABJZJTmwbXB4ugSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHefyDjeTLzSu
  CmvwJazAS0mFkJbHFJIkJKqoHJpGLKv8edN4yW1yhU+uuJ9Bnq8Eqfnd11M/QD56H1hrOWl/K
  8+p1j27zWdE6X983Sd4+39MSVf+965rFG4rmA3q616e8rlfUdXzHnNhjkWD6b07L2YN9ExfXJ
  OZ+L9hRw7XnRcmfGp5YYlzcuBz/UZTffzXf8tSTmZLyAbfsUl48/cyQXTPALqrpiVGLDt1Zj2
  iUzd/3JVaEr7i3f93eZukemrpLumng5S7cNDR8FLvDw/dy+a7o1w9FtDDlHOcxbYnYGzhW5vq
  RdcqK5kV1+WdqBC0e/dCRcsrffslfkzhbJWXcbQm8uv7gnMb/y77dtR+deWPglN+zoXtZ5Gff
  d6l8cKOWaGhGvoMp1kCtXiaU4I9FQi7moOBEAfria3R4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-228.messagelabs.com!1635312254!958926!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30631 invoked from network); 27 Oct 2021 05:24:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:24:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19R5OEws013051
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:24:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:24:12 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 21.10.4 ->
 21.10.5
Date: Thu, 28 Oct 2021 01:24:08 +0800
Message-ID: <1635355448-112073-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:24:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93616

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...{python3-pulsectl_21.10.4.bb => python3-pulsectl_21.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.10.4.bb => python3-pulsectl_21.10.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.10.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.10.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.10.4.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.10.5.bb
index 051fd251f..0b867b83a 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.10.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "c9593a54d01dc1ab47ef20464aa7d00433690c86ae840c58f458fe6dedd6b41a"
+SRC_URI[sha256sum] = "b347983fb78baab168f4dc4804ab2c59ca5b813bf62f8146dfb5fcb6ab6c8ba2"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.25.1


