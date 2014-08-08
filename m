Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD0070276
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 15:20:18 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so7435708pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/dBdYSoP5NigUZcdXGYO0rTCajwFvTUc2L2o+2hhhcM=;
	b=gvTNnv7f1uuYOTZaZBKVOpgolaKOjyO6YS7c8QaTiZQQtZ1MkpqtcMJB4fvl/F5E+2
	JQbg0+irabAXuQBUYGPTGxm5HRuvc+EEsx5jU89H1mGZa7cM7m/oYonqbARA4JIPmkie
	LCgpnT6cjOSyWOFIj+kfys1f/FhIGnmUp6fVlxtrb5r5iq97nsUvFqeMvt8kRLluqyXt
	fqyvX9hxwjN5d6oU0SCoy/cJH/VBwgscRuq5d0b+SalIuR+wevMs1ofjutOOwFYcztG4
	xy4s8nlvmHI12WPX6ja8hmaDENcdyXvZzH7mwthKS+DZ2ZMwcbYr93QJRMsTjy0/JWAB
	liRg==
X-Received: by 10.70.102.130 with SMTP id fo2mr24667057pdb.68.1407511220138;
	Fri, 08 Aug 2014 08:20:20 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	bl12sm26473431pac.44.2014.08.08.08.20.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 08:20:18 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 08:19:51 -0700
Message-Id: <1407511191-28246-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1407511191-28246-1-git-send-email-TicoTimo@gmail.com>
References: <1407511191-28246-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-perl] [PATCH 2/2] libmodule-build-tiny-perl: fix RDEPENDS
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
X-List-Received-Date: Fri, 08 Aug 2014 15:20:18 -0000

* CPAN::Meta is provided by perl-module-cpan, NOT perl-module-cpan-meta
* Module::Load is provided by perl-module-load, NOT perl-module-module-load
* Fixes QA build-deps warning

* libtap-harness-env-perl is bogus, already have perl-tap-harness-env

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
index 2e725a8..761f17c 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
@@ -29,14 +29,13 @@ do_install () {
 RDEPENDS_${PN} = " libextutils-config-perl \
                    libextutils-helpers-perl \
                    libextutils-installpaths-perl \
-		   libtap-harness-env-perl \
                    perl-module-xsloader \
                    perl-module-file-spec \
                    perl-module-io-handle \
                    perl-module-tap-harness-env \
                    perl-module-ipc-open3 \
                    perl-module-file-path \
-                   perl-module-cpan-meta \
+                   perl-module-cpan \
                    perl-module-extutils-cbuilder \
                    perl-module-getopt-long \
                    perl-module-extutils-makemaker \
@@ -44,7 +43,7 @@ RDEPENDS_${PN} = " libextutils-config-perl \
                    perl-module-carp \
                    perl-module-test-more \
                    perl-module-text-parsewords \
-                   perl-module-module-load \
+                   perl-module-load \
                    perl-module-file-temp \
                    perl-module-data-dumper \
                    perl-module-extutils-parsexs \
-- 
1.9.3


