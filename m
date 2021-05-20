Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.153.1621542198282193800
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 13:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n7taZ8i4;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077456f0b7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14KKJh9O003358
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 13:23:18 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 38ngvn0nm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 13:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZR2Fcut1dJOaw7PZc/HTNJEDdnIfA1vwJXHHYAGkWlKX+93mJ2VqM4hdiU/YPOZkB5r6JhKssrRZGkbauk+6U1k+6hKHNJnYn5OWz7Ya5Zs2qXoaBtbIzeonk5hp5C976G4wJZODMyME4FN1DzL+7t6mdsJCb13Ds0c4zHzbTKxlJLdk3mKnty4HieM4YkXlSq500RS9nH6PCDAEQCNwGTodLhs4s5IDDtrFPHIKatZttTuFa6ENnmtFgyz0SfHSLP+/kc3BiAnLzgFDF+6m8Ib2ArhGhZzBm8+owcFm5kX/V12uh5oQA2Ws/2HH8H7hlLCLXZzRhgYNt14Gg7acEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74fZwf8XyyQnrKF/L8i99JODKP0W+ak7oYk8rL9M/yE=;
 b=TIJlLJRLiXpei80kis9UW/Yk+VByv+ieUpBGFrTZ9ZgApO1PTeGDPi2G1KUCsuXQe2KxxpfqpKIgwFDC9wJ7vkljhHHeY8nyPXFaHLWz18NaNa/9i/sOrvAj80sbQaJOyb6mdsBbR0m/Bj1ZTMavDEmUw3E8qKoel/uoir7hQZ1wdKT/LC02oOnCs2p0O6quO8hg3fDZs26fEOJE54Jp/lA6wtZRQURtkhJpsai1VZ/OJhiHL1q0VdETI0uZ7i6Lssteewff4ZhIGetCMo3USQKUgSf7qOBuG+TBAJha2IZZHFTqs2cOKHKAhncaSGNhged097jEZtOrbs1fredkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74fZwf8XyyQnrKF/L8i99JODKP0W+ak7oYk8rL9M/yE=;
 b=n7taZ8i4dnww7irONUBDUD5esGm8KB4S+qmvpcgjWezchmf+3FXF2BoLbRgU/y7aZrzzjYFwf8TEF8RRPSZzaZT/Pb7TLYs7GrbKXv+mKij5tWc3ASOEJIrbgeh21GNXW7uMZ9auRQPQh42vKES1c6ivRWI/vFVA2/k5mea+B7U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 20:23:15 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 20:23:14 +0000
