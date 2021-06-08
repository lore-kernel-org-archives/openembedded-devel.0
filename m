Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.54])
 by mx.groups.io with SMTP id smtpd.web09.8268.1623126574289624149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Owked+S6;
 spf=pass (domain: kpit.com, ip: 40.107.139.54, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl5rraXgFWVr3/+1JX2FhLuHXWck7M82RQF85UgUb1yvNA2/pDsnW1pqn++62Tzh2FAWLjjc5CXLEZD6Ibb8eJgxFc7BDFfDzvJPm35QE3HKVgbG3Gab/5ZM0qBvV+1uokIMDN8n81IZdbGHtMt++ILDAeQflcza0mTHsW0Pyzo7bC2lrd660jl2bnRFOKwyI3dWMZsiEnayLDTQ/SvIkyA/MYKKCRKZiCwQF/y9YlXHvOXIus9VJKwnuh1FyPI2HaQuh6BJcssX5IMXxwfa3VAeKP7a42htcHSdRs8Q2idatzEJRx/W8UWXyUYXtnNHGxRtpEs2ReKW+7I6g8uEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjNWxz1GiqUq3DfM5PFWiIlEEM1ZxR38lxZMM5KD2/4=;
 b=nls1M/Qbz5OxewMy7KvvQu2FjAwgydR19qDTadRhJC2cVNUrEkxtmPlTF0g0JZI2cfdRsgw7NWrErsvss4OpitFDEWjVXC8K/qrXoXgzeJxy/lpGHwOOyUuLKtsSxp0V3YNcMiQNYJDHLs1c1zvrmOs3vEnHElhJBbFoIHzr7srU/23IXoNJLkfBCs79dpxZOlBuhZrm5dDZiFyM768RPLmg7cLlKjkmMYrXKEDMaetlS4ylzCNP+KZ2oWWc78OnbQqVvAhTGYN8XODyshsqIKUM6JbY1o9S4p1xO+0DTBCE3eycSPlKWwoFqR/DjEtoUtGI9EUXGX0bSmxvssjZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjNWxz1GiqUq3DfM5PFWiIlEEM1ZxR38lxZMM5KD2/4=;
 b=Owked+S6n0R/ad2vS5dn0uQNmjZUc9pZxopwvobLPp3wJpFQvKg7VbUJb1Lula2TQdtDR+V/CAjefAu0OdAP+gKeK7L/YMkMIG5gcSh3stvHVJs6904j99qIl8xE/3SIe8ubHVs34nYRnELGs+IVQjTMyfKx9HNJCTik0mLpkmQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN2PR01MB4907.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 04:29:23 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:29:23 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-gnome][dunfell][PATCH] sysprof: depend on polkit only if DISTRO_FEATURES has it
