Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5BEC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 08:50:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3861.1650963015901563021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=r6+mlmzo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=11152360f4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q8nEF6020556
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:50:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=sDftBc923mGovDHW2Zu62SJ+86lCNevuAEDtbX4f+BM=;
 b=r6+mlmzooEpNkY/jLpTZ9xnIuoQMWHQo+KB8iz9amyVxskB8BNZkxcaOqVOzuBe6snZZ
 PAMmTVwPVmaCX3tYF44Smc+bdD+kQVBo4KVYCKL6W6O9BvZgp/b+QEXUR3xcuYGK6Lh8
 01GAb17HB89xSMomJTdliSJ+jn2PRj6G8CVRrcIbQ+HvuMksgWTKKU99GTFw2ll7Qh31
 q7ztf1Ur7+AQPBLIF2mSFQvnyKZ7bPInBuHahIbuc9p+7yEUkq+QE1ZCPMqzyfWk1uHF
 LXlYUG+SZFIe60z6eu69EBU+/j+S7K8TvM7W5Mq/Dz0IZirHO6TdDXmkeelx9R1ZqRQh uQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4a4s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:50:14 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23Q8oEmZ023239
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:50:14 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4a4s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Apr 2022 01:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1T5tUsl0DY+naf01FMDUG0E6VUxp2Z2WPaOWVxjks1H87eOeAak1UwxLH9vm1Dau+15PxJWoGwNQY9mx+ot7X7x2NQt9djOqlGvwWHESqKQYGgrOGleRS5mCRG+vl51tvknwwK9F5Cwh/vO+t/Y+C9tuXKzVGXCcMZHQ2Qe38b3L9LvIu4qbAGuGtUwUZXSIlcwceiFm2MjcMvyw4jd4wNgIJDrHYubEceZFlCwEC8L2p8iq6YEJS/lhvH4s0ufyMoI3qNPJQvXhTJidu2OwKDXBP4lpJpfT3qJflBvJkzmR2/AX+5w1JVDozzSa0EXsQlDwEcsgbLHXeuz49dphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDftBc923mGovDHW2Zu62SJ+86lCNevuAEDtbX4f+BM=;
 b=Z3QSvxNKhRZTCm6ENUANmONtKmDZTz76mntP+cJcyMdeuNKGT5wffcv1902AtZJZPD5xcBYYg1Yz9dZaRpNDo+YAokMSU/rVoej0kXE5phdTbUjBzActf1Nf1DIg7H0a5o6nkWC9zokFq1HZGCqQq2q2Xh188YcfisyqQdAaF1efrn+ZlN7fmOgW5yeICuMJqlSLfw9z88njGD6UAE+OY7k0c6E1ePqahxMjupNH6/R3mFy4IkB8kwfRFrR9VSXljoANoPxDTfdKBjJV6zeDtouBvkaduNv3mRakgjqbvOPPSDJfhuxzwOhE7ApRL+r037zTJOvN2H9KMbyPYu+v/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MWHPR11MB1695.namprd11.prod.outlook.com (2603:10b6:300:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Tue, 26 Apr
 2022 08:50:11 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::2151:8727:290d:b39b]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::2151:8727:290d:b39b%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:50:11 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Ross Burton <ross.burton@arm.com>,
        "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH V2] cdrkit: add new option
 -eltorito-platform for genimageiso
Thread-Topic: [oe] [meta-oe][PATCH V2] cdrkit: add new option
 -eltorito-platform for genimageiso
Thread-Index: AQHYWUeVDaz8G6gPMUu1iN5Jx3As2K0B4T5x
Date: Tue, 26 Apr 2022 08:50:11 +0000
Message-ID: 
 <MW3PR11MB463301A653E2FD41B0D2B01794FB9@MW3PR11MB4633.namprd11.prod.outlook.com>
