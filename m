Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id D27036FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:24:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so7336906pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=78edbKIltKd0dFFfaUb/HqCBZmYybjcyqhFmIEYez+U=;
	b=Y48PehNPZozUo7iJw5aoCqeQeajdo3IG0P6sj/7xrSwN0sgr/Anvf7PjIV9VJK0Jp0
	+3o/k15thCdLgTpIqGb3jgJRuKHxNsGwYejKtAL1ruHtN6U4H3SFqM88+ghxxJaN5kEb
	x1OxOoipFEjd8JeBvv3pEXWYghuTA7sfh49GqLTa0p7bjtGwnnQBh1PvAtWKE/jivEXE
	/YTpyf2QbM1Om8d5QBQyjuSOAsbm7ZQsUv/5x3CYNP0xwvx8hBQz0EvJuKiwOxF4aDot
	LM7kuc6gtDriH7OgwHhdmuw3G/WChaOTNPDsXp6ahLxtkFtABq46TQVv/iKwkNGwZI7t
	jURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=78edbKIltKd0dFFfaUb/HqCBZmYybjcyqhFmIEYez+U=;
	b=LYT9Asb59UeS2uFOBbXGeH1kojHphq2YhdDP8Nqk5TJstFvStHCTTuQ+FER8CYLInk
	HErizdnYoxn1Dt9RLgSJJSxYOlI16zSYHuy68xoHYH7dy9fHmcTKQbYFG0FD+hLQLoyI
	Y5E250vchVtt4oY1rxLoZg+c4H1+ugUK+3pXnUd8NVbPBQaAkW3LgqFsFxUib/7iUFR9
	/HRLX7n4B808KxYAUPUG5cB3K7fPpY8jI6sRgleyi09DNUlk+iREX+MQYsZvSOfav0aw
	Wn3wwnbm291bk/23r57Di8HFCL6jLdSlyIQ6yadHV38yrfqpY29mVAhQ2Yo1qgGJBQlN
	Ej0g==
X-Gm-Message-State: AKaTC02HLy7a4JNsYZl7SdMx7aQLI4zkLiaBumrk4TGoIVnPf9N+9BKzK0wwOfZkEzct7w==
X-Received: by 10.99.235.10 with SMTP id t10mr20862816pgh.95.1480141481937;
	Fri, 25 Nov 2016 22:24:41 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53946299pgp.10.2016.11.25.22.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 22:24:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 22:24:32 -0800
Message-Id: <20161126062435.27569-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH V3 1/4] breakpad: Upgrade to latest
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
X-List-Received-Date: Sat, 26 Nov 2016 06:24:40 -0000

* Switch to using git
* Gets aarch64 support
* Define PV and use SRCPV
* increment PE to 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/{breakpad_svn.bb => breakpad_git.bb}  | 24 +++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/breakpad/{breakpad_svn.bb => breakpad_git.bb} (86%)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
similarity index 86%
rename from meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
rename to meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index b573ea5..36c2b63 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -13,9 +13,27 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "r1435"
-SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
-S = "${WORKDIR}/trunk"
+PE = "1"
+
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


