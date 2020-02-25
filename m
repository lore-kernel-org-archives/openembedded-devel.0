Return-Path: <Changqing.Li@windriver.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	by mail.openembedded.org (Postfix) with ESMTP id E00E660289
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FpTC+6P7DN+vr0zGBA+OUVjK4NJcWd+7VOPpDnGSIPAbdzMd6oNs//AiNJ3WVp2oYKdU9AyOxsNpA+jCKuk1iXPFpjvbZVjBsT9nZEqmMKmcgLBKA2vFNceE7eFP0ktzeKu9Jqkvy8dZk6bFVQsNsMxveWLtf29fjoDp5cjFggT6NayP6c3yVdobbO+KYI7Ro54U0smGJlCOpZWPqx7NH9GLzZa9E+mxjUJ54/Ei3JpWuWhQ+PLCFqJzC7UvipYz5gRnpEgqMhitB7wtbgeaSEfFqySMLCI7xiCH9Yf8RYqQYuFYFbfu5vj7xb56l9US9mOSgBSObIg59ojbkCifxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=goiNxsIdF8WWf9amnOJSkfugWX7jwjimu3szVSebZVc=;
	b=CLRgq1i2hZ6B0zYkavlYPpZgRb/hA2/BRwKTTN8l0fAD+ZeHAw2afbflSGQNGY3o57aYY48uUhJXQQyPQoe+XzS0mmOvQKrxKlG3NHOjOYOrfsNtAwcKat2hs54xpx8fQJc8GFYfjgTaL3Som6dCZwNI9U62By7/REMb4lySIWvjyk6+6i4nRe/YzRxcB8b4lq5uFJp7pJ0LMHAz2V1nzk7o5Odg4sBq0kisiXTOvnjBtfLXCopv/Tg+ap7fDY2lTeBDlRWz16nZNoGGJqi7wacki0INK7CBQtKvYofHv0jFDzeEAQjdGA+IxSoXr7bwBI1s9gtJ7j26P4FH28Oemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=goiNxsIdF8WWf9amnOJSkfugWX7jwjimu3szVSebZVc=;
	b=AIc06+IALKbanWHbZ8bdjjdgga9ezVHAi5zVz85vM9PBM7hnhincJUEF/u1aviLB+sUSsy5wnZ86dkvCC8hNi0kq3+agm0IG1FxxjCPBID0e9GOVWQwOy0iO8wLYo89DlDZTy8N6MmVqdu9COvG0wY3ZH2rmUlNtV9yL1H1dmts=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
	by CY4PR11MB1751.namprd11.prod.outlook.com (2603:10b6:903:124::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22;
	Tue, 25 Feb 2020 04:45:47 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55]) by
	CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::c5dd:6f6d:56d2:3d55%8]) with mapi id 15.20.2750.021;
	Tue, 25 Feb 2020 04:45:47 +0000
To: openembedded-devel@lists.openembedded.org
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
	<fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <67e005bd-0b2b-af42-aba7-f5a0e8b99879@windriver.com>
