Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C53AB6611E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:49:53 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so1158204pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I/CK1vyfw6Hvv5M9gzAXWv5E4nQzFsSfvSIh4OkHXK8=;
	b=NATvGw3VWkC6zdcRcplcwP490nrXGl4NR0XhGzvaFLY2I9fy28bvhEX8qLT0cBVfkh
	QI8j2MfJBVS4bvW0VKgsYDFIcm2Zx6Vd6+BP4rembEgwuC3JOY3PHBOR7bv6iswNh+v3
	gFm+S8AQOf499vdSAZk8mcFK87dXiUpygPh1Fg7m/pF9vR02DdvuIDEUq/V4aF+cbWsm
	g/m2HafVB1Ka+7qNjTzkn92LhvScUELvPqpnhwBnc03rdrB6IPMpdwyS/yyZJO+RO3K3
	CXgFbCnBA/1pk3oWp1TmOFU+KAMhfXhOmAsNK0ks7zmlxWzka+PZn9IgPd+vjpbu1ink
	eU3Q==
X-Received: by 10.68.139.36 with SMTP id qv4mr56432307pbb.82.1400658109358;
	Wed, 21 May 2014 00:41:49 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:48 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:37 -0700
Message-Id: <1400658223-15804-5-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 04/10] libextutils-config-perl: add 0.007
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
X-List-Received-Date: Wed, 21 May 2014 07:49:53 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
ExtUtils::Config is an abstraction around the %Config hash.

* Add ${CPAN_MIRROR} option

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-config-perl_0.007.bb   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
new file mode 100644
index 0000000..78483b4
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
@@ -0,0 +1,24 @@
+SUMMARY = "ExtUtils::Config - A wrapper for perl's configuration"
+DESCRIPTION = "ExtUtils::Config is an abstraction around the %Config hash."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1b813683bd988732e7fd6a796bf7f47"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
+SRC_URI[md5sum] = "2829c0dfa8a7e51b3f582efbee4bb128"
+SRC_URI[sha256sum] = "2c1465078b876fd16a90507092805265528c2532d4937b03547a6dbdb8ac0eef"
+
+S = "${WORKDIR}/ExtUtils-Config-${PV}"
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


