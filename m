Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D8F47774C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:39:45 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n37so4417597qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nf1nfds+msx6o79xhDPown7jCOleP2HaSomQ1+ZLG9I=;
	b=HfdNlqMCN/kh2u38UVWjv0Sw3QiByjLlTaQY1ReUVp0lm9xLx2wvhn+0IUUav9qFCz
	71GI/NM49D0MnJFaGu61DYOORXuhgXGsvW8k+NbhgcF348DLnWsgyINwubR6fYI3eXIL
	Srmrz8gDOlFVAQFda6SNTqxeigDzXj2l7s1pPzzP3Vqi7NzCkxh8gfQouRrasywY7tM6
	o2ODWK+ICCfA+tDbVUFMD22BoaR1Bc3r5+73Mte54UStCZnpViTCM60YarmEww+OCqZZ
	xa5sU1NdajdDBdo87nlH+HanAAbSDt1lcle5cbuPf3DfzFAZKbgvYGlyRYx3eXsF9MVW
	yZrA==
X-Gm-Message-State: AMke39nly/vs5HjPrHjnmsuzyA4kv7TEnssitgxZfiCrU61k2Rp+o/+rHUigRwUx3e7Olg==
X-Received: by 10.237.62.25 with SMTP id l25mr5361353qtf.225.1487979586898;
	Fri, 24 Feb 2017 15:39:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	z139sm5748673qkb.29.2017.02.24.15.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 15:39:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:39:39 -0500
Message-Id: <1487979579-7984-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] system-config-keyboard: fix depends to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 23:39:46 -0000

Resolves build issue exposed by RSS

See http://errors.yoctoproject.org/Errors/Details/132829/
and http://errors.yoctoproject.org/Errors/Details/132855/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../system-config-keyboard/system-config-keyboard_1.4.0.bb          | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
index f52b594..26b4412 100644
--- a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
+++ b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
 SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
-inherit python-dir
 
 inherit python-dir gettext
-DEPENDS = "intltool-native"
+DEPENDS += "intltool-native gettext-native"
 
 EXTRA_OEMAKE = " \
     PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
@@ -27,6 +26,3 @@ FILES_${PN} += " \
    ${datadir}/* \
 "
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[system-config-keyboard] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132829/"
-PNBLACKLIST[system-config-keyboard-native] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132855/"
-- 
2.7.4


