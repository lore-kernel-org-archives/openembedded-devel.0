Return-Path: <samuel.cook@cornelisnetworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981B0C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:51:37 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.124])
 by mx.groups.io with SMTP id smtpd.web11.44487.1676991093429384462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cornelisnetworks.com header.s=selector1 header.b=XQFN+xwm;
 spf=pass (domain: cornelisnetworks.com, ip: 40.107.94.124, mailfrom: samuel.cook@cornelisnetworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mso8IkUjVKx3eyWipsUOd9tYh0hqwlH+vDNwbVEp0kRGfRLdNwJvSalfpJGYQoZFq9Xp+piJv0IkhRCecTSMs2JIhlfT+RmSGP+7HowaSRZ8gs1U7mjy9ftNvoU+3aDbssCz9S2e4RSSqhmxJEck9KJsnpwXCkCi+PD3lyQ7eCMHCIcRv/u1vZDXicpHFA3FCN436rAvK9S7nbOK0bJ8TomSRMuJltoqYaT2kLAgYwwAw7OOVvC8YPY3xGl+zsTw1okvIggKKUoRNFmBZGyQppWhTVaIgyMv23Ec5GA9ngEOGNLWG/jKujf7WHo/5KLJTaEzVscd1tsnySc/cH1tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1mb+0BXmQ4EuOkQC6fFoH9+Gm9WyYSCuZ8j7q//JzA=;
 b=GORvJAX8VOtADAQnWa2oPmWO99rCCyPIXPmzGB5tPk2WYtbw6PU3teahTjlurKprimMNlYXs0jMLN0JDdSHSxOYN3PeGEqR57vzV73Y7FIFH3XwZf4JgxOWHiuEP8YKgKPX4nsoJEuL8BXijYTadsGYMH2qrYqTjebB5CodTTIHFTTWe2D9l4sho9heeUHSCMBoP1bCG5V4/mR0+EB4J891pAid7w2iSsLtx6rTUV95n6FeySZUY+fLabZjpJ+dOhBL885AG3KczI0hHJLvtGppxulK/SqzgtDlXc1PTQHpXbLaoAkgNX+xNxx01mdpw2rSvarvXpCaZ7/DXv6UbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1mb+0BXmQ4EuOkQC6fFoH9+Gm9WyYSCuZ8j7q//JzA=;
 b=XQFN+xwmIP+LeHPR1a2PjEgU1Yh07ZVw/vHBjxzpR2u/YeuEiWvpiVl7sx3GYD2Rq1QhQ2GbgMGejcOdBWcukqToo2QnmpExfRc6TyFd/AvR1mcRZ7oxNQ2/b2yG94OqTL0XkS8vOrGR6c11WAHUs65dHD2dtvBSvoNR879ZDGz0lilY2lc4GwMr7CXnJPg6d8gtPHial8OYA+mNDba3J14MiRqkvNehQrAVEkxwx/Arv2ucrzwx1JFOUKFJSrNrpMNTMqZhMXa4bjau9TnxvPiL5M+W20oB3FJGb7f7yWva+Bv5PmYe47YpDW/E9WAyqZyKuxoWyt5bnn2jGn4VWg==
Received: from DM6PR01MB5129.prod.exchangelabs.com (2603:10b6:5:a::25) by
 MW2PR0102MB3548.prod.exchangelabs.com (2603:10b6:302:5::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Tue, 21 Feb 2023 14:51:28 +0000
Received: from DM6PR01MB5129.prod.exchangelabs.com
 ([fe80::3d80:7fda:669c:3926]) by DM6PR01MB5129.prod.exchangelabs.com
 ([fe80::3d80:7fda:669c:3926%6]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 14:51:28 +0000
From: "Cook, Samuel" <samuel.cook@cornelisnetworks.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python-systemd: update from v234 to v235
Thread-Topic: [meta-python][PATCH] python-systemd: update from v234 to v235
Thread-Index: AdlGAw1taJENclYhSGmMKmGehLyNLA==
Date: Tue, 21 Feb 2023 14:51:28 +0000
Message-ID: 
 <DM6PR01MB5129158BB0A2A117BD35F94F9EA59@DM6PR01MB5129.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cornelisnetworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR01MB5129:EE_|MW2PR0102MB3548:EE_
x-ms-office365-filtering-correlation-id: 1b41d283-9b39-427a-ecbd-08db141b1cb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xJ+tnkMmSUYi28YJw+P8ArxfuUCLrxtesnt5Xq2ZT3+VNsSxBWAXLXaoLEQMSG1paWkArusq586nlp+W5TM7NCnp9pk+9fKAOvOxtBNKIVScweYTPvurtm3IKv9H6ItZHU4fDUjNe86WWaYDK4QjI+t8RbD6QrLJTKSuzOpE1kQ2/S7FYziJHbF9UPd7UKfqX39r8uwJ015ueAb35udTgAKqgYpVE4gItXRTe2vxrPKby6bzYWWaZn+pVyXiN0tfvzKEjbT3tNwPV1c/3arWVV2GUx1PISocXJnuKqlTvyAZlkmMHVAN6j7i5Lzhr/+9Gc5qVCFqXsnWi0ztPRHWIEAhbml7LhjvEDArp10JbL54Epe5u/A9/J4La6ZCa0oTvn5GddggnQiwQKn7ugr0Ci7MN2ChEbJ1Msa6nu9xQmG9TJuxNFtLtlJJ8cpoIosmL3nq4RxjF9YXjE5PRIejowFr/VnAg+cNdgeuwdgIiwrvAtt4UIB79tjY4fPuNZ2Ddc5tqwlrLlFbS0dwuXMFqzWLPA2oimzuqZ0dgrqmUP6MIrtZdGK2u2KhOT6uYY1Hy7rEY43BWj1WBoIZa9ZXfi2sJez2fjiB8dOZWKhPIoOBCDYy7y2m03gzaLYam+ZsC9U1P8tDXsgklvt6tXlREMrvVA3y/uPxcgCMmKLV5g+yNUWevRYDE//PtEHnCKkM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5129.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39830400003)(396003)(136003)(346002)(451199018)(71200400001)(478600001)(122000001)(86362001)(38100700002)(33656002)(2906002)(38070700005)(166002)(316002)(41300700001)(83380400001)(52536014)(5660300002)(8936002)(64756008)(55016003)(66556008)(66446008)(66476007)(8676002)(6916009)(66946007)(76116006)(186003)(966005)(26005)(6506007)(7696005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9mAoakQJrCrHkfuUJqL+5/b2cff/qiYw9Y73wbdECKU4Znw+p+pjHDXQ/Nvw?=
 =?us-ascii?Q?OgUzYmGidngLRzHJOGAECYgN7rFaDHWB9NHx93V+R4A26XDq6OZ9WN9e/j5C?=
 =?us-ascii?Q?1PjAi4BGDmZ2EHgtVhVYz2HpHrWKeCsBJuC/4kll0A8vf0do9DSctJvfcKWl?=
 =?us-ascii?Q?SnUA5SYnhi2Bz54BcYHuo72ZrxZIfRlNTzZjJPakzX6XD38almXJRo/yocaH?=
 =?us-ascii?Q?jw9UTm/ePCOLAw+CBSF6CEGDvkI5qemTCLCP4gQEZvNgLVTCyYOCcxhQkoFU?=
 =?us-ascii?Q?wBch+bLUU7Do93Tx0Bu2xYJxIz3JGRYsgCAkagNOT35reuO205HyqFjmM6kI?=
 =?us-ascii?Q?vVyAZVDDCXcDYo47ghQQk1KYQzGkAschzXahX+yggk3t6CpLpsD7/kD42/QM?=
 =?us-ascii?Q?2+y68Y0o8P86aM8VyY/1QgdvJoh5CO4JyJl4DIwEICcxt+iz5WmCgV1NiAYw?=
 =?us-ascii?Q?xlyQel8hzybexI++cvDIsJAVnB/8CX8nnvj86d28b/fGZ/l0yQNQnu88PiyG?=
 =?us-ascii?Q?eB7vUub2tlb/D9v5FyzUmLMI9dL+TY8L50ECt5qjlqmyOucXENYw8Onqm3HI?=
 =?us-ascii?Q?9FvGo2kPdQccEyIlx2+2mIYooRfN6i5GWTMnwCudlho836A6bgKnFnBNfyMZ?=
 =?us-ascii?Q?tC+0rpEYJCrx+qJCb5SVG0AFgYnZypJqze5QPcHpNVU7LN6oZrStXix4qFuY?=
 =?us-ascii?Q?PuJ3awgl2SmBV385rFGc0Cditc8n1nWdA73C+HwiKoTbXNYfKkZVamhTOjOX?=
 =?us-ascii?Q?M2DzP7n3gzofqb4HEj+eyE+aZR/KyTIfz3E+ib8CF4EAenqfRAtuCb9FkkTk?=
 =?us-ascii?Q?JzrRySOklXAFASc/jgzh/McSWcbtbfv1N3LYQuiTgbI6tysvUh+F5MVVF6Qx?=
 =?us-ascii?Q?wieDrdDacgF5Br/4ubdYxICkEF17a1qk2wIkkc9es9uY90cOiMlpqk7mn/G5?=
 =?us-ascii?Q?6rNjBTsLr7R+Q+J899T6zG4PuUJbcb/Xa+9XasU3inCQkTDECDS1JAHL3Ch7?=
 =?us-ascii?Q?kH3v8aU2tPznPnb+aAu0vDCi6WkZYTIK8D3k3HsYDKPEuz6ztycJUTINYOmR?=
 =?us-ascii?Q?uY7wlJkZ4Zgg6KYqLTQ6GTOTGCpOGFy0+/j2z7brgJOcgEmM4mvecy0Ah7I4?=
 =?us-ascii?Q?ZJh96XORm9MebeGToSwOoKQ9hlGozURdxHfny7IBkjXvR4/gX4w8NTzDZE72?=
 =?us-ascii?Q?Jsc5+k4xPu8vML+Atocv+m9844bVFsWDTF/5sjylN6ly1nCfvYkC14YfE6ej?=
 =?us-ascii?Q?RlJR4sJKK+FSg1Y8W3jXvy5jWzb/NM39HQa1K1T0EXkPpoMreDcGhFLMbYSf?=
 =?us-ascii?Q?4HI9SvkSBYaUheho6GwiHWrMfsZjwILD2a14Nq5rNxbpC0A+8CiJmGD4V7Ks?=
 =?us-ascii?Q?N8JGQoUuKEoNBcJs02tdp6kaDOG6v68tn/bCGSTWzp7RJQJvgJL9CFQNN67Z?=
 =?us-ascii?Q?IoF8kKd8OmZnMAY0v8dYuGLq1WDhsfMbf2DpbDso9+pzoTNaykOib1mv4Gvp?=
 =?us-ascii?Q?1R813wp9vteyGydcdp39JZencI6E2DprWigE5m1Zte5790jdS9Fatv807GwV?=
 =?us-ascii?Q?TldK1Rn1d3X4t6TifZR282elmgIZtD7MmWCGDEMBe13ZBNCBmpUkS7FcZ+eh?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR01MB5129158BB0A2A117BD35F94F9EA59DM6PR01MB5129prod_"
MIME-Version: 1.0
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5129.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b41d283-9b39-427a-ecbd-08db141b1cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 14:51:28.1192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bApPt/sa+lfBjzryxgflGIYvsRZg7D2gjxDc7Zb0JeSxCWe+TJagjnsik6HR6p8Q/JcdtAnKoGeG8buTC10nLjKyvLEJouPtGcFujbU6EyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3548
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 14:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101188

--_000_DM6PR01MB5129158BB0A2A117BD35F94F9EA59DM6PR01MB5129prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Includes bugfix from v234 which won't run on python3.10
See: https://github.com/systemd/python-systemd/issues/107

Removes patches now no longer required as they are implemented in v235

V235 released to PyPI on 11 Feb 23
https://pypi.org/project/systemd-python/235/

Signed-off-by: Samuel Cook <samuel.cook@cornelisnetworks.com>
---
 ...-switch-from-distutils-to-setuptools.patch | 30 -------------------
 .../python/python-systemd/endian.patch        | 14 ---------
 .../python/python3-systemd_234.bb             | 11 ++-----
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-systemd/0002=
-setup.py-switch-from-distutils-to-setuptools.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-systemd/endi=
an.patch

diff --git a/meta-python/recipes-devtools/python/python-systemd/0002-setup.=
py-switch-from-distutils-to-setuptools.patch b/meta-python/recipes-devtools=
/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.pa=
tch
deleted file mode 100644
index b3180f29f..000000000
--- a/meta-python/recipes-devtools/python/python-systemd/0002-setup.py-swit=
ch-from-distutils-to-setuptools.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a681a79472df85cdc8c052bc61fb8b9e7b9a6495 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Sun, 27 Feb 2022 11:50:36 -0800
-Subject: [PATCH] setup.py: switch from distutils to setuptools
-
-In Python 3.10, distutils is deprecated and slated for removal in Python
-3.12. It also prevents 'setup.py bdist_wheel' from building a wheel.
-
-Upstream-Status: Submitted
-[https://github.com/systemd/python-systemd/pull/103]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 099819b..fe9c03a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,5 +1,5 @@
- import sys, os
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- from subprocess import Popen, PIPE, check_output
-
- def call(*cmd):
---
-2.30.2
-
diff --git a/meta-python/recipes-devtools/python/python-systemd/endian.patc=
h b/meta-python/recipes-devtools/python/python-systemd/endian.patch
deleted file mode 100644
index e09aea733..000000000
--- a/meta-python/recipes-devtools/python/python-systemd/endian.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Include endian.h for missing definitions of htobe16
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/systemd/util.c
-+++ b/systemd/util.c
-@@ -28,6 +28,7 @@
- #include <stdbool.h>
- #include <assert.h>
- #include <errno.h>
-+#include <endian.h>
- #include <fcntl.h>
- #include <unistd.h>
- #include <net/if.h>
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/m=
eta-python/recipes-devtools/python/python3-systemd_234.bb
index 10614fe37..411f80881 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -4,20 +4,15 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b36=
4516c"

 PYPI_PACKAGE =3D "systemd-python"
-DEPENDS +=3D "systemd (<=3D234)"
+DEPENDS +=3D "systemd (<=3D235)"
 RDEPENDS:${PN} +=3D "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging pyth=
on3-syslog"
 REQUIRED_DISTRO_FEATURES =3D "systemd"
 inherit pypi features_check pkgconfig setuptools3

-SRC_URI[md5sum] =3D "5071ea5bcb976186e92a3f5e75df221d"
-SRC_URI[sha256sum] =3D "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b3912280=
47d33895db83e7"
+SRC_URI[md5sum] =3D "93f3ca09f35719ca6a4edd1d62d38dd4"
+SRC_URI[sha256sum] =3D "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8=
c6b8008e695c0a"

 # allow for common patches for python- and python3-systemd
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-systemd:"

-SRC_URI +=3D " \
-    file://endian.patch \
-    file://0002-setup.py-switch-from-distutils-to-setuptools.patch \
-"
-
 SRC_URI:append:libc-musl =3D " file://0001-Provide-implementation-of-strnd=
upa-for-musl.patch"
--
2.25.1


External recipient

--_000_DM6PR01MB5129158BB0A2A117BD35F94F9EA59DM6PR01MB5129prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Includes bugfix from v234 which won&#8217;t run on p=
ython3.10<o:p></o:p></p>
<p class=3D"MsoNormal">See: https://github.com/systemd/python-systemd/issue=
s/107<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Removes patches now no longer required as they are i=
mplemented in v235<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">V235 released to PyPI on 11 Feb 23<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://pypi.org/project/systemd-python/2=
35/">https://pypi.org/project/systemd-python/235/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Samuel Cook &lt;samuel.cook@cornelisn=
etworks.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;...-switch-from-distutils-to-setuptools.patch =
| 30 -------------------<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;.../python/python-systemd/endian.patch &nbsp; =
&nbsp; &nbsp; &nbsp;| 14 ---------<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;.../python/python3-systemd_234.bb &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; | 11 ++-----<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;3 files changed, 3 insertions(+), 52 deletions=
(-)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;delete mode 100644 meta-python/recipes-devtool=
s/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.p=
atch<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;delete mode 100644 meta-python/recipes-devtool=
s/python/python-systemd/endian.patch<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-python/recipes-devtools/python/pyt=
hon-systemd/0002-setup.py-switch-from-distutils-to-setuptools.patch b/meta-=
python/recipes-devtools/python/python-systemd/0002-setup.py-switch-from-dis=
tutils-to-setuptools.patch<o:p></o:p></p>
<p class=3D"MsoNormal">deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index b3180f29f..000000000<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-python/recipes-devtools/python/python-sys=
temd/0002-setup.py-switch-from-distutils-to-setuptools.patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,30 +0,0 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-From a681a79472df85cdc8c052bc61fb8b9e7b9a6495 Mon S=
ep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">-From: Tim Orling &lt;tim.orling@konsulko.com&gt;<o:=
p></o:p></p>
<p class=3D"MsoNormal">-Date: Sun, 27 Feb 2022 11:50:36 -0800<o:p></o:p></p=
>
<p class=3D"MsoNormal">-Subject: [PATCH] setup.py: switch from distutils to=
 setuptools<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-In Python 3.10, distutils is deprecated and slated =
for removal in Python<o:p></o:p></p>
<p class=3D"MsoNormal">-3.12. It also prevents 'setup.py bdist_wheel' from =
building a wheel.<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Upstream-Status: Submitted<o:p></o:p></p>
<p class=3D"MsoNormal">-[https://github.com/systemd/python-systemd/pull/103=
]<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Tim Orling &lt;tim.orling@konsulko.c=
om&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">----<o:p></o:p></p>
<p class=3D"MsoNormal">- setup.py | 2 +-<o:p></o:p></p>
<p class=3D"MsoNormal">- 1 file changed, 1 insertion(+), 1 deletion(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-diff --git a/setup.py b/setup.py<o:p></o:p></p>
<p class=3D"MsoNormal">-index 099819b..fe9c03a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">---- a/setup.py<o:p></o:p></p>
<p class=3D"MsoNormal">-+++ b/setup.py<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -1,5 +1,5 @@<o:p></o:p></p>
<p class=3D"MsoNormal">- import sys, os<o:p></o:p></p>
<p class=3D"MsoNormal">--from distutils.core import setup, Extension<o:p></=
o:p></p>
<p class=3D"MsoNormal">-+from setuptools import setup, Extension<o:p></o:p>=
</p>
<p class=3D"MsoNormal">- from subprocess import Popen, PIPE, check_output<o=
:p></o:p></p>
<p class=3D"MsoNormal">- <o:p></o:p></p>
<p class=3D"MsoNormal">- def call(*cmd):<o:p></o:p></p>
<p class=3D"MsoNormal">--- <o:p></o:p></p>
<p class=3D"MsoNormal">-2.30.2<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-python/recipes-devtools/python/pyt=
hon-systemd/endian.patch b/meta-python/recipes-devtools/python/python-syste=
md/endian.patch<o:p></o:p></p>
<p class=3D"MsoNormal">deleted file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index e09aea733..000000000<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-python/recipes-devtools/python/python-sys=
temd/endian.patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,14 +0,0 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-Include endian.h for missing definitions of htobe16=
<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">-Upstream-Status: Pending<o:p></o:p></p>
<p class=3D"MsoNormal">-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<=
o:p></o:p></p>
<p class=3D"MsoNormal">---- a/systemd/util.c<o:p></o:p></p>
<p class=3D"MsoNormal">-+++ b/systemd/util.c<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -28,6 +28,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">- #include &lt;stdbool.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">- #include &lt;assert.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">- #include &lt;errno.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-+#include &lt;endian.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">- #include &lt;fcntl.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">- #include &lt;unistd.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">- #include &lt;net/if.h&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-python/recipes-devtools/python/pyt=
hon3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_2=
34.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index 10614fe37..411f80881 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-python/recipes-devtools/python/python3-sy=
stemd_234.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-python/recipes-devtools/python/python3-sy=
stemd_234.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -4,20 +4,15 @@ LICENSE =3D &quot;LGPL-2.1-or-late=
r&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;=
md5=3D4fbd65380cdd255951079008b364516c&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;PYPI_PACKAGE =3D &quot;systemd-python&quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal">-DEPENDS +=3D &quot;systemd (&lt;=3D234)&quot;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">+DEPENDS +=3D &quot;systemd (&lt;=3D235)&quot;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;RDEPENDS:${PN} +=3D &quot;systemd ${PYTHON_PN}=
-syslog ${PYTHON_PN}-logging python3-syslog&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quo=
t;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;inherit pypi features_check pkgconfig setuptoo=
ls3<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[md5sum] =3D &quot;5071ea5bcb976186e92a3f5e7=
5df221d&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;fd0e44bf70eadae45aadc2=
92cb0a7eb5b0b6372cd1b391228047d33895db83e7&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[md5sum] =3D &quot;93f3ca09f35719ca6a4edd1d6=
2d38dd4&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[sha256sum] =3D &quot;4e57f39797fd5d9e2d22b8=
806a252d7c0106c936039d1e71c8c6b8008e695c0a&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;# allow for common patches for python- and pyt=
hon3-systemd<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/=
python-systemd:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI +=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">- &nbsp; &nbsp;file://endian.patch \<o:p></o:p></p>
<p class=3D"MsoNormal">- &nbsp; &nbsp;file://0002-setup.py-switch-from-dist=
utils-to-setuptools.patch \<o:p></o:p></p>
<p class=3D"MsoNormal">-&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;SRC_URI:append:libc-musl =3D &quot; file://000=
1-Provide-implementation-of-strndupa-for-musl.patch&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
External recipient
</body>
</html>

--_000_DM6PR01MB5129158BB0A2A117BD35F94F9EA59DM6PR01MB5129prod_--

