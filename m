Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web09.4924.1630165494137079886
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 08:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ewRsAYJj;
 spf=pass (domain: vaisala.com, ip: 40.107.8.73, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLZKQx5Eav11jjUWbnSRSqEtuERgk+d1FInt5VvaDanNiye7eBbQ/DUlzjP1YN1kja8mIYQSiw26oV1rPYwiUfxWEzxAfwQUbe7iPhk48aP40QV/ARwD6RdYXIhFcbUUOteAihPYPj4HvG57+QQr8KCCtRm5zr+C//+NNs3XUUJ0IzXnw+mg8b3TCYzRldZ+SebLoQ1Ho1fWFU44sndTJ3uRATXNzZRDD+BV3PZU1i3aYKazqt0a0WRX82OvBL8R/Lt8TnmBEfjv0DCz+CTgo894rEjTwXEzFxwyzMEqoL7jYuWD1vIH49CkAcG5BqOdnDo6RZ4Xipc60MAIxyqhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVVEei9kd8eWZCzHsJHKZWSxFFJ+8QOVIcZ2m6pI2VQ=;
 b=D616iH+uXpZk6dFTKE87yErvsX9214TuhmfnDSAV2vWOE3hV8Tl26EO4M0c3vHWnf/1hb3zkuyzj2r6ibFoWNssmy3Sly9nXKO2c9ZmSSbJelK0JaodyqDyoda+7ZUc1u5IDAHRJI5Fx9wyGmtf49I3WxA3pGtLpzgGdE3Hmh13hNVWFPCNXsahABZ25A7HoFrukegeZ4uFCe9bMvrZT6ZIClW3Hw767i/ass5Vi+2kx1ak79QL0mWU66QE/s+W7I2aV5nVDOVks/UDxCoJ/my5lsS7tmiyh+jZxBWc4yb3IhHiVL+Q1l02GxgOgDHhi4//+DZ4GHTMiEJhgiwxmRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVVEei9kd8eWZCzHsJHKZWSxFFJ+8QOVIcZ2m6pI2VQ=;
 b=ewRsAYJjCa1PJmzXA1Eh4LZWl6TeiPvAuVd2ZcMA8UhUNdg3jGQn3tChiYinVNT1qetFTO/w9mv3ArNzHkWq7Rw97nfc1FMLQFNAp+hEMWy0jnCAOvCVL4z0HoHg+QtyGIn129BsdlvyCrIpMgN66wo/pkPesJN1KgO/6QDz1ccCAY7WwjPAgEJhF9Q0+/tVpHeke2zyhf5GqFQAhVP9eKsPD3fvWlxggsVaGL4AIYdZpiVMAoBxYp6MMbmCZLpVram1bDTPAHoXPUdGZPgF/PBIIyBOcPyeur3isVNqzy9BSlHFHdqn5ChchTokLkne64wLCb3gqYzJV1jxrbtePg==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0602MB2906.eurprd06.prod.outlook.com (2603:10a6:3:dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 15:44:51 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 15:44:51 +0000
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [meta-python][PATCH v2 1/2] python3-cached-property: Add recipe for version 1.5.2
Date: Sat, 28 Aug 2021 18:44:29 +0300
Message-ID: <20210828154430.667610-2-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210828154430.667610-1-vesa.jaaskelainen@vaisala.com>
References: <20210828154430.667610-1-vesa.jaaskelainen@vaisala.com>
X-ClientProxiedBy: HE1PR0701CA0062.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::30) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1PR0701CA0062.eurprd07.prod.outlook.com (2603:10a6:3:9e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend Transport; Sat, 28 Aug 2021 15:44:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68d7074b-9f8f-4508-8ec1-08d96a3ac5a6
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2906:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB2906EB4994C36AB03194B98EEDC99@HE1PR0602MB2906.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CPC9GjCGcIBvpe4m6oWV+Tfv7d5oJ6/1nvlNanduPoSdwdQ57kPWOvEd7EEgtgvNfIbrBd2QBcy2MQ+BRwDrcDvrHUJMTn0lL1Y6XobVAzcgiLoMpoyZT3DAzJ9qsR0RAeW5xn1bqpZW1GdloaQqtodnxHatKnHS+5wmcCaH0XYi6riRvuOp/RjekCBtnfGcX7ta3uzimGbvoTGPCkeD+Ww6CBczL/Ik9LSrIPKuqXkq57YcNCNWCglTFKNvU7QzzJIlCDMwxE6tG9VB6FfXhzJIwkFVk+J5ybg9NnRf4VYmQ+0SAmQ8eLDGCwQrh+hputZcgc+3cev2a7J1dJOxn5hNIAvmPDRIHeDoAl1KKz8k+3TytmuwW7OiHnxkEblHslnkR+HcqdqcOktz44MJZAwkpGu+8qOx4skEy4SvXpFKdVHRSo399k1TJpyjxYT/WL5UPBFxmdAoZEs9aQKJoaLddFiIO6jpvwGznE7MR7OTlJa0SVTcUHLAkDpSyjfs2X2T4QXNJyu/vWgZnbs5pWw2NeaauyeyBuADUS7U7n4iLmHxVPfEHq8vBaX7Vop99sMpb8JefYy2UIwae5FmdIeGB7b0qed5pbmWSqs7jFbHxYzklD1SH3r6YbTh8bYVruAUiE86lUa12z22xqYSTEVjxkXfcUTlkpoiqyDvFky45gRamgURn6qryTFqxHo4STtAB8nGTwM22a4BXPWrSKt68LssXPhE0hSgkEYkDb6JtIZkwRVAg1wNthGZFIhChnOe543GlO3axG/szc4jZ+wntbN/gA+cuu+OFz2zfP0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(38100700002)(38350700002)(86362001)(2616005)(6512007)(6486002)(5660300002)(8676002)(66476007)(66946007)(52116002)(66556008)(36756003)(316002)(26005)(6506007)(956004)(6916009)(186003)(107886003)(1076003)(2906002)(8936002)(478600001)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bQVzp0v3Scd/VZpnBjIc70kUO2PItzPPEY1k3CEdx2Eh3pSVwCYQmuzcxEFp?=
 =?us-ascii?Q?0b7GNcPFMWpSzxOSaEkzToH6hcEGfhzEhYnP8n9DY+Z6SOz3Wvc36XYeWzOA?=
 =?us-ascii?Q?kx+ZQFBMTaxttaCyX9Jg6/WNp6D1TIStYNl2HkZcko8R1Lz5Y05GBMHoa3rw?=
 =?us-ascii?Q?3dnry3DKVwkp9RX3xyoSxQvnU2FZYWwi8YfRwtmjIDBMvo8Vy1Zpw+pFjZ12?=
 =?us-ascii?Q?srHL7HidRKKfxC9Ie/pZLN0lx7Srmz/tBfDF9LDfURsRdjdz+BH2rhUlLC6d?=
 =?us-ascii?Q?FXwCROLXC6hlIVM7IutAurL4KecWSCYBh8SnB7lwrgfI0d7too+oCrnCy5ke?=
 =?us-ascii?Q?Ww8hbc8tGRCevLqy75q9+D+gd4ZN8syq1x25aGJB9FAl82Q+lr5G2ZsP79sH?=
 =?us-ascii?Q?qJS5PFZnb8DVCW15JbmWVRjPXbqdwD+tAxHZgCls3t6ThNg+mmIITSXVjCxW?=
 =?us-ascii?Q?zoyfZ6mpPTfYKEMOrEw+kZMn5H5ouWMf7Z2gMTVtq3fex0KdRzVmlfIezCLW?=
 =?us-ascii?Q?Qztom5VnTluqbAZ4oDLkWgNrihTSiMLhr/q83W5tg6Z4nF0xIZL2oYnfMKhp?=
 =?us-ascii?Q?ix0RL562U5vkdMxRR/KNEfsBH67yXnmsCE5zlXM6v6fMhA5jHy0hcD9pu1j0?=
 =?us-ascii?Q?AIwLqo568pGv/xSv9gqxBtlQd++aa71NS2p3pL01SIRSPdMh51Bt5MUIF1Lf?=
 =?us-ascii?Q?e5Ys+Sbrs6ixQY3HJSc3q9Rr+ulXmokqzBWJmf4zMTyibkxscXuTDMoqw8Vu?=
 =?us-ascii?Q?6zC8TwdfKmaWuqfnHcjPfktsSKxp/MteUPWpk6BpzcDfPfNsh7Y3lz9jsghf?=
 =?us-ascii?Q?oXzoQQjjzqBB18Zn8Rp2NbzFt+RzdpdBrDsygQOqs255FI4IfFUBiMwynZ5K?=
 =?us-ascii?Q?mJsF8PK2waS3b+5JY+bvE+wvGA6otuUvHPMqLRHyaOq1VnkSvrLSPEnMk314?=
 =?us-ascii?Q?NlU5/8XeM8n7hvE2ZdjGx56V4L5ZdyUpGNEqoMFt0s5vXeINBe4fL1PHqv8V?=
 =?us-ascii?Q?DnXIH2ZQDER+TW7Ck/DubvRrxl4D6WES+MrfzHAR6NTPFXh25V0LKAlNFj7l?=
 =?us-ascii?Q?ksF4QwFw8zH2ZAwPW9sah3DHQpI9Py14/iC/BY5xcKMyGHOFdj3DcgY0iHu6?=
 =?us-ascii?Q?4W76AfucCi6AB4NjKmxfF/akkuuR2bEFLtakyuASwVubQi6HH38w79fMYX4x?=
 =?us-ascii?Q?I3DDBfxpucg35zTcVdCJIB03jnSZRgZbjLYLp1DXb2lZfBt7tHCaD7myFcMF?=
 =?us-ascii?Q?LNBziNK3Pdd4+DVnNF0Fd4ZQsWKKXkQvtjRNvwqqjFmM1jo/mV2HGCUAHD1p?=
 =?us-ascii?Q?JmHw14Cr6eXQ2ZiKsLyCiRSo?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d7074b-9f8f-4508-8ec1-08d96a3ac5a6
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 15:44:50.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+eIxmPKaZNbQzYwrk3zowVmgLD+eZU2mNobjNo5sTtSLuv8csyZ6zZhplt36Tj9itP7yw0Jv6xi3dnbAl4gKi0nfI7ucxFmKztZY6HoOUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2906
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

"A decorator for caching properties in classes."

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 +
 .../python/python3-cached-property_1.5.2.bb          | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cached-prop=
erty_1.5.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pytho=
n.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c2a80aa1c..2fd056de7 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -59,6 +59,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-blivet \
     python3-booleanpy \
     python3-cachecontrol \
+    python3-cached-property \
     python3-cachetools \
     python3-can \
     python3-cantools \
diff --git a/meta-python/recipes-devtools/python/python3-cached-property_1.=
5.2.bb b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.=
bb
new file mode 100644
index 000000000..059c34a29
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "A decorator for caching properties in classes."
+DESCRIPTION =3D "Makes caching of time or computational expensive properti=
es quick and easy."
+HOMEPAGE =3D "https://pypi.org/project/cached-property/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb7ff60c4e14f58534201242803d8ab=
c"
+
+SRC_URI[sha256sum] =3D "9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1=
b499f7bd89a130"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
--=20
2.25.1

