Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFCBC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:30:10 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.1124.1667809808114118901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oC6jwya9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809805; i=@fujitsu.com;
	bh=HvgVE1vsjrMnMSQvyQh4vA3osaaWcSuj9R+u/esZ9as=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oC6jwya9lbqNOiHxkJLb8Q4YfYM1ZkeMKWOYZRFnaPgdZo6GBUedfg34C5HRUpJ9a
	 r5tVEoE3OMOrfDZ6/ubdOAjX2HrvMsK/Aw4bfmW+MDCnBqQ7C8hz/68z+vmXnv2D7t
	 6oBVTT7WogkW8LxdAaMRKlJl988V1DUqVm/OQNO3Ljh0wg6oRWAYmUiYy1gnSdO8j2
	 ONgsuwHSL96BlFhTfrg41jB4RzZZCkvlI9MR5v2zOldY8YA3J8sS2dlmqa/bugiCnn
	 lPXbcrq9E64OuHsm96HNaoO8LVWvs+kFg1MuHdmCauQG2OSqkV7VH1oVVqs3HGx5Pm
	 ZLSlBY9ULdOSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORqMt7KCP
  ZYN4CBYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPbm3csBY84K/6dXcjawPiVo4uRi0NI4Amj
  xK0nD5m6GDmBnOtMEt9PFEMkdjNKLJq2ghUkwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAv0T74jMsIDYLUPzVqkOMIDavgJPE8qXHwWokBBQkpjx8D9bLKeAssf7lS1aIxU4SL1
  9PYYaoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRropdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLopxWw+Oxj/Lf2jd4hRkoNJSZT39/KMZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  Dc2AuUEi1LTUyvSMnOAcQSTluDgURLhDdsHlOYtLkjMLc5Mh0idYrTnuHrlyl5mjqmz/+1n5l
  gOJmd+bTvALMSSl5+XKiXOe203UJsASFtGaR7cUFjcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSj
  OwagkzMu8B2gKT2ZeCdzuV0BnMQGdVV2QBnJWSSJCSqqBiTm4wcl7SqXs9iN9H158VYhniDzb
  yXLFYbP4gwtnFzBO2dXzXOG1UUGe5gE/c5dD00syHjVeY3q3XW1b+anuaq7fCl+WXl7AKyCbe
  P6an4uDZqC19L6793XPHNKXvhe9XeZUXjTTS6HHRxoE3mltPZma5CxnLrL/Qlq52NPrtwpWX9
  4vkqy+d5bSNdWez+GTufj/xR5Uvl+2TP3R6dP/b02OXOD8fdMB3bl9WTuDr+2q/Lon8sp2u2a
  NN+wTviSGvAqpL577ta18pQdT3nvmpqKvcTKMdfK7WD6ls/zPqZmpt6TtcJH+kr/qYTKaLsUW
  T0SkDCZE9+u/sLV913hybXOF785Ta43con7M/MMwVYmlOCPRUIu5qDgRAIOhNst2AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1667809805!248959!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2156 invoked from network); 7 Nov 2022 08:30:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:30:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 203AE1001A1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 13AC7100194
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:30:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221023.0 -> 5.9.20221106.0
Date: Mon, 7 Nov 2022 16:29:45 +0800
Message-ID: <1667809788-30849-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
References: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99448

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
lregex: warn if mgroup= flag is not given in --mline-regex-<LANG>=
Meson: extract imported modules as reference tags

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221023.0.bb => ctags_5.9.20221106.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221023.0.bb => ctags_5.9.20221106.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
index b7703cef9..6ef767710 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "d8f5c062ea6ff484f4f1f5095a7d3c364f3019ea"
+SRCREV = "bf0d53505856d4b3e662be22bbe5fcb740451ca1"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


