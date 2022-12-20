Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EC4C10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:13:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.48738.1671538409831334779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NvRLyHPF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538407; i=@fujitsu.com;
	bh=h7nhh/lQ2Qdzt1iAtJTv7L751miftSvwZhktIc1X5Gg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NvRLyHPFyt4umYPJAdPnN2nnImUZFuisfASzLBaunouL/YvozGf1Gs9k9FmQBaxTx
	 v/NJlP1xTZ8nszKb4XSq2CGuZ9yew7GUVX3B9+mK3kObaIPzPc76WSchVn0XDCdxTG
	 hIJkUMN0BwDE8Q0II4+zbLHLiN3/Ix/znpphX4gtV8jPYFwxxhMVkIqY/GIIP4Rt+m
	 jD4NE3h+xs+slsSEShkhUt/hTktfbHLQl8d/jCC097L030pvw+ttzmRllhUuBYDlqI
	 Dbs4X0PQ98b2Lt8xNRcsaL9RfhzPFZr1O4UCMWDN4y/Utyky/kNYGYxfcD+8bkpXNb
	 ehX5QeIdEW1hw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORpPt82cJ
  kg1eHhC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow9i9YyFawSrbh94SV7A+NNoS5GLg4hgYeM
  EhOndjBBOJeZJHpWzYFy9jBKvO5dxdjFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICDxJrOOWD1LAKqEjvur2EBsXkFHCXWXbsLVi8hoCAx5eF7MJtTwEni5pGLYPVCQDVbfk
  Ls4hUQlDg58wkLxHwJiYMvXkD1KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2iol1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvinFDNN3MP5c9kfvEKMkB5OSKG9Y+MJkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8M
  xYB5QSLUtNTK9Iyc4CxBJOW4OBREuHtmQ2U5i0uSMwtzkyHSJ1iNOa4euXKXmaOmV/bDjALse
  Tl56VKifM2LwUqFQApzSjNgxsEi/FLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5u0Cm8GT
  mlcDtewV0ChPQKYcuzQU5pSQRISXVwDRRVv7NOaF9U6/2JSg7mHCViuqHOL6Qnza594YLx4m4
  pvabfmqrDeeyFljfKTnQsLt2E8/xV4vuLLoYcGXjvKslTTkLkqU92UOXb6vZGJ8toLJMYq3JZ
  F21x8ZPPK4aKfEXSeZ+lGZbdfHrnchHfZKdcmJ/Z9aHtG9jsepwKl8R+2SzmVGtxxyWpJvijv
  Hpx9fu3qimfSmEQ07Cz9f3xdzt8RVtRZY/1e2zZ31bt3X3m9uSzSxV0o4KB61nPz1jZSjmL83
  Ncy7cue+QgyqDlgmzzcX1ER45N/+Yl0gs/pl0OdlKOF3Iwfb3ib7VNzy4lu7UKd1+JvG4w2Pb
  H9bnc+ZUqLEu37lpxv1ZX86fUGIpzkg01GIuKk4EAPt5K9dsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1671538407!269723!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30814 invoked from network); 20 Dec 2022 12:13:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:13:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E13A41AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D65907B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:13:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nanopb: upgrade 0.4.6.4 -> 0.4.7
Date: Tue, 20 Dec 2022 20:12:43 +0800
Message-ID: <1671538363-7066-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
References: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100134

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fix comments generation for submessages (#788)
 Fix handling of spaces in arguments passed through protoc (#810)
 Fix problems with multiple files and mangle_names option (#783, #820)
 Fix generator error when using M_STRIP_PACKAGE without package name (#795)
 Fix compilation error with fixed size array and FT_POINTER (#630)
 Fix wrong format in Python Poetry project file (#811)
 Fix unnecessary generator message when using --quiet (#831)
 Fix enum_to_string with C++ (#838)
 Fix /* */ inside .proto file comment
 Workaround python-protobuf version issues (#787)
 Safeguard substraction in pb_read() with custom streams (#697)
 Always include pb_release() as function, instead of macro. (#802)
 Allow using = instead of : with generator option -s
 Allow specifying include format without special characters (#810)
 Allow including headers from inside of extern C (#814)
 Add option NANOPB_PB2_TEMP_DIR to store nanopb_pb2.py in a temporary dir (#601)
 Add compile-time error message for when PB_FIELD_32BIT is needed (#680, #827)
 Add --c-style command line option for naming style (#199, #533, #791)
 Add --protoc-opt to nanopb_generator.py (#628)
 Add ENUMTYPE convenience macros (#803)
 Add Bazel build rules (#360, #500)
 Generator: keep order of messages when possible
 Test case improvements (#792)
 PlatformIO build rule improvements (#808, #809, #819, #834, #839, #840)
 CMake build rule improvements (#822)
 CMakeLists: use protoc wrapper script by default (#769)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nanopb/{nanopb_0.4.6.4.bb => nanopb_0.4.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb_0.4.6.4.bb => nanopb_0.4.7.bb} (93%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.6.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb
similarity index 93%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.6.4.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb
index 691bbce9a..897caea2a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.6.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 DEPENDS = "protobuf-native"
 
 SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
-SRCREV = "afc499f9a410fc9bbf6c9c48cdd8d8b199d49eb4"
+SRCREV = "b97aa657a706d3ba4a9a6ccca7043c9d6fe41cba"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


