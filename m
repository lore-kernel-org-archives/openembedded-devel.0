Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.78])
 by mx.groups.io with SMTP id smtpd.web12.9500.1616396840197036405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 00:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=IuTzbTh+;
 spf=pass (domain: kpit.com, ip: 40.107.138.78, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2YP1FctKinKVbYO9u4P2sFGeQftx+9/G1tvdekiRYX13Gpbw6ijBohKe6k5s3F+Qry7DTJFcV97h7ushHJiM8pq78eejDDZH4UarqXVwUHX4YhaufQJxdob8zTDyhw5rullm7L/QlLMf3UC2aDZK831ym12rdaotaUt896qB2yUSgiXYHvVbHpI7HELeNgiTfUhWhhx2Qq7pta1i/r6pRTkJZe2ETquNUT4saXvR8lXpVVQ0yEck9heOK/1VJg5QaiGUEhCdN+dOKTFGCTUz+lqUulaaq+k/1GGwvzmUHPX+J9KcfrdwdstL9KA33W8Q5aaovEp+p/f/EpsdlyDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h69RrUqBGoxe1JQpOwU8Ij7FubdluHetNiJCKVcCq94=;
 b=iH7nuGq4phJmRWJ9VPdzdchO0hYOO26MsNS8yaICkx/yn+iK8RisMtDC6wYHqenj6GJAn4Xx+jlXYUPavuQZaG79MSy10NZkttUoicrGKMOjMPKlCzRq1uZSidKlBxno+udmw3zV7ZkmCdgcw2UemDEaccEgXTbVzvJ1VBAVEH6bMJqaAi7sahqL4giJjvRkmwZtLvsaUDVZvk4qvF9E5ohe9dPwIyfWdy4QY8m4kAp3T08VRpYdNoac4HYSDHKUDdjdidAcfzkdmLZzI/CLQNB5s0Kg57nEgKuZOWRue09QvF1Edyz+gY14qYyAbh/NVBz9AbTIfaUgqElcZPLYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h69RrUqBGoxe1JQpOwU8Ij7FubdluHetNiJCKVcCq94=;
 b=IuTzbTh+vARMeTNr/dAsacu+VrZVOPh90Jk4BbIMO0cYYw0VzddR6DL3a2Bh+dWi+6bvXRUgqj6vOjEKhCJaCdB5rVGJKhQFKwwjLPCNRIqAYKrWlNC2CmZ8HmFEPkGAvqn1O05FdIGR/W2yKGQFb0MH2nY6VQcx9yObujWGGOE=
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN2PR01MB4826.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 07:07:11 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 07:07:11 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted patches
Thread-Topic: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted
 patches
Thread-Index: AQHXGWdSOU74kTBoP02WwN2QmppbIqqPoLAx
Date: Mon, 22 Mar 2021 07:07:10 +0000
Message-ID: 
 <PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1615790942-1428-1-git-send-email-Harpritkaur.Bhandari@kpit.com>,<1615790942-1428-2-git-send-email-Harpritkaur.Bhandari@kpit.com>
In-Reply-To: <1615790942-1428-2-git-send-email-Harpritkaur.Bhandari@kpit.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [1.186.38.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a95a53a-a264-42d5-0b02-08d8ed011d54
x-ms-traffictypediagnostic: PN2PR01MB4826:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PN2PR01MB4826933127A47312BD71604BEF659@PN2PR01MB4826.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WqBoLQ8StyHfRQ3x0PFZTYMZk8ayBz8zfcjGdEwgxHvG3XnlhqTPnrZHFptbSKEPdZC8KyowQ+tDvrZeItX9HsrKBmu23Ym+0ng9iSYlXfTwsqkZgql+qL2OE3z5kF2z/4j3wdqNd4muBWIIITQCyeN1KJMquM2wTpydUdQffoZPRlGOhnguKjRq7CfQkGeK8B0waYeDSr6mWaaHxTm4nm9k/4T7B5CqKrmL3URMutN0lyLYcDqZnIJkU7cIaE4/Z/ElB5xhyfzHnbv2dLZsGTCqIaZNnEgGdlt3FxK5gBkUr8uK1/6NnOdlNOU33vdoEriGJCfstDmyz0WsMPTfOe4n4mvXOo7tdvtpqiC0aHlAkxYBhKc+yUDvWeyrDCc3hSN/+i9IsS72+CQSN39nVA7kIWysDb8pSryHCvHlnjoBNUYYUK8u1Ku9HNJX5JwJjVtqDjYBiGRWCyugU/mjKIQvBvbCvzLELJr9Q8YvbhfCmFvfdE3t6uOoSs3Qmf+G5hhhUy+H1IOm8Z9WbjRopjifxtn6MslxViEyP3wLud0upNNS2kshmjGQPePWksRZ4vbLlIQuAOM7MyBZZwznagoeJlZrUVzJnSy7t2OC263L/HOJ2WijcbS9boL2TBqd9yyuKApUnRCHlf0LpQpdqDTzB3TA4YrgEYOZ6yH4rP5Y7XFUOjoVXMetcTCUn+jB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(55236004)(19627405001)(6506007)(53546011)(66574015)(166002)(478600001)(26005)(33656002)(83380400001)(86362001)(107886003)(110136005)(5660300002)(8936002)(66946007)(316002)(66556008)(38100700001)(66476007)(66446008)(186003)(64756008)(4326008)(52536014)(91956017)(71200400001)(8676002)(7696005)(55016002)(9686003)(76116006)(2906002)(26123001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 BbbHz7nQXf6RSA4YKXgPkOI5yLpI4Q/kotdkQIPiwkP470p18+qho4k5OmBr7TGvhH2nm5M5hDToUzQnBdg5Qm0tImLASRXVM728gOM04HeEw+8mUCD0vrfiFHG0imwXwLfeVMcifS1I29Jh1MorKrNCCHjm/BgX97dhyE7rqs/4/eZpOe6mm7cZ8uUSLP/kznrVZttJKjJ5gqB8IEKc7ZsRLMWM1BiN0nsUKa3SQVDzLAdcl65Weyk2TEoTyF/17gHvsavGYXpouM77L7jOPPvGc47sykdqp/XBbGfYrD5WuWa8A4TOzR14pvCHJ+LyuGp59mJcTCCYfKC+PCfa+hB+9D2W0S6ttU/fXTa56XhE2lzZ64XoIfJHsoyA+fSzzjnTCbpHO+WQ71kTrGYuTStKPCdURhcEwLSLUDw6/yxddSy+Y+LkpxmQlXlZnuw2FbpZHwhafP2FVfggJ5TtOadRPf39LTZiZnm2vpRpdfE2S7GfrYW3qb7LgNpaFn4taDWnwFRqLOboQMl3im5ymnAmJTMr1IB5SzJaJao2duz6qVIxXhdHCgzG58waoC5bmQ+q2JShjKYOBJt2n3a/822UTTVBDXtz5JXNphAPFeoOb5kDMcGA6rJ0YbxeaipAApYn5ESP7G3FB20Kb6i3l68yoAHUbpSsTygo9dVgbDNPwLDa2J3LkEDqZEvczdDI6q8DPqZgfx1LrpaqdkYxNw==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a95a53a-a264-42d5-0b02-08d8ed011d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 07:07:10.7040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fez947dCVIlvkRT3xDEUVLV/EAa6+IJ7vxQMwwjk0HjYPimNyO8D2TBck3YAqAcxxeGdfN5lrdxrAvXa/L0EJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4826
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659PN2PR01MB4410INDP_"

--_000_PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659PN2PR01MB4410INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Can you please confirm when this patch will get merged in gatesgarth branch=
.

Thanks,
Harprit Bhandari

________________________________
From: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Sent: 15 March 2021 12:19
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari <Harprit=
kaur.Bhandari@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted patche=
s

From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>

rapidjson is upgraded to latest SRCREV so
removing the below patches which are not
applicable:
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 ------------------=
-
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40 ------------------=
----
 2 files changed, 76 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake=
-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remove-mar=
ch-native-from-CMAKE_CXX_FLAGS.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove=
-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/ra=
pidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.=
patch
deleted file mode 100644
index 745f5d0..0000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardco=
ded-CMAKECONFIG_INSTALL_DIR-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
-From: Ruslan Bilovol <rbilovol@cisco.com>
-Date: Thu, 24 Jan 2019 18:11:39 +0200
-Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
-
-Currently this path is hardcoded to lib/cmake.
-Some distributions have different library path (like lib64).
-So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
-configurable and usable in such distros.
-
-Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/8d2=
72e53a4d1dc405e08ce2dd50159c58f4451e9]
-
-Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7c60407..0275672 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_N=
AME}ConfigVersion.cmake.in
-     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
-
- # ... for the install tree
--SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
-+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
- FILE( RELATIVE_PATH REL_INCLUDE_DIR
--    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
-+    "${CMAKECONFIG_INSTALL_DIR}"
-     "${CMAKE_INSTALL_PREFIX}/include" )
-
- SET( ${PROJECT_NAME}_INCLUDE_DIR "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INC=
LUDE_DIR}" )
---
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-nati=
ve-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjso=
n/remove-march-native-from-CMAKE_CXX_FLAGS.patch
deleted file mode 100644
index cf3e16e..0000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from=
-CMAKE_CXX_FLAGS.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Mon, 19 Dec 2016 01:37:11 -0800
-Subject: [PATCH] remove -march=3Dnative from CMAKE_CXX_FLAGS
-
-Not appropriate when cross compiling.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/CMakeLists.txt
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/CMakeLists.txt
-+++ git/CMakeLists.txt
-@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
-
- if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR ${CMAKE_SYSTEM_PRO=
CESSOR} STREQUAL "ppc64" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     else()
-       #FIXME: x86 is -march=3Dnative, but doesn't mean every arch is this=
 option. To keep original project's compatibility, I leave this except POWE=
R.
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     endif()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
-     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconvers=
ion -Wsign-conversion)
-@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
-       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=3Dnative")
-     else()
-       #FIXME: x86 is -march=3Dnative, but doesn't mean every arch is this=
 option. To keep original project's compatibility, I leave this except POWE=
