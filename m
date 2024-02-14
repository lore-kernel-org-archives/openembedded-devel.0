Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA1C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 08:25:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.117])
 by mx.groups.io with SMTP id smtpd.web11.37595.1707899128576390189
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 00:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=z1Jvkq4y;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.117, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChCv0C+XUVqOpQ9n4aQW+zo4d7Fg4wjVQXrco2mnJ8dIZJ6zs+KXNrOCWDCkjxuf/AMuLqdNOS26JP8rEInv27gO5KR41XHN5ghO9BcOE9thi/NRFOMg9yFCRnc7M6SjPilBLr55BOeFrb/TTByvPVGjegopI9ffQ5jqpLqxMZ5S3MLgePSwnftnzSccADrAcVVp9NS1JawolamioU08Gj+Nh1WMxEqVdvCUs6tnT30uIPgwYgtcLTXAb9gcCCyNJixMW3A6c3Y8ReVYMm24FTfPYTMJ/luAXT2cGczbTegfT69TpO2HCWL7D+J2lG3Wy1lC+WsaW+5GpSqUo1yEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYfewQ87ELvtVn6FGjzMsWdnqyD6VX0xZB2N+HVYOo8=;
 b=lWkOmal4D5VtkS+thZdxM3B/nBw57vAVM0OUga9gvlcKLvxZkvGFlVrXT7C8TgkOGvX+gH/nBo09mdGcZzWtfpgW5veBEq3TsQoSMbZzWsIR7cCwXEL4LGfx4IbOiw3HYxkj0jGZdo36l1vuN4uAMOYUBiKOgdXG+CO7saL18Y7OGZ4JsN7IQbkSqw94UCz61cCvOL6tIrofPMwUrZSRCzHfkucJmpkfe1ifzTPu9YvLv4wMMBmKEd5ezLhzfYAuAOBMqMSyxFKCJLOoAHoCRY7lXspeY5XDwIba+SFQ18GtfOgKSZTNonrD9yRrRXZvGTW0Ec5nxS+pwhN5FMa8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYfewQ87ELvtVn6FGjzMsWdnqyD6VX0xZB2N+HVYOo8=;
 b=z1Jvkq4ylfjkaCJd73z+yB3TDULBYlnyEQ9mUsIeQ8eBzzGMweT6pSK2B6az5Dc4uNkaHGRDVaYHz7L1UThqK/WpNsZgqM00rpRhJhjlH14PEKBONaXm6XYUhH4l0G29GCw1fJ1xeJpZ3RCNjMcaltzPS1jUN0Kf4Va2s33N/gY/8j6TpJBrbpaftftiuoQgzkV/oirLXctU6CM56FJXvHRmQonSp9GNHNaAGBOmTezSu5/mfv6ja5FyhaPoA80L8DI+m48YQuWweNPCoqZiCJIi0NWLEVeySaRv8O1yD+roZHRBFlP2OFlbb6EUkpByWIN9gQPq9BZTKnWZfuq7+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB6741.eurprd06.prod.outlook.com (2603:10a6:10:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 08:25:25 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 08:25:25 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 1/4] python3-pybind11: Amend HOMEPAGE
