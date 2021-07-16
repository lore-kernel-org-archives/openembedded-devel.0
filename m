Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6195.1626442071078135474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 06:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fLzqEqD3;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28316a5228=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GDGGv0032500
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:27:50 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218gem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:27:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1ViJfkrzvGomH9WwXUehcrghdvwN7uu4rwAbGFM2+e6BwyIP0p4eaX1dml3FYnizc7Z/sgeGEJ+i6wqlPPgvjnZD0qEiXnJBwjNObNEMkoDTHMAm6tsM7RXvVy1RCrFn9QrOG/UsK0CKQdzt1SM7rwZ9+jw6WYv03/xB8xoe4yTuPQOup9vFZhaIMyLPD9Q9dt8hioO/OyjPumq9eBaDfYH28l7+E/waWOpL5C473hDRx7H42X9yq+HFYC23Hj2LL+2b0UPJY8t7ZG0ZaLLFuWtn7fyIf8rQS9l/HWOBZaDeYvCV2wQwuRIPyvNE3whhasr67zndNACyj7CHQWTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsvaMAme1DTkrkouHuUFuCpOq/crzBsBjpACHWbBie0=;
 b=gmpukRu/dTunoJCWQX/SBpnE/WKfpzr3wRyqkMy0FrHyhmwHKhsPOjhvraqt/ZgCSNo9NtbJpnETwKorBKU4XaHkiobCJ47OwzWCeIeDsbpkV2LVkKak8Jon6HKJRDBD1TeFRUmx4o1l+6PRMgwVgPayjz9+WKBZrSiljt1yKsyh4uxjImeVJsb8WYJExErvM4c5ydX+C+sVS0zlKBiPx0qIZxCmwk53olXGagWj1X+K0GipULAXA+cxZ+pY4OtptwNAWODVCM9wguFknMJNRzuMneeZqDFkMJr3TluA9eg4MpMWv/hpUoqyxLnemHVnceel0g08W/l/jjvKcEBqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsvaMAme1DTkrkouHuUFuCpOq/crzBsBjpACHWbBie0=;
 b=fLzqEqD3vd1p5CnmshHJtwSslEtfTt/5ZSLP5ASu3OGqFmI4WBRDMX6k9UwNdMEvrajFUHELC2hJnoOg+UUoNl7m2vf8sRCgPKNWLLVOpuXSrG46St0x6VVG4SDuNAAKS0q2KeCqklw4h3jQNSNCRmcPEWxZ718yPKnA9UbI920=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 13:27:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 13:27:48 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-django: upgrade 3.2.4 -> 3.2.5
