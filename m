Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9A7C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:22:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.191082.1673940161466631626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ootd7jWh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940159; i=@fujitsu.com;
	bh=/DWjvP57Z37/94l8d3R7LRjKWk8jkjkEtJM09R6EpiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ootd7jWhiYhEAwq+Qoyw+FeSUiNd+rsvYICARCBjbjs73Vfd/gw1CryQ9ZmgY1hi1
	 jRjkRTgsXw1DK9gf5xM9nF91OB1+HWxP0Dvb6TXHThH2xZcJMQRJSQxmDJ9HN5sphu
	 Wmck5c30GC6ImU/YmQg8fqLC5/oNvCGBQm6OEllBme6MGMPapOfbqvbfljnIPQFzfp
	 592/UWxz4wyNLZ9QgZl/0E1LI6RL61VdKHKsXAWtHalP++LXtu6g/gfwUQR58L3DOk
	 0vtofiYBDAbibAi6rAFsnx9YOpPihyhxFX0MpLQCijS01pFL3gNe14oc3A0YshcIiT
	 6Zo1EOms7Bahg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXe/z7F
  kgyXb+SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oytM5wK1ohUHHywi6WB8bVgFyMXh5DAE0aJ
  vQueM0I4N5gkpnZ/ZYZw9jJKLFm8nr2LkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF797w
  GqEBXwlLh+ZBxZnEVCVeD/tFROIzSvgJDHz4ymwGgkBBYkpD9+D1XAKOEvMOPycFcQWAqr5d/
  wlC0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbz4tSistQiXUNDvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwPBNKU4138H4fdkfvUOMkhxMSqK8J02PJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  D3lBZQTLEpNT61Iy8wBxhJMWoKDR0mEN9wSKM1bXJCYW5yZDpE6xagoJc572BsoIQCSyCjNg2
  uDxe8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8jiBTeDLzSuCmvwJazAS02KPkKMjikkS
  ElFQDE9P36AN17Rw+lT/FODLd024kffZ2qnFW+f52W5fT6ykT9qrPvM3SwWlbfFvZnntNypvS
  fo/L+TK66hY3rq/WvLiZRT16l1ryBq2vxV6PVa5duaD2dcP7tezH9+QK8hgUBC7jTUyOXqfP0
  uUSmLhyn2nCnhvNgme+a+fGicQnrXVtvLx9rrB6uZ+qeeEUnbK2qqMzP38zfObSF74qwfaEdV
  f4x9XrIpfFXbH/fegNx+uQSqu/vdv1yrfMT11T8FnL3sZ7if76l4E8lzL5xWeu52iqOhMc/m2
  dd835+kcnNLdxqL20XlcmGvr5+7ypik1h62c8az5acdoixsx5b9Dhpjl20evaDJYc3hZweZ+c
  EktxRqKhFnNRcSIAfi/3wVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1673940158!378545!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7916 invoked from network); 17 Jan 2023 07:22:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:22:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A26B61000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:38 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 96AC91000D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:22:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-wtf: upgrade 1.0.1 -> 1.1.0
Date: Tue, 17 Jan 2023 15:22:01 +0800
Message-ID: <1673940124-20377-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
References: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100615

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Python 3.7 or newer is required.
-Type annotations are now integrated with the source code and cover far more of
 the library.
-The get_soa() method has been added to dns.zone.Zone.
-The minimum TLS version is now 1.2.
-EDNS padding is now supported. Messages with EDNS enabled and with a non-zero
 pad option will be automatically padded appropriately when converted to wire format.
-dns.zone.from_text() and dns.zone.from_file() now have an allow_directives
 parameter to allow finer control over how directives in zonefiles are processed.
-A preliminary implementation of DNS-over-QUIC has been added, and will be
 available if the aioquic library is present. See dns.query.quic(),
 dns.asyncquery.quic(), and examples/doq.py for more info. This API is subject
 to change in future releases. For asynchronous I/O, both asyncio and Trio are
 supported, but Curio is not.
-DNSSEC signing support has been added to the dns.dnssec module, along with a
 number of functions to help generate DS, CDS, and CDNSKEY RRsets.
-Curio asynchronous I/O support is deprecated as of this release and will be
 removed in a future release.
-The resolver object's nameserver field is planned to become a property in
 dnspython 2.4. Writing to this field other than by direct assignment is
 deprecated, and so is depending on the mutability and form of the iterable
 returned when it is read.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flask-wtf_1.0.1.bb => python3-flask-wtf_1.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_1.0.1.bb => python3-flask-wtf_1.1.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_1.1.0.bb
index 678588265..92d78674e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 
-SRC_URI[sha256sum] = "34fe5c6fee0f69b50e30f81a3b7ea16aa1492a771fe9ad0974d164610c09a6c9"
+SRC_URI[sha256sum] = "10fd267a41b6dee4f433ec8d6507d4cce4f1d71700280cf654a7cdbae6408d47"
 
 PYPI_PACKAGE = "Flask-WTF"
 
-- 
2.25.1


