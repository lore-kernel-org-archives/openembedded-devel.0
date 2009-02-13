Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LY1Cy-00079P-Af
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 17:48:08 +0100
Received: by fxm10 with SMTP id 10so2486091fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 08:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=GrGRQ+2YvR5bQQW3wgt+q9J4Tt+QBDO4DeOPAAlQO4o=;
	b=GYmcCw8Xg40mSrBxsGKECpYqyOK9gBMFzbp802xfe66vHrRJ6Z3ZsMR2w+GS+Ep/l9
	8rZdz5S+qIZ7AYdLnC0DZuJFEeNAtAtL0xWi4KFHNEzrNz3E/MCkW09O8eHi45GRRN1V
	w0Mv8mH3Aww1a2sivji9bnh0rKS9bTUW8tssQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=Ynl2A31BONTSxiR45YHGCGH7jJuvkytzbpjvpkC/UGxvlgZ/EXIuH1ZmynsbmsCbRO
	L06LDxLYcKsP8mkX8zV4rPhm/qDR2HuH/YIl0NZtycXeKBTLB8XlpubT29/HKIjQIcVd
	f9Z+ms/a/W9+Wowc5NNiZNsWADipibNGyLpeA=
Received: by 10.102.247.4 with SMTP id u4mr1346598muh.128.1234543566096;
	Fri, 13 Feb 2009 08:46:06 -0800 (PST)
Received: from ?10.6.26.234? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id o30sm24114643ugd.21.2009.02.13.08.46.04
	(version=SSLv3 cipher=RC4-MD5); Fri, 13 Feb 2009 08:46:05 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 18:46:03 +0200
Message-Id: <1234543563.24574.5.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Add new ruby-dbus package
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
X-List-Received-Date: Fri, 13 Feb 2009 16:48:08 -0000
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
index 83bed25..1fd8a79 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19078,6 +19078,10 @@ sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
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
index 0000000..0ffb45b
--- /dev/null
+++ b/packages/ruby/ruby-dbus_0.2.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "${PN} bindings"
+SECTION = "devel/ruby"
+LICENSE = "LGPL"
+RDEPENDS = "ruby"
+
+SRC_URI = "http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz"
+
+RUBY_DIR = "/usr/lib/ruby/1.8"
+
+S = "${WORKDIR}/ruby-dbus-${PV}"
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




