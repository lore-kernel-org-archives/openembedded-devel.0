Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15517.1793633499394489417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JwXTZkPl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=576642c162=juhandre.knoetze@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DrdOi604103
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Nov 2026 07:31:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=3VeEVfaWzvHThme5ikUrBA
	ctoG4jraI+Hz1uedq+5ho=; b=JwXTZkPl7V4ASG65PPoAYuCsuFVhr3sWySKlos
	JjLVAsrJSjOiY7tE4BGSnWI6gwAt4AsbjQnH89Vi8iCviFCL+q4tbIZbWOwddoqB
	q35UdoHTJg8y14wK85CgwahtS3SIAsCxQlu7x2G50Th9ljsdS9Cg5cxpwxGzZ7BZ
	mtZtXeYaO0Y2I1wLU2nMyZIK0ifRemABM8vRYQsUTFKvF9nd4870PqxlaPtb+tgM
	KvhEOp3VMs0JpT8CZ9NlwBx6FOhWSiUXl+Y+Jar7o4HtV0d1XqXe0fRWpiswSd82
	vw7avgiWOrU5gdaThP9yyltwVO5QG6qVTEU/WI25tIhet47g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnbm1jf7x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 07:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uM7GuQmpy4/x6jOwSOaVKNUVIYHVvP1OKzSy/wiJrybRJi/woTWjLMv8JPjPz0iPpCWR2ScA8jkPeMW6e87Y8joXLqsM/PJPtl1SRLNhOcOEtjSDgz/4cN45OAQpRz/cL4VcPHEO2dqXafCaMB0PdJCRzcHbrui8dVFcX3nzqsgMLFYkm7UQmrycLNxfNcf4h8p2kOWvYLESnWpBlPnUxxY1S3qsTo12CqZbdUasr21b+FY74taXXx9dqtIVs1mIBFwLNE/z7I7aXwEykAiJFF+TTkrQcaLzpQc7KJA5VacMRyAgGpivEJIGEQieyXLvDJ4M6fg5ksjgvLuNy1c1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VeEVfaWzvHThme5ikUrBActoG4jraI+Hz1uedq+5ho=;
 b=IQGX73hhvjBpYYVWYQBiKmgcMPuB108p2nzdYaP+P86QGpRYCIxw7pGfQWOg//RImVsSM76DBYUDkriuswUmdV53YeNMu4WNNKSz7giD0fR+9X3L3AHimMTjq0clGeuGOy0u2ob4mGG7pOE2qoF6TBNgmr4UCPuGbwghNR5kzrXvynEjeW6y4p9ouVP+9dMewn+1k7LODIlV8i+mMbAxK4N9DdBVnQpp/yQrklZLWXFKGmUYtb8+8L91PQnAmvricuLHTBDAVV0CBWvYeWltIEwXJ1GRO6XLG6RhrWkQaqLXJCIniOGCp9VATo7ze/SWuJfApmjM+vfd9RCrbSpBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH4PPF3D73251BC.namprd11.prod.outlook.com
 (2603:10b6:518:1::e65) by SJ5PPF6806D69E4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::831) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:31:26 +0000
Received: from PH4PPF3D73251BC.namprd11.prod.outlook.com
 ([fe80::fbe7:25c9:7f94:74a8]) by PH4PPF3D73251BC.namprd11.prod.outlook.com
 ([fe80::fbe7:25c9:7f94:74a8%7]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 15:31:26 +0000
Message-ID: <4aa041df-5323-467c-8f2c-b525d034a995@windriver.com>
Date: Mon, 2 Nov 2026 10:31:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libyang: Fix CVE-2026-41401 and CVE-2026-44673
To: Gunashree K L <Gunashree.KL@windriver.com>,
        openembedded-devel@lists.openembedded.org
Cc: Venkata.Navuduri@windriver.com
References: <20261014075946.1280083-1-Gunashree.KL@windriver.com>
From: =?UTF-8?B?S25vZXR6ZSwgSnVoYW5kcsOp?= <Juhandre.Knoetze@windriver.com>
In-Reply-To: <20261014075946.1280083-1-Gunashree.KL@windriver.com>
X-ClientProxiedBy: YQBPR0101CA0216.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::27) To PH4PPF3D73251BC.namprd11.prod.outlook.com
 (2603:10b6:518:1::e65)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PPF3D73251BC:EE_|SJ5PPF6806D69E4:EE_
