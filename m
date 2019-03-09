Return-Path: <bassem.boubaker@actia.fr>
X-Greylist: delayed 3613 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 09 Mar 2019 10:55:14 UTC
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
	(mail-eopbgr120077.outbound.protection.outlook.com [40.107.12.77])
	by mail.openembedded.org (Postfix) with ESMTP id C8AE17CF7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Mar 2019 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=actia.fr; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FjME/wrS6TGUpW46RdC0Lu/AhVIWBP28xSB7dssuA/Y=;
	b=hwZg1w5z/DRMfwDiUViigtuUtzsfMBUtEifZoZslQF9Ef5+g/qw86tlFDmmvehgtXIU58CIV2w7tSbggv9+Ls1XUM4q9bh5FmVRd6WwLpeeBW6jrCww9wmEtS0gf8zb7ZbZxmlP0zPxx5A8pYI7ig3CS7tWwaPFRu+FGoa6FIqU=
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (52.134.38.15) by
	MR2P264MB0113.FRAP264.PROD.OUTLOOK.COM (52.134.40.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.18; Sat, 9 Mar 2019 00:44:20 +0000
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2]) by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2%5]) with mapi id 15.20.1686.018;
	Sat, 9 Mar 2019 00:44:20 +0000
From: BOUBAKER Bassem <bassem.boubaker@actia.fr>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH]     cpulimit: introduce support for this package
Thread-Index: AQHU1hE74JkJYg2SdkCEQfLVefzWlA==
Date: Sat, 9 Mar 2019 00:44:20 +0000
Message-ID: <1552092251-25129-1-git-send-email-bassem.boubaker@actia.fr>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0031.eurprd02.prod.outlook.com
	(2603:10a6:4:a5::17) To MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:c::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [185.69.189.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c89f330-f6ed-4389-235a-08d6a4285dcb
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:MR2P264MB0113; 
X-MS-TrafficTypeDiagnostic: MR2P264MB0113:|MR2P264MB0113:|MR2P264MB0113:|MR2P264MB0113:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MR2P264MB0113;
	23:3ECETVPiR4U+smOBPE7IqiEY6vg4xdXnh+U+v8y?=
	=?iso-8859-1?Q?Jg190Kqs9/crE2vzZaR6KpFFDiapt4DMuwYSQSSfsHVMNPhBMkgHvuQKcT?=
	=?iso-8859-1?Q?0ESWO1gQ8hT58rZpMzPXP3KQdiHL1vp3S2zYI8AazXWg7IL1XABeA6Wqdi?=
	=?iso-8859-1?Q?dHCR1QV/s8MQ1UAm83ZJ2n7RajwXScvAyItw7xmWPhOruqxmR8+OCmA12O?=
	=?iso-8859-1?Q?NHdYFLByFkFjPfdTcyVb3tBpCgy/ktBWerbs//ItEEzzsgY+wmXn5Q0RDb?=
	=?iso-8859-1?Q?ecAWVehH+UIWJd8I5yZFtt0JQc1t5jXahVKuaTT9u8C9cNUwR5ybkqNcyi?=
	=?iso-8859-1?Q?shosRl2Hl0sWnu4sNK0WVDTtJ5cDU4x8FDFBeHYc0aG68kvfOJhOaN9iNJ?=
	=?iso-8859-1?Q?VkmFIWDjAjCOwGEVoEEN30ymiqJtun5hjyzegBk2EZyKn1RoqdINeEOYt9?=
	=?iso-8859-1?Q?hgsfJzYbTZr+XxpjCA1zv561KPjwsmepT/odKOt+GJJWhrABd8IG8fxyeJ?=
	=?iso-8859-1?Q?iqphrzcaFxSKdDAdoCjDS7ZzfTUL6jZ+eo1Kwyc4QIRsY2LbFHsUDTkXww?=
	=?iso-8859-1?Q?Zt5UXMprNvlDRFgoA6+VvnKGADr9YhxuI0jPYEhio82devWahBOPCh4s6Y?=
	=?iso-8859-1?Q?LqqRMB3+dempx0L2co2T2IHakl/fUoCi6Z1kqSZjOjxacE0qR5D3t/ywBu?=
	=?iso-8859-1?Q?lqYML3JQBGHWf/51hOwxQ5cbtdhrArO1i9VoS/CeNMj2v971tF+plLNTAH?=
	=?iso-8859-1?Q?COhwRRsxSQCIjISWucU7W+A+FhGhakFUCJg/XfRC3o/CoWKnu9OWUh8NKW?=
	=?iso-8859-1?Q?JW6GuXw32Pi7J5Rco3O7CcCJRZAn7xjHEeG+i73Z0DkbSzzCEJoveT+3MC?=
	=?iso-8859-1?Q?ZwIjpZnaU4co3VbAey+xarDAQQIcIW7WMLVAVLsLVVw2nFqxMcd1GDKfX0?=
	=?iso-8859-1?Q?Gbw8IrMMUJO/8HySsrxQgYTgyuae/lwByyl0g6h+1ejcYbzl8IHIBTMrhN?=
	=?iso-8859-1?Q?6Hr3gpbn6TW/F/s27tNxiyeKnZmEwtfzdx9T2/RbqfFKMF6R+ipb1VXF6p?=
	=?iso-8859-1?Q?ckZI53Ni4BlO7Ihol2kYKTbMTimNZvXfjfJKlXQuGlmVqQYPWTUCSfvd3z?=
	=?iso-8859-1?Q?SD0qsYzcitc9xLGkVH1iifScPTRnD030h8KaVq3N8n+dTjGf6CTtZaip+E?=
	=?iso-8859-1?Q?xvfua8VZJxjcbNAzCbGOhMJ1X+b7zyeaKz1gKQSe8ULF680ZUaWDq0UZ2q?=
	=?iso-8859-1?Q?/gyUfCy2GTI+v2dUbFrly1671zNFf+kN+9YxeKJ8LOsTcK14jr6Je8ToRf?=
	=?iso-8859-1?Q?fgTk2/XN7x/mVrk32gKTKwlrudIGt9J2/wWXKjDoU1ctg=3D=3D?=
x-microsoft-antispam-prvs: <MR2P264MB0113066AD9DC1AFA88B638579C4E0@MR2P264MB0113.FRAP264.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(346002)(376002)(366004)(136003)(199004)(189003)(25786009)(86362001)(53386004)(107886003)(4326008)(486006)(52116002)(386003)(8936002)(6506007)(81156014)(186003)(5660300002)(7736002)(8676002)(81166006)(305945005)(2906002)(14444005)(2616005)(476003)(6116002)(102836004)(26005)(3846002)(6346003)(99286004)(6306002)(5640700003)(105586002)(106356001)(68736007)(2501003)(97736004)(6486002)(316002)(6512007)(256004)(6916009)(36756003)(74482002)(50226002)(53936002)(6436002)(71200400001)(14454004)(66066001)(2351001)(478600001)(71190400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MR2P264MB0113;
	H:MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: actia.fr does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bassem.boubaker@actia.fr; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sQ5QQzsDoyDqw6zDiC9fVjsr8/4JT3BycTdKlkGJ2txSh74oISpwB9OJ4fMtsIJFDUkN1zD5GF0JZ7JGpJZ9K8+PGyIe3rTJ720QIHbB7UP54t8WKQm2nYGEjWAiI5ehnaASKRVbq2cAL0bMat1E3yeRoPrNiMYXFpsqOSfsRRqoxa6JdH723iaprSjYkO74HavkKlmM4uSKZz8hqxYafaKEI+thFJbI4b6x9bKy8j8Uu35Xx55ERZiX9G7/CissvK/Tqts9qJdL5MsYnFcIEz218ScnXQI5I24qG+9f4cqkhWriL8Dfyy6TTMyuEKxnx2FmtGOpde0jwH9TZzdpRkTH0TIPQkJUuumISxBslGhbiyT1ewBgVdcNjFlrG6t78ccxb9tH2rYNqjwBLtf2e9/W1gKG4eKvERbXZFMrZ1M=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c89f330-f6ed-4389-235a-08d6a4285dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 00:44:20.1997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86314f06-03e8-4460-82f3-a44f992a19c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0113
X-Microsoft-Exchange-Diagnostics: 1; MR2P264MB0113;
	23:HePN1pDk2cYuwq66JVkXCGvQX92rBF7+37fXuVeCh8S3McQMlQJT+Xemk7xYc8DcehQn0tL3JwacQl40Cqw7IVerjddK/FAtJBwWSPRnRubrSo/Tz5NnAdk8ZHjLHutCzJor5qkMS/L5MF7n8hW20w==
X-OriginatorOrg: actia.fr
Subject: [meta-oe][PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Sat, 09 Mar 2019 10:55:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

    * Now, cpulimit recipe is put under recipes-support. Binary will be ins=
talled by the recipe under /usr/sbin

	# cpulimit -h
	Usage: cpulimit [OPTIONS...] TARGET
		OPTIONS
		-l, --limit=3DN          percentage of cpu allowed from 0 to 100 (require=
d)
		-v, --verbose          show control statistics
		-z, --lazy             exit if there is no target process, or if it dies
		-i, --include-children limit also the children processes
		-h, --help             display this help and exit
		TARGET must be exactly one of these:
		-p, --pid=3DN            pid of the process (implies -z)
		-e, --exe=3DFILE         name of the executable program file or path name
		COMMAND [ARGS]         run this command and limit it (implies -z)

		Report bugs to <marlonx80@hotmail.com>.

Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/rec=
ipes-support/cpulimit/cpulimit_0.2.bb
new file mode 100644
index 0000000..2ac82b8
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "cpulimit is a tool which limits the CPU usage of a process"
+HOMEPAGE =3D "http://cpulimit.sourceforge.net"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb32dc=
4"
+SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
+
+SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
+
+do_install() {
+        install -d ${D}${sbindir}
+        install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
+}
--=20
2.7.4


