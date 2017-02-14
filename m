Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F30F731CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 12:18:03 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id i10so27438818wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 04:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eM1dGrugqIOxlg+RlNLhMefgr3j/aWaQWao5uSzXSEM=;
	b=hFSGowlRBH1UGIfrdDeQvCu4dU2skftTIxrwxkCz32HQXr1dxg0H8q2Px7ZHnoGvlP
	yYU/wO8lIE99IFVVBRK1yntQHAbwRthW1n3Fvm/dRWjsKCxSPEdDwblTMP+GhEaflNLl
	hQwR8Jfnl2dZN/vqB2ULMvLGQrUgqAn9ZI+mlBobUSdc+sqoukAW75SURa6YoxHDwJs5
	i5lHLl4voW7MTHFZpSWF0c9xHZlGhL2WeQ4k0Edr7Iv5E/Oyf6RR8QwqDBP4hTYjIUKH
	ATzrYdfeija6PF7Sq3hxXeocQGb3osizdmOMcmtc6rtcENesMUQf6kI2VG2cPJ7++5u3
	JD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eM1dGrugqIOxlg+RlNLhMefgr3j/aWaQWao5uSzXSEM=;
	b=Bl0ohWUbBsQ3bNdRlhAtdTqSPerW/OHGXSzJQoZ2hmJBzeAPjRnJGUtgu2tocjPx4z
	PUEBVDFd7PCXLfWvaz3fnBED620/K33iTbYZzDQZi8q4LygOAR6SFxRMwUqq3VpBtiur
	7miMM2qi/xCsxX2LhWGokmbiub9jOlG0Q/I7LHjf7C4e0LsmJLFtS7NNHZTjXonOGJmM
	MiivU/2IWSLFuBd/umUAIXPg06CDaqzHBbCviILZ6vIxnvIqJHbX7NsJ/fMzb3CmKdSr
	ps2pZ34IEuBLUlWTx1WRS+kwC2Bmf5S10gGg1V0TlJgxiyqq+IasySsHCma/Ws+RPGxI
	+scQ==
X-Gm-Message-State: AMke39lYn11OPaqbZwh5erU3Mp68sFU/4V7+mGLz+aukJsMhDWYEXkvyiqHai/VFf6/5+A==
X-Received: by 10.223.150.58 with SMTP id b55mr25288335wra.192.1487074684060; 
	Tue, 14 Feb 2017 04:18:04 -0800 (PST)
Received: from localhost.localdomain (ip-213-127-11-0.ip.prioritytelecom.net.
	[213.127.11.0])
	by smtp.gmail.com with ESMTPSA id k70sm3300455wmc.3.2017.02.14.04.18.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 04:18:03 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 04:17:58 -0800
Message-Id: <1487074678-374-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] libuv: update 1.10.2 -> 1.11.0
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
X-List-Received-Date: Tue, 14 Feb 2017 12:18:04 -0000

Also add support for -native, remove redundent definition of S and
rename the file in DL_DIR ( v1.11.0.tar.gz -> libuv-1.11.0.tar.gz ).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../libuv/{libuv_1.10.2.bb => libuv_1.11.0.bb}                 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.10.2.bb => libuv_1.11.0.bb} (59%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
similarity index 59%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
index fbdbeaa..0a5846bb 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
@@ -4,12 +4,10 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
 
-SRC_URI = "https://github.com/libuv/${PN}/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/libuv/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
 
-SRC_URI[md5sum] = "6e16d1d1ca464add0730d637effb1c1c"
-SRC_URI[sha256sum] = "2d740a2adea0f1a19058626f55a076ac41a4ac1f95d4e57cae0c8a634a6cd63b"
-
-S = "${WORKDIR}/${PN}-${PV}"
+SRC_URI[md5sum] = "15550a9f5f45f7f32ae2d9bb0a21a2a7"
+SRC_URI[sha256sum] = "6ec7eec6ecc24b1a8ffedebedb2fe9313fffb5410de89aaf784dd01080411c7a"
 
 inherit autotools
 
@@ -17,3 +15,5 @@ do_configure() {
     ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
     oe_runconf
 }
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


