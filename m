Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.49])
 by mx.groups.io with SMTP id smtpd.web11.42824.1606166796398941118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 13:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VTJnOwhO;
 spf=pass (domain: windriver.com, ip: 40.107.237.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvRhjxxJAVJHmgEd0eN896N+heuThMuB5hCf09mytujwFCF+zW8XeSfSFQeavIkbIGhGwb5SCwwmpSZJdP78QRCiUcwGqwqOmwZickQ0nQ7e3JDivL/9DEC/50wvO6q6bGjMopl4lV/QWgG9GbedHDjjVMt4JOixPqEsUbYfqdIgbxet+15blMWvAyrjmce/3SewvM41sMrOXlOZlqmiHIWca80LnAvHW99o+OpCk7+8fIrZpO+cTpDPS6iebaNLB44sd6sfxcanRJkoarUzN5AwWuGsBlko6BgEFRmvDEWlaj26O722/mJIvNckiTGVshHr54mEoTSqvAhAg76zJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMSHXxdPaIywPlhKPInSkUUWVYbyazM3lnexkh/qUlw=;
 b=nKcz3UEJ5N9luaqg3/KiZrJQniBbmUpnNU+MA7uqtufpoFyBoj4ht4SXpdjp8FPBBCTrniecRYVXg59fcZgoEEsxz8q9ObEGyIMF5yardeEofz/Vq2DGWeMoM+bXtFVyQ5x2i1DtCJxQXBMIACoySGldgk7NWqvB7dcHm0hJv20KEJVEk7ydCPd7c6VuWYqUmcGvuRIGA8x/c9ozSXesamAmU/V/GzoIoiN9XYxeFL/hPuOxiK6pso5txquG8qANNja4sCytEfRXPiM6fAM6g7aE3HAZSbtiOqPwK/24qI/qwBRaLLfUUcqnruV3JhkqAVsQOH/L23yGqxQ59kCyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMSHXxdPaIywPlhKPInSkUUWVYbyazM3lnexkh/qUlw=;
 b=VTJnOwhONAjUhIKSpAO6qjmapXshjw/JevBll4yohG0fd4Fw9RpBmqI2PLrQNXvuX35pkBmWjzd+0Dnh+c22MjQmBgWeDEur88xuQ9d/EAYmk6Cct6r6ui9KsreVTvOKak813HVhrT6E9h9d9coG4CIHu4fQNa9pMA02FKqpQKc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 21:26:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 21:26:34 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com
Subject: [meta-python][PATCH] python3-jinja2: Fix ptest RDEPENDS and file installation
Date: Mon, 23 Nov 2020 16:26:21 -0500
Message-ID: <20201123212621.2621358-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 21:26:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b551f44-2bdf-4806-c543-08d88ff673b5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB505384AFEE27279B2371B5349FFC0@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FlFHnKRxXCWQCMRnGs9XwcXgm24skb3rUqkD5+hlTuXj1ibz0LJIZ8tUMMcM3W0rYtwVANefjEZ+BId7T/XA1ZhnmEg6CVvfOs2tl7MduXbU1W2wL6/X9QOyIevZoJ7PZMvPKlzWXXf8c6hUlcWQI8i79V7I4TCOUwOlSgeXwpi01skWdt3bYPG6f4RccBk6M59i7TCXbHrWYOwlaLstj86wzL0zEJCKtkUFObUXt8mZsY4D6WZk/hFEIBGO4/bebmOXnnU4hP/7hepuNt7v02BBpQ/+Q3VrDa3DNCGd3g7qFfrQSJLA19gAz/++2cJEaRXawUv8HU1cag1nTI5iww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(26005)(316002)(186003)(8936002)(36756003)(6666004)(6486002)(66946007)(2616005)(956004)(44832011)(66556008)(66476007)(6512007)(52116002)(2906002)(83380400001)(6916009)(8676002)(4326008)(86362001)(6506007)(1076003)(5660300002)(16526019)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ywe/z+/iLkDox2Uj5WXciGVUO3wtD0axKsxXx4IlfKl0cMsLdm0W88aMlr24/WZnoHBvpMUClCPr5ZT7bas3gUrZ4vqQq9Twm3zHnEidYpOK+p/5leLS9VenoLIlSFCFzZi8ysJ/csYxcz58J70NExVzzUVGJd7Fu5POLyoi9UpccFS4Za4Zwi3dr7If/eKRKpC1+yVot/hYVpkM4YZvP53NHN5X2cKq3tUvdv6qjxT4cPj5m9bYZzCb3Cf8vuKxqZo597xRGNoJhiZ65/3mHXyGT7JvfJlPFlJg24pghYid8iQQiXhvJzZ/upOgNGJIGRgQPb5fXmR6okGbysy2Nw0mcidqovdoN6C9mC6c+g53HNvZ2XSJEkVOyomkkHe5mhA3qDhWWixt1hyeOPhE+2GGbaKC9q8rCURdUYGtjPrReUw0jbTzB+otx5JHqdOsRaE9YB4eKZ5D3yEQB/zFNfStTzQnLkPAxuEQR4cotbxYFB8kkMzC8M5C9ucAi5nhTwKiJNf+pdnpT5c5DALuKLYqv3qht7j0fDAKSJ3m+pp/XNP0X4Y5qX+MV9/eI+Kf5bKivScHgoNjzgApbEiRH6EY9aW+4hv+pqqd/0MYDUb5OhUZcYBPWUJlMxM28MB0PGxnQNzmd6Laze6TKEX2XqxQxl4ZxmIOIoZGdA0Kf7rR8B2ccENayKyKeJ0EW0MlKyXwnUXin55r1gyn+ZKgJXDChCdMISMch8vAEom8xBA4GVxtevp5fhSxg7wXhYjQjMm6hpq5sviSM8BsXbHZlew9ZbTFNBBUf7mzbrG+NohDiiE5iv8+xWrHz7gnmAczoCazS25eN0D+5FlG6WfvrM73AaC1a2RN5LWKnkpXPkLf3FtEBLL/lB5/g6k6+DzgVJtWk7zFp31T1d9O2ZoZHw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b551f44-2bdf-4806-c543-08d88ff673b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 21:26:34.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9eGIBmbaRJO7rkgbRfB5e1U8/Y00xtU0FXM0vZW8mnX+hE+o3WmjDylbn4qM1lcqkrXlUDFnPFcy8VGrxo3ZOX6oX3z1E23oPs0bdKWcvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

jinja2's ptest is failing when running meta-python-ptest-image. This is
happening for two reasons:

1) python3-jinja2 is in oe-core, but the ptests are disabled.
2) python3-toml is required for the ptest;

Because of #1, do_install_ptest doesn't actually run and so no tests are
installed for ptest-runner to use. This patch adds do_install_ptest to the
bbappend file for jinja2, and also adds python3-toml to the ptest RDEPENDS =
so
that it will install the tests and run correctly.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-jinja2_2.%.bbappend                | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappen=
d b/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
index 91814e6cd..9fe358427 100644
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
@@ -1,2 +1,13 @@
 # Main recipe was moved to oe-core, but with ptest disabled
 inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN}-ptest +=3D " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-toml \
+    ${PYTHON_PN}-unixadmin \
+"
--=20
2.26.2

