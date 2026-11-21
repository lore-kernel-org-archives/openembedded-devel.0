Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18639.1795276077340907622
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Nov 2026 07:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Ngqs2dgn;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout07.t-online.de (Postfix) with SMTP id E1D61E158
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 16:47:54 +0100 (CET)
Received: from localhost.localdomain ([84.154.170.58]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xUnJh-0lqVc00; Sat, 21 Nov 2026 16:47:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcupsfilters: fix the page count of PDF input
Date: Sat, 21 Nov 2026 16:47:46 +0100
Message-ID: <20261121154746.1155467-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795276073-B37FD922-4CE10CE6/0/0 CLEAN NORMAL
X-TOI-MSGID: 8253c4c7-a3bb-4ccf-9ea5-fa23766c422c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795276074; i=f_l_k@t-online.de;
	bh=wXzz+UJNDUSQ6xFPNQGG/qK1jE2fEHKFWjRsmkAK5Cw=;
	h=From:To:Subject:Date;
	b=Ngqs2dgnBUQ7QtWiMd1A5IPjO79V0JCcmknRZm/b+YOKik9NOKKqAQoMhF6A0kX7g
	 6tURUzJXpBAQSGYUVSr3KcChw4oXjJh7SR8S2xTQxhaI1zuU8pyK99vdKTEFYGR9bk
	 +Tet3xwKfkl2X/haC2bf8iFpMwJTTDNLsDi+aSe4Nu0HFI5c2o80a0Z41dd2TJWqP9
	 dtjNwRG8S9/1CTXMSKD7v65vKMEK8OlTgsBcksriusXm7LD3GI1O0Z3TMc7/jPOqVX
	 TGQJOINpivtzP71kwIpYo5HsnH2F4BCpiD182sV6nAsuFjWw+XWjBVHd/gY5ttWzIK
	 vbvwQ5gkKhmsw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 15:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132783
Content-Type: text/plain; charset="utf-8"

cfPDFPagesFP() copies the input into a temporary file and opens it with
PDFio without flushing the stdio buffer first, so small documents look
empty and the count fails. cfFilterGhostscript then stops every PDF job
with "Unexpected page count". Backport the upstream fix.

Tested by printing a PDF through CUPS to an IPP Everywhere printer.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ror-pdfio-output-Missing-Root-object.patch | 27 +++++++++++++++++++
 .../cups/libcupsfilters_2.2.1.bb              |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0002-Fix=
-printing-error-pdfio-output-Missing-Root-object.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0002-Fix-printi=
ng-error-pdfio-output-Missing-Root-object.patch b/meta-oe/recipes-printin=
g/cups/libcupsfilters/0002-Fix-printing-error-pdfio-output-Missing-Root-o=
bject.patch
new file mode 100644
index 0000000000..173521517d
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0002-Fix-printing-erro=
r-pdfio-output-Missing-Root-object.patch
@@ -0,0 +1,27 @@
+From e14bad406189a66bdeb40131112944bfb58ee0cc Mon Sep 17 00:00:00 2001
+From: szlt5 <117269245+szlt5@users.noreply.github.com>
+Date: Tue, 18 Aug 2026 16:04:19 +0800
+Subject: [PATCH] Fix printing error:  pdfio output "Missing Root object.=
"
+ (#167)
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilter=
s/commit/e14bad406189a66bdeb40131112944bfb58ee0cc]
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

