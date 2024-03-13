Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381C5C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:01:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10572.1710313299484516470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VO+8useA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=380231fee7=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D5Se9E026644
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 00:01:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=FkixPTfAwUgEhQiqNu
	x0u4mDd47CAUeAcy4GdoTITEs=; b=VO+8useAZBl19RMpPChwJ9yc/rV1RUwwCu
	s2NaO/9kTiFjouo8LDVdLfqiTQIzT04TwHzHiATN76Ldh/QpZbebYcXC0szcpJKM
	Djr8I4a0A4RmQfa5LfHp94iURqtiOMbHhCucBtUoPpdDcMM4jNqArACid8PTDhia
	I7AlboTH3cTUDVSQ/xn0P44CuEdnte0iwZeOfJOeF5gJlYwQn5RZ2DqtTvALhs4L
	MSkVzsckL00qwymaLmZNjXVVKWj0q255H+rZK7kvpzHrQbxui07Yk5TwwGmgfi5t
	XLHm+g/Hfd2Lk3z8dNzwW6FJXMkPe0XgYpL2u/EiSwhZ8yPFta6w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrr5mb9y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 00:01:38 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42D71cqx031142
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 00:01:38 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrr5mb9xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 00:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCXsj8uExXgMtoi+/DZxNYQuQu8pADp6UdAbYfdzyF3P91KYAyRGn02JLWtTZ16a5jCyD3/LO7ObKt6L8qTuua5IV6SyiFNzFSoqqSV5PPtBqFwY1ne1NjJEdSKqbPBYj3Z1T/QbZx3BCN5lLppy1PpBOqdFVdCU0iNzSwQHMdeubcC9kZ4jJ2arGBFsboGN4gYwxKiU6BXW3SJql/dmq2Z1lgM2sDsY5ZpE+n+HJrzdEfetDwhqSsyDldFy/nHsRv4+jRwf5X41fxXBZnD5yJfh8Va4ZVyYttEAS7WyLQfnKlwzP5KMF1FcgBJC0+7K8JiEpvWiD7OJk530xJ4Xrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkixPTfAwUgEhQiqNux0u4mDd47CAUeAcy4GdoTITEs=;
 b=OGDavrbGlbJzVq3ZT0KcLMTDtbBOQDpmuzAljEXly41X7C0UbtbUHa3S4fvow00ezS0ltkc9vDHraDh2WdwlKT6j7dUCjwjCuB8kBy+wWbW4IcCujBH6WdDnH8nhHIagjX2RzgW16SxzvmTXPIdpE/PZYnP1Xsn3LvtLI6bg4AIhr/bq4YlAMyKTxQPBuMpQOCp4NvkuotB3ta7Zdxytb1k5b++7ssB1AkpGd/2CNccQ84S5PdjqECXgP/3myi3AS6i64p05w4FeLEiRClllM8nr25+tNpfHrOJALuE5Kb3r8Evi+NrCP+TEw8ZRQYVenvmKBgDQrNLNvkmEyLFu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 13 Mar
 2024 07:01:32 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::173e:ba49:f9d5:3153]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::173e:ba49:f9d5:3153%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 07:01:32 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "anuj.mittal@intel.com"
	<anuj.mittal@intel.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: Fix CVE-2024-0985
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: Fix
 CVE-2024-0985
Thread-Index: AQHacIQX64daIPaEDkm6zkiotj6iA7Ex3C6AgANrIds=
Date: Wed, 13 Mar 2024 07:01:32 +0000
Message-ID: 
 <BYAPR11MB3397BD9E877470CD0BFB5B96812A2@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20240307113848.847275-1-soumya.sambu@windriver.com>
 <5ea8077ad07b3286c705e4942d7a4ec586da398d.camel@intel.com>
