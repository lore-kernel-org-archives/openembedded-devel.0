Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABE8FD9E3D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 05:30:48 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88785.1772170244016906107
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 21:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Rj9VdDCw;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10719; q=dns/txt;
  s=iport01; t=1772170244; x=1773379844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=b6DqVeWqp/yrge/jvy/tnwlvnKyN/HSHDoGpN7BXQJg=;
  b=Rj9VdDCw3XnwD0GQbvLsc42lrB9uewoXsezOGCbO6tR+US/zU0/zy/6m
   Gpxl9pqMrX/1ieuprDtfHJLwXVge14aE3jZwxhy5rgyqwrwsafAFiJBfI
   eyih6zrEUUydPQebkiAeUiFj3O2G9eYssqh4rc1OkJH3YlC5mxF8E1BR2
   gDz5BrIHBs+c5spPLb1HsgLALi99b2/re2t21Cfzx1NdH5JNZDsdfVQfq
   4VdAuZDX0n+fKBS2JekKagdUk0QOJCVzK6lU67ZvYaklOngwFI9odmNd6
   XQFWJ9Fp+CkSnaEwUPNibpBiqXlP6T2gs1vpSvNKBwi+U5wT7EVVmaCqf
   A==;
X-CSE-ConnectionGUID: pJwVZkK8ROmC77Z0CcUG3A==
X-CSE-MsgGUID: p+8LyTAeRN+3Bv4Akb6JCQ==
X-IPAS-Result: =?us-ascii?q?A0AQBQC9KqFp/4v/Ja1agQklgSuBPQEwUweBAIEhSYgjA?=
 =?us-ascii?q?4UsiHkDl0OGV4F/DwEBAQ0CLgEFHQQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBETkBLQwEAgEIE?=
 =?us-ascii?q?QQBAS8nCh0IAgQBDQUIGoJhgh0WQAMBAg6abQGBPQKKKniBNIEBgygB3QUUA?=
 =?us-ascii?q?QWBM4U8gxcBASqBNYJbgSEZhHonGxuBcoFXgmg+gmEBAwEXgR0rPINXgi8Eg?=
 =?us-ascii?q?Q6BFHoUHYFihX0GhRUihWpSciIDJjMsAVUTFwsHBYEjEDMDIAovLQIUDSIPG?=
 =?us-ascii?q?gUtHXAMJxIPHRcUHlgbBwUSISoHEAICBIITeIIBD4ZseQMuXhoOIgIsEgNZU?=
 =?us-ascii?q?T4LXwWBOQMLbT03Bg4bAwSBNQWNFFw/gjQWPSEaLE8LPn4cC5NYjyNHoy8KK?=
 =?us-ascii?q?IN0jB6NPogyF4QEgVeLPAOZUS6YWCKNZ5sNAgQCBAUCEAEBBoFoPCsOgQ4LB?=
 =?us-ascii?q?3AVO4JnCUkZD45fhUGDFMB4eAIBOQIHCwEBAwmGSIsigX0BAQ?=
IronPort-PHdr: A9a23:evjgWh1RJSLNISB+smDPmlBlVkEcU/3cNwoR7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:2fty1a+Zy/6w1TCFYkK2DrUD2H+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2AWW2mHbPuPZmD0KopyOorj9kxQvp7Uz4A1QQJqpH1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaDhKs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kuH5ImyOVUUVtp8
 NdHdwJVRRu+qLmflefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+oi2XneiFwo1OOrq1x6G/WpOB0+OayboCNJI3WGK25mG6A5
 TLi7ljQDys8d4e112as8XjypMT2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9cQfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:z0V0bK++U0Ak6RD/Ebxuk+Gedr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WBjB8bSYOCGghrnEGgM1/qZ/9SNIVybygcZ79
 YeT0EcMqywMbEZt7eG3ODQKb9Jq7f3ktHMuQ6d9QYQcegAUdAY0+4NMHfhLqQAfng/OXNWLu
 v62iNvnUvSRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIvK91
 KrryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTFkG+TFcdccozHmApwjPCk6V4snt
 WJiQwnJd5P53TYeXzwiQfx2jPnzC0l5xbZuB2laDrY0InErQABeo18bLFiA13kAo0bzYhBOZ
 dwriakXlxsfEv9dWrGloP1vlpR5zqJSDIZ4JwuZjpkIMsjgHs7l/1DwKuTe61wRh4T5O0cYZ
 xTJdCZ6/BMfVyAaXfF+mFp3dy3R3w2WgyLW04Yp6WuonVrdV1CvgAlLfYk7z093YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXeD3cZe46EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdsWIpYUrhBcCHwZUO+BHQR2e2Wyjr16hlltREk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2I55SC++LFxqnJW+I5Xy2Z3B/EwhpbCROgKdOZ7unmLO9FrHX
