Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB60C47089
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:19:28 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.111524.1669616359634904919
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EqJipHb4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616357; i=@fujitsu.com;
	bh=IGI6MTn8WDGyJtL9MOF5Gw/qN7E5wISjGPTunIDWVes=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EqJipHb4ozvqGspZpA5G5Dz7AD1TmTWUgDMaMNDAQ7x7b+nbYYmi8KfYGSMMGI+3k
	 kO8i7iPxep50eg7BpatrZQbf9LADzyjrILTttPECOjNtWHwQIHqcRpGcVytHwghCVB
	 PbZIRsMRjvnNhKf2hAmPDIhtpXH3nw3uCyyq0YeMBhC4UJNjrKTimYDsEcklMKwJKu
	 CFCK6ZoGiQ1d51k2EdevSgJKnKbDN2UgBx60IFVJTTPsQ/mMo5/nqT0dj/9VneIPT3
	 F2udSgqZkDTRvHC5dwcaVcU0XerAxr7M+KeUF+sY09wYIt58rZLUJbNyg2YQLggmBW
	 sKfB0jvx+j4bQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqPs0qCX
  Z4PU/NouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPh5wfmgi6uiot3j7E0MM7m7GLk4hASeMIo
  cfXLDEYI5zqTxPmFR5kgnD2MEtcbeoAcTg42ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBYIkmo6/AouzCKhKvJqzFyzOK+AkMWXWY7BeCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzB
  A1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoWpxaVpRbpmuolFWWmZ5T
  kJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZjSjFj2Q7G7mV/9A4x
  SnIwKYnyfgxsSRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwTsXJCdYlJqeWpGWmQOMDJi0BAePk
  gjvYnugNG9xQWJucWY6ROoUo6KUOG8ISJ8ASCKjNA+uDRaNlxhlpYR5GRkYGIR4ClKLcjNLUO
  VfMYpzMCoJ814GmcKTmVcCN/0V0GImoMWbFJtAFpckIqSkGpjMhO92BvA7SVyzF+1Uif5UvTx
  MUlD4yV5FxwnmfZf57KWOLBVR4zJou/Ly+pMNktnCdqLyldaLzjlJrouIZLuXI3gzkoH55Me8
  5rP10+fcXqJ5+tViIZGY80wJW3gsd9ufPNnNtqrGQ6h//5Te4uyJL4WMrS4e7H9yf9236Yon4
  t63FFWfd2coXHhEI3z2TaXqN5mHK6T5WHdELY+Ky5p/2O96AdMjS2u3iCMcBms3v42zk9S7+v
  e8eKHgeU71c2/+bZ11afrx/2rdDXP2271VZt0S+ItlQxPX+Z9qngWPufLUFYqucexl2KN0Yfq
  Tm/edNrvn8vjPsj17fHXS810z1talRuW5fjk2i/Hx+eVKLMUZiYZazEXFiQCqXh9TQQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1669616356!222129!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25042 invoked from network); 28 Nov 2022 06:19:17 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:19:17 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B7BFE100197
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AB433100195
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:19:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.50.0 -> 1.51.0
Date: Mon, 28 Nov 2022 14:18:47 +0800
Message-ID: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99806

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.50.0.bb => python3-grpcio-tools_1.51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.50.0.bb => python3-grpcio-tools_1.51.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.50.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.50.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.0.bb
index dbedd4913..1255fd765 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.0.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "88b75f2afd889c7c6939f58d76b58ab84de4723c7de882a1f8448af6632e256f"
+SRC_URI[sha256sum] = "264abafefc3240aacdc6e0c7765a8a20c284f1267ae0dd899084f07694b55095"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


