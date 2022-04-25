Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE9AC3A59F
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.26103.1650865123446872506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 22:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=CrMngVdW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=111402cd70=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23P5ZHkx030345
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 22:38:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XMXEbt/m5Jnl0AQynk3A4hInSK1T98Qa8rCV0DUNYxk=;
 b=CrMngVdW8gae7AGxhGdzByvMs0c8z44hnwy4OqNHFLiHrogXGgGTbh3Ia+C9WlLNwlN8
 oAI2kFTCmE9yg7UwiXqh73R/zPqLHvyF4wsEhe1fRgAJ50jj3Xp4EmtP1+7t2CFygwzn
 vhA7R354PP3Y5rwlS1JQBNyQSyaineekG69TTyOmyL9+W3o2RSAz4q8MRdXzvVwrcV4/
 8tJh1kkMdsWgMZ1uL7MLKE2/n+Lgyc1Dop9UMy2n6jRu4aZG6pwnNOrky0BIcG2d9YNK
 bCYpDO1F9wzg69bSIJWyhZBuQHzTgqoUIk5/82pu33/92S8EsyaDppX09m2nU1q7483N Gg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgyks0hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 22:38:42 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23P5cgfo002728
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 22:38:42 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgyks0hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Apr 2022 22:38:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD0k1HbwmE7MfUTdI2gRpbaM9P/CTC56iI+ZVzIZYcjO/YCA5JnLTWJyINCvl/hpenGYheovgdyAWO1baRBOVIOqRx80FrDc0XpM3x6JI9JzdX5pZclU3CSjs5OdPXyBu75rpr7B1nAmqMb6gCcggOinpv6gZ8Bz3wgxYaFVbL3721XUu6trCPv73Tg4N5Rte9qoQJ3m2hHr5b9UcDv2Gsx0Y0g6KoKPIRlv+Am9UOLGItcBfszvKS3J1EPqGba79cimg4WgYY87MET4TTEDrkIV8tBoNENfFmKNjFUtNvNFt/AZ/u90MnF9wSJg1B7SewvaeH1u5ErSjMZSC71Iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMXEbt/m5Jnl0AQynk3A4hInSK1T98Qa8rCV0DUNYxk=;
 b=YzAwaw7vDZH3yC+Wfq2SZDpVGUMCdxHi7cgShz1bdOyh0XkXoWPzyCSyzfhSGzHDuOcgH+aVvhCEpmHPWddlvDRJLomog6vRf3Ofp+wDjPpxAFJw+LVmFUEGZ4IdhUEoPgToJPwb8VG7Nd1muPCdBQM0pCoCGgiFd30r1VtIz9dP40E3RaBFP1w/MCE53ZqYJQd+EaofBTGaGsuC/u+CsdQCJg6H3oz297odfvgem0ac77fZmTNV5yGsdqp2fuW8BQ1zuWL9++zeW9R0IGJccXEXuVJ5abfupaqM41GevoucPZeh1hRZEFpvz9FEqX1XaQrEFmkml/gIyJgH2Fr7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 05:38:39 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c515:d21d:135:c65c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c515:d21d:135:c65c%3]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 05:38:38 +0000
Subject: Re: [meta-oe][hardknott][PATCH] makedumpfile: Upgrade to 1.6.9
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220424084538.2940999-1-mingli.yu@windriver.com>
 <1e13861c-f742-b8a5-5001-df4d73129e01@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <afdd46de-5116-724c-26c8-a1b686cb5e33@windriver.com>
