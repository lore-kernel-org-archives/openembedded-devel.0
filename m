Return-Path: <javier.viguera@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F91D21267
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:19:13 +0000 (UTC)
Received: from outbound-ip8a.ess.barracuda.com (outbound-ip8a.ess.barracuda.com [209.222.82.175])
 by mx.groups.io with SMTP id smtpd.web10.44340.1729156745289187827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 02:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=UahwX8ko;
 spf=pass (domain: digi.com, ip: 209.222.82.175, mailfrom: javier.viguera@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46]) by mx-outbound44-32.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 17 Oct 2024 09:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faxUQccYWLA0s8ESFkrR+7EY3H/d7yJuwwHuequtNcHls5qUjTv5Y4Con4QL+f7ZkFzfy/CoZNN6FtCcEyq5b+0y49rVXBraD9y2F/3qkwNRZ+4r/oRmMzWPxCZFKTlEN91lFbprE0UTRfF95SfFiBx/lbiSxhnkhY/nE53emfVWhnXwQ5ZmnwRhiVVcMlQE9WNdL/4WmPOIDgPKxivCsdNNFGB26XkI9IU43L0yomv0nPcKTy94YpJSi9N3SEgk8ysFdnwq2u5Atb2AOJp0r3gS9pI9mtbFKWZ2nDiuy/dnwPJpH5kZRSEsOiPv89/LIU2TuN5Tct7BciiQJW3KuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyDFkVq14U571xxK5pl0P8h4U4Z+cc4jbaywPjhV6v8=;
 b=cBU/+klLlFfMly595YfQpE1ybwQsXI9+/1YXbL/dhl/s31jeZiZPaRvYSjYaMOiUW8gFBumtLTP0/zN1eKjcCt/EuT9pb1tlgDI7DSoqLkbEirkAzn2E5Cy/Gl7fxhSvj8wbLQOm1u6HwQaT/LpiuJOw8QZrtLdINKNmcLeKy0AwankZOogDPuc/3fjEJvC0ibTdIiwjbeD8XDuaO/9Z0Bwm5j+5C7HFl2dD2+FXbWY3Xs7sGLEJ3qzlReCR7J0vLDhCkXYIl+4D1V6u5W5XE/w2+/bwN5Lv4EVml/d83c/MNa+3CE1hxxy9ajcbGop3WPyN2i6XcDYVqeWo54GcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyDFkVq14U571xxK5pl0P8h4U4Z+cc4jbaywPjhV6v8=;
 b=UahwX8ko5BDu03SwZNmUALc3438RovT1GCXIAtGBUsKt151QTxAXtjjoMFbyFAftQAJeTguEIk61pcAwQ5ardSuZm97JZJJ8ZauZbEZ1nGwbmmcZZmuYeOzS8+ceC6OtbE/H6K2zlwL0jBRiy0mQCyEHyq0s4Mit7fx4ToNypbVcPkfC1F8uUq0LxAJIXVKnYBH7EdOT1uFJUUOb0MwqCW0Rt7WGL9XFJMGL+YUcPpHIDRClVW5KIfV6uN4EdW1XqyL4gSa7+L12q78Pz1/kocYgxwUWMTRsGSQ+lt+/ZzJd/xMlMY5g8jNW3VHaNCSYwpDDFK/q9RcmjVc2V9o6CA==
Received: from BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24)
 by MW5PR10MB5874.namprd10.prod.outlook.com (2603:10b6:303:19c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:18:59 +0000
Received: from BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::e024:9e13:d386:d19e]) by BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::e024:9e13:d386:d19e%3]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 09:18:59 +0000
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "anuj.mittal@intel.com" <anuj.mittal@intel.com>
Subject: RE: [meta-oe][gatesgarth][PATCH] c-ares: switch to main branch
Thread-Topic: [meta-oe][gatesgarth][PATCH] c-ares: switch to main branch
Thread-Index: AQHbHuYsYtCfpbCHEUyYrfXQ1VUyQbKKrCZg
Date: Thu, 17 Oct 2024 09:18:59 +0000
Message-ID: 
 <BLAPR10MB515676C9393FCADA4A45AFBBE0472@BLAPR10MB5156.namprd10.prod.outlook.com>
