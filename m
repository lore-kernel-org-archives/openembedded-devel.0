Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFDA7F8F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:01:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w18so18402993wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ur0k9AE+bhkEXULtJBbXbefMy5eUrAVrBNOxU78cmJw=;
	b=Ok5hV73iXR1H39E3V/8t2Gj/gyNkxPhpce7NSzq35/buBJwf+GvHao5i2VXKuaVBur
	F7Rp2Qspr5rNWBJQDgj3p0qqIv1mIdVu+/50cFK8NExm5lCxWOt5FJi9nx3CPTKxege7
	fxOATmv3hMXIYMc8kXfKxj2fOaL5ddfpFRuv+Zb0SfKPiqZI9XZcN79BYV8EeNJUD2bB
	GshHT/o8GHSM35OFB5tVR3ceRZPnFSwW4Ya6Sx6j4t0Jqm6hT5baaAhg8HZ+lHd/p5IG
	LIDy+/NGq+Uknx4L7G8+L5qAIMYAs8iR+HW10DTWx1YGmmM2sAt9nnp3tGC9DdDl2qvj
	+yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ur0k9AE+bhkEXULtJBbXbefMy5eUrAVrBNOxU78cmJw=;
	b=rsR5ewcUoNkGVJZhbInxUuBDRbEs4gdUz2romUbmoMg/I8elKwPihxKa/C6gl/Yn7j
	1R6l6OJbFuZovWjRqvox3uUnzGBCFgVqpYlL4lu4lCfi7y7VpvwdrcuQaZbls4daXlLj
	c63g4JwuQrIeE0sRO0b3KiIi3dvM28DrqMTmrpKpWLfBGYfx5RflBJ4/xj0yIEFxorFl
	Rkh+87XxjEDuhkBjdhcfv/GTp+vlXDiL5w2+3Kfmb8tdHUBGnDuKt5lMUEVLRERbFntF
	fr2rHmZDhAzhFfnSvfXHVZxyY0+Xe0eOmtJfLZXE1FxgTbOP6lZQu2MmUfA8wa/D3RoB
	kEJw==
X-Gm-Message-State: APjAAAWHMw77h35hnhF1rc8cuCFLkAV48nxLqeIrCGrfpzA7+SkLSiTX
	QeZiJG6aYGP6iUDfD5zu72cqzeJ9
X-Google-Smtp-Source: APXvYqw+LLx4+j0NWNkTLPvFr21Dwhh/kFvrgwoN0n5vY/vwIDv/O32qgHkVux72ZQZneGVHR6rqeA==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr24670831wrr.207.1572894090586;
	Mon, 04 Nov 2019 11:01:30 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C365CAC9282E0012A3C.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c36:5cac:9282:e001:2a3c])
	by smtp.gmail.com with ESMTPSA id
	u21sm21916069wmu.27.2019.11.04.11.01.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 11:01:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 20:01:14 +0100
Message-Id: <20191104190114.5076-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104190114.5076-1-schnitzeltony@gmail.com>
References: <20191104190114.5076-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mm-common: build for allarch
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
X-List-Received-Date: Mon, 04 Nov 2019 19:01:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mm-common does not compile anything and just installs scripts/marcros/docs. So
make it allarch and save a few build-tasks.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
index c7d1f2b73..4e69ce3c5 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase
+inherit gnomebase allarch
 
 SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
 SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
 SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
-
-BBCLASSEXTEND = "native"
-- 
2.21.0


