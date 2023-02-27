Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493B8C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:14:51 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.85571.1677485684605430280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a6ALJ3uf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485682; i=@fujitsu.com;
	bh=Euwl0sdG3OQ3Ed1CA5BtHj+iq5X+FkEBG5yhihinXBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a6ALJ3ufSx9mRWqBOdsqzUhpZlv9meWleBww20ubbt0BRDUTRRrX9W8K9dv+AhMjY
	 M3tIIeluBovCuaPkQ8Sw08rbbRPMqDbQO92X3jp94Gn0o2jiRFfIeL/UfzRrnp+Z+b
	 cZhjN+LmTWOaGPLtJorryLKYijNY5QUHRd39ooT5+uHutaG6Jixu0tDXoIxgS7k5fl
	 DQryTr6jM+S+/CkPv/Kmv19DAWwzt52KcXQ21DLrLyIFDV40UKPt45YGWstnMnIecL
	 Bj0/IDA2AbrZQvFP2hJdAFe8UwpydsS5GouSA4miW/VOHbGn9YKOxfo7pidXgsLH/e
	 ZnmVSmiT0bjlQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqFuU9if
  Z4Pp1DouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePg3jssBXuEKh7fW87ewDhFoIuRk0NI4Amj
  xLLtkl2MXED2DSaJhV1nmCCcvYwS0+YeZwOpYhOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBH4uyqU2BxFgFViS3d51hAbF4BJ4lPZw+C2RICChJTHr4Hq+EUcJZ4/2kXO8QVThI3O7
  eyQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uhppTKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo3lxalFZapGuoaleUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg+KYUp8jtYLzS91fvEKMkB5OSKO8ipz/JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4D
  yYB5QSLUtNTK9Iyc4CxBJOW4OBREuFlNgJK8xYXJOYWZ6ZDpE4xKkqJ8/IlAiUEQBIZpXlwbb
  D4vcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDcqAWgKT2ZeCdz0V0CLmYAWb3/4A2RxSSJ
  CSqqBKYsjevtsrvV/lPeW37Wab/XzzJPOltyPK4qmXj567OyzG/fVOnk/La8zzlybbNPyQcSC
  d5KVPfvHTSodd37N5hB9plLo4pD1MkUkev/26HXFETHBT48JdvB0FnQFPH+/y2Kyj/a2L+XnB
  H4dOdjUFuH1rkqoK8TQVkZk0T/u16eb/7xsfXrj65e22a+tT2TkCz44NG3CAzGrObNdJH0uO3
  Y6l+wS2pHKKxyhzfNC8+fhSDnH9B3yp6clZrzf2Xqgv0MsU49X0Oz+xM9JFWLP9lqern1oXH2
  EMdrpwbSPKRz/WWYfdM47Xnl3l9guxwaNmp2P7YvLVr/MaTzR23/umMz2mYra8u77hPx23dKu
  UWIpzkg01GIuKk4EAFdOqA5aAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-745.messagelabs.com!1677485681!129355!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32418 invoked from network); 27 Feb 2023 08:14:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:14:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 819FF10018D
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:41 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 74724100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:14:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.2.2 -> 2.2.3
Date: Mon, 27 Feb 2023 16:14:00 +0800
Message-ID: <1677485641-11740-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
References: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101291

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Ensure that URL rules using path converters will redirect with strict slashes
  when the trailing slash is missing. #2533
- Type signature for get_json specifies that return type is not optional when
  silent=False. #2508
- parse_content_range_header returns None for a value like bytes */-1 where the
  length is invalid, instead of raising an AssertionError. #2531
- Address remaining ResourceWarning related to the socket used by run_simple.
  Remove prepare_socket, which now happens when creating the server. #2421
- Update pre-existing headers for multipart/form-data requests with the test
  client. #2549
- Fix handling of header extended parameters such that they are no longer
  quoted. #2529
- LimitedStream.read works correctly when wrapping a stream that may not return
  the requested size in one read call. #2558
- A cookie header that starts with = is treated as an empty key and discarded,
  rather than stripping the leading ==.
- Specify a maximum number of multipart parts, default 1000, after which a
  RequestEntityTooLarge exception is raised on parsing. This mitigates a DoS
  attack where a larger number of form/file parts would result in
  disproportionate resource use.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_2.2.2.bb => python3-werkzeug_2.2.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.2.2.bb => python3-werkzeug_2.2.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.2.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
index 92302f9cd..5565fb4ea 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "7ea2d48322cc7c0f8b3a215ed73eabd7b5d75d0b50e31ab006286ccff9e00b8f"
+SRC_URI[sha256sum] = "2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe"
 
 inherit pypi setuptools3
 
-- 
2.34.1


