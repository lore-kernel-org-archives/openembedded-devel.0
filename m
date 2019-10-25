Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 792627FA57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w9so861497wmm.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cisQLBI5hQHTlIRBv2dGajCnY9QfAgyxzoCsl4429G4=;
	b=eRdoaZqeuSoWc4R+aqbTr/7e0fmYbFPbFQ8FPXfi8DXzZ1sSX0i1QztUh1YmXDYJK8
	gHphlShZS/s7dZUS/Tso+DnPB2jqlkq+bbdUJWioYm3OI8TbRe1RxtvYey5FoJG28pMH
	e2PE8eqbrIHfIb0cDz4WIROXLvH3DyanJ9q/yIPgaMaFay8Kfofbx61GG2P1BhbnU7Cr
	N/IVnlX6bc8/mbQjLSTSWaGvP2hOL7DAW7c6aDDeeX6bA7WKDb54ZCxAgQCE0NFwx50R
	iuX8EhEZw0cv2NpD8XCXGCxXgJDgRC1CXEqRdrrhfWvSDpeWLra/+y+iuHW+/LXs2PG7
	eD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cisQLBI5hQHTlIRBv2dGajCnY9QfAgyxzoCsl4429G4=;
	b=jWK5yyxG3vo0wCJoQCgIzwHcgJjSuttxmW1MIIBSJC5hWkJ4WLFWWJMSaEwXK89/V0
	W9ekVmfNMpqhXfO9POQgJxECAarO2XDRI8xQxAyknEd+qh7wehrDT0HO5KM0WAKKPeFR
	VMfrp9pVUc/V6LbPpbvlUvjC0jjVobkMW+sOAm4b0sYH8CeKPiIWFZxH+v/wYhsPQ6Jp
	/QIjccF4Ic3WR7dIoasVflWR50TesgmWvVWWtWEHIyoHZthCTBf6TYzjbOD89b/gTYuW
	23sPwCL4ivNXNdv4PsqwH4UsB7nEulygBCgSBV5dvlj1CMoz9kV8NI/f7BLenGxl1eCY
	eDcA==
X-Gm-Message-State: APjAAAU5HjCayJmLqSp6mxk7JVPZlsHy6A+dWGOpiBJmq30LrnE+KfGL
	hi9X4VVyM6sOmYH4YGpgPbaxEGVe
X-Google-Smtp-Source: APXvYqzCP0tlBIk0rwEtcAIOtqEIbSrswKUs//q2egSV7PgCACO0uD4uYbxMyJJ+1kpC6CM/LEe6yw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr77006wmi.106.1571988096955;
	Fri, 25 Oct 2019 00:21:36 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:09 +0200
Message-Id: <20191025072113.11172-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/15] libsigc++-3: initial add 3.0.0
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It can be installed parallel with libsigc++-2-0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libsigc++-2.0/libsigc++-3_3.0.0.bb        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
new file mode 100644
index 000000000..3c0330f50
--- /dev/null
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A library for loose coupling of C++ method calls"
+SECTION = "libs"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
+
+DEPENDS = "mm-common"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsigc++-${PV}.tar.xz"
+SRC_URI[md5sum] = "6ffe924f1d8624b5716468cde67dc03f"
+SRC_URI[sha256sum] = "50a0855c1eb26e6044ffe888dbe061938ab4241f96d8f3754ea7ead38ab8ed06"
+
+S = "${WORKDIR}/libsigc++-${PV}"
+
+inherit autotools
+
+FILES_${PN}-dev += "${libdir}/sigc++-*/"
+FILES_${PN}-doc += "${datadir}/devhelp"
+
+BBCLASSEXTEND = "native"
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.21.0