Date: Tue, 25 Feb 2020 12:45:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
X-ClientProxiedBy: HK2PR06CA0008.apcprd06.prod.outlook.com
	(2603:1096:202:2e::20) To CY4PR11MB1814.namprd11.prod.outlook.com
	(2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HK2PR06CA0008.apcprd06.prod.outlook.com (2603:1096:202:2e::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18
	via Frontend Transport; Tue, 25 Feb 2020 04:45:46 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f585d819-ff81-4cd1-32aa-08d7b9ad94ce
X-MS-TrafficTypeDiagnostic: CY4PR11MB1751:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1751079F5497CB370977965282ED0@CY4PR11MB1751.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39850400004)(136003)(366004)(396003)(189003)(199004)(478600001)(966005)(86362001)(316002)(52116002)(2906002)(31696002)(31686004)(16576012)(5660300002)(2616005)(44832011)(956004)(66556008)(8936002)(186003)(81166006)(81156014)(66476007)(36756003)(6486002)(6916009)(6706004)(53546011)(26005)(6666004)(8676002)(66946007)(16526019)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1751;
	H:CY4PR11MB1814.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypu/HBvZbWGJVWJeJne+XXBMfU9JYYuJrE1tZo/QUHaVCY7oy1z0U1ey9Fw3vaurjk9tOZR/uUDxm8gtJeqhoxj2A4yhvGs2u2WB2qo/OjCf4iZoVePwhc/+o+Jx3PLR1avFaDhtVMEZPF1J5IpTQytRn1/Dm/qIkpkbI+lFOLOV+clbLsg14E7GmU/xuXXBwSjEAMRsFwECQjlV7wVDFIeDBgZBbVpcC0bfrbEF49AHtderW8rqgcNzUWOfPeXNav0jutbmm26/lIOlR4znYwJkwUmT3G/3z9ukgvE2OjGtEMyYwy/mXB34zaWivw6SqlBGAFDrny4xnEqD+fFrDWtWgh7buwSVKwQ4g5+GeQ+zzHAi6unX2nXg5Ufek2sS5UIg1ScPOPqXOJiGOZBaAnNCNGj9qL0aCoP9jmnMvvep03fvsb4/+ORuF1fpR7NEZFyN7g7pbVfXVN4Mc0Pz9dHMfHg/bE6TOArNngxI+jsKXZWkgmRznMrLR8os7V1y3udd7awpkd+zQf3h0QaYo5ektJKTUnfQoN1n94YGN7OlzgIxR/NrMdCT8hMwvZ5PdbfGF+Cx47J1Th0Nfyo2jIAgU9oH2IE161Y4lqx7lvA=
X-MS-Exchange-AntiSpam-MessageData: Eq3QzhA5MsPiPsacx47Bj9q7TIX/HDHQ0OIL6JFMIoeU6+CRsUo1R+rPXH8OBxzIWGjEroIpe7bSoS1Fk5B02AMftBJGRkJVmSkh9MAI7AaFgNbDPQKHPRSGy9f/CBIVW9qkLJjxcWFoWEOYu6z5Zg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f585d819-ff81-4cd1-32aa-08d7b9ad94ce
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 04:45:47.4765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6qff4rz+ofhxCVZ6dlHcUiqkrMPjF+IV27638kVY/0Iuuzu1yLwxU8Nf1MwCPKGVo2SJGx26Qdj/vISYHFL1dY+xJYKvIY5BIRLZkZblZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1751
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
X-List-Received-Date: Tue, 25 Feb 2020 04:45:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/25/20 11:53 AM, Changqing Li wrote:
>
> On 2/25/20 12:40 AM, Khem Raj wrote:
>> On Mon, Feb 24, 2020 at 3:41 AM <changqing.li@windriver.com> wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> Fix error info:
>>> nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
>>> invalid argument
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   meta-webserver/recipes-httpd/nginx/files/nginx.service | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service 
>>> b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>> index 9a6ca96..65c7752 100644
>>> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>> @@ -7,6 +7,7 @@ Type=forking
>>>   PIDFile=/run/nginx/nginx.pid
>>>   ExecStartPre=@SBINDIR@/nginx -t
>>>   ExecStart=@SBINDIR@/nginx
>>> +ExecStartPost=/bin/sleep 0.1
>> I dont thiink we should be adding sleeps instead try to lock the 
>> dependencies
>> so it happens correctly. or perhaps change the logic in code itself if
>> dependencies
>> can not handle it.
>
> error info: "nginx.service: failed to parse pid from file 
> /run/nginx/nginx.pid: invalid argument" is caused by race condition 
> between
>
> systemd and nginx.  And this error will not caused problem except 
> scary log
>
> This should be a known problem: 
> https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
>
> other distro like ubuntu, fedora, should also have this problem, I can 
> google people report this error on different distro.
>
> ubuntu 16.04 use this as a workaround.

But ubuntu 18.04,  fedora30, centos8 seems still have this error info,  
I just googled it, not test verified on every distro.

maybe other distro select to just let it report this error.

>
>>
>>>   ExecReload=@SBINDIR@/nginx -s reload
>>>   ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>>>   PrivateTmp=true
>>> -- 
>>> 2.7.4
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

