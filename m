Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ECDC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:14:41 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.124])
 by mx.groups.io with SMTP id smtpd.web11.65498.1738919672543518717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Feb 2025 01:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=GmibLxu/;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.124, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWw1LZ1c2Iuo2qWsTY7xuju3BYVnc2JXM+mKo2aPdDG3vZy58CHeKAo2ZNfxWrohBcxpOqe/pjIu8VjRlOBBiVz4FwEdbpONjyHDyNRKc1pQvNYC9Uspw+8gfsQw+nQv9bu0najFy6qwHc2Xoi5f9B1PLvFnGcBBF8Wv8WMv/oZW+UQ6y3x3LSMM+e41ry/0A32l8Z3RN3Zgbl93zYBB5i/BL51II5n8GYxiCHRzA0GSDlHfQX/ezLckJc6OZeoBtZ7KJ9MvSb2iF8EGXOfapb5RHaOYpxaiCZg9EOaz52b9thaL7GmZEwOgABBwC8wXZEcZM4RoChcQh+1lu/922w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRmSr870vm7sgh2THy+xdpRTc5zQ9bD0TMT3KopZinU=;
 b=dL2MqdSkG6TKOm9SPdts/roGH8TVuOFRP3mTKN0/BoCBtDzbx9tb2HMWPV05UeOAynwTvjLmlTIFJS0MHJ2X8IebTX7SN/YpWBPO0udZm4zkspUt6+k3g/7UK3I6waY6viyWnd0/0W2b2i1MIpkrURlWjjIywRuLGge+1my6pfNsCz6FYSTJy0trqJoTGBTvCnzCTakCkyfaHcvjjZ4IQYIIOMgbOf11Y+wnSpQWCtw3u8JJxd8g2KWazaz/m7EGTcYOTDfNd8p2MvD/a83EGAvB753BYPifyzo/sIwk5RDgV9rMwym+4x8UOhsGu07N4gzNVuWC4NUA3/oO5Dhi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRmSr870vm7sgh2THy+xdpRTc5zQ9bD0TMT3KopZinU=;
 b=GmibLxu/CFjkwfudZH8ydqOnMEcTMXc6J4lc/MDNfW8zPCM5t86pQRWv4mOtecxwYAzSCC4st084N4rEv1I9qrJdfzU/8RmT6IMFSawvwzAMiXEsm8u5n4RYkRkd5+3hQQoVxiKHUhXsqJ5mLavkBwcJbhLr0knke70jfghGnsl1/UPBLF0bZ7Y8EJeyJcLEah4MEi+6L2YgnDPzUMD0le4+bIij6mlA7533RnooSCbb8d39fkeoYwjJnIbaEe/F9dS/2lQlYd8i2LvhclBhHPmeiUxqzmErWCqm5FzTGRV/OMLBk0bGzC9erGheHCOtN1qJe9JLmb7o8zGuqJDoEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DUZPR06MB8964.eurprd06.prod.outlook.com (2603:10a6:10:4b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 09:14:28 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 09:14:28 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] source-han-sans-*-fonts: Switch away from SVN fetcher in SRC_URI