In-Reply-To: <5ea8077ad07b3286c705e4942d7a4ec586da398d.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|MN2PR11MB4550:EE_
x-ms-office365-filtering-correlation-id: 6a8c5b17-12da-4ef0-a514-08dc432b6a17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gwDxA1iI4HybpNBhwtYFXYiKk0B/7++zEDiHje+r6std7aG1+6kl6/46wCDE9bnQbrxSOREbJg0NvEfM/e/GAYn+YAZRhP25mXA8iudm7B/a0brMu62UWY5jISITdrnxW4rzjoKPm05At0kIBdk77t6Z/DGtu76gHLrVi42PrzLdHbnkZmKiS4MJW4zbTxqd1eFzcDyBFW6SkBCE9eLrXSJtKODHiugStxVjriy6Z4h5M+TYBtiSsIq8yxoDYplM3sjA0ePew4iiuAM05zAIBBA77HPap+RPGBVB1wz+n/wT1F7+g9ZV8c/JMGSSJu1fXEB/6RWMBnDHb2H5iHYxGJYjNavkl5awVRXZJAfakU7LZV7XYs7J27J4cMmgMcHA9R3q9ThJbFVYPI89dC/lanKx29B7R6h5881DLaSH55+zo9Zk4byH0cBSOxqnEnjfATIUSyP2ssPE9TZfaApZGtde2Id0Db36QgcpL+ccn2Zh8WfNv0cQhu3cbMYFVlsO7UVOCwg4Tn4pMZBMw2jf3iNp0EF2/KwV727jF1L9VRIw9EAU8piw0kkLnLqXwmNEmg1LVLhEIEWmF+0fvOaAn1kxQWqpRtyL8gdwMoWGGmnA7KgInPd6XsqZT4VYrgCoUs4+lFy3UObT+n8pJYB2AVRmzREecTE9wFy7Sy4DVD4eEE+0mKaeklSL7gs8+4F4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0p7uRjmWmAklOR7v9ofsH3qaMQ2v/wiZKqZPHJ8ul7pa0OHXhUfbnDrXlrcU?=
 =?us-ascii?Q?jomVDjHhffhWFe1FcKLZP8vaPsPJUlxfANdBiEu/y/HlZV7QUQ5ZdY2iDEz9?=
 =?us-ascii?Q?F0IMq3p60YAYoCgCpVpJkpIy7lyCEvSxx97iiaIbvF9ZonmiQARW6iPbZiJx?=
 =?us-ascii?Q?kcHuUr+53/IWcE0305wDfWYzvvz+IgUF0eomos/g2hYGw2WTmKDYsUgApXyr?=
 =?us-ascii?Q?FN0H3lZLu1DeOQ77IQANLCoFl38e8pZzdc9XNZ/iOfYkscxBfaUUUMhOr/c8?=
 =?us-ascii?Q?13+puzO7XMuJu/+jSGmaKiTaAR59UNsOGdUgO8BcvY6RYAbyNJSOKjkTdZzh?=
 =?us-ascii?Q?MPW21LU2e+yMUjlUKYiIHuBWbK0kLLu057mn0tlKsXUJ9xoAlca/MUf5o7L1?=
 =?us-ascii?Q?Qux9MdciA1MGNYgrAiYWJ1FglmsTFED4p481bda1jDx99s7yQv8536eUHCF7?=
 =?us-ascii?Q?EHNqumpE5Mz5ycQWbBUhzj3BgbJRGIH7N8cBC/bB2rWvh5n//jGXzutP3NvP?=
 =?us-ascii?Q?+oEkF4cWuF/MmVU7W3zOi6IdoLll92HuBah0XYgbA/t9DJbb92FqRxUdUCMd?=
 =?us-ascii?Q?7P9T85XWnmKYcAEM6wMJPl6xjsMs55noV8HPwODhQFCEuGLGCE8886J5506l?=
 =?us-ascii?Q?xynN0dSc6/WAVe3IGtq4miAWLYmi8hvOZtddS9oLfSVnSnhDOE7kuDCfGWGv?=
 =?us-ascii?Q?71gxAncwn8+5H9Xy/OlEMk4HOSzGIYtTWoxce2pCa4bu/m5tkU87TpAhrGue?=
 =?us-ascii?Q?0ELbzJ/AVVVvkYPpldvvbNKLSq1x9ZjgfrbI5pkxFxoTm/YLd7SfuyCWO/+p?=
 =?us-ascii?Q?zbs3lo18CKqw2p/CUsQlAeJp4umYMqRBL5wxy3rGfzNGrfFrhtr92bwlfYiU?=
 =?us-ascii?Q?H/nnplV94ZRWqQwE2DgyCE7re4lW+Ce4iCsdUGk9R1cRrGwBezt+Mvaou3D/?=
 =?us-ascii?Q?rCiX90nHNUjuWBd+zcyVDCQFsNQ4OZseRsamyTHUNpc9YM5wGViFNpRU2D1a?=
 =?us-ascii?Q?FVgCuNpGAkD771TrA/7oTuoiIS3upNe2TXIr8/3Gdt3HpUjXKXU3tkuf7mwG?=
 =?us-ascii?Q?haUe4h0+zUoGcDp4hHtDSGPuMZFsGA0A2kdFZ3hm5cFo0s/TBf9P7y+a/a20?=
 =?us-ascii?Q?ndKA0t6crD5ak7kP/r7929la1gOwNHeDirPLCrrhY41/eKNiOBKrjcNKokRi?=
 =?us-ascii?Q?JaG17a36ynzXqRPr15vcQgr5maewnbsbV80NySkuc/8SxlNrCFFujtlhY+Ar?=
 =?us-ascii?Q?uS/R9LwVBNO24cT6luV3Kb+DdAnQOQPN+wRU8r4LNdDQ9KLuKIxGXqJnxq0D?=
 =?us-ascii?Q?yU3h7aCVtgFJpXWPCZyTEFQ+9j3enhnmLrI+JeRjOFMK8ZJPzRdpZyjhqcUc?=
 =?us-ascii?Q?6MLMv/mDJ438pbZW0+ZjQjG2SBH0EGGxBYVXkmjVYy69HP7orOc3vZytHRY1?=
 =?us-ascii?Q?A9aRERbbUzSuvFw7qxXeeBRniLNYx4kpkoS5Y4dzn2I5cN1ai363yr235EwB?=
 =?us-ascii?Q?EgUWDEWs9h0RWCs7TbOwKe/n/jqzY58mOVoISmaMOBXeJqJvj2VrBQ6ZPUWN?=
 =?us-ascii?Q?9pGz+y+zGydiyfdsci1vn5FRTpOCMCEtbi6LJATT?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397BD9E877470CD0BFB5B96812A2BYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8c5b17-12da-4ef0-a514-08dc432b6a17
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 07:01:32.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xtc6Cz2t6dsh8XaMzy1tCX+aEwqC+f7XG94wqEATuzVbWC4zaiS99hMwkphGpmSuqDfgI3imTEhTxwUUZrXbfe6seTB9TutWqYYGy0oGRCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
X-Proofpoint-ORIG-GUID: 0Z_6xPebN5Bh6YjyZK1CpSs0esLJ9C4l
X-Proofpoint-GUID: 388zY29YGrDcCO568zeffHByGyDno4Jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_06,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109289

