Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pay0w-0002MX-Ln
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 23:08:58 +0100
Received: by gxk20 with SMTP id 20so7158722gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 14:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8I6wuC6JllzLqIcAnzae2+/n2fIYxAZGYNQK6FuWqsA=;
	b=i7xnrcbfah8V6v9ZWge+Iq+EO1TyyuE/ugiNeG5UZvX+TgBCHB/ktO3/41MOKHwZO3
	ho2ES6k3JodPqDo1tr/bNaUg3nuJUr2HR4SDY9CCjSXHiX+xpwfvYSfBcuFOoYGqvjnQ
	cmfjKkggd9R6K7dxMr3dJLMxyOO30sxi8KUM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Du9r9XOapA0/evtvP/2ujt0LwUpdmAN2fdPaLuiwXNQ4wvVdEU2AosKpEOn/vpigIf
	s9KdWvt2wm+3ji9Gya57vS8pm5x5l+eHaouXO5bRZcwm5h1cfLckwZzXq+5rGAZkZ+/n
	Pr6EvJyJxcJAwzr+6Y+QKRVJ9wEDeZR4zUMvY=
Received: by 10.236.109.7 with SMTP id r7mr4870464yhg.75.1294351711845;
	Thu, 06 Jan 2011 14:08:31 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 68sm936556yhl.19.2011.01.06.14.08.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 Jan 2011 14:08:30 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jan 2011 15:39:45 -0600
Message-Id: <1294349986-19411-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/2] ocf-linux: add recipe to stage ocf linux headers
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
X-List-Received-Date: Thu, 06 Jan 2011 22:08:58 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* This recipe is used to stage ocf linux headers in the proper
  usr/include/crypto directory structure expected by packages
  such as openssl.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/openssl/ocf-linux.inc         |   23 +++++++++++++++++++++++
 recipes/openssl/ocf-linux_20100325.bb |    6 ++++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openssl/ocf-linux.inc
 create mode 100644 recipes/openssl/ocf-linux_20100325.bb

diff --git a/recipes/openssl/ocf-linux.inc b/recipes/openssl/ocf-linux.inc
new file mode 100644
index 0000000..9d8e089
--- /dev/null
+++ b/recipes/openssl/ocf-linux.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "Install required headers to enable OCF Linux support"
+LICENSE = "BSD"
+
+INC_PR = "r0"
+
+SRC_URI = "http://sourceforge.net/projects/ocf-linux/files/ocf-linux/${PV}/ocf-linux-${PV}.tar.gz"
+
+S = "${WORKDIR}/ocf-linux-${PV}"
+
+# Need to unpack the the ocf-linux.tar.gz file contained inside the
+# downloaded tarball
+do_install_prepend() {
+    cd ${S}
+    tar xzf ocf-linux.tar.gz
+}
+
+# Install the OCF Linux headers so that other packages such as openssl
+# can find them.  The headers must be in a crypto directory according to
+# the README file.
+do_install() {
+    install -d ${D}${includedir}/crypto
+    install -m 0644 ${S}/ocf/*.h ${D}${includedir}/crypto/
+}
diff --git a/recipes/openssl/ocf-linux_20100325.bb b/recipes/openssl/ocf-linux_20100325.bb
new file mode 100644
index 0000000..9dccc3c
--- /dev/null
+++ b/recipes/openssl/ocf-linux_20100325.bb
@@ -0,0 +1,6 @@
+require ocf-linux.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ce5ad54aa94226d496df1f0f3cf0c11f"
+SRC_URI[sha256sum] = "9d17cbd13849939c70699b520280e3b94cf77401cdc131108d4aeaaeea587f6b"
-- 
1.7.0.4



