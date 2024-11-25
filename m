Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4731ED5806E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17189.1732536055359260997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwaEckKh;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so39755065e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 04:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536053; x=1733140853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRE/sdmcVj4Dd3VeaSMQvp5ui4ZKUa3uUMgBinoQwYc=;
        b=WwaEckKh8r0wUg7cLJfDvEWOTKMVF8Y7qKjNKfRczXLVsr/U1Kq7bfxbrXo2lqhw7O
         ooFJiIGOi8daYALOM0LRdudlTX75JCG9zJrUelZ2YukIGmPem/8LKpoHkqzFrX7SEQ4a
         Q1DBDzEiJnMFUye4YQU/GdbLymuhruPHJZSaXRt+MEDxxAx++tDe6VgsMf16MTMOiL05
         oe81bMTjq7F6avCr1pp9fbn/6ojklUxLaT+880ruRG5uysmnRvZ/erKN2QJaX+1vB4BW
         3ESFkqx3L52mK/ulcjy+wuMzFy2EGuYHxoh3ZUFq5YDFnB2vPTMUlQ/0YWh5yfoEh0WC
         zBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536053; x=1733140853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRE/sdmcVj4Dd3VeaSMQvp5ui4ZKUa3uUMgBinoQwYc=;
        b=ftqgFbeeuYfap4sGFkfuHMKaAPWtB/kXNglutitmU097os5JQcVH41m9uCmcGebN2M
         Bh+i263UP48Pej1+0kUrtbicRDu+2nB7JecLM+i/nNSkfNqoHKszK3oGb6oB2nWPqqj+
         2TwtUJRaQXEAtVz9jfvhjgxmH0ug4IFgPP+2NySncU11Mc/oo/wek+UQ8p/bPALIOHNm
         7oB4XRvvVKLotcrNB20CAQigXFhHKWnsEE7X7NkvmaeiC51I1173T/m7uDbOvqugtTpx
         hcSfbiJ1QvviaRg+3wn0BWzlxObRkfptVd2hiEb2s6+/R59jzq3ZHMWBMdCPvp7IHf+T
         ZmLw==
X-Gm-Message-State: AOJu0YzjmdNn4mVmdpQHq82Thh6Jifm7IKW5S+2g7mPgINNHs07vvHxW
	s3slJaD68rgpLcw/qCm85h0pk3xE1/pNkE96DDnGyjjrkeGDr2IETHt+EA==
X-Gm-Gg: ASbGncs5CiSxaWYF2YVBRtWxw8cFrMS2vhjGrkm3yjScFh8JHGx6I+yrfipQRMhnlcE
	38LbcaAUwy9CBeW0z1MV553eYRmlfrIZpHpTs6C8xMUVq844WScnlzaZVpXAhzm0YAilHxom3be
	PWB6Q8S+h2gvni3fD9RAnRGUPjw4Kkrm19S3WUaTaTodK8F/HLkdaDh3SstW36K8bpz6GjaFHzb
	1pKcYXJKd0Ivb9mkik8EJIgEMR/0yNMt9i2mPPj2PpxZ6hMGrJmQRPm4awfaodgo0zIJ7bfiz9j
	dcxsCqboesI=
X-Google-Smtp-Source: AGHT+IH4+nKNjpPB8dO6pxlrT2wdqlKuK7IJTGulng7nW+l4igGwTPxi5B9X8i6V2KiSs5HTIies/A==
X-Received: by 2002:a5d:6da7:0:b0:382:4926:98fa with SMTP id ffacd0b85a97d-38260bccdf8mr9758658f8f.40.1732536053008;
        Mon, 25 Nov 2024 04:00:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e117bf5sm47267655e9.18.2024.11.25.04.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:00:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] liburi-perl: add to meta-perl from oe-core
Date: Mon, 25 Nov 2024 13:00:45 +0100
Message-Id: <20241125120045.2145788-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114032

