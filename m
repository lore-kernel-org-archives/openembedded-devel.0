Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.2775.1589911389560194415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 11:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=EP1wAQae;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ypzx=7b=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49RNyz5QZyz3l
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 20:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589911387;
	bh=4yN27VOPDlBOtZyOnoz92ja1zwy21ptnHtSCdjvWNvc=;
	h=From:To:Subject:Date:From;
	b=EP1wAQaeSgYZjZ1gWOltk6a8NwH8e7fV8gocJZN7qBP31HcNkA/zqLOgSPtH1QrO5
	 hCPahOaEAcHSGTfNYH15FwnXJuoOwZoWWLQuWBQoxoCSEwo64v9xvQcVwAbwUH/78w
	 dpG9Her9ODcYzMzKFJLlkvSzBlV34EvzfiEURFE6V2OzFnriClDnRGB5Vbc5yGTRED
	 3EYhQ10k/pr2arHshRrhCzz/9TDTu6zxwTaHTEwQiz413ydeveqm7te+HqXcp8sDVN
	 7N2j9Dbl574kJOFgKZrTQ2pFnk4/SYcRjno/L55sohsMivPQuEBE08ddz09nvfJ/0h
	 U2l+dUGArqZdNHIpekAIvxMU+T3hrRqmOVb4Pz+yspPJzxcYpEnYlHZeNxGcBnUxbm
	 VWw22af1Bs5DNqXRQRFf7YkthVn1csSWzqI9NDTTcrahydVOA74TrVkRn+fmH5GlXW
	 dHFUJUq0RFKPvBAbt3Eub04iaTXLGmUMmWkLi1I7th10bX+E+HgTLGRitxoPFDQGdy
	 63Q+RHynLv8qlKqSNXkHj3UCkEsCPi+2L4Ru/7gJO83Dft03+ud2vMx+6Kop82Vorm
	 l7YBCnJL3NSmssb0TYGVOEo+dGDdaP+VWXYsTtN0uzuOwvezIgL18wDhbSTyuwomNr
	 I3VPhBxWwKveF7RPcXqozLbM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] unicode-ucd: Stop broken license downloading
Date: Tue, 19 May 2020 21:03:06 +0300
Message-Id: <20200519180306.31619-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismatch for local file=
 /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html
Cleaning and trying again.
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming /home/bunk/yoctomaster/=
yocto-tmp/downloads/unicode.org.license.html to /home/bunk/yoctomaster/yo=
cto-tmp/downloads/unicode.org.license.html_bad-checksum_e9dd7d435db23241b=
e3be21b5fca729b5cf883c8c039a70ea093031420d06abb
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum failure encountered wit=
h download of https://www.unicode.org/license.html;name=3Dlicense;subdir=3D=
unicode-ucd-12.1.0;downloadfilename=3Dunicode.org.license.html - will att=
empt other sources if available

This downloaded a license file from upstream.
The upstream file did not match (copyright year changed).
A stale copy was downloaded from a mirror instead and checked.
The stale file with known contents never changes.

Replace with a dummy check on a local copy of the license file.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../unicode-ucd/files/license.html            | 98 +++++++++++++++++++
 .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
 2 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.htm=
l

diff --git a/meta-oe/recipes-support/unicode-ucd/files/license.html b/met=
a-oe/recipes-support/unicode-ucd/files/license.html
new file mode 100644
index 000000000..25e8452e9
--- /dev/null
+++ b/meta-oe/recipes-support/unicode-ucd/files/license.html
@@ -0,0 +1,98 @@
+<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html>
+
+
+
+<head>
+
+<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"=
>
+<meta http-equiv=3D"Content-Language" content=3D"en-us">
+<meta name=3D"VI60_defaultClientScript" content=3D"JavaScript">
+<meta name=3D"GENERATOR" content=3D"Microsoft FrontPage 12.0">
+<meta name=3D"keywords" content=3D"Unicode Standard, copyright">
+<meta name=3D"ProgId" content=3D"FrontPage.Editor.Document">
+<title>Unicode License Agreement</title>
+<link rel=3D"stylesheet" type=3D"text/css"=20
+
+href=3D"http://www.unicode.org/webscripts/standard_styles.css">
+
+<style type=3D"text/css">
+pre {
+	FONT-FAMILY: Arial, Geneva, sans-serif;
+}
+</style>
+
+
+</head>
+
+
+<body text=3D"#330000">
+
+  <table width=3D"100%" cellpadding=3D"0" cellspacing=3D"0" border=3D"0"=
>
+    <tr>
+
+      <!-- BEGIN CONTENTS -->
+
+      <td>
+
+
+<blockquote>
+<h2><a name=3D"License">UNICODE, INC. LICENSE AGREEMENT - DATA FILES AND=
 SOFTWARE</a></h2>
