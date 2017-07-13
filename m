Return-Path: <alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id EE02B60125
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 18:44:15 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6DIVPwb010935 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 13:44:16 -0500
Received: from nam01-by2-obe.outbound.protection.outlook.com
	(mail-by2nam01lp0183.outbound.protection.outlook.com
	[216.32.181.183])
	by mx0a-00010702.pphosted.com with ESMTP id 2bn0nq16bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 13:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zhzc9J4OaRMlhUA9eMcYz8KV3pUU5G+nBnynYzGelug=;
	b=HFh5ZxAvUV0Szji4xQb1fffSWaEviC1VOKGdnYu9ItEarExkF4+eJtCLdgLlfPXcx9EyNHZRcdmDHphNgtL9kR67Il1B+kZZfy8a4SzzrZQjzvRGtnM9ruxrrqQ/F+rMhoFwEXBYkPSEIbdyVCi0ibLZPFq5oO3uBjJ0wZ+2WoE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from rtosams.amer.corp.natinst.com (130.164.62.190) by
	MWHPR04MB1150.namprd04.prod.outlook.com (10.173.52.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Thu, 13 Jul 2017 18:44:13 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 13:43:28 -0500
Message-Id: <20170713184328.8247-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.190]
X-ClientProxiedBy: BN6PR1701CA0012.namprd17.prod.outlook.com (10.172.26.150)
	To MWHPR04MB1150.namprd04.prod.outlook.com (10.173.52.23)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95eb955d-08e2-4cec-1425-08d4ca1f28af
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR04MB1150; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB1150;
	3:ZtV4kbfmf9+NwNGXN66d0vL+M7DfPFmjZHs+/AOd4z97+ConuCOlqcjDg8QzsvFk0iR+geiBllGMeplGUoEId0F62hcT5HMhzc+uOpcFxP7VZBu41Ms9WctKl1ugxXbUJgoMK/wIdfy25qw3mF8TlmpfwSpBO8ANXmhAnu0MFusCcPX11dctCsN2bgC678k7gda+X3YNhob4kMhtcbpjpa4GArV2cbBTaDtJCyPLyeRcN+mn2ZleId5IltfAobRs5Md2zafuJXMVVO338npnsDIsTEUujXAOPOsMUMb9dWIGG5oXSkFejAqGBR9qN+NGKKlPwqCPlWNlhD3XGDnNTHBDkHuBCycZW6tk9Xl7IEmuQ3D9RDgoyWKhQThrK7T5FFKrVeh49cNgn7NpvIftNLBKzWvuDDFNPFp70DHVvTKiSbd8OceyoilsLwpdjxNtMBJhX6656t4drnRdRaf7C2+y/KjEMN4+hTvpeRmtl3w61i8KVSP8+84MQrxXooFF6KAXNyArsVX2J+oLmywNG7KRqu88vHOlsgrfizZMM3xLcSrLQ5vBjD3o8b68hOtE7OYFgfgcuGlrgT/hMUdMR3gko3PUxIgy9VLaAM3kKuiWOn2JC9kX1zAImCVoN3iWwnyuHGRXoVSHvhPjqG5ehs5ZCF0UTLLoMCH9v5BJcLIVOJ7pULst7Ow9tbQLfPNVijTftcrEcpIoVedWcpbjbEVRDMBQbHZdAJQMwywuEbs=
