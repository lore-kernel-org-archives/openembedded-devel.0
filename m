Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EF6ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 20:04:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.15185.1663272266624892826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NE+/8OfT;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6257311d64=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28FIeiPu015175
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:04:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=itI2yIYxRubYPVjCIMi2bfV8NcKswv3D11zo5w5/A6A=;
 b=NE+/8OfT1pwk38AUS2DxyJvf6R+UIY9j4wsmIqUr+6NKWysMDzhjv8fQzkPmiZZHLlWU
 kEy95Gp0KPvrcMVKJ8QC8NeUX1GbmXVJwaS8L9k1ffrMl98xVtX3lwBfEc2hcFRTAbdA
 mcgbXxkB2AbTxyGuTe7tkDNreknFCTmUxDBFKctfHRqdMv7M8PvYCeDxi1y6e5aLaHVg
 4xqr6KtonZpUrMbrlNmkWqSvydHqJOwu5TL1n7l9Pd13swCJ+k+KP5LoQIj+KuP0sCyv
 gWFZiyI8FyjhD+jQkVvg6ObyZ/UM9TEUmRZE2LvsrxuJq0jLndjNBu3/HCVHr8Thr+fQ 4A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ydr30u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:04:25 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28FK3630003848
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:04:25 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ydr30t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 13:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUeCVsDHP/mlj2NuJwmWKvjARFiAX6D3M74Oeu5WLuYHLeZZGy2V30mX9lD4Mvg1sIDi6aIy3YX7dlbblpAGaLeNwKe6OacH7iAgvrFVv9KvrDpnRPozCj8qcAYkYvsJMj1nCc9/D7+7khBbxRj/usWVEivPKoYPtGipJc6gulmh/5sV+/dnJfWpVqqq37Pfc1X8tp23Ff+T1KdvZkvcOTjcAac3gFqzM8iFwAp7IGoIPDYRaT8fPuUJQMYyOg3YW+3rGsrcGtuyOJ4ENArAuGFfaHS18lATmuK6mfjjtzPe+Wnn28hZDPBCcqar97C3zIAwc4V6BrVgiKLxy+zJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itI2yIYxRubYPVjCIMi2bfV8NcKswv3D11zo5w5/A6A=;
 b=eCv65vTfemPj+VW59JWpP75eaLOOUFSoM11geB8vgy/vyhQtik/SgaSCay54qYTuHc6kukWshvs4l7gWs3V1rHFyUYNTuOpBdTOrMyU3hNK/xeA7LtM2Izk420PQ20JF7JMt/L1v2uQOU7lRNhYIFnhOLj6bZsgGCBgnIlifvOzVrZZdQqN8l4f41Ol57epJaHVr+9qNsv+IMWxD7j6Rwm+a3B5vzZR2QmEXUOKe8krjqzf1kkUaFeI124f0jNEEsRGrWnJS9hKAEjVjU5ZxMKuGnRuzXpBJxpTVIfg12GdZVfLFtpxEutpT1qXsuX4iWf/OZ9iasP+VwZ46GF9LWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Thu, 15 Sep
 2022 20:04:23 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635%7]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 20:04:22 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe] [PATCH] jq: add ptest
Thread-Topic: [oe] [PATCH] jq: add ptest
Thread-Index: AQHYyRWB0Fjp7XqAq0m9Dwlmo0D3xK3gsq2AgAAXjPA=
Date: Thu, 15 Sep 2022 20:04:22 +0000
Message-ID: 
 <DM4PR11MB55365C7467B46A23B5FF5F4EE6499@DM4PR11MB5536.namprd11.prod.outlook.com>
References: <20220915151146.29844-1-zheng.qiu@windriver.com>
 <2025F5CA-89E9-4AA3-98F2-BCAE10C8543F@arm.com>
