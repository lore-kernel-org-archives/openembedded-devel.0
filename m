Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id AE11976719
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 05:14:00 +0000 (UTC)
Received: by ykfw73 with SMTP id w73so6863428ykf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EgLO4+VOft3D50j2RX9J0Dj2Us7+yC25RSRNXl0OsSE=;
	b=c4+fZDAPbBEgQeOahNSR25/8J7Q+TaMRYt2FJ1n7ClZaU2SUksC7jkf1Sh1DL9WMW9
	hmimNVEJCdf0aFcC+MmkZHXc0klkmY6YS3+pc6CYYdfDQtGbMGaETomFr5aeHsVEp+1p
	HTRUrhZByZH6sNHQii5L6UodYV8W4edyvwSJk4Jrk/y97e9P+IULHMnXK957Lx5maQSz
	eIUPblnl5GJCaE/8ZElzH77ZGX2cgco76uoiLnDk5CAOg3QX4SEuI4nUiP8q5N0SjQB2
	hTYzbh99psZxYqMKfXfJKwap8T8e1r/T0XI0cj9adg4/zINz4RL8XcXP/zxbv9yK8A/c
	syDQ==
X-Received: by 10.129.34.69 with SMTP id i66mr41642344ywi.104.1439529240706;
	Thu, 13 Aug 2015 22:14:00 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	y203sm4284827ywy.23.2015.08.13.22.13.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 22:13:59 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 22:13:47 -0700
Message-Id: <1439529227-14759-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libio-stringy-perl: add 2.111 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 05:14:01 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-perl/libio/libio-stringy-perl_2.111.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb

diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
new file mode 100644
index 0000000..b890a3e
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -0,0 +1,31 @@
+SUMMARY = "IO-stringy - I/O on in-core objects like strings and arrays"
+DESCRIPTION = "This toolkit primarily provides modules for performing both \
+traditional and object-oriented i/o on things *other* than normal \
+filehandles; in particular, IO::Scalar, IO::ScalarArray, and IO::Lines."
+
+HOMEPAGE = "http://www.zeegee.com/products/IO-stringy/"
+SECTION = "devel"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
+
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
+SRC_URI[md5sum] = "e91acf0a800b190d13585a47de775bdd"
+SRC_URI[sha256sum] = "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6aaa8296ea41bf199d"
+
+S = "${WORKDIR}/IO-stringy-${PV}"
+
+inherit cpan
+
+RPROVIDES_${PN} += " libio-atomicfile-perl \
+		     libio-innerfile-perl \
+                     libio-lines-perl \
+                     libio-scalar-perl \
+                     libio-scalararray-perl \
+                     libio-wrap-perl \
+                     libio-wraptie-perl \
+		     libio-wraptie-master-perl \
+		     libio-wraptie-slave-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


