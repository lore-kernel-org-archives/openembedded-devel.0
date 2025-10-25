Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC33CCF9E5
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:26:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6567.1761402387305642998
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipI14GGl;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-427060bc0f5so1678881f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761402386; x=1762007186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSpICL/6U6G20TDuuyonwT4uPVq835X987E4nQ5bnpE=;
        b=ipI14GGlfNul13Fgwutqxd0mdIEIsI+b2AedgY4csJSUu/1+a8J35XoiEa7rkogHDD
         Bo0Vg0yDJSECjUKzXeRuBiAKvL+dNuFKr6e6/4RLy1K1Km7Dcf1qyDgXH4dPZGTKcVYG
         yWwGQbc4Sbe9UaMR2Kh1e+oUhL2k78xvflqdyYr+OBRmWnWReypaTjjbvICBp5XikQg6
         GpIpT88v7I8ry7wcM62PahgaQxsXO/ZwcBAMYiXYBshqxKwFO9R0R6VFmICygX9hn8kA
         t7ocUrgbQXtbk+KD+9jOj+4cRHA755SLYUwvTKSK4h9V8NJoe9U0ebK9ms9iGJeIG4aH
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761402386; x=1762007186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSpICL/6U6G20TDuuyonwT4uPVq835X987E4nQ5bnpE=;
        b=Nfi8Czdj5xXLfff0W0FnySEXwY1ddvHcp1y3GYsZWVr3+uioLtS3AzMayNbkoOUyVO
         ee4Qk0PiGEvboRREQhC61MjkVpeU0aOQJxY2Z7LsOm50RBqoVFN2D6z4Oa+FNiXu69Ln
         PNitPeXv1MUD1B/62jD1nnnyfJ3Ur5TedeaIRMOjdhgY72E7pMck2BAVMVbSfccS2wVr
         mGJh/fYQjxrquopj0tHjqtr1WfVETA31Bgzj96lArxRF6T+ntyTN8zgDoSHxKFLX/+K3
         vbnNYyzv3ZkcxMWZiO9YeKtPAZsPtr0Nr36U07QKpew/8QjpKVXfM0oRxGNd2Hz2PeET
         xI+A==
X-Gm-Message-State: AOJu0YyB97snDByW32m/6hjJX7l4GL1xC9KrhzqqFvmM8CRWKvTWouEM
	eelTdnO6r3dk9GO8qiTixiZinfN3GY1nfDY8721MDF6BGh68UAHXCQpED+pNJg==
X-Gm-Gg: ASbGncs+3rmZCQ0Rky/xnhEoikS2UIw0crRkxSogpEdIPvfGDK9zl0PSvfMLIRsOoG7
	10+eTgOiY17jWqJFaujLjxdBUKLttI/wcKfzaFKic+dsB2HImolsbfzhqSz1mm+bfUZEUEvUEck
	dRC2HII+/Dp5B0jkLjseWCsPXC3SIBy0UCf8a1vNsEfJ/lCOQ39aPSX1SVmVDvxnE50+7ojb66z
	XVKUbeEB5GQ5GavWuxOykb7hJmsEPyYXJTMyPjQdRKFDL7RQYLgPzT5T+Ui3LF8JVsMalA99FYc
	meyZIQZHNfoG2HlWH9BaKInRPS3ytO19AsaTNuDN7gjazrgW5nCmMOR78u7RBBiqxRDenQur3Xw
	bAjl/VffuAAq42S1RyLADtbrCipBqPOKsFRCNPunx9XgGKb+DxdmTn8LYQD4jMq6s5HUIIt7Zbx
	ZIr0HiVUKG
X-Google-Smtp-Source: AGHT+IEJn4OqP4lvMsI7HQHBgr76MlCyhZ1uBd5v6Rke1Dpndin2tUGZd716GhDKIZfOGSWtc4oYow==
X-Received: by 2002:a05:6000:26cf:b0:3ea:e0fd:290a with SMTP id ffacd0b85a97d-42990701991mr3932457f8f.12.1761402385566;
        Sat, 25 Oct 2025 07:26:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm3867482f8f.0.2025.10.25.07.26.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 07:26:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 5/5] libconfig-autoconf-perl: fix ptests
Date: Sat, 25 Oct 2025 16:26:21 +0200
Message-ID: <20251025142621.1566114-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025142621.1566114-1-skandigraun@gmail.com>
References: <20251025142621.1566114-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 14:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121005

