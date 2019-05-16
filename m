Return-Path: <oobitots@cisco.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 May 2019 09:04:11 UTC
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 419456025F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1401; q=dns/txt; s=iport;
	t=1557997452; x=1559207052;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=p7+3SFqHhcrPFyctiAoP0r1f49+eMNWFnyhf1Bt3FzQ=;
	b=XtvPiHvX8qQ/E65MuGWosNmpP6G/nqjJx29upnSTi6road4HQA7sZ0jY
	asebwCboSF7Xh4VDU1Cj2ZTv+CHjtJwJrjulbF8ysrF2gnZwYuDjwzFrJ
	d46BNOs5uh59qYCBO6hZTgGqr2oO5xZ0mYXoE6Pw8UMGoC1mxtPO6X26z k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BbAACDJN1c/4oNJK1kHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUwUBAQsBghBpVDAoCrFugXsJAQEBDAEBHxABAYRAgi0jNgcOAQMBAQQ?=
	=?us-ascii?q?BAQIBBG0dC4YLEQEtEgE+QicEDgUIgxuCCqxTg38BhjWBMwGLTheBf4RhiiY?=
	=?us-ascii?q?Ep1kJAh2BbIYhjDUjghSTWow0gSKTaAIRFYEwJgkogVdwFYMnCZBIQTEBj02?=
	=?us-ascii?q?BIQEB?=
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="273479277"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	16 May 2019 08:57:05 +0000
Received: from XCH-RCD-007.cisco.com (xch-rcd-007.cisco.com [173.37.102.17])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id x4G8v59R025959
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 08:57:05 GMT
Received: from xch-rcd-007.cisco.com (173.37.102.17) by XCH-RCD-007.cisco.com
	(173.37.102.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 16 May 2019 03:57:04 -0500
Received: from xch-rcd-007.cisco.com ([173.37.102.17]) by
	XCH-RCD-007.cisco.com ([173.37.102.17]) with mapi id 15.00.1473.003;
	Thu, 16 May 2019 03:57:04 -0500
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] protobuf: Fix ptest compilation
Thread-Index: AQHVC8VVzXsD9DBvQEuUegAB/ZO3HQ==
Date: Thu, 16 May 2019 08:57:04 +0000
Message-ID: <036838bbf1cb46dc9c9e3b16bd8027a0@XCH-RCD-007.cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.63.15.143]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.17, xch-rcd-007.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Subject: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Thu, 16 May 2019 09:04:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tests require c++11 support, so add -std=3Dc++11=0A=
to compiler flags.=0A=
=0A=
Upstream-Status: Pending=0A=
Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>=0A=
---=0A=
meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb | 4 ++--=0A=
1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
index cf72d9ca7..4791e13ca 100644=0A=
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
@@ -40,8 +40,8 @@ do_compile_ptest() {=0A=
# which haven't been installed yet.=0A=
cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
sed -e 's|libdir=3D|libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i=0A=
"${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
- sed -e 's|Cflags:|Cflags: -I${S}/src|' -i=0A=
"${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
- sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i=0A=
"${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
+ sed -e 's|Cflags:|Cflags: -std=3Dc++11 -I${S}/src|' -i=0A=
"${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
+ sed -e 's|Libs:|Libs: -std=3Dc++11 -L${B}/src/.libs|' -i=0A=
"${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
export PKG_CONFIG_PATH=3D"${B}/${TEST_SRC_DIR}"=0A=
# Save the pkgcfg sysroot variable, and update it to nothing so=0A=
=0A=
-- =0A=
2.19.1=0A=
=0A=
=0A=

