Return-Path: <Changqing.Li@windriver.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
	by mail.openembedded.org (Postfix) with ESMTP id 1763960B68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 03:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GXeKVySSjWFGto7YbdpcBR2ZBOSSM1cyHokH2JTb/PM0N2Mc32dLXqbPaH0Ct8bwm4FhXGw4HhIv3DCIEmJvEQ+y2+YiqmWetvwx0G/mf8fn3TpvYtcWG8o5nlzNfLQEp/QkpAUGYPX/vg/m6nve3oxG8XQV8VV9hsBcphr7/tndMrjys7iywo9D59xuOytcRDbZ2myfg29S0LwF0eeVbf7HIr5C5tcN3cPCiTnnd8/VuSxKkTbUV1FeaZGJWJJUuU6dOLrkw6fhDAWYozgAvARzo4YUZtT6xWBZSbXV269P/+fquP43SitBXJhM2b+n5DFUd2Y1uXfPOPSuSURVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wFFZgEp78MSk8m4RkQUkm95J/u54XUOmRGQL73xF11I=;
	b=nkaPJ4g6Opag9wRjeJ3C2utoTROQ5b+2wSvdhP3NRk295ZM+mPlmeiem23KBw1fMsTP+u+1vTdxB1PewFJlCewj8gMpWTzJgmp3P5v7MYjjvNq7W67+jKXfiapjVsSLqw2lxEqQBFUSnP9xckzWThWxGAqoBVQWjNuz7Jt3tu1fJgoUcn+eKjIstPtIDt102M9432FwSejw+A9/I11IwY8b57hoaS+l4IRLSZOqOPbnd73JsH3121PrGGlzO+C5dF8CGjcqdU1hbdz5x9S3zwrya4YxNMzHtJr8+/NYTAkK3rZmW4vrRFpEXsRpI+tMCe7yPFrYZXQ4jnhHdoCccDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wFFZgEp78MSk8m4RkQUkm95J/u54XUOmRGQL73xF11I=;
	b=QovFBtD6HNvHDdDBuYFZK3emjtusxKC4DZ9FS6QV5VWazg2F9slZdtd00PNZySnQfa6wZSKip9x+kFN+i2m1MpXnTU1nTYIPN0JhxkyE0F/K0yazqvmu7889Zo1T1bWAMd1mfvf3UGDrRPhhMW7MxDWNcra8uKw6GDQ3g1snMkA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
	by CY4PR11MB1701.namprd11.prod.outlook.com (2603:10b6:903:22::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22;
	Tue, 25 Feb 2020 03:53:26 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55]) by
	CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55%8]) with mapi id 15.20.2750.021;
	Tue, 25 Feb 2020 03:53:26 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
Date: Tue, 25 Feb 2020 11:53:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
X-ClientProxiedBy: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
	(2603:10b6:b01:14::27) To CY4PR11MB1814.namprd11.prod.outlook.com
	(2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18
	via Frontend Transport; Tue, 25 Feb 2020 03:53:25 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1312691-dec1-47f4-8ce5-08d7b9a6449d
X-MS-TrafficTypeDiagnostic: CY4PR11MB1701:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1701CC7BE575234A9A7EAB8482ED0@CY4PR11MB1701.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(136003)(376002)(366004)(39850400004)(396003)(199004)(189003)(31696002)(966005)(5660300002)(16576012)(36756003)(478600001)(86362001)(2906002)(316002)(53546011)(31686004)(26005)(16526019)(8936002)(186003)(8676002)(81156014)(6486002)(66476007)(66946007)(44832011)(2616005)(66556008)(33964004)(6666004)(81166006)(52116002)(6706004)(6916009)(956004)(4326008)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1701;
	H:CY4PR11MB1814.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41xImWJOhu1nzefLrqPUF3mR/RNOyTBHKfAuA5UFvZw6nZXqRVnvx0/xoP7bePbiel2wJSnK/9v/8FRpQlZs7jcLJy34tv/Ub18PRcMW8KHJZwS83vHkf4TCR///4aPcDrhPx3lh5taLf3Amt7mWsX/xz6ro1lVWDQlE9YO+e/Y1jqNGEnPcoUVbSIIC5sOqTrsEGkvnz1G29wafrdGnfZ6fKCvfecLbrfg97GbWvBbFTKz/Pam2Mb1Dx8QW8pQ0b/cHPrDDFLFrFIxjYSzvAumZSX+dJzInbfUbbn1JQkIGSB0qe16Cq7wdTHQ/bdAKHvBR+jdyu5Kn1l4YONe0PtkJQAY4uMHTwvMRrgHcJNTK51rynvSVJSKUwjcroA95MwiaOv8DCDyCjZlXGI9qXeBUDFnh2wDvzvQOS/Z1qncuKUrUGtyFt6nGQmCdnQftmv83763i+pFbQEWukWUvwDRKKLPexJjGnbdqjhXTF6RAW6lUK9f+3REP6vCu54EybhLMJ4MXXIvRb7L/k8ahUNjNEAcYqao0WnjalqCkaEirCUde9qY6gPbbKtkr8CsYmyJVT9Ptws/VreNEufsNCPVOFsq163JQjUS2eHt15YE=
X-MS-Exchange-AntiSpam-MessageData: lryKdMxZR2O7JmzodXfmMIuUa5HV8qUbbIKlOU0gpBOQYLvsShz18CuVqWZ1QTukkT1w/GmoZoV9BefQarX/eIzOC++sy/AydGVnRpOS5jY+JS8X6dTdCMKZ9/06/q0hDlxIYboyy4weEfBdX1uuYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1312691-dec1-47f4-8ce5-08d7b9a6449d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 03:53:26.7138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM2SBADBr2TvCm+eF15mjy1hBFKODwGJ5xwJp96/SY2NweAxuTy8deruBb0xVIORMeMWrIFtyzaha9pnyHkI+K7NP+PtkgzcWVtciOsc8ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1701
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 25 Feb 2020 03:53:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/25/20 12:40 AM, Khem Raj wrote:
> On Mon, Feb 24, 2020 at 3:41 AM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Fix error info:
>> nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
>> invalid argument
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-webserver/recipes-httpd/nginx/files/nginx.service | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>> index 9a6ca96..65c7752 100644
>> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
>> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>> @@ -7,6 +7,7 @@ Type=forking
>>   PIDFile=/run/nginx/nginx.pid
>>   ExecStartPre=@SBINDIR@/nginx -t
>>   ExecStart=@SBINDIR@/nginx
>> +ExecStartPost=/bin/sleep 0.1
> I dont thiink we should be adding sleeps instead try to lock the dependencies
> so it happens correctly. or perhaps change the logic in code itself if
> dependencies
> can not handle it.

error info: "nginx.service: failed to parse pid from file 
/run/nginx/nginx.pid: invalid argument" is caused by race condition between

systemd and nginx.  And this error will not caused problem except scary log

This should be a known problem: 
https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864

other distro like ubuntu, fedora, should also have this problem, I can 
google people report this error on different distro.

ubuntu 16.04 use this as a workaround.

>
>>   ExecReload=@SBINDIR@/nginx -s reload
>>   ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>>   PrivateTmp=true
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