X-MS-TrafficTypeDiagnostic: MWHPR04MB1150:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB1150;
	25:e8b+YjWhKWwfqVI322ZfmBtKD7KE0JeyJDJ3n7JOlKStkSa8xEZelMecNrrCosZbtLDkxq129JGOot/AJZGPMG9jzwdkE8QE+7kvPHS1kllxgBaDO7m0ozdToq7CwJGY4hFR0g8txS0r/kPWH7rOS/4Q4ktlW+28LZep15xwKHqiUBYYTb2eb21N/Q4qHwDjgZoyBQPF20jRqK+430yxGDEBKcIiO77qsYs7+1ITe7lj4BMPcexIgmSSxGslxTIoieUcB6kQCdieuWqV06jyjrkPfICL/CWDAeUjzTm8LvGSKVc0D5ctRkcTLHMvDbulgcu2UcwGfq/7TBycyQFEb6JpSeGXkIQ4pmL8t5jQ34tHrQ1gtUTNTYav0txiz3+mvORfwuokOKDfmyfeEo5gDl2vZRR6OKFajQcjNh2WYvU8MjuYkhVDNJefmZjT9RZp0TeEF0cfkU16OozCoRtUohYzEF+wwUeu8DV1S4ZgVJlQK88RZ03j3o+03OWJSu3sYSYW2I6/3JwVc5+GEZl2x3dLmu/syv+uY/HU3E8REwaYWNev3WYw3LcU45G5rszvoV4lT8Rav+L5cY9wmmqdkj06i+ifpGYANwKATSeV9/5C5R4yeqZ9TimEyOsYiL6nZx5U3MVxLO2/21tvoF/qHlATY2rX4OXOsvqmRubckAtpqMzJKbkZnHNKhEpHXqOYjmp7qFY0kpRK2n5WVVXh6o1bzvDNug2rxlNtXOxnwLnGyIQvCukp4kPJ95/3A8QuRfFYDvMdg7i74pzO4jTeJ5oznvONfiFx+v6v3xW0Nn9eFeR/O1m944txIqUsYAzRfjeolSH5L10rr1G0mRMmwkBCnYJ3pmgf15ZK/iGbuPzM+x9sKG4pW1bunRTUssqeUrguNNUqU5znwhGy5XYC0iCBi1pCFdfC3uzSQviOBnk=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB1150;
	31:ZnNqzdoce4+Olrqx+uQ7EaNacRjrJGTSTWEFj1wpYOQ5W+2ljtXNt7MVCIjkx76kto7GAPibiqu1V98csbgV9oWuhun3S+7SaamcAzkDFu6xPifWMPtjttXLyd5B6lwLgf0oXWC/kgfOEcen6XbZzNLdwNX4crjDjaAB/JvsRzgJZzKLdMOErP2jC580+VgStS17vh1R5uY+hnbes7aHS4AWM63VhpZHOTvOH4kt3PcqByczKog4f78HtRzCi2tLJ+/tsl3Ifl7fHOE8IGui7YtCn+4ZPx4JbexWgQBpela9bfKpa1z0eFCrb11CYoPPxbAQI5gCcDV8aSC2F645kCtmSjDTQ8ivJrcNL/H5x68eh+KR6gPHTLbZ27BGqsv+vDejQylf6/Yqli5JoYwqWVIv7S7Her8ic8omdVrfnhjoWcNvA0cKFRgTwbvkA5GoZqyIITIK5out/RE0Oob/3eOQxJmwnOJ3e7bDB/p1pVmzxdUp2S+9y6uUbkLYqnZPcM8FFIClwspOKWkrJ5g40frKLTG+wscSURWEiiHsAqn+gH/hRQgqwjokLnQxJ0M6X0rIeapXmnny84oLikwbp4odUXPJUyG9+3fEELEgL3ciqVZeh1NaNsYMclnn7/OeJD53MXo7dw2h9pazoQJUExGbivFuAvJyMiYnhVIM6RI=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB1150;
	20:6KWyFSKChBoM2bKF82MxEyeB5yBy/jy3/eyGG34XSdFTEXpHnHxwAlA57CqP/5lHJKzHnuQ3AMlWVCe3LBpf+M07tDF5pIjglcnpSUZxqu4/gOcqOnogXRBaXfBD602FKr8bBLtjJtVTG9hE0NmjV9oG0GHke9Nn/0myHW/U/uVCIebAP7BrVSgKd4Sszb5yrpzlL2+T33bXJaW7XnQ+xBJoVrRAdGaMCScJCmbB+A2EThFHKxt56OKRpYA6eDifQbylRQ0hWgPniW5DKpdyW5afeMaeagOrSBgOkykTyYIr2N/zAU0LcxRKykrgz8WASB3Geyaj9CmHSwt73m/d549ZXCpPidQ5jFNs+FjpStAbGTvqBCgvyZWXIw0CkQcA3/bSHmTNj2co427OSafhzFbwMqkPchXXrZA4CevAT3bt57caBpNVLJwmFdmRU479SUHEK2CvWzORTscMq/YOpEN+0eC90nFYBmOPtbhVQU/m7Jn+d5vZwLJTJgwXixVVJt5NMDOFggNXHN7mNSJzXy4ZpaTsi1T/Wlbm4YaZ1Retu4arSs0aHXmlttPAcUof7juz22aipZJ6SqT3907r+ma4E9C1WzsvsU2u5iGengA=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(145744241990776);
