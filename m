Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 908 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Sep 2015 11:49:51 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0116.outbound.protection.outlook.com [157.56.110.116])
	by mail.openembedded.org (Postfix) with ESMTP id BC15B73243
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:49:51 +0000 (UTC)
Received: from BY2PR03CA075.namprd03.prod.outlook.com (10.141.249.48) by
	BY1PR03MB1371.namprd03.prod.outlook.com (10.162.109.29) with Microsoft
	SMTP Server (TLS) id 15.1.274.16; Tue, 22 Sep 2015 11:34:42 +0000
Received: from BN1AFFO11OLC001.protection.gbl (2a01:111:f400:7c10::117) by
	BY2PR03CA075.outlook.office365.com (2a01:111:e400:2c5d::48) with
	Microsoft SMTP Server (TLS) id 15.1.274.16 via Frontend Transport;
	Tue, 22 Sep 2015 11:34:42 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11OLC001.mail.protection.outlook.com (10.58.53.72) with
	Microsoft SMTP Server (TLS) id 15.1.274.4 via Frontend Transport;
	Tue, 22 Sep 2015 11:34:41 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	t8MBYdCk030528; Tue, 22 Sep 2015 04:34:40 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Sep 2015 19:39:23 +0800
Message-ID: <1442921963-19530-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 2.4.3
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11OLC001;
	1:cZIXc0DjaXcrLPOtcdPDUq/eWrqz78x6W2mQUW/KVsPSFvEcBXQEjrGRPsIUguC2V1pVvmhicrH7T64EpeO10bA/pYWJ4JextXneWX6b+AuCSg/qJsDZNTXi7wsQ4jCjeZM+MBwqRzo80tuyywmJWzLUa6PFVa22vD23+kFTGaKv+nFUJd4h7TaJtKxdbCDe3QihMGu4/zp9M+z/AQx6Ytcab1/gb03kPbhylvn5LikTEn2X2z7mGX+xyUJfrRhZzgZQCWB46SF0enOKRHL6czUuXh6DsIOycXr6ZLHyWGAR8srAv/DHNfY+N4yH+/cFI2+jdW7tiAY8u1Ez+HMsEXtQMvc1zGuE+GGhQjl9zzFUiKK+tb7QFsboYM1DdgHwFd2zaYBlpv3w3umDSw9Brw==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(110136002)(64706001)(48376002)(189998001)(19580405001)(68736005)(6806004)(107886002)(77096005)(11100500001)(36756003)(81156007)(5001830100001)(97736004)(450100001)(4001540100001)(50466002)(5001860100001)(62966003)(33646002)(5001960100002)(5007970100001)(19580395003)(50226001)(85426001)(46102003)(5003940100001)(50986999)(105606002)(104016003)(92566002)(69596002)(2351001)(106466001)(77156002)(229853001)(86362001)(87936001)(47776003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1371;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	2:J7e6WwAtz7uYCvou5GoGPX7PPeuJec/rANUjYBOHLMq7y8jItNtrrL+rg1O4nGQ5fJDZb0rpZOY0Sd13m5FLTRm0KIDZLbL6lmptPOnj2batkDEoUT9/s0aJEVcptLQX+Duw25J+3ifEQ2wNmdHo9QW2hi/OD9XKJoDF51qLq3Y=;
	3:L0iG/n3j8Vy08uU4cXUnWVVGEvR7iQC4/zjWa068LEx7V8sbrcvHV+TCozzwpd6nrfF22iHl5z7fRBMaYJP/VtIe50FvICP38Do7gaJRDDQSxwkApHRQxL31wrVYuFz6VCO72xEQQN/RpCM5Q0+MoFr1Q6gh9or4rI878PRgn7UWgaHbr3j/O4c6BjZz1Rf8mqGo2x/eWoPwgvtVohHZ+3o1A7Ypq3nNGYLtRmiv/pI=;
	25:Dvf3MDrkA1nOCF3RE5qnUkYZ8pp+z8RlfdgOUuR1AM5a5sIYGI1IREtbwhog278oqc3TTnL9dWfnm83OD99O4BAu6tHi9zMY6bEtg4+5RkUOYWBeg4zQomqcx3XtTwIwbbrksfJcSPo7easTurEV4iseOcPnJuJJUnwLIflzBVII9Ffg9WSGRExet0aejNT4VdEoCylmO4s76c8rEsyjnuHccxawTDoSHYNGco5VQYvxUkVOdxZuTS9jNcTrvh7UW1OZi3cNJS+RwNSb45X7eA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1371;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	20:Bs7QWCSebCp1OWX61akpVHTtliJNO74RSMPQIXg5zOOGb/JMJFoQoq+sgU9yVMUjvY9DVtANXv8H88n5p0uEr1NDf14S14/FNbsAEfh8JwktimPMy8AvNS2AzFq3qo3DhtP88kTkK9wTVGEr0q32LIOwfapgOW0nh2sf2O+Z4Di+nGa8WSKHd7O6qks2OXC4lT0Fl67ffY21z6rEIn9UqSB91yAS9Ffx9u2xE5HqF0w2wCZYQ/dOdXcwhh53NSq498KjNJqL7TrEbBdJjFZWAwUbILxCpkNC4K1dnUYSgTZ7ndkzjwCFS+bcbtYDjgsCYhG6riZl+AG81vsAfUENvQhwVDuTDt79STU3mPOd5DU=;
	4:8E/+1fGFwaL6KvMb8isScSzn6JJ1PVf0/w2YETnTPI1qjJ9k/P7MbOLNfbRN7hp7pySUFSqB8teit7PlDs2AOxZKHVHDgvMAJc5Tf8mcZCABN+0eaF2PTkXWwyXm1r8rGi3KIsPd6uRV1swv/JTYjvBH/viIXJsul+Zj7oqoV+iRcTM24zkAelHQ/zQ7gTSXu4dpZ3ViS71GiF8hKVEiM/zBbNeVw4RtZFEB3K7g/lwXB3V6gZdk1MMye02F+ccOIvCWVSHUnSI5C05NW4lr6XQDI/WNko5tvLUyLIHPH2Dgj/Ch+uoJtt7bw6W2jF+028f/ioOvJ0f6QHRFste+Nc7M7NoGKdOf5cuaKwUwSM0=
X-Microsoft-Antispam-PRVS: <BY1PR03MB1371EF377FD4C2DE0E54A745E4450@BY1PR03MB1371.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(520078)(3002001);
	SRVR:BY1PR03MB1371; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1371; 
X-Forefront-PRVS: 0707248B64
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1371;
	23:Jz2cnkt9lWkSqmOS70OY4zZH/WpNA7ayCfq1cYlx1?=
	=?us-ascii?Q?SE8qKeAxcxHyG1lZarRNY4AtEwI+4ZBcqxWD8IgSrhFhmkHHdRjJNLsaRk8a?=
	=?us-ascii?Q?bMGy98AQ02yNX4GbPzwVUaHhLWVMV05nekWXQQx/lMOFm8BWIe+xuuZCrCek?=
	=?us-ascii?Q?v8nWetd7RtgqcUUocl1xRT56m8lQh9DrmS09omdvApAM6jyoqr95nSXYSiDx?=
	=?us-ascii?Q?WVYIzdQ9lu2sabWSGB80UPGNE9V4dVkMwlywnhmt3loIHfvxyUhYwCYHahK2?=
	=?us-ascii?Q?RUKYXt0fqBQ+JH9PntAdb0KYNn6Ik/i0CCvu0iNwsKiLEz4pIamtI2AxQT5I?=
	=?us-ascii?Q?Vo8dYDRQiU+f5pPsUD+sSXMgTfXxL+QR5qLT7enNmXAgprq7apnrzBWeREPu?=
	=?us-ascii?Q?/6WscjH+RPrvLAwTF7ENxHxnIHeI9aSNE2HqDSSyJjFVcRd/6vKZPd9scArw?=
	=?us-ascii?Q?iUeD/rKROJ01cOfvsTIJhnNlIkTeZHwDVbEpxH9LrbmTa0R5Yg9MiBAdNemM?=
	=?us-ascii?Q?SUuQ5vGCc8NzIlw5nBZwnYBwKgjVHLf9WIZOSnvE/8a1sUbOeSZb5TiWxESV?=
	=?us-ascii?Q?Ezja8EmrIOiJhUf2znwiG1PP0v3ERbMsJwW4uLET+lKvvUtoZ+51tqoLAOkf?=
	=?us-ascii?Q?ahB1YYsIfbeI56WABVHPD4xhiE6ZXEKE60e9qktIjHzwoYsPqfqMvO1XHeh1?=
	=?us-ascii?Q?WUduE9ADuJAe7ly6Zu3VfFOCfPwxgKbf05t+jRuF0Qh8PJzRkf+a+mzrfPBy?=
	=?us-ascii?Q?eYliOm1jqiN3IcZtY5sTyzZ/ZJ0o3qDtGLhk17LaPcTJzkmDD/gUYrE3f0Yr?=
	=?us-ascii?Q?54rvvjfpK8O8+0SS064ZHXFgniVTwtrO5Z0Wh0yGJrVu7/Qwp69S28tAbwKI?=
	=?us-ascii?Q?C8+1P+QnBUyMqtzlS6FGCtpoaLHO8DBANAnhj59b2C/XKwt8hLGsraNCBbHl?=
	=?us-ascii?Q?PkxTwzdmLlI7filp9MMH0iCoBfnLjl3785ZJGQBDYQgQoNF0MEDSCSyqQYar?=
	=?us-ascii?Q?d/YsuoKO3McVno1IZ3k0AUUFSlnZu/MGatp0qlXakiY+L6gX9RdFDGMaSLpj?=
	=?us-ascii?Q?crt6J11P1X2j/yQbuBOtczMwdbNLAGe6mUbp62GkIDKxC31tJoBx9mdZK/tK?=
	=?us-ascii?Q?OC2sRZx5J+zF/xFAB8JuY0BPU5Fd4zWHrb21GZ0x387PeS0VQ4CG/iO6pkAR?=
	=?us-ascii?Q?9iwYiy0yGQX3End7YgHQywawuF1Lx8wmOE01rEBvlpbmMisec9qEpJWLUlT5?=
	=?us-ascii?Q?DeX/N0mp5OhjiZFsQC3dX2oLM+nMch5UvDEbm72?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	5:/cOJEFKsMqtYyK4BvIWgN7wo6PXcJcipvk13INZmSXiz7MtbXDrqnFYIGAZpPDavL6DsESv1T+SV5rZPUKXgwld0DZ+zUxC88rO84waOz5GNBjorgS/bvOT9jKDIokrSfvDW//XuqACW5KcZTF/ZAA==;
	24:V93moODECfSEx1C8keWshB7JtnkiXkfku6mzlF5hb6WpVNGj1c6YxC/UvANrFBSOoMRA3868Ph4g9ojtTxW3C7wAJinNj88NI3SDIa+Kaxw=;
	20:Z+BIHoPaKCI9hZOOnk+PT6p/sLOt138RgKtABb1wUxrzrOJPN70sm1DOM6k7dzWJZqRNbnn0PbOXm2JlyDk9Rw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2015 11:34:41.8839 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1371
Subject: [meta-oe][PATCH] lvm2: make sure services files are installed in systemd_unitdir folder
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Sep 2015 11:49:52 -0000
Content-Type: text/plain

Make sure the services files are installed in ${D}/${systemd_unitdir}/system,
fixed the following build error:
| sed: can't read .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service: No such file or directory
|   sed -i -e 's:/usr/bin/true:/bin/true:g' .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2b2d8ed..1968ac9 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -39,7 +39,7 @@ do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
-    oe_runmake 'DESTDIR=${D}' install install_systemd_units
+    oe_runmake 'DESTDIR=${D}' systemd_unit_dir=${D}/${systemd_unitdir}/system install install_systemd_units
     sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
 }
 
-- 
2.4.3


