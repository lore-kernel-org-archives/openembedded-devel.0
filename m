Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B053FC7EE2D
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:58:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.79])
 by mx.groups.io with SMTP id smtpd.web11.13817.1685714285026450565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=LHI+Io20;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.6.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isjHDQASf89sO8N9R3diblTQoooY7vZUnYMcIutWCKtlT38ov2pAR0TwZeCkym6vfLD1tF3189pENfboMSIwrN6ktkoDEfxGswK2WAwzQukgvxMEuX1TjW/jC+3UiuoZiXEtLz/S4zysB9FGSRWZTsEcioBXz7aViRt9RI9TEfqqBpl4w3WNvAoeEBOmCA24tSJO0feE5E5Pct+vJd3koWYpWLNKZTbELwlhLOgXbhBtb7xgVqztCVp4CoWU5STm74sUdp0TA7UCBtTDRKNOsTHnikYX30W1YsIEwf70gNCedR8Ya7IN2gQ/qWYax758sIdpXNIfwwcCAMjuyZQDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzMKY3edc1BLwbsJdZjxjNUZq82WxfcsDfCCP1rg498=;
 b=HIYAFItZsx0Xy2YBR1M20OvEFgx02dm+LcfdaTugorlazEfzFAzK1mqdPWfCvA/5HTwNPUN+4VDlm3adCw0uttV5pTg/KgG2B6O7bpYe6o+VMtLQjAVayEzgVFW6Z7Hf+FCkc3yUhsRhwd433y6/MRZ7ZZvmcIdCWNhf5b63d+XnTNStvsjdcNZsFUYqxFdg18PfhUhvNy1cbqFFKVOUN0H9dYTaDq2MEBp9ccH45KuzwkiW9732B6ORoZ03oeCVVk8TI6m5CH8MWB38HNuEPcTsUo6L4i+kwF8XWXtpDHUhNc+HLxvx47Ek5BkN4Dw2di6U4uSXnj9gfh5ZHYOvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzMKY3edc1BLwbsJdZjxjNUZq82WxfcsDfCCP1rg498=;
 b=LHI+Io20suHZOjXZVuJIXl+PKBh2780lU6zymP0HatWYx9sO9CvXTw3zWkS5YSOAXXwFJkQlVZv2x9ijtUmoBhc1/xuf7yjgHVkl2VWcNR3sir55fCDbeCapG0oPTf1r7UOuzOnvSyef/knT7sDGL6bQWhvCTIzcYWfrfbtkBOS5imC1aVd0azJolf1wW+Fc14wUspqWUBw39w1ZvhcKkSZMOIV3FO1m9ZCFV/LrPKpwb8lkpS7zQ3Yr8lpjuMOzMgp5O9dAhnDbIMqhEFpZo/Dy/WFwMX4xIUOpJliXiWDt6zry1D3ZrIpFtpEgi0F4WC2UUQlReG2NcF020s75AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8559.eurprd06.prod.outlook.com (2603:10a6:10:369::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 13:58:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd%5]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 13:58:03 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] contrib: oe-stylize: Use Python3 explicitly
