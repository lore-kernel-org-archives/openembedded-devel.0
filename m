Received: from [209.85.134.188] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LZ39H-0002x1-K8
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 14:04:35 +0100
Received: by mu-out-0910.google.com with SMTP id w9so974651mue.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 05:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=fxOCpWqNGYSDwmoghcrZAIR4ziXETErlztCeeZ8ySvY=;
	b=sh15rqKgI23yQZwVkbNpxowVmSa4GjP2phzoN0R+FuaAnyvck1Kjd6+l1S6dNYetBk
	Z5xvYzUR0M0qjsm4WtKO198y7t/kKooXozWjpAcjXoRhKP50GVtv7ytINwkcSJZHd8AJ
	izIlXv4qUg2iBELHCrJAOCrUb2fRzklY0Nod4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=QV/t4d+uIs/T5Gw1jWQ+F9GxGl3Hmk6H+exp5gm0VZ5RT22kufRPFeMiyOSIw6did9
	7jWhHknqyWDUXitgVN0PMJqxQzPuAZj0PqiH28gLF+1zRWfZON2PtfTV+Aii6zWkngdi
	qSYGEvxDn0AJk15R01anya98YSUQUzTQiy7w8=
Received: by 10.103.160.10 with SMTP id m10mr1384492muo.50.1234789364082;
	Mon, 16 Feb 2009 05:02:44 -0800 (PST)
Received: from ?10.6.26.234? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 25sm8594361mul.21.2009.02.16.05.02.43
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Feb 2009 05:02:43 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2009 15:02:41 +0200
Message-Id: <1234789361.5643.0.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] ruby-dbus: new recipe
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
X-List-Received-Date: Mon, 16 Feb 2009 13:04:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is a package with D-Bus bindings for Ruby language.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini               |    4 ++++
 packages/ruby/ruby-dbus_0.2.1.bb |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 packages/ruby/ruby-dbus_0.2.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e867c6e..178f45c 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19138,6 +19138,10 @@ sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
 md5=797ea136fe43e4286c9362ee4516674e
 sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
 
+[http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz]
+md5=1f6398d8bbafa272c0b43878fec43276
+sha256=cfcadc4ae860f2de3d6aa1a1230a410b1dedf783148a27a20205bb3b54e3c3ac
+
 [http://rxtx.qbang.org/pub/rxtx/rxtx-2.1-7r2.zip]
 md5=9290b4832d46199f8d798a531209640b
 sha256=31db3852a86105766758975519b27d262407c96cacad4f34ad0de5aae26addd9
diff --git a/packages/ruby/ruby-dbus_0.2.1.bb b/packages/ruby/ruby-dbus_0.2.1.bb
new file mode 100644
index 0000000..40627d3
--- /dev/null
+++ b/packages/ruby/ruby-dbus_0.2.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "${PN} bindings"
+SECTION = "devel/ruby"
+LICENSE = "LGPL"
+RDEPENDS = "dbus ruby"
+
+SRC_URI = "http://trac.luon.net/data/${PN}/releases/${PN}-0.2.1.tar.gz"
+
+RUBY_DIR = "/usr/lib/ruby/1.8"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+FILES_${PN} += "${RUBY_DIR}"
+
+do_install() {
+	install -d ${D}${RUBY_DIR}
+	cp -r lib/* ${D}${RUBY_DIR}
+}
+
-- 
1.5.6.3




