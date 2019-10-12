Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3811D7F63E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 10:18:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 7so12645846wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1WP+x6K/YmuIj7ypSICYkZSvUvBdbRx690rjF3MdvR4=;
	b=JVyJjKzO+uPRDNATT/RYevVoPl1gNXsbiR1DNhe74R5sHOKvMK9oAFV4H4qKDblRO5
	PicC8lGQZ9RugeSjM2qVabOx8ghnL18elis0ByLmjCmhl3WAcCGgG0QV4DmyKUTIaax8
	RMSL3mEFlN4Wvl0qcGVHutlv15LT5iAatF29Hb2tzfNkbxssRufjWA8MxDd3lDaPfwna
	U8FvjVj0N2rExqyVQzxfhIMdhU2ED5hC4gEpUFFV9TvFcQELuOTgTJhfAK2r3W1knEwB
	i9ikshSkUUZ5rj3Kt4sdR28h8qDhi5KXo6kJJZug/WbK162pyOISC3jWRpoBbTSOSHGB
	2kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1WP+x6K/YmuIj7ypSICYkZSvUvBdbRx690rjF3MdvR4=;
	b=DelDwnB0/E+czOR1UKmC/2JEZHPlg24R2agj0gw9tPpZsHwckuMfxplsQCZKibDPQ5
	SFON9a02Dv/6OUCRNzOScpeaDae2tbSo4EFFdixdeyhZVD2M7StSt8hN99AltCboCHG/
	3NogtR/DHik5A51v5m2e+LKVNaoyGXkUS63aqG8sg0UNs6ulV4lstXWP/nHZxupVZH8U
	NIObK5OqnyxqsykjEBGZc8PLUPkC6NcFtldFnP5uwH59N+O3BkBkLRnO+t9rZqx6cMyZ
	GxYcjhMiRVq9sPvgf+UqjJNxA8bTjw4luA2wyytw2iEJxooqnlBK4nklcGJIeSXWgwqo
	N1gQ==
X-Gm-Message-State: APjAAAVknymu8LbFoTIZP+MISQPEUkZDmFk6OimBALfApZgw5HFLIdX7
	KeVnUdECfNE3VdmsGXFfJ7R0mtEB
X-Google-Smtp-Source: APXvYqyHas+QaTy3VAvQ+JHb6Jrs+r0f3HYAnC3IEuDQ+V4xzYgsPkl53cLQUvqwuRrBNM+cicd4/g==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr3156148wml.38.1570875520587; 
	Sat, 12 Oct 2019 03:18:40 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F066E93F10C21FB251A4566.dip0.t-ipconnect.de.
	[2003:f0:7f06:6e93:f10c:21fb:251a:4566])
	by smtp.gmail.com with ESMTPSA id
	r18sm17890486wme.48.2019.10.12.03.18.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 03:18:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2019 12:18:30 +0200
Message-Id: <20191012101830.2794-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] exiv2: initial add 0.27.1
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
X-List-Received-Date: Sat, 12 Oct 2019 10:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* exiv2 lives in meta-luneos and  meta-qt5-extra currently. Soon meta-gnome will require it for nautilus -> gexiv2
  => move it up in layer hierarchy
* This recipe was taken from meta-qt5-extra
* There is a version 0.27.2 but from my experience as soon as upstream will
  create a successor of 0.27.2 they move tarballs from builds [1] -> archive [2]
  To avoid missing sources let's stick on 0.27.1.

[1] https://exiv2.org/builds/
[2] https://www.exiv2.org/archive.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb
new file mode 100644
index 000000000..97116ee2d
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
+
+DEPENDS = "zlib expat"
+
+SRC_URI = "https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz"
+SRC_URI[md5sum] = "56d064517ae5903dd963b84514a121c1"
+SRC_URI[sha256sum] = "f125286980fd1bcb28e188c02a93946951c61e10784720be2301b661a65b3081"
+
+S = "${WORKDIR}/${BPN}-${PV}-Source"
+
+inherit cmake gettext
-- 
2.21.0