R.
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     endif()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-mi=
ssing-field-initializers")
-     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconvers=
ion -Wimplicit-fallthrough -Weverything)
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659PN2PR01MB4410INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
;">Hi,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
;">Can you please confirm when this patch will get merged in&nbsp;</span><s=
pan style=3D"color: rgb(50, 49, 48); font-family: Calibri, Helvetica, sans-=
serif; font-size: 12pt; background-color: rgb(250, 249, 248); display: inli=
ne !important;">gatesgarth
 branch.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(50, 49, 48); font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syste=
m, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font=
-size: 17px; background-color: rgb(250, 249, 248); display: inline !importa=
nt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(50, 49, 48); font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; background-color: rgb(250, 249, 248); display: in=
line !important;">Thanks</span><span style=3D"color: rgb(50, 49, 48); font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; background-color: =
rgb(250, 249, 248); display: inline !important;">,</span><span style=3D"col=
or: rgb(50, 49, 48); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web =
(West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemF=
ont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 17px; backg=
round-color: rgb(250, 249, 248); display: inline !important;"><br>
</span><span style=3D"color: rgb(50, 49, 48); font-family: Calibri, Helveti=
ca, sans-serif; font-size: 12pt; background-color: rgb(250, 249, 248); disp=
lay: inline !important;">Harprit Bhandari</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color:rgb(50, 49, 48);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:17px;font-weight:600;background-color:rgb(250, 249, 248);display:inline !=
important"><br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Harpritkaur Bhandari =
&lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Sent:</b> 15 March 2021 12:19<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<=
br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Harpritkaur Bhan=
dari &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Subject:</b> [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted=
 patches</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Harpritkaur Bhandari &lt;harpritkaur.bhandar=
i@kpit.com&gt;<br>
<br>
rapidjson is upgraded to latest SRCREV so<br>
removing the below patches which are not<br>
applicable:<br>
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch<br>
<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
(cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)<br>
Signed-off-by: Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@kpit.com&gt;<b=
r>
---<br>
&nbsp;...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 -------------=
------<br>
&nbsp;.../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40 -------------=
---------<br>
&nbsp;2 files changed, 76 deletions(-)<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-=
CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remov=
e-march-native-from-CMAKE_CXX_FLAGS.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove=
-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/ra=
pidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.=
patch<br>
deleted file mode 100644<br>
index 745f5d0..0000000<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardco=
ded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001<br>
-From: Ruslan Bilovol &lt;rbilovol@cisco.com&gt;<br>
-Date: Thu, 24 Jan 2019 18:11:39 +0200<br>
-Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path<br>
-<br>
-Currently this path is hardcoded to lib/cmake.<br>
-Some distributions have different library path (like lib64).<br>
-So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR<br>
-configurable and usable in such distros.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/Tencent/rapidjson=
/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9">https://github.com/Tencen=
t/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9</a>]<br>
-<br>
-Signed-off-by: Ruslan Bilovol &lt;rbilovol@cisco.com&gt;<br>
----<br>
- CMakeLists.txt | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 7c60407..0275672 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_N=
AME}ConfigVersion.cmake.in<br>
-&nbsp;&nbsp;&nbsp;&nbsp; ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config=
Version.cmake @ONLY)<br>
- <br>
- # ... for the install tree<br>
--SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )<br>
-+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )<b=
r>
- FILE( RELATIVE_PATH REL_INCLUDE_DIR<br>
--&nbsp;&nbsp;&nbsp; &quot;${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DI=
R}&quot;<br>
-+&nbsp;&nbsp;&nbsp; &quot;${CMAKECONFIG_INSTALL_DIR}&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp; &quot;${CMAKE_INSTALL_PREFIX}/include&quot; )<br>
- <br>
- SET( ${PROJECT_NAME}_INCLUDE_DIR &quot;\${${PROJECT_NAME}_CMAKE_DIR}/${RE=
L_INCLUDE_DIR}&quot; )<br>
--- <br>
-1.9.1<br>
-<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-nati=
ve-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjso=
n/remove-march-native-from-CMAKE_CXX_FLAGS.patch<br>
deleted file mode 100644<br>
index cf3e16e..0000000<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from=
-CMAKE_CXX_FLAGS.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001<br>
-From: Andre McCurdy &lt;armccurdy@gmail.com&gt;<br>
-Date: Mon, 19 Dec 2016 01:37:11 -0800<br>
-Subject: [PATCH] remove -march=3Dnative from CMAKE_CXX_FLAGS<br>
-<br>
-Not appropriate when cross compiling.<br>
-<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Signed-off-by: Andre McCurdy &lt;armccurdy@gmail.com&gt;<br>
----<br>
- CMakeLists.txt | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-Index: git/CMakeLists.txt<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/CMakeLists.txt<br>
-+++ git/CMakeLists.txt<br>
-@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)<br>
- <br>
- if (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;GNU&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL &quot;power=
pc&quot; OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL &quot;ppc64&quot; OR ${CMAKE=
_SYSTEM_PROCESSOR} STREQUAL &quot;ppc64le&quot;)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -mcpu=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #FIXME: x86 is -march=3Dnative, but d=
oesn't mean every arch is this option. To keep original project's compatibi=
lity, I leave this except POWER.<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -march=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -Wal=
l -Wextra -Werror&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wf=
loat-equal -Wconversion -Wsign-conversion)<br>
-@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES &quot;C<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX=
_FLAGS} -mcpu=3Dnative&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #FIXME: x86 is -march=3Dnative, but d=
oesn't mean every arch is this option. To keep original project's compatibi=
lity, I leave this except POWER.<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -march=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -Wal=
l -Wextra -Werror -Wno-missing-field-initializers&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wf=
loat-equal -Wconversion -Wimplicit-fallthrough -Weverything)<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659PN2PR01MB4410INDP_--
