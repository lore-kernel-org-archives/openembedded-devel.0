Return-Path: <mike.holmes@linaro.org>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3591160233
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 15:49:55 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so2723395qgd.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cZzLfQ3sJX4HAKmlEUW6jsGKIQANjUBTwr13AJLumsc=;
	b=loq19NMPVHozmkFjwXhn6DoGafz6bCoQjoeL0Lz5AJC+mWZvV/LcSH6BTib1aJ3TE2
	J0MqUwScaC9SpPKI5NcGJjujQKv2YTh0JxbIQ0ybtPJ9HekPZ5ROP6KSWYaI4Z5sI2ph
	XD3c0Vmoop0uhGRaPUfJ1mMh0GGX+OUSd+iS5bxDwwAKzNTdUc+DdJL8RY0k2D8fQlFT
	2VsdSWZlWOW7/rC9yrNRPGxqt3eF7CQPwkGK/1AMJqMueS+TsFrKDg9RgSk0pi/YaBH2
	alSsQkflJpWnJVyXxhHPnx+ceVK2bMG3xkTVrX3xVIERcncXy7hl989fXC/e8gnw1czL
	wafA==
X-Gm-Message-State: ALoCoQnselbVekclFR9veI2nfdu43a232tlek1dUcUKsm1yTa9DXt4H1JsfYUzJnw9+LonGyQObj
X-Received: by 10.224.161.139 with SMTP id r11mr56066782qax.34.1413992992210; 
	Wed, 22 Oct 2014 08:49:52 -0700 (PDT)
Received: from fedora1.holmesfamily.ws ([98.221.136.245])
	by mx.google.com with ESMTPSA id
	t107sm13168747qgd.35.2014.10.22.08.49.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Oct 2014 08:49:51 -0700 (PDT)
From: Mike Holmes <mike.holmes@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Oct 2014 11:49:05 -0400
Message-Id: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] add CUnit test suite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Oct 2014 15:49:57 -0000

Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
---
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
new file mode 100644
index 0000000..e869852
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "CUnit is a C framework for unit testing. Test output supports comandline and GUI reults reporting"
+HOMEPAGE = "http://cunit.sourceforge.net"
+LICENSE = "LGPL-2.0"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
+
+S = "${WORKDIR}/CUnit-${PV}"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
+SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF = "--enable-debug --enable-memtrace --enable-automated --enable-basic --enable-console"
+
+FILES_${PN}-doc += "${prefix}/doc"
+FILES_${PN}-dev += "${datadir}"
-- 
1.9.1


