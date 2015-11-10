Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A8F9176294
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:26:25 +0000 (UTC)
Received: by wmec201 with SMTP id c201so154431982wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=Vx93M7hjK6yBW5gGBaYC96Her4lPJ4qrPnXNvv4ev8Q=;
	b=ju4pBJoFp/UHS++u1sOgLlZ9vhB0fhmq6GHIfmyh0wvPOsTaq5mrzKyGXa99vMluTC
	smwLcVH9shAfUis3klBjNvUE0lqzA5TmnZOEBYi9d7bQyFuK4kzH+3kPEg8NJSNZvSdr
	0zTTpPJpfU4Z9W1B3+Zm94jYfGAVi6EwjQjDPRW9DtcWjX3jUhksE08Ebyjawu8m1MV2
	URdV/A7n/UkS1LuczKYM0/fRfaqaFDXOI/O0s6aSqJZk1+qQXb/sjz29aBO/Mgz+hF78
	279WGzHaQTDw8brNa4GyyxZnvWWT4qovMci/I9C1ENwwEGIrqrs5kplqv/BzRNxTQtSk
	k99Q==
X-Received: by 10.28.15.136 with SMTP id 130mr7520157wmp.36.1447190785765;
	Tue, 10 Nov 2015 13:26:25 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	wx10sm5546493wjb.40.2015.11.10.13.26.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 13:26:25 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Date: Tue, 10 Nov 2015 22:26:23 +0100
Message-Id: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: [meta-oe][PATCH 3/3] libldb: make openldap optional, but default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 21:26:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since openldap isn't required, but used when found, allow qualified
users to disable the requirement to save some space.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
index 44f061a..07a839d 100644
--- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
+++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
@@ -4,9 +4,12 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
=20
 DEPENDS +=3D "libtdb talloc libtevent popt"
-RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
+RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
 RDEPENDS_pyldb +=3D "python libtdb libtalloc"
=20
+PACKAGECONFIG ??=3D "ldap"
+PACKAGECONFIG[ldap] =3D ",,openldap"
+
 SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch =
\
           "
--=20
1.9.1

This results from analysing why there's still an openldap ...

I know, having no knob to disable ldap is dirty, but there is no such =
switch.
Even more dirty, the switch in samba_4% is for embedded samba3 =
source-base only,
the ldb bundled with samba4 just uses ldap when found.

The patch relies on the idea of qualified users - those who know that =
they
don't want ldap, disable it everywhere and whistle.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


