Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 21508 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Feb 2019 17:52:17 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790040.outbound.protection.outlook.com [40.107.79.40])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8617CAA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5057hHql+0JCaP5Rz8w7TdI653X/kdsFtts5RIkz0cY=;
	b=NabM74iFlY2R8VPlo7jqWFuuJYMwhQ5MMsq+Ib3GZlzClrmhcF5wRz+//aKOVteZEabFtMGBjIOF+op2WOVSLQmm4+V1RNtyuDBoMskY7VChOH3QMT3MSJgVmQ+cfqsxyWB6IJ/YD63YCPOrSJAMz1wvg2AgvoG5a9dDKvfrqKo=
Received: from MWHPR02MB2576.namprd02.prod.outlook.com (10.168.205.142) by
	MWHPR02MB2848.namprd02.prod.outlook.com (10.175.50.135) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.16; Mon, 25 Feb 2019 01:21:32 +0000
Received: from MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1507:8ac:7899:47b2]) by MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1507:8ac:7899:47b2%6]) with mapi id 15.20.1643.019;
	Mon, 25 Feb 2019 01:21:32 +0000
From: Chandana Kalluri <ckalluri@xilinx.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][master][PATCH] ace-cloud-editor: move ace-cloud-editor
	recipe to meta-oe/recipes-support
