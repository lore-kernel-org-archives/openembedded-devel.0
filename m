Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3D5C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:28:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5815.1640010477454145202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=qm4WUGBf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7988a2314e=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BKDn3Al022936
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:27:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=S5g2SFsLd0qCwo357cKvpQJ53Hj9KQQEZRsg3lxYxX4=;
 b=qm4WUGBf/XFPyMGhqtgMpMzC74QQ/VOY1C0AZn3ALH5kRAqRSnu8mTsul3ZrPDGeQjDU
 50V2FMi5oyUzyxIJ3OvTB+XQ7w91aQCyWloSSQvgPGGLulV+LQKvwLbx8kzBZ9OhWFJC
 VtMPurc4T6y2blXUNKlSyIU8jN+mDQhpnX7gn2WnHpb2yt7PNsaYKtlYA+ClAzYhNBqI
 VN+X1ytpQwbHpeAARhCmzthsfT2uwWuyKJ6QVX87q+k+RMMEs+mhhQdTlMcOXSXOh5lZ
 jVU7DLQ1J/VkrAVfLyedbj6lPgg8o0sg6cpA9YVRq6eqB3BUcUNhh1RyS9dkzeTAMh63 iw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2pb6073t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:27:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4TTJNsakJOpVaSlAk7f0ASTULQnqwiqf1B3PmaEr1PT+jFgabUXNG8rfqNh+6/UArRqDlDF9rwfV1h6IAVnDWg8kmk2MksmWMrSZAYfRDyFVepk6sV3E5Pi04t55l4p3z3UVCLRSu41D8UVwO5KauBDaw7EdFXW5NsYhIX990r56qpBX4Jd/S6olbE7Vq1z9Grnnqwb8nRS10rddu53zwxe4BkAxfYh64L3LqFHr2bcWo4Yx/sCwBl2rrmws+M7b13oFwIT1jOpfMityi2dPBTIsfJglF8PUyEokWLbmGZzKhfnyohxgrskBk0p3xPZ3AxaXXSPZGsu7ZkLLN0d+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5g2SFsLd0qCwo357cKvpQJ53Hj9KQQEZRsg3lxYxX4=;
 b=Oj3DJehuiUj33ahenLOgEaKMk9NG5qPMRsoJ6sejPBXW0JzI8S6fSw7jGJjvfkLEKP3aOonBNRO6HN/z42R52vFEIU7QB7aF0eEXhXeAsPLFoQ6dP48WNkU77t155MBxC1kd23fNeubsjD4L/kQ/Y/WbihOFvhZtGjV9VxhBRSm84FxdldX/TTeoCnZHeFk/VCRTwVqVux9jxL/6M6MkmdqLzro3ewh46flviYzFt0TEe+sptm/zEvCt4VvMcFgkiL0M9WIE+5WxfluslIcg17zSOFz/TiIPYuOfYJ/BM67qoKuGosYGXjXdPzwHDRGnSNOg5UKlZz5G6uldugDhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 14:27:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::381c:4755:45c6:141]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::381c:4755:45c6:141%7]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 14:27:53 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-django: upgrade 3.2.5 -> 3.2.10