X-Talos-CUID: 9a23:+3OwZ2BkzXbqmU76EzFF63AmGeN1SFrY5yiPEReTAltGE5TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A/2A0Qw4fgifR4nRXP9Uqa+BmxoxwoPSKGXwknK8?=
 =?us-ascii?q?g+JKuK3BZOD3Drh+OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Feb 2026 05:30:42 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id BAD6618000223
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 05:30:42 +0000 (GMT)
X-CSE-ConnectionGUID: GUdqFsjOTFCm/vPPnNSzMg==
X-CSE-MsgGUID: A3JoCFpKRlO0hFTge1FZfg==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,313,1763424000"; 
   d="scan'208,217";a="45331778"
Received: from mail-dm5pr08cu00406.outbound.protection.outlook.com (HELO DM5PR08CU004.outbound.protection.outlook.com) ([40.93.13.102])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Feb 2026 05:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Js6o8tDa/tLmKeSuen38YiFeAsZzgvdLfAGQhlkosKNI2wyn1f/FH86Ud9vhxvGSwXgtkUJzHPnhtJw753MlWHYNZf1iWlPqmzclVzXSvNeNpwpoq597Nskt4LlAcC1jsmL5Dvsk90fIU1hh+NnteUVVNEgRPqzn2EmVRYDZ9vC5t6T054RGOYCgV5ThWq+nhdXWBwyCf/WxwkZszJ9R7URhcdfjCGSMnTvvwgHqVv3towHGOKYNVdK0boQJABjq6Z+RXWMJDVwoM6A9+kIBO1TJV/Hm3/EjUt7I1Mq2Q5cgNb0Q8hika7Xfa4D/PLSG8m3U9lT61uZv2KbsCLczgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6DqVeWqp/yrge/jvy/tnwlvnKyN/HSHDoGpN7BXQJg=;
 b=XPln3QijtuPmFFJKOdMcLUxYIhZKPCcUw2EzrW10LnRGm2sCzBenddC4nrk4rHh4U51UiOYU/pvp0MtOLMkkcsnz7fzyyizq9oC6o0jFh6Ng5Tp9SpHIIeJ7lPiCSaJ9xSFyV/Two8tzd+6AzZ3k6ZhICvJ7Eu41WfZZptcv0DA53CM3IZMMAwh+GebhwFc/YNKdKqbQDkB0YpxkVeX4CYt6UTDSx7JTzxrDWujFt3rjd9ceWRXwTLtwzgXkRt+wkKPnjFIwu7BjDnP0d29urGKm7bIARMyP7tvxqssq9FTJqwsLSpxnJ3QsmCSXLbLH05b18zrPTuHiMN8xlniFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 05:30:38 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 05:30:38 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>
Subject: Re: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support
 product name
Thread-Topic: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support
 product name
Thread-Index: AQHcpx6YN5apMD5hP0qaPcL9puChorWU9sKAgAEPB3s=
Date: Fri, 27 Feb 2026 05:30:38 +0000
Message-ID: 
 <DS0PR11MB740590C8BB111A4C1B247AF6DC73A@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260226125105.47526-1-hetpat@cisco.com>
 <20260226125105.47526-4-hetpat@cisco.com>
 <AS1PR10MB5697535CC7E3B36DD10036D0FD72A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697535CC7E3B36DD10036D0FD72A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4baa0f61-104f-46fb-980e-28a108c2e7c2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-26T13:17:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|PH7PR11MB6005:EE_
