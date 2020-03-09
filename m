Return-Path: <Changqing.Li@windriver.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	by mail.openembedded.org (Postfix) with ESMTP id 00A1B60FFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 03:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LulQ5qmbMb90gjArC/p0XmCuqfbYsphCPqwPNEI7eTtVF/mM/dUhF4664n1gHWdcfIR9+MCYUaXoLCZwCg5irYczSMR9NpvzAN1bohs7x8JW2giZESTnVGLSWCxpKIxKw4Lu1OaWszhbrCftBZxpctxMvtXGHz9/Z1uK+6HuKkGAt1xO7zb4uS/LrqP60opqYspA2xP8M/6qX63y0eFjOMCboUDISu7lb6PW+5baAz0N9EN5Gswd88IYvAyd2iVnmgRa7KushieX2o1jxiWQXZSPtOeFyyhjaRv9PDx13zv1IlFCct5qALi7zcgOxcI2WiIZ/g0EbvZbhSDwHLxqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pl5ODwhvqxj8mIcZfmpu3rL2vYpMVhTIa/xbmJ7ivB4=;
	b=kETLIWdqA8y/f91qEKVYrHNVnvWjksPq3HWwmvJ1NidKKqMPBDMcXteF+c0R8uZhtGBU+iwnO4Z8TV4nqyU+R1EbQhie75ijneb7Col9q9nfBkzRIywdgrXh3NgKQAhiNB3VFpXXmMq15+9JCQAqC3OkQhLQQdHti17tRj/IX051S/fFBFuuIfC3/LGe62tmYCVX0HyGvhka51jQRBtT8qjKSijTnuyedrwkpBa4Bd0iTMtAgUWGxXBnzzTYchUykgXNvV6KT1KcID1TA651npe28d+AqB3/AXR3ode66VwbUcEjeTQd/1qXv6UxMVbOqblX4cEvgQsvc72s60WX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pl5ODwhvqxj8mIcZfmpu3rL2vYpMVhTIa/xbmJ7ivB4=;
	b=hawusAjLRpAAR5zUCyXE/uUShjsTJ+LNAFoLX1iTl5KAbHMK39ainWk/3RbxFwJh0TfdLnd7f2Dz5nwCQRhRCwKckjudn6WGMT1trs9crNLjZwiciZy+JYZ5r3kDi1La2Hg0PiH4aCLycmMri6eK9KL1Jnn2BM6lnIri9ueMjso=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
	by CY4PR11MB1317.namprd11.prod.outlook.com (2603:10b6:903:2f::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17;
	Mon, 9 Mar 2020 03:35:44 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::bd9e:73f8:aecc:7a69]) by
	CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::bd9e:73f8:aecc:7a69%11]) with mapi id 15.20.2793.013;
	Mon, 9 Mar 2020 03:35:44 +0000
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
	<CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <d3bba1f6-6c0c-2ad1-2627-e0824a370a4d@windriver.com>
