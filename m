Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbf-0005tf-JE
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:24 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so802834eaa.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=ADZIS1GxSEpCs1c62clAFktGKjjh7MQrPt4PWB2AMzk=;
	b=JO4R/PDz2tXRzVNmKDZ1UsWtd9ycHvIdtiOxHZ8lmxNdtT8q7Uk1nuZrfc7vk/fG2F
	Ft3s3+8aupI+ZkBrs7bvNyht5rdSbAVlWgZMZ8DGLXdbaytw32UUqJjOUWJ6ZeUb1NCv
	N3SZj+3useCEDu/4j/K38xgtEFq1TZcL/ym3RPi2NOqFvs2phu8hPPMputNLf4zaxCRV
	16WKk5Pw8aQO7kNiaZNpRuxsoiz5m6KLRc4rTIuULz+jH7HyiAy0IvC4QYO9lAXqW2pB
	d+x98EVgQDxqPXAIiLWsn88AkUbcUkttX5eED1I9Wv08d0FAaoIFGtkQbOV6zqTizBta
	o/wQ==
X-Received: by 10.14.209.131 with SMTP id s3mr41754120eeo.26.1359301302222;
	Sun, 27 Jan 2013 07:41:42 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.40
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:41 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:17 +0100
Message-Id: <1359301282-5470-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnKtVPEa4JI8sFVnymT4YZA/Le936OnPgKAq1zu7vXnnv/LNaK/RkXoUFKtSGRczIPCzWRa
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/7] libmatroska: add 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Jan 2013 15:57:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-mkv/libmatroska/libmatroska_1.3.0.bb   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb
new file mode 100644
index 0000000..3a3dd0e
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "libmatroska is a C++ libary to parse Matroska files (.mkv and .mka)"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
+
+DEPENDS = "libebml"
+
+SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "f4a8c411f09d39c754eb726efd616043"
+SRC_URI[sha256sum] = "5231ec958571365e719a6fd3c220227af6cf0f14e0bd1bcf766ddbc068d18e69"
+
+do_compile() {
+	cd ${S}/make/linux
+	oe_runmake CROSS="${TARGET_PREFIX}"
+}
+
+do_install() {
+	cd ${S}/make/linux
+
+	install -d ${D}${libdir}
+	install -m 0644 libmatroska.a ${D}${libdir}
+	install -m 0755 libmatroska.so.* ${D}${libdir}
+	cp -a libmatroska.so ${D}${libdir}
+
+	install -d ${D}${includedir}/matroska
+	for i in ../../matroska/*.h; do
+		install -m 0644 $i ${D}${includedir}/matroska
+	done
+
+	install -d ${D}${includedir}/matroska/c
+	for i in ../../matroska/c/*.h; do
+		install -m 0644 $i ${D}${includedir}/matroska/c
+	done
+}
-- 
1.8.1



