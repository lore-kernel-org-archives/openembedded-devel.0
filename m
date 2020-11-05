Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.58])
 by mx.groups.io with SMTP id smtpd.web09.5143.1604568640250123250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JDCWEaZk;
 spf=pass (domain: windriver.com, ip: 40.107.223.58, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0O3bvwYhSePXVBpC7+1GhIReAkIb37WoSWfYA2BZ8BArHdSADD+AOwxsy3phvUc5u2qVC8prhXy2VvHMzHg7EzS7DXbXlaj7yjiffphTA5TPoM0ga1GJHdkCEv0EWsmxEAQHSvpNEtB4W2C45tcstj29bgtypm++2QyFxM210HIu+C3VQKW4A3c0jy9VYL+WfWmURSNB4K4WtE7fnZ6hVw5m8gdCxLrMFiOiTOl33ZHHxhcVrbfMkUFF/yx2BwliabEvrnCY7rchNDon7fGZhcC0tHCAc7RGssfKrMv4fC/4BqKtiQFMGsuzLM/qm9e+QWN87Fdpvm2PL4EfmHdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+H3O2DUkj/8WnzbYyyEzeoP+yl3H2xEAx7krvkzIYQ=;
 b=d3VqkJzW65SMNvvskD0p3rBxw83zD614E6NpT+vckhgCFhXwujg0r+NJOUqxK+Vh73McAUAoFXAMXR86D2Fsfiazx+CPbVFcMgn3TilIKrNZpFXfxoGp39mSs6rToarDvKMnbl9SQgMmbSn7T8yZBzvnydJEpwFKGTKktgOf7W/eEVXlpTY7RAykqcmJsswRMgC/vqFIiFIe47M8m6uMrZ0cEzJ3wFoANV+1VBP575ZLvSztDtzgzil2S4EcG3kk2jGc8PIQ5TAaIN1AVvDt8M/l7XAGrKEPjUAkhY3oh9n/p1vosqvLIguXbsH1JX15uRzmPYvyVag957haUEaEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+H3O2DUkj/8WnzbYyyEzeoP+yl3H2xEAx7krvkzIYQ=;
 b=JDCWEaZkcaVcPMYYNUMFENuuDhcr+5YYyIoR2FuN9GzMp30w8wWiLydMa2pCavQYplXctdOX043vreQCJGkEdRg7skgHLYIlSA/nxN99SwSaL4Q1vIeFuTBrBn+hYA9NFkGAxg/NtTzbH2tTfhlaHYdTHaBIOFw5yp9yBU8shCA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 5 Nov
 2020 09:30:39 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:30:39 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] libmaxminddb: add new recipe
Date: Thu,  5 Nov 2020 17:30:12 +0800
Message-ID: <20201105093015.36886-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 09:30:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a30bd6d7-19b4-4554-769f-08d8816d7529
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4817DD6A6B45E758D78A88BAF1EE0@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M1ZAwJI5OiZnmdKiwXRFwcQV6VlGEcwv4CBSHcGYeyY9AP50aYbpButZoxXmnuE1q3a4nOe1AxNZCveoCsYdW2jIV27mOXOfIwICs9avZ726AXJjc/pHALvcpjKUm7PO5cXZ0PiJnAjaJn32++nGa/wX4MpQOi971apOgekY7MSSB+z71jn4n/cZtO2NHDQZ2nIAj3eX7nfc0v5bl1SBSQ/jjlJT9sFOlLHGrSYRN88I0/A2gW4tDVJ6nbDSKl83Gdo9wP5gmQSo6zzd+E9ZTSeAkDmv8gsLpDc2DmWQHyWSeRHglKahuh4h4Q1+jDptMPevchnsbiG8J+tDpjoV9E1oL1p71tnClvCXARXdw/jUHhT+OWDRqpoKPnThL8qbpMKQPBxYZ+cbfecF6h1UXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(66556008)(5660300002)(66946007)(66476007)(6666004)(186003)(6916009)(52116002)(83380400001)(6506007)(6486002)(86362001)(16526019)(316002)(8936002)(26005)(1076003)(478600001)(8676002)(6512007)(9686003)(956004)(36756003)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OiOOeYxrbL53eYP2IM4O2Y0stnpmxMewMefRWGyQmO4NDXNLOy0CP6gxdapWw8PpDsrQOGo/xGuvdG+zeK8AYLqvVWjq/ajwxQJvQmKpo/6aCnyd7aglqqNo4R5qpDhctINd8kRvTe8e9eA521ONG8DPCCskieOnqOYjwdX9ycIktwfq43USAAIDuOV0DcCX+BnXsjwULXURLDH9xy6hB1jf2yck/l/wxFD/XywFCuWD40/mmiGwImFTJ/YyYFDtyoasomZtHfjMb+6QKgzXXwLkUxJPdbZ+POtvUMtGchY6snirqOc2OV2t2q/BLNYYYaJMUpANWozA/UGvVyqyox0GwnnqDptGK6uiYlV5UCstYvzJHdeihc5JNh9wi7NsC+LEsUMKB+41ImR6YCD2jhyJPJ18W1iOP0zghFG7I1dV4SITuT0QlO+p9mdWnRKP/GC0n85GyF9Nap2wNpedi5Q66BuKhNDSbk/RkAVtrmJSod+sfM51TUFvnbAFqSNgUpKbt7O/RqpBSa3cj/nThKxrwSTFCeqKsOxP15+yt9jpJocu6VeEPO04tPjrDFZtEq2F3D6ylIreTMbHqBCuC+XoePpdH93c+kCD3q8yvjAs5KLcqwPjCLMIYKMUoyaOOHp/Ob1eyb67c2V++gLUIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30bd6d7-19b4-4554-769f-08d8816d7529
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:30:39.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNGrxBpPbLS+67Ou/6D3+FgjDJ/FJbhJabCCAF6c4jQXcvnrDt+mW1Gh1n0J1B3qKWIAkUYFVEz3ogB+yRkb7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The libmaxminddb library provides a C library for reading MaxMind
DB files, including the GeoIP2 databases from MaxMind.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libmaxminddb/libmaxminddb_1.4.3.bb        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/libmaxminddb/libmaxmind=
db_1.4.3.bb

diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.=
3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
new file mode 100644
index 000000000..d5c303861
--- /dev/null
+++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "C library for the MaxMind DB file format"
+DESCRIPTION =3D "The libmaxminddb library provides a C library for reading=
 MaxMind DB files, \
+ncluding the GeoIP2 databases from MaxMind. This is a custom binary \
+format designed to facilitate fast lookups of IP addresses while allowing =
\
+for great flexibility in the type of data associated with an address."
+
+HOMEPAGE =3D "https://github.com/maxmind/libmaxminddb"
+SECTION =3D "libdevel"
+LICENSE =3D " Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7 \
+"
+SRC_URI =3D "https://github.com/maxmind/libmaxminddb/releases/download/${P=
V}/${BPN}-${PV}.tar.gz \
+"
+SRC_URI[sha256sum] =3D "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b=
9fc7d83551a439"
+
+S =3D "${WORKDIR}/${BPN}-${PV}"
+
+inherit autotools-brokensep
+
--=20
2.26.2

