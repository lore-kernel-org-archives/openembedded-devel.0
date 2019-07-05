Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 838CE7ECFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:53 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m10so7935627edv.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=enI6zrdA+cNRcwQF019NDIILriYauzvhJk8B7ukTY2w=;
	b=smPdNhAQZeVqeJ3UbFQ2uZpAVma4U/V4ROeeElWglGEG/v9KpEp0u9z/VzS96N59He
	QLxPLhaGckzLLt8kPm5t8za6qUtF5sXuWIh600aPiK53BQS6vCBquJyKa9MJ85Ei1Cs3
	Bqj3MbYfAhbQUuoVkbfY83I/Y6CQ9lhup1xnMGlQryE13C0/6tvThf7zl3ndtFaM/Leg
	eHPBdK5xzBX+GwV5pUnOvbx4mraOCvVCtf0vw2bo/zPar19Zq3w3gJxw+Vv5EPmmG0aU
	nW0IKNRUV2sMqJjHLx0Oo3t74yTuMH1ewMRoVGhVCShjZwLndZa2VnKrxQg2FXAJlfFA
	gIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=enI6zrdA+cNRcwQF019NDIILriYauzvhJk8B7ukTY2w=;
	b=UGs+Yg8znpqHiGNTGCm7iqijgQwHzxyLMftGN1fjcsL9MqWgBW73CxbrsnT2bqVhvo
	N0DnMdv5qTapOEUOfDHmtivywRpO7tDczlAa78XJ32vnI7H26P/PdVPgGeN62Qahvwr6
	JOxo2jlr4MrI+7C9UA7/yArtAA8QMuQUnn7Lms+K6g0OFcQ2REmIkX4iZLYz/DPz60LM
	41f+sowrUqt2OECTwOIObE9m+nu4HOPuyWABsKu8HCHZppcAppIV0vMjhp5ypuzNJLwn
	wMg9MAT+F1cotUH4XJvauU3/AWCbtUbqQn4dm6syTc2vtYTfuePdfprrV3N+EH64bFYr
	bBUg==
X-Gm-Message-State: APjAAAVJD0VLK1gd4yS5+0TX9+CsMDHVA9xVwbkftj4i6bWsq2nvBT+O
	054La6DxlP2A4VvbuDoU9aCuNrC27uw=
X-Google-Smtp-Source: APXvYqz4wRGZi1r06lSSLwkZv4axj5v2PEpi5KMdj3yAHOdwxpn6IB/ArvzMTo0xnDHLSS4KnBEmWQ==
X-Received: by 2002:a17:906:11d6:: with SMTP id
	o22mr3032349eja.60.1562325534099; 
	Fri, 05 Jul 2019 04:18:54 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:53 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:08 +0200
Message-Id: <20190705111824.22255-8-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 07/23] javasqlite: Create cc tool to make libtool happy
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:53 -0000
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
index d721d66..06fbac2 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -7,7 +7,7 @@ That API is wrapped by methods in the SQLite.Database class=
."
=20
 LICENSE =3D "BSD"
 SECTION =3D "application"
-PR =3D "r0"
+PR =3D "r1"
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
+	echo '${BUILD_CC} $@' >> ${STAGING_BINDIR_NATIVE}/cc
+	chmod a+x ${STAGING_BINDIR_NATIVE}/cc
+}
--=20
2.20.1