X-MS-Office365-Filtering-Correlation-Id: 60aaab31-b738-47d8-abec-08df38f65bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261021123027099003|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006|261009223027099003|261009220027099003|261028144727099003|261009223327099003|261009221227099003|261009221727099003|261021121427099003|261026140227099003|261026121527099003|261022105027099003|10067099003|261102123227099003|22082099003|18002099003|13003099007|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: smjbyMDFX5oRfNzju6Hvi/BVPQx69lGwHfiUOvMjoz/cdPH7wJVSMguCkVWdAm5DZJVIbDynpA7VcBZGQTYLwclNLjbSoBhsC8g/HEY/8SWPfAUzLPEm4V869OszlaDs4nxdL1qvK7afMg4+cOJB6KfN98iWoMT+cbzwsM3pmzRHF0xMiF0XX5CotAbIh2HyvxLjxVFLcAeK2dy1ZfIEIOyaxHFvJCY5G5E7s+X1P57InRY/WTCR8tSzp7/uo8Jye5snOgccaCyqFo2tXXTeGDxRa6ed8rE9Hp+22pgjfLjmZSXSSpiT1aAcv2r4zy8owDQ1J00xLA+OuS12sHjf9JNlk0u4FuigP+1YUzIdet+S7gRxAQa/xcdAFA0b6dSXUoF8VDJyX5t++GvKuDBtKW0lJxF2Pxz50gyva3Q0wa3lE88d4qDpac0xGuVmYPNN2IAQqTVNMDyQ3yWPmHKE/fcS0nulnIA31iViR7cpWhGtYqp9N9Z+DG1wyjwTkMlT4kt7weIx8DYCsThlj8xm+V1ZplX2R8+g/9GLcXieIR1wwb4oeTEdtbjCGs0TX+UnaBVmXqJOyR6sl4LJrgqyQg8KFQxnEk+LQFvl2ezB9If9bjReHu3YaMdWn9m0zHx5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH4PPF3D73251BC.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261021123027099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261009220027099003)(261028144727099003)(261009223327099003)(261009221227099003)(261009221727099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(261102123227099003)(22082099003)(18002099003)(13003099007)(8096899003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry9maEJncGRpZTUvMkp6cTVJVGE2ZEZnT2Rpci9zUHNSOTN0QUZFSEpHTnBQ?=
 =?utf-8?B?RG5OblQxbUxDNlFxV1hzQWR2ejhXdlRxdWp6SDJlYlUxTk5VdjQ3a0o5K0pO?=
 =?utf-8?B?SkJvbEI4WVh4TXBqV0dhbDZUUGw5ZTZ0VHBjVEowL0pxVnhObG5RMFA1SE9G?=
 =?utf-8?B?OE1kcDhGMXdRVG84WWxKU2gyQk05TXFVdmlqRDlVcmZPUEFnd2I3bGV3NTNY?=
 =?utf-8?B?REdZZGJxOUdZZCtQRlRwZ2NWdFZXdk1tRnRXR1FKQU5NSlN0SDJOM3p4WXRY?=
 =?utf-8?B?cWR4L1JTY2x3bks3Njk5U05KdTQvY1hKRmhldWtVaXJCcHZlWmU3NTcrUTVn?=
 =?utf-8?B?NWN4K0JseGFWM09Fb2hhS0RxQ1NwTXM2UTYzNjByVW1zVXpOM2t4ZDNqdjJh?=
 =?utf-8?B?QWovcTJVZnMwdm5YSXdNNG5leWpQQ1Yva2w2WTBBbTJxeTdnSll4b2dleWNp?=
 =?utf-8?B?STdIU0FSb0s5R1BGTWZFbnBUWm9mbjQvRkRpcnNOdGdkU0JMSFlhVWZ4K3BI?=
 =?utf-8?B?MVlucHhsZHUyUGhOZ2ZnSVBxYSs4bVRqQys5RkRuWkZXQVJGNTNxWkZrd1pO?=
 =?utf-8?B?bTFpWTl3UGhsak9pMExiTE8vZVM1MnVuR1pTZFZ1YzRjWitiUStFOFpCSmVl?=
 =?utf-8?B?N0huVUxySmZjQ2cvcGRyR2w0cUVzSVhpNnRtSnZsREF0WHNxN0FlZ1hJZmFJ?=
 =?utf-8?B?Y0ZuTlE0SHI5VG84aUt3dTY0cGFjeHh0OWx1cnRic0QwcEhQNS8xS3ExeUd5?=
 =?utf-8?B?LzVCWDFia1c1Y2R0a2M1bWxSNjBwNCs2SDQ1QmszSWcyb0VhbzBXZGFqdXZC?=
 =?utf-8?B?UlZOa3JNcWVnbGZqNU4vV29OWnFRUFVQalZINnFERDFtMzR3SkplUmx3TWRJ?=
 =?utf-8?B?YmZFMGI3T054alpqdXJxZ2pXSGlybDcxU2k0RncrMkIxYzdmdmx3Qkgwai9Y?=
 =?utf-8?B?czJERk9xRWZlVEE4VGJRemlTbUFjc21qUzNxN004TzZ4cmlqVjBrVDlFckpD?=
 =?utf-8?B?Q1RBV0gxcXRnMXBPbkVxTE1qa3hvYWJkUjR6QzkxQVdoYVR2aGNkREJueHov?=
 =?utf-8?B?WVNhVlFXYVhLNkZ2Z2YxTTBic01WK3dUNExqek5uS0REdnUwM00xUUtkZGJx?=
 =?utf-8?B?YVNGakVBV3NoeWEwOFZXdlY3VUVCSEdrU1VGOEhhejd5emJwUjF0YmZoSTZ0?=
 =?utf-8?B?UFc3K0pQOVpnZSt5VzBaMWxUcUs2MjVrR2RUdGNBbm9pSWFwR0MycUZLR2Y2?=
 =?utf-8?B?L0NobnFyVGxQWVlSL3Q4NjhWUnN6d0RVa0VjM0RXYmhtckMyNThRV1k1K1lF?=
 =?utf-8?B?MitRV1BaSUxJdWhBZWN3a05jT0xJWkRjTnBhWVFGSTFFTGpDUnBrSEw0anB3?=
 =?utf-8?B?U0hDRFpRNnluaGtvWVJpalhTMEhzZjVsR041eDkvN05HUlVaRVd5YXFUQy9k?=
 =?utf-8?B?dVMwbjNYZmtWcG5hR20zWXdZRklDK0Y3bDZkS3pKbDRzR1I0NE5Ca0Z1ZFFw?=
 =?utf-8?B?YS9veUdBZ3lmZ1FUZ242bkF1M1lWTTgzdDc1QjVQMmc1a2syS05nMzh3ZE9u?=
 =?utf-8?B?TWJVNjlpam5lZm9JNzR2WFEyVTVUTlRvbnlKMms3T05xRW02elhhWE96dTFp?=
 =?utf-8?B?d1IzOXQwVDdWb1RndE4xaThZK2JhWTVadGVKa3psakwvNEJJQldwR3RnT0pS?=
 =?utf-8?B?aWw4QjVZNkNyN0FDTjZsTWR2bE9DdHdKV3hOV0t6ZkExdGZKOGZQWG1DcFhW?=
 =?utf-8?B?cWZpcEQ3SllIM2lhazRndUFpcFhyVXE2R3h6QTZxQVd2Qks1UlBaL3A1RVhW?=
 =?utf-8?B?SUF6eFVNd3lFbEV6UjdjZ3ozTDBSUDBXWTRUWVZKYkZFa1lGTE9HdXZFZUlU?=
 =?utf-8?B?L21MZEhuQ09yUmc0Q2Z2SXg0NVc5bEsrczVaUlJvVmtkNHZoV0k5czhpQnBz?=
 =?utf-8?B?Z3FRQWdKaklDTFFPcFY2cXZiMktuaEZzc0RUdjY2TUxCR083bFFGbzRPUGVI?=
 =?utf-8?B?R0JuN2YvbWhlaVhFdUNNSjZiYXhMUzFQM0hTQXFmQ20rY0s5eFREb3Jub05E?=
 =?utf-8?B?U2FULzBmeWk5L3dSTm5maTFMRWpTQS9odCs0S3Qzb3o3WmpjUWlxNVBzUE9J?=
 =?utf-8?B?UEhBcGZaV3JhTFQxUUd6SDBtNURzLzRTL2tkUHRtYTl6OWNLRzVGdGh4Y3Jn?=
 =?utf-8?B?WWpxaTJValpvdEg4MHBYRWVvYlVza0hRWXRlMlk0R0FhaEtqNTdsZzNMNkNv?=
 =?utf-8?B?SXRaZE5rbFEvL2xzQzh0UllwbjU4RWlHVUpROFNnYkt3akdteWltbmRYMngx?=
 =?utf-8?B?NVh4TUFnQkJPV3kzZENlMkpacURIRFhRSGFTNVdoSmxJUy9EYU5icG5wUVJQ?=
 =?utf-8?Q?9P2wQuEPgOkkS1mY=3D?=
X-Exchange-RoutingPolicyChecked: v4Sx9v0WELUlN/hMwbCu/buwQ87faHn4kobLSSzKLipYjttRihwktDk/+c9uQtZT6BStmhq3luYfHLIsCKNYco9EH7ojM5VNTf2xERqa09gYWZVh4V9dmtHbYfmH+9mlA8G1IaMQG+IzFq9/0KrZblgyuv7jvZ+chHjavTVVF2YSSlNLQsFCOd6kQ5xGc7vJZX6OSYL9rgZnZVlcqruYZto8uY6utE5SKuvj89c6vpx6V22vp3DkR2XGRPQfP88SlFIOmYduCnLKUuff/NmCoT+e37FZp/4mKe/TTQILmtNJ6WfD/ktXVVhNMssj4AbRMnJJlSiSInYAexiJXZDNLA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60aaab31-b738-47d8-abec-08df38f65bac
X-MS-Exchange-CrossTenant-AuthSource: PH4PPF3D73251BC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 15:31:26.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHE+oiblRT/L7ZEStku978vBFUJM2CaMGxvQWqhbpbAS1J6ZUSqh84MmB2liffzBJj+Bbexq0jOSDMEJaZEjGBR8ODlV3+9Nes2+cz2Ks5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6806D69E4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX8MNOjT4x1LIU
 Lh4RrYrA+zmd1SdO6OEOaGVdcAYprEHHWHo4vlBqfHnwOuNS/4fBWZpr+1Jb4np/e8OKP8QAVE7
 lMBVoMkfLomVxNBLQ3ZWZnsg1/l+IgHOjmgyghDIvnJRxuSQfC0Fkbqq7oljad4vdQ7Hafd60jk
 mm9QaoRS5PqJ0cE4oJpV9D8RtWr/7dT8diIqyjL9hR66oOsN4hglfjzPvLGgXNB1cnJqZ3NYSol
 3lPVlU1XJgT1Pk6RjkP+7ToYWSnXJoo9tknXLVm/xf90Yxt9BkjPMsd9dUWLLUhpoN6LSer0EPb
 aw2lyso5VeHyjOQ91VhHaEnrE2MNwP4ay03YUZeToM/rVT7OxUJnG9/rkQCXzb2D9rVXwauGJlG
 fYTjlrsQm6n3dl4/+wMQESWVh///DJJuSBqExc8MkTVljbD8mIaNqQr88oPOXuFQS/KLQphEPWU
 /8kXy3M2O0EsGij2bKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX8X5O91PcP1Jt
 Of3rVlIOdsPOaEZBkqTWOEkPXz+uxEhD/3WkNigdXJagX8esvuuCzl2okQRrN3OzQBRaOWfwREt
 nMdTTRlI5tZkyDCuFQN5VzrshJMo5M4PMt1IxK5d2N8W/RGJl0iZ
X-Proofpoint-ORIG-GUID: _9dkL9ZUr78re3gwe5nVruEqH0Q2r0qj
X-Authority-Analysis: v=2.4 cv=RZsFmFtv c=1 sm=1 tr=0 ts=6ae8acd1 cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=2tCJ968wRG7LHZPgrxcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=JrzzBOXDW1UOjNGuWpwA:9
 a=ovzBemDDqBGnOIQc:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _9dkL9ZUr78re3gwe5nVruEqH0Q2r0qj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020061
Content-Type: multipart/alternative;
 boundary="------------BgMlp7MQw1i2lyMqQwkphRWh"
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 16:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131752

--------------BgMlp7MQw1i2lyMqQwkphRWh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A2DrdOi604103

On 2026-10-14 03:59, Gunashree K L wrote:
> From: Yunseong Kim<yunseong.kim@est.tech>
>
> Issue: LIN1026-7461
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
I don't have the RR cover letter for this review. Once I get the cover=20
letter I can send the TA. :)
It's possible the email is somewhere in my email folders but it wasn't=20
in the thread with this patch.

../Juhandr=C3=A9

--------------BgMlp7MQw1i2lyMqQwkphRWh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A2DrdOi604103

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

Issue: LIN1026-7461

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
    <font face=3D"monospace">I don't have the RR cover letter for this
      review. Once I get the cover letter I can send the TA. :)<br>
      It's possible the email is somewhere in my email folders but it
      wasn't in the thread with this patch.<br>
      <br>
      ../Juhandr=C3=A9</font>
  </body>
</html>

--------------BgMlp7MQw1i2lyMqQwkphRWh--
