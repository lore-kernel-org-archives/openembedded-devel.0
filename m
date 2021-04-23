Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web09.6593.1619163116889725414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 00:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=leOpPEHb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619163114; i=@fujitsu.com;
	bh=PM99fyHpoPIyp1mMVatOJiZC0lPfDiNM/ZG6gGOFFoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=leOpPEHb+4flf/oMivn9ZT4mZsTEKX96Lg3Z8aUoFY7HRiHwYXxZc3kdTdwBIxEkz
	 kbY8D7sYg5XEXupy6Ll677w6oKQfyjfYXp6eIOrv7DHdCxpsmkUaEKo455ePCcqpeV
	 F8nHtpUqn4ktzDYtAPnGE1gRiNRsRzfxRx+MNk7F/9vVS7TJbUa3G3Se9GYR3Cb749
	 GW5z3Nb1F9/kcL71/2VO9x6KHZIx5z9VxwdQ6VNtmX+9CCE/zw+AvF8HqwdZ/vwdMs
	 3kgdHvVn2Q6R1P0At5vtZZ7b+uzNxvGNBfLQH5OI4nxx4+Y40obroGIIQDWqlxeeQM
	 d0XTJiOLaYAYg==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id E6/82-53303-AE772806; Fri, 23 Apr 2021 07:31:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVfdleVO
  CwfWn1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bWj9OYCh4IVEy5s4KpgfEUXxcjF4eQwGwm
  iYUT3jFCOMcZJbpmLGfqYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFrCRmPH0NDuIzSKgKnF+6
  1S2LkYODl4BN4mOmzwgYQkBBYkpD9+DlfMKCEqcnPkEbAyzgITEwRcvmCFqFCW27zzDAmFXSm
  yfdpZxAiPPLCQts5C0LGBkWsVonlSUmZ5RkpuYmaNraGCga2hopGtoaaZrZqKXWKWbpJdaqlu
  eWlyia6iXWF6sV1yZm5yTopeXWrKJERhEKQVHHHYw3n/9Qe8QoyQHk5IobxR/U4IQX1J+SmVG
  YnFGfFFpTmrxIUYZDg4lCd7UYqCcYFFqempFWmYOMKBh0hIcPEoivAtKgNK8xQWJucWZ6RCpU
  4y6HKsOTF/FLMSSl5+XKiXOu7EMqEgApCijNA9uBCy6LjHKSgnzMjIwMAjxFKQW5WaWoMq/Yh
  TnYFQS5l0HMoUnM68EbtMroCOYgI7Y3dkIckRJIkJKqoFJnD0q/pHfx29THzJ94QxUEg5ZMam
  24r7RRuat5w9e6/rP/yh56+Te69+PRK8Sf8B4pr2i2OLHhVddogIxthFBG0Xyt3U5BHssvPD7
  vIHNum8uCyeY3+uSOebwo2pe1c2VJa+V8h5kHnT5ISf9afHtSdKvTz/9IqVTsVhxSe//W9Vvv
  rWy7f72NubK+2ONEZwqS3bFZ9m25Gh52igUZp31Snow/eYSZZZFp6VPmdZVdzp8XiXyvep5+u
  UEpWcm06d1F73wcF+0W+NH3LX6UFfJs8+CAgIN9jAm5p5a+Nw+7+bP9y+SRcu8nIUuzT+zzOj
  O94hNmzMfxIvcr4/cfsYsZ/KtCs5D7+ftWDNbqVolX4mlOCPRUIu5qDgRABldX7IpAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-287.messagelabs.com!1619163113!562850!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16617 invoked from network); 23 Apr 2021 07:31:53 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-22.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Apr 2021 07:31:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13N7Vmss025291
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 08:31:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Apr 2021 08:31:46 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v2] nss: upgrade 3.63 -> 3.64
Date: Fri, 23 Apr 2021 15:31:38 +0800
Message-ID: <1619163098-7934-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Add the license of MIT.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (96%)

diff --git a/meta-oe/recipes-support/nss/nss_3.63.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
similarity index 96%
rename from meta-oe/recipes-support/nss/nss_3.63.bb
rename to meta-oe/recipes-support/nss/nss_3.64.bb
index b7192a46d1..1863db131b 100644
--- a/meta-oe/recipes-support/nss/nss_3.63.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -11,11 +11,12 @@ SECTION = "libs"
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
 
-LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
+LICENSE = "(MPL-2.0 & MIT) | (MPL-2.0 & GPL-2.0+ & MIT) | (MPL-2.0 & LGPL-2.1+ & MIT)"
 
 LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
-                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132 \
+                    file://nss/lib/freebl/verified/Hacl_Poly1305_256.c;beginline=1;endline=22;md5=d4096c1e4421ee56e9e0f441a8161f78"
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
@@ -32,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221"
+SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.25.1