Date: Fri,  7 Feb 2025 09:13:52 +0000
Message-ID: <20250207091352.24126-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DUZPR06MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ad432f-8341-40c0-da44-08dd4757d2ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CQ0DFNk3pkE64zIsCD+fFGw7W2k9XkM4fJM/s9HtL6G985WjIoEFU6OkfqbI?=
 =?us-ascii?Q?R8GTmvs5aozwTw4f3UU83520a8bB3ocJJ6zZ/+CcM0ttFLq/Et6rJhialiU0?=
 =?us-ascii?Q?bK+xXKQHrqAJ0tbPqrPMYcbx+bw8PuivnsQL07vuVF4tKreeyVs+9NkxXUlV?=
 =?us-ascii?Q?N10nWaMOUFAebp69ViWE+3ILY8U34WuotRF6RYbg3D/fqwh7cuKxs0RTRQjN?=
 =?us-ascii?Q?HU1eN6khQXyiFw4P6fyV+Fb8cyVpgGoVZyOAGYgRkvgQAMcz1rwvYc+1AUTm?=
 =?us-ascii?Q?4sYJSS5jrOy66Od+meHWV52jwk+KwpUEwFXNXHypIJ3uq05ROxHzaPFRJF4f?=
 =?us-ascii?Q?oHqqcarNR5HVMPcJz5kqvpx1gOVRXeEYwkpYgjrEUZHlNfHlbj51YC6rEy6n?=
 =?us-ascii?Q?Jpox5Wmrfg3V1dpUyMUceXgW6M/WPt9VYpWclqtcdemZLsv5x5ZPuOLOW64t?=
 =?us-ascii?Q?+kVGV6G19Y1ep7SrZheN/piBBtr5auJD5dFDwjFRe7WHqrzZY/AuTwaTiuUB?=
 =?us-ascii?Q?28QtARNp8PZnADOYdPU07ev8zyeAwM8nF2LWwY1HjleoTHfVKdBDaUxetlvn?=
 =?us-ascii?Q?M9Q005qkEndqv52CkGJqe8mFJhTjbxhYFX7WyCXaID9T2kMzCOC57ez071Im?=
 =?us-ascii?Q?OkQHm8WwQyKUkuAYsmYqRkEdEWZf4IDbB24njcJ1o9kDL80eoC1dECRmO/ZL?=
 =?us-ascii?Q?1HBDFCRR0YViE5Qe9c+aIwlJYWWj7C7SsZzuEpqhytiWdSKZRRrQIvVfLSPd?=
 =?us-ascii?Q?yZmkhPgQpAGdZlJrgagNgMgMh5aL3NCl0ckvaGcBlKxLaOvwAHNtw1ltjnwi?=
 =?us-ascii?Q?QfIPYOf0eHtpRwCKgOv4NhDxetCmngVaRSRFnY7BaOfg5SnZhSRlMo5dPVel?=
 =?us-ascii?Q?9+OIzMb9BE78s7+EQDYcaE+29el6tCebfazqeTgGIph5LlYFhS+dXcysbzDK?=
 =?us-ascii?Q?YHLqmlxrsRr0vuc7ChVrlJdbGCEp0FVfqSpkprf0zmMePqfryMY9k5ahsv9H?=
 =?us-ascii?Q?cG/U36sAg7EXAH/2jcE/z2FbtZfInZeDg29re3v7fvT/tQbd/Vs0Wzm24VW2?=
 =?us-ascii?Q?d6gqXS5oS5MXTvPTHZraLEw3F61msA0/aSNvbxlOpIzOZz2vcUPQdupLWWmu?=
 =?us-ascii?Q?ppR0klvWSFoo+z6D+yznw0DXEKgoM21IXWBpF9z6K2iBmWmhikR8ETG7sfvt?=
 =?us-ascii?Q?J2JJLhLkwATprQgONNcx5k49EP0r/DSA8npct/XJwGRPCKpLoCq2sZecCk4n?=
 =?us-ascii?Q?2Pqeimv9mztp5vdCyk93V/QCgNOnR59gP8KbJnnx0CeFd3Wv6tfmeLQ95IwT?=
 =?us-ascii?Q?ipdvN9Jd4stDa/dcGi4t56WfUHsfJZhpnNOQ0iWzEWHAXtYjW1JJQdYLtPnb?=
 =?us-ascii?Q?u04gSZMH8vlEzIHH5eMOF9OgCcrB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JwPObzp+279ECgvYnbRqrikKyPUUq4NdoAlPjHnf7QZaZ/Xbs/y9a5gMMlTx?=
 =?us-ascii?Q?UEdEZa84kxX4BeWqRRUi0bugCBN4sbcht22dVqYbFMW3Et1RYwM8Iqf/Dl3Q?=
 =?us-ascii?Q?ys4Xmb9mglV69GNeZB5+6K9DpsV/JTnO044ZoIvToA+vL90iZLgB9WXqWxAB?=
 =?us-ascii?Q?cCCRXqhI8iYrNaK1zz88saNB0+oy2CO8jX8WV+Ap/mdpY9mdl6SbEE7/WgKF?=
 =?us-ascii?Q?s5+8gwMZBHt60daFLA3NZjq/NccBJrI/3+Jcw2/06cP3MkvUXjKsYUtaaKed?=
 =?us-ascii?Q?Ze9r1HY40VQ8QyiLXd+ngv5ITMauJHUSsUrv1yBKaCN5ckQLX5aWPfkHP/XY?=
 =?us-ascii?Q?IcG3ghKcStutDt72YZqRUhV0yHR+fOZLdt2qevTX8uyAJnDswAdz/T7xZbUK?=
 =?us-ascii?Q?rJkgMrp97pQuVBH6QaMOFgFzLIhECZjm8cvZ/H1HxRUd+Fwh5id3nl5cJOAP?=
 =?us-ascii?Q?pElgPQT3Z4WN6f/wc/OzdmWiM3BI3lq3/a7lhLnykB12toRG08UNMnkjdi9W?=
 =?us-ascii?Q?96DOZ3SyBJEEGOY8U/zqP5aa3C5mFm1Y4eDzrPBSBH4G9FIj7elFcnXyIEf9?=
 =?us-ascii?Q?jF9u99upFJ/YA+1KCx5bUKTPizuwDa0CP5dmhMXWLnaTe6yIzMj6QmdvJEm5?=
 =?us-ascii?Q?+CCfS4zOnTsA3EfCr1R4LsvMjHpS1aSQ2XmjTAD7HyN0He00ntIhhx/5RXIy?=
 =?us-ascii?Q?Bs3dmSY/FzEb2z/1g7OLns+4vCqYSfDv8RoBZHN65GiewHbj9xKMUiBd0lEg?=
 =?us-ascii?Q?/oalf0EoW/oDNAzcNPhhIAUOBEFbrqeMzqpgOyLvL0UBhVYVnJ+Du1yiHknr?=
 =?us-ascii?Q?MtVsu2HN715UFxFxf0kR+53M3vdwoSMgnFjigqOFECWrpg4pFaZW3qywXTnL?=
 =?us-ascii?Q?Tv15RYAHVg7KPO4MleUjvO4QILOfuYAHLLDYVmYeB+2hlA8Jv9lQ3vDiyHeF?=
 =?us-ascii?Q?YQeIOao16Jzn07DQho4gUbuv3uUZZCvt0A9zDikAghEyNdGhMari4hvn0J7h?=
 =?us-ascii?Q?K005kGZlNIOYqXeXU+xvoNrzfkU9q6oHaYmZ7whVyace314qj8NbJ0eQ9buu?=
 =?us-ascii?Q?ZyljG8D3upsUqK9YVxYpHvrrPObJ7tNVeeoi5mnoLK5deK7q1hm8BsKgWomz?=
 =?us-ascii?Q?GojPI9pUorQkW+bKfftV6UbNs7wqCCR8RBTPsOXX2TnaAIKkkOXVOlxBayJi?=
 =?us-ascii?Q?ORdcJ5qvfYT+g7d1Q8AvSe0VuRJTTywvXZfharP6ky3h3UWTpr3eV5M8lPJh?=
 =?us-ascii?Q?w3IX6+QAAGEMAKalCv+FpkTZ3s3HTSLC6k7dMLw7BGUCwafeyWzdUTB/PrNY?=
 =?us-ascii?Q?btBVBzp2DRe/DwypJjPrccz2cwRLcEwDpCLECYXpb0k3M4CMSJ4y1g41bnQU?=
 =?us-ascii?Q?YNJ3yMzhkSJJIX1zIywjxb65LD/PQbVDxbhxwYBPa2uarifUL5ieE6X4efyT?=
 =?us-ascii?Q?vMcVyJ+89xnkGMQpXG90b5+VIf349jYkeovKcLZd4SDKVx/oE0RB44cYu79t?=
 =?us-ascii?Q?DCcXc5kOrPHeX8cxF9p0oQznm6DjjIki4Qer6WLokrgLXh5jborLeN/B9Ofo?=
 =?us-ascii?Q?yqIlpHFmMeNS1Bgr1vYnwFsQpoCEzYH7gLnfaw7kSTbeKks04FyZ8NQMgzqm?=
 =?us-ascii?Q?WQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ad432f-8341-40c0-da44-08dd4757d2ff
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:14:28.5475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kmgii2DTCayIcGF4v4SGFkSCOdozUXhqPGtcBy5l5YqdGb2nl6JttgIPtx79PHNbRJ5ROod6U7zA+LqYt/WWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8964
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Feb 2025 09:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115306

