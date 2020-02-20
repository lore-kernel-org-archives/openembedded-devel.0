Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8A5615E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:57:15 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z7so2218408pgk.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GFid4h2/I3m5tZuLTJZTPoI9U28bBc5YMylWcbC8Wuc=;
	b=pukSXnWTlKg4b62RQTYWReKU+h7FW/KWC5y5XAH8C6WHrKPg2/uar2wcfJcaJfiMwC
	CQdzsEcnv9F0TtqZFhO1y4cEAorAbi3HbvWLyukIxuQP6oVbBmFRESmw4/ECn1OAg1y4
	fzzG7VwTsaP69k2rrL/V3FCiNKGhVoQKSykc3s+MGmsIu7OR5R1FQIL5ZJVwH2rmcfru
	4JDks6Pojpn3jL9EGMBq1WujUDuZ1KIKzwjiWwdheGatcj1f1BMqlxUZ/tFmtzzM6wzO
	bB0m+QyOCdCyN0MLEr54apbSJqxwpjCuTtIBzjS4Jd+rizP4uNq8e55IANukYYibmr9A
	/RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GFid4h2/I3m5tZuLTJZTPoI9U28bBc5YMylWcbC8Wuc=;
	b=ixmF9essK6/vNI9b8g24EOvfqtsYfm6Y/8RhK69Lt0G3p7DtvbvKnmT+U2vyTovpXc
	j3riEbhHxIS4VJ76oPpG0s7bSfHrQHSeKXS0TpTW/65ylifu6sSQ0jNdu9i9MYCGPteM
	vonsLTvdV3Fa2WU9MUWkCcEG6yaWiV832hOIc/pQMbQ0ha9PyxktJ25dVtkBIMzcqjcJ
	iVeTZAMjhg1W2kUrRLXJ9ojgCWA0ZwE6jK6qg0CPkkTh85pRMEjJJghTsQfUOWslPPiv
	dkOGsrXPElTRdZiILijlyQtPrz3SOMcdEMQPnj2bi9tCRjtUJBqol6e3RQbi/RUPdcap
	D7nQ==
X-Gm-Message-State: APjAAAVpnpEXIHSsqq9DjbYRUGb8sghp+/EZhTE4oK9fTpgl/UBaup46
	y6YoZzxRe7clnwnBXWGriEmBnq2mBtc=
X-Google-Smtp-Source: APXvYqx3DSCrZ5a7qJHyVg15O8Qa3z68wFVaVx3YYfq82r7PePJhV8j+zCFYYuXEKBeDX4TTqjak6g==
X-Received: by 2002:a62:4d87:: with SMTP id
	a129mr32645689pfb.116.1582217836069; 
	Thu, 20 Feb 2020 08:57:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id d3sm132164pfn.113.2020.02.20.08.57.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 08:57:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 08:57:27 -0800
Message-Id: <20200220165727.3714809-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] oprofile: Fix build with bfd 2.34+
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
X-List-Received-Date: Thu, 20 Feb 2020 16:57:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc  |  1 +
 .../0001-Use-new-bfd-APIs-from-2.34.patch     | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index a9ee775d45..0e1e2ed8c9 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://root-home-dir.patch \
            file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
            file://0001-replace-sym_iterator-0-with-sym_iterator.patch \
+           file://0001-Use-new-bfd-APIs-from-2.34.patch \
 "
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch
new file mode 100644
index 0000000000..faf56d1168
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch
@@ -0,0 +1,79 @@
+From 34745fb066a266ae6bbb15d08466d4d2cb6a2110 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Feb 2020 08:11:04 -0800
+Subject: [PATCH] Use new bfd APIs from 2.34+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libutil++/bfd_support.cpp | 10 +++++-----
+ opjitconv/create_bfd.c    |  6 +++---
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/libutil++/bfd_support.cpp b/libutil++/bfd_support.cpp
+index fa904839..e53a1530 100644
+--- a/libutil++/bfd_support.cpp
++++ b/libutil++/bfd_support.cpp
+@@ -137,7 +137,7 @@ static bool get_build_id(bfd * ibfd, unsigned char * build_id)
+ 		}
+ 	}
+ 
+-	bfd_size_type buildid_sect_size = bfd_section_size(ibfd, sect);
++	bfd_size_type buildid_sect_size = bfd_section_size(sect);
+ 	char * contents = (char *) xmalloc(buildid_sect_size);
+ 	errno = 0;
+ 	if (!bfd_get_section_contents(ibfd, sect,
+@@ -188,7 +188,7 @@ bool get_debug_link_info(bfd * ibfd, string & filename, unsigned long & crc32)
+ 	if (sect == NULL)
+ 		return false;
+ 	
+-	bfd_size_type debuglink_size = bfd_section_size(ibfd, sect);  
++	bfd_size_type debuglink_size = bfd_section_size(sect);  
+ 	char * contents = (char *) xmalloc(debuglink_size);
+ 	cverb << vbfd
+ 	      << ".gnu_debuglink section has size " << debuglink_size << endl;
+@@ -346,7 +346,7 @@ void fixup_linenr(bfd * abfd, asection * section, asymbol ** syms,
+ 	// first restrict the search on a sensible range of vma, 16 is
+ 	// an intuitive value based on epilog code look
+ 	size_t max_search = 16;
+-	size_t section_size = bfd_section_size(abfd, section);
++	size_t section_size = bfd_section_size(section);
+ 	if (pc + max_search > section_size)
+ 		max_search = section_size - pc;
+ 
+@@ -819,10 +819,10 @@ find_nearest_line(bfd_info const & b, op_bfd_symbol const & sym,
+ 	else
+ 		pc = (sym.value() + offset) - sym.filepos();
+ 
+-	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
++	if ((bfd_section_flags(section) & SEC_ALLOC) == 0)
+ 		goto fail;
+ 
+-	if (pc >= bfd_section_size(abfd, section))
++	if (pc >= bfd_section_size(section))
+ 		goto fail;
+ 
+ 	ret = bfd_find_nearest_line(abfd, section, syms, pc, &cfilename,
+diff --git a/opjitconv/create_bfd.c b/opjitconv/create_bfd.c
+index 48db143b..5c0e9152 100644
+--- a/opjitconv/create_bfd.c
++++ b/opjitconv/create_bfd.c
+@@ -86,12 +86,12 @@ asection * create_section(bfd * abfd, char const * section_name,
+ 		bfd_perror("bfd_make_section");
+ 		goto error;
+ 	}
+-	bfd_set_section_vma(abfd, section, vma);
+-	if (bfd_set_section_size(abfd, section, size) == FALSE) {
++	bfd_set_section_vma(section, vma);
++	if (bfd_set_section_size(section, size) == FALSE) {
+ 		bfd_perror("bfd_set_section_size");
+ 		goto error;
+ 	}
+-	if (bfd_set_section_flags(abfd, section, flags) == FALSE) {
++	if (bfd_set_section_flags(section, flags) == FALSE) {
+ 		bfd_perror("bfd_set_section_flags");
+ 		goto error;
+ 	}
+-- 
+2.25.1
+
-- 
2.25.1


