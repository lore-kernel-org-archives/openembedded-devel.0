Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.53])
 by mx.groups.io with SMTP id smtpd.web12.5931.1604888005721876710
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eCq6OGUb;
 spf=pass (domain: windriver.com, ip: 40.107.76.53, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nS2v4ivUa3oj4BQksh1TlWrvF7qAMyEMFeRLGaZg5PlkNlSqNSKiViMp3xsCT6YswBfm7g8emoOm2p7BNWQ37+WNqjUWS9++RXko9BWr+uXXGRw1f7MBZz4vV/rYZPVTO8xesqlqiDzPDVwxbCE7btgsGIedkxTfNYn3WBGmIm6Rk+eIYyiLDejkJsWDI3BgQvSyrkBJVut4XIGmaB6dcrzAmqrH7Ipw8POzFYIkvSfbDMLwpQNty++pqW8EXq5sXSzTWQPc202vte2jlvRq0Vmsp93j66i8g8b7tWC698rT2H1zAgGVJvMgUVD+0oAt6zPKIZg9vaIcq+aafWZ0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Axf2NV99Z9MzdQjW6lkFAHRVOkfQkCmlcIgRlQPfBv0=;
 b=cC+tzK/j4KJ1460nITOvT5glXtuWZpbS7psOaniUk08YIIlUqjDpJUozX4uo9uBQweIIXVijkW2PTZpTKe+BFr++ffbPDINnG6A+3m2jJppSFBF0YKNCby/DBMP+6ci0VF5HfygP2+X7rM54Xm4985zSYftCkkSzKwTjSsW7HGFbZ7PMamLOTBApaGR8Xrx7ZhKZc/rNlGlmrEKC3UoJgAM5JvCESdXkp4YxAngfMsapmW6gcIiyCvzqx+gKsmNt6wU8GFlbSSrKL42+ysg7PyJO+kSGFYnGt605FiPBlAPGEGVdOEdFPqAUKecBTU9KaOXn14TebMLqJOmyYr2Buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Axf2NV99Z9MzdQjW6lkFAHRVOkfQkCmlcIgRlQPfBv0=;
 b=eCq6OGUbBu/QJxTPb5KzVkSOG7xi/hS+gjYj/MTJeP85OcrOwnVSAfnv48hsH1HTTv5L96y6/Kvq/fCFLjoSEzw8XhFYK4QJYpg5+xmC4IVLHMBFRcSqptGExJVxCYxQQG9HLnIWEtOPgKzA+5G4cwoZOfhJI09b3w9Lh67huFo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 02:13:23 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 02:13:22 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2 1/4] libmaxminddb: add new recipe
Date: Mon,  9 Nov 2020 10:13:06 +0800
Message-Id: <20201109021306.47468-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1srN3p5HPwq1n0qg51g8yU7sS0Di9iX_hb89Unjsfs6WLg@mail.gmail.com>
References: <CAMKF1srN3p5HPwq1n0qg51g8yU7sS0Di9iX_hb89Unjsfs6WLg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 02:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4b7065-a7d9-4f99-efef-08d88455085e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45391B33AA94A028CBE349C6F1EA0@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JCvqXgCSvMWbzjSbherm7RhPTWX5HA+IOjQjDbUBpEBoxOmnBbswddW9/qESMx3yLR94ZrN7JK2huCAXh2XHUcyBe77qP7tY29BS4buLXkClpZcKIhdbDUzqNzm2INCPGD6Ht3ZsOfGRAYvwyLpGJN5PO/pXIFxa389oa8U5RFOzf1VAMv8OkxBTnxFA06HnzsWQaKSQUDEuyw+EgUUY1n3pnn0IIyhn7O4aDGY2lAyKVmpF9plSrEDX1hgOXlNj3ofa8/eiXX4Lvl3agSgtHnDqj5mmbVQdVNXkTYIuxcuPGKW7YqZ+KT76h7hMTMUxoBzuf2zDZd+RHBf/Pv7qY78gU1dcnB34bedWXrOjaH6h2z7ZcflTN3tiXONCHHFhmAGud/rWahc7tUD7dOGzvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39840400004)(2906002)(186003)(86362001)(83380400001)(6486002)(66476007)(66556008)(16526019)(6512007)(9686003)(8676002)(26005)(956004)(2616005)(6666004)(52116002)(8936002)(6506007)(1076003)(66946007)(316002)(36756003)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QwUaYDGPECTaNIXTIgZrRmK19yNT5NR5JVCQq6O2c7oPazF+DklJpMV7Ok1OPLo7hKaE5/RTetxB6V5Nr6IX/fuMUE2NdLxIzPvqHenj5wAbcQ+f9IZuMGxSfdyy8xw3Ike4OTMW5xW39qy8Isflf43JJcD2N1Wveiik/ESJXJOUxGj3I3a2D4vb9S9MRJ8cY4+j9UGtZO9kqIpAmKM8BvawG/obcpvoOkVF00/VBjSXJVyqQSe0j6CUfO/4v5fx1mJgX+Lk73UEyFQrZ7V5b2IOUErXo0IcaMEPmcpC1GsvPCvbUSTVcwU9lIaR4Il82bQ7FgFaZdS1pWyVJOp1Rri388AtJFtPDpPveiNUUqZrhppRLCx93p3SXkBEJkN+xScTfun17YZnhd3THy6wIpn1EvqyKsHV0LxgCJ6UMhXpcHGB56CugqQgVjT6PCHVi1h2M0phlMbwraA7/kMnlo1j6uwC2LjPfX3b2Or1A0eTdv0ivZ71fiWVuKSQNp9+WhZNPt8iZoL6pvdUELNdsRhtLejKA99/zAbl7g5zYYdbzR7m3Lv8vDUpb1gjdwCaYtylNf3Wg7epxEaRH0AMPlBN7JRFW7pj3lcMpqI45RnHnbNGPepRC4JRw4XB8Vx3x3CNMCOueh4jyc5YmLY4jg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4b7065-a7d9-4f99-efef-08d88455085e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 02:13:22.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yus6jJjAPeLnvQCHhjNlLO9RAcuoMeWxuDzL7D/H25LtsfaQVffwVtkzisk+YnsXALXA3M0WJEwNxxzlu975MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The libmaxminddb library provides a C library for reading MaxMind
DB files, including the GeoIP2 databases from MaxMind.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libmaxminddb/libmaxminddb_1.4.3.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb

diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
new file mode 100644
index 000000000..204148e63
--- /dev/null
+++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "C library for the MaxMind DB file format"
+DESCRIPTION = "The libmaxminddb library provides a C library for reading MaxMind DB files, \
+ncluding the GeoIP2 databases from MaxMind. This is a custom binary \
+format designed to facilitate fast lookups of IP addresses while allowing \
+for great flexibility in the type of data associated with an address."
+
+HOMEPAGE = "https://github.com/maxmind/libmaxminddb"
+SECTION = "libs"
+LICENSE = " Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+"
+SRC_URI = "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz \
+"
+SRC_URI[sha256sum] = "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439"
+
+inherit autotools-brokensep
+
-- 
2.17.1

