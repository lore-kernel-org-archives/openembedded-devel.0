Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D405CC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:54:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.14363.1669186449559747842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=otOsWnQn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669186447; i=@fujitsu.com;
	bh=/vQJKP7N62Q79F/zr0FQ7+3tfY9gOJ11lumEXVely6A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=otOsWnQnoVBo2LJcnD5IfAv0I3GjWMmA0XZiB6IuolckCjGVhFjG7QF1i9gLdjxkM
	 easzvHmLryiB5UybFZCiXVTCllsRc/rAn9UVXZKE/0x/xkp0JCabw6QPSdJq9nHtLZ
	 Z55Tn9VP20t/QJN3GV4XG+uTmBy1z0955ZEjFM+twD6Hyj3gfNYtsRF1DoTq7OhFMY
	 E68Au0bUXhfZVZ+STUVt+J+i2/XyXhZfoxvSe0NJdKZYOP3GK7nX9saey6TRVFU7AH
	 eZm3Y18tkthYEgFON+NsLP3+nezyeI9ii/EE9F0ixXGnxHTnkw8YIOeX4tW76ZZpy4
	 wZI8PyPtVozOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqNt/uDb
  Z4OgeFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPLthXMBe+5Kx79m8zewPiRq4uRi0NI4Amj
  RMPj5WwQznUmid9981khnAOMEt9777N0MXJysAkoSCzceoYVxBYR0JdYOnsPcxcjB4ewQIDEj
  fmKIGEWAVWJZ8sa2UFsXgF3iX3HdrCB2BJArVMevmeGiAtKnJz5BGwks4CExMEXL8DGSAgoSs
  yeLg9RXiExa1YbE4StJnH13CbmCYx8s5B0z0LSvYCRaRWjWXFqUVlqka6hgV5SUWZ6RkluYma
  OXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYMilFLPE72B8uOyP3iFGSQ4m
  JVFerc21yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeHU2AOUEi1LTUyvSMnOA4Q+TluDgURLh/
  XEAKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXFeDmA0CQmAFGWU5sGNgMXiJUZZKWFeRg
  YGBiGegtSi3MwSVPlXjOIcjErCvF2HgKbwZOaVwG16BXQEE9ARahZVIEeUJCKkpBqYHm6b/mr
  Nu3dvnx3U4O2r5/8a/+DSz9Zth/O8G8Q6hRl3+91m7Vrrqf1zTcHE722VHY2WCv1HLN+1NNum
  BcSeCOKs3r9+vsfL2d+9Ek5GrZl8Y79Y20YZ9T/huUEK5csmTogKeRRm+dXnxMr8s99Ug+Yb+
  Mz1Wb3uh9DmtFzTb38XXhCTPbHr683YfJ/dIb7pPBz82QbelbdXabB+2PY70tU60lg9nEN7bY
  A+x5r3i5c855U/aO51ValeduriV/ysjXtjFOdIShsF8oSdXMf9rWCn34oUBd4z6zSWLL7++Nw
  ce6nDiUoilvqZ2wKq3zRq9eVs38Zf80+m6ULtlUhN8Ttnn3O1ML7/mjCheA6bEktxRqKhFnNR
  cSIA1GaJbUADAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1669186447!100071!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15730 invoked from network); 23 Nov 2022 06:54:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Nov 2022 06:54:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3B84F100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:54:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2FA96100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:54:07 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 23 Nov 2022 06:54:05 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-simplejson: upgrade 3.17.6 -> 3.18.0
Date: Wed, 23 Nov 2022 14:54:00 +0800
Message-ID: <1669186440-3067-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99697

Changelog:
==========
* Allow serialization of classes that implement for_json or _asdict by
  ignoring TypeError when those methods are called
  https://github.com/simplejson/simplejson/pull/302
* Raise JSONDecodeError instead of ValueError in invalid unicode escape
  sequence edge case
  https://github.com/simplejson/simplejson/pull/298

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-simplejson_3.17.6.bb => python3-simplejson_3.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.6.bb => python3-simplejson_3.18.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.6.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.18.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.6.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.18.0.bb
index b836f97fe..ccdd4ddba 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.6.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.18.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6"
+SRC_URI[sha256sum] = "58a429d2c2fa80834115b923ff689622de8f214cf0dc4afa9f59e824b444ab31"
 
 inherit pypi setuptools3
 
-- 
2.25.1