Date: Tue,  8 Jun 2021 09:58:59 +0530
Message-Id: <1623126539-9671-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: BM1PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::31) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by BM1PR01CA0137.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 04:29:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90cd041e-9247-4e54-5926-08d92a35fdbe
X-MS-TrafficTypeDiagnostic: PN2PR01MB4907:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB49077734A263F9E4EB41AB938E379@PN2PR01MB4907.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ke9pL3Jo5KP8UR+hPBgsgN9DGkvlaI5MJNlPba8PSLuFCLvdf1ZDeXrbDqYowlcm3goeMvb3Xt9HrOmbCmm1+CUpkfCV8Ae7W2hl2qll+VJ31BCJV7/4nkkGZT3k/4IKOLd8wcwJzjNV2ex0BvJ0wlyz79m6APoqaxS/qmjBicGRC5oi8qtmL3iA5+IVha6I1gFo4v8OjSWilq0VlmuH73TrTktHFMzE8GgmSNoHSJ0PZL0NWM6p0bsjACUJCMU6oc71q61HsqeP7A4a9A3uYdFJcUNlSaZH3gwqx+xOSxMv5QYO9/WhNc6J0TuZTjIwiBEYKZ+RiIJPLcUai52MBBrLIcBLZh/0SXIwTuhjl9WRKZfiO6brv4ipXZRYW/iXx6PmWDtvCbBTMyw5Z1XTro4ZxSZr2+l2JuGVTvIVYw3SvsI/8yAZso/1/Z13bRbmO+UcvMlfu6eNjepmOafstJIvuSi//0gYd80bt/0E12ITsyM66j9MecUK+FQXrFAcSMJqGO6BH8o9IiJMqfTZQ/zriNZodsuOii4yWTEz6HWFkwpRodWFwea4QAR7M+iDkw2gemBc8e7cmahYn0wXfDSLm1aWAOXjsRhiwV0cpEMAA9wUgU/G3yIlfxQMh0bB2pbOfa5o83Diibc29RGG14GBVaiIsW9LxGFfUMiUA7o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(66476007)(6916009)(2616005)(4326008)(8936002)(52116002)(316002)(6512007)(6506007)(66556008)(38100700002)(66946007)(36756003)(5660300002)(86362001)(83380400001)(8676002)(186003)(6666004)(2906002)(6486002)(478600001)(16526019)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PfjWJba/aigFL7WwRjZTcsZT19Fk8kXmKoLdWBGVYaf0bN8MnDcUFUijyqq7?=
 =?us-ascii?Q?LxZ9u/hCvcSXjJlBa3JB9CgIesGOZruCIfD49E9koK/O6LolaGD7ctVISZXI?=
 =?us-ascii?Q?mA4P0KBgz5HXr3rsPwObtSm5SSI0JvvtEBJTfPCBRH8/duxhV9goW7B6DvAk?=
 =?us-ascii?Q?FMjaK5971XQP/CS5BnpJ3/qga/pB4ca1Rcku3wnn7L7tdx4nvjn4OjRebSI9?=
 =?us-ascii?Q?6igxrlRQl6vIjorT8g+uH/qddk/s5hPBX/mO+fhOfgRc9zZT9IgtVRg76+bZ?=
 =?us-ascii?Q?UoI/uUhPYMt+rI91JvTMDbtghIadkh1NNSXLRRKWhoziZAuQr+R+AY7iYM9E?=
 =?us-ascii?Q?EV8GaR3/8OWu5SttuZIajCJHz1Pm93Htc2VW+NJg1Ek2DpQA46AOQU6nDRDM?=
 =?us-ascii?Q?ObqQXEmjCs0FRw3izK5PZJBM/a9/PF+ISWGPUY4rePACJLd/supIc0L2+O+Z?=
 =?us-ascii?Q?hb0kANPEWJ5BRJ2VZHDCMR1r0JugiHTDuz4l24hh1jqfo3O8gb3/SQZ2ijOD?=
 =?us-ascii?Q?tz3DalBZkBT1zjQjkdkCaNEFO7C6Jjg+BzuNQ7caE1w4+3cbV5s+M1Sk+MX2?=
 =?us-ascii?Q?Fau2K6WQNWJyvJ4n7n1LoI6QCd312oolr2jkZ3BdPC/oiuoiFCcHXifdpl3C?=
 =?us-ascii?Q?bOCtygvu1y0Xa4c7YD69grfLknY7Xql7u8grISs7UFdyB9qMQ2MWeka3pjgc?=
 =?us-ascii?Q?M1o9tOKzGUWkjrTCbbpkHXA5uL5kEBSdt4YZyicb+Vb0ONdrhGFjh2VvesGu?=
 =?us-ascii?Q?3YrtMrzJOj1q2Fj7hHmX0Z3WPK9jsMbf8eEr9JUjKDjLX0fUKnj3E/sc+ry+?=
 =?us-ascii?Q?2l3Et8mglL3qI0/lP1Y+Th7NzO+AwDjgZzXvPxgO7F0AMlyYJ6Peko8H0lhf?=
 =?us-ascii?Q?Amda/Dprg6mqavnoeSD/yshkcRlAvNMMiGi/DqgAAF+5DpkbQWOFmKMdK7sF?=
 =?us-ascii?Q?Jf/Pmr/RUtf8RgdlkrwkjVw2WoyPPwlXvtc56m9iBOhFcevIsX2hUcKik0BL?=
 =?us-ascii?Q?1aFldNh3e2q6d7NTi1qwR0/5eNzAg5UWPEmCW/eI2vI0ozb908npiEv3trdC?=
 =?us-ascii?Q?2bTJcCPWZIw2XkdAdoWdZ/ktsLFfrHvQrmUj8eF9Mg8HsnQkVicHdEnw8IiD?=
 =?us-ascii?Q?g7wj294TXGoGNK2fcLECezVGYzVuDFDl7sDx9cIN4TfvJQEoIM4aI40Y1Pim?=
 =?us-ascii?Q?SC74H0ysZRUFnunphyuJXGaXwxoWL6009l9irSs0KvfAK06f8pFX3qgAcfzT?=
 =?us-ascii?Q?9sKSJKAbl48ZnauEkzIncO4Q31IAViYR8sInN24HJOVtPEqI/jW8GWFlXR7w?=
 =?us-ascii?Q?EbJfho+K688wjX01OL/o0+juq7oNfPZE6FOLycTpG+3UGivhNrvFaLmTHkM5?=
 =?us-ascii?Q?tPaEizKblCrCbS8qsQ6Nzxuttber?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cd041e-9247-4e54-5926-08d92a35fdbe
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:29:23.0848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvjsKsODKtoPNMM21uq1l+Nr/YsFimthoXGrztx5Ifwyf3pvjiVDZBFD7UZs3TzVwhh+Roo/AK3CcOsfEtyhng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4907
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Fixes yocto-check-layer error:

ERROR: Nothing PROVIDES 'polkit' (but /home/builder/src/base/meta-openembedded/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb DEPENDS on or otherwise requires it)
polkit was skipped: missing required distro feature 'polkit' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index ad69ab6..87acb29 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -16,7 +16,10 @@ SRC_URI += "file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
             file://0001-libsysprof-ui-Rename-environ-to-sys_environ.patch \
             "
 
-PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG ?= " \
+     ${@bb.utils.contains_any('DISTRO_FEATURES', 'polkit', 'sysprofd libsysprof', '', d)} \
+     ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
+"
 PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
 PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
 PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
-- 
2.7.4

