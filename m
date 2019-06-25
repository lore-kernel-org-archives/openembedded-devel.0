Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0D77DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:36 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k21so25763046edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4B5qBR6+4MyjUbPlzwBoCGy+Ux9dtEazlyLyUG4uPAs=;
	b=T0Dh8KanxFNkEPmogmf3Q9JZwyr+X7tAYMKwmYeko0allaFi6w4znocGOU8ndyO4Ks
	SE9+Cag2E6uhpL6ky1faSJMclcb2ywZeekZtsAeesiObf99DSzxJP8tENWMjdxBltnlq
	ftCpLYKJMb2ciJol5E9iDOneyt3AbTq1HiBCy/UCFiyNpnCmBEFeszXuDEIgTJOjDwM9
	PC8JbC7YKVptsKhoSrcOAw9M16AO5bGcTl0zr+bZSM1TOF9mJOOZvWHb6mhfEQyEM6+D
	5P3w++yTurE5wP0quEhvryVEl7phHnbZkj9eg0cHLz43PNS6Ern3hKFHsIaWb3YUyVcY
	5OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4B5qBR6+4MyjUbPlzwBoCGy+Ux9dtEazlyLyUG4uPAs=;
	b=rd1EQTutWGP8c5mHKiIY3XU6KWA4x0JWKRxzYJYLtgUldHkGrQwwi613gv+zEKMhOg
	p8cnjQJOzAMVMeRnfQeF9NkgqBZihZmlDKRc20GqdnH7T7i7w55Jjf3vz1FJ1V/cC40n
	XsLoo2U/66iVhM0oVZqwyynxclT5Bjmy5ylv2cMoT11nRgv799DH2puNk9K7a1Hc4ld1
	qCl/JN+ZiX9i0yhEGsia05H8rAFXlxUtVVJPlw9kSzNsbKmLlC2J62R2tGaURkOq8UxG
	xUqrJ3MRtbCDuVaMa3plHbpqgzZv3LDFFSOQVlR9U69VIxpKVogwllKScyxuyTj35bDL
	CqNA==
X-Gm-Message-State: APjAAAXiZWPjmL7145wb7YeLe7Z7HNS7JTUqaP3Lu+qvYo87Dvj5/B7b
	y4zAIAr6dYZk8grhBwCNb43LfJd4u3c=
X-Google-Smtp-Source: APXvYqwEwdWQvSGtFJW3Fsjsyum4cd24PYhzZh//FHUpcYchJVDDXXbgl67PqDFgd5iNtS0T4yx6RQ==
X-Received: by 2002:a17:906:49ce:: with SMTP id
	w14mr13808769ejv.168.1561449156786; 
	Tue, 25 Jun 2019 00:52:36 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:35 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:07 +0200
Message-Id: <20190625075223.13585-8-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 07/23] javasqlite: Create cc tool to make libtool happy
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:36 -0000
Content-Transfer-Encoding: quoted-printable

Libtool has hardcoded cc as the name for the compiler. We make a script
that calls gcc.

Fixes:

| ./libtool --mode=3Dlink cc -I/workdir/build/tmp/work/dbfp4-poky-linux/jav=
asqlite/20150419-r0/recipe-sysroot-native/usr/lib/jvm/icedtea7-native//incl=
ude -I/workdir/build/tmp/work/dbfp4-poky-linux/javasqlite/20150419-r0/recip=
e-sysroot-native/usr/lib/jvm/icedtea7-native//include/linux  -I/workdir/bui=
ld/tmp/work/dbfp4-poky-linux/javasqlite/20150419-r0/recipe-sysroot-native/u=
sr/include -DHAVE_SQLITE2=3D0 -DHAVE_SQLITE3=3D1 -DHAVE_SQLITE_FUNCTION_TYP=
E=3D0 -DHAVE_SQLITE_OPEN_AUX_FILE=3D0 -DHAVE_SQLITE_SET_AUTHORIZER=3D0 -DHA=
VE_SQLITE_TRACE=3D0 -DHAVE_SQLITE_COMPILE=3D0 -DHAVE_SQLITE_PROGRESS_HANDLE=
R=3D0 -DHAVE_SQLITE3_MALLOC=3D1 -DHAVE_SQLITE3_PREPARE_V2=3D1 -DHAVE_SQLITE=
3_PREPARE16_V2=3D1 -DHAVE_SQLITE3_BIND_ZEROBLOB=3D1 -DHAVE_SQLITE3_CLEAR_BI=
NDINGS=3D1 -DHAVE_SQLITE3_COLUMN_TABLE_NAME16=3D0 -DHAVE_SQLITE3_COLUMN_DAT=
ABASE_NAME16=3D0 -DHAVE_SQLITE3_COLUMN_ORIGIN_NAME16=3D0 -DHAVE_SQLITE3_BIN=
D_PARAMETER_COUNT=3D1 -DHAVE_SQLITE3_BIND_PARAMETER_NAME=3D1 -DHAVE_SQLITE3=
_BIND_PARAMETER_INDEX=3D1 -DHAVE_SQLITE3_RESULT_ZEROBLOB=3D1 -DHAVE_SQLITE3=
_INCRBLOBIO=3D1 -DHAVE_SQLITE3_KEY=3D0 -DHAVE_SQLITE3_SHARED_CACHE=3D1 -DHA=
VE_SQLITE3_OPEN_V2=3D1 -DHAVE_SQLITE3_LOAD_EXTENSION=3D0 -DHAVE_SQLITE3_BAC=
KUPAPI=3D1 -DHAVE_SQLITE3_PROFILE=3D1 -DHAVE_SQLITE3_STATUS=3D1 -DHAVE_SQLI=
TE3_DB_STATUS=3D1 -DHAVE_SQLITE3_STMT_STATUS=3D1 -DCANT_PASS_VALIST_AS_CHAR=
PTR=3D1  -DSQLITE_ENABLE_COLUMN_METADATA=3D1 -DSQLITE_DLL=3D1 -o native/mkc=
onst native/mkconst.c
| libtool: link: cc -I/workdir/build/tmp/work/dbfp4-poky-linux/javasqlite/2=
0150419-r0/recipe-sysroot-native/usr/lib/jvm/icedtea7-native//include -I/wo=
rkdir/build/tmp/work/dbfp4-poky-linux/javasqlite/20150419-r0/recipe-sysroot=
-native/usr/lib/jvm/icedtea7-native//include/linux -I/workdir/build/tmp/wor=
k/dbfp4-poky-linux/javasqlite/20150419-r0/recipe-sysroot-native/usr/include=
 -DHAVE_SQLITE2=3D0 -DHAVE_SQLITE3=3D1 -DHAVE_SQLITE_FUNCTION_TYPE=3D0 -DHA=