--_000_BYAPR11MB3397BD9E877470CD0BFB5B96812A2BYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Got it. I will upgrade to 14.11.

Regards,
Soumya
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Anuj Mittal via lists.openembedded.org <anuj.=
mittal=3Dintel.com@lists.openembedded.org>
Sent: Monday, March 11, 2024 8:18 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Sambu, Soumya <Soumya.Sambu@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: Fix CVE-2024-0=
985

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2024-03-07 at 03:39 -0800, Soumya via lists.openembedded.org
wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Late privilege drop in REFRESH MATERIALIZED VIEW CONCURRENTLY in
> PostgreSQL
> allows an object creator to execute arbitrary SQL functions as the
> command
> issuer. The command intends to run SQL functions as the owner of the
> materialized view, enabling safe refresh of untrusted materialized
> views.
> The victim is a superuser or member of one of the attacker's roles.
> The
> attack requires luring the victim into running REFRESH MATERIALIZED
> VIEW
> CONCURRENTLY on the attacker's materialized view. As part of
> exploiting
> this vulnerability, the attacker creates functions that use CREATE
> RULE to
> convert the internally-built temporary table to a view. Versions
> before
> PostgreSQL 15.6, 14.11, 13.14, and 12.18 are affected. The only known
> exploit does not work in PostgreSQL 16 and later. For defense in
> depth,
> PostgreSQL 16.2 adds the protections that older branches are using to
> fix
> their vulnerability.
>
> Upstream commit have wrong CVE mentioned but the correct one is CVE-
> 2024-0985
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2024-0985
> https://security-tracker.debian.org/tracker/CVE-2024-0985