References: 
 <CAMKF1soPGSypVZQav130t6HDdpobvomzf2XLQcVpKy2o6ZJDmw@mail.gmail.com>
 <20220426074207.451383-1-hongxu.jia@windriver.com>
 <PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: 
 <PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9@PA4PR08MB7411.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 52b32399-7b80-51b7-b4ee-64a24a572c0e
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 009cf84f-b770-4a2f-03e0-08da2761c5f6
x-ms-traffictypediagnostic: MWHPR11MB1695:EE_
x-microsoft-antispam-prvs: 
 <MWHPR11MB169540C48B63FA0A5BF7DE3594FB9@MWHPR11MB1695.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xQjxDD9VK1BHYw1M1mJe5YQ6YipqlVtIMwwKbORW9etwSTeg3QLYao+wEKo3mpGRRcD8qFWpEGOJvKaYzvF6ul4A21mE2zeHL3+HoM0kmNdNMT4GB119037O/wX/E6kQYZdUobJOyKQRe3cdmfLgzp5BDfb+PbH9BDhMCJVfmPFInV9sSmHbWuT7QYaDfAEyEyAVMMHjhvNsUdrHi8Mupn5fwE82AM1ihwJOxwnWiM1JQT4sN53vLZHY1Tntu1J6ZFk0YIHV1pR5h4aZGqcB15NXZVWK6Jv4VhzYQFMVNtgiv6FR8pAzIMIxckKE4ivcI8+fOROgscMBAogrqom+Fe1d9BbBVTzpHYqUhQvhRlY6pofspP8fMV1XC27GJPwrl5U8WneAA7mCdGxZ6H0djsLlxBR4H/UNFlsplIN1AqVsPwHGoWqy3m6Sh50v5IHoks/8trOcSos+zc5rqcC9ObH3GjoUQrpetGSofEOlvhOZ1WFJo7SeRGKP46qXWHmU1cIrQWddaj8WDZBf1Vh5ixvCzWipAfQlyRo71LjOnWB6w/+XliXAwfsW61lz4UJhzOe4UXw3VJIcZWo2cMrh/5a6EDScKpH1RjbJoT4dCe6ii3KzneZVS5o13R4iXAnIxoN+9MjsUPRnlVWMIUA2KIrIIEcwq19Jp5pcZ54jHe3Nt+ucHL1lgKKaJhU2ptMJ6LtPb0D+1WHIoAWsd/pa4FBDKM/GWUignhMVRN/wH4diVGmfNcAY0OUHYNWEimguSyB0A8PqN2oEvwwRyZIuVzeczkhd5NTI/RhmegkrRPoRH8pAnIaf5WS1/NHk5TDKKk5kIlANHJr7aOtHqMFbdcrOMiugB3C1KGfrGbNkuo8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(38070700005)(186003)(53546011)(7696005)(26005)(6506007)(86362001)(91956017)(508600001)(110136005)(5660300002)(52536014)(8936002)(30864003)(19627405001)(2906002)(55016003)(33656002)(122000001)(66446008)(66476007)(4326008)(64756008)(19627235002)(9686003)(66556008)(8676002)(76116006)(66946007)(166002)(316002)(966005)(71200400001)(21314003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?VAzGuCpMlENhYWgOkJ3KwOB9gJZha7iQjojch7twisGCVvuTipXR1KPV?=
 =?Windows-1252?Q?941k7gN5XxyPitWblaLQA8WmV2avPLL2gdZ2ZEADGnqwU9gHlowXYdDH?=
 =?Windows-1252?Q?Ua1ZK+rzDffL8AhfBuyfNUXTlu0+WqedeWDMMxnHMgMjbrCw8g+WAg9j?=
 =?Windows-1252?Q?pUd5YE+ptGyOg2mpCopebwcuo6F/6UfEwrAt78xE6fLfIRtKGvVD3lx9?=
 =?Windows-1252?Q?PxWws4EbmSbUwyyhwZai3W2x40z0bNodpIWIDEsA6/L0ynW4JL+VrC5W?=
 =?Windows-1252?Q?Fx+/nldE6S3h+N5KecrH43fVSnBWNZ+UNH0wRcF8oFXzVMHpFiNEdyl+?=
 =?Windows-1252?Q?lAUoKOCO5M+Jrbxz8rflVyWkhXPE8QFTHD4JHGhVq+RlEJ5HpuVFrDpl?=
 =?Windows-1252?Q?9F9GXvUMAfjkFuuKoxID8jwcLwpy0nF22noxzzlu7MiLJN/+gZaWvFmP?=
 =?Windows-1252?Q?5S9KqFgHTvYIpuVkuDU+2rHIc/qXpHpmnGuKdWzHo5AejMAJUGS4dl7E?=
 =?Windows-1252?Q?DUNHzwFq5B577ZCgp3/I6wHpkYocyXQPejugNMcBPmE+9dlcfrPq7uc2?=
 =?Windows-1252?Q?rjQBWGVkbJPg6q78b/SJ7yY+NNM7zj3TU3IW4y6qanrXCWRiqUDyac4O?=
 =?Windows-1252?Q?1rmEimHMUoY/6l7Q5HqgDOwrU6FnxTRFC8WWKL8BsyGbKmZklplijUL8?=
 =?Windows-1252?Q?1Hosqa5GWyJWPfuWAbaf4TKpcKF6pptCQUvYTnt5mz/dbH5d9OOca2/+?=
 =?Windows-1252?Q?eG+GoxKVVu+HVg7Xrl2PoC8x+T2EGQVpAcRjSWzkUqxFbjiu2pt/2laL?=
 =?Windows-1252?Q?3M1Xs3WY6VuLWo0b/3c5fSp9/gZQ6z03ONKN288+PpbnRVqnKFOUrZza?=
 =?Windows-1252?Q?PWZ1MvCM4EYsOZlrAXW5T+kgxx4/TlcRRlWfaGG+2CaSGaRjKL2UIx/q?=
 =?Windows-1252?Q?IIx+REGAG9/ehs0qk5T9rMvpmjc9d0wS6kRl/j13wCOu8/aDM0/UizWP?=
 =?Windows-1252?Q?KN3T2EKAVgAX2RQ0hjQBdzF63oC8uNMQFVwej/cpkjNLjUioOWijAfdh?=
 =?Windows-1252?Q?bcyeKdm9ormfYyPl3VhuciNBchknLNCdszAa0nRv+wC6CKgq3W9K5y5Y?=
 =?Windows-1252?Q?TypCzDRF88UuAeaaWikUdTHFqh3fkiS2fpFZ2t/uRPo1hCb1DIX+DPHu?=
 =?Windows-1252?Q?qz+M7PoVy6PMNZd3lYjlbtmiOalkExY0BU6+vcQw0BSYBScjlO05sC5o?=
 =?Windows-1252?Q?dySEE4xtf9MO7pWV5oITNSdTC5t952+LIRKanPDSeVVy5IhxU3+3BiZH?=
 =?Windows-1252?Q?JUBDLU8j5wqnEGSWoyrsTYUMV89/7MqOjntFav72UBRvmkBnYOPKfJzc?=
 =?Windows-1252?Q?pliIAMNOk7enXP09+vkDlw5T/SA/7TPNMEtffGGK/s5DQ9eXWRum7OGn?=
 =?Windows-1252?Q?nTDTWC3zIOYZRPnDo1e2cCcNIU8kAND13pUcQX6sWEc+fRpn+AF2x/63?=
 =?Windows-1252?Q?BalejIV+fh2qZFbj0d4kbc4Gj/2XoUt/HlHtrCqJyCHmtJn52jU+C1D1?=
 =?Windows-1252?Q?Srsm50qDcr6TKVGYgZX5OY2xa1zQw666UX4V2KHtFaTDOwbVKLdAn7UJ?=
 =?Windows-1252?Q?YqqEyFuHfpUlmBI7qpu0UT3J8ZA00DmxsTCw8fhA41Ve0KLrKFzI4U2J?=
 =?Windows-1252?Q?FHjS6fnss9DJv/XeFjkY/8Jd1oK5HFX/zZmsG04m0jLlw8hRtkvpkegF?=
 =?Windows-1252?Q?ejNo4JyApYwQ3k2EzoJpz1kfOi4z1GnlnbYWsdtmClKM4N4kAo2L8B6L?=
 =?Windows-1252?Q?zhbfl3r942ewMyPrwcMnbS69YJBsM/UNpyriZCJBpZpj9SFSL6T034IG?=
 =?Windows-1252?Q?xGKF+2uKNWbfwg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB463301A653E2FD41B0D2B01794FB9MW3PR11MB4633namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 009cf84f-b770-4a2f-03e0-08da2761c5f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 08:50:11.2735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 qfTje8maprWFIpq63Ln3pzYHuUmDPoxcMKDzafkkZv/COCVik6bsZ00vP97Q8yLafIYWu03z5muJwOaoEK2bkcODQGVY9qht3tEunlQ+nx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1695
X-Proofpoint-GUID: 01NqIHvswk9U91cPviEdlRZNoplAZhvN
X-Proofpoint-ORIG-GUID: fKWD8a0UzQD-WLGAtc8Jvwiw81EvvQQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 08:50:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96796

--_000_MW3PR11MB463301A653E2FD41B0D2B01794FB9MW3PR11MB4633namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks for pointing out the license issue, this patch ports from 4 source f=
iles of cdrtools,
and both of them are `either GPL version 2, or (at your option) any later v=
ersion.'

https://github.com/jobermayr/cdrtools/blob/master/mkisofs/mkisofs.c#L16
https://github.com/jobermayr/cdrtools/blob/master/mkisofs/mkisofs.h#L10
https://github.com/jobermayr/cdrtools/blob/master/mkisofs/iso9660.h#L11
https://github.com/jobermayr/cdrtools/blob/master/mkisofs/eltorito.c#L17

Both of cdrtools(2013)[1] and cdrkit(2010)[2] are not alive, I do not plan =
to send it to upstream cdrkit

[1] https://github.com/Distrotech/cdrtools.git
[2] https://github.com/Distrotech/cdrkit.git


//Hongxu
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Ross Burton <ross.burton@arm.com>
Sent: Tuesday, April 26, 2022 4:27 PM
To: Jia, Hongxu <Hongxu.Jia@windriver.com>; raj.khem@gmail.com <raj.khem@gm=
ail.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: Re: [oe] [meta-oe][PATCH V2] cdrkit: add new option -eltorito-plat=
form for genimageiso


[Please note: This e-mail is from an EXTERNAL e-mail address]

Have you carefully examined the license of the files that you=92re copying =
from mkisofs: the cdrkit fork exists specifically because cdrtools relicens=
ed to CDDL[1] which is GPL-incompatible.



Also, are we going to be carrying this forever, or is upstream cdrkit going=
 to merge the same code?



Ross

[1] https://lwn.net/Articles/195167/<https://urldefense.com/v3/__https://lw=
n.net/Articles/195167/__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7h92q8WlvESx=
Iau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjsAhuucWI$>



From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of hongxu via lists.openembedded.org<https://url=
defense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!btpKzzhENE4M=
Tn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjsOMyxYoc=
$> <hongxu.jia=3Dwindriver.com@lists.openembedded.org>
Date: Tuesday, 26 April 2022 at 08:42
To: raj.khem@gmail.com <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [meta-oe][PATCH V2] cdrkit: add new option -eltorito-platform=
 for genimageiso

Mkisofs/genimageiso now correctly supports El Torito multi boot entries by
introducing a Boot Dection Header before a list of alternate boot entries.

New option -eltorito-platform allows to set the El Torito platform id
for a boot entry or for a list of boot entries. Supported values for
the parameter are:
-   x86 the standard value vor x86 based PCs
-   PPC the Power PC platform
-   Mac The Apple Mac platform
-   efi EFI based boot for PCs
-   #   an arbitrary numerical value

Port implement from cdrtools:
https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca696=
8ca2296fd7<https://urldefense.com/v3/__https://github.com/jobermayr/cdrtool=
s/commit/a50804fd61d75eb689a515dbfca6968ca2296fd7__;!!AjveYdw8EvQ!btpKzzhEN=
E4MTn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjsnFq2=
zSQ$>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |   1 +
 ...001-add-new-option-eltorito-platform.patch | 335 ++++++++++++++++++
 2 files changed, 336 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-op=
tion-eltorito-platform.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<https://url=
defense.com/v3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5Ip=
Qis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$> b/m=
eta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<https://urldefense.com/v3=
/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7h92q8Wl=
vESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$>
index dd0405c95..757f99d1f 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<https://urldefense=
.com/v3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7=
h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$>
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<https://urldefense=
.com/v3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7=
h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$>
@@ -11,6 +11,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.=
orig.tar.gz \
            file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch=
<file:///0001-define-__THROW-to-avoid-build-issue-with-musl.patch> \
            file://0002-Do-not-use-rcmd-on-build-with-musl.patch<file:///00=
02-Do-not-use-rcmd-on-build-with-musl.patch> \
            file://0001-genisoimage-Add-missing-extern-definition.patch<fil=
e:///0001-genisoimage-Add-missing-extern-definition.patch> \
+           file://0001-add-new-option-eltorito-platform.patch<file:///0001=
-add-new-option-eltorito-platform.patch> \
            "
 SRC_URI:append:class-nativesdk =3D " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch<file://=
/0001-install-netscsid-to-bin-for-nativesdk.patch> \
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-el=
torito-platform.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-ne=
w-option-eltorito-platform.patch
new file mode 100644
index 000000000..dac3328a4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-eltorito-=
platform.patch
@@ -0,0 +1,335 @@
+From 5a2d571f3687910260c45841725f2deb84c8f12e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 Apr 2022 18:18:00 +0800
+Subject: [PATCH] add new option -eltorito-platform
+
+Mkisofs now correctly supports El Torito multi boot entries by introducing
+a Boot Dection Header before a list of alternate boot entries.
+
+New option -eltorito-platform allows to set the El Torito platform id
+for a boot entry or for a list of boot entries. Supported values for
+the parameter are:
+-   x86 the standard value vor x86 based PCs
+-   PPC the Power PC platform
+-   Mac The Apple Mac platform
+-   efi EFI based boot for PCs
+-   #   an arbitrary numerical value
+
+Upstream-Status: Inappropriate [port from cdrtools]
+https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca69=
68ca2296fd7<https://urldefense.com/v3/__https://github.com/jobermayr/cdrtoo=
ls/commit/a50804fd61d75eb689a515dbfca6968ca2296fd7__;!!AjveYdw8EvQ!btpKzzhE=
NE4MTn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjsnFq=
2zSQ$>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ genisoimage/eltorito.c    | 73 +++++++++++++++++++++++++++++++++++++--
+ genisoimage/genisoimage.c | 47 +++++++++++++++++++++++++
+ genisoimage/genisoimage.h |  8 +++++
+ genisoimage/iso9660.h     | 33 ++++++++++++++++--
+ 4 files changed, 157 insertions(+), 4 deletions(-)
+
+diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c
+index d52e17e..a804988 100644
+--- a/genisoimage/eltorito.c
++++ b/genisoimage/eltorito.c
+@@ -56,6 +56,7 @@ static unsigned int bcat_de_flags;
+ void  init_boot_catalog(const char *path);
+ void  insert_boot_cat(void);
+ static        void    get_torito_desc(struct eltorito_boot_descriptor *bo=
ot_desc);
++static        void    fill_boot_shdr(struct eltorito_sectionheader_entry =
*boot_shdr_entry, int arch);
+ static        void    fill_boot_desc(struct eltorito_defaultboot_entry *b=
oot_desc_entry,
+                                                                          =
      struct eltorito_boot_entry_info *boot_entry);
+ void  get_boot_entry(void);
+@@ -282,7 +283,14 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)
+        struct directory_entry  *de2;   /* Boot catalog */
+        int                     i;
+        int                     offset;
++      int                     arch =3D 0;
++      int                     nentries =3D 0;
+        struct eltorito_defaultboot_entry boot_desc_record;
++      struct eltorito_sectionheader_entry boot_shdr_record;
++#ifdef __needed__
++      struct eltorito_section_entry boot_section_record;
++#endif
++      struct eltorito_sectionheader_entry *last_section_header =3D 0;
+
+        memset(boot_desc, 0, sizeof (*boot_desc));
+        boot_desc->type[0] =3D 0;
+@@ -311,13 +319,22 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)
+        set_731(boot_desc->bootcat_ptr,
+                (unsigned int) get_733(de2->isorec.extent));
+
++      /*
++       * If the platform id for the first (default) boot entry has not be=
en
++       * explicitly set, we default to EL_TORITO_ARCH_x86
++       */
++      if ((first_boot_entry->type & ELTORITO_BOOT_ID) =3D=3D 0) {
++              first_boot_entry->boot_platform =3D EL_TORITO_ARCH_x86;
++      }
++      arch =3D first_boot_entry->boot_platform;
++
+        /*
+         * we have the boot image, so write boot catalog information
+         * Next we write out the primary descriptor for the disc
+         */
+        memset(&valid_desc, 0, sizeof (valid_desc));
+        valid_desc.headerid[0] =3D 1;
+-      valid_desc.arch[0] =3D EL_TORITO_ARCH_x86;
++      valid_desc.arch[0] =3D arch;  /* Platform id for the default boot *=
/
+
+        /*
+         * we'll shove start of publisher id into id field,
+@@ -351,8 +368,17 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)
+                current_boot_entry !=3D NULL;
+                current_boot_entry =3D current_boot_entry->next,
+                offset +=3D sizeof (boot_desc_record)) {
++              int newarch =3D arch;
+
+-              if (offset >=3D SECTOR_SIZE) {
++              if (current_boot_entry->type & ELTORITO_BOOT_ID)
++                      newarch =3D current_boot_entry->boot_platform;
++              else
++                      current_boot_entry->boot_platform =3D arch;
++
++              /*
++               * El Torito has no such limitation but we currently have..=
.
++               */
++              if (offset >=3D (SECTOR_SIZE - sizeof (boot_desc_record))) =
{
+ #ifdef        USE_LIBSCHILY
+                        comerrno(EX_BAD,
+                        "Too many El Torito boot entries\n");
+@@ -362,12 +388,53 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)
+                        exit(1);
+ #endif
+                }
++
++              if (current_boot_entry =3D=3D first_boot_entry) {
++                      ;
++                      /* EMPTY */
++              } else if ((current_boot_entry =3D=3D first_boot_entry->nex=
t) ||
++                          (arch !=3D newarch) ||
++                          (current_boot_entry->type & ELTORITO_SECTION_HE=
ADER)) {
++                      if (last_section_header)
++                              set_721(&last_section_header->entry_count, =
nentries);
++                      nentries =3D 1;
++                      last_section_header =3D (struct eltorito_sectionhea=
der_entry *)
++                                                      (de2->table + offse=
t);
++                      fill_boot_shdr(&boot_shdr_record, newarch);
++                      memcpy(de2->table + offset, &boot_shdr_record,
++                                              sizeof (boot_shdr_record));
++                      offset +=3D sizeof (boot_desc_record);
++              } else {
++                      nentries++; /* Add entry to this section header */
++              }
++              /*
++               * This works because a section entry has the same essentia=
l
++               * layout as a default entry (and we do not populate the
++               * selection criteria fields).
++               */
++
+                fill_boot_desc(&boot_desc_record, current_boot_entry);
+                memcpy(de2->table + offset, &boot_desc_record,
+                                        sizeof (boot_desc_record));
+        }
++
++      if (last_section_header) {
++              set_721(&last_section_header->entry_count, nentries);
++              last_section_header->header_id[0] =3D EL_TORITO_SHDR_ID_LAS=
T_SHDR;
++      }
++
+ }/* get_torito_desc(... */
+
++static void
++fill_boot_shdr(boot_shdr_entry, arch)
++      struct eltorito_sectionheader_entry *boot_shdr_entry;
++      int                 arch;
++{
++      memset(boot_shdr_entry, 0, sizeof(struct eltorito_sectionheader_ent=
ry));
++      boot_shdr_entry->header_id[0] =3D EL_TORITO_SHDR_ID_SHDR;
++      boot_shdr_entry->platform_id[0] =3D arch;
++}
++
+ static void
+ fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,
+                                        struct eltorito_boot_entry_info *b=
oot_entry)
+@@ -678,7 +745,9 @@ get_boot_entry()
+        if (!first_boot_entry) {
+                first_boot_entry =3D current_boot_entry;
+                last_boot_entry =3D current_boot_entry;
++              current_boot_entry->boot_platform =3D EL_TORITO_ARCH_x86;
+        } else {
++              current_boot_entry->boot_platform =3D last_boot_entry->boot=
_platform;
+                last_boot_entry->next =3D current_boot_entry;
+                last_boot_entry =3D current_boot_entry;
+        }
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c
+index 9089081..84ac3c2 100644
+--- a/genisoimage/genisoimage.c
++++ b/genisoimage/genisoimage.c
+@@ -271,6 +271,8 @@ struct rcopts {
+        char            **variable;
+ };
+
++static int get_boot_platid(char *opt_arg);
++
+ struct rcopts rcopt[] =3D {
+        {"PREP", &preparer},
+        {"PUBL", &publisher},
+@@ -404,6 +406,7 @@ struct ld_option {
+
+ #define       OPTION_ALLOW_LEADING_DOTS       1070
+ #define       OPTION_PUBLISHER                1071
++#define       OPTION_PLATFORM                 1072
+
+ #ifdef                JIGDO_TEMPLATE
+ #define       OPTION_JTT_OUTPUT               1101
+@@ -528,6 +531,8 @@ static const struct ld_option ld_options[] =3D
+        'b', "FILE", "Set El Torito boot image name", ONE_DASH},
+        {{"eltorito-alt-boot", no_argument, NULL, OPTION_ALT_BOOT},
+        '\0', NULL, "Start specifying alternative El Torito boot parameter=
s", ONE_DASH},
++      {{"eltorito-platform", required_argument, NULL, OPTION_PLATFORM},
++      '\0', "ID", "Set El Torito platform id for the next boot entry", ON=
E_DASH},
+        {{"sparc-boot", required_argument, NULL, 'B'},
+        'B', "FILES", "Set sparc boot image names", ONE_DASH},
+        {{"sunx86-boot", required_argument, NULL, OPTION_SUNX86BOOT},
+@@ -1558,6 +1563,9 @@ int main(int argc, char *argv[])
+                         */
+                        new_boot_entry();
+                        break;
++              case OPTION_PLATFORM:
++                      get_boot_platid(optarg);
++                      break;
+                case OPTION_BOOTALPHA:
+                        use_alphaboot++;
+                        /* list of pathnames of boot images */
+@@ -3829,3 +3837,42 @@ e_malloc(size_t size)
+      memset(pt, 0, size);
+        return (pt);
+ }
++
++static int
++get_boot_platid(char *opt_arg)
++{
++      long    val;
++      char    *ptr;
++
++      use_eltorito++;
++      if (streql(opt_arg, "x86")) {
++              val =3D EL_TORITO_ARCH_x86;
++      } else if (streql(opt_arg, "PPC")) {
++              val =3D EL_TORITO_ARCH_PPC;
++      } else if (streql(opt_arg, "Mac")) {
++              val =3D EL_TORITO_ARCH_PPC;
++      } else if (streql(opt_arg, "efi")) {
++              val =3D EL_TORITO_ARCH_EFI;
++      } else {
++              val =3D strtol(opt_arg, &ptr, 0);
++              if (*ptr || val < 0 || val >=3D 0x100) {
++                      comerrno(EX_BAD, "Bad boot system ID.\n");
++              }
++      }
++
++      /*
++       * If there is already a boot entry and the boot file name has been=
 set
++       * for this boot entry and the new platform id differs from the
++       * previous value, we start a new boot section.
++       */
++      if (current_boot_entry &&
++          current_boot_entry->boot_image !=3D NULL &&
++          current_boot_entry->boot_platform !=3D val) {
++          new_boot_entry();
++      }
++      get_boot_entry();
++      current_boot_entry->type |=3D ELTORITO_BOOT_ID;
++      current_boot_entry->boot_platform =3D val;
++      return (1);
++}
++
+diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
+index 82c859b..1170d89 100644
+--- a/genisoimage/genisoimage.h
++++ b/genisoimage/genisoimage.h
+@@ -299,6 +299,14 @@ struct eltorito_boot_entry_info {
+        int             boot_info_table;
+        int             load_size;
+        int             load_addr;
++
++#define       ELTORITO_BOOT_ID    1
++#define       ELTORITO_SECTION_HEADER 2
++      int     type;
++      /*
++       * Valid if (type & ELTORITO_BOOT_ID) !=3D 0
++       */
++      int     boot_platform;
+ };
+
+ extern int    goof;
+diff --git a/genisoimage/iso9660.h b/genisoimage/iso9660.h
+index c74c2a9..61b6fc0 100644
+--- a/genisoimage/iso9660.h
++++ b/genisoimage/iso9660.h
+@@ -62,6 +62,7 @@ struct iso_volume_descriptor {
+ #define       EL_TORITO_ARCH_x86      0
+ #define       EL_TORITO_ARCH_PPC      1
+ #define       EL_TORITO_ARCH_MAC      2
++#define       EL_TORITO_ARCH_EFI      0xEF
+
+ #define       EL_TORITO_BOOTABLE      0x88
+ #define       EL_TORITO_NOT_BOOTABLE  0
+@@ -159,10 +160,15 @@ struct eltorito_boot_descriptor {
+ };
+
+ /* Validation entry for El Torito */
++/*
++ * headerid must be 1
++ * id is the manufacturer ID
++ * cksum to make the sum of all shorts in this record 0
++ */
+ struct eltorito_validation_entry {
+        char headerid                   [ISODCL(1,    1)]; /* 711 */
+        char arch                       [ISODCL(2,    2)];
+-      char pad1                       [ISODCL(3,    4)]; /* 711 */
++      char pad1                       [ISODCL(3,    4)]; /* 721 */
+        char id                         [ISODCL(5,   28)]; /* CD devel/man=
*/
+        char cksum                      [ISODCL(29,  30)];
+        char key1                       [ISODCL(31,  31)];
+@@ -173,7 +179,7 @@ struct eltorito_validation_entry {
+ struct eltorito_defaultboot_entry {
+        char boot_id                    [ISODCL(1,    1)]; /* 711 */
+        char boot_media                 [ISODCL(2,    2)];
+-      char loadseg                    [ISODCL(3,    4)]; /* 711 */
++      char loadseg                    [ISODCL(3,    4)]; /* 721 */
+        char sys_type                   [ISODCL(5,    5)];
+        char pad1                       [ISODCL(6,    6)];
+        char nsect                      [ISODCL(7,    8)];
+@@ -181,6 +187,29 @@ struct eltorito_defaultboot_entry {
+        char pad2                       [ISODCL(13,  32)];
+ };
+
++/* El Torito section header entry in boot catalog */
++struct eltorito_sectionheader_entry {
++#define    EL_TORITO_SHDR_ID_SHDR      0x90
++#define    EL_TORITO_SHDR_ID_LAST_SHDR 0x91
++      char header_id          [ISODCL(1,    1)]; /* 711 */
++      char platform_id        [ISODCL(2,    2)];
++      char entry_count        [ISODCL(3,    4)]; /* 721 */
++      char id             [ISODCL(5,   32)];
++};
++
++/* El Torito section entry in boot catalog */
++struct eltorito_section_entry {
++      char boot_id            [ISODCL(1,    1)]; /* 711 */
++      char boot_media         [ISODCL(2,    2)];
++      char loadseg            [ISODCL(3,    4)]; /* 721 */
++      char sys_type           [ISODCL(5,    5)];
++      char pad1           [ISODCL(6,    6)];
++      char nsect          [ISODCL(7,    8)];
++      char bootoff            [ISODCL(9,   12)];
++      char sel_criteria       [ISODCL(13,  13)];
++      char vendor_sel_criteria    [ISODCL(14,  32)];
++};
++
+ /*
+  * XXX JS: The next two structures have odd lengths!
+  * Some compilers (e.g. on Sun3/mc68020) padd the structures to even leng=
th.
+--
+2.27.0
+
--
2.27.0

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_MW3PR11MB463301A653E2FD41B0D2B01794FB9MW3PR11MB4633namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for pointing out the license issue, t<span style=3D"color: rgb(0, 0,=
 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">=
his patch ports from 4 source files of cdrtools,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">and both of them are `either GPL version 2, =
or (at your option) any later version.'</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><br>
</div>
<div>https://github.com/jobermayr/cdrtools/blob/master/mkisofs/mkisofs.c#L1=
6</div>
<div>https://github.com/jobermayr/cdrtools/blob/master/mkisofs/mkisofs.h#L1=
0</div>
<div>https://github.com/jobermayr/cdrtools/blob/master/mkisofs/iso9660.h#L1=
1</div>
<div>https://github.com/jobermayr/cdrtools/blob/master/mkisofs/eltorito.c#L=
17</div>
<div><br>
</div>
Both of cdrtools(2013)[1] and cdrkit(2010)[2] are not alive, I do not plan =
to send it to upstream cdrkit<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[1]&nbsp;<a href=3D"https://github.com/Distrotech/cdrtools.git" id=3D"LPlnk=
733827">https://github.com/Distrotech/cdrtools.git</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[2]&nbsp;<a href=3D"https://github.com/Distrotech/cdrkit.git" id=3D"LPNoLPO=
WALinkPreview">https://github.com/Distrotech/cdrkit.git</a></div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<br>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
//Hongxu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Ross Burton &lt;ross.burton@arm.com&gt;<br>
<b>Sent:</b> Tuesday, April 26, 2022 4:27 PM<br>
<b>To:</b> Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;; raj.khem@gmail.com=
 &lt;raj.khem@gmail.com&gt;<br>
<b>Cc:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH V2] cdrkit: add new option -eltori=
to-platform for genimageiso</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
span.x_EmailStyle19
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:72.0pt 72.0pt 72.0pt 72.0pt}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<p></p>
<div style=3D"border:solid #9C6500 1.0pt; padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"x_MsoNormal" style=3D"line-height:12.0pt; background:#FFEB9C"><=
b><span style=3D"font-size:10.0pt; color:#9C6500"></span></b><span style=3D=
"font-size:10.0pt; color:red">[Please note: This e-mail is from an EXTERNAL=
 e-mail address]</span></p>