In-Reply-To: <2025F5CA-89E9-4AA3-98F2-BCAE10C8543F@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|SJ0PR11MB4927:EE_
x-ms-office365-filtering-correlation-id: 14dbcac8-2db5-4223-b033-08da97557ba6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VLoQcRJeJ8DiX/hJqbNJlUIRU2q+Kixz6cmZ+XDVOyZwC+oUVFN2/Pqc5lQxOkiRVntBWCL91lPOysq2lLk7LsSnKz9S3leCZLbNU+7SwdXv0j5ZVXpNo/7BFnFw9vPFdT3AfpOvsoq8XqDh0fsFA2RNHqM21MJO7hLmsAgY6bLPCWxkcrzm++vFPZcpPZ0nrUFzjtrOiU1VraWZJP1Y0S3OwRpFDN7cQ0tZBNu2b6snOkS0giV9JRy/pPjNUse/luA522fYbya2X2egzBic+M9eg2bLR90yKXP2AfKogzdpOqVTHZybIyDLFvZ1LUQdjkXEKm0UOqEuZ7yeqvdsz+ynzfzSU11iZf+z/NhKKfkxBigt6vJXIG2t4FdJb6RNqw3D8rU25voyfE4zDAdZ/QZ1mbhsobcSaRkn9OaHt/4BlUscRD4mt3oVUFP5oek+Q0GmCPM0DVzwb3uo55E9F5XRrN+wFzg87QwIPKXwSTu0bz7ClIa60gx4tnZSnanswu5HY5id+IpTaP8RbSH0ElREDOf68E9kNcVkgPIERz5SPNalEow5JEXNXDwo41wuPeffjjXPHCbfHZh1uPUsiKzvv76b4N1UMHXQQIGFqaVG41N/SAvWoMsdeCAHUVPoFCv7IQWTz/Mmsy75pIiU1eiv0vdOnIZqpFy3r48ZPNz8goo1BiYVMUptTrD+BgM/0x5ZSXY8vbcGnxlYw7ZsCW5Evm9yGp7a4p7FWLVtn0hiTFZkAf5hCkT7whSrMYKDfgko6o6g7w/JQuLy4eJmGlpPsm17Q9spcFlUiLYn2WA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(39850400004)(376002)(451199015)(86362001)(33656002)(38100700002)(8676002)(122000001)(66556008)(66946007)(52536014)(64756008)(38070700005)(76116006)(66446008)(4326008)(54906003)(66476007)(6916009)(316002)(8936002)(55016003)(478600001)(2906002)(5660300002)(186003)(83380400001)(966005)(71200400001)(53546011)(7696005)(6506007)(9686003)(107886003)(26005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0twaVJIeHZxVVRnb3ljSGplUE9PelE3dVlITUZPNy9iRTlYQTJFSVIxbjFw?=
 =?utf-8?B?K20xdzk5czRDM1VCc0d1N2lCU2RUcnlCVllud0NBOEhJRnpmYjRMeEUyTnYw?=
 =?utf-8?B?ZTNQN0xCcmw0Znc1TzdySFliTzZtaE5pRlU0TUpweU9VRUQrZzdVV1RHVGxa?=
 =?utf-8?B?WG9VdXJPUEx2dHFCQ2VmNSs5YXZvWm1qRjZwSVpoZ1Nlc3ZMZXJaNWtSQnVW?=
 =?utf-8?B?bkJBVG51WXR6dTV0YVQxQkZvR1BHZklDTThhUFRiTDlvVFBMbWpkU2VXYzNL?=
 =?utf-8?B?TDJGdmMxNHlnN1BjZHl1Q0dUMEIzSEM1bTF5b3ZueWFuMDVpT3g4SmNxSE9y?=
 =?utf-8?B?N0xKYzk0Uk5XZUJENnhCT3o2dFhwZGs0WnZudThYcVJWYlgyQjgzMmZBaGFT?=
 =?utf-8?B?aXVOQ3RoYVVyMVFmanFTN1lwcWowM0NtbnB5Y3BFc2JZd1ZicjVkNW1qSjNW?=
 =?utf-8?B?VnRGSUtyV2FqVm81NVkvTVRORTNxUmpXZmhQQXBwWERhTzNUWG1iNjJKbUR0?=
 =?utf-8?B?eGE4YjVNSXdNWXd5QmtobS8zR3k4dmRta1M3a2gvNFN2VEtrUkM0S054aFAy?=
 =?utf-8?B?aW9VQm5XTXpJa2V6RTJIR2ZOeGhDd2pVbzZvVGNsM3BBMCtzRXFJNXZzTUxT?=
 =?utf-8?B?MXhnZHQySmxMSEUvOFRINGF1bFd5UkY3RWhaaS9mZEJkSWY4MEZIU1hSZHZG?=
 =?utf-8?B?V0RCbGd4Mjc4bHl1d003SE9maGhRMWpxZmgyaUM2Ulh3M3hQaElZd1Qycjc0?=
 =?utf-8?B?ZkNWWlcyajF1ZHZnMGFHWHBkVlBqN0VtZVhCQXdqWDRTaXd3YWJoQ3BEOW9l?=
 =?utf-8?B?OVVsSWhKUEtrV2RqbjFJT1AweGZUOEpaWmZ5cXpaaWc2b0ZOVGc5c3VvVG00?=
 =?utf-8?B?Uzk0SW83SjdhMGlEVnF2MEVxSm1IV0xrNkhMWGxQRVZGc2xBdWFJN1hWNUEy?=
 =?utf-8?B?V3hNUmo5c1JLZy8zNURlVTE5V1pock45TDlVd1VJajhKMWYwcWVWeFVFclpa?=
 =?utf-8?B?OGxwNlNZWG4zOXlBb0VlOXIvR1M3Q0xJZmtBZmp5YnJzK05iMkRyeVhqcmpt?=
 =?utf-8?B?dmI5aHkvMk5oTHJkOVVRSmNKNEhTSkowbzJpYlRsaVcyU1pMM1dWQ1ppK1R2?=
 =?utf-8?B?bmdoYmV3OE1LSzd4S21OSTBXQVZMSUhHV0Q5TStER203dktpTzJoOXFsNjhU?=
 =?utf-8?B?alN5dUlqTGNoTGRKUjRpUjRHRHBYVTRLZnB5aTZqTXhGNVFJbnJpd0RUNXZn?=
 =?utf-8?B?a2Z6RjR5NXBIZGJBdE9jdE1OUkk4b3Y2b09yeDBzRzM2OXFLeVdqUUtaQkFO?=
 =?utf-8?B?eG5UdUZpVk11TmJTcUdYdXIwNndzUEREQjMxNE1kWTU4ajZKQ09IaTB4UnVa?=
 =?utf-8?B?dFJyMFhSeXVWSHFETXBLaVNqU3lGdU9sV0ZnREJKUi9Ydm9SREMrMkxTdmd3?=
 =?utf-8?B?QWUzYzhxdDhXOEY0VWRSVWpjMlZSZHN4aGdmVDdXWEpNUmZRSlkrbXlXenRW?=
 =?utf-8?B?Sy9GdVhpL1N0eVFKR3M1M04zZVhLSVNlZGdKakZVOThYVnRVYUhJZ2tZS25E?=
 =?utf-8?B?K0JLMHkxeTArVGhTOVRHNHFtR2RBUmNydmRFRkVEenoyVGlwdmw3NDUzMHg3?=
 =?utf-8?B?ZXZkcnNXWUY5cFBudHJZQ0JyUnNPOXh0Y3VIV3JoRGI4WEFubmxhbFRIVm9y?=
 =?utf-8?B?TjFMeXF1NXJ6a1h3My9TL1FpQ1VVVjVQWUNPaldScFNqVlJwVzJ4MCtZMDRv?=
 =?utf-8?B?S0FhTXcvZlJLTVBpQTZqVlRBL2tpUGlmdm1LRURuaEpiNjRHTGhvVWYrQmZK?=
 =?utf-8?B?eHVxVXQxMVFRQVVaVVo1VHA2YWRpblMxR3NDcVpLVW1JWURlSHNIY1J4V1pR?=
 =?utf-8?B?UTV1VUdwUWNWT0NZZ1hqZnZmQjhzaE9ydWY5T0dzMmMzckJuNHQ5RjRWbUx5?=
 =?utf-8?B?UGUyLzd6V0xsVmwxUlJhMlpXWXZTdGxia3BiRU1iRko2ckdXRTA3WVEvWlFr?=
 =?utf-8?B?QVlQR3YyOE8wa25KeHp1cnJUb2pPMVBOOHlkWUFaam9yek9wV1JodFowV0Rh?=
 =?utf-8?B?bnhZbzE2MFlSVXpkQWNrU2hQV09JaG9vbGxRblZpTXJMMm5kZGw0R0RNWG8z?=
 =?utf-8?Q?DNQYR8/Tvp12ckgm+lLt7CmmL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14dbcac8-2db5-4223-b033-08da97557ba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 20:04:22.8570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 3FmR2lY/cQ23igZypJ8+4/6MRndbFOuhhE/Enxs4A5Ibo86YmY4VwHc2UB+hD8K9MqEGLIU9qf0XTP4N4uWJiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
X-Proofpoint-GUID: 6HRNvrxNReXhQWLsjTkQEer6V4lcpysy
X-Proofpoint-ORIG-GUID: eivWJkrOPDepRCtPgDowPMpMjkImSQ_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209150123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 20:04:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98825

T24gMTUgU2VwIDIwMjIsIGF0IDEyOjQ1LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj5PbiAxNSBTZXAgMjAyMiwgYXQgMTY6MTEsIFFpdSwgWmhlbmcgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFpoZW5nLlFpdT13aW5kcml2ZXIuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gK2NkIC91c3IvbGliL2pxL3B0ZXN0DQo+DQo+VHlw
aWNhbGx5IHB0ZXN0cyBhc3N1bWUgdGhleeKAmXZlIGJlZW4gY2TigJlkIGludG8gaGVyZSBhbHJl
YWR5LiAgQWxzbywgaWYgbGliZGlyIGlzIGNoYW5nZWQsIHRoaXMgcGF0aCBpcyB3cm9uZy4NCg0K
T0suDQoNCj4NCj4+ICtsbiAtc2YgL3Vzci9iaW4vanEgLg0KPg0KPk11Y2ggZWFzaWVyIHRvIGp1
c3Qgc2hpcCB0aGlzIHN5bWxpbmsgaW5zdGVhZCBvZiBnZW5lcmF0aW5nIGl0Lg0KDQpTZWVtcyBz
ZW5zaWJsZS4NCg0KPg0KPj4gKy4vdGVzdHMvb3B0aW9uYWx0ZXN0DQo+PiAraWYgWyAkPyAtZXEg
MCBdOyB0aGVuDQo+PiArICBlY2hvICdQQVNTOiBvcHRpb25hbHRlc3QnDQo+PiArZWxzZQ0KPj4g
KyAgZWNobyAnRkFJTDogb3B0aW9uYWx0ZXN0Jw0KPj4gK2ZpDQo+DQo+RG8gdGhpcyBhcyBhIGxv
b3AgdG8gYXZvaWQgcmVwZWF0aW5nIHRoZSBzYW1lIHNjcmlwdC4NCg0KU3VyZS4NCg0KPg0KPj4g
K1JERVBFTkRTOiR7UE59LXB0ZXN0ICs9ICIgdmFsZ3JpbmQiDQo+DQo+Tm90IHN1cmUgdGhpcyBp
cyB1c2VmdWwgZm9yIHVzOiB3ZSB3YW50IHQgdG8gdXNlIHB0ZXN0IGZvciBpbnRlZ3JhdGlvbiB0
ZXN0aW5nLCBub3QgZGV2ZWxvcG1lbnQgcmVncmVzc2lvbiB0ZXN0aW5nLg0KDQpUaGF0IHNlZW1z
IHRvIGJlIHRydWUgaW4gZ2VuZXJhbCBzaW5jZSB0aGVyZSBhcmUgZmV3IHB0ZXN0IHRoYXQgYXJl
IGRlcGVuZCBvbiB2YWxncmluZC4NClJhbmR5IGFuZCBJIHRhbGtlZCBhYm91dCB0aGlzLCBhbmQg
aW4gdGhlIGNhc2Ugb2YgcnVubmluZyBwdGVzdCBhZnRlciBydW5uaW5nIGZpeGluZyBDVkVzLCB2
YWxncmluZCBjb3VsZCBiZSB1c2VmdWwuDQpQZXJoYXBzIHdlIHNob3VsZCBpbnRyb2R1Y2UgYSBu
ZXcgRElTVFJPX0ZFQVRVUkVTIHRoYXQgZW5hYmxlcyB2YWxncmluZCBhbmQgb3RoZXIgbWVtb3J5
IGNoZWNrIHRvb2xzLg0KRm9yIG5vdyBJIHdpbGwgZHJvcCB0aGUgdmFsZ3JpbmQgZGVwZW5kZW5j
eSBhbmQgSSBjb25maXJtZWQgYWxsIHRlc3RzIHN0aWxsIHBhc3MgYW5kIHN0aWxsIGRvIHVzZWZ1
bCBjaGVja3MuDQoNCldlIGNyZWF0ZWQgYW4gZW5oYW5jZW1lbnQgcmVxdWVzdCwgdG8gdHJhY2sg
dGhlIGlkZWE6DQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dp
P2lkPTE0OTE0DQoNCj4NCj4+ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0KPj4gKyAgICBjcCAtcmYg
JHtCfS90ZXN0cyAke0R9JHtQVEVTVF9QQVRIfQ0KPj4gKyAgICBjcCAtcmYgJHtCfS8ubGlicyAk
e0R9JHtQVEVTVF9QQVRIfQ0KPj4gKyAgICAjIGxpYmpxLnNvLiogaXMgcGFja2FnZWQgaW4gdGhl
IG1haW4ganEgY29tcG9uZW50LCBzbyByZW1vdmUgaXQgZnJvbSBwdGVzdA0KPj4gKyAgICBybSAt
ZiAke0R9JHtQVEVTVF9QQVRIfS8ubGlicy9saWJqcS5zby4qDQo+PiArfQ0KPg0KPllvdeKAmWxs
IGZpbmQgaXQgZWFzaWVyIHRvIHBhdGNoIHRoZSBtYWtlZmlsZSB0byBpbnN0YWxsIHRoZSBiaW5h
cmllcy4gaW5zdGVhZCBvZiBhc3N1bWluZyBrbm93bGVkZ2Ugb2YgaG93IGxpYnRvb2wgDQo+IGhh
cyBidWlsdCB0aGUgYmluYXJpZXMuICBJZiB5b3XigJlyZSBsdWNreSwgdXBzdHJlYW0gd2lsbCB0
YWtlIGEgcGF0Y2ggdG8gYWRkIGFuIGluc3RhbGwtdGhlLXRlc3RzIG9wdGlvbi4NCg0KVHJ1ZSwg
YnV0IHRoaXMgaXMgbXkgZmlyc3QgY29tbWl0IGFuZCB3aGF0IHdlIGhhdmUgd29ya3MuIDstKQ0K
DQpJJ3ZlIGxvb2tlZCBhdCB3aGF0IEkgdGhpbmsgaXMgYSBnb29kIGV4YW1wbGUgb2Ygd2hhdCB5
b3UgYXJlIHRhbGtpbmcgYWJvdXQ6IA0KcmVjaXBlcy1zdXBwb3J0L3htbHNlYzEveG1sc2VjMV8x
LjIuMzQuYmINCmRvX2luc3RhbGxfcHRlc3QgKCkgew0KICAgIG9lX3J1bm1ha2UgLUMgJHtTfS9l
eGFtcGxlcyBERVNURElSPSR7RH0ke1BURVNUX1BBVEh9ICR7UFRFU1RfRVhUUkFfQVJHU30gaW5z
dGFsbC1wdGVzdA0KfQ0KUmFuZHkgYW5kIEkgd2lsbCBjb21taXQgdG8gd29ya2luZyBvbiB0aGlz
IGFzIGEgZm9sbG93IHVwIHBhdGNoLCBzaW5jZSBtZXRhLW9lIGRvZXNuJ3QgaGF2ZSBhIGJ1ZyB0
cmFja2VyLg0KDQo+DQo+Um9zcw0KPg0KPg0K