Date: Mon, 20 Dec 2021 09:27:38 -0500
Message-Id: <20211220142738.31148-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2da7371-fa4f-43c4-4dd5-08d9c3c4e89d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3061:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3061DF6A24C2F7286C44C7369F7B9@BYAPR11MB3061.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eC69gSi/XcFyk65Inq4ameEWJgbPEFBJ7bmY67ffEpDB40GrRsK9/VO+OvRHRdY6ybcXIIGQbCSkKnnDUJ15t7BOjEZk4rZiQRVlpDE67bTvES14nvaM2A6dELQZA2OeNb0JrAamdfltUijqifNwwCUrAb5+O8Z0qKfyrRJgbAHNtwJg+29UnyTEL8OQaQzfDRQF5oGrQVY6agfAzmXvkiELcamBG6UK3559u0VAWORNPCIlc+1B7rs+TQcO5vs83LuXGB17Jd7kY//P5Y7se+79BkXAcWO+TY5K6BEsgDKlYsNrjzEuJhM35cwe8Ra34RLGz/Z3N6LtvaDjpar0/MJrB41rIci8rKuo7l3Rgqt2W+SjOHBmAaW4RjDK+YlbnfmtBNcPd3xfxNao5/Jd4NXLH+mCHC3nbZw7uobGYn84wi+O0luJ1vyOVjXKvZQv4lJRTKH8PjqezyuJB+xkZLgmb2tWWlNTlObWCoO2nXfIms3x4znR6ivx/IesCH2Ue9heHFJxW6Yy84GdNQxWrAdQuMUAKulRhKATEkRtCgNZKLQwaR2spgHlMKWQi7IPAU4rPEXN4Tgh4hLoRpzO6RDtf594iR0NhCIn5VSP3PTbtrkQZ2bXkaOG8IYU+L6gbCKBl9IZeneVmzxw3zICQlFLClZL74KIbDv/R+2QCr53T5MSZ676uLEU6Vs5o1AiSRqc+dUus+BpyjQ9dkzRaNwq95sPifcgTsBVPdE7vFS7oZNNgn+zDiQOnavmBHLGz5BQxA3cNsKYFHMgMWQWPiIJsn+p7//W5g1a9WY8GhwEVt9RilUykJtm3qJSBVFPbD84PbIIWYLmdu26gEpdTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(1076003)(38350700002)(316002)(508600001)(26005)(2906002)(5660300002)(6506007)(44832011)(6512007)(6666004)(8676002)(186003)(36756003)(86362001)(6916009)(6486002)(8936002)(52116002)(66476007)(2616005)(66556008)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlZGZmNnc3hINlErTmtxSkJiWEV2QkpLdGlEYnQ4SlFyQy9OTG5LN0VUSk54?=
 =?utf-8?B?dHRCSlFIdERwV0VUUlJra01sZVF2bk1XNk5rZHVMa212RmZqK0hzOTZXb0lU?=
 =?utf-8?B?OE9VcVRhNlV4T3BMNXJUOGFrdmNtREdiMmh0QkR0WXZvQ1g5Nk9oNFRFUisw?=
 =?utf-8?B?dzhYNWlhQ0hyL1YrSUpIRVR4b0FYbFVNVUZXQ2VvRzhybm9zWEp6Nm93QkRv?=
 =?utf-8?B?b0hBK2VnZ1pCMVlUWTgxSm1hQ01qdEtCa29MZFpLeUpTMmI5M2VLUXpiZms3?=
 =?utf-8?B?Uk1OeHRXSE9OT1QxU1M1R2ZGZE5qZUhOdjlDcDFGY2MxeHNhdVNwakJnZC9y?=
 =?utf-8?B?VjNmYUVYb285d2FxT2FuTW1mTjl5Nm53eHFRM2oxOUR4ekIvLzF4b3R4WXBQ?=
 =?utf-8?B?WXkyeDBGOHQ3Q2R0ZDF0MURMODZQZW5UdjYrZ0dZOSs3OG5mTXprQUM3S1JF?=
 =?utf-8?B?dTFPQmhCaG5PaDlrTWltUXdka0xrRXU2dnN2TldFZnRqNlgvRFUvbU41a0V5?=
 =?utf-8?B?T1Bwc09yWmRxRWQxQWZQWTdsZzh4YVdhZzRDRnAvamZMSTJVNU5kVlIvcHdN?=
 =?utf-8?B?TndzZUFPSGd1djFvZkNNSVVjOU8zdXcrZEh5dWlpTkhqM2VMQnZIeEZSTWlw?=
 =?utf-8?B?ZWJ4TmJLaDZ6NUtKL1NsUXo4Mlh3RXhRdG9lTjIwOS9iQzRkbzVwaGFDZXdu?=
 =?utf-8?B?VVhybUlYekpvMDRPWTdMV2VlRzdkNzRlV2hZamcrSC9ONmxKQkh2VHIxWFNU?=
 =?utf-8?B?TG54dTJHbmFmN3NXZ3REdU15SW9PTHJkY1FhbXV2R2oxZVB1WjZPZ2lLbjlJ?=
 =?utf-8?B?cURXVkw1WE03R21kYXVjZmV1K01ONE9rWTRhdi9tbDJ3eWlleWFUcFVxWDVB?=
 =?utf-8?B?U3JPRG1Td0xTUWY5SFFrd2VXTnNNYlFKWURyeTRKbUVBa3FUREpudXdDV0dm?=
 =?utf-8?B?NXVHYjVmWktPWDZmazBJS0lxcHBQemZ0aXRtTHdDUzlHNDllM1k2SkUzVXpw?=
 =?utf-8?B?NExtRnAvblNad1d5YkdqVjRtd05GV2hDWmFOdDhaU3EyZy8wMzFUOTUrd1BB?=
 =?utf-8?B?ZHl3djFpK0cvak05UDJFVnprUkRMeEFQNFZXQSsrNnFsN3NoOVYzRW52MENX?=
 =?utf-8?B?eTBCSmIrcU5nTjFwN2haWFJOUCtLTjRwcVlSQzZ0dUJncmpLL1YxbU1tYjU1?=
 =?utf-8?B?TFpucGQyYzVnS3dIQTNJbFlEU1lleTBoRC9CbjZuVHlNYkVKN1FmK2laTGFo?=
 =?utf-8?B?UVUvM2l2dnUrTEt4MGdwdWxFOUlLeXpBTnl5ZktheU8zakNaQ0JsUXF0Smcr?=
 =?utf-8?B?TERqbzA3QXVXNFZ4MEc3cS9nd3VEV1IzT0NNeTAxcTFKK1lERHp3WC9uUkln?=
 =?utf-8?B?YjlFYmxxWjV2ZGlrcitPT3ZzK1YxaURLOVZJYU14QklKWXNCODc1dHFvLzRl?=
 =?utf-8?B?dTVYR0NEbXVCN25QQzNkdHZ1SXNaWGhhL094ZDNPNGJGR09lQ0dMV3JHM29X?=
 =?utf-8?B?T2tyVEREOU41aGh5L25yd05iZ1haR1RaTkdiQ3Z2R1kzL29zS1Y0M290TkxR?=
 =?utf-8?B?cEdabHBWVDVYSnljSHFwRGNnSGxSUUtCcHFaWngvUVVpMWRBVzhHSWQxRlZn?=
 =?utf-8?B?Qnpvc0hGWWhMVzBPVk1jWW1DRVJvV3FWdCtUclVUWW42a1NqdFJwN1NxRnZn?=
 =?utf-8?B?MGhUdksvRlZtMVdLS0tqb1lmcjFmZ0ZBVU9aODR1YjI4QU5Pd2lWYkVuS256?=
 =?utf-8?B?eWw3Yms2WVlZSEl4NWFuSHcyMmhmenN5YnphQjRscFNncFg5aU1BM0FLSmdL?=
 =?utf-8?B?YkdxcjFjVjdhMElSZSs3L0s5cE8zakU4dFE1bERtVS9KR0t5L1YwUHUrekhW?=
 =?utf-8?B?MGtlNUVtVU44OTJNNGlrbXhPbUNiZnIyMHdqMEJnOUJjS0FwY3NKTkMyNy9u?=
 =?utf-8?B?M1FJMmVBQlVHTHQvb1JhdFlJbEpUV0hCUnJrM0FmZ0NHT1lKSHhwUHpGb0xy?=
 =?utf-8?B?SXBTVHkwcnVqNXlmVldWRlRHZ2h3ZzY5ek9RdkdRSTlNWm9Hb0hmaXp1c28y?=
 =?utf-8?B?RnQ4M2NBL2FlRmU3dTc5Q3BRMFhKRHc0Znl0dlZ2ZlJMNlIvZGJ6ZkUvUXlC?=
 =?utf-8?B?QkdjTkJEZld3WDd6am1kNXNzZkthU0lKRVZOZWhpU3ZrQ3ZJQTJCd2JmblZ2?=
 =?utf-8?B?OTlRWW43VlM2a1JIeld1anJTL0NWaVYwSDRjL2UrR0tkcG9mV1lDVHYzbjNx?=
 =?utf-8?B?UElaMzFQem5hQkdWanlVUHBiaFhBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2da7371-fa4f-43c4-4dd5-08d9c3c4e89d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 14:27:53.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JlrRQTa70ieEoF+NOSkxZ3ULjTWLK1DRLn50pvkCdjyaOY24MQAgmRnzy5zS4LvIxgKVeM8JIKVCsSZubcdKJ62wsu/WmLj1e85JxDcfnIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
