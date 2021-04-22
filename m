Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web12.8195.1619067602824544569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pBHi710e;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McumB5LK+CiRSyKT12Ve+hfVc/JIHdueKykoeRrd+2sGjrMJjLMNJF3gX9W45wVmYNtlHtYou4tfxyX9uIHPmWdaBnwSt16nLnQPiiqqjtbRJDx9jmlcsxlBq4zYnJNFelJO52G9dmNzFgmgwOB++xs3DhWWEtgfeDUcbeNRuemd/UkRzHvK1KFRAnzSpeXkjeiImwug0JpjoNLjitGd54qGKOjoai/7fwCDKgVbFXpyC3WnzlguCRVMHBpWK9XsgVjaVgtj9yVq/hh0Dbb82gxTIRFBkHXeCj14wNs30AdcRpTHxCQUY/S+pjsx4T5ibJvnvh/UpwSXqp8nbZEgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CB7AxYiT9rMtCZUD6JR8UKsSiw4srpcaAXYPrY7BQw=;
 b=c8w2rDaD70JO20cejJ073rFYRutGVbqA974Ru6JRX1ROVj+3C/Frfs6YZBJkJkxcFghb9Vc+FdHGMi0f1wMsg52pauv4DZK4A0YlpKPnyA4eZT/qvzU1fybgp6wWJLDE9YF5xy+k4nhZDdpoxyXI/ohfBVqDyNJLEPmKx6eoy/kj4zn7rblDuGFUGKVujChVdvTNYmzAOfMzFX/jpQ8w3SElpHgHHH+Yo2sIunA52Rjr0NjVkjmTLy9y81CuUoBeBmZ+I77lzjl9egUK7ky162zY8216XTD5zi3zdSZvrBnAz9k01RjKIP2oDpHGD7s/6N+d11Cvm4p/jqy49KA8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CB7AxYiT9rMtCZUD6JR8UKsSiw4srpcaAXYPrY7BQw=;
 b=pBHi710e1xQOnPvjaRRnTho5UF94G/o4VsjuyfmXaNGEKDipu2ZwVq2dRW4CgwPtpOCFZr7qcYXlEAb1OS1m+ENSkVMIPImvemzAd8PCuMtydEf/zTO4c3WTDKa6BIlYy3hL0zD7erGsm7JUU6vDqsdCAS/rrIuDnl6DL86xhgQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Thu, 22 Apr
 2021 04:59:58 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 04:59:58 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-django: upgrade to 2.2.20
