Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.46])
 by mx.groups.io with SMTP id smtpd.web08.12136.1612989744322942124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ahkreRCn;
 spf=pass (domain: windriver.com, ip: 40.107.70.46, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZATHTc90lwJBMJZ25cFBIHS/JarNgrKgLeW0qxaI9JFBJSiZaviwl5zTG3Qgs1LQ15DXdBtsy0RG15R3Wxf9S26wyux2ahepzE5Lbm4ZGTHjZXFP9907voWfVpsTfQQeBL4L0flfeG1uOdUCcZRm4LhZCfMvx5qQ1jqg12zZhXQpDrjOsR3lbl8jXCokjJbTIfOEHHij0uYAC5mAFZbwX8jpIOmoeXmXO7+AD/PgWLOXg7h9GUYbQQn6at7+n8cWq1RyZyYkMrkOPl5m2GbJxQ94wwzxs0C4qAS4h6iUgCvGVJHRCw9YsyZ9a1E1MOUzNUQQRp3xfQoS5K1yGXXVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHwZxiFHwJMg+DhCOGGB6WlALLvx2jx+580jiu1BGps=;
 b=lcvAAeaEKK2RJOJShybtoIRvYp65xcdqnxyBaJYG0CIkF+/Cc0npQjeX/1fm/iL21b/d8wsfZxxi6r7ZzXoq8bdsVqHRKJXF0XLMeCbOLgFcPKd0P3zffu/LZsxXV3YLrAbfK4ECUd3L+TfHv3zqks4RwGaAWEKX8WbMBokSEoZ2Zd64VY4IqoATrZpjD7ILVs1DgXjvVT6Wlbcl0yEtDIXxpGSFlkwrUTdf3cRAQjdNF+wPlRoJF8ZA0SjlmXXIapL1onTIBO+yrB6Rx+ISUdU3E9AJO91MwLWn7pvCLjffo98SFkD+ymrmrguGoQMpQRwst30bxOI80rO5OPHZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHwZxiFHwJMg+DhCOGGB6WlALLvx2jx+580jiu1BGps=;
 b=ahkreRCnyAvS9/sYIKIi0hthy7BP2o0hwofDD4a4u80YbE98j8qffMat+mmuDj7WG7bSO+OlHi1BiAPwtYv2LY3Xord0Tfs5mZpddbbHmEurf7AiMYtEPumtKqVNDoNeYt6NPkZxwyCeJ4sIuQeojmZ3rRlvKB6ezySTTrhoxYE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 20:42:22 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 20:42:22 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-OE][PATCH] rsyslog: upgrade 8.2006.0->8.2012.0
