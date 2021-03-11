Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.54])
 by mx.groups.io with SMTP id smtpd.web11.134.1615424174020458352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 16:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eX5LVhY9;
 spf=pass (domain: windriver.com, ip: 40.107.244.54, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsLzQS1qjusc7Bi7gHXErb4ttn/12po/UYV+25uxgurn22w2R9O/2IGjcYzyfcXUuNo4OH6rgiq57OvXHex0qMoe3tldD/w+5mE2yKKGW1uIBVDJDNFFw2Oe3UNnSIOd5wcPbKeZDy533hgQdqlYDDvBVtFTMqIzeJSKRoRwhG/p4NbLsuxGcs1xaGMoCp6WdZMgXcOxlAUYLXRpNBKRQtfAXmGz3ImYo/sdNlLV+gNr4RHpjVw/yaM8t/YMoz9oiii7bjkX47F3a2t7gR7pLP/eOMAsWFPiaRthcAlKM6ph24AK9IPolXSRFTDbj6Q3g07udNb/kP25IEUK4OVzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1O8C6FTDdYL5U4hKCtyxlysr1r0ecSZV5Jvwk01NKQ=;
 b=f8Gp56tN1CFRY1scAkJbm5O33SjjMkyp0Mqg3WLjA4L8K0jSFddz1vtRcZSMrlPR7/m3Dvr6ABYxE+AGVygCk6FpfHKPJYeshgKCtYWxTRyRHpiDLmsKhgzu6HkN3rkwZvDTfCdYMuA45IBQkaxeFqw0AfGPU1G9J+5jp6rRtAmVXyf7mN8cdVxUot4zwQxx+8WnAwr3tJ6ppaT1Irw4N0wgA7h2S5Jpt0a9Uqy1KdEovj3Z4sZRvvKHDwcq04zfMh5qk1lZqPnYrwKh4iKkbNQNG2T34aHlsaJB7cW4hXpSxu2GV1KCWJVR+Q0YLozWtnyCOmXgZ1li3z4Il16R3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1O8C6FTDdYL5U4hKCtyxlysr1r0ecSZV5Jvwk01NKQ=;
 b=eX5LVhY9urD4sx+OtlHMIjCdfD9KE6fY5MjqlDdhbfLwniDa+2CyGRHrIOwOISvIzVd6P8yxCjUo4oVFaxGkQU2v4L3OvRT+/Zv+14LuZ2sFUz1JwVY1Vp2A6KtgdAx6rNXvTeeh21wBg2bogMUSaqoEipXeoNs7jRZBQG90qNU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Thu, 11 Mar
 2021 00:56:12 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c066:ab51:9569:4e1e]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c066:ab51:9569:4e1e%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 00:56:12 +0000
Subject: Re: [oe] [meta-oe][PATCH] php: update RDEPENDS
To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210310005331.23711-1-changqing.li@windriver.com>
 <DB6PR0102MB2630AB1E1DED39FD81AF91B788919@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <8fef9df5-61d6-429b-a261-1fa7958d2b1f@windriver.com>