Date: Wed, 14 Feb 2024 08:24:46 +0000
Message-ID: <20240214082449.3498259-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::12) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 937aec97-514f-4fb9-8413-08dc2d367e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iGIJtNPqqMyqocp7BB0UAbiKJ7//uhSRALHl+GpDzFJiuW2b0JOQTl03nx/KXgUv46c2ZRCt8ZyESFHEFx1jrAw4NsyrAkkIiCVFal1o81LsEs26w6tAnnbqpMNwMFaa0YbvbMOARsTueiJYZ2ZAiDv+AulwQa/w3K/1OBhnSipVbwC0WPNB8ooOmgw4YXxVjOv15sgdPZ/ck0T8mQekubiRBfQgRmh+1zRsoKTTtWnTe6Ml0XLS3wLkWBCdbBFA/4yNc+NGYlEGfD1zm3LWpPEm1y4Bh/DbuUkrxcRJlPzWZqgW1B47zF6S9QzuOucw4HxQ0k6g3HIOl2jQFwdZK3EZnw3XJkz2Og4V8TFVAeZIybYH3kwzvQDeEw4es8EKBiwS571d/HGjd8/xPf526ojhu8hAiSf582eTAHi7kH1jkOT5fydCwzfPLaNliPSqLghQTWmKA3QM3BKm7D/ZrOzqlfXgbwKO/eEjfYSYHK+rAWOXelVTON6UcW3WqZww8ajGH+10JonEaHV/Sk3HoukeKQlqJs04HZXZhHoMDvVuUc1DnD7GqNDUsGJ7TaoT3UoGZctzTp/uFDDb5bZINaKT6sa6S5FNcV4IepIjwDQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(6512007)(6666004)(6486002)(478600001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(4744005)(38350700005)(52116002)(6506007)(66476007)(66556008)(66946007)(316002)(6916009)(2616005)(83380400001)(107886003)(86362001)(1076003)(38100700002)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xReLpYrmByAO6y5jhnsG4j2gRgJ+eTL4hopU/geox6w4exAX5WAVShSEfG7S?=
 =?us-ascii?Q?vIUSYNXc80tfr/wNvDo0RxFilCs5H0CtQNVHfsyVhT4J6hdd3YtssFrMfC87?=
 =?us-ascii?Q?VZy8Of14z1kULtioAQf5scDOYB7kdmVKQaoeN15lHV6gUWdq+AE0r1dtUwZY?=
 =?us-ascii?Q?9H/kl4vPiHF/xcJuJE8Dy3ul5rbonWXEJYLQqQtn1wj59DhXT6eV5WdEfFri?=
 =?us-ascii?Q?o5spp6EO1aroMwO/iGVdtmsRTd4vQczG6UN0KInFfvv1W4wrU52vgaif2i+B?=
 =?us-ascii?Q?tlfLDQuEIvu+QM/KgnYIrjWSWfN9svXFWetuldByao+ckvVTtWfnaGhsvatE?=
 =?us-ascii?Q?yqipMoGpDeRcy+V1KcRV8wLOmgo+KfNaZksGIO3AYoiCQfXnJbNMzlJHykpz?=
 =?us-ascii?Q?B2JhE9ebcSxWgjADi9IaD4k48kXL3TXQoaD6cBMdPnhksYKgdfEz+v68+O5m?=
 =?us-ascii?Q?WW9WJu+voOtOqx+FY6yunC36hTiL0RSv+jMI40WMfb/bpEJuIPWsCFE9yzrR?=
 =?us-ascii?Q?Fac6Lxj+1N8BnCgbwaANDFSpviU/7usibmx2hzfBLXU2JI1x6JTkxy4/HEib?=
 =?us-ascii?Q?9ptQ5QshEWWzh+fUCdhR9WkkSJzOgRG3xibGLLIOHdI7gB/uJa+0vPmkk9sL?=
 =?us-ascii?Q?nMY8j2mb+zlX8+HDzzgRBThMGk2HVIYZ+HfOzEFlfkatgsIyc87ltQkV9nCl?=
 =?us-ascii?Q?3CDdny26Slr65H/WehubyQmcZip82nsI4ilU7UBUVAogmzp/Y0qZS896tQ6s?=
 =?us-ascii?Q?T2qKX/y6590ea8zqSTS0ovF6n3aIIeFykqMHr1oyim6bSb6YZDS/NiMOurly?=
 =?us-ascii?Q?K2cF2io+BWcGvm40y8HJy84OZSIUey9A5sJA9J19vl2MwZuYlNtZ0cHtsVqu?=
 =?us-ascii?Q?kxpGA99L5dauaRzNVIC/waKzikT+pVCdv/2n8HZFeSlhJ9uB+K515sZv8v5B?=
 =?us-ascii?Q?hUBHQtxgl3a6V7/r1I8DHTX/fjmoncLSLECyQCS/aFTeRvMFofLW7w+DT3Tm?=
 =?us-ascii?Q?cP5KtIMVq8H2tGSz/efK0dSemqI6KENDwHxvecCx2+WSLj1M5tddcVU80POS?=
 =?us-ascii?Q?ENe38SJwz9yIrRocJM7LrZQtxCClEzaV3uW4lRFuprhMMGvxq0Jcg3LLSlZR?=
 =?us-ascii?Q?JO6ho0n1oolZtWSz5KRfqad1LwleptVamzZ1yEXupQBiesrfebSLCYhqP//M?=
 =?us-ascii?Q?YhJYUpxLiYwCBU0M0a53jjbORmLHTIdg4ct2zi9QNnBVJ2tBHAOuG2o1vQy5?=
 =?us-ascii?Q?Z3ursrOhu6AE+nqtFqDS9JQ8AD0X0lJLuigGjAD/mCPMRMPyYLSAKnl6SU1F?=
 =?us-ascii?Q?ri8Ni+St+tpNmSgPz4ffSuZsmKeEpgGNUlPqmW4HkdNLqPPPPST2DYMZKd/p?=
 =?us-ascii?Q?64gL6ePohBWAcUrmO1o9p6y6iwZQUry3BdU7GTGvlcYK7WrHcoqlk3inBEGo?=
 =?us-ascii?Q?5RIe6FQjkCzEuGhnKqA/YkMYfAHEClcJpQqoQ3gWjWF8xpixAR957a5vBd5T?=
 =?us-ascii?Q?hyydxykqu5PRCez13nBv0n/Hz3F4KFdPB0qLfWUia1lKzcC/qz+d5XmE6Kqu?=
 =?us-ascii?Q?MfdjAFDbTJDSq9V0DRjknzTB/VroSYdmo6m+h8CZoJcUM83Kl48BRZtRbeDl?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937aec97-514f-4fb9-8413-08dc2d367e4f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 08:25:25.2169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5Cbim2rb1WAmCH6PTFn5DGlwBc1oPg+NHzHipXE74nzyOlKoBtTXauwLallqyeo53OZTyEKahoJrErk1Fhy4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6741
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 08:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108734

From: Niko Mauno <niko.mauno@vaisala.com>

Update the HOMEPAGE value so that the URL points to the original
repository instead of a fork. By doing this we fix the mismatch
between HOMEPAGE and SRC_URI.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb=
 b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index d51dd905a..e919e7dcc 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Seamless operability between C++11 and Python"
-HOMEPAGE =3D "https://github.com/wjakob/pybind11"
+HOMEPAGE =3D "https://github.com/pybind/pybind11"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D774f65abd8a7fe3124be2cdf766cd06=
f"
=20
--=20
2.39.2


