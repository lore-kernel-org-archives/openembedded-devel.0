Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A2C27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 13:27:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5819.1719667619938792965
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jun 2024 06:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79100cc313=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45TDPCSw009561
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 06:26:59 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402dj006a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 06:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiDMnFI01JQYQQf1j3Chay1zOprLwnyqkNubGbT4euTjXtkLdh9d63VsgBDlY+YCr5tSVBqvoHwcACZDcSzGcxczNqH2YtKiHpz6ztc+JyGKaNt50+OMDRfl2rrXiovkmdA3Uv3kDrHsoX46xulGYxRnT48EpfAa4bLvZT6nECbyxsIYbWBLfbtIe8xwyEnroyei6m7d9hbsQxOq8BR/aqSvIHTQUlgwiQzGna9F7YjAyo0V6MEWLYeuDf7Ht+DzbDhhZTc7qiCdImQD5bUZ1pKeAFn77FiE8KiAMsbbviG8ASMDUGXhPOlDUqGwTWlyvVlB7jFcBdSel1QLsAteVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmlISrKJjZtOt0dTJL7XZJsLI7OKal5PBjT2KUhzTKk=;
 b=D1CyMhDo6vweOZzdCTawDkJIq2NlerPLgbJRJcumiiyirOQCqRxV6TeGv4KpD6J+1u50ysVu29hrQepH5s7rrZFJmtHRzbJ2s6nBU8JGRlk2l8uzyTt6HrMw0/nlOH28JRCj6mXUbKnAW42cS+sRTc+3YFqEd1K2V0pjp43tcmO+3TsQMJo+9Ku6L05n4iCzeEeuHAEK33vaSLI24LfWQg+OA41QfIV4bdoqdEX+Eopxwavy0e+KZZ9cuNs0LU5ApTewvn+0MZNFgkNFw0kaJbBQpL44h4io6Gk6pLfUkGrl4+XPCCB6hqFeNXeaLVGf6ymMebtgwfVQinf6MHhSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sat, 29 Jun
 2024 13:26:56 +0000
Received: from IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7]) by IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7%5]) with mapi id 15.20.7698.038; Sat, 29 Jun 2024
 13:26:55 +0000
From: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
Subject: [meta-oe] v4l-utils: do_package_qa: QA Issue: /usr/bin/cec-compliance
 uses 32-bit api 'time'
Thread-Topic: [meta-oe] v4l-utils: do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
Thread-Index: AdrKJ8PIyIBKwlJzTRK3OQOQfB4EWA==
Date: Sat, 29 Jun 2024 13:26:55 +0000
Message-ID: 
 <IA1PR11MB641711E1B9EFCB32A7BA6845DFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6417:EE_|SJ0PR11MB6695:EE_
