Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 338 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 May 2014 07:47:18 UTC
Received: from mail-pb0-f52.google.com (unknown [209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 838FB66100
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:47:18 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rr13so1160122pbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iFJiWgxz+b+e/0QBL5Xr6h/8ji9EA+G7V1vYvWtWIvo=;
	b=ZtpxLzLD2FI2Sg0fvcP8OZgldSYHSoGpt4aUPrzuz7QGQstNzkkqulxaQ5Wucl0qbu
	eCFcTBvGD0YkZno1cLmQFYyceLIltshDhZT4rw7RUWDit6XyaeoHsy5aW7s+ujohi8Mh
	tLj4T6jQB9DbBSxxTJJZ0hs+dU23rkI0O6vsKOoWK7mZPz6DB9qu8e/MPDfes3wqBCxp
	Nchy/GYpxJWNDwXQ6/P6Bjnnn8WM4t2nhFYnjL3Me2ihXZoMr4psdjtOLavtMM5NSQP2
	Y6CTZtPUhOi38vkYpX3bU9cYCnRc55qSHhz+YFkNJYSqDSX7cJkfrfBIX4y2JescPt8n
	cWnw==
X-Received: by 10.66.230.193 with SMTP id ta1mr57676047pac.29.1400658114427;
	Wed, 21 May 2014 00:41:54 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:53 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:39 -0700
Message-Id: <1400658223-15804-7-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 06/10] libextutils-installpaths-perl: add 0.010
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
X-List-Received-Date: Wed, 21 May 2014 07:47:21 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
This module tries to make install path resolution as easy
as possible.

* Add ${CPAN_MIRROR} option

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils-installpaths-perl_0.010.bb         | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
new file mode 100644
index 0000000..8de375d
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
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
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


