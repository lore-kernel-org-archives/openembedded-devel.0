Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E2C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 23:55:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.123079.1692057325365777035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 16:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=S2DdtEbO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7590f6e38f=nicolas.marguet@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37ENTlAj030469
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 16:55:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=yLIpu
	kJQmPT67lWdEo4uN+QxxgAHTaaPrJSpijeMTsc=; b=S2DdtEbOA9k2a51Y2Eawa
	PVrrcxy4rZu4T3YcO9pGhzWO0UsEqFJB0PwNZh5mVr2bf6Bjr+ooPYEmRwNtIqjL
	km24SSv2K2t1ZyFLTp4NpCKyyBDCknm1oCU3Guh+6dC59WkcBsQ+TktEzs2Q/Dx3
	HaovI9U7Gdjf3yPimMRHPwTMBILKdndz6RXn0sJ00fL1aCp/VyhA3fsuKeZPuhpY
	TEJZ6tt5GyLpiJFpLzYT4EmjszhjbHXZnrauXHUEUnXBVQW7NIxKC2bekSQ6NxZD
	Ls40TJkt5Wf2jizx/RL5kyEP7eGAnKrdhf2PF5PwrNApzoTBQvIP2jO40ZMqJzJ2
	g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bya4w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 16:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv2pAmximUVklHG69Oyjt94T5kEnI+cclvj7Pl+worh3icYCOT0aQTAeBqiT/T1+vJ9L/uhSmtDgTnLZAlqP/bPn4U3GwadNz1r3P8ICbxh8ZwLA8lrDsxo8h7Yw1Y13G+xcj5n94pYVuxpxGVHjyskQomvzjrcbuglTFQtrKbzF/+mCuuy8/7eQ7BQC3KW6+Tgrw6ucTkRsVOc9Iv4tk7tIBv5JHtrHbrzFtiCwfJwBOSxS/I/zreogODNIdJIVkcRegGAY6OCXsHbpFJ6NEATrRRC7uFP7SS1FRO1Og0vjSIYejFpO4pWHxxMjb3oQYZjTU/wDb7+0s/lU94nZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLIpukJQmPT67lWdEo4uN+QxxgAHTaaPrJSpijeMTsc=;
 b=DacyZkH6od6YLtVnFyreRVtjwXglKF288kMSBwPwSl/N4X8lRaVKCZAoJ36ptRmndOoVth/+r+wsp5smfLTaFmtX0SQq2dppGZrD2a/fJORDeMCcbz/2N/II+5v/IauD4xuiJJMOctXrMJMU1gmaEQHO/HB5J3qOdZPqmeRDNjfQdgbJO22svwmcxMyzJkh88AaFyBX4xPx8GEL1VDub7TAEr5LWkz/1PRAPgumQeiKkk4r23RmKv3kSDQa9b9O7wTY8aFnY+FLkwT93y5wwYZxUXgEtkn9WRUXuay4gj6hX2nXnIAdhLBlkA5Kx2ppXYjNn8lPvA7ZLZ1t/Gtre9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 23:55:21 +0000
