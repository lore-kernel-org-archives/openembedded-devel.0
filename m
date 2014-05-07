Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A1EB960DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:09 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id g10so341658pdj.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gGdWaXYEhxp5Hyhn1goPHcHVqqt7YEcD4TQ62Ao7AM8=;
	b=n/bfaD0vFNJzDY2K+vKcx47YpjNXKIdg3YPGDJ6D7i6TeVuWsaC/k0zMjtxANo43Hi
	i+1EUuHxv75EUhHGsePVhHohyFVspVN4kbGWA/NsSVUtG1GchuyUKGPWpueUVVtvIE4t
	QjqlI8onu/qGac+LPhY7Ni8xDR7AIbsZGnf6CPc17Asq5P/bBHEuq/SZHF8j4qk6oKwf
	7DDLva9NO8huAT0bQP1rbKV1iO95l9OWSf0XSrUoLuZeuFltw/bNoJdVf7gSMck3RmIG
	DB/7WlEyB35wsly0rpHly6clVquyKVP7CGqSDuZ33ZlpgNAM7+ny/NeCU8O2w55Z6Q1e
	B8Gw==
X-Received: by 10.66.120.201 with SMTP id le9mr12588555pab.98.1399428490621;
	Tue, 06 May 2014 19:08:10 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:09 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:22 -0700
Message-Id: <1399428565-30499-7-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 6/9] libextutils-installpaths-perl: add 0.010
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
X-List-Received-Date: Wed, 07 May 2014 02:08:09 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
This module tries to make install path resolution as easy
as possible.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils-installpaths-perl_0.010.bb         | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
new file mode 100644
index 0000000..4cfdfc4
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
@@ -0,0 +1,25 @@
+SUMMARY = "ExtUtils::InstallPaths - Build.PL install path logic made easy"
+DESCRIPTION = "This module tries to make install path resolution as easy \
+as possible."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-InstallPaths/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15bbcc2806d297df9e944b8955b38d82"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
+SRC_URI[md5sum] = "f0b00cc6c04653588a6298fa1f16c07f"
+SRC_URI[sha256sum] = "d14cbff118e467900c2c488b55b83ef697d6eb1b8f592c0521f1d82848bf2156"
+
+S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-extutils-makemaker \
+                   perl-module-data-dumper \
+                   perl-module-test-more \
+                   perl-module-file-temp \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