X-Microsoft-Antispam-PRVS: <MWHPR04MB1150D2B523224BAFD1AB08E3FEAC0@MWHPR04MB1150.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123555025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR04MB1150; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR04MB1150; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB1150;
	4:xe5TWq0NXPfJOGohlAROxo4MNE4TgWMxYeApG806Xm?=
	=?us-ascii?Q?6Y/uaf6bEQgSRNNKmMEJKYajB3jNyMY1kAh6e6y+Q6q3aK7ZJrv6NzPt3ohy?=
	=?us-ascii?Q?cPwE3CMBXCxuyHzlMwNqmRx8NRkiSIoUPr3R8Ej4cijfQvZhUmCCi2ME+6ta?=
	=?us-ascii?Q?aPCxkJO0aBC5Ho0l8UxXQYYxipgptsFRVkE0RjCfKGn1I1VFex5lwZT9sPEV?=
	=?us-ascii?Q?KYp1ZNkTO1JKqS/kcpa2y9w6Scopsk1bqvNn/t4I9TLHyzlQn5ibbez2r2ea?=
	=?us-ascii?Q?ENqzZGWwz11Z/pN8YZ+/DEsXcUmsMjlLMAZNO8AS0yIVjgOGLgr3HbZKhZhk?=
	=?us-ascii?Q?JUJGEbqs/qgm1kvgsNxmcxuAgo9++HcABXa1Ll0uzmJX5c+ST+gGVxfvL3I2?=
	=?us-ascii?Q?aKsWZcaJz/jVo+3xJFqgOdu92OFgR3t8Fp+nijCMwBok5WcPIXeBnffNixWu?=
	=?us-ascii?Q?GxWTo3HUkgDCP77FHtGeEufebEznKYm+dcaqgN/8JxOX32BHSdX13aCZtInk?=
	=?us-ascii?Q?Ld3Y0Ev+S+eO/bQxBS0JUirFpUHA7nUhQbw8aPRbaHJfmeaWdgabfHsGkSqv?=
	=?us-ascii?Q?zje3O1dNFXCVupLt16ncr261R2Q8tVBgjVuSH4YliqDQaAqAZ3fa4t3N8KSb?=
	=?us-ascii?Q?fzgMxk1iRcI0+NwrdFupCVAY9A3A+OGQ87eeFh2ndbmvM8+TKr3sERONU0N0?=
	=?us-ascii?Q?ghxibug8ZvTRh1Rk68Zu/6+fLJscxl83N3h433fXeuKBO7pB+jKkuDTV8YqE?=
	=?us-ascii?Q?VseCFR/khcq7i2wogTbi0OAn8IP0V4ZyGQf+hcP0t+IQNs4QOJqfkNR/JNGs?=
	=?us-ascii?Q?VLLighqEnqAgY33NIvKFDhv6PsRPtedSgkcIs8nDBNPt1094vwFzrSBi/xN5?=
	=?us-ascii?Q?6Pq5A7d61MjQal0oUe/wqgj335jZ95/IpOVrRd8joVuUs6OZhTNA2WfFJiTW?=
	=?us-ascii?Q?s2hWwaLKb/bnnx5pbLUHlFVWoNb8P2tjL21A0XCzEJNFMpRpDAIiSTEQ6yGM?=
	=?us-ascii?Q?Xpgih8kEiuljQDNbCaEtoJlm5imkh/r5aQPbjF2mwMQCPXMPyF9NsAXv+OUW?=
	=?us-ascii?Q?LeuWFVf+VtDjZqg2ojWKfhO2m4hyUwz2Dp2YaWUs03kGREN5ZQKVSdGECjOT?=
	=?us-ascii?Q?2MkWVNVrPNgM6n1dlSWXbXD4WZc4HIVQPRsbjGckDHFnpn4kfDKLoKChHmsJ?=
	=?us-ascii?Q?GfLq2h1LhOUXAf0gYRxBG558/E1QOmxUL6W6tRS9QZ0542P5K25pHQHxCPXv?=
	=?us-ascii?Q?sMjrkW0OCxEhvlYzo=3D?=
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(7370300001)(6009001)(39450400003)(39400400002)(39840400002)(39410400002)(39850400002)(5003940100001)(5660300001)(305945005)(42186005)(6916009)(7736002)(33646002)(50226002)(81166006)(7350300001)(2351001)(3846002)(2361001)(8676002)(6666003)(86362001)(6116002)(1076002)(66066001)(2906002)(110136004)(25786009)(53936002)(6506006)(50986999)(189998001)(48376002)(50466002)(4326008)(36756003)(478600001)(6486002)(47776003)(6512007)(38730400002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1150;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB1150;
	23:i1hp2Rb1LrPa6mXdL1rQiw3oljsTyhu5P69Liozso?=
	=?us-ascii?Q?oBIX3eN6HC2NWfAY13zON8gipf51r0BV4mmS2cqC8AspoRWB+88paBN5mpXT?=
	=?us-ascii?Q?qFd6RnRoPstaow47OJ4Bwl/1IIRJKds8JGdUYUp6AIpkzQhj0eChgAbn+6r7?=
	=?us-ascii?Q?YYVwPe8L8zY2VAkQe4iK7L/vaMxv2EeR+xP5ZTE4tLSI6tz/VHzTyhgrJgV8?=
	=?us-ascii?Q?rbJC52aYQJwxhsXO6UXAjzwmCdYSm/P2I4/JcOP+DW7YbDD3ds3XHQPyUdBj?=
	=?us-ascii?Q?UXVrLH7MBEHNyp1cHUoMsXmHdrIT3WXyYuSmi+SmE1Oxe9zlxZuXCZTh14NN?=
	=?us-ascii?Q?xgqDnWe0OL5OuHJVLjVHDR7wadFshBSdDfD1tTIq3tE0ZBiOZ3E4CFYfJyA6?=
	=?us-ascii?Q?eYvG5aQ30Ro0/e7OuTwwFFlV2dg/4E7WHhJmsb5wJr6zvN2/LLnbmqQDbY9Z?=
	=?us-ascii?Q?XR6TKO28YTOWL8/SrzzHeZ7B/N1eOHX/WaZ9+mihuPk/0QcysTaeRPTALM+d?=
	=?us-ascii?Q?aq43ZoM7ZPMy7Jd7ndS0tFB3Mb7bRosckkbJJt9lRDgyIDiQh8nd25ef0v+A?=
	=?us-ascii?Q?un8QRi99OyXBHnJk2J13dioHA2l5qjFEoophN9qsFHOdURBxgz4b1DzvI8n0?=
	=?us-ascii?Q?VHlfz6HD/Al4cU48VUR9e5I7H2MGvprhDdW5d2L/lC15+mdgEOqkFYeRFhcK?=
	=?us-ascii?Q?gbRhoJUqYYg45/F7MUWqo3SPJmXJagPAhE4gEYX+TSQPPpTdeJoE1VKsmJdM?=
	=?us-ascii?Q?+tC4RpPNxCv/PtjE9riOSmBg+VE6jEPwe3GR8ybz0CD9s3JU/71SNMD12ML/?=
	=?us-ascii?Q?oOztlvJER/ciyICNoRjnFSt7xTJgayWeEUtV34cSdnelMWwj4UkbdwvSXw9M?=
	=?us-ascii?Q?L8aqAZ5GnijBdv3tQSQPv+uskJamdLVd0oXcMfvlEIfQ3pOlDz1zymW9jvUx?=
	=?us-ascii?Q?LNixDPdS+YNiQo0cgy8GOVcq5wTB/lraT7xxa6a8XzQuPZPNLvVEyCSVMS29?=
	=?us-ascii?Q?rCMCxVDlevQHPG+wzRCX7RHyfRLeUNaisN203S/LL4aBrCRA30hsVJRcuhSm?=
	=?us-ascii?Q?5A4cugmO3G9ZVwv8Hy7clXvhAcqF48TgBdj9cmaWqTPh33tkw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB1150;
	6:ZRslGXH4lsFiY/NMv1LuSHjGtPeArR8hXhTqxDIsS1?=
	=?us-ascii?Q?MDix48KSzBYFn+VSPiBFbT83+cOwQ0Z50eZlKwelrgnvL9C4TVwRVLrYA7Jh?=
	=?us-ascii?Q?N5wxDu13wNg05jQj3O12w3KlcaJtHHMeLjYiUJbEaDKb4oyMxHSp3cZWIJfm?=
	=?us-ascii?Q?dv1Rs6MReK4ia8a1vn5eE7/SZMuR+X6n/YqyZqN8hQ1VdSz9BNwH6PGlXjBo?=
	=?us-ascii?Q?4tNUAr/9RGpHuLYvAGvJYVFtEhKqX/9a4poygTuKJw0jFf5oFEAQJkpiZIX0?=
	=?us-ascii?Q?wX6dlFFlDZLctFAaoEejiJ4BnfcoQo9+Ix1YJ/4rYYxKvffLL3PIlR6mj5p/?=
	=?us-ascii?Q?Wn4nPowWC3+11EkFvt55DZSBNwMyluG4VvjKKIr1+AXsHU1o8FSTExKDKf+y?=
	=?us-ascii?Q?xCYfjo6dzFeCV3zjRHjc8vu3DbEANr/0wbIaYCIH/8kdvubvZbljB5No3FDq?=
	=?us-ascii?Q?Oh5Pc/MJpkUepyiBKGFjVzEnVDMyrsbVxmFHDcDmTt2ryRUgZFHwws3vPdk5?=
	=?us-ascii?Q?BPJLBlFZeaTztxPH75Z6xAFFAPd27tsuENhkDtPvWos3K9oNPn7luq19ewNp?=
	=?us-ascii?Q?Demg58wInUVlMiHAc5zGgJcvbmwkqFyJH/2CPMF2qUyc3sXksoxypTIWRMSM?=
	=?us-ascii?Q?PO1+3ov+n/ogNfy0DpHHufLKC8Yaef1zfgcaELHy30Nf8oLuxahnwx8FA2e3?=
	=?us-ascii?Q?uVYYUDlZcXhBSWoMbSeIC/Nb4urPlQVNPPS2dH/EWtD6tIAwTl/a0cl46Xlk?=
	=?us-ascii?Q?PgBfUtJI8RzNPoOq4QKd9B2Fmz05B4mdqWTibcrMKTrGvsx7I8s0zukYYXuc?=
	=?us-ascii?Q?4Zkd6NuS2w+cL2e7ZJZdvyXotQkCM0ZocuRrQyT26B4zbb2y3bF8t/+lyhl4?=
	=?us-ascii?Q?euHHp4zJ+9GvOdRuVOgxuDvUYODID/PSTfquo+kYH5W0DJAAS+lh/lBgXXmW?=
	=?us-ascii?Q?gkQN4OongVdmfzGxoF4TrOjnhbFDMMLZSSMF3eFAtA+ivzrB6mpceu1uQr1T?=
	=?us-ascii?Q?8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB1150;
	5:mJ81tlwUQZHQ+5p21IhmKgqEGgZ6PmvbYPW9rC2kAca321RYAzmZZzv3jf79dVd8Qv9kpTguxgSKmfs7YcNqTUh5NtERUnyUKtfT05sZxdY/a9ypGZRYmH4o9pVJvZmnvSP4ELFOLQDIcldHSG+GG7D6ia+2zsXSQ5Cb7R5NwvxW3B2tRvojtnNrB3xM8ukwJaKQKUHSotq5lWt6fAeKEN41gkDOqjHJS9kOz2O8Nb/k5l3UnjjC5kopgtsmYupAFex3gT6KP/Cl6giUhMI1HHJBdMv1fiBL4V9k4RZiTrSOJQpjfI/0ZFDpm2xmNNTbO3ypBp+YduajZJTr3uGl/SsUwmMokZSwmo6MLzq4WYXVXsJSjpISuWjBNzTYhA2GcQdJBynmPUVxjUMbM1p5rSE4dr0t0T4UFYu3LG6nsT4mR8DXfV1Qp+/8Abe+ii9X4PJw0cBFqG2u+8osbf2iNIoNj2dywsDNrWe9hZGBUg1ylzwDfIGhOKYyRxExS75n;
	24:U5AbD7+QascKLra7ViwIU1yxpltixfSbYd81AHGI9E6Y9+IlV7e64xlEiVhlFShWE40Orq6mDY7v3/Fk8oTW3whUWmz14aMBbiZoTtS8zes=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB1150;
	7:k5QkfXyHHoJ0pkm/u1197p1B302Q3QxM5fx8QNzhOrz8GwgH4qWwxiXC2S+J1NmZbz0jxZZzIY5s6o9q1htFOaSZ75SQCTrBvz5aXUvtzl+fmRMpLIVNOLdagae+r5R5mq9DfO0acevXq2Y/r/yunzfXz16lKIFGvkyOaexwPWSB5ugi7D0aHSr/8PGbn4OZ9MIpICuHz4YGtYZF2D6f+Qdg0dCI6jkAc6hjJGlUwpl8gAolEYTTCGxHI6mDuMMZ7sBRBoJExVKPx7Ml7bTxyjvWzYHrUOVF0hM3J88qIoUX1UwAG7/vXZwflgrxo0q7tFZTi+Mu3hgy9JyzDFuW4JXNV3j0FJ/MQOzH5gG1F4cqXJM497KkwThiLrt1gGUqloiQhLp6oBTdZ2MzlM4Cgt4jjFpmLkCpxqBZxYDATW+SmId4Z8zsUbMecYgJqlrnSLjHVSq05Sf4NqqNA8FZeM0gYF1lMmHinjAxds/i+HzuHrjxO+6D501qMFaS7/Vu0kgGaPXFBT7CIj+Z0awh16D6PXfRZzwaq47LFUFV3lO0yIBfQOXXTQdptFydC7UgsgckxciYuh65Pdm/rV/D61QPOQTy3fb6ZNBMokdzx8CcxWhs/PLpuViAbm2V8itUCrs7W9HUaazjSnJ18Yd3uH2psrhrjGLSBdaFRUW88ARinkiEZ7yOKnrcORKSLMHG+8UugzRjw6QRSyJ23tPHvTPR3ytWGvCA4LKDXmoL3EOjnihb4FaB3Q1EeU/sCg4KkaclyJfc2vP/u0hHA6wDjkCvZ9wZ2OROGEnGMdSeiLw=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2017 18:44:13.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1150
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1707130286
Subject: [meta-oe][PATCH] fuse: Correct runlevels and startup order
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jul 2017 18:44:16 -0000
Content-Type: text/plain

:**/fuse*.bb
* Assert INITSCRIPT_PARAMS to install the fuse initscript according to
  its LSB header instead of defaults. Script now starts only during
  runlevel 'S'.
* Also set priority to 03 such that fuse is loaded before udev. This
  enables systems which utilize udev to mount exfat and other
  fuse-provided filesystems as a part of the boot process.

Natinst-CAR-ID: 630632

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
index 000a6e285..202d4c3eb 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
@@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3
 inherit autotools pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "fuse"
+INITSCRIPT_PARAMS = "start 3 S . stop 20 0 6 ."
 
 SYSTEMD_SERVICE_${PN} = ""
 
-- 
2.11.0