Thread-Index: AQHUxNzc9ZP55llv2EyjWGDQNDr3Y6XvxoiA
Date: Mon, 25 Feb 2019 01:21:32 +0000
Message-ID: <MWHPR02MB2576AFB4217110298F064C3CB07A0@MWHPR02MB2576.namprd02.prod.outlook.com>
References: <1550200574-9614-1-git-send-email-chandana.kalluri@xilinx.com>
In-Reply-To: <1550200574-9614-1-git-send-email-chandana.kalluri@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ckalluri@xilinx.com; 
x-originating-ip: [69.181.219.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b78fdcf0-2e04-43cf-9529-08d69abf93af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2848; 
x-ms-traffictypediagnostic: MWHPR02MB2848:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; MWHPR02MB2848;
	23:03jmh1Y2aB2ISkC4Q8u76PKemIQT6a3Gw4u5o0YGR?=
	=?us-ascii?Q?EGTn74so74GjaysML6IsifZdejOGg7uFOlr9udEAhlJGTHZXOeURcMqAUXcy?=
	=?us-ascii?Q?1WHxJilxlDE3V6HEjFFMRXPkIz24VzDk5zqM8KyCeGmsnE8kwTJQTAuYrbA8?=
	=?us-ascii?Q?pIDq7568FML+9V3DwojzOrcOr5GuF+lt9JfBKJ+9yL2AUmPIPmPj/K+8foQ0?=
	=?us-ascii?Q?IyqpFpfBO75thVkZEDlqVF7m3JbLkN1mJHl6TaeX8A8F46+t33Pbdp1Zxp8c?=
	=?us-ascii?Q?FzfKiML0JUjl1lpQ/KhEhPKa0Z97IlYtXyYhDqPwS9//ts1Z+bWdGJlhzhfB?=
	=?us-ascii?Q?JX+syfEE8pT1jo++1Cm8U/M9/Qey3rytJsPE11dPhF78F6OLA7fo/RvpI0T3?=
	=?us-ascii?Q?8bWxr/+MWuzMjGFrIFKxfubU5tLVRw5t8DEdqxvwxO+uYK5yufqRW8JgxgDe?=
	=?us-ascii?Q?P/VnyiyfjYdh2ofetks+kDm08/2MkXx08EpNTd8rkVuSUhsWC1HtBJ3cIqp+?=
	=?us-ascii?Q?C/u9+1Xq/rdWhdKOXgRl6iTTyPH+bChHbmkhTDgyy+CGwj225DhkZwaY5AC6?=
	=?us-ascii?Q?aLgqExT1jVE1gOnOLoNARBVI3VxkudDiqDT1g8KV5INt5zhbZr0FRcC6iYBK?=
	=?us-ascii?Q?CoWIBACiaO6/F5L9SkikMpGH/d9wwtpI8PXQLHtxkBhJTazoRahU+Nep7vMx?=
	=?us-ascii?Q?GxGUGV44c84LnQmmPTw0Se1Baxr211O+rGYjGLCZGuCqccGutaoT6E2HK8vs?=
	=?us-ascii?Q?AvH1I7w6wDC4tQgQ2y1d46svftU1H24vjlt2XBB0p3a0v6xnMuzNKXCAeNCY?=
	=?us-ascii?Q?2Rjcmi95BJJ8lWFWudUjvwtKlW1DCNTIRKfa4znxViQhWWlwkwLGyrROvWF6?=
	=?us-ascii?Q?Y1fenozOZni42vKBAEv5YsARhM101JU/cYRODQrEkLoB9XZmEFEAIqe7OXfn?=
	=?us-ascii?Q?vH5Zhubw4wcX+6dpGdtuSE6C4PWPoZ8U/FzV+SoyZrvPn6HSQbWrg5YUvc8I?=
	=?us-ascii?Q?tgUO6iJBImU9gWwC+ZACTlrYHkzJnqjCtlJlP5pVLkSQB2AeyhSFmQlWc0H1?=
	=?us-ascii?Q?ulp0g6TfJpZO5kbTAkTaqst8FlIBKCNV6jAWLabKSthC3Djy+3xUOZb0oexS?=
	=?us-ascii?Q?yDqFCyMjs/o/KuSEtgQn9z1Y30qPY7jA80rurO4D9WxzJ+nQ4V9NK5d70U6c?=
	=?us-ascii?Q?f9ULPFfXFfbas/dBhW83pxqIxd1R8vOtXoOwW7sgFn4ZnwAEYAXMV1mJAT9y?=
	=?us-ascii?Q?w3Gm490md+mh/eALkMUqRL3NpOLUnBQICENb96Ii5vd4Hb29iKvji+lJWrDf?=
	=?us-ascii?Q?AmgHPQNYs5vz2ZUPIUSMM0=3D?=
x-microsoft-antispam-prvs: <MWHPR02MB2848BEFB6985F8E07A8FB9A0B07A0@MWHPR02MB2848.namprd02.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(366004)(376002)(39860400002)(346002)(13464003)(189003)(199004)(25786009)(86362001)(7736002)(106356001)(305945005)(105586002)(186003)(8936002)(316002)(99286004)(74316002)(2351001)(4326008)(14444005)(33656002)(256004)(6246003)(52536013)(97736004)(5660300002)(229853002)(7696005)(14454004)(76176011)(6916009)(2906002)(53546011)(446003)(6116002)(3846002)(6436002)(478600001)(486006)(5640700003)(6506007)(11346002)(66066001)(102836004)(476003)(71190400001)(71200400001)(81166006)(55016002)(26005)(8676002)(81156014)(9686003)(2501003)(53936002)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2848;
	H:MWHPR02MB2576.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oRfqvGcZ0mopkBnWvD2yILjN/hUNs0bRx3DGucev8M6U1R5bjsH+N45yNdoX/5Ax5zzLGuAWFNPMQVLFeRswi0RsVZMIvv1pD63H18T4FhDYjy0X7dGYma3KIJd1CEaLx0Z0L6KbM/D1R1bEvWr8m+T6HisczJJDXpd/lItlfI5OXZDrlTMZJmuCcfZSJlMQbmBXYVLxxZ9qltbCgI6u21meuS3th4VHTjQ9gKkUhlmFfES2UoZAWK5xWgCy/DePQqKWLq+7uVOqZ5+RduAO40O0ta5PDNLnsrJ5uVRyiRCMyN0q9Rt+HmF23+MTfbxpkSHPh/Hse3K5qTGJm4hgdPJ6sLFipKAS6wCRpFU27PAxA8ZdiwOLAT5azutbS9GRaHuju2vJtkvCDimbqIKTkWKAGl2yL0q0HyCPXxPqmtA=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78fdcf0-2e04-43cf-9529-08d69abf93af
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 01:21:32.5932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2848
Subject: Re: [meta-oe][master][PATCH] ace-cloud-editor: move ace-cloud-editor recipe to meta-oe/recipes-support
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
X-List-Received-Date: Mon, 25 Feb 2019 17:52:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

-----Original Message-----
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>=20
Sent: Thursday, February 14, 2019 7:16 PM
To: openembedded-devel@lists.openembedded.org
Cc: Chandana Kalluri <ckalluri@xilinx.com>
Subject: [meta-oe][master][PATCH] ace-cloud-editor: move ace-cloud-editor r=
ecipe to meta-oe/recipes-support

This commit c245374fafbc4769e0c98ae18ac9ff71f9f14169 places ace-cloud-edito=
r recipe in an incorrect location. This commit moves the recipe to the righ=
t location.
---
 .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ++++++++++++++++++=
++++
 .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ------------------=
----
 2 files changed, 22 insertions(+), 22 deletions(-)  create mode 100644 met=
a-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
 delete mode 100644 recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb

diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.=
bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
new file mode 100644
index 0000000..4ea6c8a
--- /dev/null
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Ace is a code editor written in JavaScript."
+SUMMARY =3D "Ace is a code editor written in JavaScript. This repository h=
as only generated files"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D794d11c5219c59c9efa2487c2b4066b=
2"
+
+SRC_URI =3D "git://github.com/ajaxorg/ace-builds.git;protocol=3Dhttps"
+
+PV =3D "02.07.17+git${SRCPV}"
+SRCREV =3D "812e2c56aed246931a667f16c28b096e34597016"
+
+FILES_${PN} =3D "${datadir}/ace-builds"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS +=3D "rsync-native"
+
+do_install () {
+    install -d ${D}/${datadir}/ace-builds/src-noconflict
+    rsync -r --exclude=3D".*" ${S}/src-noconflict/*=20
+${D}/${datadir}/ace-builds/src-noconflict
+}
+
diff --git a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb b/recip=
es-utils/ace-cloud-editor/ace-cloud-editor_git.bb
deleted file mode 100644
index 4ea6c8a..0000000
--- a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Ace is a code editor written in JavaScript."
-SUMMARY =3D "Ace is a code editor written in JavaScript. This repository h=
as only generated files"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D794d11c5219c59c9efa2487c2b4066b=
2"
-
-SRC_URI =3D "git://github.com/ajaxorg/ace-builds.git;protocol=3Dhttps"
-
-PV =3D "02.07.17+git${SRCPV}"
-SRCREV =3D "812e2c56aed246931a667f16c28b096e34597016"
-
-FILES_${PN} =3D "${datadir}/ace-builds"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS +=3D "rsync-native"
-
-do_install () {
-    install -d ${D}/${datadir}/ace-builds/src-noconflict
-    rsync -r --exclude=3D".*" ${S}/src-noconflict/* ${D}/${datadir}/ace-bu=
ilds/src-noconflict
-}
-
--
2.7.4


