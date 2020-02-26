Return-Path: <Changqing.Li@windriver.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE6B60223
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 01:48:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=R340OlrPTWhqIF2e7tkrHggBzi6GHYW3rHZxO4P/thI9Ncw1ymux0rO4vRBSHcnzI5y5YLFQLV9PV55IJqlGGYyl9hEc1fFx8hIAuu80FlAhJtoUnVAvfL4bzzdBu8nusdC11x2/tujsHFJyK5EcrAtj10iEQf7B8DxTKHu3cN7sTNl13inv1hYfM8r7Bp1aHmQ8bd7ar+JQLBeQ/+p33uvL3itzo4XZct5BbIJr+ZQxTbJMrqs1K5qoF8qFtFC+E07vTY+avdFhKDQkUMdIKiadEx9/xlESUM3D55RiljLlvpAhP4U6q0lG0Bm31lH5bLKef5eZNpxt2ZGsbiWpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nNh4HF+WYAhhAqUM25C9n1rzPKScP4ezYBdG3Ll+SGM=;
	b=bSR9dHpCFIxLLh7ofiIiZCotnuFJhKO8rJaSNmZAQ6PMcm3rU+cXn9Iy28Rw8pRTJEYXgN0Bfu+IUrVrMV2XpJuwkIGMH0wBSeqYy6MPutIxvIk4jOTXBkoOP8CcT4d+jVQfJkQg1AfGPqpEnA/5AD6Qmpz8TcnY7rQC1xmJRplfmPODH21w2pxJDjpe32eB1Nq65HEicvHww6VCr3U37ZnooonCp35Str7BA61NV8vB8zCV8PkhUPR300FM7VyVal5kRKoO3crLYhuA+ltr51v4cuO03clGhuvcYCfnabVZhOex5TYAJ5tTwPtbyJZ4GwUpFC4Aktv83D0/IojzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nNh4HF+WYAhhAqUM25C9n1rzPKScP4ezYBdG3Ll+SGM=;
	b=GBnfF6ExMXimeEqDzh+2BCopz19qUmzF/ulH7jRLKBrV6AmmTwQJxXosj7Wd7hNVFahAbzSPY302YWYkchtV+8remF2f+71klZLU95KbW/QG1rd6PfAFE2nQxeyqMkM0D9oZsGFLOgTZcZF/JllltnoO9avJ1oWEvoBUdqIKcns=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
	by CY4PR11MB1672.namprd11.prod.outlook.com (2603:10b6:910:f::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14;
	Wed, 26 Feb 2020 01:48:15 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55]) by
	CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55%8]) with mapi id 15.20.2750.021;
	Wed, 26 Feb 2020 01:48:15 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
	<fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
	<23aee0bf-a9f4-b002-8277-615dfa603b04@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <2459deea-b48d-a24b-17b7-7965d5b72a02@windriver.com>