x-ms-office365-filtering-correlation-id: 09daa0ab-df9e-45f4-c8c8-08dc983f2564
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qNAnvANBFc5d5QJctX23o3LpgAM1qpWebSCBIsO82+xE6daV5HJ+JcyHo77D?=
 =?us-ascii?Q?KSPXMJAG/pB96eqIU3j/khH1nU7/MmTcntonI6p23PFzCufH4wi8PSp4pjUj?=
 =?us-ascii?Q?dsnHXj0m+ekGHxNie69T8LGtH8CJCDY5NX5iW41061xjbv29KZTsz7Wn3ehz?=
 =?us-ascii?Q?Ov8rq8tlMF8LuFyC0x9glL24jobbK8utgytFKcQYPcxvqxXx/UzrvKN+xC2x?=
 =?us-ascii?Q?E6ixbMfoYw+8Dtv2Jlr6v/4SF7A6N/1FlDJpBqa13rzHbdFGdV/KfMHIt3+4?=
 =?us-ascii?Q?fmQvORbt0lTLLdWGZl+hJmvyfLpNC+DU0r4JMzm1xJCXZQpjg+Pn15R4G8kU?=
 =?us-ascii?Q?kqtBzcTU6wS+2G8/0QoPXSwqWQ3MxA23I5VNu5HdIGt1eEHkwpREBYxLz9R4?=
 =?us-ascii?Q?ix+sMFleCo9FGNYK5nQolDxSgbBYrZ1GNmvkcybxsPoi3vZIYDda3Jfdy2n1?=
 =?us-ascii?Q?luNpIFj7hzIm27+SyWrdQE/JGLFZuWx+osoLVhSsg14FybNs06HrwL4xb+2z?=
 =?us-ascii?Q?wxPXrZ05MDw70JxHog3COzR58UQ7xnNyix9tk8sSRmAL/TDkW73A+QagEYxS?=
 =?us-ascii?Q?VpRQdWWno1+73O7J6gLvGWq/36zenVNgZ8ugfE8ZMAfi3q7y3JfrkZpA3nFJ?=
 =?us-ascii?Q?xUKO1hIBY9SgZ/1E76wYnsNkn7iuX2yvsAWAQ/2DPBpNG06iyAffPOP7NkGU?=
 =?us-ascii?Q?VENdh6kNwEscwUgiCoRF/agApTLZRX89j3NQeDVf8WuBn/bjF3rY6HWnHza3?=
 =?us-ascii?Q?aDUlei787PPQhwV3baHtUmwiGOUZAgMdCqM8Y8tpZ50b/kC7UlSbECGe/E6M?=
 =?us-ascii?Q?lfyAo8q58RjyBCYq5I/QRLKEapCU7rIKzMvFRNuhKzubpsEx6biEQSolYaKY?=
 =?us-ascii?Q?6hp5iK+gRUYe3RlvALWuknqJwc9I5tpxH8JCFDunAmG9bMPVbI0qxJ0nsHs6?=
 =?us-ascii?Q?uYZfgeKPpNO5uqgFc1JrRBulHuPEVgeH9fER+XjoMXUZe2DebUYTTx5QNkgx?=
 =?us-ascii?Q?YqruMBEe9LtZRO+w/ky5ga6u3vh3DggyxBNvOoBpDf2NwJHHlnU5xzEKOZak?=
 =?us-ascii?Q?tOUkUCsRS9Qf5EdATpw9pWZxeooIz8iKXx261MSbBknyNHkY0a8F/6TxZHZK?=
 =?us-ascii?Q?D00ZMi/vJpgKzuYPRNPOkfTjRkvNZvAm6ocdB2qV8zvXzxYFLbQhyt/vP/eN?=
 =?us-ascii?Q?3c1to1MGiisS6x42GC8vK3pqB6SdnYGu5mpqXTxgGES9zSxRz+U8ieCQsxoV?=
 =?us-ascii?Q?eNpEFD7sp+gpcq1bdzEUDgw/c8RSTWky/eC+Ly8TkVJZwnMC3UlwaSMcd67x?=
 =?us-ascii?Q?U+U5OY3EgDY7fNPbG1ClIS3S3YTnjiUYerqKGG6kBzzNLIid2LtOtNBFp7HQ?=
 =?us-ascii?Q?49MvDv45s8Iz0dhOMHs3aDG9M+tlNotarcZbKnZwNNqZ9qjHBg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6417.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?S6DAzAa1O8a75hrTMjH/rT+mxb7XCVR8r+oqGxfLg1FLGTQwmXOcD/RSHoQp?=
 =?us-ascii?Q?z8C0VuZTgy1xGsMZ3isWfjkmS9D8x+MPOeYBBHOj+eVqEyGoE0p0+6IuYe1k?=
 =?us-ascii?Q?PHg9y+h+fKVQOq9ejGN4ZxdrQ9BpHc7iI5xubocOXZMtlNlQFjvG0+9ro1u8?=
 =?us-ascii?Q?VRWWdJxlih/6nIv+qq9f0ILlsikxwoQ1/PK0/7htHukvEoAMtBst8UbCIU+S?=
 =?us-ascii?Q?vN1nwQMSpz/GWgCE2Te+xBm7fkFPzNoLa7KCF6wsxw7hE2qPlT3qPsPZhWZM?=
 =?us-ascii?Q?yOi/s9UsVXzZ25Yq3XzActGTIucm4WtXrrkGdm7qm5+oDEXIMkW1leBrt+zr?=
 =?us-ascii?Q?lhpaGNg+nhdLNr9DESHuawSj3DLyDCs9ZJRft3J1/oxFs9220KaOuZmz7tOe?=
 =?us-ascii?Q?v6f04XMwtWwJHFICI188yGrIKMuPD7+SJxIsDewAA6p3Y4nYpnpvwb6aP2+n?=
 =?us-ascii?Q?0He9q/Z73i3YpcpoXF87zC8dq6hxGHmnZQoSCkrEpnIH/KwLshhyRYB6ni2n?=
 =?us-ascii?Q?pXFYHuwugJso5s4hA+M4RXs00KaQOI4BRP9qD8n/AMVZwziNmDcmQq9H+Tg/?=
 =?us-ascii?Q?iIyrATGoFLrVsFGqPMGq8fKDxt/sNiTe9mQIgQeBrtVlNUTawPFbkiVNnfAN?=
 =?us-ascii?Q?fmNLcmDknyykTY7jw7QgpdejNs1GLKBXEIghlAy8QgZ0fVXjeKuO9V32nrMn?=
 =?us-ascii?Q?N/f7c6fSn1yy+XXmWHeXB1yZalNj5is6mTcfQjPaIP1MTY+lSN/YBqVAnP22?=
 =?us-ascii?Q?20tVdBgtOpfLPM5KlJpWXpQ6Ew4rRi+UEW8EZt69HMBV2eGrQ3iw6mZ0l7dc?=
 =?us-ascii?Q?8mHpJFBvTTyN+S5pV5xWm0Yaa7bXoUbR9p3z9TsI4b/fKOutZ3LBptMHpH4g?=
 =?us-ascii?Q?uaqJWnDpDbBKJGEw842N7shZoWSrVN+SmchOM+VF8JQyDnrv4U1BP62xPA8q?=
 =?us-ascii?Q?hOntVfThvTD1KSdyCeI1oNJ02EdBS74WODNXqfa4u9MlpTRJ/dWAg0/WtJJ8?=
 =?us-ascii?Q?MynJDJs5124UHtWz2XpHB9K6jG6vaQJL32Jkc1ZH4TgNx8jLSI8Xhd4Rj/Le?=
 =?us-ascii?Q?COQCA/OCBdRwrBjPj0sBhpX4g3KntHviP3VsDdsFJxPtwOx0fhJRRCMYIGp+?=
 =?us-ascii?Q?JhddA8PWtIFb7/oFf+/uxZTIXiYuOGlFZGhiiBAAUv7jun6uWwIbFYsPZyms?=
 =?us-ascii?Q?EHV8AEl+4PbeigNClcvt6Okqy5xz9H2dPohPQjve1rbofNhabyFwW4uYCnja?=
 =?us-ascii?Q?66/16u2NePiIGCmpyu6xgrwKo870zakzmPJoBGg5hdMceTP/sW7oZp225Ts9?=
 =?us-ascii?Q?zw55ppGrPypI+X+rVLKWugiy7+rBD+hKhfZUebfizVfzWTwYGI1TaP/338lT?=
 =?us-ascii?Q?y/LVUP7WPnp+vkiM/BuIRLoaofLacLYx7I9ZiixeHEemr8dCwvAsd4aHFXW4?=
 =?us-ascii?Q?MqkwESJXo5R7voTvZQEQwR6CYYNYnxK8RzdARhu9njq9s8HUxyhNSYm46uWa?=
 =?us-ascii?Q?Gb6uFIWpeVM/2M7X+jLpfE5inTgEbTBJHnGudz71JAreuib+5hNqt/8tde9o?=
 =?us-ascii?Q?cgZzCz5b2H1Bjez0MTZST0lhWkXP7rwYD8dfr0UUUojCwABVBmFk0NzbgY+O?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6417.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09daa0ab-df9e-45f4-c8c8-08dc983f2564
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 13:26:55.7397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5czIKitR6fIpJEyImNnFH0iaB2rECaJlDbJeIput26F3wJVYpS2/4+ZP9wow29ozLwAlSk6GWayzbsPU2zokjp02i5hQ9G4nU6yypAwaIVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
X-Proofpoint-GUID: ChI1BrJfYiJ4xw-xCtBQKEIYtcBhecYi
X-Proofpoint-ORIG-GUID: ChI1BrJfYiJ4xw-xCtBQKEIYtcBhecYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-29_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=859 malwarescore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406290094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 13:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111159