Date: Mon, 9 Mar 2020 11:35:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0127.apcprd02.prod.outlook.com
	(2603:1096:202:16::11) To CY4PR11MB1814.namprd11.prod.outlook.com
	(2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HK2PR02CA0127.apcprd02.prod.outlook.com (2603:1096:202:16::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15
	via Frontend Transport; Mon, 9 Mar 2020 03:35:42 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a126af-cee4-4a4c-57f5-08d7c3daf29f
X-MS-TrafficTypeDiagnostic: CY4PR11MB1317:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1317FAF6491F37F0DB83AF3C82FE0@CY4PR11MB1317.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(366004)(346002)(376002)(39840400004)(189003)(199004)(16526019)(44832011)(186003)(956004)(2616005)(26005)(2906002)(110136005)(316002)(16576012)(66476007)(66556008)(52116002)(478600001)(5660300002)(966005)(53546011)(31686004)(36756003)(6706004)(4326008)(8676002)(6486002)(86362001)(66946007)(81156014)(8936002)(6666004)(81166006)(31696002)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1317;
	H:CY4PR11MB1814.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcJXS0ufD2mcot+nxp7akZ3yxBnHFAOXGOTD8fDTEVatZHlSgaTvZ0JfWCLOKUV+LEgKCdxO+JDQ94YzRIN6mI5gI76h/x3qVpZYJ9fBZUwCS0MdudwY2fKIKEzPF5b669l4jzP+Rd5pbyEI1ktbPeBsqXo2186WXiRv9XzPsPpJ37H10Zv8s3QciW7bla9917NNBpP93+yvvMZUAI1uv3ozCZ7oIbwIAZ7MYcy6MkAK/CbOtZ/Z3/M3s03dCbDfBFk9xwOcWnwXZg4J+oCliURQ+qchU+osY3FW+zC1I4Z7GAAgg7B0dIGXHKH0KTDp3fX0HbyGnIqGyO2wAVxSNtrw15RSgfQ4ij88RLpf0Y05PlX7cf/Sx9v6Pevt/VAAKIAzbkXfh5PO2x3tiiFopNioMJseOzzHfJasPpbXlij0xtp8uI/+I1cMT1/Rzip8mp0FyHWl/U8Ab7gu7pvdlJZGWQpc4VKuQoQiMuNpgtSywNqdq3Zynat62QKagO8rCKxUmixP1r9B3UKG3AwG1EsWibNcJKqIxT8UyW/NvEMUGMCtuqUL/+lgUOsYb7T4Y6tqjVa3VAgUkj7csWa/DUTc7TqvWZsxJ5YsCd35+7fP3NPj7WTvsEBrck0t76AA
X-MS-Exchange-AntiSpam-MessageData: SRtU7uHkKv1yrf3wAv4viXKSd4CN6N0Zf6r/NJTuDhYN/OKicm440fFH8A9HQxvnRSorZZkDqRZCAeAZqeX89qoGF83ZxLUV+Im7YN2X6cS3XzspPoz1h3EPLz9x5ljuMfRMpo6Noeo7qEakwk+GRw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a126af-cee4-4a4c-57f5-08d7c3daf29f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 03:35:43.9319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fY21qJ71MVasIZqavdk5PUl1ZbFYjBr+1cMN49MTrMBjKi8qeMhBkmHI4+EZ3Q9n5DcqHlbZFU27eSMs1zu5s6ApoUjX1k88aF7JFiTNyKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1317
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Mon, 09 Mar 2020 03:35:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/7/20 12:12 AM, Khem Raj wrote:
> On Thu, Mar 5, 2020 at 11:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>> Can we fix mozjs instead?
> perhaps thats better fix, maybe it can made optional via packageconfig ?
> or marked incompatible if meta-python is not included

I find not only mozjs have the problem.  I find that packages depend on 
by mozjs

is deleted by commit 
https://git.openembedded.org/meta-openembedded/commit/?id=505774658338002a92c2e32c4c57c55f36c5e36e, 


which is for drop of python2.  So I tried to move python3 version' 
packages depend by mozjs

back to meta-oe,  but after mozjs's problem is fixed.  other recipes 
still have similar problems,

which depend on other python packages.

>> On Fri, Mar 6, 2020 at 6:38 AM <changqing.li@windriver.com> wrote:
>>
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> yocto-check-layer/test_world failed since error:
>>> ERROR: test_world (common.CommonCheckLayer)
>>> ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
>>> /meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
>>> DEPENDS on or otherwise requires it). Close matches:
>>>    python3-numpy-native
>>>    python3-pycairo-native
>>>    python3-rpm-native
>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>> providers.
>>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>> 'mozjs', 'python3-pytoml-native']
>>>
>>> mozjs depend on recipe under meta-python, but meta-python
>>> isn't in LAYERDEPENDS, so error occurred. Fix by add
>>> it into LAYERDEPENDS.
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   meta-oe/conf/layer.conf | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>>> index c537736..0ce0ad2 100644
>>> --- a/meta-oe/conf/layer.conf
>>> +++ b/meta-oe/conf/layer.conf
>>> @@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
>>>   # cause compatibility issues with other layers
>>>   LAYERVERSION_openembedded-layer = "1"
>>>
>>> -LAYERDEPENDS_openembedded-layer = "core"
>>> +LAYERDEPENDS_openembedded-layer = " \
>>> +    core \
>>> +    meta-python \
>>> +"
>>>
>>>   LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

