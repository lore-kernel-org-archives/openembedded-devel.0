Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 651756E92E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:32 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so6524799pdj.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FqrokrMK/j1gYm+xjEzesFVk9zBBTll6IC+JZbk6uCg=;
	b=lsCMaf+sBJD2ZHyXqSxQpwj+8+jDHgMvrxhOWh9iEtYcHwJyUuqqJP/4AfruF+UKZG
	RsmOdCUtNk7GsSaDNgOwzaWFXbaCPGwT8IxFlq/DOFJwpohs9dUEbawwKB3ZgpMtTG8h
	uoguQk1YSJOwIxDC3gnsIejjVXoa0nm7h3w7Y8VUHz9qL0vODUSJey1DO+AGBwo39RFY
	Zi95CpiHV1Dy79Ea+rB6gofKRiN4zOUrrra7UKh0x2xgdap/285689BovC6bjjiVc3X+
	YqY+VUPCHa9N/yklBMFaK6CmyptgbUEIoYGybVknow4dsV+9hj2/1PQkge6fYNy/kz6c
	arxA==
X-Received: by 10.66.246.229 with SMTP id xz5mr35746602pac.119.1391410233710; 
	Sun, 02 Feb 2014 22:50:33 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:06 -0800
Message-Id: <1391410275-31251-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 01/10] libmodule-metadata-perl: add 1.000019
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:33 -0000

[Description from CPAN]
This module provides a standard way to gather metadata about a .pm file through (mostly) static analysis and (some) code execution. When determining the version of a module, the $VERSION assignment is "eval"ed, as is traditional in the CPAN toolchain.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libmodule/libmodule-metadata-perl_1.000019.bb  |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb b/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
new file mode 100644
index 0000000..668f0c4
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Module::Metadata - Gather package and POD information from perl module files"
+DESCRIPTION = "This module provides a standard way to gather metadata about \
+a .pm files through (mostly) static analysis and (some) code execution. When \
+determining the version of a module, the $VERSION assignment is eval-ed, as \
+is traditional in the CPAN toolchain."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~ether/Module-Metadata/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=185;endline=190;md5=e1b24eebe5d819b40bb68ad06b72d3ee"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Metadata-${PV}.tar.gz"
+SRC_URI[md5sum] = "838ecf97f7daff79e0f81e104a6be823"
+SRC_URI[sha256sum] = "5afca94dc0213608101ad519eb1b25133cdc9e44c2a053a45a5a59422c2ee554"
+
+S = "${WORKDIR}/Module-Metadata-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-io-file \
+                   perl-module-data-dumper \
+                   perl-module-extutils-makemaker \
+                   perl-module-file-spec \
+                   perl-module-version \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-file-temp \
+                   perl-module-file-path \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