Add missing dependencies.

Also, fixing the tests have surfaced an actual bug: the module
expects unversioned perl library to be present on the system
(or at least present in Perl's $Config{libperl}), however the
OE Perl build has a versioned library, which causes final linking
to fail.

A patch to correct this is part of this change, and it has been
submitted upstream also.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-perl.inc  |  2 +-
 .../0001-correct-libperl-regex.patch          | 42 +++++++++++++++++++
 .../libconfig-autoconf-perl_0.320.bb          | 16 ++++++-
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl/0001-correct-libperl-regex.patch

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 7488da3351..ef0c59dc2f 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_PERL = "\
     libauthen-sasl-perl \
     libcapture-tiny-perl \
+    libconfig-autoconf-perl \
     libcrypt-openssl-guess-perl \
     libcrypt-openssl-random-perl \
     libcrypt-openssl-rsa-perl \
@@ -47,7 +48,6 @@ PTESTS_SLOW_META_PERL = "\
 "
 
 PTESTS_PROBLEMS_META_PERL = "\
-    libconfig-autoconf-perl \
     libhtml-parser-perl \
     libunix-statgrab \
     libxml-libxml-perl \
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl/0001-correct-libperl-regex.patch b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl/0001-correct-libperl-regex.patch
new file mode 100644
index 0000000000..373f773070
--- /dev/null
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl/0001-correct-libperl-regex.patch
@@ -0,0 +1,42 @@
+From 5ffd363a7acd4ef794eb265eaf6c42321097cd46 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 25 Oct 2025 15:48:51 +0200
+Subject: [PATCH] correct libperl regex
+
+The module expects the libperl library's format (from $Config{libperl})
+to be versionless, just simply libperl.so. However this value in the
+OE builds is versioned, causing some issues.
+
+The module transforms this value into a linker flag, and tries to link
+with the library. The transformation is simple: cut off the "lib" from
+the start, and everything after the last dot.
+
+With versionless version, the transformation works: libperl.so -> perl
+
+However with versioned library it looks like this:
+libperl.so.5.99.9 -> perl.so.5.99
+which is just wrong.
+
+This patch changes this transformation in way that throws away everything
+after the first dot (instead of the last one).
+
+Upstream-Status: Submitted [https://github.com/ambs/Config-AutoConf/pull/19]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lib/Config/AutoConf.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Config/AutoConf.pm b/lib/Config/AutoConf.pm
+index 0bba5a4..a2e7099 100644
+--- a/lib/Config/AutoConf.pm
++++ b/lib/Config/AutoConf.pm
+@@ -3001,7 +3001,7 @@ sub _check_link_perlapi
+ 
+     my $libperl = $Config{libperl};
+     $libperl =~ s/^lib//;
+-    $libperl =~ s/\.[^\.]*$//;
++    $libperl =~ s/^([^\.]*)\..*$/$1/;
+ 
+     push @{$self->{extra_link_flags}}, "-L" . File::Spec->catdir($Config{installarchlib}, "CORE");
+     push @{$self->{extra_libs}},       "$libperl";
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
index d8ca2ae247..5c233ed22d 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
@@ -14,7 +14,9 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/A/AM/AMBS/Config-AutoConf-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/A/AM/AMBS/Config-AutoConf-${PV}.tar.gz \
+           file://0001-correct-libperl-regex.patch \
+           "
 
 SRC_URI[sha256sum] = "bb57a958ef49d3f7162276dae14a7bd5af43fd1d8513231af35d665459454023"
 RDEPENDS:${PN} += "libcapture-tiny-perl"
@@ -31,8 +33,20 @@ RDEPENDS:${PN} += "perl-module-scalar-util"
 RDEPENDS:${PN} += "perl-module-strict"
 RDEPENDS:${PN} += "perl-module-text-parsewords"
 RDEPENDS:${PN} += "perl-module-warnings"
+
+RDEPENDS:${PN}-ptest += " \
+    packagegroup-core-buildessential \
+    perl-dev \
+    perl-module-file-glob \
+    perl-module-perl-ostype \
+    perl-module-metadata"
+
 RRECOMMENDS:${PN} += "libfile-slurper-perl"
 
+# One test requires perl headers (perl-dev) to compile some
+# test application.
+INSANE_SKIP:${PN}-ptest += "dev-deps"
+
 S = "${UNPACKDIR}/Config-AutoConf-${PV}"
 
 inherit cpan ptest-perl

