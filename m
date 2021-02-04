Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web08.2604.1612472968447545534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 13:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Dv4RSZQk;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVrZN3aGFniS15pH7W1EJFvo8n04Fi4PLvqXzI9AM02bEDPkz4TjgooPbu2PJE2Dl5sBWdXaGwq9Im1UhewEQr4YZBNAN9WzOh1mlAMW8z3KA/lHfIc+PBRqKMzWh/zqB/G7aqfFkHRTJw2PoO2wW2LlpJC8goAXmQpFXD75ObbbMRlBDUWTcAGGfmEXZwJGjTM64TYOLfsM6tYlFQoS8WfFK8Wd20C5OBpuTKe6GH1lne2IV1D4P1LZnOU5itsqUvtalJw7ZbQp//mk62gys+eAWQi3X3wu2p5r19sXfuW9/wT9CZKwh3EmIsAIPLa7p6XfFTa4xCnpuRhvt3UcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgVLEH5Na/Bju4wNzggF7b++tydkPoJ7QWmmIztU/T4=;
 b=RS4IxQwzUlfO0wO0JSqqn0Vz7DKuoLPozWne+5B7WI3nPamXeAVU4Vmv5emj3ymsflaTTGoJ78gwsJ7tCe47xa0YR1GlHnplVfjXNXJZMeM6zAbhBdz8rEUPpRnEGH+XdtBIRMkJbj2FMFI1VCESDHQIoWzVt0HPrndODKTqWCO1VkpMRDf1JwfC9QpXUFVKrHRY+pB7U3+bUgJqeeM7xmU/kim5kzUCS3qEbMGxzWaVGB0Jt4B1kURuox5Scbkbo/3I9LX1wcs7RMGSpo3W6TnZqp2sGzTdI79UK0u31muzwUo1y4p8dZhXwdCTfSlVqveRCV4QC9sVeUNWOPPNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgVLEH5Na/Bju4wNzggF7b++tydkPoJ7QWmmIztU/T4=;
 b=Dv4RSZQkvaDjkAeegAO0PUA9/Qx0a0ctL9TTkh25F4gCzE/rN+m7cGWgOam0Cb5WrEyffiMsUiF577cYQu2Xn61kfFAyyG2jzV/WpSql/kvgVGiO941bbJUqxygj+8X89hwKZrUUcYfut7OV61yE1cLAuGzckrFPPSz/rbFSFaA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 4 Feb
 2021 21:09:26 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 21:09:26 +0000
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: Andrey Zhizhikin <andrey.z@gmail.com>, hongxu <hongxu.jia@windriver.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
 "Chen, Qi" <qi.chen@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Ross Burton <ross@burtonini.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
 <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
 <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com>
