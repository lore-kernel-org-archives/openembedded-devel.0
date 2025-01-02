Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3722FE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:58:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5341.1735811881151572809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3097652356=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5028Zf91002632
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jan 2025 01:58:00 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43tdg7btk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 01:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOHc81lJvo3wIAXKyzvQxFAyH/lD1JdlFnkWRdcdXraC2Bo0wQufnqfynKr5EVaueuR5oVm++U0VkLCja1DoTSrs6Pt3Lo0FWfI3dYaL9yYsgO4v93wHIBhQH9gE8NeFwME4PjC/hcFK4217F9f8qrdDfhHN2xSGzoaVgqAjU0VT6VsR6Uw4DLDDXKU4018KITB06JAfr0ivzg4CLId6zwam/0HbfCcZT0POxDoW/3FBnqRAV2ip7fS3cBL104+KYyNoBQ3+43UqM/Bevvt/b5mdl42h7hMg0QwFSC+0pGeSLMIaDNQf6TykW4AUABcD+IVUK2NBaCU1lfrvht6HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzxADcI0Mss9DC7KBpiCacrof7saZdQ0SOaKnnWeNSk=;
 b=VVid96LGtE2IJcHtrb7Cr+ZHLuKZn4pZ6ONL9pU4oUz09ukj6RZ9SbyYiTwPf+v1odP8rUMpKRdwoBEmWoWG4nFIZKbp6t/3kk0wz4gIrGbrYuC6XU/J+M8tby7/JhyQqU8QbRMUJNbGwDOKKOgwhIQT1p+XMQBPmo4EtIv7t4WM5NRW3XNBVxFy+orEMnubumh0AaPOz5b+cvopLK1H+ETeNZkyZ+l/zGhbmKPLFl68ShSxgtRg9Xj7tVaIZRW8XhxeZD/MQJz9RIm6YoWjUeXCWe+y06StqYz1khGxdNzntO3hera6AVT8diwbkpiUW4uDb0jo6mXNcUB6+sGBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 09:57:53 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%2]) with mapi id 15.20.8314.011; Thu, 2 Jan 2025
 09:57:53 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Li, Changqing" <Changqing.Li@windriver.com>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] chrony: fix do_fetch
 error
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] chrony: fix do_fetch
 error
Thread-Index: AQHbXPtt2pUMvpPkpkKTcbTUaria87MDPqXA
Date: Thu, 2 Jan 2025 09:57:53 +0000
Message-ID: 
 <PH8PR11MB6928A560243BFF527B9E20B7B8142@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <1816D71B8D2D9887.21892@lists.openembedded.org>
