Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF8C2774D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 00:35:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r90so1031018qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 16:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mblCykEcIfHbatI91kBpILrYP/dn7BNIu8zd5CVsf3Q=;
	b=sMnH1habV+vmXL20TC7x1fe4IfZN7pjqbRzYEcuTqwg/dOGML/7or1aJ1Enli3RRst
	zBCsgItEmcuyKaczqde1byee8apcIpoN9C9M3nQhGWIfh+TkiK1vBtYulLxMGHQ6/kMv
	83M+bQHQe/tiBz8bcfZgjEjSI8RktGL6EFGLiMzITJdhIKxy3l8vUuFp0C7GpjZyvq1V
	SVSMkVJUK6bnJns5oAH6COg7F0xfmho7dKY0/Fpa5rJsTgap4/Slm8IQJ/OjCXehIGz/
	L/g9vNoJRixb8DitInJ7MhQG2ThuhkM+qDB9GKVbuqCHnnOMlP2oBZ+jA+21J8HSKq3c
	RjzQ==
X-Gm-Message-State: AMke39kEPM1Jx4PJYZM9Iza8nyoSbBt/sBlKVS2GRIkpCRdDTGn8awi1LoAVZZnLI4mvQA==
X-Received: by 10.55.177.194 with SMTP id a185mr6956114qkf.78.1487896501688;
	Thu, 23 Feb 2017 16:35:01 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	e19sm3755296qta.60.2017.02.23.16.35.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 16:35:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 19:34:37 -0500
Message-Id: <1487896477-18836-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-slip-dbus: update to version 0.6.1
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
X-List-Received-Date: Fri, 24 Feb 2017 00:35:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-slip-dbus_0.6.0.bb => python-slip-dbus_0.6.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-slip-dbus_0.6.0.bb => python-slip-dbus_0.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.0.bb b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python-slip-dbus_0.6.0.bb
rename to meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
index 2714f43..785cecc 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
@@ -19,8 +19,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-SRC_URI[md5sum] = "fb3299d75af1a67ca6679d96ce839da6"
-SRC_URI[sha256sum] = "f47361ec52b608309b83c71905e692b6b363eaf3b8a7afdeff866cd94463ad5c"
+SRC_URI[md5sum] = "a6d8ee96245fc21785d4c1c062c85f2f"
+SRC_URI[sha256sum] = "bc897f1ab6f5b4989f85548799aaeb84fde67bbba18e40341bfe1d7885c2fd9a"
 
 do_compile_prepend() {
     sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
-- 
2.7.4


