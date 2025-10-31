Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55C6CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:44:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.18515.1761925454942206116
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LdAG09Vu;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-429b7eecf7cso1629799f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761925453; x=1762530253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A77mxpZApfGZsZeLEH2FACCm0RPh4W3hEnMT4rNVK4w=;
        b=LdAG09Vun2tcE69woDI7nExJ2eE6JFXDe/+ZXjIWgvH7PAwkMFtTch5zd4n+uVzBSR
         TB2gVGzTh2PmgqsHmW+QOvAaUcBpjpYcn4jwbPwryBmEZB21xELAqwDL8lF8LQ+5sOfy
         NKcZQqC6ruA6bt4gYkYM0ZcRng7Ngik4Szbqyg3VYP+6gsqthlTjQzUoB2njySvabEsJ
         +A56MwZUzwzoV80CO0JLiOLVVn5eXb4k6ttllwGLAnDU3nSbAAgBmh+sMmF7hPYLZR5a
         wAqyirwgLZZtoKoY/GrIL/7yIiKam6lC4SSBlFNV3uVDR5xYURRSqthYISbCYHTbGYJD
         oGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925453; x=1762530253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A77mxpZApfGZsZeLEH2FACCm0RPh4W3hEnMT4rNVK4w=;
        b=XMbnuhkOyAoaIpgY2N0MiK8ea9DSC5dxeVt4dJOTuQHkumZH0Ozswsf6Y8hgAtyF5e
         J/lYwlXc+j0bf+o1hB0pBQHFA2dGFfoivl6J1YUwLcWz/qDBRuhezfUxSYoRe1aU6qtN
         Sl5wMzHAgAyS4/fDsn6pOXOft/nXIcxkEhC8u1xcbMg1Vhm+mjEXBs9CJLi9LessWmQ4
         7pAkylebRS8PInBCD9Dj/b7QDycvrxmZflrAPGjpzoEj+12GSXigUtv+0nU4lxXXef63
         qsklgqe+Q9DjT3B8lRc+cKUMzLK+MG+bUsFfdyT/ruMBklPZUPVAAeHKfPGfa8yheGp2
         M6yA==
X-Gm-Message-State: AOJu0YyUifG39FFoycsUdAsDhxDbSYkJJEVKQtzL+GHiTtXVTd//m/Pn
	+X3oE6/vODsN+TczAAIO4KnOSOyAppdJ5S2D6cAuBddEBJxrkAS1bJYf9CvV3Ye3
X-Gm-Gg: ASbGncvzs3QI912szgloKh4M1UMvIYFU3rcyU84Ce41p+aPK+MiMRDwu4iDCgcf5PNA
	OVHuKh+dG1TLnwa1fwBXvQH7i7AcjPnXN6Orc7jgc2xT+sotyglK7DzVP+ghScbU+B6PsbSQcpI
	MeJu4nrU/VkDA6DtCgt+MFaInp0A97ZWHzgnsCDQZ8P1Bf2toP4KYO5EOOu6vXPpB3H3Hrgd/TK
	yWoaZCkM+ZZfFJuLe1ZhMyam0SxEOuRgZd5wUM7u4lqYqDKApCXY6hY3TKumIPrMIyqtPCf1ode
	3ytI8xXnoMiqsQxs3NSV/GMXggZKBWJz1y0NG8ogqXc0yuJ4jhMsOgjlAeKThQYgzHzszyDd3T3
	RF0FB2M4IrvAd2RevDgU/iiIoPQuCXchb7Va3YJLftM4z3dugRgyoSMWKX6SGlCxhbpQE77QrRX
	M6vrM1wA0A
X-Google-Smtp-Source: AGHT+IGx45XW7R7Vm3C6Dnn9YDH/5cbhHDMBwHz+gwV7sNh/lyfrJmyaASJ+FKnA9wbGheI4J0dsEw==
X-Received: by 2002:a5d:5f93:0:b0:428:3d14:7378 with SMTP id ffacd0b85a97d-429b4c84687mr6984266f8f.24.1761925452966;
        Fri, 31 Oct 2025 08:44:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c23b8d9sm5606635e9.0.2025.10.31.08.44.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 08:44:12 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH] libnet-dns-perl: fix ptests
Date: Fri, 31 Oct 2025 16:44:11 +0100
Message-ID: <20251031154411.1238514-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 15:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121239

Enable network connection to get a test unstuck that was trying to access the network.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libnet/files/run-ptest         |  6 ++++++
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb | 11 ++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/files/run-ptest b/meta-perl/recipes-perl/libnet/files/run-ptest
index c9f9ca94d0..48d72a78fa 100644
--- a/meta-perl/recipes-perl/libnet/files/run-ptest
+++ b/meta-perl/recipes-perl/libnet/files/run-ptest
@@ -1,5 +1,11 @@
 #!/bin/sh
 
+if ! nslookup example.com; then
+    mv /etc/resolv.conf /etc/resolv.conf.bak
+    echo "nameserver 8.8.8.8" > /etc/resolv.conf
+    trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
+fi
+
 for case in `find t -type f -name '*.t'`; do
     perl $case >$case.output 2>&1
     ret=$?
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
index c768d64e32..3432076ade 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=de95b6a896d5f861
 
 DEPENDS += "perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz \
+           file://run-ptest"
 
 SRC_URI[sha256sum] = "5a40e7cf524e4bd2c33cf03b82b47d5308b712083aa5ee180b0b5af54c71fbd2"
 
@@ -49,6 +50,14 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-overload \
 "
 
+do_install_ptest_perl:append(){
+    # This test tries to reconcile the MANIFEST file content with the actual
+    # package content. While this might be useful for package integrity
+    # verification, it is not much for runtime testing. It also requires the
+    # whole source package to be installed. Rather just drop this test.
+    rm ${D}${PTEST_PATH}/t/00-install.t
+}
+
 python __anonymous () {
     # rather than use "find" to determine libc-*.so,
     # statically export the known paths for glibc and musl

