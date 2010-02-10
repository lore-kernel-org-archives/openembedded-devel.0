Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068Z-JH
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402474fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=GMctZII+vM0lraYaDFm3qsqTYKFGanImaIcQsdsOTr4=;
	b=HctrnnDLcRi/dtWNtsiCrCcjBs6Ic+5YRZBD23P6x03PR6W4AiL/Dzf2y0ndtWNAuS
	rdQ9+gQEBV8MsB2S4FQu3KYEliufzIlmjgL7j5s47gBXSuPhYGjV+vZTuuBKLoNC21eJ
	knTuEey8UAP52zVneNy7km/cqxnOLnnxOqk9E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fFwYA4Je6ZhOZpBNXPgNQfm/qBUcYhJVB9RSkuIiOhcm9ZWV+c3q1L1Fwm33hQIrK4
	/LOBo4lVZB8A7DOstkhZI56XR7ApAeid6g35O0fGo2AvYqz6BkTRp3/KekR2YrOnUFwP
	eXLtdHselHOcFve/0sgifCpE2LwPuzS6hsEY4=
Received: by 10.223.76.79 with SMTP id b15mr894840fak.89.1265832655535;
	Wed, 10 Feb 2010 12:10:55 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id p9sm2607489fkb.14.2010.02.10.12.10.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:53 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005Ca-8X; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:13:00 +0100
Message-Id: <1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 8/8] xz: add xz package
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
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

xz is the lzma successor
tested with automake-1.11.1, autoconf-2.65

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/xz/xz-native.inc            |    2 ++
 recipes/xz/xz-native_4.999.9beta.bb |    3 +++
 recipes/xz/xz-native_git.bb         |    7 +++++++
 recipes/xz/xz.inc                   |    8 ++++++++
 recipes/xz/xz_4.999.9beta.bb        |    8 ++++++++
 recipes/xz/xz_git.bb                |   22 ++++++++++++++++++++++
 6 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xz/xz-native.inc
 create mode 100644 recipes/xz/xz-native_4.999.9beta.bb
 create mode 100644 recipes/xz/xz-native_git.bb
 create mode 100644 recipes/xz/xz.inc
 create mode 100644 recipes/xz/xz_4.999.9beta.bb
 create mode 100644 recipes/xz/xz_git.bb

diff --git a/recipes/xz/xz-native.inc b/recipes/xz/xz-native.inc
new file mode 100644
index 0000000..bc5e9ff
--- /dev/null
+++ b/recipes/xz/xz-native.inc
@@ -0,0 +1,2 @@
+inherit native
+require xz_${PV}.bb
diff --git a/recipes/xz/xz-native_4.999.9beta.bb b/recipes/xz/xz-native_4.999.9beta.bb
new file mode 100644
index 0000000..c4f0da9
--- /dev/null
+++ b/recipes/xz/xz-native_4.999.9beta.bb
@@ -0,0 +1,3 @@
+PV = "4.999.9beta"
+
+require xz-native.inc
diff --git a/recipes/xz/xz-native_git.bb b/recipes/xz/xz-native_git.bb
new file mode 100644
index 0000000..006b9d7
--- /dev/null
+++ b/recipes/xz/xz-native_git.bb
@@ -0,0 +1,7 @@
+# XZ_BASE should be the latest released version of xz.
+# It can be set in the distro file.
+#XZ_BASE ?= "4.999.9"
+#SRCREV = "HEAD"
+#PV = "${XZ_BASE}+gitr${SRCREV}"
+PV = "git"
+require xz-native.inc
diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
new file mode 100644
index 0000000..f103e68
--- /dev/null
+++ b/recipes/xz/xz.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "XZ Utils is free general-purpose data compression software with high compression ratio.  XZ Utils are the successor to LZMA Utils."
+SECTION = "console/utils"
+LICENSE = "Public Domain"
+INC_PR = "r0"
+S ?= "${WORKDIR}/xz-${PV}"
+#FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/xz-${PV}"
+
+inherit autotools
diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
new file mode 100644
index 0000000..4f0adf9
--- /dev/null
+++ b/recipes/xz/xz_4.999.9beta.bb
@@ -0,0 +1,8 @@
+PV = "4.999.9beta"
+
+require xz.inc
+PR = "${INC_PR}.0"
+SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
+SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
+SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
+EXTRA_OECONF = "--enable-shared"
diff --git a/recipes/xz/xz_git.bb b/recipes/xz/xz_git.bb
new file mode 100644
index 0000000..6c481ed
--- /dev/null
+++ b/recipes/xz/xz_git.bb
@@ -0,0 +1,22 @@
+# XZ_BASE should be the latest released version of xz.
+# It can be set in the distro file.
+#XZ_BASE ?= "4.999.9"
+#SRCREV = "HEAD"
+#PV = "${XZ_BASE}+gitr${SRCREV}"
+S = "${WORKDIR}/git"
+PV = "git"
+PR = "${INC_PR}.0"
+SRC_URI = "git://ctrl.tukaani.org/xz.git;branch=master;protocol=git"
+EXTRA_OECONF = "--enable-shared --disable-nls"
+DEFAULT_PREFERENCE = "-1"
+require xz.inc
+inherit gettext
+EXTRA_AUTORECONF = "--install"
+# XXX: Not sure what i managed to break, but this should not be needed!
+# | configure.ac:460: required file `build-aux/config.rpath' not found
+do_configure () {
+	install -D -m0755 ${STAGING_DATADIR}/gettext/config.rpath \
+		 ${S}/build-aux/config.rpath
+	autotools_do_configure
+}
+# just disabled nls for now
-- 
1.6.5