In-Reply-To: <1816D71B8D2D9887.21892@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|PH7PR11MB7001:EE_
x-ms-office365-filtering-correlation-id: 8f0ff6ae-4875-4079-c0af-08dd2b13eca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?JT2mRa4+NiDQFq4e9HQ0xdtxd1I1Y1umdNv8vBJVnOJOZzwv8jxZmX3Z40OC?=
 =?us-ascii?Q?uXSWkhTG+Z7gMNJfYi2mUUa60r0znX55GXgcZSLGWH+4f51YzUGACmzV4PKp?=
 =?us-ascii?Q?8xOZYNuqWv+HQZ/DjolwIqVRPOJWQXjzTCzDY4ovPfiGdhOZscvdMM0Kqtoo?=
 =?us-ascii?Q?9iWciw4/JDuXwcO1Xzjsfy7a3ulNp+3FDED8N1im/0bPP2RW+6QT5CNLZD10?=
 =?us-ascii?Q?1mBTzN4fQ0rL4L+iPu0Ak6u64afEGtonzG+c/iZ0W3AFaCizoov6zoJeHuaJ?=
 =?us-ascii?Q?lt1/k8HGUY8XqzYvtg9yDC6fwF0DPOQ/Ns6mepYVZZWl+ogbtFaLz6CL3vuh?=
 =?us-ascii?Q?0/9gz2q7FFZQSs/41IjWUZ4qI7BMmKrYtkaDnCci8sRy1hGaWUbvAuisnA2u?=
 =?us-ascii?Q?gGjJAIvXlNvt+jtZyvc1z+M5aS4FpNqFOqPlTcTnCCTT1kULztVy1BU5HFdE?=
 =?us-ascii?Q?fFLW48RhXUtvVLSoBaiDfkX0o1VRd3Ri3TxZKZ4g4vlsfn2cKIoZJ2ZXBMwc?=
 =?us-ascii?Q?fdoO/dX/Ry2bEZvFJlGkiZhq6yFvWO7VYtTw79avK5wKBOvYUPRIxs9ufjp7?=
 =?us-ascii?Q?IE81FUfP6kEio5gsyRZh6XdZ5QZAjbBu66FcDrJdZ9W+ZdBd+FBvc91jTF9l?=
 =?us-ascii?Q?vMLgjVHudummFRDxm7aECHEW6+Dk8dIAHLsg2yQbkjXyVgBnOPjrO4e7K39j?=
 =?us-ascii?Q?Zde/OiLn6dRfZh9+I3Y4RE9qOK+/X+y7DjKXfD3m5k7OwqLsIfGy8memifh5?=
 =?us-ascii?Q?VsISZ6/9MspDV61URQ+Y3xV7/6SjeP+xv8EoKTQN9sZWp663guWWzIz40mNk?=
 =?us-ascii?Q?zVeHiIJKU/LnnTNPrc0aALo7ZwYp8gcnuY0bxWCJsSaTko9U9en5QdK8CWaB?=
 =?us-ascii?Q?5nWLESaho9fA0TbaO6hOPyYeyoahGyoV+TbzXRDXwG4R+j4ViefYZ48iDPCQ?=
 =?us-ascii?Q?JR6GC0fDp80bB+Vn2GNZRgKrDO0jsJ+0GFo/Qb0CuzkMy7/J+Hps1x3sBSdg?=
 =?us-ascii?Q?PzHeYNO2/tfx9gsaBmhUYH2BUdpP0BaYpQFrs5NDAoYNjPt+RZoc4Nuq8KjS?=
 =?us-ascii?Q?GCbsyl+BN344c+4ooP6qSpVDPn1UiFc8YurgagEq5emK4iydBXD9tBbWzASO?=
 =?us-ascii?Q?JHnx1GPawnqRKpNgroeNjUOnBFzVwSo+vs+96EeDkuaNFN3iGlyuvceV83BL?=
 =?us-ascii?Q?0apq43r0fVnLbhbA5G0aJSMnRwaF2Vzz4GA2mtFYfmLcBQrkbt1HoKFGjF31?=
 =?us-ascii?Q?hir9y9rgZ6nYcfJjt9hgatNkvOJz39zlzPReEym96ZOtNmcib/4mMDDljIzn?=
 =?us-ascii?Q?50OC7P1nF19ktweaDcVpzanNnhkXVvZM08k0UjGiv5R7LAEIkqX/OMdjXFvL?=
 =?us-ascii?Q?tVPsmfiuR7EHS5OAueOZRuo+gVnaKsoxL241GkzhweFpOYMqFg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pfkKpeDgyRQVKt8zS2DMyyC9tx0tOWPmlJqAO1BSqQEVAi20+nvwJRzsea5L?=
 =?us-ascii?Q?NHi4bI8mLi1r+w+Kau7VG18PpWak1u3kmiS3K9g5mlnl2ynBcVRcwRb7+uH8?=
 =?us-ascii?Q?vVUSxCwuU+tpo3eyknFNZ29YEYnwrZVD2vZuTdIUg4zzt76zrG50AvXjQuxR?=
 =?us-ascii?Q?SbjwNkyhz9yih085HnzshGcOvPy3M/4WZhn405LxTNpGEaoWCfxRZZT4EyHu?=
 =?us-ascii?Q?vSegvgx3dEkJff+wS6RXgFG/zVyqS9Q7XBa/JzBcVanNFDYleOJbChxZZOzI?=
 =?us-ascii?Q?HC3BbX/QiNRSYwX6TF/qPBrpQy0jhqAAz67ghx0IGokM2cqvw1oyCDeKJGPn?=
 =?us-ascii?Q?H7o0Gur43ZumlqnoQfTqQIe7vTGUWmCxCvralW0pUXZjxio93Uw1oTnaZQjr?=
 =?us-ascii?Q?1RAy8SdMpW9NXi7MtGnXidSV6N8HJtksh8ybnqVWzsf5Zd1f66Kr//lQrQDs?=
 =?us-ascii?Q?vJZxtsc6sJZDUqFF9jnCnWKvpAdBT/7oVwfFTzVgKSDndyE7GrfQzkmWhcMx?=
 =?us-ascii?Q?V96qZQG7vvRWxu/BlTq1KMW46uysLnw6RBR3nhmlKfPPNSKs+YBVhvUwR+3e?=
 =?us-ascii?Q?h6DZylfsGT4HzEhGapL1cyyhW8AFMCxlQgdzF7UOft+WZ2KIbMIQfh6SCn8z?=
 =?us-ascii?Q?4c3IhANhJ1jQFKr0Jh9JrOwkBRDT0jKpL8EXTmNG9Tw3DKPl18Xw/SkhfDQF?=
 =?us-ascii?Q?cjiPnHT63hGE36wV2mkRyz03xArNsQNiUWhDFCwsLhKlqa9tAjLmNYGwC5R6?=
 =?us-ascii?Q?TSLlLFJpN/u2mq+pUUmP4H6QGjZeypB2if88e8Uf9yWKOutooWcz8lDLFI/D?=
 =?us-ascii?Q?QxpdsRQ6xPzj+uobKxjf/d+gMVC+nKwQlfa1JAngVUUW95BPxT68mDE3mVAg?=
 =?us-ascii?Q?MO9Flr/SOUkuObP0XfhfrRpDG1tAqGr0xIBUjf3UfwjW9mEbsA6rJLhfMS/B?=
 =?us-ascii?Q?HzFDcevq/PszIBFofsRAuyvHG96JQYMGGIGZQlBgVngWOhkgV5GCPgbIhAhJ?=
 =?us-ascii?Q?jEaOjrpbXWAr1xslZCbHmnIaRLMg7+/CyG9OCtcKakHOg+hDeUQcJjldVAyB?=
 =?us-ascii?Q?HSQBy04HY97s9eKZtr5343U3laLTGAUP9qbmXHFdRioaqsQ/qLL21bu+n0fD?=
 =?us-ascii?Q?9phNsihMarw/JchhmOK3M0byzxJSyzoIB21sJNUGb+lk3KIhrMOzadM5V2bO?=
 =?us-ascii?Q?tgWU8TY0k68XqLdv6274/rWcCLhNvnbUX3AvcdRQjRxFEQPCUfQ359vSed6l?=
 =?us-ascii?Q?tQ3R7Q6fkFE0mW5sVyyAO23fwLfVHm1gGElg4ufl3dk5sdVGcWIov9IJXf0x?=
 =?us-ascii?Q?KQ2uHthbuA0R/9xeKhHin3TjFVwua+hkyBWx1yfBoF3PCjdOCUVGmyQyxF20?=
 =?us-ascii?Q?T1xh7Y4zYsb8Yhb80nI9+DT0PDK+ypO8kO4mvI+lhUb7SKO8Aai9JhLnEuGy?=
 =?us-ascii?Q?FXA21QAFpB01TRbOxcZsR/jyUJa2Ymhp6DVHprc1Kv/8wrViMrBI26CTNAhB?=
 =?us-ascii?Q?iGraq24QvZBkojhzoGFSMSglEQKXoC3EIE4y8WpgUU90SrqCl3CnwiWWwJ/N?=
 =?us-ascii?Q?M2Ijyh5jjEREC3jFIUsH5MaoRvL9U52akLMTXVxmRMEjxoNpb5Wwgq2GgXeU?=
 =?us-ascii?Q?3BVF2mrVP+Kg2D+7NRg/TstkYmKSsN16EHXVd5Ws095u8KO1H6u3/0g7rubp?=
 =?us-ascii?Q?HfWZhA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0ff6ae-4875-4079-c0af-08dd2b13eca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 09:57:53.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T6zk0SQKjsp254yZZGZtYWffbEtZ//MaKoZxIuCFf6GAkSEm4lEAA5K1XJp4zqODSQexJX6kfPAK041bklBrru/FbleoVjt2U/80UFJYqJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
