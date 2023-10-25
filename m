Return-Path: <Sana.Kazi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6D3C25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 08:35:47 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.68])
 by mx.groups.io with SMTP id smtpd.web11.39151.1698222946023525055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Oct 2023 01:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=dym8OGkq;
 spf=pass (domain: kpit.com, ip: 40.107.222.68, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIzEmDwLXAfLlKeIej1dHNrA1oz5pF+0A16nwnbdg/GM6xbJNKZwqwbDwPyB/LhvH6A+YRrNtUB847xqs8nQVQA7OuWkDZ9/sFwcXyo15QfWkrwbWsZzuSpxFCyiuXPiDd1mvQh3T1FYq8YoVrpXQSqb8mib92FGXEpVGAgitkkFc93/NSOEk3ur8wz2MyG1SeZ4PPsPbhU6rEXijsMzqPCtzsRpFYc9QLbssCRWaO9XtxRVzHtXJCy9Eea4lWCEuserfdcrE//nttdMENTDVioHkEdXFvc9uZnzL59ytYByLGwjhXCvy+a5iw45fOZofFkwlDGrjPIdsIi9oih2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt6abx3g/I88496FWYplrNNVlI2PLjutGp69V+xHpwM=;
 b=e3f0WuDz3JTM+dWmZAu82cOoq0pkCxc54dCfN5/9BcHq5kvThulcC4bKH2CmKmWnIJ5zSUn8SJ0gwaxMRcfmryHHwav247TfN8c3/S6/V13k7KQvCiRs/hrYg8Ny6jFQL9aTizC0geBKwEddFcPlIwouIkKmUllBH+J3zP7MHBEkhg5MnqbjcatD7eUBuNn/BzVPeXLGV9Urb1CxP0d4wkMNWBZ+fkIXC+4KjKHAQL2OB/FFBJA4OfqG4dPfkZ+cwPQ9Zc5SNLqmWuCg5M/GTTpMF+VhhJCwfkP6fXK2gxTYrk1Gu4X73/Hv0ZXFmGskZUtuR3J9oVoDOW6PSF3eCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt6abx3g/I88496FWYplrNNVlI2PLjutGp69V+xHpwM=;
 b=dym8OGkq9b8ZPKywUMgTVUhqKYCF4TeSQ8GJfUwbAFizW+4akX9ZNJJw0Wd8/cHRIZXvWiKUaerBIQ85FdnunBJU1PUNPXf67ofJ5AR6EZvf6u7ajMxDuv7eDy2a3qDvzSA6cP2Q2FD/u3lXFzVgxWAa7S6arZairS3NzmTZfgw=
Received: from PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9f::7)
 by PN0PR01MB9098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 08:35:39 +0000
Received: from PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b515:8b24:83ab:9875]) by PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b515:8b24:83ab:9875%5]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 08:35:39 +0000
From: Sana Kazi <Sana.Kazi@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "sanakazisk19@gmail.com"
	<sanakazisk19@gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] ntfs-3g-ntfsprogs: Upgrade
 2022.5.17 to 2022.10.3
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH] ntfs-3g-ntfsprogs: Upgrade
 2022.5.17 to 2022.10.3
Thread-Index: AQHZ4VibNKmIoggQ1kKiyU9ekhyG17Bad1XE
Date: Wed, 25 Oct 2023 08:35:38 +0000
Message-ID: 
 <PN3PR01MB7710D98F880C48A928BFC25499DEA@PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM>