References: <20241015093938.1746130-1-javier.viguera@digi.com>
In-Reply-To: <20241015093938.1746130-1-javier.viguera@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BLAPR10MB5156:EE_|MW5PR10MB5874:EE_
x-ms-office365-filtering-correlation-id: d05b4b2d-e041-450c-0e43-08dcee8cbbd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?mYyRajuF1Hs7aRlXFjdKwUdgYhrGa4JP9GzqSsv7R/UPw5A3PN72Y+6taPEH?=
 =?us-ascii?Q?wEUwp9PfzOiwYnyn3ONBSJZmXpdAMx9J9Q7sZsU7zuQJ2sFYrdX6Ym9Td9/W?=
 =?us-ascii?Q?kzxl6IxElUSB8VJ8aDPmlc08riNrwFZ1NAmdiZ8QTWkPEf4LuLQ2V42IG8jy?=
 =?us-ascii?Q?RVahcpv6qHuy561haGfoMeGS3XMfqL8O2PYUWqWrB7+nV0dcu+JEPcmpPlLd?=
 =?us-ascii?Q?TneZXVpAZ43pyTEzpwIVelvF2edElNO0dV2oIIVf+RLpEffwSZ3lwhxXLFDq?=
 =?us-ascii?Q?IuyAGfxrd5I/KebC/H5Bd3pebPaOrxNfQYFklZZgNt2X2CK7ub9tjLOX6e9Z?=
 =?us-ascii?Q?HkTWbONzkfWjMKMEq5yXcYXbYeu4ZVR+yc2+qda42l0hVOqkurlR3DFRCNWJ?=
 =?us-ascii?Q?C0tOEYPQNGoSfYSkWaqZDQAiIEAqBVK216mJDV/vTsjqfwaDqpD1Zqm/MTmO?=
 =?us-ascii?Q?TiuNrHiis+INx3J+xA51YbGNuf46jLFm2iBqHZSjZUdAa0FMuqloteB/TG70?=
 =?us-ascii?Q?LpSMRlaifi0e+EoWoTWNa6+3eE4LOl5QhIeSabb/RuaT2BQvlxsJcq2MY9XC?=
 =?us-ascii?Q?N1I4USO+pu/ZqZpia+R85YzybyJdNaGrNmqf5QgVwIKs03Q1mqKZS308qlA1?=
 =?us-ascii?Q?6EDOprb8UovjOsw8W8EEDOOdf3jnsl3n4unX3uioHXK2WpZszRGbF/YwAh6x?=
 =?us-ascii?Q?kcP/AIAYZ/WyAc+qGvxZoZwKZUq0MAm191fAw9c2Tac7SaYyYSV0WY+4cGuG?=
 =?us-ascii?Q?Y9CNxuQVpmWDFbU5Z0ikZ9UOlJyEEpRIKPyrabKAC6+d5zT8WqUTPSxilA65?=
 =?us-ascii?Q?iILjMJlXj2VNR38Oh6t6Y8AuPki6aGRafhruSLa9wiBwqzMAbUYOrdZ4piFa?=
 =?us-ascii?Q?6JN+zix9KZTUyM1rMuaHM3czeblvIvMLUaaKLyiwEqp3G3CKV382O2U5BLii?=
 =?us-ascii?Q?CTl57fPrlUBpAy37lidUMq7H4tu6CHkX6i2OYLk4R+eCxFtb7l39CVTRgbVK?=
 =?us-ascii?Q?4wSYE8JL5n+Zxdwm6vB94DnW7LJcQ6NxITixzP803+2dLv3gg3hpZnjHn3dI?=
 =?us-ascii?Q?8A4eMq/SHk4siDD9o+DXQU79gNkbxNOuHiU5T1wS1B2ClNWr0zpaHHTZAdTD?=
 =?us-ascii?Q?Bf+H9H16vXqTt4J9et14jZD/fwr3UfBmToFRKOVpY6IU5deOmyHEghhSZL5L?=
 =?us-ascii?Q?PR9f5egPkQsHIerh3sFr+g82rSIMkeSQCtDfG0CPJYfdS3KJ7/sj9VEekOjd?=
 =?us-ascii?Q?s8/v4rDZu8cooci0najNCFhyCelyMSBwW+fCXVoegf4nlpqH3ocf2eNOh78Y?=
 =?us-ascii?Q?z75ANBu5qYl+nrM+3TWf3aA8LXZLwW6BxS4wWjkAnLJ6WMdqm192w9QyDI8o?=
 =?us-ascii?Q?8B/wOgw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5156.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LcIYRfz3ckDrnlIh0IRQ3f+deAiMmKux6evgwDKflqmGwn+u+wAkbcwdqwtz?=
 =?us-ascii?Q?1QW69qcb4uDYKChcO1vvcGOn3yIv33uZq8VGSNw0Fws90fz1yQKM+C/lmyk0?=
 =?us-ascii?Q?dzoTZEKH9la0+3Krjmpo5u0BUGv3lC2oEQKA8GeoeLhRGsIe579kQ/nzFBdd?=
 =?us-ascii?Q?vEhUkySNDRbY1EOT8XDOrX0FmPbu7KNrahWACDuuxZqWt3MTY6gN+wRlOgPP?=
 =?us-ascii?Q?FE9FC6K93t3ykHJ5LowxuWQAMuqkIHl30tEqqakKKTerV3W2b/IPW+Wq12mT?=
 =?us-ascii?Q?zRrnUZAQ6nUB7A+M74QhVdmPkELhffbI4+99XL2KNDACLnG05CMDCnR+ID7i?=
 =?us-ascii?Q?XFEnaasu4L5fQtsn9002560caiadueZfqbBkKvf8mbbxhjv3u7ZDGh3CFO4V?=
 =?us-ascii?Q?9PKiMiSdCyh/XigqWFmWbj9e/r+QLkaLe0Vq+GCKwWhti/Pok+SluNSE4Gwo?=
 =?us-ascii?Q?1+F0tgKjKi2lmTvjRQ3leQoLILompkFwAmrZXGEiIGW1wZjzEY2R+sLFnsar?=
 =?us-ascii?Q?BFmGdDUb5ZiFw3BbKJnR7I9Ms5EivxxeOsUXFWuJ2FUykxegJg8LKiTLsR3o?=
 =?us-ascii?Q?P/gkGR1zAHqlhU0476aS8GoLU9PDYLaLnUGF57Uzvr2sTdZUY2SkQLXKIUWK?=
 =?us-ascii?Q?k/pzZ+LG0opapP+Fs+eIbzxA6MljUN5s7n2BkfDuWkvcUcifYUrKcFVTFQQ/?=
 =?us-ascii?Q?PLdMVjAJOOGBKfJHIPd/zSv/+h9tbi36gZeDEAxTKO2Liro/goEaiWFdanBF?=
 =?us-ascii?Q?DPzpTijMvKaeRvrqlGHe8W3GtwJGLqU/5wJdQ8fKy3+H6QEGNywJV9VBANxX?=
 =?us-ascii?Q?6raDq/u54S7sdrLN4ZonvFzE6d7p9T1TMJ6Yu7UhUPZ8tT1rPtdz6ezfOEf+?=
 =?us-ascii?Q?L7G3Zcg7fh5Y27mQZxeZGDLC8xm3mNobN37150q2zVOzSMVZYLo9sskNE3Tx?=
 =?us-ascii?Q?0XuV+WNSAhncgtBJcp7SWxnuTiJKC5ru8FTm5/FCCH/daiy0c20ePdAWDd1E?=
 =?us-ascii?Q?HAIQD6ZTjNr2G3OVFrltrAnKYX/U8MS0XEjvjsRTYFufyt38WUfvRhVVFzaa?=
 =?us-ascii?Q?u93dzu9GuCA/6eUV6mgsLDHmqPZKozsTXsm+xDkAVp6PvUDrHwMBii9LfE1d?=
 =?us-ascii?Q?2W4CTbQ8XErZqNvCXxKtYgFKwgfmF2UtJO+hWPZwG2mxcFcxsAhMGtvHRAHu?=
 =?us-ascii?Q?RHWySzLetiH3O9pgyaQ7+ic0QP33W4HWm0N69htqjb3kNWqkNGwqnI63xZ9Q?=
 =?us-ascii?Q?FQBMuYgTLADvWc0vjRI3/URk0j9AIJfybKFKfUG+G7f+VbzrUnyFOwkYBXF8?=
 =?us-ascii?Q?LoTuMaax/kQaCP8oBaMlALqaXOl0U6FCg/eAlELHMvSdr0skiA9LJvB3tev2?=
 =?us-ascii?Q?/4Hkr7nr9+2dPPKiaYY5yOk66TXS8p0LIrl8qzNbCKKlGijGfGjGcJEmDS5I?=
 =?us-ascii?Q?zMiMCIloUOzspjm3SFPPJ9Mw2Ye8F7uEMvUPRGJvyyxJ+fIWsbxWkehAcjoZ?=
 =?us-ascii?Q?JaBLwZh7ysfvWa/mdp3JPDGItT3RpAIPIW3JPMKleMmh8gax2+okObAODGD0?=
 =?us-ascii?Q?bQH5Mpi7cKCKEh9dpAA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5156.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05b4b2d-e041-450c-0e43-08dcee8cbbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 09:18:59.3233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrgWGa6vRDBU4u8fj/P04Ce5EYcNJRpuftaJDBFneoatDs5umYsPfDiqYo7uOsxVDtQD1JgJS+uuo+ijzOF75g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5874