Hi,

When building 32-bit lib for v4l-utils, met the QA warning issue.

WARNING: lib32-v4l-utils-1.26.1+git-r0 do_package_qa: QA Issue: /usr/bin/ir=
-keytable uses 32-bit api 'ioc
tl'                                                                        =
                             =20
/usr/bin/ir-keytable uses 32-bit api 'stat64'                              =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/media-ctl uses 32-bit api 'ioctl'                                 =
                             =20
/usr/bin/media-ctl uses 32-bit api 'stat64'                                =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/rds-ctl uses 32-bit api 'ioctl'                                   =
                             =20
/usr/bin/rds-ctl uses 32-bit api 'ctime'                                   =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/v4l2-ctl uses 32-bit api 'select'                                 =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'fstat64'                                =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'clock_gettime'                          =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'ioctl'                                  =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'nanosleep'                              =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'fcntl64'                                =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'stat64'                                 =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/v4l2-compliance uses 32-bit api 'select'                          =
                             =20
/usr/bin/v4l2-compliance uses 32-bit api 'fstat64'
/usr/bin/v4l2-compliance uses 32-bit api 'clock_gettime'
/usr/bin/v4l2-compliance uses 32-bit api 'ioctl'
/usr/bin/v4l2-compliance uses 32-bit api 'fcntl64'
/usr/bin/v4l2-compliance uses 32-bit api 'stat64'
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/v4l2-compliance uses 32-bit api 'select'                          =
                             =20
