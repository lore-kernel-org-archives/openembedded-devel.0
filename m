Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6268CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:41:27 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.131])
 by mx.groups.io with SMTP id smtpd.web01.5288.1761741683694169540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=2tohowSY;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.131, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+Dnh9E3XCXOSnQ7gfCKdrkhReLSKOtEVHVFSH1zKwpxuDJEdeIFUh9FwPV31Vl9t4LvUW+7EhNav2DbTYv9iOSjHIk6HY6XSIOFHXAjDeqhCmTCy8AAxQkXRn7UP7fUYltOSStyPr3D27/BEHyNU0g33zoiSdKsF8pp2nmUTSoCEZCvH8Fi7J39lHIczmcUDQSEgkSRxRDtC1OE9sGAeZ896g+Mx4dr+r1I2lveoKSh/kob68aDK3XI7cXwu9ksgBklbEkc/4AG/ZjOsx8hvCRp3I6RsmS+lCEuCPTLI/qiUQoWnJrDjQ3mKpYUVptrLRIFa3k6bRr2t24UC0AhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvZu4FsNc19cOsz4otmjpEalUSn7/HaXcaS5DVH6i5g=;
 b=ibP6Ozxz1Cx22Vlz9Ilcu5neDdYvZK2AEilpR+/FQbtpPxVlcsBR5WSt7mNoJAO6pPJPBBDxSS22IH5BBKOr2J69bj+FG9MusqVPeMIX1EOeMXurM7PJ8ICctCQOZev5c+uo3TTFmGeS5Lc5p7qjZZkfNnGGNMf6YmV3bTnouwKyTLMoLWtfEPW+1B44v3RbRV0eRZYxymK17fY7KslhNv+3T/02/syYE59XhXpjxuz6LmQr5NO3g+iYemVX/Dfw0+MUApWfEjmfJpriXM/ZvZNM7s5kcmlh9EyIZowlISN/6rqRfgKKWezH+CLkRGk4axfs0vN7niNooyBiWdgr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvZu4FsNc19cOsz4otmjpEalUSn7/HaXcaS5DVH6i5g=;
 b=2tohowSY82Yas25DNg4Tm+x9iFvV4nGtPMIklSabWLWgHqzLWH58Qa020TlReWdvBGz9phk4V4G2p5sw7lIoZfQFoj6o70xxdKYS9nYZFgzM0gIHDJw1f2uoxQQ5OMNRdnkeKxMYwKgx0FA/27VTuXEW7TCUwsr4HxhVoc/cFiuq6bQp6PgUdql7CX0khVZNwcpYqXkVIv5LyOATUHusUCaqVVc+iMZNqHNk8Ce0lU9ruRAsMb5o1d8BpY/PW+eEAPINjhGngo/po/U5F9aHCi1NznCOy0QI92mwn+Wdg7FEmNqrRw6UTkdYZ0TEwCbbTSxOffUoin1DXqXttqwZyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 MA0P287MB1737.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ff::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Wed, 29 Oct 2025 12:41:16 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 12:41:16 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [[PATCH] imagemagick: add 'magick' binary to ALTERNATIVE entries
Date: Wed, 29 Oct 2025 18:10:59 +0530
Message-ID: <20251029124059.3270770-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|MA0P287MB1737:EE_
X-MS-Office365-Filtering-Correlation-Id: 834dd58d-0c15-46ea-c0ec-08de16e87396
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rfnD9BTRPY3wJhNLh2zWxn2NGrTYMGD9gn4ug+OYj/KbVpBinQBSTwnTI/p8?=
 =?us-ascii?Q?Bw/gf92tVbKZYCvJDvJIjXYlRYsqaNgvmR0zijXjrHtPopuqWxwzmhoawMco?=
 =?us-ascii?Q?IOm8QRgixe0cNEJowekaX+C43y+ps0I2vTgTOJW/qkDO8gintDZzKvg2LFMC?=
 =?us-ascii?Q?aH6SGgCSor2WK3KJAqfKPBOuV7Jn37PHUbI296r5laHYhJYnUVmFQdWUBdS1?=
 =?us-ascii?Q?NmkKQFSddTqCP1lr8x2WZa7NfwvNOYCfe68hA6QOwLQaSusE62/GkJAn7fDc?=
 =?us-ascii?Q?BjdsV3KacXvYXq3TxVFAfVgty/nV+B/DYT+/Yeiug0Dp+X2b5v4Pr5eQWBP4?=
 =?us-ascii?Q?18eAsGzEeo1obztrGtPH3GnJDTvRKa1q5HiKBoJUEIQ87zkcxQCS852Zo4bF?=
 =?us-ascii?Q?/43N0ZZUTvaFJMDlZTT16AgbGW+hhNoz1Fk6BeZGftPdaSDz1FM5O6bczz5h?=
 =?us-ascii?Q?NRblk4IpS495gp3Bxgl9OkbZksKD8T1CAbj3V9hUEYReewoekRjNSXE0PkeX?=
 =?us-ascii?Q?j6tkdrHStBXk2vvnPY3QFcSwcBji9yNPMO1wpzO2ViTovUr6h/27h1g+4Vhp?=
 =?us-ascii?Q?xfESMjgOWKC+BFBB4YXWA+w7fHghFY0l9E65+s/z5I8Dcf9tvl/fHRDq7r6D?=
 =?us-ascii?Q?iXSh2GCEsaIlXl40Hq7fSUyrBW0XATfKrgqsbgObvOaeF+WPzsBWY7QPrJVk?=
 =?us-ascii?Q?RS6dhvBh9xtf3zW+iLv37KMmznNdUESEbRCiaVpcxdm+aX7DCEk3THe/Sf+s?=
 =?us-ascii?Q?fX1199p/L3XOowE9Ma2YlPc6c8f59YWCxnxeqrb/Zw7sojRSmggJDjn4qUpt?=
 =?us-ascii?Q?NfpJCrz4vjTw2/Hp5LvOtNZoU0q/sbrIFZf8aCsc4JexZZ6VHIrYBw9gQYpo?=
 =?us-ascii?Q?nxOsTeBogJYuccBzsb2oXktHUaW1OgaK0XDHy5Dn7IrKKujkx6OLTI+mytZQ?=
 =?us-ascii?Q?25bVqKCqivlkvAzmqy7ONCSIQmRpsricXddgANqqb1xCjaPyKToAS1Y2Yx9H?=
 =?us-ascii?Q?/o4Ev8CtTuPLTGmP/zm9kLqM6lzEAmSvjqDhwNiG9T5MfPcRrtakADO8FThO?=
 =?us-ascii?Q?uNHaNfk+okmY9jY/BDFoJKXM4tFHhT+IFLPB49nX+v39GQCq7EFx3UGxfr4d?=
 =?us-ascii?Q?rQgo7Xu3BkaamYx/vcwIEuPNChSmh7TwCBDniM9uKSRz1SFwAy0swKEwsz45?=
 =?us-ascii?Q?k/jYZ+iaSAIsE/isLRarQug9Cchwl9H/nqHT4EWm4PGx4jXVD2FDTZ3lp4al?=
 =?us-ascii?Q?7lj6RdUjGKR9zCEMxLHjozUI4Z/vXJPlSOTpr+eGYXsGb8rXR/cWzZrwlrNr?=
 =?us-ascii?Q?qBGGBtazRcGxkd6KGU3cpEO8DWRydU0CUrlct6AFueM/V7caGZGAjYP+HcpE?=
 =?us-ascii?Q?tMYnH3u7BgC4nOPWF7pKO6WB69Ui4oSd31k8HhDe9LkiP4pXvLaZ0R2zqEx0?=
 =?us-ascii?Q?Pz5qTd/B8SoK/v8GMYTz4jqmNAIVIery7VBeflcVVPlCLZk81hK1Q9fYhxk0?=
 =?us-ascii?Q?kr+ZCJz6CjqqAyOR5dx5+GtojSdvj3haVH6Y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vaGlzNaa5IVZKrl5Klkxh3tZc2EVdP3/fmQr82j/kiq3ArkjrAvKK6l+fRzm?=
 =?us-ascii?Q?56HaTVT7ECBgYspBdD38fPBphwg+bjLjBvaYqHwrSrzO43lhxLruSMqd54k4?=
 =?us-ascii?Q?VE+SJuID0fC4R0CsiYJA8pDxZK24vkHMYrSSUOrCBK1g7GwmVavQnhLAFCOr?=
 =?us-ascii?Q?o6x0EJ0fRfLxfC2x2+DDoJo+GI+a5a3XtYmRATbe69k4MhvBvPUflPv8BISw?=
 =?us-ascii?Q?N5xyOd0H/4rPhrpwrS03DywNOyFp0efeTrB4Lgqq22xHzcFVGreeR+1rMKaN?=
 =?us-ascii?Q?+4TecHrnAkzDgqlFy3Lr9BmUNYU0aitzyhe0avl3KIXn8TEzSgPe86zjuHMN?=
 =?us-ascii?Q?A19vrN2J2hO2ejl2y4Ivaz+dNgW8eURm5ObbjI3i0x3RL2UrrcYmIL5+oqIZ?=
 =?us-ascii?Q?7elvwPfUtBpcdylbsj9yYbpjVnMV6mF9picb7x6bzvjLyWfKc0M8W26Z0eGy?=
 =?us-ascii?Q?Uqw2RR6Ze2LjEe2Ag5bwm/rBHqxJBepWy290UzRSXT4HEYAMtRzxUx0j8HNU?=
 =?us-ascii?Q?dqgFjM8jjfLUi35rSV+4gDlHaIqnVfF1/WOkqEH4BCFhkzW30IMPY0CgnX6m?=
 =?us-ascii?Q?eYhHKAHPH5j2IE9Ni7LixLWAOc1D2lt/NpkfS2estdmAl3MtwpN3I27HtA7n?=
 =?us-ascii?Q?aLjG72vO4C0nKXPgVYppFTUsSQbgsx2oBXrVUJFeQifNcRQxecK2urEiIJVH?=
 =?us-ascii?Q?LVFRi3SRUWU7gItFr+ROwdvDgDKmou3HFUB3pJV7cyoYe5w04cF/OwBQ25Mt?=
 =?us-ascii?Q?69WdXXyOcv6dsaxACfq23nttcSVL0TR18wgMLtLYg7Ahtvl+t6o2BVNpkzj6?=
 =?us-ascii?Q?L+pXMjApnT1Vz9vnPoowIkwvYc7EwwFNm4qsfN17Uc30VATJY9eSF7kbYeie?=
 =?us-ascii?Q?4+l+VXuYbWp1pPUTeazBLfZDEhexq/6P8HETtQMbOVU1n81MlWHdArYvG0G5?=
 =?us-ascii?Q?tyrqJDszxyAv64bAE4u20uw+ZZq96Bx3zhF5EkE8lwPky7FuuId8UjYtBrsr?=
 =?us-ascii?Q?HcPKauKavYgxImysmProwJE1XJTMGnpRiNS0DNE2ahHLQzrQONOyq7JLpqDE?=
 =?us-ascii?Q?ectwKkPGwGYlwZL47TkXKeQAhWb8V6Y5CrVID58OIwptVu9W4TJiI/ssfT/Q?=
 =?us-ascii?Q?1rTIphoo0xotHYoHlRUx30rxf7AMDhh/tgyZkkxG92V3stt1rf110Pdvsc6/?=
 =?us-ascii?Q?QxB/VyF1ErnKBPiptyoLs/tF9UI4Qr4dTtH2ljYTh6vA9B7EduRIF8sdVFl2?=
 =?us-ascii?Q?pe1btm1WbNeHL5Hf1+s2wzLjGXXDz+K9ussM9t3FZO4zBf5qliwEfMBeyGp/?=
 =?us-ascii?Q?Mb4ykpmtYtHgX6Kkwl4FYjXJlDe3b1kGppq8zBauYjmswqqouoeiwvN/trqB?=
 =?us-ascii?Q?pdFY/Kv+DUgZ6OoKedIjb8E0Xh2oVzwMe5eOzdNPESEy6YdO5r9RmW/iijQO?=
 =?us-ascii?Q?JIsMKokuDYrb657QMa+W+zKk0iOS4ivAwc7+n0AV0KzAn4r4NGjjyqUivuqT?=
 =?us-ascii?Q?he/WxFbBXSBUmcpplVAq+2qwNzsnoRIUPtQqiCjuE+gF8YETm1rKm8YUZhc7?=
 =?us-ascii?Q?zVkrBS4LWyZmBETy6qrrpnkquCKROU6R1pTDhq/cHfq0HvfIxp+LPo7Tepi5?=
 =?us-ascii?Q?ksI6+IdTdzaH05R4QRKKvP8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 834dd58d-0c15-46ea-c0ec-08de16e87396
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 12:41:16.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wxt75EgdxrF908SG+SCoawHi43Jr7NooLPyT9FnHAAVcHlpsf5Kt85argPjvnptVWa/31OE2Q2vJHlrBt9jXpXg08xbZIyH+R0GiTP/G+O2npbXVRjTZP2fvqHm1lw73
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1737
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 12:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121147

The ImageMagick 7 suite installs multiple tool symlinks (animate, convert,
identify, etc.) each implemented by their corresponding *.im7 binaries.

The main 'magick' CLI wrapper binary was not included in the ALTERNATIVE li=
st,
This leave '/usr/bin/magick' missing in the image causing scripts and ptest=
s
that rely on the primary 'magick' CLI to fail.

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
index 38db556e5b..11e18b9e81 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
@@ -76,7 +76,7 @@ BBCLASSEXTEND =3D "native nativesdk"
 ALTERNATIVE_PRIORITY =3D "100"
=20
 ALTERNATIVE:${PN} =3D "animate compare composite conjure convert display \
-    identify import magick-script mogrify montage stream"
+    identify import magick-script mogrify montage stream magick"
=20
 ALTERNATIVE_TARGET[animate] =3D "${bindir}/animate.im7"
 ALTERNATIVE_TARGET[compare] =3D "${bindir}/compare.im7"
@@ -90,6 +90,7 @@ ALTERNATIVE_TARGET[magick-script] =3D "${bindir}/magick-s=
cript.im7"
 ALTERNATIVE_TARGET[mogrify] =3D "${bindir}/mogrify.im7"
 ALTERNATIVE_TARGET[montage] =3D "${bindir}/montage.im7"
 ALTERNATIVE_TARGET[stream] =3D "${bindir}/stream.im7"
+ALTERNATIVE_TARGET[magick] =3D "${bindir}/magick.im7"
=20
 ALTERNATIVE:${PN}-doc =3D "animate.1 compare.1 composite.1 conjure.1 \
     convert.1 display.1 identify.1 import.1 magick-script.1 mogrify.1 mont=
age.1 stream.1"
@@ -118,6 +119,7 @@ ALTERNATIVE_LINK_NAME[montage.1] =3D "${mandir}/man1/mo=
ntage.1"
 ALTERNATIVE_TARGET[montage.1] =3D "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] =3D "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] =3D "${mandir}/man1/stream.im7.1"
+ALTERNATIVE_LINK_NAME[magick] =3D "${bindir}/magick"
=20
 CVE_STATUS[CVE-2007-1667] =3D "cpe-incorrect: CVE should not include a CPE=
 for imagemagick"
 CVE_STATUS[CVE-2014-9804] =3D "cpe-incorrect: The current version (7.1.1) =
is not affected by the CVE which affects versions at least earlier than 6.9=
.4-0"
--=20
2.34.1