References: <20230907065617.2172750-1-sanakazisk19@gmail.com>
In-Reply-To: <20230907065617.2172750-1-sanakazisk19@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7710:EE_|PN0PR01MB9098:EE_
x-ms-office365-filtering-correlation-id: e1766d78-1be6-4be1-80d8-08dbd5355e00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XH/aZXXHTxjrbTOFir8xaL06qn5IpN+oolecsmI9wF8nvEg/1eQCGBKqCui3P3yRHW0eMq9u2IfnViB5XDEiISRXtdgWBMaTIOz3Jqozi1eWMV0F2UAU5gdQ2bA1B8FAXP/OuoIHcvZuyG4x5W3vnJIsFuZ2nqJ0Mu8XOoKdHWJokPDpnzPWI4YAZlV/j4HupVVGpkRzz8bpZsW7BzF/p9EgYAFLJu7vQyZKT1aS6d2a3H/7cAbk+B29Om+4KBXuIEGBspduq9hUmcgQRWUzsizirUOUOxyYrMvm2bORnxe0+0OgXdkgZz4tKu2LLbIRhBeMkkc91uleom/CGe4MFd0pBw/DocyBBMBRkvaKqCI3kpm9clE5W6q3+crBcsUpdbQYY8iVeG2HdMkLM79ePkSsSksM1k04wAH8RDChyXZYVhGL1iZe7X/lB7CPGRV8DYVvkKUrQgynhZH2hnUELsxpBztw4LuQ04H/De8ApV86tICun00Whfp4s6YVky7JHNpdsnooAMRmCKdYj81zhJ1Mmc5Wsh193gU96Gc36kgv2qDpdwUVzQEs9zLey2r5jQwZEWpJd6vfyqUJAY2pjjQaGnksZ0GFINUV9kL+rx8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(76116006)(52536014)(64756008)(2906002)(86362001)(166002)(66476007)(66946007)(38100700002)(316002)(66446008)(122000001)(6506007)(478600001)(7696005)(71200400001)(1015004)(55016003)(45080400002)(9686003)(66574015)(83380400001)(66556008)(110136005)(8676002)(5660300002)(41300700001)(33656002)(8936002)(38070700009)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?8YUDavKQPNA3JuBUz4pwz0G5nBYA3WxPB9XcGeAptpN35jW28EPQQeJGOP?=
 =?iso-8859-1?Q?wfm/f5NklIOqcOXgfqoeZgSQBbIl6o1TYH1QXBKxeqw6irJOGXJbm+Y8N/?=
 =?iso-8859-1?Q?WgPs4vgPCj+Ew4XjV05rqb0DLIiwx7pYS1Ky3XkYcEA9iwmGLxnE2Kv5uP?=
 =?iso-8859-1?Q?UsXN+M9KYOl4KMP2+e0p0KWieLSFgE4vAA9X7ryv68C8RI3pIZwSc+PBMB?=
 =?iso-8859-1?Q?HKmxmG3/ChMN2rmZS/OfoJdQqrpjsXtv6Xs55g1H9A9LdEIwM7z7wi5hMs?=
 =?iso-8859-1?Q?KW57kiAiYdSpVdWpxxBq1c1dF0m3Yx97vvhRc0sTFz/vg2vvoXZ2ySUjh8?=
 =?iso-8859-1?Q?L3EunKhQm6C5U1zjlWBABtKvomTbV4m9BMas8rwktqB12B8J1gGwnIeklC?=
 =?iso-8859-1?Q?u9SdWU+ggWYdYx9NxW/kcOk2TD9NU8ElBeuSBL7qFiY611zuxNQri/KQFa?=
 =?iso-8859-1?Q?0FlUJ8ljFZANAwZb7rmRRJBE2nYlPP/hgrN90XXihRItTmdZXXii+2tWNx?=
 =?iso-8859-1?Q?uPdY/xPYYNkG93Xe4LI2mYuKw2SP0Gm13CFWUMz4NclIaBF0TBBsnmxo8e?=
 =?iso-8859-1?Q?21LqrdCv733USS6Q8aqRLHL7JVfaHtWDkh/85wI+cmLuxvNrEJgE90SEju?=
 =?iso-8859-1?Q?CqX/uPfDGUrWx0Eo3DK0jPeBGZdwqbhGCZJ2UUu3uGbAl3WCt9mRCHzaeu?=
 =?iso-8859-1?Q?XhyXOAKq+b/c6H49aB6awpyMz9CWCkJS7dT+GaOOBEFvyO9byGA49sXOJg?=
 =?iso-8859-1?Q?YJTFGnmBnVUgKXr8ckFeFhKl+ck5Xw/8PZ48sXPnhxeYCzHaHSGJyRIRAj?=
 =?iso-8859-1?Q?Oj2mYxP4oER6Mw4U5GcMq0NtP4rF0Y1ANv1HfXxyi/2+rweueS/6HO65Tz?=
 =?iso-8859-1?Q?dO1MWoweEXI0AbdinXjm/1+2+7tfEnetO9Ely0opZLUeMpQ4ERoUxDRirl?=
 =?iso-8859-1?Q?wzLUP9LLNhJSQWfCBU1g0qyzdfSxMugF4+dZtmyT3rIjtQV3nJjibpF0K1?=
 =?iso-8859-1?Q?No8KlVL3EOSUIzjoYMZdzGtZtESTbHm7Kwhn1NszsB2RcqCzvwT/luzbdB?=
 =?iso-8859-1?Q?E9K+KE9rVabkYYTJ3pWtU0PQ68M0mnJfl3aHrSk3zhHPDweTZHrGhijozV?=
 =?iso-8859-1?Q?N/9lp81W4tnYp0l2Y5hZqoFmjti8mJgwmO9rRE0C8Sk9g6klIqPOYz8H/h?=
 =?iso-8859-1?Q?SiZSI6/mcP4jsbSow0GULNsUy4we+TxvlQkX4hKSc9WFJE47mrqsiHc1/5?=
 =?iso-8859-1?Q?TUT1/KYvBAtifTNyOHqM+FO6J0vMtkvhHKpkJ4eu3taFe8b7/LGXbX+Rk/?=
 =?iso-8859-1?Q?oO8pgUvoGdmZZA1XcDlR9mfFpiHFfOjbzrun6VzZkVPUjS2CA32z07cTWG?=
 =?iso-8859-1?Q?xXzwaJgx8CNLMakYAGWCXBFbQx42mz178IY3JMTMqs6TRtrKcTMr0y6O6E?=
 =?iso-8859-1?Q?5xckDJlY6Hf4t/fWrIpYj/gb6gPQK2OgPftdtPtGq+HtfJLr/zo+/r/Fzu?=
 =?iso-8859-1?Q?F0lQZInb/ALtgOA/zU+JeOTF4XwMLWg/1gfNG7bgBrMsZ82OhfeMExB42x?=
 =?iso-8859-1?Q?WcQaKZWfz1PPJjIiURGKfeUt3G+CO7FCGL4zeGaKh4iwDFdfh4UAwIRSga?=
 =?iso-8859-1?Q?pW6WoEC8zeNrAYSrsXgk+NLAvSm6NCRJh5NZ7v+uuhEpKCQLSGelfMLnIE?=
 =?iso-8859-1?Q?xiwUC9dRIHNOIdMZU+Q=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN3PR01MB7710D98F880C48A928BFC25499DEAPN3PR01MB7710INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1766d78-1be6-4be1-80d8-08dbd5355e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 08:35:38.9509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0KgcBFJfEQlkSdaGeK33oGmrnmiIk0RitG5mZcnP63T2bxOU+a9exYodxCK9VqY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 08:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105725

