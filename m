Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web11.503.1622050376524261783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 10:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bkqf1bWj;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: nisha.parrakat@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVfqfjyFWWDvtS95/4xx+iqfzCvSKh06Lo/gVpvGSXNbsLolw/ICoN/3AHopEP4ZuyHbf8Tb3IBaywmY3Lj3ynuNUFvdso7wjnVPW5xrkWpgiC3zDXJiVwMaqAzA9wESH1+OOu2V+TIhEmw5TvmDYHwvEKAaB82xGY7Hesgjgz6Bs3av5oOoktbIWEpyF0eNMy7wDDBTRzGTYcR+Mx84xg7zP3+d/4PLeA7+BKBUIgiiW6ZHtiL7ZNIT2xeTfkMhM2hbGGTs1NWyEf3DY3YDSsa+u301u6tWYti58dJr95+uzn/WrNQ9yOQf1VrpWUc264DIYpveY+qFQRJx1GyTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pctp45vmv7KzpS0vCjNfg+NaJkfCkkVLU/XHqKJVZRQ=;
 b=jnqr6lE59JLZITuRN5E43MOhavk0dqJXHhPB8pbSJUXWpEtb1b3ZcS2G9/MtnSxRipHFm00Kz908tq2buevsjGlqvOOKjL20DU4DJvDqc9j8oZlBHskO4/Df+/WZeJCFpoFgXpBwwwhQCLsFVY+swp8UEXu7KJ1MvRI/2mL5XaoakvNNWH+n3l8iTX21QJHhbxMTDgCdLum7Dtw8xui0m4UAdt+yWIifGlJNTrDDDGMtN64SmfWbvAzoloIyCM+qU5QdQdfHsHdo+Gp/vIYzW5iOp2711mRv+CsU238GmrTJrKy3bd1At7fraupv6AwRiiur1iGK0abTjO0W0d8zTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pctp45vmv7KzpS0vCjNfg+NaJkfCkkVLU/XHqKJVZRQ=;
 b=bkqf1bWj7rYbojzw3iLZficoxS7VctBLA/Ilx2+ahsprzigf5gjuja33GXHXpDv+j/dS53MapoDG8yHn+RPLObHsvigUIoXUYFqRjj9QPmtHHlZWf38LBHA9HhjHAruSXeQxaqjYlseJctq5zK4SbVBb/EauqCJEqXk8NbE6kVI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6)
 by PNYPR01MB5164.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 17:32:50 +0000
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167]) by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167%3]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 17:32:50 +0000
From: "Nisha Parrakat" <Nisha.Parrakat@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
Date: Wed, 26 May 2021 17:32:28 +0000
Message-Id: <20210526173229.553-1-Nisha.Parrakat@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2003:c0:f3b:b059:3a22:e2ff:fe1a:a816]
X-ClientProxiedBy: PR3P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::29) To PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:36::6)
Return-Path: Nisha.Parrakat@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bsys_traas.speedport.ip (2003:c0:f3b:b059:3a22:e2ff:fe1a:a816) by PR3P189CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend Transport; Wed, 26 May 2021 17:32:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc552e6-6e3a-40dc-beef-08d9206c4860
X-MS-TrafficTypeDiagnostic: PNYPR01MB5164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNYPR01MB5164C3E4E54B586BAB424A96EE249@PNYPR01MB5164.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NRXDODwDC1ZVuaE03BuLc0UwxI8HBJH/pPQbsbmPhtvyGboAwLyx7cpAyb+kVdGotOsuIYtBSb74iFjqRI59Jwo6B2NW/rvSZJHEct8zVOJsG1l+WbWoJar4P2TtG0YyJSNxanmyoNW2R0Km3r0hMPyb2geJVZDFCjLI6g9jfacJYDcRHH7cFex8WHEGs2n8pHKey6yYtEhrC+cw7YAlVoT6X2CdDFoZQUpsWtSxJGv4QyNjnSxM5xSUFEKKcOPF3sX+Ficxfg0X0Wsn/jWXeQaNb0qGVpku14Vap9yoRc5KTJUH8CRt1h/OGTQQbtCBoplI9I3ilqg3AKeYWhiaKaszDz5Xx5kuKxpU7qWSMsYiVvh8XjrCgZNPup3B7VlrweXqS10ilVkTTAUa1Pr9o84MTzsRrWag+hSM7kdRsk88RC+19T6FtTWfrY1n4aIuDqqwykKJAkMI8Do1a/KLNEvjaDfcorKd9/QMown3qvj/+AFwxCb8SLYycpmRFwpEc0aEJWPQwRJZp3TCHSPXQolub6r6yRb8LJlA8q/laM/ifZRBRiowFS6cTVpJlKwR/pn1joeVextRihF9dp7i5Yltn5hRxYA0okh3LQtD2FTH0Eghg51UyzGlJmO5A7ksoLGbPH71DXGZZHDs5FBH/6lWev8quhtpCRhGg+Lx3maDBpKy0t8150LvpRpXJYH9dmTvNAu/cVTjvalPV3P5fA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(498600001)(52116002)(107886003)(8936002)(86362001)(4326008)(66946007)(66476007)(66574015)(5660300002)(6512007)(6506007)(6486002)(1076003)(66556008)(19627235002)(2616005)(2906002)(38100700002)(83380400001)(6666004)(186003)(16526019)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?F7hqazST6H3/1ao9yIYXXbCBzbTX0SJe77UGrsNBBn4F2HILsi1kUFkcxVWb?=
 =?us-ascii?Q?aRNuddva8hdnkiQUR7YPi+92zGY96fcMbMjkT2Nmarp9gd+xROrgX6k8otFO?=
 =?us-ascii?Q?biPQ1vQ19GaHcremRL63h/Jcq3SLU3CHRMxH1lKmZmxP1xjwNdplpRjYtGNv?=
 =?us-ascii?Q?9FF11fctirxfoYzYYcxyAA3OwWMQM/GD2ijMGT38S6dDIieBcJUMACGHv9kj?=
 =?us-ascii?Q?iJ4ZKTkRrayTedZdMUPLxLxo0EMfmTxn50uCKdQQZ5HwzXy2XIzKWYz8aZOA?=
 =?us-ascii?Q?6mQm2COSFBPzMUbpioQ8voT5My2eq6NxszwE0OeRdUSfewUIhv0w87XdDSa6?=
 =?us-ascii?Q?mxU0CZiRV0g0bQnXLxGiUPJ9CvygU9FBqOF2twHokahtBydeMx2sQCNm/9rN?=
 =?us-ascii?Q?R24sRyQIIoP47ugexcIqKdf6BXb3ZMlnrmdZKiPWxhpelikYCw5deciX4b9c?=
 =?us-ascii?Q?gdgys9X4UGpajvzV9js45n1FnnV4wGnkP3vb51eBQAIGE3mjgQwuauGarO3G?=
 =?us-ascii?Q?gpyy6VMKfNtwdtNhtVdaMz1nuYJadIGPI6e2kyNNU89UpLW6f9pEgZRzZBuT?=
 =?us-ascii?Q?y9FJJU8EJzw75TPt2rDeyDFfrC0EVnZ1wGTgB/Qi527GR2YZytAVjVQUrPl4?=
 =?us-ascii?Q?HuhbEmhsoYLkkBTMlTNJFhrmVKV3xrHMy9PUxvuiU2n1V9fI8pDPmxBWWcBe?=
 =?us-ascii?Q?aBUsAaYoWQVJqpSY7/ESGaOZLZ8PZnFMPUkJ7VoRzVENKw0ZC4oO/+Ob/Rod?=
 =?us-ascii?Q?jVXAoL13okDZtt60i7OwY2ZpXWXSg5siXR2tPHFrkyU8WEb0qDDbZ8vxN40A?=
 =?us-ascii?Q?AXXTMaSRD7GFq55sMhYfyM9C+WZnExBd1c8dhTPyhqMVh1GLNyW4+/xqVWIH?=
 =?us-ascii?Q?fBvRvgIhWfVn8uVpg1Fy5j+GFXBWu+QhDOBRQszcl/OXOZvJvB1DR+YCzzbV?=
 =?us-ascii?Q?r7iMVpwmbNEeqEvrIbFoGczqbYTtCXomWjBRTCqosqJJUUV9iNE6pZLgJvZo?=
 =?us-ascii?Q?KsWIVpEGijfmFl8k0gOcxxOviooRG1Tg1R/XJ0E+UEY3bTjLZw+aAds3dF6H?=
 =?us-ascii?Q?v+QrbK1zjrNZyEkHw+vbGtQEe5BZU9U/fjSZhHsXiidOb8TIG363pRBs5VnB?=
 =?us-ascii?Q?9Sr8+cCuhmDbcFc3Ywoznh5yA8DBYC/wZxZSuuPE1fzSpjWpxunvyKKvpn3h?=
 =?us-ascii?Q?pUrEJwBmLGXlHEgcGCu74hapjmlnFkbugAnOtI+wK+QOyKzV95CIGQNKm5YH?=
 =?us-ascii?Q?dxvaA2Mw2jszMx9fFUvgGn5Et2C/N5Sd5+40p5fJDgjDt8nOwtqS1/l7Vvcp?=
 =?us-ascii?Q?H89qMux4RcG/O2wRJe9+GTsOVMZ7SklzOAvnBB/UcSjhaaqVi+l9qIRAyZEw?=
 =?us-ascii?Q?xsUl6lpNflIG7N4uh1MJ7/dm2/Ki?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc552e6-6e3a-40dc-beef-08d9206c4860
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 17:32:49.5071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3+vuh2My0bHyUAVhZYfA51Et2z+J9r4rs+fMAimFecEDx9audTYB4LA+S+QBJBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB5164
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Nisha Parrakat <nisha.parrakat@kpit.com>

