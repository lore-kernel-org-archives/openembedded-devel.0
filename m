Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEA0C3ABA0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:23:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web11.117489.1726417425533236177
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CxFUKKyM;
 spf=pass (domain: siemens.com, ip: 40.107.22.68, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfwNc1982QGdYnmjLNm3wnkbNHWpTI7uRVj9cZKG3Za+q0YMNEiG4FwFQ1da5USutzD3KubVKn89s6ssW8XvoYyB9r+ZdsSjbvgN17MXEXkVbTtzxG5ml1xUdEKSrGVDlV5BPzQt97Uaq+mONbim8ZbznWAbJFMOvtrGhA8rqtzlQmpP81sigqk+2J3+EuOAp4h6fGbqlhc1ePZchsr0SHB5YWO3L0pZpDDSdXJi/N/fOADfKMcvKzuV3/eWn1eEXiUSWqrmupHMoepdHpwgIiQ/jSMSiW2E/pDhRCmUXy6tNafTWDtSFpkyhZpNIqMwEAwkDTNgoSlv7jDn/NlKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBeN4jLDKTNFBN+YiafRC/zE9GgnBNoYooUjseAcMqg=;
 b=lCQ3en6+qIohqBzyhUJ7aYLNnpcuU0KyySaNY+4qRH1wFfd2qkST1nvj9xNV8PlVXX7Fm+lfkM6J6XzzoHY79iaXWzuNxm2I+UkLyhOwZUsO1B7kFYUd/g+BQFfEhBmXZPCkloj1kiQhNLREVkf4ivKC10M5ZrjIvPvJpzeDv33laJvCGezUjy05gPnGhkEsm3RJy73AouVYK9L8FV7Mgq0RaUaPvGCzXUl7p9y5dxYsSdkKW9sOWELX3vaHa2rpyENsuebFHjLOkbiHeAiczdyw6rYXKiinAvnRM/UNNXFiT2LrcaraGFHjZlUzFrQXy4HVCsxnovCdFN1XeqTaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBeN4jLDKTNFBN+YiafRC/zE9GgnBNoYooUjseAcMqg=;
 b=CxFUKKyMuaQ7Vmcp6h9Wc4ZwdWtDJO6AF7quIwlpX/Z8SRkYrlAbc7RdlEQKXxCh00mIaTzxz5CujmiDTWRaHEZdun/Z+k9PxdZLIXIzDbLOxsv9RL3FN6HrcPSk1BhaFzeVQPVkX8i+dcPxFcxDB5c3CLp2qAnrz9erIDp6N8q0I7cYNk/r1QQ171QuYnGZqZMzFYeYlQbgbtlEzEo33eLl9KN8QjzKGvkRQFieHTH07pu22tK4dDZwS8HNnz7OmLSc38lsMAY+HJswb8wx2A1vKcsSLD2ju+RYQ9BMZLbva/uYmeylKc7doS6FM5u53Lv0gDKIDB6chobm9k+ksA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3751.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 16:23:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 16:23:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>, akuster808 <akuster808@gmail.com>
Subject: RE: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch
 CVE-2024-5564
Thread-Topic: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch
 CVE-2024-5564
Thread-Index: AQHa7zkjFQX3WNhJ20yEVXk7293Sp7I5VJeAgB/jw/A=
Date: Sun, 15 Sep 2024 16:23:41 +0000
Message-ID: 
 <AS1PR10MB56977C6938EBC9991365DC90FD672@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240815173155.19658-1-peter.marko@siemens.com>
 <AS1PR10MB56974283132211A6A50B51BFFD8B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56974283132211A6A50B51BFFD8B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=16902ff8-6d59-47d9-8135-6906e68b2b03;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-26T09:22:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3751:EE_
x-ms-office365-filtering-correlation-id: dd0de944-58b6-48cc-f812-08dcd5a2c36b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eMd+nWLOcNLEXSD2GkYGhSq4iGJdfqnK0X9YXHeAZrQVHHSMsfIu7M41XYo1?=
 =?us-ascii?Q?NNzzZEavkvxr3Hu/vslwMyxdyAkpP6bu8d3UFy50bUf8GjOXV46E3p+BpY1V?=
 =?us-ascii?Q?nSOvziMn3RGZl0+tQjclSb2YcZK+FbOFiPWeTT9aVfvMTXVPX++A2qXcPxIJ?=
 =?us-ascii?Q?JwbIg4zQ0d6g/XA23vzzABouUHRC8Ag6dr1dOcXvwgy6ckSeN6ef641Fnvyn?=
 =?us-ascii?Q?urjysOi3BBRrErbAP5ipgCl56wEtCdIbyMkWxgGG7DbeII4FiQJMfAKMY/JY?=
 =?us-ascii?Q?AhUQbnf97V++6lIYfrbH7Z2iB1HtiAzrq6acvIzSWEtwO9cNNCcP94fN2L25?=
 =?us-ascii?Q?Jdde1gof1I8KgGnBMNHHJG0no2DdTHUTolScitRiA4Gs+g2DT6z3GLsx+ckm?=
 =?us-ascii?Q?pdl9Gag/QDLv1VGBnU5ztcehLCGtygBU/wu8Ujtuw5SH4y3IsAFTKa9sSC7T?=
 =?us-ascii?Q?sHVw9Vx2wUxd4I4/MO2B9DsO/WfQUYt+S/3EA6vnClOhmuT9lmySaHAIzlIA?=
 =?us-ascii?Q?nYaaFMSwB0eWVH9Eh59tzGeORsWuhSjAGQFm0LD0WjIhfKQTbzCyfZ501VEF?=
 =?us-ascii?Q?DGknrS9Cb46J+Ig6M9p38wvLUy1XC7lAViMoaK0W0WU+G8OCxGougc4bx7Xy?=
 =?us-ascii?Q?XjUs/zyET2my5M2WRVjoDOnoL8y8CGMRIWVYSq7gZks3XKBKnEicEeN4dm3t?=
 =?us-ascii?Q?7jlWBk0HX/KOqMfAQsa2zULNa3Mlrr5Dg9KPPpVHdXRChl+3JDk92qpllU+A?=
 =?us-ascii?Q?oTE0RKFALbiX87nywHZKajoYp+u1I1Ypaux+bBMlXUhY4jU6kX3h+swcAX8g?=
 =?us-ascii?Q?tcBOttVPHgWliQcGDDoCcvoPrffDXBN3Hd9+s/X25OzdotptXy1tw/qGgLP5?=
 =?us-ascii?Q?ZMyeZX6Vuq8Q6s3sGglZ3K3ojX9JHZX7e4lAKJHjcHwpGyudoRQgRsWivm9w?=
 =?us-ascii?Q?MYRUcb10NcmSNdCVYGM3Cu71jbl77Hfma9VRHDIO/DUxd4OninP1StcbC1Q4?=
 =?us-ascii?Q?tW8WHIGzx3dCsW9VzmsTtfPPL+TlujaBw2a0dmVv3GlDj6uY9MCyqeuz2RuC?=
 =?us-ascii?Q?vgjcSQf+mASz/0Uaqx9FLGz1DQE83SrI2NHmt5mxhdmccULONROoo4sDhRZ9?=
 =?us-ascii?Q?ahvj9wbtyRxoXgmuc7emW1ph69B5qErO40ZdA7qseiOLzIeiqoXGQ27+0LqG?=
 =?us-ascii?Q?bSWiZfuw4BFYe0yp7esyqA470wvhEav/iwZs5TYuptJ2MgPZYg8HQCDG07OE?=
 =?us-ascii?Q?3DwXrsOQnTqsJHck+fGjDr8VSK7iHWCpnblr/E7NNhCSe6DPPvZQ51hIMHki?=
 =?us-ascii?Q?bvTZXXOEWT1QCJphthQtxQMs8bbn9gTb0F6e0Wzhbdy4xkIMhC93FJfD7BOl?=
 =?us-ascii?Q?isaUalE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?E8XK6Q98Xd1a4Iwutn8a4zSPz+VzuV5iQyGgaHyaRtRciKUvDtFFNBpG0FnJ?=
 =?us-ascii?Q?wZhURefpqToi/xvFdTxVegNTPpPjjv0M1iMoHJyQmRX81U1V4qKlTiNNjG1v?=
 =?us-ascii?Q?pKH4+oUCTK5A380BfEJk5fxMxSnfwKsMZJk9PTDn/58umeH048mnJMSzRkhj?=
 =?us-ascii?Q?/cC7i15Fhis/DSPpbylpwnq/cqD2rulOWxrDkfMtV+8eURAT5lbm7xe2LGzV?=
 =?us-ascii?Q?JR5uC/MWOtnKraLzdVn0uQ80EqX0cOTC6YSoVlQmam6v6IlxIMYdm/EZG/Es?=
 =?us-ascii?Q?0jrVXNYx+OBlRqlZ7NvPMxg6I1fq68yRLObGNQFx5/9BaosAa9YZHRsZXEWj?=
 =?us-ascii?Q?wv4SdZYu/sLb+A0boVdFfqJFIcIwy+vgxZkQKExMKtrbMXc6Zq97EOYQBlCn?=
 =?us-ascii?Q?sxZwGOnnfHQuBXqR2c2amUjhVfRcBHgmcskc6MQTzhvSw5qbMiWy/KtueytE?=
 =?us-ascii?Q?aIS4sjyXBMOoJVc55v1609UHlB7xWBOzoJoqLelhftxIuFiHjNBK2JWgYqS6?=
 =?us-ascii?Q?Kzi8Fo7+cxjClWfQHSHjiRh9b75CN9JcyqlxWFkVk4wIhut8xSXiKmswyWu4?=
 =?us-ascii?Q?Tymjjet9+l2QQjIZvrl8rTlXbwmWQl9qiNqsHGEnBEmo8Q5jE3PQpOde2xlU?=
 =?us-ascii?Q?MYGsm3t/uWQkwUQ5cE4FbcBHbiQL8rZFGCMGp0E+UPWkxatxFrWsWyX+PHh9?=
 =?us-ascii?Q?dbSXxjZlMR+M0cczT6V7iWnKdwa2pYv44h6u0oDTnIQ/gwftfx3HI7HyNmuf?=
 =?us-ascii?Q?6m1nOaBRV5cvrk+z4+pT+aoHp4jxTFHVyEsQCNc0nJkXwGDQL2KE2KCUdr8H?=
 =?us-ascii?Q?LQiJdCJzooDSibxVqHjUj7drtJ9rBzjIi0ouhyQLUjM05EDoFPSnnN+Z4C85?=
 =?us-ascii?Q?arAZGs8KZkE3Fbw54VpOqSlxescASgeI+cXfXwds8OIUQnNCdekGtYLon3P3?=
 =?us-ascii?Q?rOP7h6SlNvSAd0R9BKlPPpL/GOg48SiKcZhUjowJvgSfrtLxKvGZOrQYIDZt?=
 =?us-ascii?Q?Tf0f4oAfmr/I3vPjUeW3uK7VD/wLaaQ+dg+Y7Rt25EowYvggQJPyDbldtk7T?=
 =?us-ascii?Q?r54i1bUktqTvlQ70TgxegypUMC/DOl497GEm+R/1gcvI2Wait8T3KmCe/9K+?=
 =?us-ascii?Q?7OX20a8Hkcd2E6zeVS4dRg0ihtk3d+3I3WQNCSC0eqJW4Roc9/mKNzC2+FcQ?=
 =?us-ascii?Q?mJBIs3T0T68bJ0MTZKhAQDbpthdQoGjvn3E/2taz+PrRPiAF/qWwJqHr9JQa?=
 =?us-ascii?Q?GiHDxqaFbA33B39HSoUZiy+3C5xHABtjbDmnU27IRDEtogL7yepMxCcliP8C?=
 =?us-ascii?Q?OmTfDOCsZHt6/iGHHbL7Ax/JFF/U/OsPniOoF9xmLWwzDdvtdIIy5HoQsMmG?=
 =?us-ascii?Q?D4aJwq2OCA/wxx3BqrWsJBa177zINfQINcx+2Qce4AO+YKDeT1L4nulQcDcW?=
 =?us-ascii?Q?WVygOi+C9YPKoT2fxj9PfV5TK0i0qRlHWejin5qPdOpGCUfiMKs3K/P4mz+5?=
 =?us-ascii?Q?ktlbMFS6Bx7/GoTgfCzCHx0c9GDLJOK4WFFhFSV7bY5F66acg7Izw4zBO2eI?=
 =?us-ascii?Q?dlFkScrHgJ4qXEM/Z/J5KtMb9qfW14ald39HRGJz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0de944-58b6-48cc-f812-08dcd5a2c36b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2024 16:23:41.9346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0z3vJ3ijm1Yu7sp0ToWIJ5BB19IFpkSOcWr1a04EzpInFSdCRhH+2mpsn6Rza7wQVpFBu0A8oz4IbNCFSoIVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3751
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112303

Hello,
is there any problem with this patch in kirkstone branch?
Peter

-----Original Message-----
From: Marko, Peter (ADV D EU SK BFS1)=20
Sent: Monday, August 26, 2024 11:25
To: openembedded-devel@lists.openembedded.org; Armin Kuster <akuster808@gma=
il.com>
Subject: RE: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch CVE-2024-=
5564

Gentle ping for kirkstone branch which took new updates today after a month=
 and this was missed

-----Original Message-----
From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Thursday, August 15, 2024 19:32
To: openembedded-devel@lists.openembedded.org
Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch CVE-2024-5564

From: Peter Marko <peter.marko@siemens.com>

Pick https://github.com/jpirko/libndp/commit/05e4ba7b0d126eea4c04387dcf4059=
6059ee24af.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libndp/libndp/CVE-2024-5564.patch         | 48 +++++++++++++++++++
 .../recipes-connectivity/libndp/libndp_1.8.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-556=
4.patch

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch=
 b/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
new file mode 100644
index 0000000000..fe7ce41b87
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
@@ -0,0 +1,48 @@
+From 05e4ba7b0d126eea4c04387dcf40596059ee24af Mon Sep 17 00:00:00 2001
+From: Hangbin Liu <liuhangbin@gmail.com>
+Date: Wed, 5 Jun 2024 11:57:43 +0800
+Subject: [PATCH] libndp: valid route information option length
+
+RFC 4191 specifies that the Route Information Option Length should be 1, 2=
,
+or 3, depending on the Prefix Length. A malicious node could potentially
+trigger a buffer overflow and crash the tool by sending an IPv6 router
+advertisement message containing the "Route Information" option with a
+"Length" field larger than 3.
+
+To address this, add a check on the length field.
+
+Fixes: 8296a5bf0755 ("add support for Route Information Option (rfc4191)")
+Reported-by: Evgeny Vereshchagin <evverx@gmail.com>
+Suggested-by: Felix Maurer <fmaurer@redhat.com>
+Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+
+CVE: CVE-2024-5564
+Upstream-Status: Backport [https://github.com/jpirko/libndp/commit/05e4ba7=
b0d126eea4c04387dcf40596059ee24af]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libndp/libndp.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libndp/libndp.c b/libndp/libndp.c
+index 6314717..72ec92e 100644
+--- a/libndp/libndp.c
++++ b/libndp/libndp.c
+@@ -1231,6 +1231,17 @@ static bool ndp_msg_opt_route_check_valid(void *opt=
_data)
+ 	 */
+ 	if (((ri->nd_opt_ri_prf_reserved >> 3) & 3) =3D=3D 2)
+ 		return false;
++
++	/* The Length field is 1, 2, or 3 depending on the Prefix Length.
++	 * If Prefix Length is greater than 64, then Length must be 3.
++	 * If Prefix Length is greater than 0, then Length must be 2 or 3.
++	 * If Prefix Length is zero, then Length must be 1, 2, or 3.
++	 */
++	if (ri->nd_opt_ri_len > 3 ||
++	    (ri->nd_opt_ri_prefix_len > 64 && ri->nd_opt_ri_len !=3D 3) ||
++	    (ri->nd_opt_ri_prefix_len > 0 && ri->nd_opt_ri_len =3D=3D 1))
++		return false;
++
+ 	return true;
+ }
+=20
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb b/meta-oe/re=
cipes-connectivity/libndp/libndp_1.8.bb
index 4d4d3e51cd..70d6abec1b 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
@@ -4,6 +4,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
 SRC_URI =3D "git://github.com/jpirko/libndp;branch=3Dmaster;protocol=3Dhtt=
ps \
+           file://CVE-2024-5564.patch \
            "
 # tag for v1.8
 SRCREV =3D "009ce9cd9b950ffa1f4f94c9436027b936850d0c"
--=20
2.30.2