I think this should instead be upgraded to 14.11 bug fix release.

Thanks,

Anuj

>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../postgresql/files/CVE-2024-0985.patch      | 98
> +++++++++++++++++++
>  .../recipes-dbs/postgresql/postgresql_14.9.bb |  1 +
>  2 files changed, 99 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2024-
> 0985.patch
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch
> b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch
> new file mode 100644
> index 000000000..24245406c
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch
> @@ -0,0 +1,98 @@
> +From f2fdea198b3d0ab30b9e8478a762488ecebabd88 Mon Sep 17 00:00:00
> 2001
> +From: Heikki Linnakangas <heikki.linnakangas@iki.fi>
> +Date: Mon, 5 Feb 2024 11:01:23 +0200
> +Subject: [PATCH] Run REFRESH MATERIALIZED VIEW CONCURRENTLY in right
> security
> + context
> +
> +The internal commands in REFRESH MATERIALIZED VIEW CONCURRENTLY are
> +correctly executed in SECURITY_RESTRICTED_OPERATION mode, except for
> +creating the temporary "diff" table, because you cannot create
> +temporary tables in SRO mode. But creating the temporary "diff"
> table
> +is a pretty complex CTAS command that selects from another temporary
> +table created earlier in the command. If you can cajole that CTAS
> +command to execute code defined by the table owner, the table owner
> +can run code with the privileges of the user running the REFRESH
> +command.
> +
> +The proof-of-concept reported to the security team relied on CREATE
> +RULE to convert the internally-built temp table to a view. That's
> not
> +possible since commit b23cd185fd, and I was not able to find a
> +different way to turn the SELECT on the temp table into code
> +execution, so as far as I know this is only exploitable in v15 and
> +below. That's a fiddly assumption though, so apply this patch to
> +master and all stable versions.
> +
> +Thanks to Pedro Gallegos for the report.
> +
> +Security: CVE-2023-5869
> +Reviewed-by: Noah Misch
> +
> +CVE: CVE-2024-0985
> +
> +Upstream-Status: Backport
> [https://git.postgresql.org/gitweb/?p=3Dpostgresql.git;a=3Dpatch;h=3Df2fd=
ea
> 198b3d0ab30b9e8478a762488ecebabd88]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + src/backend/commands/matview.c | 33 ++++++++++++++++++++++++++-----
> --
> + 1 file changed, 26 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/backend/commands/matview.c
> b/src/backend/commands/matview.c
> +index 3fc50e8..0aa0a74 100644
> +--- a/src/backend/commands/matview.c
> ++++ b/src/backend/commands/matview.c
> +@@ -655,13 +655,35 @@ refresh_by_match_merge(Oid matviewOid, Oid
> tempOid, Oid relowner,
> +
> SPI_getvalue(SPI_tuptable->vals[0], SPI_tuptable->tupdesc, 1))));
> +     }
> +
> ++    /*
> ++     * Create the temporary "diff" table.
> ++     *
> ++     * Temporarily switch out of the
> SECURITY_RESTRICTED_OPERATION context,
> ++     * because you cannot create temp tables in SRO context.
> For extra
> ++     * paranoia, add the composite type column only after
> switching back to
> ++     * SRO context.
> ++     */
> +     SetUserIdAndSecContext(relowner,
> +                                                save_sec_context
> | SECURITY_LOCAL_USERID_CHANGE);
> ++    resetStringInfo(&querybuf);
> ++    appendStringInfo(&querybuf,
> ++                                     "CREATE TEMP TABLE %s (tid
> pg_catalog.tid)",
> ++                                     diffname);
> ++    if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_UTILITY)
> ++            elog(ERROR, "SPI_exec failed: %s", querybuf.data);
> ++    SetUserIdAndSecContext(relowner,
> ++                                               save_sec_context
> | SECURITY_RESTRICTED_OPERATION);
> ++    resetStringInfo(&querybuf);
> ++    appendStringInfo(&querybuf,
> ++                                     "ALTER TABLE %s ADD COLUMN
> newdata %s",
> ++                                     diffname, tempname);
> ++    if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_UTILITY)
> ++            elog(ERROR, "SPI_exec failed: %s", querybuf.data);
> +
> +-    /* Start building the query for creating the diff table. */
> ++    /* Start building the query for populating the diff table.
> */
> +     resetStringInfo(&querybuf);
> +     appendStringInfo(&querybuf,
> +-                                     "CREATE TEMP TABLE %s AS "
> ++                                     "INSERT INTO %s "
> +                                      "SELECT mv.ctid AS tid,
> newdata.*::%s AS newdata "
> +                                      "FROM %s mv FULL JOIN %s
> newdata ON (",
> +                                      diffname, tempname,
> matviewname, tempname);
> +@@ -790,13 +812,10 @@ refresh_by_match_merge(Oid matviewOid, Oid
> tempOid, Oid relowner,
> +                                                "WHERE newdata.*
> IS NULL OR mv.* IS NULL "
> +                                                "ORDER BY tid");
> +
> +-    /* Create the temporary "diff" table. */
> +-    if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_UTILITY)
> ++    /* Populate the temporary "diff" table. */
> ++    if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_INSERT)
> +             elog(ERROR, "SPI_exec failed: %s", querybuf.data);
> +
> +-    SetUserIdAndSecContext(relowner,
> +-                                               save_sec_context
> | SECURITY_RESTRICTED_OPERATION);
> +-
> +     /*
> +      * We have no further use for data from the "full-data" temp
> table, but we
> +      * must keep it around because its type is referenced from
> the diff table.
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
> b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
> index a879de20c..d9911fd4a 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
> @@ -12,6 +12,7 @@ SRC_URI +=3D "\
>     file://CVE-2023-5868.patch \
>     file://CVE-2023-5869.patch \
>     file://CVE-2023-5870.patch \
> +   file://CVE-2024-0985.patch \
>  "
>
>  SRC_URI[sha256sum] =3D
> "b1fe3ba9b1a7f3a9637dd1656dfdad2889016073fd4d35f13b50143cbbb6a8ef"
>
>
>


--_000_BYAPR11MB3397BD9E877470CD0BFB5B96812A2BYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Got it. I will upgrade to
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px;=
 color: rgb(66, 66, 66); background-color: rgb(255, 255, 255);">14.11</span=
><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService=
, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">.<=
br>
<br>
Regards,<br>
Soumya</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Anuj Mittal via lists.openembedded.org
 &lt;anuj.mittal=3Dintel.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, March 11, 2024 8:18 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Sambu, Soumya &lt;Soumya.Sambu@windriver.com&g=
t;<br>
<b>Subject:</b> Re: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: Fix CVE=
-2024-0985</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2024-03-07 at 03:39 -0800, Soumya via lists.openembedded.org<br>
wrote:<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; Late privilege drop in REFRESH MATERIALIZED VIEW CONCURRENTLY in<br>
&gt; PostgreSQL<br>
&gt; allows an object creator to execute arbitrary SQL functions as the<br>
&gt; command<br>
&gt; issuer. The command intends to run SQL functions as the owner of the<b=
r>
&gt; materialized view, enabling safe refresh of untrusted materialized<br>
&gt; views.<br>
&gt; The victim is a superuser or member of one of the attacker's roles.<br=
>
&gt; The<br>
&gt; attack requires luring the victim into running REFRESH MATERIALIZED<br=
>
&gt; VIEW<br>
&gt; CONCURRENTLY on the attacker's materialized view. As part of<br>
&gt; exploiting<br>
&gt; this vulnerability, the attacker creates functions that use CREATE<br>
&gt; RULE to<br>
&gt; convert the internally-built temporary table to a view. Versions<br>
&gt; before<br>
&gt; PostgreSQL 15.6, 14.11, 13.14, and 12.18 are affected. The only known<=
br>
&gt; exploit does not work in PostgreSQL 16 and later. For defense in<br>
&gt; depth,<br>
&gt; PostgreSQL 16.2 adds the protections that older branches are using to<=
br>
&gt; fix<br>
&gt; their vulnerability.<br>
&gt;<br>
&gt; Upstream commit have wrong CVE mentioned but the correct one is CVE-<b=
r>
&gt; 2024-0985<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-0985">https://nvd=
.nist.gov/vuln/detail/CVE-2024-0985</a><br>
&gt; <a href=3D"https://security-tracker.debian.org/tracker/CVE-2024-0985">=
https://security-tracker.debian.org/tracker/CVE-2024-0985</a><br>
<br>
I think this should instead be upgraded to 14.11 bug fix release.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt;<br>
&gt; Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../postgresql/files/CVE-2024-0985.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 98<br>
&gt; +++++++++++++++++++<br>
&gt;&nbsp; .../recipes-dbs/postgresql/postgresql_14.9.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 99 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2024=
-<br>
&gt; 0985.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch<=
br>
&gt; b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..24245406c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch<br>
&gt; @@ -0,0 +1,98 @@<br>
&gt; +From f2fdea198b3d0ab30b9e8478a762488ecebabd88 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Heikki Linnakangas &lt;heikki.linnakangas@iki.fi&gt;<br>
&gt; +Date: Mon, 5 Feb 2024 11:01:23 +0200<br>
&gt; +Subject: [PATCH] Run REFRESH MATERIALIZED VIEW CONCURRENTLY in right<=
br>
&gt; security<br>
&gt; + context<br>
&gt; +<br>
&gt; +The internal commands in REFRESH MATERIALIZED VIEW CONCURRENTLY are<b=
r>
&gt; +correctly executed in SECURITY_RESTRICTED_OPERATION mode, except for<=
br>
&gt; +creating the temporary &quot;diff&quot; table, because you cannot cre=
ate<br>
&gt; +temporary tables in SRO mode. But creating the temporary &quot;diff&q=
uot;<br>
&gt; table<br>
&gt; +is a pretty complex CTAS command that selects from another temporary<=
br>
&gt; +table created earlier in the command. If you can cajole that CTAS<br>
&gt; +command to execute code defined by the table owner, the table owner<b=
r>
&gt; +can run code with the privileges of the user running the REFRESH<br>
&gt; +command.<br>
&gt; +<br>
&gt; +The proof-of-concept reported to the security team relied on CREATE<b=
r>
&gt; +RULE to convert the internally-built temp table to a view. That's<br>
&gt; not<br>
&gt; +possible since commit b23cd185fd, and I was not able to find a<br>
&gt; +different way to turn the SELECT on the temp table into code<br>
&gt; +execution, so as far as I know this is only exploitable in v15 and<br=
>
&gt; +below. That's a fiddly assumption though, so apply this patch to<br>
&gt; +master and all stable versions.<br>
&gt; +<br>
&gt; +Thanks to Pedro Gallegos for the report.<br>
&gt; +<br>
&gt; +Security: CVE-2023-5869<br>
&gt; +Reviewed-by: Noah Misch<br>
&gt; +<br>
&gt; +CVE: CVE-2024-0985<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://git.postgresql.org/gitweb/?p=3Dpostgresql.gi=
t;a=3Dpatch;h=3Df2fdea<br>
&gt; 198b3d0ab30b9e8478a762488ecebabd88]<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; +---<br>
&gt; + src/backend/commands/matview.c | 33 ++++++++++++++++++++++++++-----<=
br>
&gt; --<br>
&gt; + 1 file changed, 26 insertions(+), 7 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/backend/commands/matview.c<br>
&gt; b/src/backend/commands/matview.c<br>
&gt; +index 3fc50e8..0aa0a74 100644<br>
&gt; +--- a/src/backend/commands/matview.c<br>
&gt; ++++ b/src/backend/commands/matview.c<br>
&gt; +@@ -655,13 +655,35 @@ refresh_by_match_merge(Oid matviewOid, Oid<br>
&gt; tempOid, Oid relowner,<br>
&gt; +<br>
&gt; SPI_getvalue(SPI_tuptable-&gt;vals[0], SPI_tuptable-&gt;tupdesc, 1))))=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Create the temporary &quot;diff&quot; tab=
le.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Temporarily switch out of the<br>
&gt; SECURITY_RESTRICTED_OPERATION context,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * because you cannot create temp tables in =
SRO context.<br>
&gt; For extra<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * paranoia, add the composite type column o=
nly after<br>
&gt; switching back to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * SRO context.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; SetUserIdAndSecContext(relowner,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_sec_co=
ntext<br>
&gt; | SECURITY_LOCAL_USERID_CHANGE);<br>
&gt; ++&nbsp;&nbsp;&nbsp; resetStringInfo(&amp;querybuf);<br>
&gt; ++&nbsp;&nbsp;&nbsp; appendStringInfo(&amp;querybuf,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;CREATE TEMP TABLE %s (tid<br>
&gt; pg_catalog.tid)&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d=
iffname);<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_UTILIT=
Y)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
log(ERROR, &quot;SPI_exec failed: %s&quot;, querybuf.data);<br>
&gt; ++&nbsp;&nbsp;&nbsp; SetUserIdAndSecContext(relowner,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_sec_context=
<br>
&gt; | SECURITY_RESTRICTED_OPERATION);<br>
&gt; ++&nbsp;&nbsp;&nbsp; resetStringInfo(&amp;querybuf);<br>
&gt; ++&nbsp;&nbsp;&nbsp; appendStringInfo(&amp;querybuf,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;ALTER TABLE %s ADD COLUMN<br>
&gt; newdata %s&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d=
iffname, tempname);<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_UTILIT=
Y)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
log(ERROR, &quot;SPI_exec failed: %s&quot;, querybuf.data);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; /* Start building the query for creating the diff=
 table. */<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Start building the query for populating the di=