a) use option 7z to build the lib7z.so library
This is needed for android-tools for building fastboot
from android-tools

b) Packaged the lib7z.so and codec libraries as a part of this recipe
Fastboot RDepends on it lib7z.so

c) Fixed a C++17 forbidden error when lib7z.so is built

fixes the below error

| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virt=
ual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)=
':
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an =
operand of type 'bool' in 'operator++' is forbidden in C++17
|   308 |           numMethods++;
|       |           ^~~~~~~~~~
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an o=
perand of type 'bool' in 'operator++' is forbidden in C++17
|   318 |         numMethods++;

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
---
 ...nge_numMethods_from_bool_to_unsigned.patch | 25 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_=
from_bool_to_unsigned.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bo=
ol_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMetho=
ds_from_bool_to_unsigned.patch
new file mode 100644
index 000000000..edde52593
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_u=
nsigned.patch
@@ -0,0 +1,25 @@
+fixes the below error
+
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'vir=
tual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=
)':
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an=
 operand of type 'bool' in 'operator++' is forbidden in C++17
+|   308 |           numMethods++;
+|       |           ^~~~~~~~~~
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an =
operand of type 'bool' in 'operator++' is forbidden in C++17
+|   318 |         numMethods++;
+
+
+use unsigned instead of bool
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402=
701 +0000
++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604=
125 +0000
+@@ -298,7 +298,7 @@
+
+       AString res;
+
+-      bool numMethods =3D 0;
++      unsigned numMethods =3D 0;
+       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
+       {
+         if (methodMask & ((UInt32)1 << i
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipe=
s-extended/p7zip/p7zip_16.02.bb
index 13479a90f..ada49114c 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -9,6 +9,7 @@ SRC_URI =3D "http://downloads.sourceforge.net/p7zip/p7zip/$=
{PV}/p7zip_${PV}_src_al
            file://do_not_override_compiler_and_do_not_strip.patch \
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           file://change_numMethods_from_bool_to_unsigned.patch \
            "

 SRC_URI[md5sum] =3D "a0128d661cfe7cc8c121e73519c54fbf"
@@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D "5eb20ac0e2944f6cb9c2d51dd6c4518=
941c185347d4089ea89087ffdd6

 S =3D "${WORKDIR}/${BPN}_${PV}"

+do_compile_append() {
+    oe_runmake 7z
+}
+FILES_${PN} +=3D "${libdir}/* ${bindir}/7z"
+
+FILES_SOLIBSDEV =3D ""
+INSANE_SKIP_${PN} +=3D "dev-so"
+
 do_install() {
        install -d ${D}${bindir}
-       install -m 0755 ${S}/bin/* ${D}${bindir}
+       install -d ${D}${bindir}/Codecs
+       install -d ${D}${libdir}
+       install -d ${D}${libdir}/Codecs
+       install -m 0755 ${S}/bin/7za ${D}${bindir}
        ln -s 7za ${D}${bindir}/7z
+       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
+       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
 }

-BBCLASSEXTEND =3D "native"
+RPROVIDES_${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
+RPROVIDES_${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
+
+BBCLASSEXTEND =3D "native nativesdk"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
