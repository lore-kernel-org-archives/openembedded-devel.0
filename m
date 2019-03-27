Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id ED15A7D15B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:36 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g3so15631266wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zCW5LotEuK5UM4y8Zr57+CJJDdyRsaao9TKsAptH4MM=;
	b=C33RmWjnYthlCFG80/8fXy/TGzWDyt2yWZoScnVmBj1+o0A7l/8db+uxIm5uMiK/st
	neyE7aZNvUKg4Nu3gCD18Tq6zKK8tiYTwl/LeoBQX/oGFeCvcy+A6ZiVLKYdHc5vsu2A
	+ZPkrXJLOfp+acJDcQgEg1VCiq6hiUoOUvDQi0EQv2C7MNUApTZANedDP7T8cebdz+PQ
	OoYm/LNK+SZvWpKQ3w3YHwE6FPkNxPu1GM83oOfHfwUhoUCb9kLrcT2EXQaTrbB11FH9
	koW73u9B9ZdrJeKuUvM42jiE+QrlBR97TX3otnBL4zmFSDvCMlTiB3/2uU4qQJxuSk1q
	YB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zCW5LotEuK5UM4y8Zr57+CJJDdyRsaao9TKsAptH4MM=;
	b=RBy7HlCx6R0id25MBrW4N8+fkY0Mn9XCAbJbDVcXNcrLsUtKdPn1ZoO4mpCAmV1B1w
	ZOm4qnZ6uy7CTP3AIRGXcRVZmEKQWyD0APWBEWE+jefXEYRmkuOEimKCJW77FtYBxMT3
	Hsbn73CRRLyewKc2/j6Eww5H7bB2oHft37s3WDKXVDXyeIYC0ugmi8YN8goZqvccZ1qy
	E/3D0J9YohA8h1VWwhuZvxB1dakrJs/1xuQlNhYGWl6ka5yoqNIJxc2IpDHTtvZMRb6R
	efX8/ROno+tXMMpK8dh/9XvmiiTV3h5p6Rbh2p8OKtAynAlWFdJswIlguwTsBEmtue6v
	2k7g==
X-Gm-Message-State: APjAAAUtcz3sV8LqJM7DEsXVN/RQ0k+A6mNg9xY5+U0GkFlnspnvFA7Y
	vKPdo86Gjnx+kfCv9astneTd0e5g
X-Google-Smtp-Source: APXvYqwALrH1jPUiGLsXmBK5Z0Cq1UVQebn9O4wFu2pUMQ2ckxTCBB9sdYTG3gMZVMk5VMFFJ5ZbPQ==
X-Received: by 2002:a05:6000:1209:: with SMTP id
	e9mr4342146wrx.35.1553700937541; 
	Wed, 27 Mar 2019 08:35:37 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:02 +0100
Message-Id: <20190327153509.23928-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] itstool: initial add 2.0.5
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It lived in meta-qt5-extra for a while (don't remember why - it was not used)
but now we need it for upcoming gnome upgrades.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/itstool/itstool_2.0.5.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/itstool/itstool_2.0.5.bb

diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
new file mode 100644
index 000000000..b74d5f607
--- /dev/null
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
@@ -0,0 +1,22 @@
+SUMMARY = "ITS Tool allows you to translate your XML documents with PO files"
+HOMEPAGE = "http://itstool.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
+
+inherit autotools python3native
+
+DEPENDS = "python3-native python3-lxml-native"
+
+SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
+SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100d4b308"
+
+do_install_append() {
+    # fix shebang of main script
+    sed -i 's:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/${PYTHON_PN}:g' ${D}${bindir}/itstool
+}
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "python3 python3-lxml"
+
-- 
2.20.1