</div>
<div>
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">Have you carefull=
y examined the license of the files that you=92re copying from mkisofs: the=
 cdrkit fork exists specifically because cdrtools relicensed to CDDL[1] whi=
ch is GPL-incompatible.</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">Also, are we goin=
g to be carrying this forever, or is upstream cdrkit going to merge the sam=
e code?</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">Ross</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">[1] <a href=3D"ht=
tps://urldefense.com/v3/__https://lwn.net/Articles/195167/__;!!AjveYdw8EvQ!=
btpKzzhENE4MTn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LG=
IssjsAhuucWI$">
https://lwn.net/Articles/195167/</a></span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span></p>
<div style=3D"border:none; border-top:solid #B5C4DF 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"f=
ont-size:12.0pt; color:black">From:
</span></b><span style=3D"font-size:12.0pt; color:black">openembedded-devel=
@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; o=
n behalf of hongxu via
<a href=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!Aj=
veYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS=
4UKhLzN4LGIssjsOMyxYoc$">
lists.openembedded.org</a> &lt;hongxu.jia=3Dwindriver.com@lists.openembedde=
d.org&gt;<br>
<b>Date: </b>Tuesday, 26 April 2022 at 08:42<br>
<b>To: </b>raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Cc: </b>openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject: </b>[oe] [meta-oe][PATCH V2] cdrkit: add new option -eltorito-p=
latform for genimageiso</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font=
-size:11.0pt">Mkisofs/genimageiso now correctly supports El Torito multi bo=
ot entries by<br>
introducing a Boot Dection Header before a list of alternate boot entries.<=
br>
<br>
New option -eltorito-platform allows to set the El Torito platform id<br>
for a boot entry or for a list of boot entries. Supported values for<br>
the parameter are:<br>
-&nbsp;&nbsp; x86 the standard value vor x86 based PCs<br>
-&nbsp;&nbsp; PPC the Power PC platform<br>
-&nbsp;&nbsp; Mac The Apple Mac platform<br>
-&nbsp;&nbsp; efi EFI based boot for PCs<br>
-&nbsp;&nbsp; #&nbsp;&nbsp; an arbitrary numerical value<br>
<br>
Port implement from cdrtools:<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/jobermayr/cdrtool=
s/commit/a50804fd61d75eb689a515dbfca6968ca2296fd7__;!!AjveYdw8EvQ!btpKzzhEN=
E4MTn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjsnFq2=
zSQ$">https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515db=
fca6968ca2296fd7</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
---<br>
&nbsp;.../cdrkit/cdrkit_1.1.11.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;...001-add-new-option-eltorito-platform.patch | 335 +++++++++++++++++=
+<br>
&nbsp;2 files changed, 336 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-add-n=
ew-option-eltorito-platform.patch<br>
<br>
diff --git a/meta-oe/recipes-multimedia/cdrkit/<a href=3D"https://urldefens=
e.com/v3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o=
7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$">cdrkit_1.=
1.11.bb</a> b/meta-oe/recipes-multimedia/cdrkit/<a href=3D"https://urldefen=
se.com/v3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5=
o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$">cdrkit_1=
.1.11.bb</a><br>
index dd0405c95..757f99d1f 100644<br>
--- a/meta-oe/recipes-multimedia/cdrkit/<a href=3D"https://urldefense.com/v=
3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7h92q8W=
lvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$">cdrkit_1.1.11.bb=
</a><br>
+++ b/meta-oe/recipes-multimedia/cdrkit/<a href=3D"https://urldefense.com/v=
3/__http://cdrkit_1.1.11.bb__;!!AjveYdw8EvQ!btpKzzhENE4MTn-5IpQis-5o7h92q8W=
lvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjs18XBY54$">cdrkit_1.1.11.bb=
</a><br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_$=
{PV}.orig.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-define-__THROW-to-avoid-build-issue-with-musl.patch">
file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0002-Do-not-use-rcmd-on-build-with-musl.patch">file://0002-Do-n=
ot-use-rcmd-on-build-with-musl.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-genisoimage-Add-missing-extern-definition.patch">
file://0001-genisoimage-Add-missing-extern-definition.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le:///0001-add-new-option-eltorito-platform.patch">file://0001-add-new-opti=
on-eltorito-platform.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI:append:class-nativesdk =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-install-netscsid-to-bin-for-nativesdk.patch">file://0001-i=
nstall-netscsid-to-bin-for-nativesdk.patch</a> \<br>
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-el=
torito-platform.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-ne=
w-option-eltorito-platform.patch<br>
new file mode 100644<br>
index 000000000..dac3328a4<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-eltorito-=
platform.patch<br>
@@ -0,0 +1,335 @@<br>
+From 5a2d571f3687910260c45841725f2deb84c8f12e Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+Date: Mon, 25 Apr 2022 18:18:00 +0800<br>
+Subject: [PATCH] add new option -eltorito-platform<br>
+<br>
+Mkisofs now correctly supports El Torito multi boot entries by introducing=
<br>
+a Boot Dection Header before a list of alternate boot entries.<br>
+<br>
+New option -eltorito-platform allows to set the El Torito platform id<br>
+for a boot entry or for a list of boot entries. Supported values for<br>
+the parameter are:<br>
+-&nbsp;&nbsp; x86 the standard value vor x86 based PCs<br>
+-&nbsp;&nbsp; PPC the Power PC platform<br>
+-&nbsp;&nbsp; Mac The Apple Mac platform<br>
+-&nbsp;&nbsp; efi EFI based boot for PCs<br>
+-&nbsp;&nbsp; #&nbsp;&nbsp; an arbitrary numerical value<br>
+<br>
+Upstream-Status: Inappropriate [port from cdrtools]<br>
+<a href=3D"https://urldefense.com/v3/__https://github.com/jobermayr/cdrtoo=
ls/commit/a50804fd61d75eb689a515dbfca6968ca2296fd7__;!!AjveYdw8EvQ!btpKzzhE=
NE4MTn-5IpQis-5o7h92q8WlvESxIau6EPwQSyrNeleP0hpqJFcs5okmS4UKhLzN4LGIssjsnFq=
2zSQ$">https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515d=
bfca6968ca2296fd7</a><br>
+<br>
+Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+---<br>
+ genisoimage/eltorito.c&nbsp;&nbsp;&nbsp; | 73 +++++++++++++++++++++++++++=
++++++++++--<br>
+ genisoimage/genisoimage.c | 47 +++++++++++++++++++++++++<br>
+ genisoimage/genisoimage.h |&nbsp; 8 +++++<br>
+ genisoimage/iso9660.h&nbsp;&nbsp;&nbsp;&nbsp; | 33 ++++++++++++++++--<br>
+ 4 files changed, 157 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c<br>
+index d52e17e..a804988 100644<br>
+--- a/genisoimage/eltorito.c<br>
++++ b/genisoimage/eltorito.c<br>
+@@ -56,6 +56,7 @@ static unsigned int bcat_de_flags;<br>
+ void&nbsp; init_boot_catalog(const char *path);<br>
+ void&nbsp; insert_boot_cat(void);<br>
+ static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; g=
et_torito_desc(struct eltorito_boot_descriptor *boot_desc);<br>
++static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; f=
ill_boot_shdr(struct eltorito_sectionheader_entry *boot_shdr_entry, int arc=
h);<br>
+ static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; f=
ill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_boot_entry_info *boot_entry);<br>
+ void&nbsp; get_boot_entry(void);<br>
+@@ -282,7 +283,14 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct directory_entry&nbsp; *d=
e2;&nbsp;&nbsp; /* Boot catalog */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; offset;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; arch =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; nentries =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_defaultboot_ent=
ry boot_desc_record;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry boot_s=
hdr_record;<br>
++#ifdef __needed__<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_section_entry boot_section=
_record;<br>
++#endif<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry *last_=
section_header =3D 0;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(boot_desc, 0, sizeof (*b=
oot_desc));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_desc-&gt;type[0] =3D 0;<br=
>
+@@ -311,13 +319,22 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_731(boot_desc-&gt;bootcat_p=
tr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; (unsigned int) get_733(de2-&gt;isorec.extent));<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If the platform id for the first (=
default) boot entry has not been<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * explicitly set, we default to EL_T=
ORITO_ARCH_x86<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((first_boot_entry-&gt;type &amp; ELTOR=
ITO_BOOT_ID) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; first_boot_entry-&gt;boot_platform =3D EL_TORITO_ARCH_x86;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch =3D first_boot_entry-&gt;boot_platfor=
m;<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we have the boot image,=
 so write boot catalog information<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Next we write out the p=
rimary descriptor for the disc<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;valid_desc, 0, size=
of (valid_desc));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.headerid[0] =3D 1;<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.arch[0] =3D EL_TORITO_ARCH_x86;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.arch[0] =3D arch;&nbsp; /* Plat=
form id for the default boot */<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we'll shove start of pu=
blisher id into id field,<br>
+@@ -351,8 +368,17 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; current_boot_entry !=3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; current_boot_entry =3D current_boot_entry-&gt;next,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; offset +=3D sizeof (boot_desc_record)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int newarch =3D arch;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (offset &gt;=3D SECTOR_SIZE) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (current_boot_entry-&gt;type &amp; ELTORITO_BOOT_ID)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newarch =3D current_b=
oot_entry-&gt;boot_platform;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&g=
t;boot_platform =3D arch;<br>
++ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * El Torito has no such limitation but we currently have...<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (offset &gt;=3D (SECTOR_SIZE - sizeof (boot_desc_record))) {<br>
+ #ifdef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USE_LIBSCHILY<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comerrno(E=
X_BAD,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Too =
many El Torito boot entries\n&quot;);<br>
+@@ -362,12 +388,53 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(1);<b=
r>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (current_boot_entry =3D=3D first_boot_entry) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* EMPTY */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else if ((current_boot_entry =3D=3D first_boot_entry-&gt;next) ||<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (arch !=3D newarch) ||<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (current_boot_entry-&gt;type &amp; ELTORITO_SECTION_HEADER)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (last_section_head=
er)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; set_721(&amp;last_section_header-&gt;entry_count=
, nentries);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nentries =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last_section_header =
=3D (struct eltorito_sectionheader_entry *)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; (de2-&gt;table + offset);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_boot_shdr(&amp;b=
oot_shdr_record, newarch);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(de2-&gt;table =
+ offset, &amp;boot_shdr_record,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof (boot_shdr_record));=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D sizeof (b=
oot_desc_record);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nentries++; /* Add en=
try to this section header */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * This works because a section entry has the same essential<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * layout as a default entry (and we do not populate the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * selection criteria fields).<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; */<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; fill_boot_desc(&amp;boot_desc_record, current_boot_entry);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; memcpy(de2-&gt;table + offset, &amp;boot_desc_record,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sizeof (boot_desc_record));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (last_section_header) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; set_721(&amp;last_section_header-&gt;entry_count, nentries);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; last_section_header-&gt;header_id[0] =3D EL_TORITO_SHDR_ID_LAST_SHDR;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+ }/* get_torito_desc(... */<br>
+ <br>
++static void<br>
++fill_boot_shdr(boot_shdr_entry, arch)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry *boot_=
shdr_entry;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch;<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(boot_shdr_entry, 0, sizeof(struct e=
ltorito_sectionheader_entry));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_shdr_entry-&gt;header_id[0] =3D EL_TO=
RITO_SHDR_ID_SHDR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_shdr_entry-&gt;platform_id[0] =3D arc=
h;<br>
++}<br>
++<br>
+ static void<br>
+ fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry, <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct eltorito_boot_entry_info *boot_entry)<br>
+@@ -678,7 +745,9 @@ get_boot_entry()<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!first_boot_entry) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; first_boot_entry =3D current_boot_entry;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_boot_entry =3D current_boot_entry;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; current_boot_entry-&gt;boot_platform =3D EL_TORITO_ARCH_x86;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; current_boot_entry-&gt;boot_platform =3D last_boot_entry-&gt;boot_pla=
tform;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_boot_entry-&gt;next =3D current_boot_entry;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_boot_entry =3D current_boot_entry;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c<br>
+index 9089081..84ac3c2 100644<br>
+--- a/genisoimage/genisoimage.c<br>
++++ b/genisoimage/genisoimage.c<br>
+@@ -271,6 +271,8 @@ struct rcopts {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **variable;<br>
+ };<br>
+ <br>
++static int get_boot_platid(char *opt_arg);<br>
++<br>
+ struct rcopts rcopt[] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;PREP&quot;, &amp;prepare=
r},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;PUBL&quot;, &amp;publish=
er},<br>
+@@ -404,6 +406,7 @@ struct ld_option {<br>
+ <br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_ALLOW_LEADING_DOTS&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1070<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_PUBLISHER&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1071<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_PLATFORM&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 1072<br>
+ <br>
+ #ifdef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; JIGDO_TEMPLATE<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_JTT_OUTPUT&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11=
01<br>
+@@ -528,6 +531,8 @@ static const struct ld_option ld_options[] =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'b', &quot;FILE&quot;, &quot;Se=
t El Torito boot image name&quot;, ONE_DASH},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;eltorito-alt-boot&quot;=
, no_argument, NULL, OPTION_ALT_BOOT},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\0', NULL, &quot;Start specify=
ing alternative El Torito boot parameters&quot;, ONE_DASH},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;eltorito-platform&quot;, required_=
argument, NULL, OPTION_PLATFORM},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\0', &quot;ID&quot;, &quot;Set El Torito =
platform id for the next boot entry&quot;, ONE_DASH},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;sparc-boot&quot;, requi=
red_argument, NULL, 'B'},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'B', &quot;FILES&quot;, &quot;S=
et sparc boot image names&quot;, ONE_DASH},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;sunx86-boot&quot;, requ=
ired_argument, NULL, OPTION_SUNX86BOOT},<br>
+@@ -1558,6 +1563,9 @@ int main(int argc, char *argv[])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_boot_e=
ntry();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; case OPTION_PLATFORM:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_boot_platid(optar=
g);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case OPTION_BOOTALPHA:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_alphab=
oot++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* list of=
 pathnames of boot images */<br>