From: Alexandre Truong <alexandre.truong@smile.fr>

We get fetch errors from the SRC_URI provided. See errors at [0].
svn protocol was used but it's not supported by github anymore
So, an http url will be passed instead.

* For the record the svn protocol itself isn't deprecated in bitbake
fetcher, just github no longer provides a svn access as mentioned in [1]

* github no longer provides support for subversion clients [2]
it was shut down on 2024-01-08 [3]

* The sha256sum has also been changed since the previous one was
for the 1.004 release's archive, while we are on 2.004.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/353=
/steps/16/logs/errors
[1]: https://git.openembedded.org/bitbake/commit/?h=3Dmaster&id=3Da735898ab=
cf056f897c9350bb128a5637e6b4617
[2]: https://docs.github.com/en/enterprise-server@3.11/get-started/working-=
with-subversion-on-github/support-for-subversion-clients
[3]: https://github.blog/2023-01-20-sunsetting-subversion-support/

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb            | 7 ++-----
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb            | 7 ++-----
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb            | 7 ++-----
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.=
004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.=
bb
index b4a598527..391d46557 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD =3D "1"
=20
 SRC_URI =3D " \
-    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/release=
/SubsetOTF/CN;protocol=3Dhttp;rev=3D82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004=
R/SourceHanSansCN.zip;subdir=3D${BP} \
     file://44-source-han-sans-cn.conf \
 "
