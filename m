Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1622E77225
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:18:12 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so41098576wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=eghCWTDsrFh3lus7oygJ+g77wFhfPaKpi4EX4UIZL8o=;
	b=ncnKVVxbrDK0Bho3034S7TjmMloqHSpaOK9iBdFpg1ofXMaruaH4sGrJwi0Dq4++La
	iy3LN5rV0D72IYzbB7aygudCz20TPvsNaPSm677SGHkRkqz5VgVDM21e9AJqY5n5xsJC
	xL2FG9V6iLi/yr6gZhx6fwgtffK9ANGjnUQ02dr9KWI0IF/RrNzNUEN9JlYFL49YPfhr
	cgb5HGfeTwRS1e1tuwj3BTh/1AeOAqZQtsr9KBIt/iGQMh7/XunuGhQh3S7e/y2oh82y
	xuOu8FxJ20dCJFggcSL5evySAuAqH0D4ngqkbX/Qcze8+BjtUkWXVUY7uw/Oc3R/bmN+
	iy6w==
X-Received: by 10.28.10.142 with SMTP id 136mr47923065wmk.84.1447345092722;
	Thu, 12 Nov 2015 08:18:12 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	ej10sm14322868wjd.32.2015.11.12.08.18.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Nov 2015 08:18:12 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <43A9AEEE-D1B5-449A-A86E-BE9E3F2B90B1@gmail.com>
Date: Thu, 12 Nov 2015 17:18:11 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH v2 3/3] libldb: explain dependency to openldap better
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
X-List-Received-Date: Thu, 12 Nov 2015 16:18:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since openldap is a "used when there" dependency, explain how to
get rid of it. To ensure successive builds have identical results,
ensure openldap is - in case it's wanted - available for configure
stage, not at packaging stage.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
index 44f061a..128daf7 100644
--- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
+++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
@@ -4,9 +4,14 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
=20
 DEPENDS +=3D "libtdb talloc libtevent popt"
-RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
+RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
 RDEPENDS_pyldb +=3D "python libtdb libtalloc"
=20
+# openldap is a "used when there" dependency without the opportunity
+# to disable via option
+# when this is the only recipe using openldap, remove it in .bbappend
+DEPENDS +=3D "openldap"
+
 SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch =
\
           "
--=20
2.4.9 (Apple Git-60)

--=20
Jens Rehsack - rehsack@gmail.com