--_000_PN3PR01MB7710D98F880C48A928BFC25499DEAPN3PR01MB7710INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi OpenEmbedded-Devel Team ,

I am writing to inquire about the status of the patch mentioned in the mail=
 below that I submitted to OpenEmbedded-Devel and when it is expected to be=
 integrated?

 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited


________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of sana kazi via lists.openembedded.org <sanakaz=
isk19=3Dgmail.com@lists.openembedded.org>
Sent: Thursday, September 7, 2023 12:26 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: sanakazisk19@gmail.com <sanakazisk19@gmail.com>
Subject: [oe] [meta-oe][kirkstone][PATCH] ntfs-3g-ntfsprogs: Upgrade 2022.5=
.17 to 2022.10.3

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

From: Omkar Patil <omkar.patil@kpit.com>

Changes:
Rejected zero-sized runs
Avoided merging runlists with no runs

Fix CVE-2022-40284

Dunfell and master both have latest version of ntfs-3g-ntfsprogs
2022.10.3. Therefore, upgrade the version on kirkstone too.

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5d5e8854718dab02c2737e3faf288f830a514841)
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...3g-ntfsprogs_2022.5.17.bb =3D> ntfs-3g-ntfsprogs_2022.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntf=
sprogs_2022.5.17.bb =3D> ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2022.10.3.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-=
ntfsprogs_2022.5.17.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2022.10.3.bb
index b29716ad4..37a8106bb 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2022.5.17.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2022.10.3.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Ftuxera.com%2Fopensource%2Fntfs-3g_ntfsprogs-%24&data=
=3D05%7C01%7CSana.Kazi%40kpit.com%7C15f74e1dcecf44faeac808dbaf6fba8e%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C638296666670807254%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&sdata=3DuGwpKtNULV3O3fyr8gynGij4JHzOF0h%2F%2FoNyDqBAHSI%3D&r=
eserved=3D0{PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-hos=
t.patch \
 "
 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[sha256sum] =3D "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49=
c789510fd5eb93"
+SRC_URI[sha256sum] =3D "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fba=
e60738f854170c"

 UPSTREAM_CHECK_URI =3D "https://apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fwww.tuxera.com%2Fcommunity%2Fopen-source-ntfs-3g%2F&data=
=3D05%7C01%7CSana.Kazi%40kpit.com%7C15f74e1dcecf44faeac808dbaf6fba8e%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C638296666670807254%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&sdata=3Dy4lfjW6VN8Go8vwIPGapbXmgcYNR%2BKTkY%2BuzFjYKyeA%3D&r=
eserved=3D0<https://www.tuxera.com/community/open-source-ntfs-3g/>"
 UPSTREAM_CHECK_REGEX =3D "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN3PR01MB7710D98F880C48A928BFC25499DEAPN3PR01MB7710INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Constantia, &quot;Hoefl=
er Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi <span style=3D"font-weight: 400;">OpenEmbedded-Devel Team</span>&nbsp;,<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Constantia, &quot;Hoefl=
er Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Constantia, &quot;Hoefl=
er Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
<span style=3D"font-weight: 400;">I am writing to inquire about the status =
of the patch mentioned in the mail below that I submitted&nbsp;to OpenEmbed=
ded-Devel and when it is expected to be integrated?</span></div>
<div class=3D"elementToProof" style=3D"font-family: Constantia, &quot;Hoefl=
er Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
<span style=3D"font-weight: 400;"><br>
</span></div>
<div id=3D"Signature">
<div style=3D"text-align: left; margin: 0px; background-color: rgb(255, 255=
, 255);">
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color: blac=
k; background-color: white;">&nbsp;</span><span style=3D"font-family: Arial=
, sans-serif; font-size: 10pt; color: rgb(0, 51, 102); background-color: wh=
ite;">Thanks &amp; Regards,</span></div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255);">
<p style=3D"text-align: left; margin: 0px; font-family: Calibri, sans-serif=
; font-size: 11pt;">
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color: blac=
k; background-color: white;">&nbsp;</span><span style=3D"font-family: Arial=
, sans-serif; font-size: 10pt; color: rgb(0, 51, 102); background-color: wh=
ite;">Sana Kazi<br>
&nbsp;KPIT Technologies Limited<br>
</span></p>
</div>
<div style=3D"margin-right: 0px; margin-left: 0px;"><span style=3D"font-fam=
ily: Calibri, Arial, Helvetica, sans-serif;"><br>
</span></div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Constantia, &quot;Hoefler Text&quot;, serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;openem=
bedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedd=
ed.org&gt; on behalf of sana kazi via lists.openembedded.org
 &lt;sanakazisk19=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Thursday, September 7, 2023 12:26 PM<br>
