Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D50E78494
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:21:12 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g13so1024270pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2nM/FAlfDA9Yoc3fCVzD9ppgzMMA6Lue7FPQb0Ve22c=;
	b=gg+D4UPskTNSaqlWL7cYrxCcuUIN0JM6Gf+acr49bP08TgRMM6LonbhNVYu0deq5ip
	+Mp2xc12KLRVMfqWt4pXe43hEOPDXGEwekjHF9id0LuOT+ikYeekZR0uScqA/BaXteVU
	T9Q5Px9bv2noI49+JUFxe5uKDN/ajtiEHS9+uK6Os/e+OFJiu1jA5sH0vWc59OC52gWI
	jLCnwssjVMzWFzlfrDyhxQUyIwdsYnT22m8ShOq9vjOUvAma1o/7ta6wOABuC1bREVG1
	e5lDByfj4wmpt4dqlcnQwnnUuiXX3QPCXRIc8smrhguwxtuAlc9lvnCmRalZOyznA+0a
	9DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2nM/FAlfDA9Yoc3fCVzD9ppgzMMA6Lue7FPQb0Ve22c=;
	b=cKLWEApbWI7ni8BrXC0vjOs5vVkok8+sfg/juZSkeb92Wh+GnbYPNLRmFzL8W0QOW9
	tsEF4G/EVCO+8K51iR8/C5l8t5INZH9IbGCBFXhEJ1z9o2EioWDjoQEB+kdQWY4b/24q
	5Fkr/eDdXG4DgYR2cnq9r0C+YOTZswLXM01mLybNJuGWlXkLtoQLFFiXnEngtKGyYNz3
	C+QV4TjrnQdoLblRbnk/floUeCOTh06s0DInX9YwdzvKvYJkbHbbU3IXzyd/fPc7eEam
	t+mMxDbN4fJo4HGqCEFXemevuiRVSsxZZt0nIQVxB0CGQEJKiCpwxVOoe4TocJTRRpW/
	ke0g==
X-Gm-Message-State: AHPjjUg0WL/A7cdJAg2hyGuRKPYzgk0b3PGI2R8dPmfXrET7s667AHq3
	IO7yVQ6r0l9rAA==
X-Google-Smtp-Source: ADKCNb4wYwRr65FL/dSBXwSWrL/wV3KRLiXuCXP35gYtgNmdV2XUQ8WVQorGay9bB+aATKjYk77elw==
X-Received: by 10.101.89.7 with SMTP id f7mr1041736pgu.25.1504243274337;
	Thu, 31 Aug 2017 22:21:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:c400:6ad5:9d97:9621])
	by smtp.gmail.com with ESMTPSA id p6sm1475937pga.85.2017.08.31.22.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Aug 2017 22:21:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Thu, 31 Aug 2017 22:21:12 -0700
Message-Id: <1504243272-16546-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 05:21:13 -0000

Change LIC_FILES_CHKSUM from README.linux to COPYING as COPYING contains the license info

2.2.9 security fixes:
    wnpa-sec-2017-38
    MSDP dissector infinite loop (Bug 13933) CVE-2017-13767

    wnpa-sec-2017-39
    Profinet I/O buffer overrun (Bug 13847) CVE-2017-13766

    wnpa-sec-2017-41
    IrCOMM dissector buffer overrun (Bug 13929) CVE-2017-13765

2.2.8 security fixes:
    wnpa-sec-2017-13
    WBMXL dissector infinite loop (Bug 13477, Bug 13796) CVE-2017-7702, CVE-2017-11410
    Note: This is an update for a fix in Wireshark 2.2.6 and 2.0.12.

    wnpa-sec-2017-28
    openSAFETY dissector memory exhaustion (Bug 13649, Bug 13755) CVE-2017-9350, CVE-2017-11411
    Note: This is an update for a fix in Wireshark 2.2.7.

    wnpa-sec-2017-34
    AMQP dissector crash. (Bug 13780) CVE-2017-11408

    wnpa-sec-2017-35
    MQ dissector crash. (Bug 13792) CVE-2017-11407

    wnpa-sec-2017-36
    DOCSIS infinite loop. (Bug 13797) CVE-2017-11406

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.7.bb => wireshark_2.2.9.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.7.bb => wireshark_2.2.9.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
index 2f6f7b0..82c25ff 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "net"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
 DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
 
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a4d880554c7f925dafef60fa313b580d"
-SRC_URI[sha256sum] = "689ddf62221b152779d8846ab5b2063cc7fd41ec1a9f04eefab09b5d5486dbb5"
+SRC_URI[md5sum] = "7d5e65efd0714bd6248aa5b36c28320d"
+SRC_URI[sha256sum] = "c8b32c0e7d44a277e737c53d9d142ad3fe4265338f25a7fd8c891f58a7633fc2"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


