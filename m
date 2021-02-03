Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.81])
 by mx.groups.io with SMTP id smtpd.web12.6865.1612343202669337216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 01:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=pw3DMwrL;
 spf=pass (domain: kpit.com, ip: 40.107.139.81, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAmZANl7h60jh4Uv+SCxyjXjOKSdwVUptD6XinZRDklD55ivahnFoLGozmdZb9rdprzoBiwb7YmOkkofEx9sZ/crCca3gtHNKXE9oeb6OweoACCk1P03oPpUFhEtI4Y/XDQfmQOo8Hd1MUJWwYl8qxQNmQOCH6HD/imN8K65lTB7IuNtjVkDDEO/H55/H7Tj3tUqd0kO3C509Bl/Qb6NMyGakUnf/WvWfz1ki9/L8KmPsU1s0khlFwZeBhXci4yZcTbLbJey65OPnMAlz1PMxsAq9iIoKP+sA5RzMJCxqJzPaURu8kuK+bu0amOJklzEXRgOj00oJbvX6q+3GeP+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9T8H41CDplqDd2uAo7p8hMT8C8J/nxc1+Gs8U4/kss=;
 b=glvwgWK+d7PWf3HqLaqnfIqAoLYpf6IugflTTdjhPMK1gFYcCckLOA6UlqcsNwiUy4LgJlgEXHh0JituFEF0DY44BL5RD7oWU1qGMLXGArMY993hLccWgml36b6TIeceLCB8iBlzdVrJuW+vUsJFDcg24cmKm1tf9EtNi0VGf7C0DAGnl/2dtEDi9h71/fUL8DFUwRs4EpKLw1BCQqlD71MoDzo2xUnf78cUtCQDOxw90U9lax4q80oNeU6tZlENUTH74Ob+vNUoQK4pY9XqXlRru2iM3RxiK39H0jnXnCHv87GdCgH4IaLtxyw+fTqHfoRMFig+Q14KyAgQXvTh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9T8H41CDplqDd2uAo7p8hMT8C8J/nxc1+Gs8U4/kss=;
 b=pw3DMwrLHllW1710ONWrC9RzulZzF4nnDWIMYVdoHL5xaTmeyiz+VHPsSdUNRLgjEZ6QSV02Gm5Zso6iEG9fYX68DFTKG1aMlS4vndHUHTcloZ/haoJDusfvonCkyW4dBrfWxIGAcy7C3opgrb90yuhpOVECASF1Vnih/UBEdAc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR0101MB1902.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:16::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 09:06:30 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3825.020; Wed, 3 Feb 2021
 09:06:29 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com,
	Haiqing Bai <Haiqing.Bai@windriver.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][dunfell][PATCH] python-urllib3/python3-urllib3: fix CVE-2020-7212
