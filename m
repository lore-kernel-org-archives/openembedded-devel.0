Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1F37719C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:04:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 128so10028848wmz.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=iYROp/BuNEpVRvYrVhCOyNN6HjZgMLOm6YcPs/L/fEs=;
	b=ZuaApWJLjpKhBVss0nzkjWdGYoNFbPoGLc+v5Eygk38njzk4b/BhAJ0IV+s5ulw/Kw
	T+Lo+GM/6A+oxQgmFlbZHnKhY9FcNuV1X448UTN8AxGT+GVHJvgupFEKMJuCDDzrJN1O
	BSjxkH9sktfIoEeOC5vKh52Ym4OF6MraXnpF8sB+p/mxL/RUnev9eFHoacxHc7aynPNP
	PoaJSvZF7+PQYP7W5p5HvjbdVKhOO5Jj+0wtPhchFy4gWZRsaTGFeLFOabJPKDFR1hA9
	LyCoc1KAu8Um3yf0h54rVgNkxCL/dXSupdkQO6A/Hou5G7NWSAhPrUjnpFs8TXSGuLJI
	PqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=iYROp/BuNEpVRvYrVhCOyNN6HjZgMLOm6YcPs/L/fEs=;
	b=G0LYHPdGOujDu+gU+aD2Nv2VMcyALziAoDuduKFAv3CdwDLfw33Xf3UHRR/sKz3FZ6
	XyY5gyxH+JTzpnw0vWtq1lNj4+/ZrUiJRgJDiJ6ohygJQ4RrG3x0UIbhIfHS406uMh5j
	1cfU+K3ErREUfo0FgYNDSDB4m/rL3P7wbJPwLOjQtoU2ltgqqH4tcVMH1acWxG6P/6DH
	xaoapWQaUbfcTYfOtDlqHFx51Ik/EWqjtoEKktCnJqFMbP64V7cG2J7almKF3Wx9g4JH
	fOXPcATGQbPFC/JI56Pekg1kgc4/kSElqDsFPbnZYP2or5cRjui7kWsvmOqrLjGXVbYx
	NtGw==
X-Gm-Message-State: AG10YOQqL9Qn9PoFeyK2i3/qzcG79YIVIxLPaoyQqnpMKtzOY8HdGgJ9cUIV0odzwczjRQ==
X-Received: by 10.28.227.67 with SMTP id a64mr11094169wmh.74.1454105043011;
	Fri, 29 Jan 2016 14:04:03 -0800 (PST)
Received: from localhost.localdomain (p5B0A0123.dip0.t-ipconnect.de.
	[91.10.1.35]) by smtp.googlemail.com with ESMTPSA id
	yz5sm17335616wjc.36.2016.01.29.14.04.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 14:04:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 23:03:53 +0100
Message-Id: <1454105033-30479-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454105033-30479-1-git-send-email-schnitzeltony@googlemail.com>
References: <1454105033-30479-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] hunspell: initial add 1.3.3
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
X-List-Received-Date: Fri, 29 Jan 2016 22:04:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are at least three different places where hunspell recipe is found [1-3]. Let's
move it to a more common place to avoid further redundancy.

Native extension is required for libreoffice-native in meta-office [4].

[1] https://github.com/openwebos/meta-webos/blob/master/recipes-upstreamable/hunspell/hunspell_1.3.2.bb
[2] https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/recipes-upstreamable/hunspell/hunspell_1.3.2.bb
[3] https://github.com/schnitzeltony/meta-office/blob/master/recipes-support/hunspell/hunspell_1.3.3.bb
[4] https://github.com/schnitzeltony/meta-office

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb b/meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb
new file mode 100644
index 0000000..9e6f774
--- /dev/null
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A spell checker and morphological analyzer library"
+HOMEPAGE = "http://hunspell.sourceforge.net/"
+LICENSE = "LGPLv2.1 | GPLv2 | MPLv1.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=ed3a37b3ba6d6be3e08ab45987cf1b88 \
+    file://COPYING.LGPL;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+    file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
+"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/Hunspell/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "4967da60b23413604c9e563beacc63b4"
+SRC_URI[sha256sum] = "a7b2c0de0e2ce17426821dc1ac8eb115029959b3ada9d80a81739fa19373246c"
+
+inherit autotools pkgconfig gettext
+
+RDEPENDS_${PN} = "perl"
+
+BBCLASSEXTEND = "native"
-- 
2.5.0