Subject: Re: [oe] [meta-python][PATCH v3] python3-ujson: fix ptests
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210520172618.1065633-1-trevor.gamblin@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <d4f38479-1dcc-c1ee-0b30-a17122fca5a7@windriver.com>
Date: Thu, 20 May 2021 16:23:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520172618.1065633-1-trevor.gamblin@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:a03:331::33) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.3] (198.48.226.187) by SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 20:23:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4affffd7-5db5-4ced-fee7-08d91bcd1880
X-MS-TrafficTypeDiagnostic: DM6PR11MB4721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB47217A77C0381225E341B09BF82A9@DM6PR11MB4721.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RtLbacDUSOxcRCRsq1UQspJTTuaQAjfGgimuTaDjAUl84X57g8L2na9h+sh9ibiKZLEYXh6/+MFVDYP7oj9xxBesz0br8xGBJm59SSyoKNRl/sqaU7qFHN/N2AOz9pVQuGddgmEp2kFupngL58yk3mWCdKx/c0OlI8FqnDcQSBZbmktYdho9l3m30m80cT9a/mGuHpZBMgBlIpckXEqIxR45dU9mPbnRS0oYpdI4Sw7kBSlDvdsnSjCy8YPCcN+uii/VxA5MXkK5GswFOC4kgv5M53KWwzbXEcQJpVIh5XC9qhBFrOKyuLXE0Ab3X58x3Jafl7oZw+Aw9Z1pR40yDR1iBuWfcHB1Yii/AMaqE3rxCA0a/ePtx14ZB9dhuZaEJNKo0jJnm8l1aLGIdJXxq1WsG5S1GwXOgE+yezwzQyIupnEoi/xtjIU8FvllsL1Fxkgfor+CLr/QnKzaGQC0jCtJuqCCRitcnIf0GOJSGxFZiHFcAmm5Rn6MI2AwFDsx0R8MD+bn5bobqihyM4qBbw9QngbAyufucIHsduJlcrw5yZcAG1UD+9ATe0nqxkp0kzhsfzqP0g3MZ8wPDm8++Ng/gcnTfCb1aCQghTELWtEbFomxsQrghYjcTADu6bv22vMRNlcbTnMIQujFbCregLMzMvVcH9Bizx5bxSpmTXhdHEcVCbHfdhHWk1CCsxAIL5S/yVdJAJ+9+7Nuax3iM4vsV+ev85pWVJWwt8SzxqKm9LMzh77qJ188knvo89Qf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(316002)(36756003)(16576012)(53546011)(110136005)(16526019)(8676002)(186003)(6486002)(52116002)(83380400001)(2616005)(956004)(8936002)(26005)(66476007)(66946007)(4744005)(31686004)(478600001)(31696002)(38100700002)(2906002)(5660300002)(38350700002)(66556008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VGpVNjRMUjdZWEs3SExtSGgzSlErTWpuL09FbDBxR0lQYjNCSncxWkI0bHdr?=
 =?utf-8?B?RzVRRU5WQUxHYm1USVYxWXZPMEFNeTZSY2t3Q3AxSkFsSEJCUVlxdng4VUMz?=
 =?utf-8?B?dE9WZUw3dmRsMXlpTlh0ejBqRlF4NTZ3NDRIaDBGZXh3OXRiM0R1WTZ6TWVp?=
 =?utf-8?B?UjNBSzUzK1dyeDllR3F2bE9wRytmNkdENm9OSGtRVkl4ODVZOWtrTTJBNlZ6?=
 =?utf-8?B?NU5CSUlEQnFtZElYeGJGMHI2QkdRS09vZ3gxNVY0TjZmRWcyelAzNGMwdVBQ?=
 =?utf-8?B?Z2ZUUjZWdEF5U0VQejVWNENSZENNSnJlejNaQW9ROW03TGh4a0k0WEljc0VD?=
 =?utf-8?B?aEdVbWVPZFA2UlRwK3Z5MmxtQUZmb09ESDV4Tm5UOVhySitVUmY4ckZhZDZ4?=
 =?utf-8?B?a3lwNGF1LzBYak0yUTMvVk9YL04zS3dXWVJidUp2K2tJbngrOE1hNkQ5a0lu?=
 =?utf-8?B?Y2tianNueStRRXcwS3ZhRzNCQlpvU0NXK3ZRQWFtV09HN3FzVGEyMUJVWW5j?=
 =?utf-8?B?NTBnSmZGN3FaQVJwa3lSL0xWSXJiYXM3eHFnNitrMjdhT2Z0YU1hYWRIV2tw?=
 =?utf-8?B?dm83TzU0ekpTRU1rdldlZDRKdHAvTVlTRkx4VWFyNU05dDRGcHdQRW9rU1cy?=
 =?utf-8?B?VVlQcDdteDV0T2xHaC9OSGNmNEcwZ21YdVlUSTZwdGdaSnFoaDhNSDBRbmZm?=
 =?utf-8?B?YkU5S3YvSUh5eTFhb0xiV2FLSFN4QnVjMHQ5VzlsKy9XTXVyZXdQK253N09F?=
 =?utf-8?B?QXZDUTdIWWZhZW5haWFqbnlEbUZ0TG9oVmc3VnJic0kvbGtibzF0R29NV1E2?=
 =?utf-8?B?TGJYZkVNbFRSUXBYNW5BUC9HL1E4Q3hkTTFhQkNoaXplbk9FUlk1UE85M2Yw?=
 =?utf-8?B?TGhmZkdEWVcwaUMyVnltRk12YUZuZVlvQUZLcmZZLzNHL0hYbkFjN2FENThK?=
 =?utf-8?B?akJYTlgvN1FVRThad0VpSDRkV1kxRlNrRDVvTGpRVWNCRWoxVm9QbjBmb1Bp?=
 =?utf-8?B?dEpZbGpYcjV1NjJHbnhKalEvR0h6VVhrZGxhZ0dkUTNjR0tnT3c0Y2NaelpB?=
 =?utf-8?B?dElLYnY0ZVcvL0xUbTdLSjl0Sm9IMjhaK3dvTTlSUEo4cFgzQk0rMFJSQ2Ru?=
 =?utf-8?B?QmhKTHI2TXZ0L1BnQWxQNjd5czlEdkRKeGRQMlZJMnhqVFJ1T2x0L3hrRS9K?=
 =?utf-8?B?ZmJDYVpYUzZNMWsrZmg5ZXZIYkIzNWxjT2RPeHRqY2RnZzVuQzVMK09mVlc2?=
 =?utf-8?B?WmVUY0ZXNXZ3bEl0ZktlRG1mQkV5akxTYmFzQ0NZK1J5blNjQ0NDeXVPeW0v?=
 =?utf-8?B?RExDdVNZaTdPQmNja3hRcGhLa211WXFSRHVXaXpQQldvaU9qbHUrSDNSTFF4?=
 =?utf-8?B?d0FlTzVhcVNEVkxQd2RaRVR0NTBNWDhoZERYcXJXU0JKNEh3NzJWa3UzaUFY?=
 =?utf-8?B?QWVRc1lFakNhK1BYcGh5MUZYemFTNC9nYXNhSnY2M3BlN2xLNUREWTdIUzhl?=
 =?utf-8?B?NTVnVlE1S0xab0Q5d3VXS3BkZU52eCtoSStKdW5WcW4wc2ljVllQN1p4NUc4?=
 =?utf-8?B?eTBzWlc0WjN3b0tWd0hZRVFLN1Y1WCticjZGY1h2N0l6WExsM2tuMmJsVnQy?=
 =?utf-8?B?RW5aMUFQcTQrcSs2UEVDTXA1ZEc3UytnU1NDSzNFMjlGRHk1UStINXFHODJG?=
 =?utf-8?B?VEd4T09TWm9lTWJMdG9jYXg1bllMWVU3bXlSTlVSUm5aNVpFdk9CaWc4RHRv?=
 =?utf-8?Q?jBrvogL3EZKc2dIhOHslf9fQsqxdCqHFRixEjax?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4affffd7-5db5-4ced-fee7-08d91bcd1880
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 20:23:14.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVw+rGjHFr0v3zovIJHAPU84DMpnVhEQYjfjaXS9Uh6Abg3eJw7Lg9IIsZz0bnpQfQYG+vHRxlJ9G62ciYcK7QMO1auP61UJZDYYzc3Nbjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-Proofpoint-ORIG-GUID: zZyHesh6affldwrpmR76BPZmicBEIc8v
X-Proofpoint-GUID: zZyHesh6affldwrpmR76BPZmicBEIc8v
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-20_06:2021-05-20,2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200126
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-05-20 1:26 p.m., Trevor Gamblin wrote:
> meta-python/recipes-devtools/python/https://urldefense.com/v3/__http://python3-ujson_4.0.2.bb__;!!AjveYdw8EvQ!Noe4q3gDBm5wNSPv1Zzd-3WVXg-D4b24UxkEE0vFRw5JdHAeJAendj18feLXLhSGfRassg$    | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)

Ugh! Our IT group has stuck a filter in front or our (Wind River's)
outgoing email. We're working on getting it removed.

Sorry for the noise.

-- 
# Randy MacLeod
# Wind River Linux
