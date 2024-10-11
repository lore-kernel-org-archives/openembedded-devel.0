Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A740CEDDBD
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:04:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5928.1728630238730523300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B4h5dU011683
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 00:03:58 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sd9g879-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 00:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTapIj9WmcpcPZ9/A8IPPJ4CMMcHRIG9OIsqfJjsw/Fl3VhnUqfpKpqlBD9zDsUsqIG4YFIXgZ5c+YxuFE/prqKOlxw/UJtPrUzBUXIsmMgAqnz0/LTC+c8XdObm14a6jPc6Z42PuayL2d6Dd5Rdiz4g2QCGcDkcrj6r/FdiD897vZLO9OdLoHM+zca3sHCa2VV5hDBfIk0Izr8QZ1mfMJZxMSeaCva/V6nC2T8S8ISGCPoPeFkOf7FIDqiKNvTA3XyZUMAZv99L6aFvwLg/YGwbzhGLo07XOnD+OUExTMF1kehfmXov1O3+YPRTa8ZJF6HnqOgBJYtbYpVkLdHi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOgNzPY6tfHNOCLJBLXLsRC7HOM5BbP+7YO60EgFO7E=;
 b=aXcpFMmCKZJOi171AlkKjAPmXnqYIvz309Ibugsv79K6VSmmB8egpg3QsUwescF9vNJ82Jhz+ysQhPTeVPvxcqo6iCKlE4c3l3lYL+1DFqXMlTN8lcGQG1+xufg/soLmZAYNGXViZYt8nbdELNWNuN/CowqE+zmyzCjVhqQ8+JS6EvvZWID/k0hjjWtB3etX0QgnqjGh7wjOGhL+l4Y32dFcXGMWTwxaD7oIvI4HIMqtE1pp3yhM/YhUNuNnjHr2vLaK2btQTxkvskVFsJ9WacucCVCqo7Gqvtfi6cJ+Lz+NjcIipeFD26Y+LvwTeZXepv54JvgnA4TwiN2Xy7Ht7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 07:03:54 +0000
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83]) by SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 07:03:53 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] sound-theme-freedesktop: Update SRC_URI
Date: Fri, 11 Oct 2024 15:01:55 +0800
Message-Id: <20241011070155.1922401-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8421:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6fcb1d-552d-40ab-8934-08dce9c2dd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?11wndKsecIc5bylwfWgrqbHfXoISiXaPAhxCpvVS2gWs2YYci/PR3DYCMljo?=
 =?us-ascii?Q?VWbO4QVVPcreCQD5XmaXfMuDRRaNp0SwyU2c6lHbFawQ63Kc/2Spsv08ppd4?=
 =?us-ascii?Q?+sGWNUbwnr0i6AEDVkdKyKtngIPcVZrPVuSDQyWr2vSyMhrp/PHN1v694QDC?=
 =?us-ascii?Q?fq+jgVmmlsK2B6XQJ+D1BRmANlEtcwVIJi9s3k6bLYpeFuPwu43cPuK5i5sB?=
 =?us-ascii?Q?FLd6VksUPhSin7xO/EpftW3KHd1VZOj+8GtvlkYI2snFLIfA6SJDGH70742e?=
 =?us-ascii?Q?NWASqlhny9QWkXgNUWII4Fq5tNQ4CTj1G650YpiB61fxFZGJC2ZpcdoUnFkm?=
 =?us-ascii?Q?/yZUJKOgOJBWDnx90XeSVuo0GFOAUVgSKmlGwL+Dmm38KicNk8UhPBdNdyNu?=
 =?us-ascii?Q?EKrd5WL9Pi/jXWIOP3iy8YaWxljRa0KwozEjH7qGHJFnKW3PnliJ4b+Lt5kP?=
 =?us-ascii?Q?nBWrxD7tFefdRL1MGt+V6QbdHOIq7396kOaerrERLe0sMbtIi7T/yeJX44pJ?=
 =?us-ascii?Q?eljR1BfkMOfr8zozSunFjpIMhNuHCi6teMLyh5IydmkNirmJOemTj5jI2UVS?=
 =?us-ascii?Q?FoYKslgs8Is0lPQ0yK1Oskv4gfaDdq+tLNtXIyZSwfOpK4t4WZlvOPa6WLG0?=
 =?us-ascii?Q?uRskvMr36533BBakDNHt3DeG5cM1wOBUVbLjJJMUKGN81CyZg5RsqCfRtNVs?=
 =?us-ascii?Q?/+N8AjA7ZKgFtoNNin6iXHTzdILvUY3MmFWwGdTuvfqundEu1f1qewR8QJt0?=
 =?us-ascii?Q?QOYhYH3JSOLtUfB0f/sAcEvEjVTQCy6DQHkdha1PbQIElKO4pUvGghZPmwEz?=
 =?us-ascii?Q?rxy1fpCuOLNQ0UbB6m00w2QY73pwJYH1qBiA5VtYnciNPURxKAT/62IHET/y?=
 =?us-ascii?Q?3h6RD8qzZ+ccDvEmUVgLOyzLr8mCQFFYP+oZPc4mzPA94zt2YIiJ7rQ/2OoQ?=
 =?us-ascii?Q?US1vDiT8L8RUPESaDWPkYkj3sd5oLMkS81yYHY0p0DMznq8Ta33lD1eb+C0w?=
 =?us-ascii?Q?wxW8h7a/Eylc/8NhULmpULILhSp1rA5uK7pa31ZAmc11QbNV0vDW6etiNHEg?=
 =?us-ascii?Q?3fkH2FKmNnwKiMTwAZK5XEUHWsNPGVNc36X8x7S0xdQhplpcQMyYxp7iKl9w?=
 =?us-ascii?Q?+vT6OlVJZbBxT5ldZwCi6YfDKsba6CuNsVQRrYd1fUMV+EMn12wpAZ4cGuPh?=
 =?us-ascii?Q?PVEhmS1VkGavlCyfYiutNy21cBzr8mEn5ePD47ZJ3I4EmEDbUqv+aTKyC8Ki?=
 =?us-ascii?Q?FvtY50BM2W8I4tgv14Fshtt1V/qj2GlWNxlLkazgFA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8421.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X4ucLQd+8+gnnF/m4fSA/D+azHqkJYf3PuvucSn6akW7DtKCwkIP+aLfFz62?=
 =?us-ascii?Q?VEERs78sGGz0Dc9XmbV1h61fgv65DXu/Choelxni1v0EDWan32v3ryPHDr27?=
 =?us-ascii?Q?Cx5hnU19X/0Uyl8cquZzzyHoU3YSxONNPdwX9IA+LVx04HTyT4kTRXuM1uVq?=
 =?us-ascii?Q?xtllPOikX5l+E+b0vCUFbt7j7ut8n7Jonf+BaKYEbpiRhoQnYbciwKGx9kfd?=
 =?us-ascii?Q?db6j4nf8RrLuLWfZP6q6OvJUvcBhNYBtBqp7zFZmqK6mWxJpqA2c3qpoThu+?=
 =?us-ascii?Q?nJ86uYZq9NhYVT01/DLcHdpy7nb0KEzpYSrqKIiG0jIOkZgjl6raueWbQXWK?=
 =?us-ascii?Q?rrMos/vkQf+Shelx0dsRN2W7o89v5Tnddx3ZL9PEDWsA0Ju+KEt9DQbJM9F+?=
 =?us-ascii?Q?9jqaSbtEoWf4Q974WN5YclYOwsb2R4sjpem1WdjfkkaPx7HlZR4Km/nqNYJF?=
 =?us-ascii?Q?lUV3vEskfSttwWWwIwS94V/2XnfjMp2xCCG/YZDTvlRdaeqlgRYRhBb9/NPV?=
 =?us-ascii?Q?Fn6vkU9CPiagQBWr5qArqDT/t29P2BkST0tNEaS4o79UqwIoMeFBW0lZFWF/?=
 =?us-ascii?Q?QJsC7pp65j8ub+ECuVlLZbKVqfWcOzgMUvZ5meA6+NyZhr2v8PlCxqgR54Vy?=
 =?us-ascii?Q?VKGdONVu6rpwsOrKbjQfm4XevZbyDZ9z8EgoZC2yR7nn171sDQ3I4tiAkB0D?=
 =?us-ascii?Q?j/qDnJZfGLUi0VU1geFcNuNWdr/3c2PoYuWy7Sp8Yfa0xIe2k0AlNPjSgGKy?=
 =?us-ascii?Q?ixOQGwCnE/IVE32cDVKP61WFZlHGU04X5pAYHunmKJzn26hne2pl+FZ2l4w3?=
 =?us-ascii?Q?qUIvvgtIDmHsf3cWffmNDT515gadTds6pIVhEjqz6coSKiIrngEdsp+b2NIL?=
 =?us-ascii?Q?mCcwest/+YCCi7xTPsU7bKt/wKt+l/wJi+5nxsYPRwLmH5C6zrjlI3Xs5a3b?=
 =?us-ascii?Q?VFheat9tSUVnlWmj/H5er87Ou6HztRsPvWPAHbqWMk7nA2rgwWHR8611iPRG?=
 =?us-ascii?Q?wi6MlIMGtvFUTzz3ke8wvXSgpx50YFEV7meJvj/XcQQ/esLQlmmoCjs0gfeJ?=
 =?us-ascii?Q?ObFmbSSO+UqV96iWl7V582BtyjWVY6nYi5YPKJ+YZPgTMttwiC1giatSjTCN?=
 =?us-ascii?Q?5QTDCeL85nEVnDvCbJnhtbp9ZWEJ5lY6KfhRvni/AVxJOun9rDzo2wYr9q03?=
 =?us-ascii?Q?AJeGXytC20gwFaxIjp4PSXI4VywBVjhmoeEwjIRNLjdpATAMNg0U5LFSypOm?=
 =?us-ascii?Q?U18ww5Nj9umNKDsJ5yF3u6pqD26LAhTjTH1l24CS5qt1pbgSSo8k6JZRPTaP?=
 =?us-ascii?Q?jy5bzEjOEOGAOF98MVfzg8OWInzm1c2HhUhpl82mOKBPjkJxFyhJfoyDMwUC?=
 =?us-ascii?Q?ErUBBJ2/WeeaJglVzfygjndwIwUanJpYjveT5GVxcBUFpDP4TiUAMg3PePxt?=
 =?us-ascii?Q?LUc15NPL1PkWXqhF8/2Gn5+06UmQka5tqRopvHQWljEk545uVEu2SrbN5JRc?=
 =?us-ascii?Q?2fJWRgOvwg2ydlsRxz45dxpYwm31dL55pn6UDjeBJoZqVZZpQxoGL0Z6KLW5?=
 =?us-ascii?Q?4UCg5+Fcj+RlCgzlQfI9ON67D/ZQ8sZ0DaUvcpoCf0V+tEL+yQQGr0VYmAzf?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6fcb1d-552d-40ab-8934-08dce9c2dd5f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 07:03:52.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msYz43a+pRxMrJb9tAzL+vdoPyGqV1hTGWSH4YuYVnWH5JUDeUgbz7rQmzy4JawEb6zxBbftChzl33t63gZiJtpRgNh3WKN1zsd7WEx09TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
X-Proofpoint-ORIG-GUID: xmvIJECDRC0Q2Kz84BD3GibVOnEOXVvb
X-Proofpoint-GUID: xmvIJECDRC0Q2Kz84BD3GibVOnEOXVvb
X-Authority-Analysis: v=2.4 cv=fNxr3oae c=1 sm=1 tr=0 ts=6708cdde cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=e5mUnYsNAAAA:8 a=DxLxgj1Zz3yi28Dz2jwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=742
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410110045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112783

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 87320a98e..508519e4f 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -11,6 +11,6 @@ inherit autotools gettext
 
 DEPENDS += "glib-2.0-native"
 
-SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
2.25.1


