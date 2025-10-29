Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D499CCF9F6
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:40:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web01.6389.1761745256044745727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHNoU3K7;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso4422304f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761745254; x=1762350054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKbuoykqEwVH+5IqBzI5854hf6ay4jftsbTlfZVpLU4=;
        b=FHNoU3K7pTp8hKJDLD1BQMBJeeluizBmTHvNsJiN6PM6t+Kwr1CwWPNSBpceB8ZR2X
         aBG6VxowBOB9lhZUqxHZWbzGNgLBsW1Kmzkt6UtCyBdQH8tRJQkeLaP32VF45Yvn7lar
         BjCV0pLeah3gIUDpuUawcPgtoAjDuB5zCJPbKdpFKp+01MJ1N80Bpf7myPtYXb1I0mMp
         bsQP7MAytdYEw+msEjeuMitj/ZPc7Eq0HYnC4dVGu+qJzE+cQPmCyx5QeUj5WX2Z43eC
         khYaE39XjQxjt4NkM3kweoXZ/FWUUgxNv87TvP6CancykFDAuX9auSLnNxF4VMzmcVX+
         EASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745254; x=1762350054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKbuoykqEwVH+5IqBzI5854hf6ay4jftsbTlfZVpLU4=;
        b=kf6FE6OXHDHEgA/PQhH+znAOStS6aC4KPzst8dAnvXOT1eHKedbQLxa4PAieeWP4WR
         NVyrVX1WpoXbHrEvaosQbfL22u/gm+ZLk/rsUeOMGQwD+CWQoXiEaorb+rj6eGnmY8z4
         7ISlkPqlUFz7KfmsvPhO9ryLTVEhbg8cBklfYZK7nsB4EYV9b1QumatwS4HdEbZXvhww
         cXo/TT9pPeCHX9lVyIdmP57rm70Is/KEKn9+vNUI3uIVgsJmRq9I5lWG5WXhrJ0EmFev
         96V9zmGFKKBb7D1LMED59wA9jB2VAYnB1PsiNOYUuYuEwkdGPD0kv146Xkav2/n2MRa6
         9xgA==
X-Gm-Message-State: AOJu0YxKH8z/Sna/9i9TjhWd+1hWYQqZDodkQOwx0ujj8v8ucpfr7YES
	WJwkKpfh2gOxtWVpmRfkFNVRTVSbZuI5Go0cRzdccrr6R6WV9YcFTPiy/n4K7ZOu
X-Gm-Gg: ASbGncuabNUvfsgTc70GPe/jiLlFrnvOwkAp0flIh2Hz0yYJm0yszItqSPsBejZMEZe
	K3/Cj4sPzRdnPa2Uth00/J4JCjKSn4NYtkNoQZac0ahoLhn2+AEuWDo+1NTZDUgmIIFRo4fDRoO
	orquGZTgpLc0/C8GO6SNzH75VZkak5giXqKbKArLGwawDXOvD4Nd3eFiSwJ6ZZqRjxhcWKWd7ml
	ygEVk4UCw7G6LBVoQ77BQUfbQU4Y6hlNmjI1B2xUiNA/pY1hAuvucyoT83+1TnWTcJSOtne+i2M
	pnI2HTuwu7o5WwbSf0oGGVNLE9tjY8dfao95QH0vIHuM8F/0tF+W/+76zJEz/xw7qoiobJK0Bx4
	EBg2BH3DA16rP1j5MU9cMv5xWdsYLrzlcEhT7zLun/uqbVsS6ZivbxB9eM09hrr87G21qBynj3A
	==
X-Google-Smtp-Source: AGHT+IFV4g9czWcUJ8wNtv5krJ0b64CqTXoN0408Iap58W0Z4KBg8fZgpaxNDlTPbxtBsnvRC7cDUw==
X-Received: by 2002:a05:6000:4308:b0:429:8a0f:754f with SMTP id ffacd0b85a97d-429aefdd567mr2059837f8f.55.1761745254312;
        Wed, 29 Oct 2025 06:40:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm25950484f8f.22.2025.10.29.06.40.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:40:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 4/5] libconfig-autoconf-perl: fix ptests
Date: Wed, 29 Oct 2025 14:40:49 +0100
Message-ID: <20251029134050.3455088-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029134050.3455088-1-skandigraun@gmail.com>
References: <20251029134050.3455088-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121155

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
 .../files/0001-correct-libperl-regex.patch    | 42 +++++++++++++++++++
 .../libconfig-autoconf-perl_0.319.bb          | 16 ++++++-
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch

diff --git a/meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch b/meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch
new file mode 100644
index 0000000000..373f773070
--- /dev/null
+++ b/meta-perl/recipes-perl/libconfig/files/0001-correct-libperl-regex.patch
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
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 5c3701f16b..c3cc388661 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Config::AutoConf is intended to provide the same opportunities to
 developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> does for \
 Shell developers."
 
-HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
+HOMEPAGE = "https://metacpan.org/release/Config-AutoConf"
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
@@ -14,7 +14,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz \
+           file://0001-correct-libperl-regex.patch"
 
 SRC_URI[md5sum] = "eeeab8cc93eef7dd2e2c343ecdf247b7"
 SRC_URI[sha256sum] = "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d8f5131beec31a0a33e"
@@ -34,6 +35,17 @@ RDEPENDS:${PN} += "perl-module-text-parsewords"
 RDEPENDS:${PN} += "perl-module-warnings"
 RRECOMMENDS:${PN} += "libfile-slurper-perl"
 
+RDEPENDS:${PN}-ptest += " \
+    packagegroup-core-buildessential \
+    perl-dev \
+    perl-module-file-glob \
+    perl-module-perl-ostype \
+    perl-module-metadata"
+
+# One test requires perl headers (perl-dev) to compile some
+# test application.
+INSANE_SKIP:${PN}-ptest += "dev-deps"
+
 S = "${WORKDIR}/Config-AutoConf-${PV}"
 
 inherit cpan ptest-perl

