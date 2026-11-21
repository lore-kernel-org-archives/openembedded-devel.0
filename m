Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19257.1795278301288762449
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Nov 2026 08:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=bmXk+mtS;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id 0120264A
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 17:24:41 +0100 (CET)
Received: from localhost.localdomain ([84.154.170.58]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xUntH-366rQG0; Sat, 21 Nov 2026 17:24:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libcupsfilters: fix the page count of PDF input
Date: Sat, 21 Nov 2026 17:24:32 +0100
Message-ID: <20261121162432.2430934-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795278279-FFFDC363-1B692956/0/0 CLEAN NORMAL
X-TOI-MSGID: c6646cab-ecc0-4120-baf9-21a0ee349a8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795278280; i=f_l_k@t-online.de;
	bh=bs8/gmbdN/llkB7kn3r5Dwoay3Ot4Ry2q6dLC3DmbVw=;
	h=From:To:Subject:Date;
	b=bmXk+mtS1tk6hrSnNNN6QRMVmiPKcATI0+h/ZTg3UrK3G54teo0yAhxMTn2zyHnRm
	 fs6JG5dLKgyCH56swCqCuSNBpnwYckpoJ5BBkppcm587szwJzgx6A627Z1u/cq/P3t
	 pYvIhov78cIDZP8P0QcFY9cAKzJyOgeDgfJ8UAwK+DLOEyGMwjPaC3drTrs4SE2ovv
	 OdZIzk67aOXntIYJ5kglO85DF4I1QHK0/9OBzgMjdGeDyynp4CP+B7CunJXuYaqSUJ
	 1DLWwAfdj4bF8cfznIi1Og485t4KwKg7ywGTuVofA16FAEa7WhxBuDrCiGbvJbZKND
	 G2N8lwTSAtSUg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 16:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132784
Content-Type: text/plain; charset="utf-8"

cfPDFPagesFP() copies the input into a temporary file and opens it with
PDFio without flushing the stdio buffer first, so small documents look
empty and the count fails. cfFilterGhostscript then stops every PDF job
with "Unexpected page count". Backport the upstream fix.

Tested by printing a PDF through CUPS to an IPP Everywhere printer.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ror-pdfio-output-Missing-Root-object.patch | 28 +++++++++++++++++++
 .../cups/libcupsfilters_2.2.1.bb              |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0002-Fix=
-printing-error-pdfio-output-Missing-Root-object.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0002-Fix-printi=
ng-error-pdfio-output-Missing-Root-object.patch b/meta-oe/recipes-printin=
g/cups/libcupsfilters/0002-Fix-printing-error-pdfio-output-Missing-Root-o=
bject.patch
new file mode 100644
index 0000000000..ee473b1367
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0002-Fix-printing-erro=
r-pdfio-output-Missing-Root-object.patch
@@ -0,0 +1,28 @@
+From e14bad406189a66bdeb40131112944bfb58ee0cc Mon Sep 17 00:00:00 2001
+From: szlt5 <117269245+szlt5@users.noreply.github.com>
+Date: Tue, 18 Aug 2026 16:04:19 +0800
+Subject: [PATCH] Fix printing error:  pdfio output "Missing Root object.=
"
+ (#167)
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilter=
s/commit/e14bad406189a66bdeb40131112944bfb58ee0cc]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ cupsfilters/pdf.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/cupsfilters/pdf.c b/cupsfilters/pdf.c
+index 1f714b203..3e4386091 100644
+--- a/cupsfilters/pdf.c
++++ b/cupsfilters/pdf.c
+@@ -165,6 +165,11 @@ cfPDFPagesFP(FILE *file) 	// I - File pointer of PD=
F
+     fwrite(buffer, 1, bytes_read, temp_fp);
+   }
+=20
++  // call fflush(temp_fp) to flush the stdio buffer;=20
++  // otherwise pdfioFileOpen() may not see the complete contents of tem=
p_filename because=20
++  // some data may still be buffered and not yet written to the file.
++  fflush(temp_fp); =20
++
+   // Open the temp file with pdfio
+   pdfio_file_t *pdf =3D pdfioFileOpen(temp_filename, NULL, NULL, NULL, =
NULL);
+=20
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb b/meta=
-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
index c1a887b3ec..957994b6d8 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
@@ -7,6 +7,7 @@ DEPENDS =3D "cups fontconfig libexif dbus lcms pdfio libp=
ng jpeg tiff"
=20
 SRC_URI =3D "https://github.com/OpenPrinting/${BPN}/releases/download/${=
PV}/${BP}.tar.xz \
            file://0001-Makefile.am-Only-generate-test_text_lorem.txt-for=
-ma.patch \
+           file://0002-Fix-printing-error-pdfio-output-Missing-Root-obje=
ct.patch \
            "
 SRC_URI[sha256sum] =3D "0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8f=
d73710ed821d4860"
=20
--=20
2.56.1