x-ms-office365-filtering-correlation-id: f7721b6e-9b40-43b2-2262-08de75c156f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 nEFBSTMud3U+g+QBXcpZP5o5AMaet1Z4hqSOmHCE0XELSmCkAl6oo/QXh6nKWV8/jR4KypxIUxVdhYSI6+ywI8Oh8cLIfh3Wo4lzLf+Xly+WtBFPDL9JNM6WdKi0PtO0DB20ZVVLJaaADi0oWl4fkjMy7D0v1pWT+rUbMy4FyUj1udOI9ZJ1NgAwqgJ9wT7ZxCrFkjlzHkJAlmzgNltd5NXcaRXGlhRbUd9hqBjXLmElILu1p2CYoyKGPDgaqkrljkvgRgDsG+avYuaJFqg5aA+f0upg/fGqfFWMZyrefB3t1PD3GRfMT/9DAY9LomiIjlTxuODkQE6qabqvyMpaveCTB5ugk89zbe3OmkDTjvpyoXl0EhGdV0ju01vbNmF0NmVG7iO43fH3xnag6Zulp2ka3/R0d6yXmBTjuWp8MYK/jsqyTZbOnYe0F5+odyNNxl3xQeC5tzT0dCrb7g9WWXStsdQ+HVTRCjQsVHdg1EiFXO3quaY4tWkmEUI1nZwf3WD/VwOFbDyHMli4qPWNJ92b5VQFRR0Ak/K3l8MZsFHk9LMJT1VzZC7U03jQLmGpchc8P6KAUu0qXl0Q/14AQu8nzTLZ6Hn/ZHyHhFaV82+yEIso0XdVs9b45quz5We1/zM1dp0NOIjMmFDAmdiIahfPDQupsl1FVZuW8vWPVZDOhiA90nGTG0Q8JNQOj0M2Rp2comv9wxTbM+DhfnNsvq/PUosK+jASxTEFWSrB5JOpJ4RboqLdMP/AJ0kIOwSN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?v8cuUe9AyiJIZVDQJxwRWQiJ/Rx8VqhnWa0qiuIQ4PpXig/bHjYeba4lXWeb?=
 =?us-ascii?Q?TqQoqh3W4sa6HwkxP4Kpg94SjW8iWj7rJwEmzm3Y9z5kreB8VPKfuvwCdhZP?=
 =?us-ascii?Q?GKPoHGj1mBjNpGIS3fZh2frgBpZHhbvqjKF7sofW76JS2q5q4HaMYI8IPylS?=
 =?us-ascii?Q?OXsgGvFX/esSNp0T8XMKmqKVeXmv96GdEbCGXVN05VI4QMqSiS1Y391yJD2E?=
 =?us-ascii?Q?CcNx2ejFYtnobjEsNiL+7zdzCNIyh9OWkerChT3KOvmpiNYqXq1GyfAHAkqB?=
 =?us-ascii?Q?ZLBO98GXlkYlo/+Rnz+02vxbY/1ZEEuet0E0rF6l7BN8Q7sfl5mzWzQagSRa?=
 =?us-ascii?Q?FHt3ZeLrUBW6lgOJU1spGhdM8ya4khWyYGXYxR35un8xEXkWb8OXtopkJ3Gs?=
 =?us-ascii?Q?rYshF6TFlap1Iz76i4NIQhvJOr4V/Ve/9wlQ3tbu2rSs10t+IsH5y1x6xIDb?=
 =?us-ascii?Q?c8CWR/RezvzklqdNFflBvG4Jdmt2mj7ZzeXHFsPHf/WpLa3pSSViOXP6fMbE?=
 =?us-ascii?Q?gZSAa7kPEK8LJDQ2mtZibwChVwx0G2bsGQmDfqQByT29QaI4cqWTY72ZvjPf?=
 =?us-ascii?Q?nsCwowGmMOnHlpGomYl4VwdTTorvbYjepz1ExSCUM9yV0GqmR8izjCKH+E7q?=
 =?us-ascii?Q?ME1GgSTvueFojrYpHeHAo7WGHrVEs91NVDabZnpKaD6kWjfsRUbF1auuAK1z?=
 =?us-ascii?Q?z9hN/hTLYsEncf6fGlEBqH0oJFWNp2nL8sUPlbfvJVeUv8cqwl6SLNwJ3OpP?=
 =?us-ascii?Q?eoL/dwlCbpU3a/FR8c7jsYMCtArQeFd+UNPCbhh0q9sxvAStwQ5ASS5SuXOS?=
 =?us-ascii?Q?8Yi4zkZV5kB3eSoqF34DX91HIzeoszCzoMaXChTi+U1EKgBU75v4wPkb7zRP?=
 =?us-ascii?Q?+W3NDLDVTxWSqA9vz1wShT4Sk+Vy+kjU1f0ME6F3E2ZzLfca29s/OGQsIdkM?=
 =?us-ascii?Q?juoKyp7UXmsEydQ2TEA+SiQ/S7pFAa8WvOAi9NqPCpmkR4aKsXLEjr7hj9wN?=
 =?us-ascii?Q?01Ksg0iIYfe2gy6M2cJw77Rbx3pKBFocMOAFqal0R4v5si0WPe+9ZnPT4q3N?=
 =?us-ascii?Q?UfOhMdWaTvvUv87N0qPMzTAe3n2aR/mezYy7E6s5OnKRXsEza0rNMDPyXLGN?=
 =?us-ascii?Q?4JcekRRck+0gvXGuyJRzQ6JjWxxEXGBM85XJPVjAo+dpJL3SE/QoYiqigtrF?=
 =?us-ascii?Q?v3On7OwRbIS0UOv7+mU1p1734fIdvEuRIKi7WZeKuvbFxe7pWymTQP1A4YPi?=
 =?us-ascii?Q?cA4wv/AYj4R2hY9br4EC+TBS7XUnk9A0UwiyEvrrUY5p3t3caRL2vItASkyd?=
 =?us-ascii?Q?8m6Bpj1jsczLV74X+4S5iZz1MkVGL5jozqVN2AfS5L+WWgNpxfi+PgvtSvr2?=
 =?us-ascii?Q?H/yPg2NofuNEFBBwXnhuLWlsFPnBVkJCusgO3hUZaTeYobcqIcE3o6boCN/m?=
 =?us-ascii?Q?kgk63nLuzQmy5RVLIiYOSOPYvkZknoOV92tssq07aMy8Gkhs1/HY3twGv68q?=
 =?us-ascii?Q?JvIVxKCTZ+nBHKMD0ZsFfKENXkEQKpwTcFI6yNTR5k2hd5XLmxmdnarZyfZV?=
 =?us-ascii?Q?36EZ0tPD/aH6Q6vWv+l2eo3/pUwyWt8YnBv2owsk451La+6xLhnuATWgu/e7?=
 =?us-ascii?Q?4AdnazJEqbvqjOm/YM2RwzRv5QJnO5DHYWNFKZ55x/eODxtcuDMlTlWjkkpH?=
 =?us-ascii?Q?j1YIw1hPpIogxpSweHdEQkx4UVzBmvrTTMqgEH3l+QIjd14o?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB740590C8BB111A4C1B247AF6DC73ADS0PR11MB7405namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7721b6e-9b40-43b2-2262-08de75c156f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 05:30:38.1067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aL7VfXxEI7+/nWvQAuZkwkYS3b62chDMzca+Fa7EHKP0NAwNvFybRAPQPIO7Qim2lYYnfyeOON6OBmxIXmXkoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6005
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 05:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124692

