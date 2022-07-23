Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7A6C43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:35:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.2599.1658806535888174010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wMaF7IrR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806533; i=@fujitsu.com;
	bh=CmBKFyrSztPO6kSBDk6CwJ3Vf/XRM+zr6pOwuPlHVcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wMaF7IrR3xjfD+W0L5WPmRMXvOaEK78+GxBdL+aQVlBDU9zStjiBAkG4JshTnvfiR
	 FirvIxzfjtPRQXF2BiiGrpQKSKL2EAgNiq92tum+rl5jY5b9/Ja1vsHL1QiMNNcrUw
	 Eo2KQc277QPR+nOHEOBd2CDRmRJUHNL3Y+z1CNeCjEnE/DX9sNCS7K/iDj2rq34o01
	 iWedzmqjID+9zIW/pD8eQA+nL2bESal8I1UIQHQUnF7f4h5NL6hHRqnHj9YToV8uvy
	 FQFBchiGCMnLfC3I4KXTV37ytbbcixJlQ5f4di34HLkK9gUFpOhwlSojmFwP/nYPHS
	 ZMa+rZsMqZ+Tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqMuaeD/
  J4MBTRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP792fWgo+cFXuu9bI1MN7h6GLk4hASeMIo
  8efFBUYI5zqTRNPUFnYIZw+jxNuV/9i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhawkXhyZyVYDYuAqsSbN9PBbF4BR4m5y5aA1UsIKEhMefgezOYUcJK49LsbbL4QUE3/3I
  VQ9YISJ2c+YYGYLyFx8MULqF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWiUVZaZnlOQmZuboGhoY6BoamuoCSSNjvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwDBOKWao3sH4v/en3iFGSQ4mJVHeLZ33koT4kvJTKjMSizPii0pzUosPMcpwcChJ8
  L6Ou58kJFiUmp5akZaZA4wpmLQEB4+SCG9JAlCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qV
  LivHUgRQIgRRmleXAjYPF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw74J4oCk8mXklcJt
  eAR3BBHTEJ+07IEeUJCKkpBqYDgsKSRzjzb33+sQvHhGVh6/27KhoFKt0ZlYJW80f/YG58122
  367rUVYhbZytJvErH1W0HExexHmoRLrM6sH1pYcmMS+f0mTT/f0Qr+rE4sUv9IIuTNnGXfpQ/
  lzyKwEFVcZl972s6hefOSArseacvMG8p07rxWZeM9/lplP51ypcyq7p6pRaG9+Y4Iot2ceEmR
  ZO3azpMWm1SO+hmpsaD2XmHF+tKnLUSOyfbqrJzKVWd/slpr+Yu+HfsbMun2PtZr5/eOnHTfV
  P7Yu8eicqSJ+YLfpjzx2eGKH1jf/8Vnr8uH1HRXv9g+aWfr/71Vo6Bx+2yi4SesXTNy0q61dj
  7yxZiye+/oYMGSGFi1QKlViKMxINtZiLihMBDDSgXGoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1658806532!11607!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17614 invoked from network); 26 Jul 2022 03:35:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:35:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A461E100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 989B8100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:35:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] valijson: upgrade 0.6 -> 0.7
Date: Sat, 23 Jul 2022 13:40:48 +0800
Message-ID: <1658554848-9357-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
References: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:35:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97986

Changelog:
===========
This release includes a number of improvements:

    Memory management improvements
    Shellcheck improvements
    CMake improvements
    Add yaml-cpp support
    Fixes for PocoJson
    Support for time-related format validations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_0.6.bb => valijson_0.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_0.6.bb => valijson_0.7.bb} (96%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.6.bb b/meta-oe/recipes-devtools/valijson/valijson_0.7.bb
similarity index 96%
rename from meta-oe/recipes-devtools/valijson/valijson_0.6.bb
rename to meta-oe/recipes-devtools/valijson/valijson_0.7.bb
index 4bed4a4f10..51b2bb9e0f 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_0.6.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_0.7.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https"
-SRCREV = "2dfc7499a31b84edef71189f4247919268ebc74e"
+SRCREV = "94d3bfd39ad4dca1be0f700b5eea8e4234d0e7e8"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