The recipe has no usage in core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../include/ptest-packagelists-meta-perl.inc  |   1 +
 .../0001-Skip-TODO-test-cases-that-fail.patch | 109 ++++++++++++++++++
 .../recipes-perl/liburi/liburi-perl_5.31.bb   |  56 +++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
 create mode 100644 meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 842f817f1f..9fc5e9675a 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -21,6 +21,7 @@ PTESTS_FAST_META_PERL = "\
     libterm-readkey-perl \
     libtest-nowarnings-perl \
     libtext-diff-perl \
+    liburi-perl \
 "
 
 PTESTS_SLOW_META_PERL = "\
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
new file mode 100644
index 0000000000..c15c3be93a
--- /dev/null
+++ b/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -0,0 +1,109 @@
+From c424e6118d3bd836939ce39c70ee9e6bbd984028 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 17 Nov 2022 16:33:20 -0800
+Subject: [PATCH] Skip TODO test cases that fail
+
+TODO cases report as "not ok" with ptest-runner
+
+Upstream-Status: Inappropriate [ptest-runner specific]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ t/escape-char.t | 20 ++++++++++----------
+ t/iri.t         | 18 +++++++++---------
+ t/mailto.t      | 12 ++++++------
+ 3 files changed, 25 insertions(+), 25 deletions(-)
+
+diff --git a/t/escape-char.t b/t/escape-char.t
+index c6ce79c..5e62ad5 100644
+--- a/t/escape-char.t
++++ b/t/escape-char.t
+@@ -6,16 +6,16 @@ use warnings;
+ use Test::More;
+ use URI ();
+ 
+-TODO: {
+-    my $str = "http://foo/\xE9";
+-    utf8::upgrade($str);
+-    my $uri = URI->new($str);
+-
+-    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
+-
+-    # http://foo/%C3%A9
+-    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
+-}
++#TODO: {
++#    my $str = "http://foo/\xE9";
++#    utf8::upgrade($str);
++#    my $uri = URI->new($str);
++#
++#    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
++#
++#    # http://foo/%C3%A9
++#    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
++#}
+ 
+ {
+     my $str = "http://foo/\xE9";
+diff --git a/t/iri.t b/t/iri.t
+index cf983d6..884b36e 100644
+--- a/t/iri.t
++++ b/t/iri.t
+@@ -6,7 +6,7 @@ use Test::More;
+ use Config qw( %Config );
+ 
+ if (defined $Config{useperlio}) {
+-    plan tests=>30;
++    plan tests=>28;
+ } else {
+     plan skip_all=>"this perl doesn't support PerlIO layers";
+ }
+@@ -67,17 +67,17 @@ is $u->as_iri, "http://➡.ws/";
+ # draft-duerst-iri-bis.txt examples (section 3.7.1):
+ is(URI->new("http://www.example.org/D%C3%BCrst")->as_iri, "http://www.example.org/D\xFCrst");
+ is(URI->new("http://www.example.org/D%FCrst")->as_iri, "http://www.example.org/D%FCrst");
+-TODO: {
+-    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
+-is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
+-}
++#TODO: {
++#    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
++#is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
++#}
+ 
+ # try some URLs that can't be IDNA encoded (fallback to encoded UTF8 bytes)
+ $u = URI->new("http://" . ("ü" x 128));
+ is $u, "http://" . ("%C3%BC" x 128);
+ is $u->host, ("\xC3\xBC" x 128);
+-TODO: {
+-    local $TODO = "should ihost decode UTF8 bytes?";
+-    is $u->ihost, ("ü" x 128);
+-}
++#TODO: {
++#    local $TODO = "should ihost decode UTF8 bytes?";
++#    is $u->ihost, ("ü" x 128);
++#}
+ is $u->as_iri, "http://" . ("ü" x 128);
+diff --git a/t/mailto.t b/t/mailto.t
+index 79e9a13..c68cfb2 100644
+--- a/t/mailto.t
++++ b/t/mailto.t
+@@ -48,12 +48,12 @@ $u = URI->new('mailto:user+detail@example.com');
+ is $u->to, 'user+detail@example.com', 'subaddress with `+` parsed correctly';
+ is $u, 'mailto:user+detail@example.com', '... and stringification works';
+ 
+-TODO: {
+-    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
+-    $u = URI->new('mailto:"foo bar+baz"@example.com');
+-    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
+-    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
+-}
++#TODO: {
++#    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
++#    $u = URI->new('mailto:"foo bar+baz"@example.com');
++#    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
++#    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
++#}
+ 
+ # RFC 5321 (4.1.3) - Address Literals
+ 
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb
new file mode 100644
index 0000000000..e23942b81e
--- /dev/null
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Perl module to manipulate and access URI strings"
+DESCRIPTION = "This package contains the URI.pm module with friends. \
+The module implements the URI class. URI objects can be used to access \
+and manipulate the various components that make up these strings."
+HOMEPAGE = "https://metacpan.org/dist/URI"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9944b87af51186f848ae558344aded9f"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
+           file://0001-Skip-TODO-test-cases-that-fail.patch \
+           "
+
+SRC_URI[sha256sum] = "b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564"
+
+S = "${WORKDIR}/URI-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan ptest-perl
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+do_install:prepend() {
+	# these tests require "-T" (taint) command line option
+	rm -rf ${B}/t/cwd.t
+	rm -rf ${B}/t/file.t
+}
+
+RDEPENDS:${PN} += "\
+    perl-module-integer \
+    perl-module-mime-base64 \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    libtest-fatal-perl \
+    libtest-needs-perl \
+    libtest-warnings-perl \
+    perl-module-encode \
+    perl-module-encode-encoding \
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec-functions \
+    perl-module-net-domain \
+    perl-module-perlio \
+    perl-module-perlio-encoding \
+    perl-module-test \
+    perl-module-test-more \
+    perl-module-utf8 \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.39.5