<b>To:</b>&nbsp;openembedded-devel@lists.openembedded.org &lt;openembedded-=
devel@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;sanakazisk19@gmail.com &lt;sanakazisk19@gmail.com&gt;<br>
<b>Subject:</b>&nbsp;[oe] [meta-oe][kirkstone][PATCH] ntfs-3g-ntfsprogs: Up=
grade 2022.5.17 to 2022.10.3</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-size: 11pt;">Caution: This email originated from o=
utside of the KPIT. Do not click links or open attachments unless you recog=
nize the sender and know the content is safe.<br>
<br>
From: Omkar Patil &lt;omkar.patil@kpit.com&gt;<br>
<br>
Changes:<br>
Rejected zero-sized runs<br>
Avoided merging runlists with no runs<br>
<br>
Fix CVE-2022-40284<br>
<br>
Dunfell and master both have latest version of ntfs-3g-ntfsprogs<br>
2022.10.3. Therefore, upgrade the version on kirkstone too.<br>
<br>
Signed-off-by: Omkar Patil &lt;omkarpatil10.93@gmail.com&gt;<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
(cherry picked from commit 5d5e8854718dab02c2737e3faf288f830a514841)<br>
Signed-off-by: Sana Kazi &lt;sanakazisk19@gmail.com&gt;<br>
---<br>
&nbsp;...3g-ntfsprogs_2022.5.17.bb =3D&gt; ntfs-3g-ntfsprogs_2022.10.3.bb} =
| 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3=
g-ntfsprogs_2022.5.17.bb =3D&gt; ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)<br>
<br>
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2022.10.3.bb<br>
similarity index 95%<br>
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-=
ntfsprogs_2022.5.17.bb<br>
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2022.10.3.bb<br>
index b29716ad4..37a8106bb 100644<br>
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2022.5.17.bb<br>
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2022.10.3.bb<br>
@@ -10,7 +10,7 @@ SRC_URI =3D &quot;https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Ftuxera.com%2Fopensource%2Fntfs-3g_ntfsprogs-%24=
&amp;data=3D05%7C01%7CSana.Kazi%40kpit.com%7C15f74e1dcecf44faeac808dbaf6fba=
8e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638296666670807254%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DuGwpKtNULV3O3fyr8gynGij4JHzOF0h%2F%2FoN=
yDqBAHSI%3D&amp;reserved=3D0{PV}.tgz
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch"=
 id=3D"OWA23061f83-ce2b-f3c7-72c6-38ccb609b122" class=3D"OWAAutoLink" data-=
