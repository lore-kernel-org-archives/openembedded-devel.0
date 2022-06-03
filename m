Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAFDC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 14:30:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [104.47.18.108])
 by mx.groups.io with SMTP id smtpd.web09.7873.1654266648683381800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=SJNTmt6J;
 spf=none, err=SPF record not found (domain: gossenmetrawatt.com,
 ip: 104.47.18.108, mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iE60oPRkGH8V+XR6tLDN9CjXnP6qAXMdYdCXkwcWhVvWgO6eQIFCUwHEZOWHMNhmzfzfhHFik2rMwCdNqnHjJ2d0nvhuv+8XiPPZahpIrPq0MkpFH3RS6fsEO3iEroGBwXqrB9MfSWl7aH2cBBBtsoa3Gv1/CgsbMJjXJPDqJvxcNXzlIlusM6UqWJoaiztGSbalgRUpgYQSJJZBVEsjKqG+hFiSRRsBp1FAgiZz3eTWPeZlOE7njkArkxqngHv8MMk7QoWiZrsPmc9n9OzoI6BO+kCGt+G4PwgFYh7s3DWTC5P6pIjIpHQx/tUFyiXYfH2aXF/q3W3JNI4qcBGCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXEkrjiE4ZWaN7yjGSvlBqS961nS+HMWVdKn8N8OF84=;
 b=YIn8OWwEeKgJkFIgW6M64G/tGW8LkLcJ2YTH3JgId/8cpPYFYSmq4cSLMYX506pTOlCQl0VhdjkRJpFmXHKZYT3pIuObHaBmc4FGBcO8U6G3beZAmdUomfqjwr4FQcRpVL3pCEOEElJ9CZo1rh+RQdRNUdcxQWVT72Bjygv68owm2tve1dYx75Hm5t89OScCvCPZs2Tmwr/MhPd6S5Izwq6jjdv6QrN4iO7KtXb97/xDErCT2NCi/fyCAX2cdvt2dVsSmRoAG6Y7RrCl8Y2712ddANGJwNu2dM19Akfa2i3LmNbzioGl8dZXPcx3mQx3dUpPfhHiRPzy1gcH80inTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXEkrjiE4ZWaN7yjGSvlBqS961nS+HMWVdKn8N8OF84=;
 b=SJNTmt6JzjDC/W/lvdnuWqKVFMO1b4UHs77sT6dQLXvMc0a1BJl1oqIHzANrbNbqnmqx8SRfT2p6b3MSGeHY/gDdbjj12q+5FRMOAhrGz7AyAX6LDkjr7WwGbAItF7fuiCgOdHhBefJBGmNdi+XjT96UwgjxKiikpzZXwmvNEt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DBAPR08MB5638.eurprd08.prod.outlook.com (2603:10a6:10:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 14:30:43 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::d0f1:d547:5fd8:f78a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::d0f1:d547:5fd8:f78a%7]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:30:43 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH] fbida: remove bash from RDEPENDS