X-Proofpoint-ORIG-GUID: mjuUOiBGARPwr1rmD2VSM500HciQ8IaR
X-Authority-Analysis: v=2.4 cv=AokU3P9P c=1 sm=1 tr=0 ts=67766328 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=dIu3SnmMAAAA:8 a=wxZTIvLhAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=u6pr-mFwru4uCoQ6nv8A:9 a=CjuIK1q_8ugA:10 a=Ua9G7VpiFza3u12uuhVB:22 a=pEOY4cZjM94Q10G0-i-k:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mjuUOiBGARPwr1rmD2VSM500HciQ8IaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501020085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 09:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114618

The same issue exists on the master branch, and after testing, this patch i=
s also applicable to the master branch.

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Thursday, January 2, 2025 5:47 PM
To: openembedded-devel@lists.openembedded.org
Cc: Li, Changqing <Changqing.Li@windriver.com>
Subject: [oe] [meta-networking][scarthgap][PATCH] chrony: fix do_fetch erro=
r

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: chrony-4.5-r0.wr2401 do_fetch: Failed to fetch URL https://downloa=
d.tuxfamily.org/chrony/chrony-4.5.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-networking/recipes-support/chrony/chrony_4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.5.bb b/meta-ne=
tworking/recipes-support/chrony/chrony_4.5.bb
index ed26e5987..ae46ef1fd 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.5.bb
@@ -30,7 +30,7 @@ SECTION =3D "net"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
=20
-SRC_URI =3D "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
+SRC_URI =3D "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
     file://arm_eabi.patch \
--=20
2.25.1