auth=3D"NotApplicable">
file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch</a>&=
nbsp;\<br>
&nbsp;&quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/ntfs-3g_ntfsprogs-${PV}&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0489fbb6972581e1b417ab578d543f6ae522e7fa648c3=
c9b49c789510fd5eb93&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f20e36ee68074b845e3629e6bced4706ad053804cbaf0=
62fbae60738f854170c&quot;<br>
<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.tuxera.com/commun=
ity/open-source-ntfs-3g/" id=3D"OWA6893a29b-6926-78de-fc13-f3c4a7df1a3b" cl=
ass=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.tuxera.com%2Fcommunity%2Fopen-=
source-ntfs-3g%2F&amp;data=3D05%7C01%7CSana.Kazi%40kpit.com%7C15f74e1dcecf4=
4faeac808dbaf6fba8e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6382966666=
70807254%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dy4lfjW6VN8Go8vwIPGapbX=
mgcYNR%2BKTkY%2BuzFjYKyeA%3D&amp;reserved=3D0</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;ntfs-3g_ntfsprogs-(?P&lt;pver&gt;\d+(\=
.\d+)+)\.tgz&quot;<br>
--<br>
2.25.1<br>
<br>
</span></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN3PR01MB7710D98F880C48A928BFC25499DEAPN3PR01MB7710INDP_--