X-Proofpoint-ORIG-GUID: qhw-1l0htwjaoYSTpV1qx7iBdK4wSMwG
X-Proofpoint-GUID: qhw-1l0htwjaoYSTpV1qx7iBdK4wSMwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_06,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112200083
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1BKDn3Al022936
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 14:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94444

From the release notes page
(https://docs.djangoproject.com/en/4.0/releases/3.2.10/):

Django 3.2.10 fixes a security issue with severity =E2=80=9Clow=E2=80=9D =
and a bug in
3.2.9.

CVE-2021-44420: Potential bypass of an upstream access control based on
URL paths
HTTP requests for URLs with trailing newlines could bypass an upstream
access control based on URL paths.

Bugfixes
Fixed a regression in Django 3.2 that caused a crash of setUpTestData()
with BinaryField on PostgreSQL, which is memoryview-backed (#33333).

Django 3.2.9 fixes a bug in 3.2.8 and adds compatibility with Python
3.10.

Bugfixes
Fixed a bug in Django 3.2 that caused a migration crash on SQLite when
altering a field with a functional index (#33194).

Django 3.2.8 fixes two bugs in 3.2.7.

Bugfixes
Fixed a bug in Django 3.2 that caused incorrect links on read-only
fields in the admin (#33077).
Fixed a regression in Django 3.2 that caused incorrect selection of
items across all pages when actions were placed both on the top and
bottom of the admin change-list view (#33083).

Django 3.2.7 fixes a bug in 3.2.6.

Bugfixes
Fixed a regression in Django 3.2 that caused the incorrect offset
extraction from fixed offset timezones (#32992).

Django 3.2.6 fixes several bugs in 3.2.5.

Bugfixes
Fixed a regression in Django 3.2 that caused a crash validating "NaN"
input with a forms.DecimalField when additional constraints, e.g.
max_value, were specified (#32949).
Fixed a bug in Django 3.2 where a system check would crash on a model
with a reverse many-to-many relation inherited from a parent class
(#32947).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-django_3.2.5.bb =3D> python3-django_3.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb =3D>=
 python3-django_3.2.10.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb =
b/meta-python/recipes-devtools/python/python3-django_3.2.10.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.10.bb
index c10212c4c..0c5fbb8c8 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.10.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841=
dda35019c01855cd"
+SRC_URI[sha256sum] =3D "074e8818b4b40acdc2369e67dcd6555d558329785408dcd2=
5340ee98f1f1d5c4"
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-sqlparse \
--=20
2.33.0


