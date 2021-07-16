Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.126.1626466643863783911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 13:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eHYOKD4I;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28317ba079=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GKHNGT026573
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:17:23 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw2q8sy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2XlJA82YrQA/TtDz+SxinLDZcmlAOVclNfzHdp0xBKAjdNHbNIXSGfe2Kb9WKLaUrAH3Z33gWCQVfY2Dgxztx4tNwKoZbmAmUCnAW474PUlJIh3uxhU580sRpfEbkNxT2c6hSCQVsbHX7s04irqAy5BJ7UNTcLQ1eluQNFo/AKPRPSAQYNHbAzeJSGtgSFe7e3Thh3Zk0AJcVtEXKSne2QUpRyyX7rpNO3vOjh6RMIGZqt6GZ4qlMs2xCY0WYWI8OYvB9it+h/L+yId/szG7d3LbRqvUCQnv/XEseWiL4LVXydeo+vZmd0dBy1heqJkbYUvA6bWwc1mY2ff+j+4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJOt3MThvnTwpsktSGzKKLnBOC29tbI3lWGCGH295mw=;
 b=XgcKPAgK1ByuLZ/8wrunCtU5Xu/kloEoIZlrGeyXbonaqFOx61Vz7izOHSmWKzZSw1UU0BhCgROiup2rXgckt6v1jZ/uCwt18U4e+AxPl9pluOkoJpo6yyq7p2E4EWnnnYDpkwjnbsoWW/e2eeyJX2pXdZusFSBVetJBoCGf4mZYegMz6M5+ncO+q10hX+7THrExDyoNVK9YVK0C4/Hm9glM/HRzVD7yezYRcC+/mSLgqWZpN1/F4u4o2D6wfrTWRkcfAbuSUMnvSN3QtZntWmvAPkL7iSscrViRpQg1gLcHpXmdsoSmcNUYiCx9uXx0V06NKWH4plGNJYZFHZUiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJOt3MThvnTwpsktSGzKKLnBOC29tbI3lWGCGH295mw=;
 b=eHYOKD4ImzbG43JJiHpJVkBDnuc7RBNwJ5oTUcTkPpyF4czGgDDQLeobrC6pysAyHDDh0X7R1geQ4AK0aYGL7hFxbmR53RsugxpYASSJ/J1RwOfd82ph/GnGHc9hCsZke/4atM++Txdv+ytOTgqc1zm8lC7IcztZNOmrPbDQmX0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2583.namprd11.prod.outlook.com (2603:10b6:a02:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Fri, 16 Jul
 2021 20:03:13 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 20:03:13 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [hardknott][meta-python][PATCH 1/1] python3-django: upgrade 3.2.4 -> 3.2.5 (fix CVE-2021-35042)
Date: Fri, 16 Jul 2021 13:02:57 -0700
Message-Id: <20210716200257.186804-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR08CA0052.namprd08.prod.outlook.com (2603:10b6:a03:117::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 20:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf27c7f7-bfc2-40a4-4d61-08d94894bded
X-MS-TrafficTypeDiagnostic: BYAPR11MB2583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25837CDAB07C0DA86C237C5B88119@BYAPR11MB2583.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Qs14/B1d7FC7Ytaa4w4H8hRULZSucRnQwN6FU4YE6fd7oLDkMbWmPGpiluXdK6Ko6AjVg97z5RNR1app38cKGPyPCwfA3oYhFdHV69qrhwIr1l2Xnn0ohXw6TBJtVbcoG+6rRJJPIhMxJDnWF+m6+8UxFrDR957Upuv1UzRKP+FaBeLlBTY2EIQz3UmyvalvYUrY41ahrNwzspOz960rT/xBBFIgpxxfLru94rmd8TxWXxNk1ZxTjGKJ3hLp6G0ctvhyiGDKQsv/XlYsPF/0mkaxxAeVOWQ0lYRIFjcGFwAmPnU9ocoZ7b3QSgasvfA3GBLaoy7HqB1nkdBQoWe1gzT4cGKrF6azXlibty+YoHnJcVPurUbyzoRL3YQo4Cf4oAHhvYBCY/5BzN/iaE3tVgjnJxP6btTFHPnEyCoPVQ0N6/e23z8Jlb5OjNxJskcE28rTQIhqpeeVf3TXCUIV9XZVeQS1bYt9UhAR0iHNUFH2viTwiz96WnMv5k+JUofLY+vo0tqeX08AAEi6VdMZjkQGI/IXbyMCRMNlVAoq68+ibtPL7Ag9eWojNFNpr6P/j7d6mNdRI1IXBUV0cRh4llOyR4Tml9Yt5HRRKAT6wNZbOyY3vOQJ/9yStQQcQHmv1tq66tQVDez8ZkcdeJAiF8wTsz6+jlpxVY4iqa1nAn6uQtn9mk2k+A18XoJw9W5HBJf7MkC6aJcs8pp8xsD9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(6916009)(6506007)(2616005)(2906002)(316002)(1076003)(6666004)(52116002)(8676002)(4326008)(6512007)(6486002)(186003)(26005)(66556008)(508600001)(956004)(66476007)(66946007)(44832011)(8936002)(83380400001)(38100700002)(36756003)(5660300002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2tBanNOTFdlSjNsdklHTmU2RFV1bnhacm56S3lQbVM4RUx6NVdiTkZmUnly?=
 =?utf-8?B?bW4vaU5pTFNmalcrNERmMzBQUVZZdnlpaHNTcjA5OEZEV1FLL0kvSHRVY3JQ?=
 =?utf-8?B?UEFzN05zSnNYVzZ6QWZNc2pvRFlrSURJem11NzhwRWZlaitQb01tMXVzbklY?=
 =?utf-8?B?eGpMK1FvaExHQW14ZFMwSFRVUTZZRURXY1plbFcwS0RBbDl6bG0zRnVvT1Ro?=
 =?utf-8?B?Q29hZTRoVXhOeEpEZVc1c3pzK0dTaTJPUFpTK1doV1JuU0VUQThoL09BSk9Z?=
 =?utf-8?B?cmhxQlhXb0doUktPYk1tL2trSG05T1BNZEZPMmZaQVp4aG15UmxrTXRZVU41?=
 =?utf-8?B?WnMvSlRqbU5BSVZrUEJBdFZCai94WldudlU5bVBtNGdTb00xcGsvQ25TbC9v?=
 =?utf-8?B?OWI3MVFraWhjdHVrNjkyZE45aE1YTzJxdDh4OWdKeFhPNURRUThvNUwxQjhK?=
 =?utf-8?B?Ti8vTUJ2YlhGVjAwSG9kaDJtSzhKc1l0SUxZM2k4aENMcENDekFqS3J5Vkk0?=
 =?utf-8?B?WE5saHJVYkRFemVCQVNYMkQzS3JVbDhjYnRNSmJ2YTdLdlFjNGhOS3g5SElG?=
 =?utf-8?B?MWNlTkdBUHJrem8xb0wzWTRPMUFwOFJuZk8wTVpKSDNWd0thb0hFRytPeVp2?=
 =?utf-8?B?c0d1VEFOSjF4RUJjckVhblVNUWNmUXcvemtBSUhsbGJMRkVtVnpqT3JqMHJV?=
 =?utf-8?B?cUlnRVl1OHNySEp3b0pXV2NUWlpKVExjZEtqR1l1d0xmUTNMVk9Wd1ZObVBH?=
 =?utf-8?B?ejVTZzJtY09YeHFXVDN0M1g0NHlSODY4SjREQmdFMHRtMEY0UzhERDl5eU44?=
 =?utf-8?B?RVdpeDY4c0FLS2luWlBTRUxCVGxpZXBxN0FYTGpySXRvK1M0RWpBYUtVMytR?=
 =?utf-8?B?Vld5MjFlcGsvSHgrcnI2Qk9HbTN6R0pCL0pab28vRHgrcDB0aENpb2NwUzV1?=
 =?utf-8?B?T09LK0pRdFd1ZzAyamZ2STduWTJXSFRqRlFveUlEVzl4OWp5ditTZEdqWTJU?=
 =?utf-8?B?U3UybmRxRjZnT294QU1NSXQrNEtMTXFjVjdXQk1rSXZMb2dRY25SQUhIdzJR?=
 =?utf-8?B?QzNnTnhYOTZpallWbitYSU81ck5WaFp4VGc0OUI1SW1NUys2WHZGQlZVYWlQ?=
 =?utf-8?B?TUJZcDZWVTdHcTlDS1BwR1FyNXhrbnZKb2liN25TMy91c1V0Q094TUR2enVQ?=
 =?utf-8?B?aFBPT2ZWbjdBNExaQ2thSkY1c3RKbXIrdUpLTDN2cVY3bXplTTBIZ2hkeXNC?=
 =?utf-8?B?R3VnQ3VyN1RoeERwU3h6Sk51N1pLQ3N5TFp4ZURaMTZhOExoNkdWQk5GWGZ2?=
 =?utf-8?B?ZkEvRDFuNXVNcllGREZVZ29rbjkzK245OE1lRkhIQzlqSUR2ZjJjbzNIQVlw?=
 =?utf-8?B?cjBRNTRNUGJYUm9TNFl0OWZ3d21QMzV2dm9vSmNTZkpXN2c3THh4b3gvZEFD?=
 =?utf-8?B?Y0FsemdaYkhBZjZ5WUdsaTFqRC9aNTVFTGJMTmNtWWx2VmFiWnM3U1psSjVm?=
 =?utf-8?B?RTJGbmJTUkM2QTQvRlFxWUlRWTZkczZ6M3NzN3NtWCtOdlZrZEVoU1FpNFBK?=
 =?utf-8?B?K1QvR1lwcWlJVjVUVlJJM1hqNDEvMkRacHB0bCtlLzM0VVBjSXd1eHk0K3Iv?=
 =?utf-8?B?Tm9FNDBLa2F3NGswQitLTDMrSlFQQlZYSnJ5cXZOcjZaVkdhNzhndFBLZWlX?=
 =?utf-8?B?WEEyTUdMY3VTWkpPSmtySFlwam50ZHQzMSsxWE81QjNpUFBNZm9CVUpTeEMy?=
 =?utf-8?Q?KSAJWd9QZfKexIOIXKSKaDXQ5HE2VRC7NfmTQKK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf27c7f7-bfc2-40a4-4d61-08d94894bded
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 20:03:13.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzxaYw9OHh/Osc8QizFpmvxOTbNKLcbIVRoXU2Te8JLON0v2H0JP2O2odkgQvwjTgtZKiGnD+aJH988kIOMQ6+uSEWetdzKX8zw6ajnNX1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2583
X-Proofpoint-ORIG-GUID: XU82xZoUoJ31rlvfJc7YvcMBqH_xb_l6
X-Proofpoint-GUID: XU82xZoUoJ31rlvfJc7YvcMBqH_xb_l6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_09:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160127
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16GKHNGT026573
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Trevor Gamblin <trevor.gamblin@windriver.com>

3.2.5 fixes CVE-2021-35042: Potential SQL injection via unsanitized
QuerySet.order_by() input.

Additional release notes:

- Fixed a regression in Django 3.2 that caused a crash of
  QuerySet.values_list(=E2=80=A6, named=3DTrue) after prefetch_related() =
(#32812).
- Fixed a bug in Django 3.2 that caused a migration crash on MySQL 8.0.13=
+
  when altering BinaryField, JSONField, or TextField to non-nullable
  (#32503).
- Fixed a regression in Django 3.2 that caused a migration crash on MySQL
  8.0.13+ when adding nullable BinaryField, JSONField, or TextField with =
a
  default value (#32832).
- Fixed a bug in Django 3.2 where a system check would crash on a model
  with an invalid app_label (#32863).

There is no corresponding uprev for the 2.x LTS branch since it is
already at the latest version (2.2.24).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

(cherry picked from commit fe50bd100548500842667210df9757d84ec11b16)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/{python3-django_3.2.4.bb =3D> python3-django_3.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.4.bb =3D>=
 python3-django_3.2.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb =
b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.5.bb
index 52504885e..5890c8541 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D "66c9d8db8cc6fe938a28b7887c1596e42d522e2761856251=
7cc8929eb7e7f296"
+SRC_URI[sha256sum] =3D "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841=
dda35019c01855cd"
=20
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-sqlparse \
--=20
2.31.1

