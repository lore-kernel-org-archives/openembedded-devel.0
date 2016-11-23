Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 558CA71A8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:29 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so668093pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2SwM+fWjGHaOefrz4ycMEntEl303zDp4t/FD/dtqqxg=;
	b=BYjiSsStyVBdhFqEJ24kFCddaExAHs+Fbfume1FH4FY04VA4cmdH3gqAnyNH4JKVy3
	Zrk9YoNao4bhMxm4Ztyr95IBmCybbeJB8jlhuSwCrE2hLo7mPaNej4Vi4O2v/5D9U0Kd
	JXhx/migLDHlAlZQQNU5PCPK/2iILIUGrsLjsUTaiA4vboTEl0wfJ2JrIeG119/Y7u42
	89IQ48DBJ0HU53ZC1E0xGA44+AdxPUhmVXP9hNaHzRHSvbhjNhTZIbNT0yxxl3/L5c1C
	4Q1E4WkMxJGXsack+W2KJcEVncTW+UHGu61svZCO9vi1MUisND6wqMVSdP2XQ7lAawEN
	bXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2SwM+fWjGHaOefrz4ycMEntEl303zDp4t/FD/dtqqxg=;
	b=QAWPuY7K+G1nmoy5LnN49lMSPu2nIx1ReH2NYPI3Fc8Wv9lZe7j004HqnYviJOyXyu
	PNIpbgPSbF1k3IPozKGyX9nCdhZ5laqOfL+/XDsFaJLtwjVkEjShhtVucZpHrk2zc/XG
	KM4lZv5SlHcLotWAkWu7ng4AICDkPNJ/zmLoi0CE6Y9bWW/8vItmZ4TwPW3NmiWuyS0C
	UFAbMfTT+ufXjmoI0QRuB95Ay+ttR+mVBENvi9EJjpmbxBYpOn2tvfMeY1NW/mgWnhk7
	I7FU3R/zGjrs8B3u8OEbJH7HLGIhHZ3S15a9L0gIB5S9SC4IzKQTzoWu8bmwXVqOUk7n
	ffZA==
X-Gm-Message-State: AKaTC007k3BOlfNjdwK+9OHYmCMn350EJhmwVN7ZXp+RnyHHj7OGD5DAJL9I7nykr4d/KA==
X-Received: by 10.84.199.194 with SMTP id d2mr4581453plh.151.1479892950623;
	Wed, 23 Nov 2016 01:22:30 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:38 -0800
Message-Id: <20161123092209.23699-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 18/49] breakpad: Upgrade to latest
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:29 -0000

Switch to using git
Gets aarch64 support

Define PV and use SRCPV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/{breakpad_svn.bb => breakpad_git.bb}  | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/breakpad/{breakpad_svn.bb => breakpad_git.bb} (86%)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
similarity index 86%
rename from meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
rename to meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index b573ea5..c0e306c 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -13,9 +13,25 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "r1435"
-SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
-S = "${WORKDIR}/trunk"
+PV = "1.0+git${SRCPV}"
+
+SRCREV_FORMAT = "breakpad_glog_gmock_gtest_protobuf_lss"
+
+SRCREV_breakpad = "2f6cb866d615d6240a18c7535c994c6bb93b1ba5"
+SRCREV_glog = "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
+SRCREV_gmock = "f7d03d2734759ee12b57d2dbcb695607d89e8e05"
+SRCREV_gtest = "ec44c6c1675c25b9827aacd08c02433cccde7780"
+SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
+SRCREV_lss = "1549d20f6d3e7d66bb4e687c0ab9da42c2bff2ac"
+
+SRC_URI = "git://github.com/google/breakpad;name=breakpad \
+           git://github.com/google/glog.git;destsuffix=git/src/third_party/glog;name=glog \
+           git://github.com/google/googlemock.git;destsuffix=git/src/testing;name=gmock \
+           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest \
+           git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf \
+           git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss \
+"
+S = "${WORKDIR}/git"
 
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
-- 
2.10.2


