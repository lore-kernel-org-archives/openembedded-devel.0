Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDA1CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:26:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.6565.1761402384921641665
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YE77AxEl;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso2799083f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761402383; x=1762007183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1r0GrTknpgRc3Byw0uFLGTX3dSrRikgJe/Pxw4Omn4=;
        b=YE77AxElzg4Q4BL5P0JngMJZUMNqmFIwb3yNBb509xgEYcDz5x22NNCL4g1a4OfCD0
         PMfHMZpz0YwGtKLRy+H97bvJM8JjixFdyYG1s0KktI6Mt2B66bBB9csMWojPu/jzXhLw
         sRdO+fcbLBccXXCAiDWyVTYr5hDF/iA65AeGPuXuN6FYwWK0tlV+SzgA/4Vv9OWJ4Rkp
         eCvK3aZAflFrVcluYMM3OYA/tGx61XOJsrHGwYyGAb0fB+Zxkkje+++tHLplLmkAukv1
         GftH23P75U2k1u7jjVZeqv5hJ5X3vwwQnSDUXxC7Lz96XdVqE+ips56bHC6X1dxNQ5xw
         6PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761402383; x=1762007183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1r0GrTknpgRc3Byw0uFLGTX3dSrRikgJe/Pxw4Omn4=;
        b=vY8TCkrpnI1j8ui5hMVKh33E/VwedB2AOvvqG3aRlJa1YLOS9uOCDKmYCcz+5HSHTG
         KsbIuT0XCaFw2191PekeB+/jh4kG22sIDXSgFs6IA4hjrCGPIZmNesPjqkRuykF91980
         Gy+Jcww0v/hteG52ZTCCL4dA9uVnBh1TRZrcboaZsJWTVmW+5nbjzYvbUBn22QNnFcbJ
         h6inK/bGPXWFIRXLnOpkh9XzVvKWOo84CmjecTBlmDygH2t41qE2eGJMgiujI4IjlvCO
         +NsPpIy8UznGA1FAT+6H9kk7BK4IcC0OyM9uE3bpEg+0TSAGVPTN8HRDZjflvM/1J+U3
         np3g==
X-Gm-Message-State: AOJu0Ywa5IvuB4mfwOc8KsFT3FeQ7mBTEc9cZWeZjneqkUy7xrKjOqsZ
	f/Zaft0davKm1D+3Bm6j1QZ1nbCCJZSTBxY+AimMgH22JaxJGWCx0w7E2y47Hg==
X-Gm-Gg: ASbGncv5i75eYEqse6qhsEbDlq7AH/OBgttHoaemGDFlAzBoDuhC7FJpDrTxgefWd3z
	tsoQ57LX1ramhMMWHlTUEYFNu8L6+U7xO7Ebwd2JJ/zZiedKoi0Xa1QYSwzmP9MDPdTWYeI61si
	qFkTDoT61m36GCvY4gqvFqKgxYgSVvKSBt0W5caWmODUQt29ztE0/3Hl907GncGsaVYFJhG3BOj
	RZzQ0DUTl6PXOd/FZFzZ3g8+/YABlhEz+0H1XPGlq+8Zhc8Vn+139nwtWkhc46/PyCwfey/N/gU
	u+uRv6dyAf0+xR4uj4X2C1UNNLIHQXLSTWLDSIUQrPf1bKlhOe87XVa2bKRbpXzes29i8TZ1eGS
	p+stgVXqlx/OEu02ltzpsflLXEjHy/Dxibis+a/emMq4GV9/PsQk/PBFY7yuYBRJeb7TAlgIWlw
	==
X-Google-Smtp-Source: AGHT+IGuSSiEkQymaEr4m/dFZtYNjmodsQe8C4tr/iJrSlyGDM/uSgY8P/vnfPlYAkgc0YWCq+MjVw==
X-Received: by 2002:a05:6000:178f:b0:429:92d8:3371 with SMTP id ffacd0b85a97d-42992d8343dmr3683742f8f.11.1761402383005;
        Sat, 25 Oct 2025 07:26:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm3867482f8f.0.2025.10.25.07.26.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 07:26:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 1/5] libnet-dns-perl: upgrade 1.52 -> 1.53
Date: Sat, 25 Oct 2025 16:26:17 +0200
Message-ID: <20251025142621.1566114-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 14:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121001

Also fix ptests.

Changelog:
-Suppress autovivified undefined $rr->{class} and $rr->{ttl}.
-Rework test scripts for SVCB and DELEG.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-perl.inc   |  2 +-
 ...ns-perl_1.52.bb => libnet-dns-perl_1.53.bb} | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.52.bb => libnet-dns-perl_1.53.bb} (71%)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index e923bd00c4..612754635b 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -25,6 +25,7 @@ PTESTS_FAST_META_PERL = "\
     libmime-base32-perl \
     libmime-types-perl \
     libmozilla-ca-perl \
+    libnet-dns-perl \
     libnet-ldap-perl \
     libnet-ssleay-perl \
     libstrictures-perl \
@@ -47,7 +48,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
     libhtml-parser-perl \
     libmodule-build-tiny-perl \
-    libnet-dns-perl \
     libnet-dns-sec-perl \
     libunix-statgrab \
     libxml-libxml-perl \
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.52.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.53.bb
similarity index 71%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.52.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.53.bb
index d0f8141794..cccbb16a59 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.52.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.53.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c9884fcb08e4d03c23188d4e10836c2382fcb65b69859581a20845a3235a7203"
+SRC_URI[sha256sum] = "04acb4f177d57c147dcedc4bd70e23806af3db75a532f46f95461b2bc9a94959"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
@@ -41,12 +41,27 @@ RRECOMMENDS:${PN} += " \
     libnet-dns-sec-perl \
 "
 
+do_install_ptest_perl:append(){
+    install ${S}/MANIFEST ${D}${PTEST_PATH}
+    cp -r ${S}/lib ${D}${PTEST_PATH}
+    cp ${D}${PTEST_PATH}/t/TestToolkit.pm ${D}${PTEST_PATH}
+
+    # This test tries to reconcile the MANIFEST file content with the actual
+    # package content. While this might be useful for package integrity
+    # verification, it is not much for runtime testing. It also requires the
+    # whole source package to be installed. Rather just drop this test.
+    rm ${D}${PTEST_PATH}/t/00-install.t
+}
+
 RDEPENDS:${PN}-ptest += " \
     perl-module-encode \
+    perl-module-encode-encoding \
     perl-module-encode-byte \
     perl-module-extutils-mm \
     perl-module-extutils-mm-unix \
     perl-module-overload \
+    perl-module-perlio \
+    perl-module-perlio-encoding \
 "
 
 python __anonymous () {
@@ -61,4 +76,3 @@ python __anonymous () {
        raise bb.parse.SkipRecipe("incompatible with %s C library" %
                                    d.getVar('TCLIBC'))
 }
-