Date: Fri,  2 Jun 2023 13:57:37 +0000
Message-ID: <20230602135737.3833492-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602135737.3833492-1-niko.mauno@vaisala.com>
References: <20230602135737.3833492-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0094.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: fd10fc34-0e8f-4dd3-929a-08db637161fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gsPqStjXFVzg4r84AlaXTvvYWV7QUVdzO53FBHvKeUi/LCiRwiYKx3spe4SAefcXmU5SqpF8RDEFW3sRJSSUe1+lWbVi6uguXruljJsLrISJkbTndd+c4VF23NGv5FSc9XlMgL2uQXXG5JSL+geRI74q0GLcmtTRntkVUipQ4gw/pf72Q/DLUF/Zu5E6GM4PGe5PbuQPKZC7hnRvp/H4FG0q8aXH1/9K7L/+ZILcoytoMPb6qaCtb08K+3g6mSOtFigd2EUlIdeH7WyrXgtB9bmk4vknY/sRhCiNXp7Mz3fIPwIg71cjFDCKPpKQGDjwcnZvrjuOREoJ7ZP0B2kzZYJ9IkTsnreBQN4XYyp8eZI72T0twyx2mJo7rABwnamzEy2006iiJVC8sleZyhfQXhSaeRdtxyy6AQm2SszYM/Iashf1rQ/UTdHzCy41lrNXh3fTwNlIHGOpNxEm4mVGjmfMevSlua5SnBQ1oVKUiUqOwyv2Zlig7bnRIl/gpG2PSgPL7jy7MHur9ZZeExkgVCIIM4yIuPWWfK3rb1YgsgcpfNCITot27a4mRrRcyLynZ5tU68iwAPDadHJOc+xL+fvdYvv/Y2kC660S1282dGiz9H39NiO+X3bbaXQHUgfi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(66946007)(83380400001)(4326008)(36756003)(41300700001)(38100700002)(38350700002)(316002)(6506007)(1076003)(6666004)(52116002)(9686003)(6916009)(6512007)(26005)(107886003)(6486002)(66556008)(66476007)(2906002)(8676002)(8936002)(4744005)(5660300002)(2616005)(478600001)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Jpk2craG5is8YCtaxQ1PRgt6es3v1JzVgZTtoaVqJb+ShmTT5qWI1YowLUc?=
 =?us-ascii?Q?4w9z94zZ4MhasLYN5i9MZ34xUQjcg/Ppa9D0NbTC4MM+EKUcv1HFUDWcZ+8v?=
 =?us-ascii?Q?cWCQGHKdZAOZ4UD915y1Dn4E70cwR5pJeUVc7XKwj5pPgLmv3V75WfeMBzLD?=
 =?us-ascii?Q?c+6ggmOETlWKhgF9JF4O8xhRepe9h3b2dpI0/i6hbLI+nJcQOpZVWfUKVQ7w?=
 =?us-ascii?Q?v52A2brigYh0hxBBdiwLaQ2Optn2PUM/fGc72BhU1f97ZUbn3toN1++rV8ze?=
 =?us-ascii?Q?uutfbaFGbKK+U3SwbMIqRl8hwJT3D29NyEhGqY5+n4SrWX/IF3a2i6aLnBKv?=
 =?us-ascii?Q?VgQ3XTcaGdJLSU19FPScUr2f/+5yxRYqnix3uO8g/15gkH9P50ycVEb97Yb3?=
 =?us-ascii?Q?eaFEJ8y2dksoOsRHZ/BQIFkA5hgr9fELZ2UjngHXklPWySChZGDoTaCOkiNL?=
 =?us-ascii?Q?h4IResc41YxnOWmSEhzZjy573SnATzYKpmV5qmPsyPtYNFxAe2tjrbA7kLQD?=
 =?us-ascii?Q?kGThXeuDetVOXfTI9Ys3VTGHpkIauvUUuE5l5wlju4uR6Yl0NyAz55esgr+9?=
 =?us-ascii?Q?s57jBGEDDGRumB8PKY9npdyM93ucUk6bntdhEnarErtQhh866aaifx5yUhRm?=
 =?us-ascii?Q?c+8oBfF2Yihq7w7s+8pG3ETQrDHPjZ2OJrFkUWAlvRQ+9OHrUi3EUxOWwrjm?=
 =?us-ascii?Q?/4rwFPS8HML81/E1mwyb3NaMcgS2YT2PLb+glWujuboc9gkmDPzY9J9xB2H2?=
 =?us-ascii?Q?ntl2gmtmiTzSBTVlL67rd08yMkuynpc+evdGv15FL+eLyuEGSTQqmqTseJiW?=
 =?us-ascii?Q?RryiGEnkJl+MOO3BBA6UkCT2SiKFm5lYVUStAhjXcA1KjcDINR5bcnEdlEng?=
 =?us-ascii?Q?/2BNHrnXPB8q9jm4XAbHq1r0M6ZAQqtRjB2l6gsZvO+DbEdC/mT9MIan892p?=
 =?us-ascii?Q?VYmHJIzjREIPTyU3iNDPv42tgmaoEWOz0nRuEeCGfT36f2MVpjA3uysjJPKV?=
 =?us-ascii?Q?BEHZl4Pc8aXwg4xqvoN4n5feWNqGxU2T5/yDKNfnqCxdXzZ2OAcmid0gfPDV?=
 =?us-ascii?Q?+xnzhL+OE5jzN0gB7/5JwqIcyPu5TNMISbpJW38qLe97PbCL/9AHTKQ3KhlD?=
 =?us-ascii?Q?TlmVuSQzA1u1oJCccZCEsCRTG1lzmqIFWqdBv+dhISQ8sgLE1y4ddGndUEXT?=
 =?us-ascii?Q?VsB7MuZZgX8y42Zb0Gvdb7JcSEJRXUIHy+mUCt8XYaoozYqRDYh9W47p8cuJ?=
 =?us-ascii?Q?Uzn37chtlbSd5JVB4SVr5yKXro7uWozXZUCpPPFmf5c5+QjQ83MDp4XDmw5a?=
 =?us-ascii?Q?EZoxw8gPSkpthvfbiTBRgUge9xLVoQkJO59o/2BmCsnL7HoRQNzfaVkO1IzH?=
 =?us-ascii?Q?r2JJMAKzE/pc8Y5OgY1hVFMgcK07356W8mo5YSRqMPLDx7+63+NlgaLneHPU?=
 =?us-ascii?Q?Xhu3LB+WdEqXoIigk9QyZoB4azIMZWwRmx8yWyunLk5VVfSHMw2TR1tw5hDF?=
 =?us-ascii?Q?L68knxAC04Ivrps5gVSZiHilmhqqcJhz68QC0O7mL5OSCCwV8Qo1JZHF5Tsi?=
 =?us-ascii?Q?DMOxd9q7q0P8V8ICoXmwgT6u+goy5NrWAxYaWr02ZjfYZSHpzJJwIgDpLEFq?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd10fc34-0e8f-4dd3-929a-08db637161fd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 13:58:03.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJbh27Eb7eC6dJsFfQHEOWg+LDR69zLZg9b7RQtnqhoUuAbUpoJxvK3P7zEcHcqw4gS8SfLZ5p6nss5J/vvJ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8559
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 13:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103099

From: Niko Mauno <niko.mauno@vaisala.com>

For instance on Debian based host OS 'python' is not provided by
default, which results is following error when trying to execute
oe-stylize.py script:

  /usr/bin/env: =E2=80=98python=E2=80=99: No such file or directory

Update the shebang to explicitly reference 'python3' instead of
'python', which should make the script better out-of-the-box
compatible with larger variety of host OSes on which Yocto based
development work takes place.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 contrib/oe-stylize.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 1ef6391b6..1fb0a5bcc 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
=20
 """\
 Sanitize a bitbake file following the OpenEmbedded style guidelines,
--=20
2.39.2