Date: Wed,  3 Feb 2021 14:36:14 +0530
Message-Id: <1612343174-28564-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: BM1PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::30) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by BM1PR01CA0090.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Wed, 3 Feb 2021 09:06:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: abb363da-1f43-487c-30ad-08d8c822fde9
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB190225DD13B2D9DA877E6E6DEFB49@PN1PR0101MB1902.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SNVoZbM5QcV7Swyl1n71uJ6SA/0xuzZljGKxC2CYPtdl6CiztXSN+Vl6p3Fi3IvkVWYpo7uZ3ZB8qEKnNK/14p5ATw0tCZQsDcG+M5c+wj+MvpW9AkZdEJCAFGb5k+yEFwpzhmgQu8TURlWqAdPsaUi/bD3qHRPaRqf5ZGNvzVK2TFYrujK32Sk32FkJioDhCQYm9G315i9LAiAt47mzllTgQtuGIiyQC5EIUF1bVlIQjShUod6qhqjCAFpg0WSbPUVAhZGXxWV50sQ+3CKBU1RrckSc3w+4ldXEcblXBP1dyTNjj4JwNAzUWHxvpnpKsVc/oqQnF+2MmvXcRabetX3jZzE8f80tFixJ5BB3txV9CfgVFzPNwH/QtoMqQSdamoFdzcenIIIMgRmBwozABOJGLeeFyD1Uu4L3J1xTR35Hw+VumMApx7sbMN2ZCAigwzfKecvZI1KX1HryjG+nGvDtyElPMxCjRqOFlOln/qzP45Tc5BOLWdQlH5Uo7h/2JxnLWGRY3rZTa09dzMxWODSt2UfgfP6OOo6e6a4a33xol+fMRMVbl/v2rIQKGmDIIbO/VL/gGuUU5rmiK+MI+KxwbxHwt1lOBPYT1xgY0eE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(5660300002)(4326008)(66946007)(6666004)(69590400011)(36756003)(6486002)(26005)(86362001)(316002)(66574015)(1006002)(2906002)(54906003)(8676002)(66476007)(8936002)(16526019)(83380400001)(2616005)(55236004)(6506007)(956004)(6512007)(52116002)(478600001)(186003)(66556008)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?49EfCVv8cX0yUHsvSKMwjZGHuloCA/yIrbV/YClhiCc1IXlfz1E6ID1D20G+?=
 =?us-ascii?Q?HD+bFhxfZwktUtzxLOJkb3vFVIgWoG4iLJtvowXVmSt1NVWj6cMg64lD+U7h?=
 =?us-ascii?Q?YucmLiargV+Gj/1OLviCeqK7J+IFyeMfdsNdHEEkuK7BgOudImON7BZ51jv/?=
 =?us-ascii?Q?wyX7ZohsZIeJKfRm7vAF5ha1CbcR7EMtJXAwdtFp/wLXxOtx5ulLgUeL84uQ?=
 =?us-ascii?Q?Lml3ZYbSYJS/IJCtUOUSoNV0nx8KqMwwdclVXM4jEe9q7ENYwCCEN9TUKMkx?=
 =?us-ascii?Q?X7wYWdNqLAKL8p/sYp0muTXTsAN/8fyK10t3+i3+rpl2d87ogyIgSa8M/R3D?=
 =?us-ascii?Q?n9BilZaVKACEGkyRc82JuYVt1f7wGlxuZmjW48PYvk28L7LKo7FPrreU/gTy?=
 =?us-ascii?Q?no2yF/pDk90Xbxeu6HtB+efg1EJMz7vyFOlCLUtMbnCxhnrJfQnUu7NJwMF8?=
 =?us-ascii?Q?+PivvVbCdjV1CHKFjMjAYtzM2M+tHimHV2YffOpq5NjBVaMURy7ISZAtTSxb?=
 =?us-ascii?Q?ZJ96rHtRBYU/1ASgI9Sv9I1ID5znnooq9cohG9fkQTB+op95Po4sY+lHbiMV?=
 =?us-ascii?Q?51Upn7vNpYTouTM+tUFJtFWLcGmqDmVXgcwWXGltgdYPT1Ioim+oJHFY4LL/?=
 =?us-ascii?Q?8hCe0JQsF8csx93BcD1WFRI0hVuFQn7qY3vLypmgH6WJN1N7wcdurE/sITzt?=
 =?us-ascii?Q?JUjFKkOp9ULKaqR9PScq9I2UBTphHQOK0dV9UmisML/G7xIVdrjDDFwtAdBN?=
 =?us-ascii?Q?KT+mIbqR8jTi2i/JKPiXHRg6dzIB6ZbMJ6DLhn4RW3rCJXDMlFd6QNhst+tL?=
 =?us-ascii?Q?3bOszKJ3RNBvpz/52DqFluY/J8NbjaxIS3TD9M37PPwBXSAVsX95/6nHbQqg?=
 =?us-ascii?Q?Y0lh4pAyFc2fM5bbRrTuVRszyCvfDbdEwTQTuZyudlN8SUAHjvHaMw8j5cPN?=
 =?us-ascii?Q?vTdXmshMdNVq+HaKCIr7wEO5dq+Gcm+Tn2mm0kZCXoQqd0dlg8qgzgvE0vU8?=
 =?us-ascii?Q?xPzRK+U8pl8nKw7CNlGLHGqITVhAdjhjeZMZ7vTl11PbuDku7JqI3sdlM3zl?=
 =?us-ascii?Q?A1eLZ2zP?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb363da-1f43-487c-30ad-08d8c822fde9
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 09:06:28.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl+X1QUNIUtvkyDvdSFNIqvqjbcPhzWQv1nXoEHPcxnHAjIdlE4L0KlxezsuPy2n86kuRUMN7pSjwsRImVCIcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1902
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Optimize _encode_invalid_chars for a denial of service (CPU consumption)

Change-Id: I67a1b0acfe905cb9c0c0bd3f5e3917d49e670673
Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 .../python/python3-urllib3/CVE-2020-7212.patch     | 54 ++++++++++++++++++=
++++
 .../python/python3-urllib3_1.25.7.bb               |  2 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE=
-2020-7212.patch

diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7=
212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-72=
12.patch
new file mode 100644
index 0000000..a2bb0fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.pat=
ch
@@ -0,0 +1,54 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/urllib3/util/url.py | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 9675f74..e353937 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, =
encoding=3D"utf-8"):
+
+     component =3D six.ensure_text(component)
+
++    # Normalize existing percent-encoded bytes.
+     # Try to see if the component we're encoding is already percent-encod=
ed
+     # so we can skip all '%' characters but still encode all others.
+-    percent_encodings =3D PERCENT_RE.findall(component)
+-
+-    # Normalize existing percent-encoded bytes.
+-    for enc in percent_encodings:
+-        if not enc.isupper():
+-            component =3D component.replace(enc, enc.upper())
++    component, percent_encodings =3D PERCENT_RE.subn(
++        lambda match: match.group(0).upper(), component
++    )
+
+     uri_bytes =3D component.encode("utf-8", "surrogatepass")
+-    is_percent_encoded =3D len(percent_encodings) =3D=3D uri_bytes.count(=
b"%")
+-
++    is_percent_encoded =3D percent_encodings =3D=3D uri_bytes.count(b"%")
+     encoded_component =3D bytearray()
+
+     for i in range(0, len(uri_bytes)):
+@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, en=
coding=3D"utf-8"):
+         if (is_percent_encoded and byte =3D=3D b"%") or (
+             byte_ord < 128 and byte.decode() in allowed_chars
+         ):
+-            encoded_component.extend(byte)
++            encoded_component +=3D byte
+             continue
+         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill=
(2).upper()))
+
+--
+2.23.0
+
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb =
b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
index 34c15b6..8d987a1 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "f3c5fd51747d450d4dcf6f923c81f78f811=
aab8205fda64b0aba34a4e4

 inherit pypi setuptools3

+SRC_URI +=3D "file://CVE-2020-7212.patch"
+
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
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
