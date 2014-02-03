Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 41ACC6E937
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:40 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id rd3so6658955pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ECMaVMbIhSZgLGJW0pldQcUKZaNILpKN15hvsPsdDCw=;
	b=PVTfW37gjo+r+YUaW9qFbT0rTKHlWJRlxbkOwm9e8ySzaj2x36xrNs58RvdH94W6q4
	0QnKw+gSgwRKEcFx4UH5SK1lnZ4tibOuIhIPNZWsvoj1h354KJ4X5/Tjs6hLjAK2x6mJ
	6madfFJwmxI/YZjvwlVryjCzSLqvPOAbrIQCfxZsAIOAbPw9KsXCXaZGjmNhHVJWdxo3
	iiWJtR+J4eZAjSaDja2VXD3jZO3A0VoZ97HmAyaB4Gwo1NrgNQGsbKGw/LSlGFHycCkA
	gINIsC7P4wTn7ShJLGuR1kz9A1eXKSEHo0rohRwE9UYvXWM6uf5hDcymZ8sLE/0lRSba
	2qmA==
X-Received: by 10.66.148.134 with SMTP id ts6mr34928920pab.113.1391410241613; 
	Sun, 02 Feb 2014 22:50:41 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:40 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:10 -0800
Message-Id: <1391410275-31251-6-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 05/10] libextutils-config-perl: add 0.007
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:40 -0000

[Description from CPAN]
ExtUtils::Config is an abstraction around the %Config hash.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libextutils/libextutils-config-perl_0.007.bb   |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
new file mode 100644
index 0000000..8276d28
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
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
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
1.7.9.5


