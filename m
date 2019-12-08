Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 145DC7FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2019 06:30:28 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ep17so4483107pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AxUJJE4uj8iDu83VvqCxCpek0+Qd2f9ADy0Y04OynjA=;
	b=f/reZvOvgVQ21NU6W9VIro8+mHtOMZg1tsCkpSptiwIxuei5JP5V9ugaM/Ithin+yF
	7fT3hu44SYbIhsWrr7OcSteDlUBoM0A0qx+DMPvBQL1UrkOrk0W/PicMJXT4LSGeEGJk
	tWxwk2Ob3BuiKG2UG6N0JoA/dVPZ9o2ZR5HTdXo0C3SaPQ7UgXJny8jc/Fy/5gHgcDat
	PbdngCO40BAIUsOG1j7rQWYvDCSt4w9A+CxUynrCL3DciHYasjXtCr+5OBFth2nzvi73
	zu6u4Kh+DNd9MKMp3OKl1pTIa5hmjnzM1DQuDj5qun0JVFT4VDPvnnoZUeo7yBTzrRAl
	8pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AxUJJE4uj8iDu83VvqCxCpek0+Qd2f9ADy0Y04OynjA=;
	b=IaYY4YFNDO3vgxInDuaa07zj6fKele7EtHVyhdCuf6JahehhTqBZlZzFHdwx9CvGSg
	edB/b54niZ7dBRDGXH1E13yd4heHvBR3eH8H0BRQi6GEJ9oBU+8p/GYtQ52/Ue278ctD
	pEUZBXGlpVAwgU5zFnhbpgR4JsSvJbZSL00xE2/ebionYN389xb5Q56w01EfcwVTXKVm
	7iVOPMNhW+9oT6XAaAr1ZtGwMxqQM8SOhGPdH98WI5zICawLATN96rNTi+UbWgzFWEuV
	yxMpQfI5AprVfZJeWTloJOL+IFrlBENOOPQpfi7XlJjlA8YcApzQKEOMTQBxMcWP5HHf
	XnIQ==
X-Gm-Message-State: APjAAAW2TjvGdxPFdDaQ9e/KlZMZZaUL6Jz1zilwHMsi6vhYoqPsWTfi
	KH8s3Qeooc/g/OsX14cljzW6RAHGp7g=
X-Google-Smtp-Source: APXvYqykMDzMnLfnL7vvTiHRmu+W6/J8pgD5JlbuG+Hxby2Kq4qpDPERKhRxOKkMvtalxzJj8hSJdA==
X-Received: by 2002:a17:902:7e4a:: with SMTP id
	a10mr23775207pln.200.1575786629406; 
	Sat, 07 Dec 2019 22:30:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id v16sm8408309pje.1.2019.12.07.22.30.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 22:30:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 22:30:18 -0800
Message-Id: <20191208063020.3592797-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/3] sigrok-cli: Update to 0.7.1
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
X-List-Received-Date: Sun, 08 Dec 2019 06:30:29 -0000
Content-Transfer-Encoding: 8bit

Package /usr/share/icons/hicolor/scalable/apps/sigrok-cli.svg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Package missing svg file

 .../sigrok/{sigrok-cli_0.7.0.bb => sigrok-cli_0.7.1.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/sigrok/{sigrok-cli_0.7.0.bb => sigrok-cli_0.7.1.bb} (71%)

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
similarity index 71%
rename from meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
rename to meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
index d31bcd282f..2293f142b3 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
@@ -13,6 +13,7 @@ PACKAGECONFIG ??= "decode"
 inherit autotools pkgconfig
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
+SRC_URI[md5sum] = "3f45ce664bad529d8b3f78a61b017d75"
+SRC_URI[sha256sum] = "f52413429f47d457c333db0fd068416ab7a3f9e35ca76de8624dc5ac6fb07797"
 
-SRC_URI[md5sum] = "77cb745e2fa239c7bd1ea81e2d67ede9"
-SRC_URI[sha256sum] = "5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c"
+FILES_${PN} += "${datadir}/icons/hicolor"
-- 
2.24.0


