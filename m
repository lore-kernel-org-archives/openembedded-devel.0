Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.16149.1584820938442170258
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2020 13:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=KvNXYk0f;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=daxo=5g=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48lBPh4PsGz4b
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2020 21:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584820936;
	bh=k8b24vKTG97g5Qlccb7o8SL68x8wWamuu6jkjs7rPvk=;
	h=From:To:Subject:Date:From;
	b=KvNXYk0fORPWEDTk6kNFupbO9CAzDZJaqrXO/zH9WI4POXbNkncGMF4FQnjGCTkRP
	 u/MR2rIZutndmXwn1cIxXpdqxsnWji2W2Wne21gwH/EHgYu8TaSPwVjuSB5CrB/Vhg
	 nfM/zVKjcpRL5V4ef/5+GbPI6URTGsRM/rIt7cXfSbpQWYbkfVX9i0HGr2ai/ZCAk/
	 JDNdZlu7WgMcZmEKVpG5WBcmzjJVlkBnhSXsnTfV6PWLJe3f+IP/qRY6juHJg2yis7
	 sJRA/GZ+fTpV+rdbmWvNWYHMbOnzpDaQDMB/Zfe/ckgzjHMnzvjvUtUOe/GsT5orHn
	 X14vQIM5Q2/ibz8q9WBqr9mFxNa3ZokahLDRYSKONV3mXMvwhan1n36U+m4v8jfNR7
	 6reUgkCIYRfDsmdrBjd+EKcQJRQnYBO6HDoR98RLjc1N6VEuaKAhHQRshp2zJ3xKnR
	 ymXRICubXIeULQia/eQYds3jUm+6mQg7ECmXFHU6eH0upyD3MXqQh7xtlHCPeyYwcM
	 MG3ttWxIOUJl0JQ+NgwZjaSPItiUni2yNbjRba1mYRpg3ETt+VtA98RawyL/TH+FX5
	 nZSjIOACV18ZG1ysiramL3s3W6YrBkANnqZdxm1/86mgVfEZ2lm2nYWPjNNtKGogwr
	 yVe1M5ECk2bQqJZFFMyuNl2o=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] octave: Fix QA issues
Date: Sat, 21 Mar 2020 22:02:15 +0200
Message-Id: <20200321200215.2021-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

WARNING: octave-4.4.1-r0 do_package_qa: QA Issue: package contains desktop file with key 'MimeType' but does not inhert mime-xdg [mime-xdg]
WARNING: octave-4.4.1-r0 do_package_qa: QA Issue: octave: SRC_URI uses PN not BPN [src-uri-bad]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/octave/octave_4.4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
index 71d24504f..ec3e8258a 100644
--- a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
+++ b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "gperf-native texinfo lapack pcre readline"
 
-inherit autotools pkgconfig texinfo gettext
+inherit autotools pkgconfig texinfo gettext mime-xdg
 
 EXTRA_OECONF = "--disable-java --disable-docs"
 
-SRC_URI = "${GNU_MIRROR}/octave/${PN}-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/octave/${BPN}-${PV}.tar.gz \
            file://fix-blas-library-integer-size.patch \
 "
 
-- 
2.17.1

