Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6200.1626267270228153481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WmjVfYH4;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=282975f18b=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16ECruNa030720
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 12:54:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 39svxmg4pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 12:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCXSJI1dhMe/rW7wQt8AOgyuHnpSWsqr1l6ltSyniAG2Y8IaNutokGJ9pvvQW8bD/8wzh4Aqu0ZUAjvLLhGnHcp+qpuAAUh/z/4QNoC95GXc6HSNGDbjKdcYa3swmeCqMCFb//kUyakpDt+8jehAlFnIhTrDZtpnxqJGMeTKjTJ6eyuWv+cgvpMUJWH6n3442KFMqZ/yqJiEkN80GUsQNpSq61BPLniy2wdwESanOqaiqFX0zH/rbr6ILEArcOR1wgNz5ZJ3B0lEuQ/KvFXfy1dTpc0SkrU4Lx8cDrsyD+RxissAg9aH4dfRsJL3Qg8AH+PscgKAtmyZDnsBqRHlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad+DFNkRqMRqeN5HgNCvlfRpfwBwWRjQLiFJHxIHIck=;
 b=gmQ+TTsm4Ao/3yE4y9YeXLunfeTKDzSxWE+Cm58LAotM37M5mGoWYl8uyYABK7YBC+ZdNr/QMJC/u4W3a/s+mz2wa0FRj9aBGIJls48vc4MabCUKC9coeHZHlbGYS9axWbNgw7ZKqfhDYxBtRywbCZlSb/LZNUjkAL2OLR25748LN0pmqfMT4Ms4trnx0PPtHSkSOotLTG6r61CFiA5UbqT+qBvZlxxgjxW7BmZdEC9OuMw65ZncjblQtkfPcPWU08j/sAnLNJVlEC1nTkStJHnrSA6g0ezlFIx9aDH4lHCq2EwB9lx5lOTBPCKCSffM8TAMgWLCXFBFF/xQ5I4VhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad+DFNkRqMRqeN5HgNCvlfRpfwBwWRjQLiFJHxIHIck=;
 b=WmjVfYH43PUVWNavakkmAOgE1Xse4pS7Hvhxrdw/5CeztujXNhcNpHe5Mh2rzUEjRiSuiP7s3UItINkVPrPO26MwaABvWAoqFrTWBnz5CChozYE9BPDzD4bKzTt4kW75wS+lo0VlvksVS6l1gNT1BHIMW8IF1RmzXCI6RMbgDmM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Wed, 14 Jul
 2021 12:54:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.022; Wed, 14 Jul 2021
 12:54:27 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-django: upgrade 3.2.4 -> 3.2.5
