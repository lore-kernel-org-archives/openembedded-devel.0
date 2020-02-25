Return-Path: <Changqing.Li@windriver.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4786060B29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=U3HGoRNe+SFg6lA4Z+mbXGZTCgpS0FssNRjgKtMM7/CGZ3tQYSK8rfoJ586SgCh2Wu128zjhiA4caRxWHhzqqGCgOXhJTutOWUj6ymD8pwTtnGgYcxb3ougmzgRKDX3pM+eQ6rBja86b5ZMfWDZdmSJCUvccPxr0zsgcI+SRw/M6RQC8KEfBCcSpx6ayHf4EQYtv+eh2Fx8tZdWLRGS9LMwXqsnkOn58RT3YMHL0PALCcziQM/wqzmWUbDRt1G6/1OYLstNJFVk3yk/rs/QbdGNGpj7QIGM+jSROm1ZygWSFezeiylHX9FRdtYjoIYuZFZMIah42lZwCVBoLBqA8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=R0Wg5PFrOUA9IKBboK6U5Lr5SNYPUUqe2Mfu0V79ndE=;
	b=T4tm+4xV3bUcq1Gh+wD7AU6dbt50i4Dki5UUhQGpGy/TtvvXZhcNj4QtP1/fY9TE/kijBOPSrev59R3K2d0ESedDqUPhIuvHTWMUbTz5Ar9Cde82xRWjExab/RogAmz/fYKC8uyc3l6Cdufy8qcmPwfcAcEuOdIZqr25IOYw97FVv4NiJF6XQHDpP83IJ234JTmTWF2Uu54zMrsD+0tZdet2c48OLVajB8oY4PkWqWLIMTTPmJ6Q/euXge3cL9BOl5mAdqf827HihW/GHdsR8zHDkDZhlEvj64ehVfLblQmR7T3ytcyxemR0JYwL8Q+I9vIDwn3NE3AWmLbQpTlQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=R0Wg5PFrOUA9IKBboK6U5Lr5SNYPUUqe2Mfu0V79ndE=;
	b=Xh0tBECl6QR3IUyFdVCTomblqa3Vi24pdiDYkXPFWkn62Z4hfV8bvjxBvuecte+529z3BjT45NRDWidY38wGq6bwjCrA7Lfk3RwBTNDeOyidDkpwNUroFC4tVz+1n6VRA4PzP6+NAjkHobIs1LMIfgMvEkPv2giR6c/ymgmXcx0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
	by CY4PR11MB1781.namprd11.prod.outlook.com (2603:10b6:903:124::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22;
	Tue, 25 Feb 2020 07:56:58 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55]) by
	CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55%8]) with mapi id 15.20.2750.021;
	Tue, 25 Feb 2020 07:56:57 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
	<fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
	<23aee0bf-a9f4-b002-8277-615dfa603b04@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <d1f9b5d7-bb68-d608-d807-17626b3516a3@windriver.com>
Date: Tue, 25 Feb 2020 15:56:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <23aee0bf-a9f4-b002-8277-615dfa603b04@gmail.com>
X-ClientProxiedBy: HK2P15301CA0018.APCP153.PROD.OUTLOOK.COM
	(2603:1096:202:1::28) To CY4PR11MB1814.namprd11.prod.outlook.com
	(2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HK2P15301CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.5
	via Frontend Transport; Tue, 25 Feb 2020 07:56:56 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8de6cace-735f-4118-6319-08d7b9c849a7
X-MS-TrafficTypeDiagnostic: CY4PR11MB1781:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1781B9FBB3451B662933256E82ED0@CY4PR11MB1781.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(346002)(136003)(376002)(366004)(396003)(199004)(189003)(316002)(16576012)(81166006)(31686004)(66946007)(966005)(5660300002)(6916009)(86362001)(478600001)(6706004)(53546011)(4326008)(81156014)(2906002)(6486002)(8676002)(8936002)(44832011)(956004)(2616005)(31696002)(66476007)(52116002)(6666004)(66556008)(186003)(16526019)(26005)(36756003)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1781;
	H:CY4PR11MB1814.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/igYk7QZpk0yH9Bn20y9Fh9R4fmJ1IPwG3eMp4UGuNmxkNvznakgM01SbIRPcVnoYQNuV8ouaxIkLA+LuzYFz/A/lEz4gh0lkUHUIXErtuEJVInThVVUASrnRiCPE8UGaYOcxpYn/xWCuXNOEHqoWYwjowxTNiz0KVxa2Zt0ShH0EHNDFXk4YvwrR5y13LBHVjS7dcG0dWCbWEBZv3nESKkz2CDHs9SBWy7Mjpgj51UCevKljoGXxb3GS82P8vFst0QzVsVHw9ztXTAdQf4+odYLCtorYG7++81V2J6aTjCF5cVLtfzRSWGi4RBnmKBt121f/tuUi/62Dr4cIt+zMKxkxjuOq+im0U+CzwJrTBpdrpkEn3e4zXf9n4fD+RB62aB0kFDa1A1g62b2b/CdDngFbKo+mkGpgJZo23Bxa7bbcSCGhxm+brAo20dPnrNPZqtfWcumdBWCGvW+dSkQ9ruyOVrImmfQPCRxWDxQ4JOM7NFJ/Q7wf00VG3J4xYZ7+lch/GMs0F9fGZDJVQvg1ykK09cpR37VmGwso5n0u+EXIdOGq2NkUQi5kjnI+NoXHBn1lKqyum10+Cru5RjdEm47ZOMTduvzod5AZYWwgw=
X-MS-Exchange-AntiSpam-MessageData: pQ8HXZn36iBrtbaUzLG6hxAX1M0HrRIIDMajjshqPG26H/kFKyU/kz1pMAVD7FYTTP9fmZ59OnrUbJtL8qgReoYfwMrUvHtBFjp7mS14P/+QZKRBkwCGkIwcFlmlQj8+/DjpTMt9VXkHng9DDX5FYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de6cace-735f-4118-6319-08d7b9c849a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 07:56:57.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyjCMXOs7TGlH1kdViGt+n65cDtjRgJ/oyYpYlPQSYAf+P+vXlz2cLXdei0pArqn7tQ1fccD3OUvMGOHn7uCA3bIvjgu3lWihLM3T1O2nFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1781
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
X-List-Received-Date: Tue, 25 Feb 2020 07:56:58 -0000
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
Thanks.  I send a V2 with this solution.
>
> perhaps you should try one of these patches
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