Date: Mon, 25 Apr 2022 13:36:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1e13861c-f742-b8a5-5001-df4d73129e01@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:202:2e::36) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e055647-82d0-4b0b-a4ac-08da267dd942
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5024:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50240206796CEC428B2D04A8F1F89@SJ0PR11MB5024.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c2Iq5QIUTrTWrAQgE1nDhMfSHvTlE7aekRLVtLHqbKFaCayEwE/CN4zI+3q+vVRqCY48VP75edkDKqONsUDd7p8K2ZAlJ5t9uhdHL5rc2UOpHhHrov+HQX1CD/cO9F+k912cJQ0q2k2dw6v4qNJQvoKZuAmvjB+KK0nJvl2tzMTTQdqI91zoZSWZ6gRI2qk14jVjbMXYEhudcU14rBWlRNbQS8/z5UcB/yzEdSwGhuVFnO/i22NsaR+6sHy3OkxUHxkzGcksuNotSf/pbiizsiWcbzBDKJGx600dFg4tUeqUvMNadXz1r+WDQTIB/Tm8/LR9acbmF+5u12FKiKerrhe6+W3jCodc1KaCjkNluV+QUswcqVVPB0/J54JLnpl63z50AQdEpybJ1+aQ/pRiz+WvmUIzfrGIt8l1mj7jwDjDHC4hA5MazoXb3OlU1kj266zapZN2o6xK/7ua99bjssZrOn5b/HA0P2EwSDbv2ue0y2deUAm2xXrl2IQii+05deloLgZE2A6/nxVkU9QVeAAW5bcOZPEr4woLr0eXwtdXY/+xESrXDGtrpHfQVocDb5YCeT1z2S8xRpMEnwG0kj0QQgX30Bd2DtMg2mw2D7eJzC8GpA4UjYiXUXsO4ZC/83MECieTKr2X/rPv3mAx2n04PnUKzsg4MAvtI8IF9dy/VUlEFvlFeVGOHRSgZHdZbqyf8g3Oj/cz5mIOqmId9kug18Z+5+bD3V7HyWMLk8o5VkKx+QUgFVDJZOc/2cHVfhuFu7A1lA3PXxdwt+onGKWYGGJvjh9OWb6CINwZYOddUNgeie8jE5Rrr47egF/bdf4taE09r9KCpt68tj1PwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(31696002)(66476007)(86362001)(2616005)(66946007)(52116002)(186003)(84970400001)(83380400001)(38350700002)(38100700002)(6666004)(8936002)(5660300002)(36756003)(316002)(6486002)(966005)(26005)(508600001)(2906002)(8676002)(6512007)(6506007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHYwbmJJNGkzTlVXd1JBVldrSXRadzNFT1B5YXh3eUZ4K2dXRHJIeG80bXM1?=
 =?utf-8?B?U00vUHRQTFNsWUNzRnJxRGd3TjhlTE9aSHl4djJGc2xURStPS2lCQzVmdFZD?=
 =?utf-8?B?TEErbTI5UUM1YjJWT1Z6TFBEejlGR1JLVWNLTmw4WHF5V3dJQjJDWm9aUGVu?=
 =?utf-8?B?TitGRFBkWEFjSUxPYlRiZEkvY0gyNlloclRZVzNRbkNGdXBuSk9tc2N0R3hn?=
 =?utf-8?B?UmpKZFJvWmtieEowMVNYejIwR3M0WjloalJaaU15K1llaHZWT0pBZFp5RUZs?=
 =?utf-8?B?K0U2MHYwT0o3dzZ3ME5zZDN4NWdZYzc5VzBaY0RPODhReGdlbHV4aG5MSjFo?=
 =?utf-8?B?ZERhNEpYTEd6TlVFVDY4a2NTcU5SOWx6Q2diMUg3UDg5YjJqVzZVTG5aaXdu?=
 =?utf-8?B?dTNGQ1pzL3Rjc2l0bC9WdFR1dkttVisxcTVZRkJoL0M1OUhScHdKQ1A1aUd1?=
 =?utf-8?B?bXZxQU9nRTAzTFhDZURjVWZuVG80SzNWQ1kyME9GZkdsUWc5S2RXcmQvelNW?=
 =?utf-8?B?K2pLOE5jNVJrMjcrV2txdVdtWFU4NUw4eS9rQm5XNUllYThVU3JEQUJMUVJY?=
 =?utf-8?B?TGJkcmdPZXhPeit3MlNnQkx2b1FYWHNmU0h0NkhxUWNYczBIbS9jQUdMU2VV?=
 =?utf-8?B?N0NDOTBOZGFtR0twaVViTHEzaHI5N3lkSzV0UHYzOC9MOUJJOHFDQVp1U0hB?=
 =?utf-8?B?MUgraWlMcjVZUlhGajZvaXdnMDJJRHVobmhybEZIenZ0bmdrWjJ5Q1lwY2Yw?=
 =?utf-8?B?L0JJMjhndDBsdldHUzJUNXZzNDAzSVBBVUlIeTllbHBXNXUvdjJaN1Rlcmcw?=
 =?utf-8?B?RnkybE56L0Yzd2g5RkluR2hYeUFqRUZlQTd3c0VYZDhKM0FmbGpoKzl1Nmgz?=
 =?utf-8?B?ZDZPQXBXS1NsK3h3M2VUSFE4aGhtQlV5NGdaM1g3Z214K0pQRE5ReUlVZkhB?=
 =?utf-8?B?QWVlbjFtRm0xUS9hWWRBQnpvU3FpUGszQm1pRDZCaG93bWdydmRZK2kvSUVv?=
 =?utf-8?B?TFNOTW5xNmJUL21pNCtOVzQ3cU5uMmVtZmQzZVBEejkrdkxuVFpJYWo3WDhn?=
 =?utf-8?B?SlhabTBxRjZlYmZmOTFsWDZmNDJiZ09RY3dzYW5CWi9ncHFvY1cveVBtMmZy?=
 =?utf-8?B?VER0dzViM29BOXJzanhMaGdqVlA4ZUQyK1BHY0ZCcm5qalBjMDBNVk1RdEdk?=
 =?utf-8?B?VDcwU3NHaVZUVy9QaHl5bXhGKzlhV3BiNG81MzdLV3JqYWNjOTNnTTlGMGtT?=
 =?utf-8?B?WHpmbS9ZWWw5ZlFpczdkelgwT2RXQ20zS3EybEdMVVdmK2gyUy9Qdmx4R2t1?=
 =?utf-8?B?RTdlbkplWDV1eTQrbE5BMnR0dUh0NHZ2N2NQOHBxOVdoSmU4T3JWN1BNZzNH?=
 =?utf-8?B?NmtJdzRFbjBGcEpjTUJzUC96aWtZOVQ5T00zdmZOWHdwYVQrbXFuNm51WlFE?=
 =?utf-8?B?V0hqZTI1UU8xSkpUVHhQNi9CT1BvK0d5L3VwbExZMnp3ZmtvYkZFU3FzVTNn?=
 =?utf-8?B?V1BHUUJHTmgxd3VOKzRNWUFEVzgzWUJOeTJtcnBHeVl2TEZmamlxaG5jM0dm?=
 =?utf-8?B?RmNrNjRBS1lhcXRRbnY2T1lIbWIrZ3FFQkNSYTJoenhGVE9RQjhMZGMzRE5I?=
 =?utf-8?B?ZzVQR3pDc0NJbXR5MXhlK1JJVE5TRlVBOG5XcTBYV0lXY1B2dU9EN0FTZmpn?=
 =?utf-8?B?V3RiQmVrVzl3b1c1cnh3SzZkMmZHQXRqc01ycldlUHdDSE5lbG1PQThiRUs2?=
 =?utf-8?B?N0I1SnIrREhISHFIaUJGRVpSRm5WWG5nYktkVWlBbHVaOFZ1L2I0Vm5SVjB5?=
 =?utf-8?B?Rmp1b1EwV1Z5ZnJsWnp0cFdvUVNPamt4UzZSTFJsSU9NS1NoS2RHbnJEaEFr?=
 =?utf-8?B?WVlPMUlOWERIQmZ5QUVxV0xURlFXZ2dmVmFEUEc3OU1McHlDOWNtc1V5R3I0?=
 =?utf-8?B?bWU3NFRtckNMRkpUUFo0OGNYdk8rem9SVG55Z002RUppM25tY1FtRkRURlVn?=
 =?utf-8?B?bEk5dUM3T3FSbTRoaTBwaEdxbHJTZDhBK2VEZG5SUHlLb1piN2YrUVMvZVBQ?=
 =?utf-8?B?cURPRHlBbEtlN2ZPK04rc21FeW9XVWIxWnBzWFA0NGd5MnRscm5oM0RpQWRF?=
 =?utf-8?B?Y0xDcUI0Y1hWaWFKQWVINnptcTdueVVhSUdscnV1NHAxVjNtMTl4MWpNL2tu?=
 =?utf-8?B?SEFMNGhFZzgvYmw4cG5qTHBvKzZVWlljbDh2ZEdTcWhLNzFwMUdrQ2Y1Y0Zl?=
 =?utf-8?B?SGRxZThneUgySXpRSTF1VEpNNHM0ZHhTMjRnNXFvTzJnVEh4d3VSbXdzNjFE?=
 =?utf-8?B?bmI4NkFiWGQ5VDFIcHg0N28vSDRvWEZMTW9pRW1Ib0lqWFFHdW5tMlFOL3BU?=
 =?utf-8?Q?qKHc8laLrbxGPG1o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5e055647-82d0-4b0b-a4ac-08da267dd942
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 05:38:38.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7IG8Dfx2nhrmxe/9yaDG43s7kNDWOILr2C5anLn7dXTJE/bD86lM0nAV2GNx12cTtWYdK281Yy7xE0rbTJBvGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-Proofpoint-GUID: RIJ0gFDfL3kta6-uEkzzaYpe7fZ6KDdk
X-Proofpoint-ORIG-GUID: NSdw_oT0nWpg3K9NcaNpZbVZ8AaE7BxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_01,2022-04-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 23P5ZHkx030345
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96759

Hi Armin,

On 4/25/22 5:49 AM, akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On 4/24/22 01:45, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Linux 5.10 introduces a new lockless ringbuffer. The new ringbuffer
>> =C2=A0=C2=A0 is structured completely different to the previous iterat=
ions.
>> =C2=A0=C2=A0 Add support for retrieving the ringbuffer from debug info=
rmation
>> =C2=A0=C2=A0 and/or using vmcoreinfo. The new ringbuffer is detected b=
ased on
>> =C2=A0=C2=A0 the availability of the "prb" symbol.
>>
>> * Support newer kernels as follows:
>>
>> =C2=A0=C2=A0 - 5.10, 5.11, 5.12=C2=A0 (x86_64 SPARSEMEM)
>=20
> Isn't 5.10 supported in Hardknott? Did any 5.10 kernel updates introduc=
e
> a regression?

FYI.

https://git.openembedded.org/openembedded-core/commit/?h=3Dhardknott&id=3D=
03c3af8bcd0a7059ae37e6e633d9c94310ebdc16

Thanks,

>=20
> -armin
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 ...1-makedumpfile-replace-hardcode-CFLAGS.patch | 17 +++++++++-=
-------
>> =C2=A0 ...edumpfile_1.6.8.bb =3D> makedumpfile_1.6.9.bb} |=C2=A0 2 +-
>> =C2=A0 2 files changed, 10 insertions(+), 9 deletions(-)
>> =C2=A0 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.8.=
bb =3D>=20
>> makedumpfile_1.6.9.bb} (97%)
>>
>> diff --git=20
>> a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-r=
eplace-hardcode-CFLAGS.patch=20
>> b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-r=
eplace-hardcode-CFLAGS.patch=20
>>
>> index 270cc3562..94eac931e 100644
>> ---=20
>> a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-r=
eplace-hardcode-CFLAGS.patch=20
>>
>> +++=20
>> b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-r=
eplace-hardcode-CFLAGS.patch=20
>>
>> @@ -1,4 +1,4 @@
>> -From af97e2ad643334b4c7c3d66f971ce9ebb2b596af Mon Sep 17 00:00:00 200=
1
>> +From 1053cf25be28b266ba264705e11179cf4f04aa91 Mon Sep 17 00:00:00 200=
1
>> =C2=A0 From: Mingli Yu <mingli.yu@windriver.com>
>> =C2=A0 Date: Thu, 21 Jul 2016 18:06:21 +0800
>> =C2=A0 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
>> @@ -13,14 +13,15 @@ Subject: [PATCH] makedumpfile: replace hardcode=20
>> CFLAGS
>> =C2=A0 Upstream-Status: Inappropriate[oe specific]
>>
>> =C2=A0 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +
>> =C2=A0 ---
>> =C2=A0=C2=A0 Makefile | 45 +++++++++++++++++++++++--------------------=
--
>> =C2=A0=C2=A0 1 file changed, 23 insertions(+), 22 deletions(-)
>>
>> -Index: git/Makefile
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/Makefile
>> -+++ git/Makefile
>> +diff --git a/Makefile b/Makefile
>> +index 6fa00bc..7aa7ae2 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> =C2=A0 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
>> =C2=A0=C2=A0 CC =3D gcc
>> =C2=A0=C2=A0 endif
>> @@ -79,7 +80,7 @@ Index: git/Makefile
>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -DRELEASE_DATE=3D'"$(DATE)"'
>> =C2=A0 +
>> =C2=A0=C2=A0 SRC_BASE =3D makedumpfile.c makedumpfile.h diskdump_mod.h=
=20
>> sadump_mod.h sadump_info.h
>> - SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c=20
>> sadump_info.c cache.c tools.c
>> + SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c=20
>> sadump_info.c cache.c tools.c printk.c
>> =C2=A0=C2=A0 OBJ_PART=3D$(patsubst %.c,%.o,$(SRC_PART))
>> =C2=A0 @@ -52,12 +53,12 @@ OBJ_ARCH=3D$(patsubst %.c,%.o,$(SRC_ARCH))
>>
>> @@ -104,7 +105,7 @@ Index: git/Makefile
>> =C2=A0 +CFLAGS_COMMON +=3D -DUSESNAPPY
>> =C2=A0=C2=A0 endif
>>
>> - LIBS :=3D -lpthread $(LIBS)
>> + LIBS :=3D $(LIBS) -lpthread
>> =C2=A0 @@ -90,14 +91,14 @@ LIBS :=3D $(LIBS) $(call try-run,\
>> =C2=A0=C2=A0 all: makedumpfile
>>
>> @@ -122,7 +123,7 @@ Index: git/Makefile
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"m=
akedumpfile v$(VERSION)\"=20
>> \"Linux System Administrator\'s Manual\" > temp.8
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)m=
akedumpfile.8 >> temp.8
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv temp.8 makedumpfile.8
>> -@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
>> +@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gzip -c ./makedumpfile.conf.5 > ./maked=
umpfile.conf.5.gz
>>
>> =C2=A0=C2=A0 eppic_makedumpfile.so: extension_eppic.c
>> diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb=
=20
>> b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
>> similarity index 97%
>> rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
>> rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
>> index 6f87db177..4350ea126 100644
>> --- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
>> +++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
>> =C2=A0 LICENSE =3D "GPLv2.0"
>>
>> =C2=A0 SRCBRANCH ?=3D "master"
>> -SRCREV =3D "18e0cdba48feeccea2429b3b0b2691f4314d1062"
>> +SRCREV =3D "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
>>
>> =C2=A0 DEPENDS =3D "bzip2 zlib elfutils xz"
>> =C2=A0 RDEPENDS_${PN}-tools =3D "perl ${PN}"
>=20