VE_SQLITE_OPEN_AUX_FILE=3D0 -DHAVE_SQLITE_SET_AUTHORIZER=3D0 -DHAVE_SQLITE_=
TRACE=3D0 -DHAVE_SQLITE_COMPILE=3D0 -DHAVE_SQLITE_PROGRESS_HANDLER=3D0 -DHA=
VE_SQLITE3_MALLOC=3D1 -DHAVE_SQLITE3_PREPARE_V2=3D1 -DHAVE_SQLITE3_PREPARE1=
6_V2=3D1 -DHAVE_SQLITE3_BIND_ZEROBLOB=3D1 -DHAVE_SQLITE3_CLEAR_BINDINGS=3D1=
 -DHAVE_SQLITE3_COLUMN_TABLE_NAME16=3D0 -DHAVE_SQLITE3_COLUMN_DATABASE_NAME=
16=3D0 -DHAVE_SQLITE3_COLUMN_ORIGIN_NAME16=3D0 -DHAVE_SQLITE3_BIND_PARAMETE=
R_COUNT=3D1 -DHAVE_SQLITE3_BIND_PARAMETER_NAME=3D1 -DHAVE_SQLITE3_BIND_PARA=
METER_INDEX=3D1 -DHAVE_SQLITE3_RESULT_ZEROBLOB=3D1 -DHAVE_SQLITE3_INCRBLOBI=
O=3D1 -DHAVE_SQLITE3_KEY=3D0 -DHAVE_SQLITE3_SHARED_CACHE=3D1 -DHAVE_SQLITE3=
_OPEN_V2=3D1 -DHAVE_SQLITE3_LOAD_EXTENSION=3D0 -DHAVE_SQLITE3_BACKUPAPI=3D1=
 -DHAVE_SQLITE3_PROFILE=3D1 -DHAVE_SQLITE3_STATUS=3D1 -DHAVE_SQLITE3_DB_STA=
TUS=3D1 -DHAVE_SQLITE3_STMT_STATUS=3D1 -DCANT_PASS_VALIST_AS_CHARPTR=3D1 -D=
SQLITE_ENABLE_COLUMN_METADATA=3D1 -DSQLITE_DLL=3D1 -o native/mkconst native=
/mkconst.c
| ./libtool: line 1720: cc: command not found
| make: *** [Makefile:222: native/mkconst] Error 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/javasqlite/javasqlite_20150419.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-core/javasqlite/javasqlite_20150419.bb b/recipes-core/=
javasqlite/javasqlite_20150419.bb
index d721d66..6a41cee 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -7,7 +7,7 @@ That API is wrapped by methods in the SQLite.Database class=
."
=20
 LICENSE =3D "BSD"
 SECTION =3D "application"
-PR =3D "r0"
+PE =3D "1"
 SRC_URI =3D  " \
     http://www.ch-werner.de/javasqlite/${BPN}-${PV}.tar.gz \
     file://0001-fix-errors-during-cross-compile.patch \
@@ -40,3 +40,9 @@ INSANE_SKIP_${PN}-dev =3D "dev-elf"
 do_configure_append (){
 	cp ${S}/*-libtool ${S}/libtool
 }
+
+do_compile_prepend (){
+	echo '#!/bin/sh' > ${STAGING_BINDIR_NATIVE}/cc
+	echo 'gcc $@' >> ${STAGING_BINDIR_NATIVE}/cc
+	chmod a+x ${STAGING_BINDIR_NATIVE}/cc
+}
--=20
2.20.1