Date: Wed, 10 Feb 2021 15:42:01 -0500
Message-ID: <20210210204201.8468-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Wed, 10 Feb 2021 20:42:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 925f27b1-d13a-41e1-a333-08d8ce045da9
X-MS-TrafficTypeDiagnostic: SA2PR11MB4969:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB49698838333726D8E88D0EEF808D9@SA2PR11MB4969.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bELSjmu0i5Gx7AKGpREJH8OuUVAnjsSPWWZf35LM98XFvDP8oVU1vhpwIRmteWhRI84UKaGEDx04SIJhP9q+pAw3YTD/XRKmL5BhIo+ngof69LnSlcUJ84cM99cJ8NiSL54eN7jxLdkL4VTqiV0mZxawSZQu7OvUUnVajJd/lbNwvHQcTwq7KRxBvxe13iSiZyziDlj4xu/L49Nw10kTako0ydK/x4U1fSwj+hh5bP7dtteTdoU986naEMtgIl7NWfKhJf0TkXiZ2AChKTSjN2sZzH6qSDhwhuoxW6oSFRmSHOayzTUVdeZEEFUMAMI5vka3FljdRGrP0McePRKmosJ70py/XbNU+D67mH3ZYt5PhAB8I1vYMwKN/H3hYB4CtJ56ZeCIJ4nAXm/PhwEJFvd/m6v04avenEwSLI3X2wBYjq+f/20z6KHXBUpYh8f2Nn/rajzPCVZrFZ8OVNRcLi9LUFtHQn0lkpKcd3KbLJKzZpgOhi4LIyTJPlbjDSmrpyGyjb967jbNMwP+P2scjiuGMIMHS01oZna8JCKZFOHtuYNB//YwD+IazI9C+54UUSSJtqYHQeUBuBJ5QbMsE9TY/NWKxmtIIqOi1Bsaw8w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(2906002)(5660300002)(52116002)(478600001)(1076003)(66556008)(66476007)(8936002)(66946007)(86362001)(2616005)(6506007)(6916009)(956004)(16526019)(186003)(6666004)(36756003)(6512007)(6486002)(83380400001)(316002)(26005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9iK6Wi3E5cCYLKakmxIG1Dlxudi4yZGIzb8dc7jSkzvmvpVLRIQmGoewivEx?=
 =?us-ascii?Q?9EKZlZBE657v6KRsils9WN+CTK9HfqijSCFVqJ3qeyUfFruNUB3p6I57gpfJ?=
 =?us-ascii?Q?2dcOr0mO+KJD55kCq3Nnbet5nwpHrZm1NmvphYcR6pMoUylMICNNEEY6C0H7?=
 =?us-ascii?Q?u5Ny5Ck22ypTJ0bs58sftJIMRax7jSpKWSriN4zUQYT/xd1e5ZCmJkUGjOsC?=
 =?us-ascii?Q?Puj848vesHR6yAIFgJySuGGUNTzPltIRRnThyomoMWPfnnDqNxr1hGULDPjw?=
 =?us-ascii?Q?TpPOmsFVw9Iji0IrwklreDB99vYAhelUssoli9SEbJD2gXiSoFQW3v41cRZT?=
 =?us-ascii?Q?GcFdCWD4oy6I1FJExCknrVN/0LH0VHwT5ypYzKlR6Z2jZmqEWe2PRGq04H8a?=
 =?us-ascii?Q?c79MN3oAmhzYO/L7ecbpmMWTjax3jnEAbm5sDQ0Fm4gWcpaQgsbWaIktrFss?=
 =?us-ascii?Q?YcMRt5AI51eO9KMQh1q/yiQqtUpfZTeqgcnCm6o76MLz+NvTH4O6fNdj2Dlz?=
 =?us-ascii?Q?T8sHaufskDi7Roq4eh0aiVVOdv/FVYQpf5ZBj21iYqHEO0lyMTfpzLkL3gYI?=
 =?us-ascii?Q?6b2qWAUz/2BswsgsEazuGnZaR3mH9dkXaY4e6LgAEgHW5Bqbhs00bnCwG9YW?=
 =?us-ascii?Q?y/SFeX86V+H1so1E1pAaUYUNj2cUrFR48XiRC82JyUPFu64GjycnYsmySHdQ?=
 =?us-ascii?Q?UJRM2unz31i3bBWTUsmg7e1ab9RPNQTghfmTrlyKEpJBk2ztY5VzMHwqHfRq?=
 =?us-ascii?Q?gCN2fbWMbSpihWXOa5vk5k7Ir59vElQDUOO1OHsQ1XgnkQDGCpwI5S2e6n6E?=
 =?us-ascii?Q?bkSoPxcTEfFh67AXdpTz6xjTX4AbGVC8bQu3Sn4x7F39HlliaXPE/3qmlQbK?=
 =?us-ascii?Q?PW6JSJd9CeduFLJ7slME9o6wZpo5QoUWIOyQCprQX5FBPxoXbCIWBQ8/MBfU?=
 =?us-ascii?Q?0nNyAG+ZreVEyLLYEfG7B2tsUmfPCBthGKhjfN0/5P1QFK6oJuf+HTmCrCZk?=
 =?us-ascii?Q?5sM2Dzw9ySb6fcGItRFyscg+kkQj/CO0I+muUGdm/gQZQPou72Wuh4MHkNPl?=
 =?us-ascii?Q?Tp13f1DKF8dYCssDNUuEa+achTSMEi9eGjupszgx/1b2kxAQyJWyBNiTWPFo?=
 =?us-ascii?Q?6EKeRxrPeFsU8gpROda6hIWR/pCYQ0w1zVXOyMD68zFwC0A1lWr/LoxTdGDP?=
 =?us-ascii?Q?xLu5KO0JwoQsoZdQaNugOpmFgh5ujYDj/fX8HcBe0tMtW2U+lma6g/I3vxIi?=
 =?us-ascii?Q?WtZN4XWjskCYby+iH2mhl3BRWlV3vJY3V1Er1J22LvV4YNH0afQdKwzZfL0Z?=
 =?us-ascii?Q?pugIXGfx90eYTpyQ0gVR7I90?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925f27b1-d13a-41e1-a333-08d8ce045da9
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 20:42:22.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4ehrAH4Hw+Z3jvuvxWk6LptZIJKNkN4leqfmZeSmHm3YThZhJpZS/plukEaJwmXzEZLFyjCuUSmA7vhwhyAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Ptest Results: (Timeout 800) (qemux86-64)
       2006 2012
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TOTAL: 411  424
PASS:  361  372
SKIP:  39   41
XFAIL: 0    0
FAIL:  11   11
XPASS: 0    0
ERROR: 0    0

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../rsyslog/{rsyslog_8.2006.0.bb =3D> rsyslog_8.2012.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2006.0.bb =3D> rsyslog_=
8.2012.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
index b6c2a991f..5c6af5dd2 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl =3D " \
     file://0001-Include-sys-time-h.patch \
 "
=20
-SRC_URI[md5sum] =3D "33de768941953ceeca9d1a437b47891b"
-SRC_URI[sha256sum] =3D "d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee95=
3ede6a05878e97"
+SRC_URI[md5sum] =3D "2a64947e3d157c0198609aabd37be42f"
+SRC_URI[sha256sum] =3D "d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605=
a9004d1c587a0e"=20
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.29.2