Date: Wed, 14 Jul 2021 08:54:16 -0400
Message-Id: <20210714125416.313707-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: MN2PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:208:e8::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by MN2PR20CA0034.namprd20.prod.outlook.com (2603:10b6:208:e8::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 12:54:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6e7528a-1d9d-4f28-40a8-08d946c68391
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4911:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB491145768F682C8196F6930D9F139@SJ0PR11MB4911.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TJo+EUF9iy1B688HWAr5fXiKDlwVX0IfKWlwiUxVjbxFcLqVrYgROCxKvEI0pNbJ2OBzdRVJG1Zo/9BB2MUx0vJU9oFRSynbQAhc4K4HmuYvo9lY6bXq2h2PUrE7bZLAqSMAuJ9Ykkg/Fk9R2J7BiMmx+OY0rcsH9v/AHqo7f81Ze4uKrrm0x6m8BeQyZ1UIVVCi2BQmj3r6gRALvz0HNspWhmR34GM9H87fr8u4FZWYHbEiA55F7wCbWcRW/NP2t5ZUx85Hyus217bxSIORAVJmovSjo9K0JtQPLpNvIQB2tVXsrkzsEuRDQ90mTeEV2tAevjE4fkXpObBupU2OhRhr7BBy5i9jqCrPLVKmDqPijITehhpf4mhm8E3uuGhoDjVR5tMfDefnC3vup293rLIhsVOjLNNlQfd+uY4RB/zpjvNJ/RhJgis/Hr6GFBcIeBQbk16bcKa1h+uMuFLeaU3fcKNhZXKxdUqhQJCNM4Qs0XClMycDa+v6wenuhhWkyIFfEOHCNaM/jd7hKNbv+bdpuXFm1A4Mj1DIys3hVRQYyZ2vugKWeLuoEm4/YUpln4F2oW0Mb+Q/1tV7fleIpmCDV95qUU2cVt4CLP+B7yLZVdObA6/mcxY9zYVDKH4pct2N92etkQr2qhCvfTfL5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(6486002)(6916009)(83380400001)(86362001)(2906002)(38100700002)(6512007)(1076003)(44832011)(478600001)(6666004)(36756003)(2616005)(6506007)(186003)(52116002)(66946007)(316002)(66476007)(8676002)(8936002)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azg2NjdiTXpHNTFMYWdxVHhVaHlGbjhtRFBMbjFGMjhzb2oxZDFNL2F2bDNm?=
 =?utf-8?B?NU5yWGRKcXBlRmM0a2wyUi9tZ1gyM2hDc3F4anpWNUNBT2RrREFvV1VjbXhy?=
 =?utf-8?B?YkhXMjhYQlk2TWxKd2ZSc1U1MUdoZndLNkMvSEZpd2ZXZEM0VWxGQWNWQ2Ex?=
 =?utf-8?B?dFdVL1R5czN5UnhHVjFnTVdBTVFMQm1OcXNxYWc4QjFObTllRnJDUmI0YVhv?=
 =?utf-8?B?NDRBMmJ0Qjc2eXdxdDVnb0JPdHQ1VTQxT0k4NkZxblhOMHIrS29mUlZhOTZ4?=
 =?utf-8?B?V2VvUXIrQ2EzOHB3RTk3d0RjVFVzNU9ac3YzdnRIclhsRkJnTUt1SWhhYkIz?=
 =?utf-8?B?R0dVRml1VnFVUjNJM0ZINkVOWXFmT2k3UjVES0JzaEdZTnBERm5CZ05qZENQ?=
 =?utf-8?B?b0h0QXBsVTYwUXE5dmdMTzRiREl2cVdxUkpJSVh1NnpmM2s0b093TzVTbGdr?=
 =?utf-8?B?alNTdFlkdzlEaEM2MWJWSXFVYlBaMERDZXI4T2JncjVQTmFUWkxvY1lwRm9U?=
 =?utf-8?B?dG8rMlN3bWRCejB1VEM4STlJeFQyYnZ4Y3pPWnIyYUJFRDU0VWJzRmxYb1lx?=
 =?utf-8?B?b1NuVVNBRExVZVA4TnJuMkkzbHZ0bFJGdFY5WlcrdVZkOHN4VFdMUDRrU1hv?=
 =?utf-8?B?eDQrS1NNeXZ5RzdNckhsSVhESWYzQU9MMEZ6aTZvMDZEc1JCSFJOWmxWUEoz?=
 =?utf-8?B?SGJ6WlJUT2pXNEJsSllsWkJMZVNqeW1NQndTbERnQXdsbXdhOVBJcUFSSStl?=
 =?utf-8?B?S29tRWZGdi81ZjNZTnZFMDhPWXNGNXR6V1NhZFpMSFh5aWZIYzV2dFZIOHJ3?=
 =?utf-8?B?U1U0azgyZ2VWSGMyZ1lmRy8yMFZ5MnRnbnNWNW5lc2VQYnBZajJodFBISkt3?=
 =?utf-8?B?Z21KNXd3SnViQ3o0RWFYaG5HK3FPZ2JGbmRSRk1NRHpkQWxaTWV1eWNFZlpp?=
 =?utf-8?B?TVkwRjFTM1hhUmFDSkFLRkh1WUd6bU4vOFdaUFg2ZmZuVDY4K0t4Y0x3MzlB?=
 =?utf-8?B?djBwak9GUE1idngwRm9GWHFveTlpVU9HRXBOekJKbVc1Mlc5UjlCSzVyek81?=
 =?utf-8?B?cUdnMGNQZnFldjE1MlpTU09FeXA5RStDeDYwTFVSd0daTkk4QlM2NnNIRE02?=
 =?utf-8?B?Wjg0cTF4T1duMUthYkZhL2RncFRjWlJWS2FTQlVBRGsrNFpsSVRDMkFBcU9N?=
 =?utf-8?B?THpNZE1RWmd1K2VVU0t4eEQ0ODNxc0JWeGVQNTJzWkk1Y0xLRk1VbDFhUy8w?=
 =?utf-8?B?ODZpNU9YbnRQeDkybnphaHdyLzRITkhOdkFyNlVZNlhEanY5TVIxQWxzWk84?=
 =?utf-8?B?QVl0SnJKdVdhZG5iejhhYzlZL1Jjb2F6T1ZaN0hISGNyY1AxMTEweWZMSldR?=
 =?utf-8?B?d3hBNWtZQTNwTWhrbzNLdWZ1Si9GbHhiTUtjOHBTL2dxQ252QVpBcEhQK202?=
 =?utf-8?B?RmJyc0F1RmxEMFNwS0xoQktYLzZiaCtCc09Mb1IvM1JCaUcxOFNzM3V2VmdP?=
 =?utf-8?B?SEkxdnRRSzZZZkt1RnhoTC9DZVdmbVFELzJTVUFEbHhwSS9XMXkxZlhoQnRY?=
 =?utf-8?B?aUsycFZjaTFNM3JvYTAzbnVxbm5Bc2lzUXNJMWpxQXFLdmpUWnpCTUhoTEtq?=
 =?utf-8?B?U3EwekFHOVdDMndlSTJHWkt6eXZ6M0hDanFWTERqeFNNKzM3ZDk2WVJqOG4w?=
 =?utf-8?B?NVhzSllwaE40WjZ5Qlc5b1NGa0MzTnZNV2FMeHBrZzZrQVFMYlhQRHpJdE5Q?=
 =?utf-8?B?eU9nbWlSeGtoMEhseWNrREJKRXlmOGozd0l4aWpqaEY1aDF3aDE5aW1hRjF0?=
 =?utf-8?B?bVFRVXpsbEo2VmFjYkxjZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e7528a-1d9d-4f28-40a8-08d946c68391
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 12:54:27.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnuV5/Q1o/J8zJ3w0jcwv/gYBoR8GE1IuSIRTv97Tmluh90K5y7J9vFN8/CJGq5kfSd1l/p0N0bjSjisXkJnErHEY3w/SxReLYChDhWj6WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-Proofpoint-ORIG-GUID: aiIcCU3t162UaFTkEbINfb8e6ugcWdB2
X-Proofpoint-GUID: aiIcCU3t162UaFTkEbINfb8e6ugcWdB2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-14_07:2021-07-14,2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140080
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16ECruNa030720
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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

