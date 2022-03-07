Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC42AC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:49:46 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.25579.1646653786046912700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JPUv2Af/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653784; i=@fujitsu.com;
	bh=UZtPTnaU29a5UHXzoUytMySD4OHVcTSrCAEQo6+OV3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JPUv2Af/nhDRJYXHnNlKHSoBCf+CiqWJ4nuGQ/2iVNEiJQlKIlI6dii1BKUbhujQx
	 4NFhemlB0TkIMLT1MyNB2tnFRPPuszBQOUwWScP30orQlUXGyHqkcC2kTNXdBNjVK3
	 N2UI1SDd9TBC7mzZwhj1yndkjk0hon86ct32RggYE0CZ+6XXsBNS21cuje8/ZEoqzQ
	 D+lum6VjrJjZ8VfVEZwczeUiP1tE0kEEbO46NowR9oIaBdOlhyjAS9LblFFgvRkCmC
	 0ARqgqgDITnuN4xMjIPJFbSM5g9xWGb0QKYfeZer0vNvkjst2spsk5KkoKmplwlOoI
	 ixT9soKO3ling==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqBv+UTX
  JYE2vocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHgZzNjwX+RiltHu9kbGNcIdTFycQgJPGGU
  OLh6KxOEc4FJYuP0c2wQznFGiY9bj7J2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAjsf76drAaFqD4gpW32UBsXgEniYmrWsHiEgIKElMevgfr5RRwlph6qZsFxBYCquk92M
  QKUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEqqSgzPaMkNzEzR9fQwEDX0NBU11DXyNBcL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIxTihlv7mBs7fupd4hRkoNJSZQ3ZYFqkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3k9vgHKCRanpqRVpmTnAmIJJS3DwKInwHr8ElOYtLkjMLc5Mh0idYlSUEufl/ACUEABJZJ
  TmwbXB4vgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeaZApPJl5JXDTXwEtZgJaXGWrBLK
  4JBEhJdXA1JOczLgwsf/atVZGqYg7dfO0QxJCT/se/XZB/D6jwcn1XNZ8O97G8O44Np2P+Vx9
  jebRncEBUn17Vq1kXO/mHVjm95LtAoebOHPE4uR4Pb5d7OFr3WtnxZeukvg5T4XtTJX4W/nzG
  0Q8D+27pfwv7V1CbOq/h112XT2LJieleiUWc7OoBszZ9cA+bOWxlj1mX1Qrr7heu71A7ljYbs
  2b4uYcB0rvr10X9MG3/vrt9iA7dz3OIywFr+Z3vU0J33Bj55JIFfHK/2z7Z7PnbTMtnnJi6s5
  Dd8qKxGUuB/nFHlxav/eBx+nnv3ewyr14aHT80IR17PH6nDPsZNl4HkYbFrXL/w8PTHuQoB2U
  YBqoxFKckWioxVxUnAgAL97HpF4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1646653783!100758!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11198 invoked from network); 7 Mar 2022 11:49:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:49:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 521EE100189
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:49:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 45E31100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:49:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:49:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-waitress: upgrade 2.0.0 -> 2.1.0
Date: Mon, 7 Mar 2022 19:49:04 +0800
Message-ID: <1646653744-55920-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
References: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95845

Changelog:
=========
Python Version Support
----------------------
- Python 3.6 is no longer supported by Waitress
- Python 3.10 is fully supported by Waitress

Bugfix
-------
- "wsgi.file_wrapper" now sets the "seekable", "seek", and "tell"
  attributes from the underlying file if the underlying file is seekable. This
  allows WSGI middleware to implement things like range requests for example

  See https://github.com/Pylons/waitress/issues/359 and
  https://github.com/Pylons/waitress/pull/363

- In Python 3 "OSError" is no longer subscriptable, this caused failures on
  Windows attempting to loop to find an socket that would work for use in the
  trigger.

  See https://github.com/Pylons/waitress/pull/361

- Fixed an issue whereby "BytesIO" objects were not properly closed, and
  thereby would not get cleaned up until garbage collection would get around to
  it.

  This led to potential for random memory spikes/memory issues, see
  https://github.com/Pylons/waitress/pull/358 and
  https://github.com/Pylons/waitress/issues/357 .

Features
--------
- When the WSGI app starts sending data to the output buffer, we now attempt to
  send data directly to the socket. This avoids needing to wake up the main
  thread to start sending data. Allowing faster transmission of the first byte.
  See https://github.com/Pylons/waitress/pull/364

- Add REQUEST_URI to the WSGI environment.

  REQUEST_URI is similar to "request_uri" in nginx. It is a string that
  contains the request path before separating the query string and
  decoding "%"-escaped characters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-waitress_2.0.0.bb => python3-waitress_2.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_2.0.0.bb => python3-waitress_2.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
index 490dcee6c..99e483962 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
@@ -6,6 +6,6 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[sha256sum] = "69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897"
+SRC_URI[sha256sum] = "ec8a8d9b6b15f3bb2c1a82b8f3929a029c333c35fcafb08c185a9e562d8cc9c2"
 
 inherit setuptools3 pypi
-- 
2.25.1