Date: Thu, 4 Feb 2021 16:09:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 21:09:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56270248-6ebd-4b84-8656-08d8c951274d
X-MS-TrafficTypeDiagnostic: SA0PR11MB4685:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4685B4EB47924BA8A28F61BB80B39@SA0PR11MB4685.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8LX6Z3n6f0Cci4QEELIDRT0L5vAss26XwPA1awUno59QmTg8cP3UGGK7ywC36HdXa86euUHQb8f5ohuiySoAYdKxxZC3S526BnEAb0yRg5NzJ6ODLCsv3VayLFy63R4l2CarKGRJhDCjIN8n6BEltVzMvWbQ7G+cwKAHtAMAchel3+/cTfnQ6txiueOTIlu7xzUi56+4YUkEgump/YpDk3BWGkEo2Fs3vQ4IMOVSa6ALaWboCeggL8OpuT3yIA4s0akAbfXXMYbIbILHqpes91M47qKc68uuTUjo5PND1ozJWRJkEnRD/2f87H7nEaUOF/tzQOyaztvPtw9QvMOLoAZzxZzvotznPhHsBPNLinmlcHDV5ZL0Slcb2JIEiv7ehdvHjTMbQaZZJ+pKYlfVWB7v05AMlQLDwOZw/+ElTp5cYGPk2ZbR7lVO/7mO4dXLBeOxDeW5nMlQwrRuvwg/MASwL54PL56+EG2M9LELHa81Du1KJFNB4s+x/2t1d+1w4o1qovc3KfCiaG0Fkac+dIa1OcHsNocv3KMWenaY7Taio89Prd9YtbFw8jYICxJsbPHlfnosxeW7BaXsmiiPHvA34hyNBZmDRbI5jERJqdGb+2G8nkw4CUhc95NJW6IBFg1SWcezWGlF/Bh6/bCRp7ogGb7qtWV/e56bC9epo4Rkz2lvfGm9VF3dNPFdyWO3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(8676002)(5660300002)(4744005)(6636002)(54906003)(66476007)(8936002)(16576012)(66556008)(31686004)(53546011)(966005)(31696002)(478600001)(86362001)(66946007)(110136005)(83380400001)(316002)(186003)(956004)(26005)(4326008)(2616005)(52116002)(16526019)(36756003)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bE01dGVaZDByeGlMVHFpNzdiVWpNN1A5NHk4NmFYdExIN3NRMmJpOWgxcjhY?=
 =?utf-8?B?OVVFU3JTSjVsYjkycTNRWUxxNmRRK05UOWMvd3hqNGI3ejFoZ0tJRm9wQnA3?=
 =?utf-8?B?enpyUC9Mc3hxeDZOMDgrN0xsZ3YwT0hUenZ1dFZyOW90SlpmWjBmd0Mva2xJ?=
 =?utf-8?B?WHI1NE5JR3BZT2kyd1ZoZkdCY1VjOS83b0ZmVWdCOXQyNllZZ2dJRHpVa3BO?=
 =?utf-8?B?N295YWZFRyt6dS9sZko4QmsyRGZjYzlFK2lHNTI3Yi91ZTV1aHltTWwvb0k0?=
 =?utf-8?B?ei84R1hoY1d4ZlV0WVVGK3dvTlZldTJuVVJtc0xwaGRib3UyY0FMYTcyWEJy?=
 =?utf-8?B?eTNKZXlxd2ppaDBvVWpYVkJiUFFBWU1pMkptWXY2SUR1aHpYaGVuM25ZaWN3?=
 =?utf-8?B?Smpqemd2SXBlRGVvSUQ5dDJDTTJvemJ0RlBoT3RNT1hPWnh6KzUrQmF2MXZX?=
 =?utf-8?B?YVpINjdtN2d3TlBZZ1FOdDRjVXFzTTdFdytHc0M0aGdSZWE3eDFxakV5WWQv?=
 =?utf-8?B?Q0pmWjVNdlJmSjNlSFU4UzgyNldUL3ZMOC9vaytKQmp2RUlDTUxmUUQzQ0x6?=
 =?utf-8?B?Mm1JTHpJT3BManQ3TVpOMmNZeUxQMlRpZkszRUFvUDBwYnpSbjBINW4wUmVP?=
 =?utf-8?B?OTJxYXZnWFBwMlB6cmdwOVE0VjN1ZWNDazhhSWZqQ255YWVGSGh5REo3bERH?=
 =?utf-8?B?SjQ2RzE4QVMwT04zSERneDBnV2s2dFdJNFkyK2lNTjlFMXdOTTVwSWpkdkJp?=
 =?utf-8?B?K1I2U3hNeVAyRDBhRE45VDhDZFJmYitNMlVGajYzSTZmZGM5N1pJbUVkajlL?=
 =?utf-8?B?VDJBbzdEUFVlNzBTajN4dXp0WG1ZYU9yWDcrVjFPa2xLVjNwanhWcmpCejlU?=
 =?utf-8?B?ck96RUtBSkFZeC9CNkFYWjY3Qkw2czllcTE5SzIzU3pvQVJPdDlneDhRd1ZS?=
 =?utf-8?B?Q1F5ZlNkNTRtV2ZZbjVPZkJxK1JmUmFaMW5WZjJBRzJCaVo5OHY4TXNTNG1Z?=
 =?utf-8?B?WFpXUnRDc1kzR1dWVXR6V0JpRmp1SkNlUENRSEtwYTVYYWQ3UGNFeXlPeklV?=
 =?utf-8?B?UFpLK0dlOFRXSFdSZDVtbHIxc3ZqNkxENDAvaUJJODltZkpodzZZUVBvNmc1?=
 =?utf-8?B?WUw1WHdJUng0M29QVGcvUk4zVTE2VVZmVU41d2Uya2RJd1R6N1NTOU9OdVMz?=
 =?utf-8?B?MEdCU3F3blBFaVBUQUxiNjdYMllQSUlWYXpVLzRwcG5ncWxTVkFuTCtPNHJu?=
 =?utf-8?B?d2poRTlzUkNFQ0w5bWNVTW9VenBCc3kvS3MrZ3cyMkIxcW9XSFd5Z1UvKzhV?=
 =?utf-8?B?bmlMSFZEQnUyR0luVUFodmx2NWhVN3ptWnROZXFRSW56MEp6dGtvUjhZd2pn?=
 =?utf-8?B?TDAzZ3FzYWFYMC9aYVBnR0JPMXpJcC9hMlMxQzkxbHIzWk9NYlpwMkRvNmN0?=
 =?utf-8?B?ME91Z2c5U1I0UVpYM0xLVlpsTnllSnVoaFBlREpUUXJ5S3pmand2MnZoMXQz?=
 =?utf-8?B?YzBXcUxPWkJySDFaNDJuRVpMNU0xc1JRUjFrSGdyVGhxa0x6a1lpcXUwSXB3?=
 =?utf-8?B?MjVyd3hMMXg3TmlzbGlSeE5zUWhERHB2cnZvUjFLaEIrRzh5ZDVRWnl6aE5F?=
 =?utf-8?B?L3psQmprbzdwNTB3Rm1VdW9LbjVHTC8yTTNnbVpwRHZQaDJtU0dqMWxxMFBE?=
 =?utf-8?B?K01CZTg5YkxrQzBzWUdOZ1hiVXBvUUVzM3BFdDZSM3IvcHVYWG8yaEZrRkFr?=
 =?utf-8?Q?xcVG3k6jbQ0kNzswa9VWrupXN62RTytvYhcUsjs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56270248-6ebd-4b84-8656-08d8c951274d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 21:09:26.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANTUzYJcqIQ3jR9WLboCThxQgRWOT5sjLpv51Q22dG84jkPr02bx096jqxbTWEdeHiqWKnXB3zRVl5yCkrlH/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Andrey,

i am working on this now.

since you already submitted iperf3, i'll focus on

libmcrypt.

i'll test and build both of them once i figure out libmcrypt.


On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
>>> - iperf3 - YiFan
> I just sent a patch for this one:
> https://lists.openembedded.org/g/openembedded-devel/message/89274
>
> YiFan, can you please have a look at it to see if it fits?
>