Date: Thu, 11 Mar 2021 08:56:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <DB6PR0102MB2630AB1E1DED39FD81AF91B788919@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BYAPR06CA0072.namprd06.prod.outlook.com (2603:10b6:a03:14b::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:56:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4b3e676-7618-4c50-21b7-08d8e42876e4
X-MS-TrafficTypeDiagnostic: SA2PR11MB4875:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4875102C9BCFADD923B8439E82909@SA2PR11MB4875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZQSjZV11XGE6+nNnBS2v6SOtptXkbB2Iy+dbafGjsafVLlSEBqy3RyuAVobyiS2ApO3otLDD5A+3IezG1v7SytcJkObEdbpcKQ6cQdx5ct+8Z+yGhdv5B1xolFjVxaukfb6Z0ZaithpO7SJP2USnMddkvYq+HqFXmwN/Y9TN8NnrcNIzB2fFJg9qpjEPyVLbn4L0YbQ3THHBcVsr+l8l07TO6mEvINuEQ3N291CdSx3J2UtuUo4G1ilCZOWE9Tbmy4FLAJbPEVbyb5AUheHz82TRIDsr1u90rYunMIbCwsOunm2MQMCMeHGorQqcBLqBvOY7FjafWG7dk9fGJhh5qyI5l9QQa097qxatewCdUgOP5de7+048nJEkMLZWIlUDS2Suav4Sf2uFkgfth39h40IqA8g9z6ZsFezU1mo/EE15991GO4GKAoWwSkohZgzdq4M81K9mJNjwnTbVJsTASsyaWp0g8XGFIyriR2Cmj1D49tX8tM3xSgqsXTJZa8Pc8DjRULSzcKPxbxhKSaOqMCAIK2T7huYEeRKcQu8q3kaEgmNxziOHUerp14dgfWZiUEbyS8jlNSk3eShnebcjH2mHs/49u5T/0I+dasnqCqLh56/4X8CMqGy4l3udIVGK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(26005)(36756003)(6486002)(53546011)(6666004)(31686004)(66476007)(8936002)(5660300002)(31696002)(44832011)(86362001)(15650500001)(66946007)(66556008)(52116002)(6706004)(110136005)(478600001)(316002)(16576012)(8676002)(956004)(2616005)(16526019)(83380400001)(2906002)(186003)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pdQ4Fb6N6SJX0yBVtwLiKlvFGvYCAX7eB6kZx5wMzIIaBoTLDqSxIu6bSqlWyuYZoE5giPbwAslYX7O3d3tikh+L8+nnWP3JnFLijwKso3DYJfjBkacr0I1R3bzmfwEvXifGDsjsx+XghiE0lqpEbCoxkzfc9xyMkuVJ44r4alNmZMm4TA3ff5RwyXY16S134pQRHShoAJGyIxQs20CXR08E1ML36JM0kaHB5RxDwKqvIex2S5YHWY9cTMfLBruLZBnlWVR/n1pyRSe/kx9rQTptpNEGNVdfDYkELVwu6B0LKsTZEqwiUJu0qU469FwVKhjr4l16qnzdHjka0X6lwdJ/D3EN0GVjmGhKKsIo3Xb0OwYGO3NYzsKuuRpF681W8OLH2kJa1Bpx7a9NShbrpm9sxjkd/qjnEfXJW7YuJlA6jQ7ATc/CQl32u84oGly+Jz/TFJ1uXD+9s+28waClq0d7Mes4xlb+MXvNDu//+RZSwadJOu9TpIEnxnr7UiuRicI6CVvpIbx4Ww0hpwdHeqtvy1VnPMcmoYKgIpa00sYLt3Tmu4i3Xluas5Ku09d59GMy5ql29/sZpU2QTOTvR4wTlPhJAJK7Vp6DX91n/iHT5fgK3FaH+JCmAYbBORV3+OTr9T6cF33uQLj0FZv8+YTucCfPUQRuyJf2YSmBitVj9Mz6q18CCF3KwX94L/uqzc+sQJt4qzVrJ28FReo5nG3uPQUyJlzMzZ9PMaVcu92o+gK5w85LaqUZKJ0PuWM0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b3e676-7618-4c50-21b7-08d8e42876e4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:56:12.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNvWhfW0a+wnWCrzG4jlSXcWDVinPjOYZMJr76y07IJxMaE/M+sw9+iZxjRYK0V4uL/cKElQFuBWOB71wfYvaZAPbLnSH4OdGUw+6Jk5pkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/11/21 1:40 AM, Diego Santa Cruz wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Changqing Li via
>> lists.openembedded.org
>> Sent: 10 March 2021 01:54
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH] php: update RDEPENDS
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Since commit c4ffcaa2[php: split out phpdbg into a separate package], package
>> php is empty, remove it from RDEPENDS to avoid error:
>> nothing provides php needed by php-cli-7.4.9-r0.corei7_64
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/php/php_7.4.9.bb | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-
>> devtools/php/php_7.4.9.bb
>> index f8a8755b9..d6df998f3 100644
>> --- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
>> +++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
>> @@ -208,11 +208,8 @@ MODPHP_PACKAGE =
>> "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp  PACKAGES
>> = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2
>> ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-
>> doc ${PN}-opcache ${PN}"
>>
>>   RDEPENDS_${PN} += "libgcc"
>> -RDEPENDS_${PN}-pear = "${PN}"
>>   RDEPENDS_${PN}-phar = "${PN}-cli"
>> -RDEPENDS_${PN}-cli = "${PN}"
>> -RDEPENDS_${PN}-modphp = "${PN} apache2"
>> -RDEPENDS_${PN}-opcache = "${PN}"
>> +RDEPENDS_${PN}-modphp = "apache2"
> I do not think this is the correct fix. In many situations php.ini files from a bbappend will be part of the php package (that is my case and why I did not notice the above problem when I split phpdbg), are common to various SAPIs. I do not know why the current recipe does not install a php.ini file though, I thought it did. Probably the best solution is to just allow php to be an empty package with the following (it will make life easier for bbappends that need to ship a php.ini).
>
> ALLOW_EMPTY_${PN} = "1"
Thanks. I will resend the patch.
>
>>   INITSCRIPT_PACKAGES = "${PN}-fpm"
>>   inherit update-rc.d
>> --
>> 2.17.1
> --
> Diego Santa Cruz, PhD
> Technology Architect
> spinetix.com
>
>
