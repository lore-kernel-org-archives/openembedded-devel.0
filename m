Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06150C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 05:13:45 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.5736.1634620423397374380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 22:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AwJsEPb4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634620421; i=@fujitsu.com;
	bh=vzDA0tiBF/iPrUZd91ZBHjPGHHYLw2xbK83yWckRsYo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AwJsEPb4J0rAXp7fySeUocAhOvSedd7MoxtK1An+hk569rUfChPRkaIABHlvNPOqR
	 ozLbbU9LvJSAcUOdkCxvfDziVAm/+o5ViDZN9NKxowz7SIX7AxAu+JSb+kr00kZ6kw
	 7iV5/uKkCX0h06ljaXY7Bp/I3QeFMaDvynawKUpLrDrCGaVLxHyzMMk11O/VYKRNew
	 IxjmPQDFvxp2r6t2VuiWUVXdGWNI1DrAFbrpMUpwyI4qkGunqoTp9paZ4ZpVKSOPaa
	 rSE4FK/GxS6zUUfetaqa9O/whwyZ6JBHxef+N8PsawUP4/q4/6t4Nl7wJioE+GMOiM
	 vgt5zLqpreORQ==
Received: from [100.113.5.110] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 44/2E-07495-5045E616;
 Tue, 19 Oct 2021 05:13:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1WUJyUs
  06LqsZXHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZix/dIi9oFW0YkbTWpYGxvtCXYxcHEICs5kk
  Dk8/ywTh7GGUaFt+kLGLkZODTUBX4tzjtewgtoiAvsTS2XuYQWxhAXeJSxM3soHYLAKqEoceb
  2MBsXmB4l1t3WBxCQEFiSkP3zNDxAUlTs58AlbDLCAhcfDFC6A4B1CNosTs6fIQ5RUSrw9fYp
  7AyDMLSccsJB0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmugaGhvoJVbpJumlluomp+aVFCU
  CZfUSy4v1iitzk3NS9PJSSzYxAgMppZClaQfj71cf9A4xSnIwKYnyXnTNSxTiS8pPqcxILM6I
  LyrNSS0+xCjDwaEkwRsbAJQTLEpNT61Iy8wBBjVMWoKDR0mE978/UJq3uCAxtzgzHSJ1ilFRS
  pxXJAgoIQCSyCjNg2uDRdIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8OSBTeDLzSuCmvw
  JazAS0+KpzDsjikkSElFQDU8/fhpC4m+yRMlqir/Kua5/o8t5iL2Zbvr8t8eK+xr/9L27smHl
  g9w4RI421NSHSlvEvz9c/LZcQsedmFOhiCfpkt9kwYPqvVA+2gKnHhAT+uqoJpfFfErnBlWwZ
  8uegrw6/2YbAAzfVZt5a234g7J1GcOiEp7qiC1ruZl2be8jjnVLwz/VLChl5Y39sS2U4nv3+h
  IRXmcHONTPcpwskCQZU3sz9cOvEzC33brLs7zO6euT3nJ2Wc2ojPfKCNYrmiy5iO2Wdf9GssC
  vmVlpiaN2y/t2rH4g9c/r4yNTUnePo6Tqpj25v9r3qr9PQXbLll/UpNmWT1lB/tZ0u9p0+wW4
  zNihffJYpF693fFqJEktxRqKhFnNRcSIArJ+1UB8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-238.messagelabs.com!1634620420!374081!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19894 invoked from network); 19 Oct 2021 05:13:40 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-22.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 05:13:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19J5DefO019545
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:13:40 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 06:13:39 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nlohmann-json: upgrade 3.10.2 -> 3.10.4
Date: Tue, 19 Oct 2021 22:13:19 +0800
Message-ID: <1634652799-3581-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 05:13:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93459

Note you can support this project via GitHub sponsors or PayPal.

Bug Fixes
Fix regression bug introduced in release 3.10.0 which broke compilation
for types with an explicit default constructor with default arguments.
#3077 #3079
Fix regression bug introduced in release 3.10.0 which treated the
return values of std::find and std::remove as pointers which could
break compilation. #3081 #3082
Fix converting std::filesystem::path to JSON. Before release 3.10.3,
such a conversion would trigger a stack overflow. Release 3.10.3 then
further broke compilation on Windows. #3070 #3073

Deprecated functions
Passing iterator pairs or pointer/length pairs to parsing functions
(basic_json::parse, basic_json::accept, basic_json::sax_parse,
basic_json::from_cbor, basic_json::from_msgpack, basic_json::from_ubjson,
basic_json::from_bson) via initializer lists is deprecated. Instead,
pass two iterators; for instance, call basic_json::from_cbor(ptr, ptr+len)
instead of basic_json::from_cbor({ptr, len}).

The following functions have been deprecated in earlier versions and
will be removed in the next major version (i.e., 4.0.0):

Function iterator_wrapper are deprecated.
Please use the member function items() instead.
Functions friend std::istream& operator<<(basic_json&, std::istream&)
and friend std::ostream& operator>>(const basic_json&, std::ostream&)
are deprecated. Please use friend std::istream& operator>>(std::istream&,
basic_json&) and friend operator<<(std::ostream&, const basic_json&) instead.
All deprecations are annotated with HEDLEY_DEPRECATED_FOR to report
which function to use instead.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{nlohmann-json_3.10.2.bb => nlohmann-json_3.10.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.10.2.bb => nlohmann-json_3.10.4.bb} (92%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.4.bb
similarity index 92%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.4.bb
index d2015771ac..fff32372a4 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=441793d25a658d58d79a1f87516a6ad1"
 SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1 \
            "
 
-SRCREV = "626e7d61e44dee32887126c8f437dd077dec09cf"
+SRCREV = "fec56a1a16c6e1c1b1f4e116a20e79398282626c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


