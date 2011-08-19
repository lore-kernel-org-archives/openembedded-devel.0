Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QuPsB-0003V7-FW
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 16:16:36 +0200
Received: by qwh5 with SMTP id 5so2128287qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KvwILkZGzfgLK9YABBl50rUaGuzgeo1lTxyau5o14OU=;
	b=b+t+sGTpp7XSgworvft6zNWiHVwvKc5KT407qaEIdEuZiuymyhcD1j+jePY6jxe5Lk
	Wam1U6Jxubpfk9zqPPH3wxFT1LFOEFNSiVoTTAcewXn74vva7LrwECOipnjOB9yewgdd
	OAHwaAa6PioQp0P1nKZ0KvDqZgj8NJj4yyDIE=
Received: by 10.224.208.130 with SMTP id gc2mr454195qab.329.1313763114126;
	Fri, 19 Aug 2011 07:11:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.239.76 with HTTP; Fri, 19 Aug 2011 07:11:33 -0700 (PDT)
In-Reply-To: <CACrTVg+OATbFizVqggezkfyM_k0i-JVfuBv3FNj0f59JthmvQQ@mail.gmail.com>
References: <CACrTVg+OATbFizVqggezkfyM_k0i-JVfuBv3FNj0f59JthmvQQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 19 Aug 2011 16:11:33 +0200
Message-ID: <CACrTVgLU_=OHhepbGWM-m5U_siu_wBjci9-__xSO9ryhYdDh5Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libpng: upgrade to 1.2.46
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 14:16:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
I have modified my patch to remove the old filepatch too. patch below :

From d953f12a1e311e2417b5564071ed25c700754d89 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Sylvain=3D20'GarthPS'=3D20Par=3DC3=3DA9?=3D <sylvain.pare=
@gmail.com>
Date: Fri, 19 Aug 2011 15:39:23 +0200
Subject: [PATCH] libpng: upgrade to v1.2.46 and removed old patch
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

 This addresses the following security advisories:

* CVE-2011-2690

* CVE-2011-2692

Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
---
 recipes/libpng/files/makefile_fix.patch |   18 ------------------
 recipes/libpng/libpng_1.2.44.bb         |    8 --------
 recipes/libpng/libpng_1.2.46.bb         |    6 ++++++
 3 files changed, 6 insertions(+), 26 deletions(-)
 delete mode 100644 recipes/libpng/files/makefile_fix.patch
 delete mode 100644 recipes/libpng/libpng_1.2.44.bb
 create mode 100644 recipes/libpng/libpng_1.2.46.bb

diff --git a/recipes/libpng/files/makefile_fix.patch
b/recipes/libpng/files/makefile_fix.patch
deleted file mode 100644
index 3fa8793..0000000
--- a/recipes/libpng/files/makefile_fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Old versions of libtool (1.5.10) used to set ECHO as a side effect. With
-libtool 2.2.2 we need to do this manually
-
-RP - 14/4/08
-
-Index: libpng-1.2.16/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libpng-1.2.16.orig/Makefile.am    2008-04-14 14:47:21.000000000 +0100
-+++ libpng-1.2.16/Makefile.am    2008-04-14 14:47:47.000000000 +0100
-@@ -102,6 +102,8 @@
-             >$@.new
-     mv $@.new $@
-
-+ECHO=3Decho
-+
- libpng.vers: libpng.sym
-     rm -f $@ $@.new
-     $(ECHO) PNG@PNGLIB_MAJOR@@PNGLIB_MINOR@_0 '{global:' > $@.new
diff --git a/recipes/libpng/libpng_1.2.44.bb b/recipes/libpng/
libpng_1.2.44.bb
deleted file mode 100644
index 4ba7b20..0000000
--- a/recipes/libpng/libpng_1.2.44.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libpng.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI +=3D "file://makefile_fix.patch"
-
-SRC_URI[libpng.md5sum] =3D "e3ac7879d62ad166a6f0c7441390d12b"
-SRC_URI[libpng.sha256sum] =3D
"b9ab20f1c2c3bf6c4448fd9bd8a4a8905b918114d5fada56c97bb758a17b7215"
diff --git a/recipes/libpng/libpng_1.2.46.bb b/recipes/libpng/
libpng_1.2.46.bb
new file mode 100644
index 0000000..e036be5
--- /dev/null
+++ b/recipes/libpng/libpng_1.2.46.bb
@@ -0,0 +1,6 @@
+require libpng.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI[libpng.md5sum] =3D "e8b43dc78ef95b3949af7f961d76874b"
+SRC_URI[libpng.sha256sum] =3D
"a5e796e1802b2e221498bda09ff9850bc7ec9068b6788948cc2c42af213914d8"
--=20
1.7.4.1

