Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DEBC4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:13:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.101842.1670066012762206591
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e4q1tiSf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066010; i=@fujitsu.com;
	bh=zrsq94Nxd9Dshp20Mn5Ug99ZKTt/fOZ5kdioqaGRpQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e4q1tiSfMKXcE2LHX6i+VT/YQAx1XSG73uCAnWiS1pYGgXyMT+poC3PEVkUJTPlq3
	 +EcbSPzuM+SQp6XeGGfl0HRknFHHt1nQJohsTfdIylnsJSDgNbrUV1hdPqt1YXwELv
	 ASurzKLvFHa8HkAKW0dU7C7LIm59/+6hrKnWPJCT9z4gkb8NlAp/z1Sfjr5jGTTlsG
	 oNBHhkOSKOAj4PoSTMzLbcdBy2UhXGHZ41O0yI3E1Tx43BvHPp6K2SZooK2c3etydO
	 DwpiOEAvm3iMYIu59SKrQtXEZ15KdWSqCq73/NEf9cDzMfyJOkyP6xidPPPvxqbxra
	 cDJh7/AyOT0jw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8OxWTdSvzv
  Z4MgLI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNJ8xSWgt98FQfWTmBtYJzC28XIxSEk8JBR
  4t30j0wQzhUmidXTL7FBOLsZJVYsW8XYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAg0Rb0wFWEJsFKL7j+iowm1fASWLj5QtMILaEgILElIfvwXo5BZwlLt17BjZTCKimb8
  cedoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltUDPVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jW00EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzglOKUgB2Mm5b90TvEKMnBpCTKeyysK1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  G+0dneykGBRanpqRVpmDjCaYNISHDxKIrxdqkBp3uKCxNzizHSI1ClGS461DQf2MnNcvXIFSM
  782naAWYglLz8vVUqcV04PqEEApCGjNA9uHCziLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQ
  S5hUDmcKTmVcCt/UV0EFMQAdt5O8COagkESEl1cCkajBN+E9J/wxGqxcRwcY9VhnnlSMm3org
  3GgwQSclOmWlsexygR2aAZOMP/gJHnG52vBE7t9d2cbkfIPvtlZ+6XM/eAc+/Tyr9FI4z4wmM
  VFb2zvd9eFFrmF/p88pyt8Vu/igvkvsTNtFiwNkf0xsvvRg2yYhj/RXyg6vF82Y73dr5racV2
  3pzu8+PXuQvFK065Xh8Y9cyTeFYu9XcetPmfBIJMHAcsrssEff9rc1vXsXsEf7z/2Lel4ML2K
  Wc33keVx4KD95QodE5pytBk/dtlY/3r0u/vCbg3/+HXP7zP+P/9huk8/uM/IeKC9vVn1scb+D
  VbulcfdxQYMOw8USIU8yhTZtbWJ4/n9b9zt2JZbijERDLeai4kQAK90VHXMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1670066009!49737!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9063 invoked from network); 3 Dec 2022 11:13:29 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:13:29 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 53E37153
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:13:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 47617150
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:13:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:13:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libass: upgrade 0.16.0 -> 0.17.0
Date: Sat, 3 Dec 2022 19:12:55 +0800
Message-ID: <1670065978-24517-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670065978-24517-1-git-send-email-wangmy@fujitsu.com>
References: <1670065978-24517-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99920

From: Wang Mingyu <wangmy@fujitsu.com>

Detailed Changes:
==================
- Fix various parts relating to automatic linebreaking
- Fix rendering when hinting was enabled and fontsizes or scales are zero
- Switch build to a non-recursive setup for improved parallelism
- Improve quality of SSA Effects movement
- Further documentation improvements
- Completely invalid Events are now discarded during parsing
- Introduction of LayoutRes{X,Y} script headers
- New AlphaLevel style override to set all alpha values while keeping the color
- Add ASS_FEATURE_WRAP_UNICODE to allow automatic linebreaks in accordance with
  the Unicode line breaking algorithm instead of ASS' much stricter breaking
  rules. For the feature to be available at runtime, libass must be linked
  against the new optional dependency libunibreak.
- Improve VSFilter compatibility:

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libass/{libass_0.16.0.bb => libass_0.17.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.16.0.bb => libass_0.17.0.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.16.0.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.0.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libass/libass_0.16.0.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.17.0.bb
index 6befd31b8..c052239cb 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.16.0.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 DEPENDS = "fontconfig freetype fribidi harfbuzz"
 
 SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
-SRCREV = "1af6240c5d1e499326146e0b88c987e626b13c23"
+SRCREV = "bef4b43ef1882b77f789f611d9cd24271ccdd65b"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.25.1


