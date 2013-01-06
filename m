Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXI-00036u-He
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pa0-f51.google.com with SMTP id fb11so10095734pad.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=EFaDO/OO0IFZHbSng98MQovVLsQ/IVD6iO7iTTkp6Cg=;
	b=NmqACEisxbSeoObFqhyiHFN68LtgUuhWMIaoTmUGRrPd8OkynXzSrHKlYo2MFaB2W1
	AyPr/EFiD/JI+k5lzq5sZMS6shKhs740k87z6q5Rk93eosHnNce4spVe9lZC72qvRzrn
	+6tTKAWeJaGTYJX8h32dreyIzegbAy2mPWNQj9FdBG/nqyRzXh64oaCzl1UFD8OsElCV
	b4sd5SY/Qyb1p84xul09kC/c4tKn92HbZGj2N0WMLfD9zAHoxgaDP0HfncG6XsP6KR5s
	GwVJYcGZ1Jd92OwQCy+hbmqiD4wSlfMRv/q0ad6vSAJ5vbHKUbgTlyzkYYKKUOYkznuN
	3ZJA==
X-Received: by 10.68.233.201 with SMTP id ty9mr179777704pbc.14.1357463628318; 
	Sun, 06 Jan 2013 01:13:48 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:38 -0800
Message-Id: <1357463568-26241-15-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 15/25] dmidecode: Forward port from OE-Classic
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

at SHA 16f464bd8cff6b6a27d9bfe691f7adc875d01ac2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/dmidecode/dmidecode_2.10.bb   |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb

diff --git a/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb b/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb
new file mode 100644
index 0000000..ae06de9
--- /dev/null
+++ b/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
+SECTION = "console/utils"
+HOMEPAGE = "http://www.nongnu.org/dmidecode/"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+LICENSE = "GPLv2"
+PR = "r2"
+
+SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${P}.tar.bz2"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR="${D}" install
+}
+
+SRC_URI[md5sum] = "3c9c4d55a40b78600f3b43bfa64616f9"
+SRC_URI[sha256sum] = "4d74a3e93353320317a424816f9a045df06d9ed4b5b80881e16fdfcc74c9e2c0"
-- 
1.7.9.5



