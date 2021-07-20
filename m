Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.511.1626803219673803857
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 10:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=QLp/hGhl;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2835133119=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16KGP00p016449
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 10:46:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=TJOt3MThvnTwpsktSGzKKLnBOC29tbI3lWGCGH295mw=;
 b=QLp/hGhlzqc0LXG0RJHIB1wBnqIsob42vuXHpt9pK9fjnTV+FvD7Y/VYtCrZ+xM2BQun
 K/graQktJdgACjlgLFwKQPNwMKr6H7QTSWQNmfBHU1pHpdJnGe3Ht7E4z5e8Ubvx2QIA
 NW3V/o3Kp3ZXYoAi/JyteHET/3i1CO8AKpvk+J2epguaMV+r4rioadQUWtvULEKh/JBi
 HkvIjjCZlldHVii9yhlGXWhg+K9dP8LehTcL0IkolSTNB+c5stc46a8wSEEbclwFvMo1
 E6FK9AKqE1m4e8SrWCbLYZHOYwd/GNfCpGge96Qh9HRwHU9SJYn3+AQgjLTdscOG/CSO iA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 39whgt0p0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 10:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6rOy2zUyhBrtXQEh0Be5sVl9MgeXjfvsXLC10LLSGrFCOpe0dQp+AutPXrC4hsgmnPuVEVdXoMo20lpVQyn7UUEuuM20g/uLUqQYeOlExUH72KYd9qk/YsdaeYK7h8ffilmvJYKAx4www5Jcrzl+Xl1F8nOOCVgmJ6D0wmmRmxsVp6UqAJzr8JbtAh5CtMVaVfBHcXNiciRI0n8rOOVIKE6xGKxgpuKwIQ23oS2piHSamfD+PQ83j+YrofRllW5GhgeJoAbcEmQjCNOu7nKxi6eK1Du8l683gL8J8OaLcqGyAi4st6iAm8RdvR41VdGAi9X7LYMiwxbGveuZmmM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJOt3MThvnTwpsktSGzKKLnBOC29tbI3lWGCGH295mw=;
 b=WibI3AQr8/8FlGLN6ELASVrW82wpZMy04ZLhIPuMqryDi7cnhI7KE/n3QTUQUYhJPsB2BQVboMRdJ2XsJ3jAFFI1Gc0Uh7srspeKn6MEzwLYLYAdjZTHbolE2FrYk2fRbEj2K9KYTKt3UDgOB55XFR7mJc2Z3RJf2JUB7v+nTx8eoc4m8+IXQjrVXdw8zLsZUUKEnaFAoVgw/ubG0ql/ooGjxqjxr2LWSsnOeZdFqBx4v/I4UFMoHbLQVb2I0TyODUb52aIY1fYXb0CQbByS2qseNG/MNuqkZYbxwZbqyj52RRkRpE4Hh3E2x7r4KOmftuB2ZSNfOrolm2ejYME3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB3926.namprd11.prod.outlook.com (2603:10b6:a03:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 17:46:54 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:46:54 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [hardknott][meta-python][PATCH 1/1] python3-django: upgrade 3.2.4 -> 3.2.5 (fix CVE-2021-35042)
Date: Tue, 20 Jul 2021 10:46:39 -0700
Message-Id: <20210720174639.77536-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:46:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b87d6b13-343d-4262-ae74-08d94ba65cbb
X-MS-TrafficTypeDiagnostic: BY5PR11MB3926:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39262D09A68145EEBC5D0E5788E29@BY5PR11MB3926.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L5SxEHJZhcFTYd+GZ0fT5Xr05mX+MV1hL8rqWnNzOMPF0eLOpNKcLg9sUMaVcIlOgSgrS0rC4O4fqdbxjHiyQKpwkm+vfkfskfzIfFn1yDSRSeV/HhDjucDZ+a5uZX/VMLwSSYFYtPmNPkKBNTTW464gskuz655oKZgLTD9j684qihGEWmOAAp1xd/wmAFdjsk18uTSLT3q+TFJ8c1tAF/i9ZyyYmJt1qHWHmYWRGihDubpkSWYXDAE0YsUVDcwt/806j0kyEwgEXCU2QorXyw+B2KoiCPGlTEt2udnlVTLozMCuHXM8Hboq17p2NgQorpuKqiWv6BU6j23ACscmmCdVZtEeniAjwiRKD9RdbUPSAHxcF616hJWmNwfbk1vSaxmrYbxqcfS+9q5duyo/PAJTWQ12NaU8v+uecbnmp3020CiLPGeCmLfVTsSHySK3pivexdjsjj0J7k60zCZC112xWosAAbpl9st3E0KYJohWYhQR1g7kH7/KC9KehLbuXlSyy8Hizrqbimw2p3lx1sEYyLQ3OMIrc9MRmOzneLDkqazPyL9wMsRCuU+14E7riPMWIgZQqt/UWEc+N0htyu3ecRUmagp/nxVOgbhZMogNeeogwvt8nqKQTW/QI28a48rwEtLtn0Uauwe1uYYfxm9II5GUnZaR+XaKvC9A1ufEwTKrb22uR7nBvMONVXTHChJQp/QQ7Vp7Ir+KPhGihQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(6666004)(66476007)(83380400001)(8936002)(8676002)(2616005)(44832011)(6512007)(66556008)(66946007)(6486002)(6506007)(5660300002)(956004)(52116002)(186003)(86362001)(36756003)(6916009)(2906002)(38350700002)(38100700002)(1076003)(478600001)(26005)(316002)(4326008)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzNXbUM2VXFHVDAzaFVYZ3B1SmVQNzZ1T0pkVlkvTG9Va3F3eEw4MExCZWpv?=
 =?utf-8?B?RU5nU2lSSlR5ZTR1MWsrb1VpSUJrVFB1UVlINE5YQU5YVERNMHpmeTM0L1FF?=
 =?utf-8?B?Yk5EWEpCcnZsMWU0dTRQYnpIcTRwMXh0S3NtakUyQUMzWWFUdXZKeURIQjZH?=
 =?utf-8?B?b3BhbFB0MzhyT2VXUXo2YnlDdWJkYmZRMFNUU1RhQnJzazRTTUw4RDFYak84?=
 =?utf-8?B?VXIyRnBPT3N3RWhzQWcxdEdwMUpaUWZTTEh0ZTRnMlpmaWU0bXJkTXQrL3JZ?=
 =?utf-8?B?Q1N2Q3BDd2pKMW5acFJaY09HTWl1S1M5dDdMekc5Y1JoSUhjVnFLSHY0cjNj?=
 =?utf-8?B?bWFpeTFRREJKTytKOEF6RkhBcnJObExudnpFSm55RHpZWEJNYlBqK1hteDRx?=
 =?utf-8?B?ajUzZEdpak9YNVFrNGZXb1ZPaHZVa2ZLMTczRU1uNi84OVNucUs1VXhXVkdp?=
 =?utf-8?B?MGFqWkpPSnk4NCs0bTlBTU1hTGdrSEFGVExnMDdYYU4rbTltUjI0QzV5SmR5?=
 =?utf-8?B?cVYzMG0yQzN5cXN4ZHZwWUZ5b1FQaUxtTEdvN3JHdE56ZXNtazNCWEwrRmxy?=
 =?utf-8?B?TTVFNDFWc3FmN2c5a0VPdlNwSnJLOXJLczhTUXhBSEU4RE9XSDFNMmJDVnNr?=
 =?utf-8?B?NWF3VWlTTXpHbWdvRkYvOUpBTDJ4d0owcjE0WHMwT1FSL2pzS1p5b2dNMmwx?=
 =?utf-8?B?ZkQ0UjBCZWpSd3UyN3JKWk03OXVaQUhTcHZUZHlsVU02YkpmY1dZcmkyRE5X?=
 =?utf-8?B?N1hLaXpQeXFXYXlqMCtLa3RtWUE5TDVXK2FNVlV3Wmg4ZWozeG9iR3J5bE5o?=
 =?utf-8?B?RnVYSWFhUlNjZGdpcW9RZHRWVUh1bW41dTd4VlExRHRCQVJlN0JncGJHRDNn?=
 =?utf-8?B?bHdvd2pjN2Mzcm5kOXExcVluTnArcXhKMVVCQnM4TGY5N2JVQXlBaEhjVDZ3?=
 =?utf-8?B?YzJRT2dZUlVnSUttbjlsTFplalZpYitHTjVjV3k4R2dBRGduMkxFTVdFWCtW?=
 =?utf-8?B?ekg1UG5GWnpSYU5GNGlWWnJhc0ZxWUxFcVBzc3Y2cHovbG8waTBvZkVCYm4w?=
 =?utf-8?B?cEZpZXF6ZHEwd0FNeTRTcU9xOTlvb0VIRVRxZHJmK1hWZzFGd2M2VTJJdlcz?=
 =?utf-8?B?Skg4OTRLT1A2ZmtaQkdmblJRdGtZSlJ0UnBFcGxGVjd2eDl2aWtKR3RBZlhK?=
 =?utf-8?B?Q3puWHNpamlHL2dGU3h4YitiQisrU3ZOUDdvWW55b3RtRHFwRktlQ010azNZ?=
 =?utf-8?B?eXR0VldwazRsdEtkMUZEblBLelNyUFYvemRNc3lGNXVTcENqdFo2WXYrOUkx?=
 =?utf-8?B?R05ENC9CMEJDMSthOVduTVplWUFESS82dytTa2hGaVIxYUo5azBKK2dPemMx?=
 =?utf-8?B?MGp3OUNGTUJIRmFQUlNPVVY4TGhMRG8xWTJMckpvOWJUUkRDU2lKaVVaUm5i?=
 =?utf-8?B?NFo0RndKUVJJbUwvK3YwMzFnYU5ESkkxY2xHb3ltOE1OUVI3RlJhMnRLUHBW?=
 =?utf-8?B?aDhSV0JpczB2TEY1dG5aZkJxZFpkZUoxR1FuUHFYWjExbFF5UDJJSk1ZU1FO?=
 =?utf-8?B?aXNWNC9Cd1lXNzBpSkNZQm8xMDhnY1QyUlFsQ0JsT0tneHB5eFNrSWpJNjcw?=
 =?utf-8?B?R3FlZ3pEQTEydEpTTG1TbUVkR3Z5a3JETkhXTFllbmZHc1orMW1TS25YOU92?=
 =?utf-8?B?MTBGK043UnRoaDlOL1dBNlhMcGY1bmlKU0tXVmlZQThQSFZ1a24wWnpUUkM0?=
 =?utf-8?Q?cEXl380kXaVL73YXqxddpF0+hba+cLx3XaWrM9D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87d6b13-343d-4262-ae74-08d94ba65cbb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:46:54.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ht4wHyX60Z+2qOJ/Iw68OXiP9KaIc8xH+eSMMmc6EffL/0/nTDVHsRdvADXnQpEhfq5bO5GO2fz5BnVGPgF51cqLyaQhZs+mAA8JOnPXTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3926
X-Proofpoint-GUID: hZLLJRWbu8x-1p1uFhlrNTm3OAXzALOK
X-Proofpoint-ORIG-GUID: hZLLJRWbu8x-1p1uFhlrNTm3OAXzALOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-20_12,2021-07-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200117
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16KGP00p016449
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