Date: Fri, 16 Jul 2021 09:27:35 -0400
Message-Id: <20210716132737.398621-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BL0PR0102CA0050.prod.exchangelabs.com
 (2603:10b6:208:25::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by BL0PR0102CA0050.prod.exchangelabs.com (2603:10b6:208:25::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24 via Frontend Transport; Fri, 16 Jul 2021 13:27:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f7f4bc-567b-498a-d2b5-08d9485d80f3
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4401832982C3ADF8F123AECF9F119@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CkPfeYnDKF0WRxLSZW8+YNoHo7DyppjAvWqAIhN/OuC+I2WZmyevp/gGkB5p3nN91ZKmAcd39gnCJ3sEzMrSHCcvtTWzIHmidxKqMm5tVKxciwpN2mBiP8gWPFp0nmy6yDTfLUZi7yEUINiwDXdeh/dY/lCGVGztjaFaEK2LrzR6Xb+/2CIb1+tT+1tDhtDQFJvoJCwJcbei1we+dQq/VlCpzOVojN00FS4DxBkD/lNPFjgSlxIfUHfahaRbscFX5Xu8O/zAstsXux2pVJCMvJYRnksGYvmNZ52xfxd/gwfi3kBdA8o+gl+WsCyNDmWgMEHIUjcXOV7YRL8Rf+XOxmld6esq/9FnrGRvWULrSteATVVFUs2Tv99FGYrQX6bxdfB2xfL0PwrNSYDEzwTCvVAX6aD64Hhc8Wcj5IrhMziEPNWmKI74hCTZMpB8DO+ou9yB4h/4H8VOz+5S1KfWLTq8FYXw3VSHw4cFammyEdl19Xd95ssqZ/VOpsE7xHzYy0aoDiJogD6hOuOfmQ0ztbCEBN73zTN/9dnv0HOGwKAFQcBEA7ya/im2zpXo+BNIK7/KK74g7n3j6OqIcouGyH0n0RSHBwM334ObcHMhlgczh3ER3EAoSz7l3pC2XaoskjGmxCFXiIx0hxDb4Ojhow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(186003)(6486002)(2906002)(508600001)(6506007)(83380400001)(8676002)(6666004)(38100700002)(66946007)(8936002)(6916009)(5660300002)(86362001)(52116002)(316002)(44832011)(1076003)(36756003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVhDUE1SajkzbVdnb090djEyZGxFKzlxS240OU12NFdrd3ZuZG14Zlc0Lzc2?=
 =?utf-8?B?VHFpaGFocHowd1JUSGNyMlZzeFJyOHQrNzRNMlVTdUw3Y1E4Wk9OSGk2MzBE?=
 =?utf-8?B?MkpKZEpoODNodUhZMFFDeVppTkJGdEJMbDFnRTJnSEcwRWdIdDM1ekpCeE5s?=
 =?utf-8?B?bnovOUExcS9mQTN0R1VZSVBCVlgzZXNianlxOEptbGFwNlpJckVkTndQMXZM?=
 =?utf-8?B?ZVJ3QTUvZUdEenR2UmdLSTg5TDY3M1BqQWQ0SmFNZ3Y4NUc2cTRxcitSQi9E?=
 =?utf-8?B?c053dHlUSm1wRUJFK2tGTjMzTzk5RHNFTkt2cllQOGVoZEVyYlVtMHYybHVE?=
 =?utf-8?B?RXdmb29NcFY1U2VUQkFNeVpRL21ySHVOaWNLeFRRY043WVZKcVpodUxxUXhk?=
 =?utf-8?B?bG1ycGgyUFh3eE9JbFVpTzFzRnJzM0xLTUR3MDZ5WlVuZ1Q4cmpSTGxBc3dP?=
 =?utf-8?B?NGszSnJ6ZVlvMXNVait2cmRjdGZEQ2JLSjdFOFRmZUVSamZNZDNJSndlTFda?=
 =?utf-8?B?bmQ0M0ZHV0xRL1hXREdVWlY4OGlIMFpweURQcFRvTHdhSlJmNVcrUWNiZ2o2?=
 =?utf-8?B?ckRMSDlFd09LM3BxNnRaTkQxbWROaitZVTdEbE1JK3Nyd0FWNWZKeFNteDF2?=
 =?utf-8?B?Qk9ndzMyNi9mem54WU9DR2h6cGVsUEpJekxHZ0ltaHM2VnhQSGc2bVFUY0h3?=
 =?utf-8?B?M3hoc0ZMd2NlNnh4S1NMNmhIZHFlamVtZ3RhdjZ6YmV2b3JVOVNrU004eDN0?=
 =?utf-8?B?bWFCK2tFMjRmVktZRHZPeTZhOFNBeDVzQnpzNjZtQWc1R3ArV0dPbFp6cmVP?=
 =?utf-8?B?V0ZzYk92dUZLUkZUYkVDOWwwOWQwL3ZpTnRNTnRKUW5iNE0rdnZtbE5QdGlw?=
 =?utf-8?B?YjFPM1VZRkVHZmRuWm54MHdqd3pjVWpzNlpSU0Z5MmllWWNCY1JEUUZrNnNq?=
 =?utf-8?B?YTk2Q2xob01udXVuV3Y3THVReDMwNUN1QzlGMWsrZG8yM2NpdFN2OGJ5OWI1?=
 =?utf-8?B?LzRUcGJhbDZWVjdRWGZiZVZaeFZscnd6WWk3S0JrNzRuZDhpVGRyVmh3UG5z?=
 =?utf-8?B?clhtTWVwSzRaTE9IRWU2WWtnVS9mZTdwS1pKdmpDNkdBcTFONUtZKzNMWnhT?=
 =?utf-8?B?L3dhUUJSdlBneEVOTDBxTGlMTnJGMWYzRWpUcmRtS25ZU21mMGRLYklxeFJT?=
 =?utf-8?B?QmswaDI2NUZZcGxxblZ4eUhYNXZTSWtQRE9uTk5rQVdobkV0QXNvYTVxNEpL?=
 =?utf-8?B?bUpEejdwYTN0ekxrcUZDc1BJVEdqYzhxMWZMZ2IxWlFwOU1hdzBYek51Qk5G?=
 =?utf-8?B?Z1ZNU044dVFDTW13VmJxRU5SRmx4RHBodzVCczlEUlJxcWJqbjhlSmJPUHdh?=
 =?utf-8?B?MThCMjF1QmVHZ2NsUmtvMkhtYzRBM2VGZXIrK1dzL3NtZVZZdFB4WlM1d2s0?=
 =?utf-8?B?SUxvU01sUlNBSldISk5aS3R0cmZOckFxLytuQ3FGWkhrWnBuenMrT09RNmdo?=
 =?utf-8?B?c0Q1VDZiOHpGRmY2MzNDdTZQSXU0a0c4THpuTUM2aU93bTAzOXJpRlhRamtQ?=
 =?utf-8?B?SzRYRFRhSFpCWENpTHJ1cWVydXMvY0M4M1hXNm9UTW45Ukpab0ZEemozekFk?=
 =?utf-8?B?N2tSZEt0SUpNMks5dHRkRktnYlFEaGxxRy8rUVhXMWlYcm1PRU9uTUplYTZG?=
 =?utf-8?B?RWxVdlViMFgvMmI2OCszMXUxNUNackxJblVJT3MxNXFJNXMxZ0xoVzQza0py?=
 =?utf-8?B?RXBzNHpQd0kvdTQrQmt5eFZLK3QzcGkxRE9RcXhyWU9vYStBYnNxUDd0R2pM?=
 =?utf-8?B?ZTRBL3EyZE9iZStRUzVJQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f7f4bc-567b-498a-d2b5-08d9485d80f3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 13:27:48.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egbC+0d8Lp3qZ9py3StXESrqsiL3EeJgXBKiRUhHyPHrHyKX+qNm82QJz1qTNBRQP9dOC0tH3XOz1M83iV6tx+oBRVb4anv6vY5HrrwIefo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: fGbZ9qpH-J3XDMVoiLk1FaAgtorVX-Fz
X-Proofpoint-ORIG-GUID: fGbZ9qpH-J3XDMVoiLk1FaAgtorVX-Fz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_04:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160081
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16GDGGv0032500
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

