Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B259D78246
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 14:45:38 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 9so13664982pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8y6TS+EcNpDaiTSbRkgf0f+KCOnSr8eo4qFg1xsngT8=;
	b=VI7CIHsBpptFwr1urgvsDJap7p6EdxcItq2SiSw0qN5lIT9mCwPxk7pCvD7y+V6H3T
	Ifh7wmhpqUOZXtvmWApdVtRnLpEm56+pFJtd1byR8iUSj/3z0AjPZTueD2uux1HoeGpD
	P4xBxcsAhQsy7paPFjtcdeDnp9GQhiDz+we8kjSWOXiodLz5ox+wMuIPuousGTdYQdaY
	KVh7jjCapwvUKwremCVaECFsG2rPxFNZDWa5XpxDEdSp1dZ3cLAmhix2NTSoBuydd3u6
	Y3Jb4tkwKfRYhN7NuSkAmuYuqraPgjEWjtCYV1ewhtmPNTmFivYKSreOqEw4ZeI64/c0
	JQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8y6TS+EcNpDaiTSbRkgf0f+KCOnSr8eo4qFg1xsngT8=;
	b=iY4Mw5wDARqj0cn4gBV9E1osuxQXtlZPDas2CgcRK62tCAFM4eSBNwslYKy58G7eWj
	Aq1mVnSo4bc8+sq+1NzU/tQb/ekaE67KjGs8UdiciiLsu6pOHUPOKfGCXJd936cT4KnF
	MVq3apaQK9Eaa5Oy2ARxNQh8RsmahOYjsZRcYwNqJMW2/lBvjW8OgsawSrhlhqgCCVhN
	+KbwqeuCXKU4Cvztm20ucXmmQTAsOF4QyrS58q0AhG9HkzAyGxBi3Pj43hP0EjWT+LNB
	yMgfWuCBl/CLTXIC4eZp2StCoEPBYm5dHdaRGbY9x7vOPXBNVi2STP5j4IScVBVYW25b
	EyEg==
X-Gm-Message-State: AODbwcCQE7rACaRe+b8qd5t8rw6bba7pxVMkq5Rb59dlYJR9Mvofi3eD
	LfeDw3eiG20ur/Po
X-Received: by 10.98.106.199 with SMTP id f190mr2857920pfc.41.1495809939920;
	Fri, 26 May 2017 07:45:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	y78sm2399183pfd.32.2017.05.26.07.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 07:45:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 May 2017 07:45:29 -0700
Message-Id: <20170526144530.7471-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [meta-perl][PATCH 1/2] meta-perl: Make glibc-gconv deps apply for glibc based systems alone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 May 2017 14:45:40 -0000

musl does not provide separate gconv packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb | 2 +-
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 0c53b6a27..1ef9f0bc3 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
 DEPENDS += "libidn"
 # We must need glibc-gconvs to enable charset related functions,
 # such as Net::LibIDN::idn_to_ascii().
-RDEPENDS_${PN} += "glibc-gconvs"
+RDEPENDS_${PN}_append_libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
 SRC_URI[md5sum] = "c3e4de2065009d67bcb1df0afb473e12"
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 934be0399..275ccb8c9 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -10,7 +10,7 @@ documentation."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
-RRECOMMENDS_${PN} += "glibc-gconvs"
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
-- 
2.13.0