/usr/bin/v4l2-compliance uses 32-bit api 'fstat64'
/usr/bin/v4l2-compliance uses 32-bit api 'clock_gettime'
/usr/bin/v4l2-compliance uses 32-bit api 'ioctl'
/usr/bin/v4l2-compliance uses 32-bit api 'fcntl64'
/usr/bin/v4l2-compliance uses 32-bit api 'stat64'
Suppress with INSANE_SKIP =3D "32bit-time"
/usr/bin/v4l2-sysfs-path uses 32-bit api 'fstat64'
Suppress with INSANE_SKIP =3D "32bit-time"
/usr/bin/decode_tm6000 uses 32-bit api 'ioctl'
/usr/bin/decode_tm6000 uses 32-bit api 'select'
Suppress with INSANE_SKIP =3D "32bit-time"
/usr/bin/cec-compliance uses 32-bit api 'ctime'
/usr/bin/cec-compliance uses 32-bit api 'localtime'
/usr/bin/cec-compliance uses 32-bit api 'clock_gettime'
/usr/bin/cec-compliance uses 32-bit api 'ioctl'
/usr/bin/cec-compliance uses 32-bit api 'gettimeofday'
/usr/bin/cec-compliance uses 32-bit api 'fcntl64'
/usr/bin/cec-compliance uses 32-bit api 'time'
/usr/bin/cec-compliance uses 32-bit api 'select'
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/cec-compliance uses 32-bit api 'ctime'                            =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'localtime'                        =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'clock_gettime'                    =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'ioctl'                            =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'gettimeofday'                     =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'fcntl64'                          =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'time'                             =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'select'                           =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20

After investigating,
meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
#v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to #both 32 and =
64 bit file APIs.  But it does not handle the time side?
#Needs further investigation
GLIBC_64BIT_TIME_FLAGS =3D ""

GLIBC_64BIT_TIME_FLAGS =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" wh=
ich defined in oe-core/meta/conf/distro/include/time64.inc was reset, so re=
sult in this QA issue.
=20
when comment GLIBC_64BIT_TIME_FLAGS =3D "" , there is build error.
/build-v4l/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-v4l-utils/1.26.1+=
git/lib32-recipe-sysroot/usr/include/features-time64.h:26:5: error: #error =
    "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64"
26 | #   error "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64=
"

the build error is caused by v4l-utils meson.build:
v4l2_wrapper_args =3D [
    # As the library needs to provide both 32-bit and 64-bit versions
    # of file operations, disable transparent large file support (fixes
    # 'Error: symbol `open64/mmap64' is already defined' compile failure
    # otherwise)
    '-U_FILE_OFFSET_BITS',
    '-D_FILE_OFFSET_BITS=3D32',
    '-D_LARGEFILE64_SOURCE',
]

D_FILE_OFFSET_BITS was reset to 32 during compile.

Is there any solution for this issue?

Thanks,
Haixiao