+
+<pre>
+See <a href=3D"https://www.unicode.org/copyright.html">Terms of Use</a> =
for definitions of Unicode Inc.'s
+Data Files and Software.
+
+NOTICE TO USER: Carefully read the following legal agreement.
+BY DOWNLOADING, INSTALLING, COPYING OR OTHERWISE USING UNICODE INC.'S
+DATA FILES ("DATA FILES"), AND/OR SOFTWARE ("SOFTWARE"),
+YOU UNEQUIVOCALLY ACCEPT, AND AGREE TO BE BOUND BY, ALL OF THE
+TERMS AND CONDITIONS OF THIS AGREEMENT.
+IF YOU DO NOT AGREE, DO NOT DOWNLOAD, INSTALL, COPY, DISTRIBUTE OR USE
+THE DATA FILES OR SOFTWARE.
+
+COPYRIGHT AND PERMISSION NOTICE
+
+Copyright =C2=A9 1991-2019 Unicode, Inc. All rights reserved.
+Distributed under the Terms of Use in https://www.unicode.org/copyright.=
html.
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of the Unicode data files and any associated documentation
+(the "Data Files") or Unicode software and any associated documentation
+(the "Software") to deal in the Data Files or Software
+without restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, and/or sell copies of
+the Data Files or Software, and to permit persons to whom the Data Files
+or Software are furnished to do so, provided that either
+(a) this copyright and permission notice appear with all copies
+of the Data Files or Software, or
+(b) this copyright and permission notice appear in associated
+Documentation.
+
+THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF
+ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
+WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT OF THIRD PARTY RIGHTS.
+IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS
+NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL
+DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THE DATA FILES OR SOFTWARE.
+
+Except as contained in this notice, the name of a copyright holder
+shall not be used in advertising or otherwise to promote the sale,
+use or other dealings in these Data Files or Software without prior
+written authorization of the copyright holder.
+</pre>
+
+</blockquote>
+
+
+
+      </td>
+
+    </tr>
+
+  </table>
+</body>
+</html>
diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb b/=
meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
index 89ab565ce..644e454c4 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
@@ -1,18 +1,15 @@
 SUMMARY =3D "Unicode Character Database"
 HOMEPAGE =3D "https://unicode.org/ucd/"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://unicode.org.license.html;beginline=3D42;end=
line=3D85;md5=3D67619d0c52706853c0256514e7fd04cd"
+LIC_FILES_CHKSUM =3D "file://../license.html;beginline=3D42;endline=3D85=
;md5=3D67619d0c52706853c0256514e7fd04cd"
=20
 SRC_URI =3D " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=3Ducd;subdi=
r=3Ducd \
-    https://www.unicode.org/license.html;name=3Dlicense;subdir=3D${BP};d=
ownloadfilename=3Dunicode.org.license.html \
+    file://license.html \
 "
 SRC_URI[ucd.md5sum] =3D "430cbdac2615451571dd69a976dd08f6"
 SRC_URI[ucd.sha256sum] =3D "25ba51a0d4c6fa41047b7a5e5733068d4a734588f055=
f61e85f450097834a0a6"
=20
-SRC_URI[license.md5sum] =3D "f03bafb623258f85ff2032c1ce567b7c"
-SRC_URI[license.sha256sum] =3D "983225207de8a707d0903a8d70fb7a4b28c5e0f6=
4f2366e84a6192a2d618fed4"
-
 inherit allarch
=20
 do_configure[noexec] =3D "1"
--=20
2.17.1