Received: from SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91]) by SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91%7]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 23:55:21 +0000
From: nicolas.marguet@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] librelp: add ptest
Date: Mon, 14 Aug 2023 16:54:51 -0700
Message-Id: <20230814235451.1288083-1-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To SN7PR11MB6701.namprd11.prod.outlook.com
 (2603:10b6:806:26b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6701:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eed13f2-8af6-4125-789b-08db9d21eb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rmqywb3bIopBLKT5hACtKRuNESf6U+Z1I+Z/RglNCy7XiPjT/nYcST8K17NHXdXRAp0ZI5uNStsHXcu8D8d2ArxOdkcHlQtdDyn1ZfYCZzMTCbDGgVyRgLhj8LcbC2z5SEWucElL+oyHLc82Wtqda9vUhBKPuuoT486jJs6hJ+mEirYjvdbGXkb2exh+qvpvITlL4q2Qg196J5RR4nUfYTp7QD/v2zHYaWxQV64ya2hGsUBJhbJIxmAVAIe5+trrGmC3DwR/nnM02d8LxgllUnOwyBMf9wqp3IlRMzN4QNWPHpWZmIcH9MLVZhtvWTgJuArl7wHFiq2pVF4lOz4CmSj31ssgrq+WkAR6pWkHZQeYqJAb0uFAt3b7VBw8ZIjNgp49QAjigJwvr09QG7RBXCMarFfgfYY7YVEJz9GJx9UMPtPBa13tT46Dd28v1d0+7AdOl4fLTG5CWv5MFiaGCldFlhQHx/ut9TqSqwk9+Pr+ZuJ0KQi8EavnkjTH3zDvPZGA7oRYR8qQOQ5w95wnQK9CCedfcD9AYyjDPWwUwPmO07FLMubaaCo0yTQ0gPag6cxT1JgR+9NqK6zemcNxNVoRy5R0XyYlus6fI9/o6K4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(376002)(366004)(136003)(396003)(186006)(1800799006)(451199021)(83380400001)(36756003)(86362001)(41300700001)(478600001)(66946007)(38350700002)(66476007)(6512007)(6916009)(66556008)(9686003)(316002)(8676002)(5660300002)(8936002)(38100700002)(2616005)(1076003)(26005)(6486002)(6666004)(2906002)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2U4eGdxY2dXcm94NmM1U0ZTOFlvUitmTWlCT0g4MTQyclBFVXdoc21DVFZS?=
 =?utf-8?B?K0VNWElydjFXekUwTTVrRHF4N0xWM21uOXJQendkSTJuZjRUalZBZkJPQjJk?=
 =?utf-8?B?dGRHdTJHSVlOa0JMNkp6K3RORFo4WHdoTVlUaDZNMHdhWG1mRlhkVkVQNjIv?=
 =?utf-8?B?Qk96TUoxWE5wV1REd2UyWndrdGFUOXhKdjhaekd4MkdmS3Byb0hERjY1dklM?=
 =?utf-8?B?MndSN0RtTmVxL1F2YmpSZytUTkpOcVVwVmIvZWN3OXc0N2NjaENzMG1KL21a?=
 =?utf-8?B?Wm5INnYyd2ZnSEN6a0tMQ1F2K2xxTkZOenUvWEF0d21rQTZCb05WQkJTQ1ZQ?=
 =?utf-8?B?WmEyR1RMMXVqczJqYUFZTWdiMFU3WXNJTVczZmxMM0lIMWdadkoxYUtPOHBr?=
 =?utf-8?B?SWRDcVRySmcyNXI0WnZ3RHJncmQyOXV6elNDTzNiUkpJelR2akZ2UHZZY2dW?=
 =?utf-8?B?MzBFZ0owS3g1aVJ4TXJPSnFwc0JvZ1FMUFo0ZWx1WnZFY0lRdjlZNHovdThM?=
 =?utf-8?B?ampaYURISHJBUjhCd2E0aXpIK0F2RHZsQVdHQmdxR1YvaURlS0hZU1A3YXVO?=
 =?utf-8?B?alc2SCs3VHFOUm93cWJ5bFJrNFQyMlNmSFVCK0t6S3JxengreEcvanZta1lM?=
 =?utf-8?B?L1pWKzNDQVBDbnNDenZUbUI0ejdXL2xHdmxYMU9yNWx5YnZHSHBqNVJtS0Vm?=
 =?utf-8?B?QUd3eGVPUStwUnZvMHdWZ2NaVTkvaWx6WEo1V3VzSkxObkVVM3JTdlRQV2p2?=
 =?utf-8?B?Yk03MnMxZG9DWEpXeGtLMHFidmc5LzFkbTR6QUttekpITTd5R1huZlFPTEpi?=
 =?utf-8?B?R2o4T3lna0VHbjlSOElvY0cvbkF3U1hNZDRRUXEza2ltMXN2WTRZM05ZSHlG?=
 =?utf-8?B?NTZBUHNadWJZWjc5TUhpaGIyanBDV3JZOHQzVWtRZUVkT2w1SWVsWDd3L3Vy?=
 =?utf-8?B?b3kyelBhMjNBZlo5ZVhUZTlwWldocW5EMDVpaW5tcnhYZ1lWVkpUWGg3QlRT?=
 =?utf-8?B?SVlhVlVQdC9HaUZlYmNXMDJYWEVSTmd5YmI1U1NvZ3k5YkhWTXFWVElyQ0k2?=
 =?utf-8?B?WnBPQWVKOWhKRmZiMDdwZnp4Ynhodll4UUxONEZIYWJKRElIVkMvcEZMVjl0?=
 =?utf-8?B?NFBocWlVVGU4VWpqT1NtMFptK3N2SkE4MTBmVnNDR3BjdU1sUmVGMW1Zb0g0?=
 =?utf-8?B?L2tEQ1ZNYzVhYmQxTDFLMW8rclJNMFFWZW5FdGFpMEdhWFRvM2N4WnR3dDk5?=
 =?utf-8?B?R1B3c21QU0xsellWUnVzMlZKdXZrRE9qRS9uemJkNWpLeVgya1JIRkZ5RGNU?=
 =?utf-8?B?ZWFzUVZESmRFT0laUlB5Z2NoRjgzZHV2TUFwb1VBb2luMDZQOVdpWkQwUkRW?=
 =?utf-8?B?Z1EvRUhkTWkxSGVaMEEvU0hZWnhZdEh6MDE2dUt1bG1uc08zV0NaWS9tNVN0?=
 =?utf-8?B?OHArM0p4Tmh4S24vd3gxR2RuU3J3L3plOFpIMjlYbHVTR1EvQ1lkd3IvR2NW?=
 =?utf-8?B?Z3MyQVFYbGRYMlFPQU1CTURFNHEwTFFSdEZGcHVWRmZHbHR5YnZoTTlHenB6?=
 =?utf-8?B?M3lsckdGaHh1MDRCSHVOV3N2VVNHZ1BFQjViby8rd05TbGpaZjBPN0E3VUll?=
 =?utf-8?B?RGM4Z0dxbmNvbHE3WGgyK2dXTVc0Rk8xTFVDZXZRWmJsUHNwckc1eGNTVDc0?=
 =?utf-8?B?dHJzZnR5eTV5bzBleGoyVllsTXBBSlpMUU1GOCtQMXVCYzNhNUdNZElqYXZr?=
 =?utf-8?B?RUo2Q1ZBSXNGRGgwcTdoeWhPOUhodzBJZXZaaXJ2a1pnQjRjcHl5cHRrSXUy?=
 =?utf-8?B?THpOTVlIb3BFdHlpNEI4NUpSc2Vna2xNVy9kUFZMZHUzc3ZSM2ljRXA3MDFE?=
 =?utf-8?B?dW9HVlZ6YWM0VmJlTWhmeFZhZW1ialF4R1o4N3FNeUl4OG4yOThKQzhzL1Z3?=
 =?utf-8?B?cGFJdDYrc3dlbEFNalJFYkpZcnFCb2tFcmNhSzYyYVZDR2Q4T0FHakVIZ25K?=
 =?utf-8?B?YWJicFRSTldLb3NJK1Ava3doVDhsYTJ0Z21DT254SXZyRWcrWXltdWRoRlNt?=
 =?utf-8?B?L0dEVHJ0YkhlM2FkMjQ1S2RHYU9FbVVGcGVaZ0l2ZWc5R2xvaUg3WWxHbHp3?=
 =?utf-8?B?U0Fzc2FSQlpIN1lWSUVCWDVDeS80MkpVZnUxUUxaVG9ZcjdlWHhXSTN0SEYx?=
 =?utf-8?Q?Urj5mj5Q0084q5TbYIPrIHU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eed13f2-8af6-4125-789b-08db9d21eb4a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 23:55:21.1395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwTu/uP+dS91DrQfAfxbT7Ur7CysS1yQl4SUJitUbZ2soV2iWxoecUVLtshZMhfFouZ0yQAYzbokGT7pzOWQPzslfnRhyhZ2B8pQFJjwPWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-Proofpoint-GUID: NCCuKYEDZxjejL2_WZXUCUA9eqNCt_iM
X-Proofpoint-ORIG-GUID: NCCuKYEDZxjejL2_WZXUCUA9eqNCt_iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_19,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308140219
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37ENTlAj030469
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 23:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104353

From: Nicolas Marguet <nicolas.marguet@windriver.com>

Use internal test from librelp project as ptest.

This work is largely inspired on the rsyslog ptest implementation,
which copies the automake-based tests/Makefile to the target and runs
'make check-TESTS'. sed is used to fix a few Makefile paths or
env-vars so 'make' can run on the target.

Tested on qemux86_64 and qemuarm64:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   librelp 1.11.0: tests/test-suite.log
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

TOTAL: 30
PASS:  27
SKIP:  3
XFAIL: 0
FAIL:  0
XPASS: 0
ERROR: 0

The 3 skipped tests are either self-identified as =E2=80=9Cnot do anythin=
g
really useful=E2=80=9D or may need to port libtool to the target.

Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 ...line-errors-in-debug-optimization-Og.patch |  0
 .../rsyslog/librelp/run-ptest                 | 10 ++++
 .../rsyslog/librelp_1.11.0.bb                 | 59 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{files =3D> librelp}/0001-Fix-fu=
nction-inline-errors-in-debug-optimization-Og.patch (100%)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/run-ptest

diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inl=
ine-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsys=
log/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patc=
h
similarity index 100%
rename from meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inli=
ne-errors-in-debug-optimization-Og.patch
rename to meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inli=
ne-errors-in-debug-optimization-Og.patch
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/run-ptest b/meta-oe=
/recipes-extended/rsyslog/librelp/run-ptest
new file mode 100644
index 000000000..a649a5716
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+#
+set -e
+set -o pipefail
+
+SCRIPTPATH=3D"$( cd "$(dirname "$0")" ; pwd -P )"
+cd ${SCRIPTPATH}
+useradd tester  || echo "user already exists"
+su tester -c "make -C tests -k check-TESTS"
+userdel tester
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
index bac5abb05..cbbc31b7d 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -8,10 +8,67 @@ DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
=20
 SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;branc=
h=3Dstable \
            file://0001-Fix-function-inline-errors-in-debug-optimization-=
Og.patch \
+           file://run-ptest \
 "
=20
 SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+# For ptests, copy source tests/*.sh scripts, Makefile and=20
+# executables and run them with make on target.
+TESTDIR =3D "tests"
+do_compile_ptest() {
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/${TESTDIR}
+
+    # copy source tests/*.sh and python scripts
+    cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}
+    # install data files needed by the test scripts on the target
+    cp -f ${S}/${TESTDIR}/*.supp ${D}${PTEST_PATH}/${TESTDIR}
+    cp -rf ${S}/${TESTDIR}/tls-certs ${D}${PTEST_PATH}/${TESTDIR}
+
+    # copy executables
+    find ${B}/${TESTDIR} -type f -executable -exec cp {} ${D}${PTEST_PAT=
H}/${TESTDIR} \;
+    cp -rf ${B}/${TESTDIR}/.libs ${D}${PTEST_PATH}/${TESTDIR}
+    # copy Makefile
+    # run-ptest will run make which runs the executables
+    cp -f ${B}/${TESTDIR}/Makefile ${D}${PTEST_PATH}/${TESTDIR}
+    cp -f ${B}/${TESTDIR}/set-envvars ${D}${PTEST_PATH}/${TESTDIR}
+
+    # give permissions to all users
+    # some tests need to write to this directory
+    chmod 777 -R ${D}${PTEST_PATH}/${TESTDIR}
+
+    # do NOT need to rebuild Makefile or $(check_PROGRAMS)
+    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Mak=
efile
+    sed -i 's/^check-TESTS:.*$/check-TESTS:/' ${D}${PTEST_PATH}/${TESTDI=
R}/Makefile
+
+    # fix the srcdir, top_srcdir, abs_top_builddir
+    sed -i 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile
+    sed -i 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${=
PTEST_PATH}/${TESTDIR}/Makefile
+    sed -i 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile
+
+    # install test-driver
+    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
+
+    # fix the python3 path for tests/set-envar
+    sed -i -e s:${HOSTTOOLS_DIR}:${bindir}:g ${D}${PTEST_PATH}/${TESTDIR=
}/set-envvars
+
+    # these 2 scripts need help finding their /usr/lib/librelp/ptest/tes=
ts/.libs libraries
+    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:' ${D}${PTEST_PATH}/${TE=
STDIR}/send
+    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:' ${D}${PTEST_PATH}/${TE=
STDIR}/receive
+}
+
+RDEPENDS:${PN}-ptest +=3D "\
+  make bash coreutils libgcc util-linux gawk grep \
+  python3-core python3-io \
+"
+
+RRECOMMENDS:${PN}-ptest +=3D " valgrind"
--=20
2.39.0