ff table.<br>
&gt; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; resetStringInfo(&amp;querybuf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; appendStringInfo(&amp;querybuf,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;CREATE TEMP TABLE %s AS &quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;INSERT INTO %s &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;SELECT mv.ctid AS tid,<br>
&gt; newdata.*::%s AS newdata &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;FROM %s mv FULL JOIN %s<br>
&gt; newdata ON (&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; diffname, tempname,<br>
&gt; matviewname, tempname);<br>
&gt; +@@ -790,13 +812,10 @@ refresh_by_match_merge(Oid matviewOid, Oid<br>
&gt; tempOid, Oid relowner,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WHERE=
 newdata.*<br>
&gt; IS NULL OR mv.* IS NULL &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ORDER=
 BY tid&quot;);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; /* Create the temporary &quot;diff&quot; table. *=
/<br>
&gt; +-&nbsp;&nbsp;&nbsp; if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_UTILIT=
Y)<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Populate the temporary &quot;diff&quot; table.=
 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (SPI_exec(querybuf.data, 0) !=3D SPI_OK_INSERT=
)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; elog(ERROR, &quot;SPI_exec failed: %s&quot;, querybuf.data);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; SetUserIdAndSecContext(relowner,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_sec_context=
<br>
&gt; | SECURITY_RESTRICTED_OPERATION);<br>
&gt; +-<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * We have no further use for data from=
 the &quot;full-data&quot; temp<br>
&gt; table, but we<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * must keep it around because its type=
 is referenced from<br>
&gt; the diff table.<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb<br>
&gt; b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb<br>
&gt; index a879de20c..d9911fd4a 100644<br>
&gt; --- a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb<br>
&gt; +++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb<br>
&gt; @@ -12,6 +12,7 @@ SRC_URI +=3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2023-5868.patch">file://=
CVE-2023-5868.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2023-5869.patch">file://=
CVE-2023-5869.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2023-5870.patch">file://=
CVE-2023-5870.patch</a> \<br>
&gt; +&nbsp;&nbsp; <a href=3D"file://CVE-2024-0985.patch">file://CVE-2024-0=
985.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D<br>
&gt; &quot;b1fe3ba9b1a7f3a9637dd1656dfdad2889016073fd4d35f13b50143cbbb6a8ef=
&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3397BD9E877470CD0BFB5B96812A2BYAPR11MB3397namp_--

