Return-Path: <Changqing.Li@windriver.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	by mail.openembedded.org (Postfix) with ESMTP id 91B7360B69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 06:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=id8GKrdFWT/150Rr9Jc8e2QXnra/61Djl0TMYbp55GQ6EiAkA1INfPSztQUG3OOOz5fTFzrCd42P7hKDq/s1E+5fmPAIHGy+/6ZOzaBy1r6dxYX5F2Z5K9KkImEhDAz1M+r0vd2CV3lR7O+eYZfdaipGJ9/W2I7gqxd5V0FfgU+b6+j33lzJ/+oFeQLF0uANbXY0E3QEqVpyCL+t78m/uQ8ib482Ow7/l2E7f9T/YY+pCakKawqGvJsn7gvcW102IXCxiTccbrRSlG+w86UpRus3G1XEvDFq+LoBV5Day5J8fA/V1ze81Wn/08obpWdGOia5rSu+Ba6P0pdi23ks8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qnpOC59xXoNWzmVmfCIQPSJFCJ+CuIgcNzGP8y2p4f8=;
	b=T9AZ1QFz/LmCprW3PXFC0qrRhIfLMHn3sVbbg4YsNXIIXMlGr78GEwpHDyAi+WlAwrP8MUe3xcKYP+aCMZ9Iek+scsLt+deXjpuPBJmXhG5dmWvLwfVYzGL+oKnhlhuJ9ytKwPhC9QnkL52O3ZkX1DehzUBbIJ7f4TCHg2ZD72xS46F92Nb4SqO/pV3oQzv5N0cw7SiWg8uM/Xhut7HQQinjwNg+nm9AAySZ9dCiIouWKW3gCu7CQUEE20W/heu+XdlT3z/Awkozwk0+kFfl48nyvwwr1tXx335oY8N3MeSl6/jSFSZDFrW9WO9qWntc0EJLxs6QM6+zMSXDqFXwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qnpOC59xXoNWzmVmfCIQPSJFCJ+CuIgcNzGP8y2p4f8=;
	b=RjxpxkHRQWgqEh7aTi5lP1idZCzs+58IsJApfzE+FYUkixUEYcXUM7pkhd8emgu/6giCIAH0Sbgl9cOHh4v8QVsEe1xgbICRPKX2EGHmE9HhuJW4usY/q2oF4vVz52OfPlM8tTexys8q+zoXdU1/8FrCtkwpaL9zE8Wa+5ayRbg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
	by SN6PR11MB3085.namprd11.prod.outlook.com (2603:10b6:805:da::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16;
	Wed, 11 Mar 2020 06:39:24 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
	([fe80::ecac:629d:9a5a:4d10]) by
	SN6PR11MB2557.namprd11.prod.outlook.com
	([fe80::ecac:629d:9a5a:4d10%7]) with mapi id 15.20.2793.013;
	Wed, 11 Mar 2020 06:39:23 +0000
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
	<CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <c519184e-2e78-36fd-2f9a-1b97ebfcb2f1@windriver.com>
Date: Wed, 11 Mar 2020 14:39:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
	(2603:1096:203:d0::12) To SN6PR11MB2557.namprd11.prod.outlook.com
	(2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15
	via Frontend Transport; Wed, 11 Mar 2020 06:39:22 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d729387-470c-4e35-2f7f-08d7c586efd6
X-MS-TrafficTypeDiagnostic: SN6PR11MB3085:
X-Microsoft-Antispam-PRVS: <SN6PR11MB30854DE02F9F7612E8B00BDE82FC0@SN6PR11MB3085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(136003)(376002)(366004)(396003)(346002)(199004)(44832011)(6706004)(956004)(2616005)(2906002)(31696002)(6666004)(66946007)(86362001)(16526019)(4326008)(5660300002)(478600001)(6486002)(36756003)(52116002)(316002)(81156014)(31686004)(81166006)(8936002)(8676002)(966005)(66556008)(26005)(53546011)(66476007)(16576012)(110136005)(186003)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR11MB3085;
	H:SN6PR11MB2557.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rpiU4Y4DTuZ8a1rATF+Mkb9LU4jSoGjMqy56rz8q+C1CqtZCURKnVo9yIkZPCYl2ix0+FoMf99nRpz4FkmN5ImNsqB6EoAQDSIUX47YfRoRyo0W8TArjzN5+RycNylT4YGz/TFKX9qv6MhdYLBFjcTm86u3S6jdRQuAcrhq5y+z6Kqa3ZlWJxFOYkKHGmqbmN5SBHb184Tz8X8Xcwvz/s4YZAFw1PHfCCpsyLcjHm0KV1QewEqaI41VIXOgtb3OonIcQsFdl5yDozZGrARXIVp9DASgkJ6qtNSoUr+47gjbpIX5xE/w/LmswXBIaYGHbWt9vTWunoysw/Etzkhiw+ex3Yc4IiS5NlA9TeITZrZvR4KjeloqcVYJSx3dG10SX16HQ1HYBGY/uyO7vJA4RX9bw7ttkkF135u7LMa0tEOEwhhI3RRSE/o18GrrjsN+eudzo6AjvvqjEsPuchfYfov+AnENHkvrP+wHoUWQP2tSga5Pxakw6sEf9yEoU1go8n1+jQjvd7hQaopY/eL7U+revPpDAbAqM9YnrcNxwggZFqc4F98cvyHok3fUzrWTrJH2laxWNpFXUHQhp1CO5zrn6Rt7MtuADo/4o4dA2TtV/avxjxU682aNA43l8CQGM
X-MS-Exchange-AntiSpam-MessageData: 6CpTm7mBpAQ38dbyiiX2yedtmhYhVWGrLKaYMmY4nnA9+QABSJ6ctmVs1Jn/ht7zrX5SZAX/r1kPJhNOhphXTRWm+yIxx1tlH5zWoFDuGciOJn8p0s3GE7fiyWWRD5G54jKHCaTA7topt/YJ9qP2ww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d729387-470c-4e35-2f7f-08d7c586efd6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 06:39:23.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPxbTmbzAFDvEm2MdNQ1XZYPOVIK3Io77zR/NWWLx7W31UytXp/+bzx4hBrcGrYDhVQFnawFlXBD5DkVF+udNUCwfyul/QS/4AfGjWZl1CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3085
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
X-List-Received-Date: Wed, 11 Mar 2020 06:39:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/7/20 12:12 AM, Khem Raj wrote:
> On Thu, Mar 5, 2020 at 11:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>> Can we fix mozjs instead?
> perhaps thats better fix, maybe it can made optional via packageconfig ?
> or marked incompatible if meta-python is not included

Hi,  Khem

There are 2 solutions for the problem, Which do you think is better?


1.  fix this by using BBFILES_DYNAMIC, add a folder dynamic-layers under 
meta-oe,

and move those recipes that depend on meta-python under the 
dynamic-layers.  and add

these bbfiles by BBFILES_DYNAMIC.   but these will need to move many 
recipes from

original folder to folder dynamic-layers,   do you think this change is 
acceptable?

git diff conf/layer.conf

+# only activates content when identified layers are present,
+# to ensure yocto compatibility check pass
+BBFILES_DYNAMIC += 
"meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+"

2. move those python recipes from meta-python under meta-oe

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

