Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C589A71A25
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 06:12:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c17so1232786wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jLzD/qAhp+22gS/KI8WdECyI4YGscFYYHJtt56zSUAI=;
	b=WR6S8WgW1DL9pC24zwzlllYFJdnCb8jj3uTf81UFWz2SB153M8uPyzbqSoq5QfYF0K
	FKsceD4kpL+ZRjjqV8ffNY29UKQxf/Bb9IuVW/WOTbXUc1zl8CJdK2kwCJiXEGbaD88I
	4na9rmWc6lTg8Ri0xxzdGcZDJClgIdMdp01XZx7f6mCiYwIKXItB2WlVYSl5312jJeYX
	9/1Nh6Yr+EpBxAxiod5QG9mtfzbD5OVePu7bo82YCQjNyqmjfBkiMOuPSiJUsESOPoxO
	rziHUgzpWPGp43QYqSuZUSNxrLESv31GqirH17VQS/e3nFOIG0HZ7iMGOL44NxL7ab5R
	DtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jLzD/qAhp+22gS/KI8WdECyI4YGscFYYHJtt56zSUAI=;
	b=ZWjLUwHcm4vl/+P2t/ynMw0ULOxvpN9XAsBQ3RMNmBQwhaE+4hohB30V7UTHkzveVU
	CHU9AZO00RYR5g8QFuAOhdCDuq4XEbngZO4haoCIVgaUtqlZM8T5Yh3uK6kBqksZ6ndj
	eF9bd+4IrYMZ9QPBWL9nHTT5WIxYBTDrObZqc1tAwX8M6fozShAZSzTPSpqNnldVF7oK
	E48H+FceFYd1Zxj6cQVpuLL7r8LvifnMgQ9m2jOdU/4voHbwfOgnuztulu9NNxi61dCr
	uk4FQjMmPYPoatrpZbhjDWwQ1KJug8El9FpHDG7II/hqMJNtkvqmWoK44xGA97j1Oqdk
	qxVg==
X-Gm-Message-State: ABUngvcCT+dXU+ZDZwiEQol7QZ4zpAt8+G0Q0Bw6rPhR1oHb6XdZHfx8Wpn0po57ZYkJwg==
X-Received: by 10.194.0.229 with SMTP id 5mr1724420wjh.55.1478067129070;
	Tue, 01 Nov 2016 23:12:09 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	b184sm1153146wma.0.2016.11.01.23.12.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 23:12:08 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2016 07:10:44 +0100
Message-Id: <1478067044-24649-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libiio: add recipe
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
X-List-Received-Date: Wed, 02 Nov 2016 06:12:09 -0000

libiio is a C library for interfacing with IIO devices. It abstracts
the low-level details of the hardware, and provides a simple yet complete
programming interface.

This recipe provides the following packages:
* libiio: main package with C library
* libiio-iiod: user space daemon providing network backend to iio devices
* libiio-tests: user space test applications using libiio
* libiio-python: python bindings
---
 meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb

diff --git a/meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb b/meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb
new file mode 100644
index 0000000..8c062b6
--- /dev/null
+++ b/meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Library for interfacing with IIO devices"
+HOMEPAGE = "https://wiki.analog.com/resources/tools-software/linux-software/libiio"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
+
+SRC_URI = "https://github.com/analogdevicesinc/${PN}/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "fbd6faa9c420659023072eb3c74ed037"
+SRC_URI[sha256sum] = "b230cfd5ef5550cebf485950d8b1f4d5cfa7d5f0814aeb7b44e530e9caecb83a"
+
+DEPENDS = "avahi libxml2"
+
+inherit cmake pythonnative
+
+PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
+
+RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
+
+FILES_${PN}-iiod = "${sbindir}/iiod"
+FILES_${PN}-tests = "${bindir}"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-- 
1.9.1