--_000_DS0PR11MB740590C8BB111A4C1B247AF6DC73ADS0PR11MB7405namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The CPE reference comes from the NVD entry for `google_test`. One of the CP=
E used is:

https://nvd.nist.gov/products/cpe/detail/5806549A-1DCE-4225-80C6-7099B53A0F=
77?namingFormat=3D2.3&orderBy=3DCPEURI&keyword=3Dcpe%3A2.3%3Aa%3Agoogle%3Ag=
oogle_test&status=3DFINAL

This CPE (`cpe:2.3:a:google:google_test`) is the product name currently def=
ined by NVD for Googletest. The complete list of available CPEs matching `g=
oogle_test` can be found here:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D2.3&keyword=
=3Dgoogle_test

You are correct that, at present, there are no CVEs reported for Googletest=
. However, the source code is already mapped to this CPE in NVD. Setting `C=
VE_PRODUCT` ensures that any future CVEs reported against this product will=
 be correctly detected and attributed during CVE checking.

I will send a revised patch with this information clearly documented in the=
 commit message as a reference.

Best regards,
Het.
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Peter Marko via lists.openembedded.org <peter=
.marko=3Dsiemens.com@lists.openembedded.org>
Sent: Thursday, February 26, 2026 6:49 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>; openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral Cha=
vda (vchavda) <vchavda@cisco.com>
Subject: Re: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to suppo=
rt product name



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Thursday, February 26, 2026 13:51
> To: openembedded-devel@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support
> product name
>
> From: Het Patel <hetpat@cisco.com>
>
> - Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
> reporting.
>
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta-oe/recipes-test/googletest/googletest_1.17.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb b/meta-
> oe/recipes-test/googletest/googletest_1.17.0.bb
> index c8ed80053d..242f0ac7da 100644
> --- a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
> @@ -35,3 +35,6 @@ do_configure:prepend() {
>      # there isn't python in HOSTTOOLS so "env python" fails
>      sed -i 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@g'
> ${S}/googlemock/test/*py ${S}/googletest/test/*py
>  }
> +
> +# Add CVE_PRODUCT to match the NVD CPE product name
> +CVE_PRODUCT =3D "google:google_test"

Where is this CPE coming from?
Afaik there is no CVE for googletest to look at used CPEs.
Please add reference to the commit message.

--_000_DS0PR11MB740590C8BB111A4C1B247AF6DC73ADS0PR11MB7405namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The CPE reference comes from the NVD entry for `google_test`. One of the CP=
E used is:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
https://nvd.nist.gov/products/cpe/detail/5806549A-1DCE-4225-80C6-7099B53A0F=
77?namingFormat=3D2.3&amp;orderBy=3DCPEURI&amp;keyword=3Dcpe%3A2.3%3Aa%3Ago=
ogle%3Agoogle_test&amp;status=3DFINAL</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This CPE (`cpe:2.3:a:google:google_test`) is the product name currently def=
ined by NVD for Googletest. The complete list of available CPEs matching `g=
oogle_test` can be found here:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D2.3&amp;key=
word=3Dgoogle_test</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
You are correct that, at present, there are no CVEs reported for Googletest=
. However, the source code is already mapped to this CPE in NVD. Setting `C=
VE_PRODUCT` ensures that any future CVEs reported against this product will=
 be correctly detected and attributed
 during CVE checking.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will send a revised patch with this information clearly documented in the=
 commit message as a reference.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Het.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Peter Marko via lists.openembedded.org
 &lt;peter.marko=3Dsiemens.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, February 26, 2026 6:49 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;; openembedded-devel@lists.openembedded.org &lt;openem=
bedded-devel@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;; Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT t=
o support product name</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-devel@lists.openembedded.org &lt;openembedded-<br>
&gt; devel@lists.openembedded.org&gt; On Behalf Of Het Patel via<br>
&gt; lists.openembedded.org<br>
&gt; Sent: Thursday, February 26, 2026 13:51<br>
&gt; To: openembedded-devel@lists.openembedded.org<br>
&gt; Cc: xe-linux-external@cisco.com; vchavda@cisco.com<br>
&gt; Subject: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to supp=
ort<br>
&gt; product name<br>
&gt; <br>
&gt; From: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt; <br>
&gt; - Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE<br>
&gt; reporting.<br>
&gt; <br>
&gt; Signed-off-by: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta-oe/recipes-test/googletest/googletest_1.17.0.bb | 3 +++<br>
&gt;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb b/me=
ta-<br>
&gt; oe/recipes-test/googletest/googletest_1.17.0.bb<br>
&gt; index c8ed80053d..242f0ac7da 100644<br>
&gt; --- a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb<br>
&gt; +++ b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb<br>
&gt; @@ -35,3 +35,6 @@ do_configure:prepend() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # there isn't python in HOSTTOOLS so &qu=
ot;env python&quot; fails<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i 's@^#!/usr/bin/env python$@#!/usr=
/bin/env python3@g'<br>
&gt; ${S}/googlemock/test/*py ${S}/googletest/test/*py<br>
&gt;&nbsp; }<br>
&gt; +<br>
&gt; +# Add CVE_PRODUCT to match the NVD CPE product name<br>
&gt; +CVE_PRODUCT =3D &quot;google:google_test&quot;<br>
<br>
Where is this CPE coming from?<br>
Afaik there is no CVE for googletest to look at used CPEs.<br>
Please add reference to the commit message.<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB740590C8BB111A4C1B247AF6DC73ADS0PR11MB7405namp_--