-SRC_URI[md5sum] =3D "d16abc21f6575bb08894efedbed484a2"
-SRC_URI[sha256sum] =3D "0a0e1d8e52833bc352d454d8242da03b82c0efc41323fb66f7=
435e5b39734a4f"
-
-S =3D "${WORKDIR}/SourceHanSansCN"
+SRC_URI[sha256sum] =3D "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a=
2b2b200a1db4d6"
=20
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.=
004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.=
bb
index 6a4509048..f940478a8 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD =3D "1"
=20
 SRC_URI =3D " \
-    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/release=
/SubsetOTF/JP;protocol=3Dhttp;rev=3D82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004=
R/SourceHanSansJP.zip;subdir=3D${BP} \
     file://44-source-han-sans-jp.conf \
 "
-SRC_URI[md5sum] =3D "908fbf97f3df04a6838708c093f1e900"
-SRC_URI[sha256sum] =3D "dc6dbae3fba35f220bac88ba7130b826c7efe1282f472788fa=
e3628b79be3f54"
-
-S =3D "${WORKDIR}/SourceHanSansJP"
+SRC_URI[sha256sum] =3D "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c64=
4cf9802750c17e"
=20
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.=
004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.=
bb
index 5ab5057d8..f536d1b61 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD =3D "1"
=20
 SRC_URI =3D " \
-    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/release=
/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004=
R/SourceHanSansKR.zip;subdir=3D${BP} \
     file://44-source-han-sans-kr.conf \
 "
-SRC_URI[md5sum] =3D "f8d1bd6c87d8575afdb25e2f46bd81d4"
-SRC_URI[sha256sum] =3D "38fd15c80f9980492faaa1af39ff873d8a38e45027023fb17d=
5b10d4b4b0e6af"
-
-S =3D "${WORKDIR}/SourceHanSansKR"
+SRC_URI[sha256sum] =3D "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f0=
76f10a6a8f4bfe"
=20
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.=
004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.=
bb
index a2b3fff07..0a4aff5e3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD =3D "1"
=20
 SRC_URI =3D " \
-    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/release=
/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004=
R/SourceHanSansTW.zip;subdir=3D${BP} \
     file://44-source-han-sans-tw.conf \
 "
-SRC_URI[md5sum] =3D "6533b71b31c19e548768f0fc963202f3"
-SRC_URI[sha256sum] =3D "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb4b=
d4125b5af59fd0"
-
-S =3D "${WORKDIR}/SourceHanSansTW"
+SRC_URI[sha256sum] =3D "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c86=
38e6ba170de806"
=20
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
--=20
2.39.5


