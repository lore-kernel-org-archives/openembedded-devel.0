Return-Path: <p.patat@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC4B36D756
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:59:18 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hi5so8373736wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=G7qo0wy67Q+8H53kfzOMf0fDApX+Fo9A6H7oLeYBmBE=;
	b=Y2tyeGpay8Pu5z4KaXwgYTVYHS2WruCr6Pi0hPYId+ehXh7ie3y7ih/lC+zUgzUN5j
	l9uk8e6vJCtz/DQ9PiDI+BHSn+9EMecuHIBzK46ku4YSfsXv/E8wk2dJHbqZZvZmxJRC
	xEGzlI9uQdXrwShQsSceHVohq/mVoE6T7raKV7hKM9CQaU5L14pylYRYU8VC+E46a/ED
	axj3R9uN78ly+QkyFaNC9zKE9nNQ72nWrlYTv1I2ePjo3pFXgu/56eEe8YFPMwWL4U+i
	j7qinaPHSlVjuUQRi3jGBM6BkPgaJjvwG1+TLDOU95srYEq6Lkm/chON8yHnT4CveeMu
	LB2Q==
X-Received: by 10.194.142.142 with SMTP id rw14mr1674749wjb.87.1386169157794; 
	Wed, 04 Dec 2013 06:59:17 -0800 (PST)
Received: from ppatat-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id
	uc18sm7657149wib.11.2013.12.04.06.59.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 06:59:17 -0800 (PST)
Sender: patrick patat <p.patat@gmail.com>
From: Patrick Patat <patrick.patat@innotis.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:59:10 +0100
Message-Id: <1386169150-16816-1-git-send-email-patrick.patat@innotis.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-perl][PATCH V2] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Wed, 04 Dec 2013 14:59:20 -0000

This recipe build cpan module Crypt-OpenSSL-RSA

Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
---
 .../libcrypt/libcrypt-openssl-rsa-perl_0.28.bb     |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
new file mode 100644
index 0000000..f0c610f
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Crypt Openssl RSA cpan module"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
+
+SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
+SRC_URI[sha256sum] = "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
+
+DEPENDS += "openssl"
+
+RDEPENDS_${PN}="libcrypt-openssl-random-perl"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
+
+S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
+
+inherit cpan
+
+do_compile() {
+    export OTHERLDFLAGS='-Wl,-rpath'
+    cpan_do_compile
+}
-- 
1.7.10.4