Date: Wed, 26 Feb 2020 09:48:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <23aee0bf-a9f4-b002-8277-615dfa603b04@gmail.com>
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
	(2603:1096:203:b0::18) To CY4PR11MB1814.namprd11.prod.outlook.com
	(2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HK0PR03CA0102.apcprd03.prod.outlook.com (2603:1096:203:b0::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14
	via Frontend Transport; Wed, 26 Feb 2020 01:48:14 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c849b7ad-dfbb-43bf-d8a3-08d7ba5df218
X-MS-TrafficTypeDiagnostic: CY4PR11MB1672:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1672C5538251BEC26497AE0582EA0@CY4PR11MB1672.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(346002)(376002)(366004)(136003)(189003)(199004)(81156014)(8936002)(81166006)(52116002)(316002)(4326008)(44832011)(2616005)(956004)(6706004)(5660300002)(6916009)(53546011)(8676002)(16526019)(966005)(31696002)(26005)(2906002)(186003)(6666004)(31686004)(66556008)(66476007)(86362001)(16576012)(478600001)(66946007)(6486002)(36756003)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1672;
	H:CY4PR11MB1814.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZqWjOtRQLjFqEgcwCOx9N7zH5QA0IJmejA9bUf7bl+AB1ubDvfFFW7t7tDeZ0CpsbzSnTKvwPKcEVxZIwUb3Vd74/Te/DMaiASHFo1daWuQR+5YxVTNE7piJC8i8r0Pg3p1sCWrDduKRV2CX8PtNv3Nrd0F7cVXPjyoSWb68z3wAWJ+njWY2ldhx+OVzzlJcdbDFXZlMBMKg1kb+hdGFjnE6SnHkB0Rn3SFAbO4cxhg+MOYG3Drtx5gY3vNGiGBmq1Q1BHniwBgusc2jj2wwP3ZzqbGIJz4kCeY9xArBhbPvY46HHgsofeAYxf4qFHDRlwMaTb8Jop7ke6gfPRR1921pAfuHtd3hM68h5QJt367zhh3cZZUAa7kI8ERCqvIsZ6mTFNmF/2KHv4bThqffCQLXfFh2h465T0WDZ7++iW/sonIQE0Il2ay9cmGIOtdjX7o4IpO0PPElSpskiO+oWj494rHXWufmAtdFDDJ3aWN4QXmfwZQbLvTHj/CT8godnW3ANOoUgzu7IdI4JpakhQ+MgY7XBktIpxd3Uktlc+zN7fNqaGcQTARQhCAdTcO6F8SJD+yNdN4ZFBki50ZPzlJYhXzVK32IsGucIRnikk=
X-MS-Exchange-AntiSpam-MessageData: U5Xbtq+2VpqThzEUH7RJqVRBhSAdRJydVQbyikMRzK7U1+X+AXcYVZUlmn1+rWeRoXwOowRmFZgzK8M9OsNMimaM+IcdHZjJbESyEVamTT+iWyS/l1d7llT5kpIk+32tejuQeZSrmSC8zfApI9Thtw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c849b7ad-dfbb-43bf-d8a3-08d7ba5df218
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 01:48:15.4783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qpHDFrgTMU9NKzuvTxZ57Nk1Zp1soqdMZiC0lAJ4z0vluoCw78IdX3fIBoNTrlKrBKkp5h7rjxWn9R1KqUYu4VbWeShB+Rs90U93S1B9iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1672
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx.service: sleep 0.1 after nginx start
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
X-List-Received-Date: Wed, 26 Feb 2020 01:48:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/25/20 12:49 PM, Khem Raj wrote:
>
>
> On 2/24/20 7:53 PM, Changqing Li wrote:
>>
>> On 2/25/20 12:40 AM, Khem Raj wrote:
>>> On Mon, Feb 24, 2020 at 3:41 AM<changqing.li@windriver.com>  wrote:
>>>> From: Changqing Li<changqing.li@windriver.com>
>>>>
>>>> Fix error info:
>>>> nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
>>>> invalid argument
>>>>
>>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>>> ---
>>>>   meta-webserver/recipes-httpd/nginx/files/nginx.service | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service 
>>>> b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>> index 9a6ca96..65c7752 100644
>>>> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>> @@ -7,6 +7,7 @@ Type=forking
>>>>   PIDFile=/run/nginx/nginx.pid
>>>>   ExecStartPre=@SBINDIR@/nginx -t
>>>>   ExecStart=@SBINDIR@/nginx
>>>> +ExecStartPost=/bin/sleep 0.1
>>> I dont thiink we should be adding sleeps instead try to lock the 
>>> dependencies
>>> so it happens correctly. or perhaps change the logic in code itself if
>>> dependencies
>>> can not handle it.
>>
>> error info: "nginx.service: failed to parse pid from file 
>> /run/nginx/nginx.pid: invalid argument" is caused by race condition 
>> between
>>
>> systemd and nginx.  And this error will not caused problem except 
>> scary log
>>
>> This should be a known problem: 
>> https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
>>
>> other distro like ubuntu, fedora, should also have this problem, I 
>> can google people report this error on different distro.
>
> I do not question the problem but the solution, there have been 
> different solutions posted to ml e.g.
>
> https://mailman.nginx.org/pipermail/nginx-devel/2016-February/007961.html
>
> or ubuntu fix
>
> https://github.com/aroth-arsoft/pkg-nginx/blob/master/debian/patches/nginx-fix-pidfile.patch 
>
>
> perhaps you should try one of these patches

Hi, Khem

I found that both V1 and V2 are on master-next now,  please remember to 
drop the V1 when merge to master, thanks.

>
>>
>> ubuntu 16.04 use this as a workaround.
>>
>>>>   ExecReload=@SBINDIR@/nginx -s reload
>>>>   ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>>>>   PrivateTmp=true
>>>> -- 
>>>> 2.7.4
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

