Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11026.1793711981338763451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 05:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Kn+A1yt3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5767a38f2c=juhandre.knoetze@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CmU8o2991395
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Nov 2026 05:19:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=/gEwN4Oyf8Z/k9gvvkFnSV
	864m1yX9L6jFOgBCLx6XE=; b=Kn+A1yt3tpxyNTwUHy3KNJUZUlMqb0IGYOH9qT
	S+Ph6de8HK9tAr1oS3EB0Omhu8G5RqvN1g8UHBqtjp+IwNnOeC42ef7Fd4LUdPt5
	u9/+qHhnAVHtb0/O46SfH2fSsFCLOA3opNPzDr7mguhhTjjgjvPFEat+5Zem3tuh
	/veRrFNELVHbR7IKuGW7DS6HJx/QlZImK8Q0zLK/CUsWrC6VCX5aurJDX2pQdtpM
	TGD4iLD9O+6MJenY1Gw8f2rDyMU4ezo5TNiZLviHlo9HM9jlgH0A6h+vSs9Cmtf+
	WIKJPEyo7zIc3kEpWxF68Zk2nydn2axk/0LZinQfsaT6fQDA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023084.outbound.protection.outlook.com [40.93.201.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnbm1m6hh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 05:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNkLSQwGZIIK3IICUkfa8b+h+8YR/4xzHv3vVL/zKHngYGPlnhR91a4i/mojj2UZs3O/VvGHs3J1qscVltZq0mGgQyuzOJwcw3JqVgq6iun/dgIKfr0/TVNNNBTC/vReu+j/5+kfpxFHtTXcmqPO3nI0oH0W4mojRxB2gxqzTm5zng7rzcrOe/qQSBf7txvluKP9MO7F+QZ0TYdivMTgBxM29wpshRkUR3AIuh8myLIBKrLCR+8neGjhMr6/R9S/ZX++p/DLuxRATxg7hPMGoMLLtco5LkGnLQjaLaUw5gubMsko8bZ5EpnJ1ooGKEIB+lTVF0Ejk5xG2kEcV9kxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gEwN4Oyf8Z/k9gvvkFnSV864m1yX9L6jFOgBCLx6XE=;
 b=auJ/E8tgDXdn8shv0ctbwO99VIjJ7tPBb/btKHugjZoaBvx1lWQcjk4JQFX5u1pi3iDB590JUJ9/+cM9uX/JTYb50WD+4ay/27KmLmHksJ0wWCJ5vFOj+DCZDg6CkRkz5eIj34PiDOQ6OEoxqzUW8iAi6YHZ7lqoLuNipbXYvcjrqNPaxQuzIk9nICUI92D6RMg8UkSJv4pXVDfWIYHllPAV3D1UZKQSmH+VbDvntuNGLxGUPPVsxEl/Zvd1v0CHbGR++wSLeL/0WVCKT8UgZiHJYE9KSueYNW7MGxPy4pJYBy1dOtztjgscx+nd52rTWIS5fnHMEs9HKfyKTgVXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH4PPF3D73251BC.namprd11.prod.outlook.com
 (2603:10b6:518:1::e65) by CH3PR11MB616647.namprd11.prod.outlook.com
 (2603:10b6:610:365::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 13:19:38 +0000
Received: from PH4PPF3D73251BC.namprd11.prod.outlook.com
 ([fe80::fbe7:25c9:7f94:74a8]) by PH4PPF3D73251BC.namprd11.prod.outlook.com
 ([fe80::fbe7:25c9:7f94:74a8%7]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 13:19:38 +0000
Message-ID: <4745a0b2-f787-4e4c-8cd9-17829f8973f9@windriver.com>
Date: Tue, 3 Nov 2026 08:19:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libyang: Fix CVE-2026-41401 and CVE-2026-44673
To: Gunashree K L <Gunashree.KL@windriver.com>,
        openembedded-devel@lists.openembedded.org
Cc: Venkata.Navuduri@windriver.com
References: <20261014075946.1280083-1-Gunashree.KL@windriver.com>
From: =?UTF-8?B?S25vZXR6ZSwgSnVoYW5kcsOp?= <Juhandre.Knoetze@windriver.com>
In-Reply-To: <20261014075946.1280083-1-Gunashree.KL@windriver.com>
X-ClientProxiedBy: YT4PR01CA0420.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::17) To PH4PPF3D73251BC.namprd11.prod.outlook.com
 (2603:10b6:518:1::e65)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PPF3D73251BC:EE_|CH3PR11MB616647:EE_
X-MS-Office365-Filtering-Correlation-Id: bf79b21b-8561-450b-fed2-08df39ad1c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|261102123227099003|260925021911599003|260925022911599003|260925021311599003|11063799006|261009223327099003|261009223027099003|261009221727099003|261009220027099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261009221227099003|56012099006|22082099003|18002099003|8096899003|10067099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: NO+tcF9rKwfnhYZOPPrh6EVSTdDoh1fuMqqxaFTe0PRJinnZABR8RYUUMKZiu7yMiPW17GhpQ5YQeUOomgPD82Z7vyC59TEe2rg6Yrd3kNbliU753O055o2L5GggsHx240zHbo/RTe/F/G797HwA3/G3ohwFAjNIeU69qb2bZkh93NEeWO0yHK1X2P9R79CLl9Rnq4+hVB4RrBbKpo3+6Ti39hmjOoMz731KBIns3otzFGMydZdu17FoavDzKpowqv1eN596Ct9UKur138w/utZGTjGGsDnTzjpNa/Ryh95zdwnRAaKSq7ZLhA9t2v8RB0W5O8Tmk5dfTFzFDY6wwOeSRUFznaA+d4JW7V/XKeAaHW5CqxyAtfqQapaIQHNo5OjONTD4NB9TSQE/j+L2ARRN/eeEiIHyQCzcvi3qi5w6FAaODhFfScwXpOzHXVrUGHwjxF4UnNsgJbKSqQCG+cDOLhFDH4xO0+vbfplT9TBAVtvdU7y7juS0EaIb2SSFaAJBTcHpWm2HMgepePllBOhv/kQq+Vk6AleME0O6JklPPOiD0M2irJi1XmCv5pmFw1OvTwqtF8nLIXMT42nW+noiYFxdjPn/IRqlBqRakRf8eqZIqg/85WfHJjUwpUDB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH4PPF3D73251BC.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(261102123227099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261009223327099003)(261009223027099003)(261009221727099003)(261009220027099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009221227099003)(56012099006)(22082099003)(18002099003)(8096899003)(10067099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVRKMjZINjh1eVZMbGFnbjIvYnN5R1hWRW9kVS9wWkJaK2dhblM3Q3hkUlhn?=
 =?utf-8?B?SmpHeTNOblpLSitka2NFTDBDZUZnUGdHM0FVSW9aNFhJcEhvSFluakVKTFJH?=
 =?utf-8?B?VnJxNGQyQjdURnFzVGlrV0Fta0R2VGxzZlQrNGNoeldRejlkY29aYkttUS9L?=
 =?utf-8?B?MDR5cVNoTVlZb1k4czU4ZUJCVU9iM0RtVnNCR01tVVJxWXNXRUNkSUt5RThy?=
 =?utf-8?B?SDZNUzd0dTVidUU1VW0xazhWenJGOGZaWGxxeVJpc2p4SHBWOUZEZk9SSkl6?=
 =?utf-8?B?TVNMa2c4dUNWOHVoT0xlSVVVdE5iTldQYVJzdXRGeXAwQ00xKzVodFZITHdt?=
 =?utf-8?B?Tkh2eE0ya2V1bW1QRUJRemF1R0xJakJ3WFFVYVNNNGRVd1RicXF5bERzbmV0?=
 =?utf-8?B?bXNSUHhCQVlaYXhQNHF3TUZrMXU0VlZKOHV1MDArMWRmeUxBeHdNMDAxaHFV?=
 =?utf-8?B?Nlhra2dDYUJ6cW1LaXJjSlZrWmdCa3E2dG9mYlBRV00rY2h6NUxHenZaaTRQ?=
 =?utf-8?B?V0Y2YTNEZlhISFZKQm9kZmJmN3l6ZVl6RElWS004TkNrQWhWWUZxRGkzTkVu?=
 =?utf-8?B?R2I0Mk01aGRkMGVQWC9aREZoZzN1NjJhMTFXeFNacDAyeHEzdDAvNHZNeVlB?=
 =?utf-8?B?dkdhaXFsMmtiUjNTNytac3Q4aWhtdkVxQVgrcHRHUUp1ZHVVbTVlMDcyQnVC?=
 =?utf-8?B?b0lvc01BSmZGblpncEkwb0NLZ21zTStPRFZ5dTRHTTBjSXJnOVRWVW1CMmx6?=
 =?utf-8?B?ZTI1OFBnOVUzdi82V3BWZE53VE5HbnQ1K1NhMUxWN1hFRUZFZy9sRVRjWWJ1?=
 =?utf-8?B?MnpjSEprSnlZY0htZ3lhZ1BqR095K05YNFdlS3pjLzU0RmdvOHNaQ2huZFhN?=
 =?utf-8?B?YWRmVnV6L0JOQWRsdnFCNC9xUm1ObDR3b0pPa251YnVRcDNucDR3L0JDeTM4?=
 =?utf-8?B?Ylc1K0twOE5Fc29wTnFUK0ZBQVlyeEVQN3V0ZHZnanJlYzR1amtyVlBaekds?=
 =?utf-8?B?ME9yNm5UdGZCMVRvRzg5WU9mVmFXUmRMMUd6Y1huYVNYVkN4aEFSRjduSzJy?=
 =?utf-8?B?VmR1eURiZ0VxQUFkc1dGTkNKNCtlSlV0UlRkSDNtWW95OUorWXpmZ21kaTVZ?=
 =?utf-8?B?aFhyY3RaN3lxOTE0UXFieFVZUzk1TTNNclNtalRVaW9PbEt6TVVuTjJIdFBV?=
 =?utf-8?B?NmtFZ215TEF4VGhRQmI2ckxqKzZwbUNJYTBhL2J5YlRZRWErUnRaY29OK1dj?=
 =?utf-8?B?QzZtTVdneWk3ZjM4VnMvTEpCNk9GV1A5dDJTVkdvaUdocHhzd3NLL0YrVHlZ?=
 =?utf-8?B?aFl4MzA0OHp4RTZDRUtRM003SU54UlJBWXhsYUs3UUVJa0hhdHlyb3k2RnBI?=
 =?utf-8?B?UDhpaHpuNnM4aWdEaEpZZ1kwODRhMEF4QWtsSmZ2ME1GazF4SEJTSFBqK3ow?=
 =?utf-8?B?WkhITzJyWGJVKzRoRm1zd2xvZzgySm1GUGdKcU4waXU0V1pjT1NVWDBLM2tX?=
 =?utf-8?B?cE1xUVRXaW9EeWN3MUJzWmJRRzZYbmVia0RZczloME1OS0ZFYStNZzdoWS9X?=
 =?utf-8?B?TnRyT0JvNWRRWHY2dmJwVGE5MGMxT1NBOGtzTmd6NDBRODBTbXJZbEp0SkJP?=
 =?utf-8?B?WldZSXNkcUNEeGl0eEtITmN1c01Yb3dPM0VsZGVvQzQxZTZ5OE5hbGtTcHJC?=
 =?utf-8?B?c3hJTm9aWlBzWFlGT0VZYXJqZGpxbUtMQnM0RUN6YXZIOEpOaDhxK3NJWW1R?=
 =?utf-8?B?Y2xNQS9lUXpBb2NyWDdnYnlZUGJzWlg3WlJ5R0IzWFI5Y2FsYTZrU3k1clVD?=
 =?utf-8?B?aHAxQk9CWGMxaTB5cWZxYVlvcVpreEZhMzc3UXVpOThhYXYwcHVKVXlaOXhV?=
 =?utf-8?B?elpoSGFKVXpNZUtJQ1B0RlVreE93OUl5UXQ4SUlHZWtDSlZOcHpHTFBXTGti?=
 =?utf-8?B?OVIxRGZFRlFVUmZLUzFscnVnOFVjcUMycGV4SWc2S29VSUZFeVpLVHBnMksx?=
 =?utf-8?B?QklaTmRYbXFzMnlOb3ZQbE1UaVAxWVgzTFBRblRhRVlpZjFIeXp6TkhONFpU?=
 =?utf-8?B?VVBoMzc0RGZyUWRSWWxJNWwycGljUlg4OWZNTm1QbGowLzNjQVhFYm04SHp5?=
 =?utf-8?B?SSt2c1RDbk4veTlxbEs5T3FDZlF5UGhrdkxoQVVZaDZBdmtHaUdPMWVtSUJP?=
 =?utf-8?B?dUhDam9FYVduRGJHN0Z1QnIyakRjckZLamVoa3FVK2Nnc1J6Y2I2RmVGWldY?=
 =?utf-8?B?N0NHK3EzSkxQcUFnME1YU3podG91czFwNysvcHlZZDROVEYwUTNnQ0JTWWln?=
 =?utf-8?B?amIyS0szS3J2RzhZU2tHYUdUdU4vZ0JQbUZ2OVoxNjMza29aem90Tjh5ZW9z?=
 =?utf-8?Q?6eoTH6hKsMOaAPVU=3D?=
X-Exchange-RoutingPolicyChecked: udjQxYNQRp5YzEhBgMWFMcw91xII4xWWVRhxGl8JM5MthAogfvwpCXunNd3soQ5QvDrgrlIHVIKYJLnFxZt3TNvjYNQwUp9UgQ+vyoDFdt3atv8w08+H010Yas8iDryiuiU/shn81BFcjB5lsIUGw96Nuuj2lGPzK2eSj/XEf+TBN/g5Z1RW8Q4TvHnmpPjCpZYKdYEHMt9TZhiNI/b1P7rsoTmUo8maPQPx4laaxZeFO02/2pCz7XEwIymtXSN1oqT0FFNL0QmClXWFPtLeN4ja0pxeooMtlEneHKXbCBm2VXuEfhy+eSgqbI/YiX6TdzqwRs70msiMIE0woGcU7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf79b21b-8561-450b-fed2-08df39ad1c92
X-MS-Exchange-CrossTenant-AuthSource: PH4PPF3D73251BC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 13:19:38.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08orM5dAEihHw9QhCvwqQlamrQrdfd4h+xDbmWJsk+gIUzOUeQnWrSeOi8ZaBjAz7Hlpo5c8rSWDRKrL1iXEUhwQXfNbpXDiIKt3apx6vYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB616647
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX6P+nsy8qyNWT
 8BV0aFUFvPgnXzhLQASqKNwUB1xPkflQ9YNvhdP+lqhoYSXm8EsspsgGnZ2HO0MA0n+5Z2kcwPX
 XSWtcOo0XsRXxKwSyxYK8swnFcN8TjXGz8c6Vzga5wlF3EeH80qRtEmDL8x2xKdq1gLiRViiPHP
 bMiL51/EeIg0BsNWahcRqqkuIv0W3enzGW0pXL3GrcwXX7oPyQOkB8zcr6O03IrZrLwMW1MQKHV
 AuyOPMHGLb996oDZItrkg40kBrtb4bgLA6b8gm/O580h3YSzsuQJ6klu5kjI18Rbeum7/fhDcDW
 1cGnpfY3OdoDQBWRwZulndEJo+ZTR7o9vXU6f5hc8yC8m2jaWIZs41Sy8V87Ue/qDRx04tlEKgk
 gGm8qJgmyFaNvq7/W0bFhjVYLHFcXDoZUB4xSV479HO7KaxTQU+ubj+62R1Ce0HJ2txT4RlcMGq
 pRq+MSwwPhs981uprSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX89Le/22tgjNF
 oISIjH3TUpxaf/YNYG4IARdP3sCJrrzfAN/mdMBinOb2cLo2/Rdjjg7CsdGy8E/beVrystmEmRa
 A3o/Paxo9dfG/eMoUcG6nXj+KlcinrOfINU0v+rvK+ffSXc/V5Oh
X-Proofpoint-ORIG-GUID: EH9tDR8dTKodz83az_154kNNNzjpfe9T
X-Authority-Analysis: v=2.4 cv=RZsFmFtv c=1 sm=1 tr=0 ts=6ae9df6c cx=c_pps
 a=vrZu8FCDnvlauzLDEj0iEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=2tCJ968wRG7LHZPgrxcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=JrzzBOXDW1UOjNGuWpwA:9
 a=omme8rFrp7iy_6vx:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EH9tDR8dTKodz83az_154kNNNzjpfe9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052
Content-Type: multipart/alternative;
 boundary="------------FnNTjS0I6wrLzL9PZd1fMf49"
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 13:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131787

--------------FnNTjS0I6wrLzL9PZd1fMf49
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A3CmU8o2991395

On 2026-10-14 03:59, Gunashree K L wrote:
> From: Yunseong Kim<yunseong.kim@est.tech>
>
> Issue: LIN1026-7461
Since this is an upstream patch, our internal issue numbering is not=20
relevant. Please remove this before sending upstream, thank you!

../Juhandr=C3=A9
>
> CVE-2026-41401:
> Fix heap use-after-free in lyd_parser_set_data_flags() when freeing
> non-head default metadata entries.
> Ref:https://github.com/CESNET/libyang/commit/54c3276d871023da266d4ed3ce=
aee7e8d71d0b04
> Ref:https://github.com/CESNET/libyang/security/advisories/GHSA-9f49-8x5=
6-jmjc
>
> CVE-2026-44673:
> Fix integer overflow and OOM in lyb_read_string() and
> lyb_read_term_value() in the LYB binary parser.
> Ref:https://github.com/CESNET/libyang/commit/48672b289e2e4c6773712c3ee0=
abae6b7fffe1f3
>
> Signed-off-by: Yunseong Kim<yunseong.kim@est.tech>
> Signed-off-by: Anuj Mittal<anuj.mittal@oss.qualcomm.com>
> Signed-off-by: Gunashree K L<Gunashree.KL@windriver.com>
> ---
>   .../libyang/libyang/CVE-2026-41401.patch      | 41 +++++++++++
>   .../libyang/libyang/CVE-2026-44673.patch      | 68 ++++++++++++++++++=
+
>   .../libyang/libyang_3.13.6.bb                 |  2 +
>   3 files changed, 111 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-=
41401.patch
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-=
44673.patch
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.pa=
tch b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
> new file mode 100644
> index 0000000000..672fea92e6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
> @@ -0,0 +1,41 @@
> +From 54c3276d871023da266d4ed3ceaee7e8d71d0b04 Mon Sep 17 00:00:00 2001
> +From: Michal Vasko<mvasko@cesnet.cz>
> +Date: Thu, 26 Mar 2026 08:33:44 +0100
> +Subject: [PATCH] parser common BUGFIX invalid metadata removal
> +
> +Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/54=
c3276d871023da266d4ed3ceaee7e8d71d0b04]
> +CVE: CVE-2026-41401
> +
> +Signed-off-by: Gunashree K L<Gunashree.KL@windriver.com>
> +---
> + src/parser_common.c                                    | 4 ++--
> + tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 | 5 +++++
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> + create mode 100644 tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_0=
3_26
> +
> +diff --git a/src/parser_common.c b/src/parser_common.c
> +index 39fb4ab0a..f11fce560 100644
> +--- a/src/parser_common.c
> ++++ b/src/parser_common.c
> +@@ -313,8 +313,8 @@ lyd_parser_set_data_flags(struct lyd_node *node, s=
truct lyd_meta **meta, struct
> +             next_meta =3D meta2->next;
> +
> +             /* delete the metadata */
> +-            if (meta !=3D &node->meta) {
> +-                *meta =3D (*meta)->next;
> ++            if ((meta !=3D &node->meta) && (meta2 =3D=3D *meta)) {
> ++                *meta =3D next_meta;
> +             }
> +             lyd_free_meta_single(meta2);
> +             if (prev_meta) {
> +diff --git a/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 b/=
tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
> +new file mode 100644
> +index 000000000..7e3b6c39e
> +--- /dev/null
> ++++ b/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
> +@@ -0,0 +1,5 @@
> ++<int32 xmlns=3D"urn:tests:types"
> ++xmlns:yang=3D"urn:ietf:params:xml:ns:yang:1"
> ++xmlns:dflt=3D"urn:ietf:params:xml:ns:netconf:default:1.0"
> ++yang:operation=3D"create"
> ++dflt:default=3D"true">5</int32>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.pa=
tch b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
> new file mode 100644
> index 0000000000..2d685e111e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
> @@ -0,0 +1,68 @@
> +From 48672b289e2e4c6773712c3ee0abae6b7fffe1f3 Mon Sep 17 00:00:00 2001
> +From: dominik blain<dominik@qreativelab.io>
> +Date: Wed, 6 May 2026 03:03:14 -0400
> +Subject: [PATCH] parser lyb BUGFIX integer overflow and OOM (#2513)
> +
> +lyb_read_string: when len =3D=3D UINT64_MAX, (len + 1) wraps to 0,
> +malloc(0) returns non-NULL, and the subsequent write to (*str)[len]
> +causes a WRITE SEGV (memory corruption).
> +
> +lyb_read_term_value: when term_value_len is large, truncation from
> +uint64_t to uint32_t allocated_size causes undersized allocation
> +followed by out-of-bounds write.
> +
> +Both paths are reachable by supplying a malformed LYB input with
> +crafted length fields.
> +
> +Reported-by: Dominik Blain<dominik@qreativelab.io>, Cobalt AI
> +
> +CVE: CVE-2026-44673
> +Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/48=
672b289e2e4c6773712c3ee0abae6b7fffe1f3]
> +
> +Backport Changes:
> +- Adapted for v2.1.148 code structure where lyb_read_string uses
> +  uint64_t len (not uint32_t str_len) and lyb_read_term_value uses
> +  uint32_t allocated_size with uint64_t term_value_len (not
> +  lyb_read_value with val_size_bits).
> +- Added overflow check for len in lyb_read_string to prevent wrap to 0.
> +- Added overflow check for term_value_len in lyb_read_term_value to
> +  prevent uint32_t truncation in allocated_size.
> +
> +(cherry picked from commit 48672b289e2e4c6773712c3ee0abae6b7fffe1f3)
> +Signed-off-by: Yunseong Kim<yunseong.kim@est.tech>
> +Signed-off-by: Gunashree K L<Gunashree.KL@windriver.com>
> +
> +---
> + src/parser_lyb.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/src/parser_lyb.c b/src/parser_lyb.c
> +index 788be9499..c1cbfc805 100644
> +--- a/src/parser_lyb.c
> ++++ b/src/parser_lyb.c
> +@@ -217,6 +217,12 @@ lyb_read_string(char **str, uint8_t len_size, str=
uct lylyb_ctx *lybctx)
> +
> +     lyb_read_number(&len, sizeof len, len_size, lybctx);
> +
> ++    /* len + 1 wraps to 0 when len =3D=3D UINT64_MAX, causing malloc(=
0) followed by an out-of-bounds write */
> ++    LY_CHECK_ERR_RET(len =3D=3D UINT64_MAX,
> ++            LOGERR(lybctx->ctx, LY_EINVAL, "LYB string length overflo=
w."), LY_EINVAL);
> ++    LY_CHECK_ERR_RET(len >=3D SIZE_MAX,
> ++            LOGERR(lybctx->ctx, LY_EINVAL, "LYB string length overflo=
w."), LY_EINVAL);
> ++
> +     *str =3D malloc((len + 1) * sizeof **str);
> +     LY_CHECK_ERR_RET(!*str, LOGMEM(lybctx->ctx), LY_EMEM);
> +
> +@@ -281,6 +287,10 @@ lyb_read_term_value(const struct lysc_node_leaf *=
term, uint8_t **term_value, uin
> +         *term_value_len =3D lyb_data_len;
> +     }
> +
> ++    /* Prevent uint32_t truncation: if term_value_len exceeds UINT32_=
MAX - 1, allocated_size overflows */
> ++    LY_CHECK_ERR_RET(*term_value_len >=3D UINT32_MAX,
> ++            LOGERR(lybctx->ctx, LY_EINVAL, "LYB value size overflow."=
), LY_EINVAL);
> ++
> +     /* Allocate memory. */
> +     allocated_size =3D *term_value_len + 1;
> +     *term_value =3D malloc(allocated_size * sizeof **term_value);
> +--
> +2.43.0
> diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-=
oe/recipes-extended/libyang/libyang_3.13.6.bb
> index 822c30ba24..1d84eb5c40 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> @@ -10,6 +10,8 @@ SRCREV =3D "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
>  =20
>   SRC_URI =3D"git://github.com/CESNET/libyang.git;branch=3Dmaster;proto=
col=3Dhttps;tag=3Dv${PV}=20
> \ file://0001-test_context-skip-test-case-test_searchdirs.patch \ +=20
> file://CVE-2026-41401.patch \ + file://CVE-2026-44673.patch \=20
> file://run-ptest \ "
>  =20

--------------FnNTjS0I6wrLzL9PZd1fMf49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A3CmU8o2991395

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-10-14 03:59, Gunashree K L
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20261014075946.1280083-1-Gunash=
ree.KL@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Yunseong Kim <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:yunseong.kim@est.tech">&lt;yunseon=
g.kim@est.tech&gt;</a>

Issue: LIN1026-7461</pre>
    </blockquote>
    <font face=3D"monospace">Since this is an upstream patch, our interna=
l
      issue numbering is not relevant. Please remove this before sending
      upstream, thank you!<br>
      <br>
      ../Juhandr=C3=A9</font>
    <blockquote type=3D"cite" cite=3D"mid:20261014075946.1280083-1-Gunash=
ree.KL@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

CVE-2026-41401:
Fix heap use-after-free in lyd_parser_set_data_flags() when freeing
non-head default metadata entries.
Ref: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/CESNET=
/libyang/commit/54c3276d871023da266d4ed3ceaee7e8d71d0b04">https://github.=
com/CESNET/libyang/commit/54c3276d871023da266d4ed3ceaee7e8d71d0b04</a>
Ref: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/CESNET=
/libyang/security/advisories/GHSA-9f49-8x56-jmjc">https://github.com/CESN=
ET/libyang/security/advisories/GHSA-9f49-8x56-jmjc</a>

CVE-2026-44673:
Fix integer overflow and OOM in lyb_read_string() and
lyb_read_term_value() in the LYB binary parser.
Ref: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/CESNET=
/libyang/commit/48672b289e2e4c6773712c3ee0abae6b7fffe1f3">https://github.=
com/CESNET/libyang/commit/48672b289e2e4c6773712c3ee0abae6b7fffe1f3</a>

Signed-off-by: Yunseong Kim <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yunseong.kim@est.tech">&lt;yunseong.kim@est.tech&gt;</a>
Signed-off-by: Anuj Mittal <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:anuj.mittal@oss.qualcomm.com">&lt;anuj.mittal@oss.qualcomm.com&gt;</a=
>
Signed-off-by: Gunashree K L <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Gunashree.KL@windriver.com">&lt;Gunashree.KL@windriver.com&gt;</a>
---
 .../libyang/libyang/CVE-2026-41401.patch      | 41 +++++++++++
 .../libyang/libyang/CVE-2026-44673.patch      | 68 +++++++++++++++++++
 .../libyang/libyang_3.13.6.bb                 |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-414=
01.patch
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-446=
73.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patc=
h b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
new file mode 100644
index 0000000000..672fea92e6
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
@@ -0,0 +1,41 @@
+From 54c3276d871023da266d4ed3ceaee7e8d71d0b04 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mva=
sko@cesnet.cz">&lt;mvasko@cesnet.cz&gt;</a>
+Date: Thu, 26 Mar 2026 08:33:44 +0100
+Subject: [PATCH] parser common BUGFIX invalid metadata removal
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/CESNET/libyang/commit/54c3276d871023da266d4ed3ceaee7e8d7=
1d0b04">https://github.com/CESNET/libyang/commit/54c3276d871023da266d4ed3=
ceaee7e8d71d0b04</a>]
+CVE: CVE-2026-41401
+
+Signed-off-by: Gunashree K L <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Gunashree.KL@windriver.com">&lt;Gunashree.KL@windriver.com&gt;</a>
+---
+ src/parser_common.c                                    | 4 ++--
+ tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 | 5 +++++
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+ create mode 100644 tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_=
26
+
+diff --git a/src/parser_common.c b/src/parser_common.c
+index 39fb4ab0a..f11fce560 100644
+--- a/src/parser_common.c
++++ b/src/parser_common.c
+@@ -313,8 +313,8 @@ lyd_parser_set_data_flags(struct lyd_node *node, str=
uct lyd_meta **meta, struct
+             next_meta =3D meta2-&gt;next;
+=20
+             /* delete the metadata */
+-            if (meta !=3D &amp;node-&gt;meta) {
+-                *meta =3D (*meta)-&gt;next;
++            if ((meta !=3D &amp;node-&gt;meta) &amp;&amp; (meta2 =3D=3D=
 *meta)) {
++                *meta =3D next_meta;
+             }
+             lyd_free_meta_single(meta2);
+             if (prev_meta) {
+diff --git a/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 b/te=
sts/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
+new file mode 100644
+index 000000000..7e3b6c39e
+--- /dev/null
++++ b/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
+@@ -0,0 +1,5 @@
++&lt;int32 xmlns=3D<a class=3D"moz-txt-link-rfc2396E" href=3D"urn:tests:=
types">&quot;urn:tests:types&quot;</a>
++       <a class=3D"moz-txt-link-freetext" href=3D"xmlns:yang=3D">xmlns:=
yang=3D</a><a class=3D"moz-txt-link-rfc2396E" href=3D"urn:ietf:params:xml=
:ns:yang:1">&quot;urn:ietf:params:xml:ns:yang:1&quot;</a>
++       <a class=3D"moz-txt-link-freetext" href=3D"xmlns:dflt=3D">xmlns:=
dflt=3D</a><a class=3D"moz-txt-link-rfc2396E" href=3D"urn:ietf:params:xml=
:ns:netconf:default:1.0">&quot;urn:ietf:params:xml:ns:netconf:default:1.0=
&quot;</a>
++       <a class=3D"moz-txt-link-freetext" href=3D"yang:operation=3D">ya=
ng:operation=3D</a>&quot;create&quot;
++       <a class=3D"moz-txt-link-freetext" href=3D"dflt:default=3D">dflt=
:default=3D</a>&quot;true&quot;&gt;5&lt;/int32&gt;
diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patc=
h b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
new file mode 100644
index 0000000000..2d685e111e
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
@@ -0,0 +1,68 @@
+From 48672b289e2e4c6773712c3ee0abae6b7fffe1f3 Mon Sep 17 00:00:00 2001
+From: dominik blain <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:do=
minik@qreativelab.io">&lt;dominik@qreativelab.io&gt;</a>
+Date: Wed, 6 May 2026 03:03:14 -0400
+Subject: [PATCH] parser lyb BUGFIX integer overflow and OOM (#2513)
+
+lyb_read_string: when len =3D=3D UINT64_MAX, (len + 1) wraps to 0,
+malloc(0) returns non-NULL, and the subsequent write to (*str)[len]
+causes a WRITE SEGV (memory corruption).
+
+lyb_read_term_value: when term_value_len is large, truncation from
+uint64_t to uint32_t allocated_size causes undersized allocation
+followed by out-of-bounds write.
+
+Both paths are reachable by supplying a malformed LYB input with
+crafted length fields.
+
+Reported-by: Dominik Blain <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:dominik@qreativelab.io">&lt;dominik@qreativelab.io&gt;</a>, Cobalt A=
I
+
+CVE: CVE-2026-44673
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/CESNET/libyang/commit/48672b289e2e4c6773712c3ee0abae6b7f=
ffe1f3">https://github.com/CESNET/libyang/commit/48672b289e2e4c6773712c3e=
e0abae6b7fffe1f3</a>]
+
+Backport Changes:
+- Adapted for v2.1.148 code structure where lyb_read_string uses
+  uint64_t len (not uint32_t str_len) and lyb_read_term_value uses
+  uint32_t allocated_size with uint64_t term_value_len (not
+  lyb_read_value with val_size_bits).
+- Added overflow check for len in lyb_read_string to prevent wrap to 0.
+- Added overflow check for term_value_len in lyb_read_term_value to
+  prevent uint32_t truncation in allocated_size.
+
+(cherry picked from commit 48672b289e2e4c6773712c3ee0abae6b7fffe1f3)
+Signed-off-by: Yunseong Kim <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yunseong.kim@est.tech">&lt;yunseong.kim@est.tech&gt;</a>
+Signed-off-by: Gunashree K L <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Gunashree.KL@windriver.com">&lt;Gunashree.KL@windriver.com&gt;</a>
+
+---
+ src/parser_lyb.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/parser_lyb.c b/src/parser_lyb.c
+index 788be9499..c1cbfc805 100644
+--- a/src/parser_lyb.c
++++ b/src/parser_lyb.c
+@@ -217,6 +217,12 @@ lyb_read_string(char **str, uint8_t len_size, struc=
t lylyb_ctx *lybctx)
+=20
+     lyb_read_number(&amp;len, sizeof len, len_size, lybctx);
+=20
++    /* len + 1 wraps to 0 when len =3D=3D UINT64_MAX, causing malloc(0)=
 followed by an out-of-bounds write */
++    LY_CHECK_ERR_RET(len =3D=3D UINT64_MAX,
++            LOGERR(lybctx-&gt;ctx, LY_EINVAL, &quot;LYB string length o=
verflow.&quot;), LY_EINVAL);
++    LY_CHECK_ERR_RET(len &gt;=3D SIZE_MAX,
++            LOGERR(lybctx-&gt;ctx, LY_EINVAL, &quot;LYB string length o=
verflow.&quot;), LY_EINVAL);
++
+     *str =3D malloc((len + 1) * sizeof **str);
+     LY_CHECK_ERR_RET(!*str, LOGMEM(lybctx-&gt;ctx), LY_EMEM);
+=20
+@@ -281,6 +287,10 @@ lyb_read_term_value(const struct lysc_node_leaf *te=
rm, uint8_t **term_value, uin
+         *term_value_len =3D lyb_data_len;
+     }
+=20
++    /* Prevent uint32_t truncation: if term_value_len exceeds UINT32_MA=
X - 1, allocated_size overflows */
++    LY_CHECK_ERR_RET(*term_value_len &gt;=3D UINT32_MAX,
++            LOGERR(lybctx-&gt;ctx, LY_EINVAL, &quot;LYB value size over=
flow.&quot;), LY_EINVAL);
++
+     /* Allocate memory. */
+     allocated_size =3D *term_value_len + 1;
+     *term_value =3D malloc(allocated_size * sizeof **term_value);
+--=20
+2.43.0
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe=
/recipes-extended/libyang/libyang_3.13.6.bb
index 822c30ba24..1d84eb5c40 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
@@ -10,6 +10,8 @@ SRCREV =3D &quot;c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01=
fb&quot;
=20
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"git://github.com/=
CESNET/libyang.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${PV}\file://0=
001-test_context-skip-test-case-test_searchdirs.patch\+file://CVE-2026-41=
401.patch\+file://CVE-2026-44673.patch\file://run-ptest\">&quot;git://git=
hub.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${PV} =
\
            file://0001-test_context-skip-test-case-test_searchdirs.patch=
 \
+           file://CVE-2026-41401.patch \
+           file://CVE-2026-44673.patch \
            file://run-ptest \
            &quot;</a>
=20
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FnNTjS0I6wrLzL9PZd1fMf49--