+@@ -3829,3 +3837,42 @@ e_malloc(size_t size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(pt, 0, size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (pt);<br>
+ }<br>
++<br>
++static int<br>
++get_boot_platid(char *opt_arg)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long&nbsp;&nbsp;&nbsp; val;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp; *ptr;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_eltorito++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (streql(opt_arg, &quot;x86&quot;)) {<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_x86;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;PPC&quot;=
)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_PPC;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;Mac&quot;=
)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_PPC;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;efi&quot;=
)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_EFI;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D strtol(opt_arg, &amp;ptr, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (*ptr || val &lt; 0 || val &gt;=3D 0x100) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comerrno(EX_BAD, &quo=
t;Bad boot system ID.\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If there is already a boot entry a=
nd the boot file name has been set<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for this boot entry and the new pl=
atform id differs from the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * previous value, we start a new boo=
t section.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (current_boot_entry &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry=
-&gt;boot_image !=3D NULL &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry=
-&gt;boot_platform !=3D val) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_boot_entry();<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_boot_entry();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&gt;type |=3D ELTORITO_=
BOOT_ID;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&gt;boot_platform =3D v=
al;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (1);<br>
++}<br>
++<br>
+diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h<br>
+index 82c859b..1170d89 100644<br>
+--- a/genisoimage/genisoimage.h<br>
++++ b/genisoimage/genisoimage.h<br>
+@@ -299,6 +299,14 @@ struct eltorito_boot_entry_info {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_info_table;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_size;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_addr;<br>
++<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ELTORITO_BOOT_ID&nbsp;&nbsp;&=
nbsp; 1<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ELTORITO_SECTION_HEADER 2<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; type;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Valid if (type &amp; ELTORITO_BOOT=
_ID) !=3D 0<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; boot_platform;=
<br>
+ };<br>
+ <br>
+ extern int&nbsp;&nbsp;&nbsp; goof;<br>
+diff --git a/genisoimage/iso9660.h b/genisoimage/iso9660.h<br>
+index c74c2a9..61b6fc0 100644<br>
+--- a/genisoimage/iso9660.h<br>
++++ b/genisoimage/iso9660.h<br>
+@@ -62,6 +62,7 @@ struct iso_volume_descriptor {<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_x86&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_PPC&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_MAC&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 2<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_EFI&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0xEF<br>
+ <br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_BOOTABLE&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0x88<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_NOT_BOOTABLE&nbsp; =
0<br>
+@@ -159,10 +160,15 @@ struct eltorito_boot_descriptor {<br>
+ };<br>
+ <br>
+ /* Validation entry for El Torito */<br>
++/*<br>
++ * headerid must be 1<br>
++ * id is the manufacturer ID<br>
++ * cksum to make the sum of all shorts in this record 0<br>
++ */<br>
+ struct eltorito_validation_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char headerid&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char arch&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 711 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char id&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp; 28)]; =
/* CD devel/man*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cksum&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(29,&nbsp; 30)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char key1&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(31,&nbsp; 31)];<br>
+@@ -173,7 +179,7 @@ struct eltorito_validation_entry {<br>
+ struct eltorito_defaultboot_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_id&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_media&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 711 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sys_type&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp;&nbsp; 5)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(6,&nbsp;&nbsp;&nbsp; 6)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char nsect&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(7,&nbsp;&nbsp;&nbsp; 8)];<br>
+@@ -181,6 +187,29 @@ struct eltorito_defaultboot_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad2&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(13,&nbsp; 32)];<br>
+ };<br>
+ <br>
++/* El Torito section header entry in boot catalog */<br>
++struct eltorito_sectionheader_entry {<br>
++#define&nbsp;&nbsp;&nbsp; EL_TORITO_SHDR_ID_SHDR&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 0x90<br>
++#define&nbsp;&nbsp;&nbsp; EL_TORITO_SHDR_ID_LAST_SHDR 0x91<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char header_id&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char platform_id&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char entry_count&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp; 32)];<br>
++};<br>
++<br>
++/* El Torito section entry in boot catalog */<br>
++struct eltorito_section_entry {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 7=
11 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_media&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 7=
21 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sys_type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp;&nbsp; 5)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(6,&nbsp;&nbsp;&nbsp; 6)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char nsect&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; [ISODCL(7,&nbsp;&nbsp;&nbsp; 8)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char bootoff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(9,&nbsp;&nbsp; 12)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sel_criteria&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; [ISODCL(13,&nbsp; 13)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char vendor_sel_criteria&nbsp;&nbsp;&nbsp;=
 [ISODCL(14,&nbsp; 32)];<br>
++};<br>
++<br>
+ /*<br>
+&nbsp; * XXX JS: The next two structures have odd lengths!<br>
+&nbsp; * Some compilers (e.g. on Sun3/mc68020) padd the structures to even=
 length.<br>
+-- <br>
+2.27.0<br>
+<br>
-- <br>
2.27.0</span></p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you. </div>
</div>
</body>
</html>

--_000_MW3PR11MB463301A653E2FD41B0D2B01794FB9MW3PR11MB4633namp_--