Date: Thu, 22 Apr 2021 12:59:41 +0800
Message-Id: <20210422045941.2319-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:202::34) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0302CA0024.apcprd03.prod.outlook.com (2603:1096:202::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.17 via Frontend Transport; Thu, 22 Apr 2021 04:59:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eab4f276-9365-4223-519e-08d9054b79f6
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44187E6F0EF647C0E88BC0EBED469@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pBRIHA4zHV70BLjMd4bchKiVCBYAHErdJ4GnH1DGUIayJo68FOeAgMI7aB34xv5j45Emi+9Yz76EKHW1zWMI78dDLfTbUrVGvHnYrFHuVMtVCtCFFyOk6E5HM/JHw8lgyGcspILLKsHxTD1qv4xT7CqBcmDPvEVyJ3BVhaDtdf9JXwX58LzLSAsNXLIkpnKs0UD5URjlrNY7EWrj+4+NOK0siN8IxmeleTe5zI5Ym8/9UiMqJkBRA1+OWpqshzd52uEYPzJ8Af5lwEn+tbpeMfAGegzHnzJDL5bIslHmZmwMNJCbAzLA3UNfLuqnhhbmqiM008aQfL2qA6OX0clbHpM0cpDxI6wrgJuQVvhDNOfueALQo/UiQWl+5H0mOmhG1Yy+7VHBX0ApRaZS6kID4BrDYn3OVrEzdSPU9dzYaRG/kKa8097HpawjGgZN6a/lMfcxqfhunS+nKZroVAh0OetDCVDan0/spxZEBWEo0OCEq8OSOodfja9KbyNJ2k9COdIeMhnptSkN3As2sG4Ctr0fgYiiLwnGdot63v4ZlhKWw8AgdAzd2aUZopYocK4P++SvV+nrsGnSvzX5NbML6lxvKY5fbUbmVXz5HhZ+VygpPF9a5y8OtRut7UZKfzu3Fw4Rdq6aJZULjqlJuwREBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(366004)(316002)(83380400001)(86362001)(2906002)(6506007)(36756003)(66556008)(16526019)(956004)(8676002)(26005)(6486002)(2616005)(1076003)(66476007)(38100700002)(8936002)(66946007)(6512007)(52116002)(478600001)(5660300002)(6666004)(186003)(38350700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GDaV2p0zse1TenBXJvZYwPzOh4toQ7Fj6b8aanGI0ORFT9OTlsDD/KUzIBXx?=
 =?us-ascii?Q?kX8dcfIisWszuKY0cwYzxQAvSbnEdypO/52blBxpYK07TsaBk1rklagx1i+1?=
 =?us-ascii?Q?86C+VMQ+vrczb4Bs+aqg5p2yUFcrXQYfVPP7tob02pqYbGaPd2+wnRqmoFfM?=
 =?us-ascii?Q?37ctd2K0QhRRthGZr/fa5dxhIQypudeJzyDtdMIq6sqYShldfRC5tD1921Xl?=
 =?us-ascii?Q?ba26Udf+ztZD+3OIWHcE4uHbkYu8OzFv5D2DCulvpmWJxTU8IM+mP6NrdII7?=
 =?us-ascii?Q?pIP8p/KM3jhw1vowFBkARHM3E3sBJHwi9fU1ogXjneaTr0y7ekajcCIJ10BF?=
 =?us-ascii?Q?MZSos9Ud+eSx8IAi95ZwPsrtAwC0haT1Fc8kfer8nfhlfkqZZyR0s4r3Lra4?=
 =?us-ascii?Q?iDKanuoy0er931dtmURUdA96zK3Pvu9VuiItn6cQ32uS7NytUfYS4/O3/YPz?=
 =?us-ascii?Q?IQaBCH/mHCaRO9OPCcpd8OUzkS4ly+CyzMu5UN9lmPU0Nl31a22Tp5QVcm/p?=
 =?us-ascii?Q?CzKbz6BSL90ESy/Qlk61QW9+6elX4xj48sgApwlv/XWUbmCNpvk2TCkzDYze?=
 =?us-ascii?Q?u7Kmw7G5wzmCWPThLSSlxvMwUNLaF//zJq3LEn0990tH14G7zAuWJ+oZ8pQr?=
 =?us-ascii?Q?32F9TP5ssJg7tUDpo3HoJiTDyYBPC5UQcp1c8RnqcqnhgAN2O9hY3Ah0G6T3?=
 =?us-ascii?Q?J5yWfxFE4WWeGsXLMw/uufev1HP0TVzOWV8gskGAiNpocPOv+QDNiIFDApYh?=
 =?us-ascii?Q?UQZAbPsMlc3nYijw8lvBqqvO/F5ExN+nsHRb8Uhcqp0Fv52F2Rq4kUiPJYJw?=
 =?us-ascii?Q?ByHAX3a64DFJLKGuU6487J0dPCZ4Y8Bvlhrij0OMc1PRV2QljOSEgbMBma7A?=
 =?us-ascii?Q?8xRgGhQNVlNXwDuplTySgLTpOmy+j7C8deUf5X+2LZCznpcTdLbf62KRZZT4?=
 =?us-ascii?Q?C7TILvq/n3hvhVa8ariMecSn0AEicoktNFBqINcz4y+R86JEcgUZlRyNyrs9?=
 =?us-ascii?Q?z52Ca1+KbCI7cf7+hjeKJtf8XYYOIK8jFeIlWzG7DFZgR2+WIby36jROFnDY?=
 =?us-ascii?Q?hTSoA72jmFrtXRQ93pdPhNwzHAQhqjRRSvI+2D7S7j76C+jbBmuCi9UE+J/y?=
 =?us-ascii?Q?KpUbB8hgYQvInnfgn6dSLSzdmvndeMVdxPMLNUkRUSa9tR8yANZiOhNmA3Um?=
 =?us-ascii?Q?Namwj3YH8TCgKiUNHCeAYMo0CJchd+USdC15aenOFbh+U3gQ5exByOCWSvvo?=
 =?us-ascii?Q?7zvak/lydc1hGjjpfRjaHSv9Eb2vK3EXSQc9WJv6ZP0uzvuYrfU1l7IUyBrY?=
 =?us-ascii?Q?sMRoUv4wpX5Z9l7Z/Ho/H6/7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab4f276-9365-4223-519e-08d9054b79f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 04:59:57.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LIBczwCzd6gUL3P4k6yI2GWJIARVsCDuF/c18TZZeZOk5S8JnvL9qxmAZjdVAjFUX6Y5bTg8GobmLIR11NvyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: text/plain

2.2.x is LTS, so upgrade to latest release 2.2.20.
This upgrade fixes several CVEs such as CVE-2021-3281.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.16.bb     | 9 ---------
 .../recipes-devtools/python/python3-django_2.2.20.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.20.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
deleted file mode 100644
index 0715abbd4..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "93faf5bbd54a19ea49f4932a813b9758"
-SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2786594"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
new file mode 100644
index 000000000..905d022a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "947060d96ccc0a05e8049d839e541b25"
+SRC_URI[sha256sum] = "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0fd590ed7336a64"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.17.1