Date: Fri,  3 Jun 2022 16:30:23 +0200
Message-Id: <20220603143023.360922-1-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::13) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208cef04-8557-46ef-0f61-08da456da428
X-MS-TrafficTypeDiagnostic: DBAPR08MB5638:EE_
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB56383299287CE6D9D3B210479AA19@DBAPR08MB5638.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jh5oP4v7k0vBTK7OdZ2qVm/gKWivKLeTzkE454upVhZtG6KrECn2oC94SyJzcYI56MC3uOoOJO7tjmt840snTg3AYZ6h1UutZknwCMAJFED1YytbZcnvQ2BbAa44y3bzsbKfRyRyiLNBvaIO2nCnO4eHBpMwAOIeXc5tm0mAxg17+hlK9eQ0Vpz+QJ2jYX575BCoXDS4fDmSh2a8/E847HXc63NrHorUyJHOcerrH0c2WG6ugI9ya4TScJ3Dhvj+xG2fFUWsD6VK53MpFiUUuVe8EzF9yVHvfHGDW1xAZyfOs6c1iR/oSdjymoOd1k8cP1AJMucLn+rvxTQ4YdrJVtQvOfQ3FYvOaBmoilk4QZC7aBM+SeZV30XrH/TbdU+6NtEsn3Oe3orgiYJzt4q8wfxw4b2x8Q3qOvHrR65vvypHMHtpiQPL5YqO4T3Z6VQ4cuuWt2oFZ+Yn54QJSrhbtYb8VkYBK2Ryyx8CkN6mVGzWGaov72zRPMXhK1DRoI7tNf0Q0KYbDtP9OUwActLvj/MjG065XwHI3c73oGtBIEx6INuYvUVCBlZqvMSlDTNnlUjxb2jrtXP0bjBheUaOEV50u4wX5kT2Q2FYNsGgPy9OwGSgxJ3LecOhDo7ZObhVzHlMxLa+ZhW82BTLhQFEiKrYGkw80BPmDx1AnLf0mhC1hWGop5PQA5mSlGqAm0JP/mreMz/H6fcUiCMTei3P+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(66476007)(83380400001)(4326008)(107886003)(86362001)(66556008)(6666004)(316002)(6916009)(26005)(966005)(6486002)(6512007)(38350700002)(2616005)(508600001)(5660300002)(1076003)(52116002)(36756003)(38100700002)(186003)(2906002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RElZs6N1l0ST9SlSTjfGEzz/Ud+RF5GFt9AK37CfGtY1Plv8fLMcJ0qR5AY9?=
 =?us-ascii?Q?Mk1fdwOGFZItjhcdOQbjw9SVqHX9ooj9G4o2lKiRRXQRT50NUlFULroNVeQW?=
 =?us-ascii?Q?EP+ng4DdTxCccL+bYk7BmQfUGqAxDztcl5JfQkrYxJIktzAd2hQ7Tym0BnF8?=
 =?us-ascii?Q?0sKqD/S9/dUDJpXXpN+xTgy8LPFPMj4q60b3lf/Z4uPFEi6c3/SD+UdAg/r5?=
 =?us-ascii?Q?r1RwERlLHN1dfelhwyLvuqxNZvuPGUA7NfWR5YVDa4AD2cC3YmyteLwwb6an?=
 =?us-ascii?Q?2CERvKxT9aCLu7qhN6Ql10Rb4XlON4h91gBRENVcaXSGvoamO8Gvz5vLPnk0?=
 =?us-ascii?Q?9DDUL5dsknIRpzCUBT5ebyPTsf4M94hq56zMwiSVFjfxnRQNG6suc98wGPo8?=
 =?us-ascii?Q?QBh0N4rCeKIOYz9HiGvrAAhmeqbi/zoJ3Sxe46OEZLHSqluGmlW/JU4+W1PP?=
 =?us-ascii?Q?JidxWvLTK8STjUbrzY1iWTQiNI/YaPXSa3Erf7mLAar1lRWXfDwcSl0VclyK?=
 =?us-ascii?Q?yTJmcphtfYABn5jsQ2xTCB5ei2coCvOeZVLmOZImT2Yd4hVvS7mOeUPFJ585?=
 =?us-ascii?Q?ipTzS+Ek3CrI1Y+SPiU4UUDw8GKPSTxHzk1sO9dHJCz5HMXDoSsf3bkXjbyh?=
 =?us-ascii?Q?bXe0xqBURPEzvo8YBZ5hcZYmBu/RT6GG5syYqzqGNDACrKiMiV09qKRLcb1Q?=
 =?us-ascii?Q?HHXLdHTjb6pk8ZPVtPKkoaPmVqa1pSLi5qQ9tktsJ58BbgXH4+rMkpeGeeFa?=
 =?us-ascii?Q?8TRXRJZXbPBX1PVQFnBGK/YiwAP4V8UHuVI9kriJRDmglVBwQDHHXxtmKGHU?=
 =?us-ascii?Q?ZeMpXZNsAeWChnI+sRRnWAJxIGgykSwcCy1QowytB1mEvrvQGhUcFz10shDW?=
 =?us-ascii?Q?IarD8Xu62craqPwuRJQ6hpPNlYDKyr/jIfqmqZ6zETQNFjvKsjzxsHnYxRP8?=
 =?us-ascii?Q?vKygL9GTalxD9FdlwzPIduQV7otsOvTcsLKnjRHo5fLHC1FNB0eiLFi3+Goy?=
 =?us-ascii?Q?YzkoMg+RlHxRmUwuLeccBtdF63H+Ao6h3p3FWTXVgby3aFWM1Ttu1MO59NHP?=
 =?us-ascii?Q?c3gfEMrtjFSv2B1mh1OMy0uwFI9oU9JMiaH67+cWOIxwdMbkygT8TJlKaBZr?=
 =?us-ascii?Q?uR+q1JLj0jShLONy9VLhER4zWTeOrynfN617+vKN5pEj1iBduorgnRfXbZYI?=
 =?us-ascii?Q?UkPZa4Bd/6rOG3823UP3EYc/G6P3XqDoxTqq5aXJx9Mc4OFVTKWPxUWMLElO?=
 =?us-ascii?Q?9rU6Ifntkwf6RKQ8vqvYLqigkf7pCuwP5orkAc7ieIR/5/w1gH1Zw9Gzecvl?=
 =?us-ascii?Q?4y6qdOirDNV82iCRxt+A0Fn2/PFIMabAXEiJEOHXkFAhxg3Syrg1SQ7s/e3Z?=
 =?us-ascii?Q?mCPu0Tl1KtbwfCLYuAqSuIhbe6YgrXRtWf3c21m4ECye03aXxyjsiSgt8pIO?=
 =?us-ascii?Q?/VTKPvjvys4bbJiCxckQRTbSefC8ueJMzLnMKqMOn62PlA7mPFtE1YFEzsAU?=
 =?us-ascii?Q?aG8r3qx5AUaUaZEY+FBI8l/gCerc+zsaMxWxVWCfSRGyP/QePXvX/s0/DJJ/?=
 =?us-ascii?Q?OswH+lF3hyliZCMa0oqH86oa70elHl050HuR+Ms0Qn+i9+jqTo4ctqDoLIUQ?=
 =?us-ascii?Q?P7GenpXEFYddLOWSbUBpqR5aTLzPhgSh81qm5jIVPTS+1uO8NknWO+pZ5mFt?=
 =?us-ascii?Q?A0LKXls+U0VY5zKZU2SHzhTgljyQ4PMinHXOSAyQ2OVRHnpKPsePNxjgabUQ?=
 =?us-ascii?Q?FGX+GFm26sIhq2TOmjSqlC0fwTRa+0oqzThJBot6bJmrbUSfruwd?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 208cef04-8557-46ef-0f61-08da456da428
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 14:30:43.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nf+SB/UgTRH/kCJzJOmm/v55hzSVyZxZ4TXNFD3lAAKgGMHpnv1mA1XJDRPrbvNQb++rsa9SrC4DCBtvlwBaOxe5RFOjoPJYWds7X+hJFUAadUOpB58Jc/CosPR0N1yY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5638
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 14:30:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97388

Basically reverts commit e7bd28f1f5e6374dee813e44a5218022367629a0 as the
QA issue does not exist anymore. This is presumably the case since the
file-rdeps check does not expand RDEPENDS recursively. There is no evidence
in the fbida source code for a runtime dependency to bash.

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-oe/recipes=
-graphics/fbida/fbida_2.14.bb
index bc6f021e6..3d65399cd 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
@@ -77,4 +77,4 @@ do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
 }

-RDEPENDS:${PN} =3D "ttf-dejavu-sans-mono bash"
+RDEPENDS:${PN} =3D "ttf-dejavu-sans-mono"
--
2.36.1


Gossen Metrawatt GmbH

S=FCdwestpark 15
90449 N=FCrnberg
Germany

http://www.gossenmetrawatt.com
Amtsgericht N=FCrnberg HRB 24 602/USt-IdNr. DE815002769
Gesch=E4ftsf=FChrer: Marcel Hutka, Matthias Wist

Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group

[https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<http://www=
.gossenmetrawatt.com>

