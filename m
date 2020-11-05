Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.44])
 by mx.groups.io with SMTP id smtpd.web12.5050.1604568137276548045
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dtztms5v;
 spf=pass (domain: windriver.com, ip: 40.107.244.44, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd2qwZ4IFK4zj0o5CIz2/8sjqC3HTBAB7WgrPMJoz9M8yRs+JsMdFgXSQOC+yAtVIAAFExFpOf5/TxlBXm6zk1lfJOc4ptBR+CRJjMas300cEmC63b3J0gBjL7aZZtGNiantiIJUWRUTQaUSRSD6t/lhjlIn3wxgFxEg9w5iyePoKEvFsdC7MbwM+OG8Z0Falcn/jrTu9sszqyD5/aCjeV7TEuDylpI/CPbQql6sg2fqGObNZ2kk3ynDCmoi5M0h6NoRCMXwAdQQ6WMqbQf4BUvdM7GRWhGdLuoZ1SnDQfuyTgYbsYg2WXlazolWToUa2D981dIsx8e8STtsDuRzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+H3O2DUkj/8WnzbYyyEzeoP+yl3H2xEAx7krvkzIYQ=;
 b=GJVfclCn98oiNMVrweeER7wYrf/XI+TpxTDAx/+vCdEtCQvpDbQ0vBD6k56pqzYbBWxZ4hnwHrURyY1b0ShfG8wHrGubiDrhxJ4qdEsU3JCciWcvV2fQBjoiZ4mrSxmrRVcC79MdmAGwxEXH8Z2W1R/PJrH6sOagund0AxH0aOzVE221Ss5kDG5nZLeySYv8C016vSxQxw7cRt/FNnCAGV3eM4lZPm6aVrDUzf5eT9d41I8I7wcAH55YHdmilEg2QAf/Mn4mK/l9WhHkpZqjsOk+rc5Xl2MIofZF5rHerO6IS8w9+1kcqYKCJ7nt+3I9NCR1TYN8fB8/HXyKqcRxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+H3O2DUkj/8WnzbYyyEzeoP+yl3H2xEAx7krvkzIYQ=;
 b=dtztms5vWJzr0Bqa9Dd6C0FC6AldpK3+1kqYN5N5MZE79r70GihwHVIMknZUruJdJ3ET9ytZDQis5imh2cElX3bzXeQb+24gk/sjVBwkRHc6H9tog2Y1gnpC+pJUmzJuLFqm9iU6LdyfqpVte7EL+RYCGpdNdIF7YQ8N85X/+x0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2320.namprd11.prod.outlook.com (2603:10b6:301:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 09:22:16 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:22:15 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] libmaxminddb: add new recipe
Date: Thu,  5 Nov 2020 17:18:22 +0800
Message-ID: <20201105091825.36257-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0001.apcprd03.prod.outlook.com (2603:1096:202::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend Transport; Thu, 5 Nov 2020 09:22:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7380092-2087-4b0c-b923-08d8816c48d1
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2320:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB232011958EBB28D1D6EFE9DEF1EE0@MWHPR1101MB2320.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1tpafVdkIEYh7Nz9+GVJ3vYYnPKKGOzpl+Hg7LIAEVR0pt/pOMuc7jgiXADS5gLIH3fpu8J+3c0wuCvvYiVaRKNb1tMKjd6AaUCCltKgKroSQYQtc0GDJ3mdvZU9SayvDNjhVMFho/SbEQ1qtlRswgqHx9ffn0kIUWY1gYiB+JKAf/7gx1jO4KCgHeuZh8ffK+s/lyGIj0BOo3axVbym6b59Gs/RCqtRof6+rcZLe/pkSTTC9sO0erKWZbwepINJBJ52KJBNWoYbTuq4FgWqVxlfP6kELjLpFiJiH+NE15c6CcS/llnacbvUzlQdfxhamBt+HliY+UgnNTWxKqx5jvQa5RJ72UYpkkzOOsOXZrDqZdtu/s8inAnk8QEnsFYkEsnaiL1Kn8B1G45Vfmeq9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(66556008)(6486002)(478600001)(9686003)(6512007)(36756003)(5660300002)(1076003)(66946007)(6666004)(66476007)(6916009)(16526019)(186003)(8936002)(26005)(2616005)(2906002)(86362001)(52116002)(956004)(316002)(83380400001)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rJW84eQeSanQZhn2ahqDHjGoKB6fXspG6lKl6LbGhGjVD7qWAnjlwi6tbRGdpWvMeSmylLUxAKaw9jt2Qvk3YZIiVL0WzShsPIfIq3RcfdYhXx+T3ReB2Bp6c2e4OExXVp1tJ+Zf0IkT1R8HKnwIcCWsf34ir5Y6kJhlYwFaZlw501gMgakuOXXXJ+x4YubB0+zEdveOfCsZM17mU1mpTXhxtRKOU5TN2hOIClpzZCmNEUpiuEiEeyEJn3apd8Z7TFrWfdTyt6AdsEbBY1x5JRucDD+6/MOMt61nH9dOv9WMOKNfOo744vqtsd3O/y5MT49sHTz+s6AoGrsHHkq/CUt55sEnwvruCJY1/I9S3ELR3yklnR4hcu4sKhxGhQKJnkGFrsAUZpRDJ+5vcze/NzN34ToZ8bJulf2Nr+YKwSnp0EkU5R46jQYHeW53Etw2Zzqx9JD9k/B4Saz7jNmLMf7bBObwf+08QUuTgK0e7GBR3/DEyRBgjE4j1wIwD7cZN9YsaL+X5/Ygl8qhpr2XeSmpKFbqGlBM1qgPCIiO887BZWtmXWZqTdd4WPowXDHEO0TuL/isi1nPx3i6UWk0xlZl7S6BZmktV9vdc2NH/HmwjYpMcrCMEKA7dvEBc2kKF9V3GRfb1APZXtkWo0sbbA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7380092-2087-4b0c-b923-08d8816c48d1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:22:15.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wx3GB2s18GAnS58uV2dXTZcIB2ekblH0lUUas0KmgeIPedJeJTCVqeqYck+Rh3TXAtQEOcUDPleHwmtC4bE18g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2320
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

