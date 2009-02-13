Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LXzyM-0007hS-TO
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 16:28:58 +0100
Received: by fg-out-1718.google.com with SMTP id 13so474181fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 07:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=LQhQKeQ/EhePVdLUwOGhbZDXqHbVmrtPYv6/7ia3V3c=;
	b=RJ9KGkCZ6OtP0ZBakwbjRaHCeHlGwhuJ/mSd2I1uyb/C/0qVhWt4ZfcVTujsj6Duq3
	pkocAgmCJpm2K8PJgItLQjWCFxqRJfM47snUEQgTqmE5/HPtsEGAXZZzWieERbaTJGr/
	wvUDEcQHG8ABMkeTspimqYNuG2Ndj1/WmxYGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=SFBbOy7IVRrTSa7jAo/bL2gdg+yjc5KF42Y/3TDz+jkM5KYkByP+8yIsaCIQHG/G8j
	2LYX++UTtjBuDX2yZZKYdv9e7/wonhuwVU9wTEPzZC7BRXsyLwLe1uv4a6SXRoBvHVkx
	DbtDdle0aYPPV7P5gtllCPD1KrwmXFpQ4LDo0=
Received: by 10.103.229.12 with SMTP id g12mr1290710mur.16.1234538853127;
	Fri, 13 Feb 2009 07:27:33 -0800 (PST)
Received: from ?10.6.26.234? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id o30sm23871802ugd.21.2009.02.13.07.27.32
	(version=SSLv3 cipher=RC4-MD5); Fri, 13 Feb 2009 07:27:32 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 17:27:31 +0200
Message-Id: <1234538851.24574.4.camel@EPBYMINW0568>
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
X-List-Received-Date: Fri, 13 Feb 2009 15:28:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is a package with D-Bus bindings for Ruby language.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini               |    4 ++++
 packages/ruby/ruby-dbus_0.2.1.bb |   17 +++++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 packages/ruby/ruby-dbus_0.2.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 4e8e0f1..8d508eb 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19074,6 +19074,10 @@ sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
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
index 0000000..a1ce40c
--- /dev/null
+++ b/packages/ruby/ruby-dbus_0.2.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "${PN} bindings"
+SECTION = "devel/ruby"
+LICENSE = "LGPL"
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




