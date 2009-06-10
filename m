Received: from [91.121.247.18] (helo=posta.altrarete.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ottavio@campana.vi.it>) id 1MEIGT-0006C9-SC
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 09:30:31 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by posta.altrarete.it (Postfix) with ESMTP id C0CAD57C08F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 09:20:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at posta.altrarete.it
Received: from posta.altrarete.it ([127.0.0.1])
	by localhost (posta.altrarete.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ru8lF3CD2eZW
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 09:20:49 +0200 (CEST)
Received: from computer-di-ottavio-campana.local
	(host18-88-static.184-82-b.business.telecomitalia.it [82.184.88.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by posta.altrarete.it (Postfix) with ESMTPSA id AAA4257C045
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 09:20:49 +0200 (CEST)
Message-ID: <4A2F5EF3.1020103@campana.vi.it>
Date: Wed, 10 Jun 2009 09:21:23 +0200
From: Ottavio Campana <ottavio@campana.vi.it>
User-Agent: Postbox 1.0b12 (Macintosh/2009051120)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: patch: update live555
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
X-List-Received-Date: Wed, 10 Jun 2009 07:30:32 -0000
Content-Type: multipart/mixed; boundary="------------070508070209090802010104"

--------------070508070209090802010104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I wrote this .bb file for the last version of live555, because in OE 
there's a version of 2005.

Since live555 Makefiles are not managed with autotools, I'm not sure the 
recipe if good enough Can you give me feedback please?

Ottavio
diff --git a/conf/checksums.ini b/conf/checksums.ini
index 0c12269..c3b9994 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1,3 +1,7 @@
+[http://www.live555.com/liveMedia/public/live.2009.06.02.tar.gz]
+md5=088f848b64cef1d54034bc24cfa3c156
+sha256=66c54241bfcc7ea42fe40e1c93739be79a3c065390c4163c0f2647ac45c24758
+
 [http://www.directfb.org/downloads/Extras/++DFB-0.9.25.tar.gz]
 md5=c6a2705f6210d8ede50a947b375f1c0b
 sha256=b3dbf01563dd60d63cff543ea8cd0c885381e78ecbbab8ff176e46df3f198a88
diff --git a/recipes/live555/live555_20090602.bb b/recipes/live555/live555_20090602.bb
new file mode 100644
index 0000000..8d1a314
--- /dev/null
+++ b/recipes/live555/live555_20090602.bb
@@ -0,0 +1,42 @@
+# live555 OE build file
+# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION = "LIVE555 Streaming Media libraries"
+HOMEPAGE = "http://live.com/"
+LICENSE = "LGPL"
+SECTION = "devel"
+
+SRC_URI = "http://www.live555.com/liveMedia/public/live.2009.06.02.tar.gz \
+           file://config.linux-cross"
+
+S = "${WORKDIR}/live"
+
+do_configure() {
+	cp ${WORKDIR}/config.linux-cross .
+	./genMakefiles linux-cross
+}
+
+do_compile() {
+	make
+}
+
+do_install() {
+	install -d ${D}${includedir}/BasicUsageEnvironment
+	install -d ${D}${includedir}/groupsock
+	install -d ${D}${includedir}/liveMedia
+	install -d ${D}${includedir}/UsageEnvironment
+	install -d ${D}${libdir}
+	cp -a ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
+	cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
+	cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
+	cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
+	cp -a ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
+	cp ${S}/*/*.a ${D}${libdir}
+}
+
+do_stage () {
+	cp -a ${D}${includedir}/* ${STAGING_INCDIR}
+	cp -a ${D}${libdir}/* ${STAGING_LIBDIR}
+}
+

--------------070508070209090802010104--