X-BESS-ID: 1729156742-111296-12647-12545-1
X-BESS-VER: 2019.1_20241015.1627
X-BESS-Apparent-Source-IP: 104.47.55.46
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVobG5pZAVgZQMMXIJNXYyMDEwt
	TYzNLSIjnZzMAoLTE11TQ1xSwp0dBEqTYWAB3nq+RBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.259783 [from 
	cloudscan11-147.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 09:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112965

Hi Armin, Anuj,

I know gatesgarth is EOL, but this is only fixing the branch name, not the =
repo URL or even the source revision.

Any chance this can be merged into "gatesgarth" branch?

--
Thanks
Javier Viguera


-----Original Message-----
From: Viguera, Javier <javier.viguera@digi.com>=20
Sent: Tuesday, October 15, 2024 11:40
To: openembedded-devel@lists.openembedded.org; akuster808@gmail.com; Viguer=
a, Javier <javier.viguera@digi.com>
Subject: [meta-oe][gatesgarth][PATCH] c-ares: switch to main branch

This fixes do_fetch failure, as upstream renamed master branch to main.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.16.1.bb
index 67dd701807de..0106bc2d10c8 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62=
aa6a47f07a8cd48b006"
 PV =3D "1.16.0+gitr${SRCPV}"
=20
 SRC_URI =3D "\
-    git://github.com/c-ares/c-ares.git \
+    git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch=
 \  "

