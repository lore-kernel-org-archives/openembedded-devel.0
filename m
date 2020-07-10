Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web12.9812.1594384664138653876
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nbeSeVHR;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFX1ClDVZQeeKfjgkwVS/AE2HELjT91IA20QB3T7xT1lpES2Ej+SFuO/VodvU1Dcfjax1lXlr58pBLA4m9ko4KvYeQmix9jgR0DheXDRCYmSuDkDIqm49GffeRtuDwFD4DStRjq34FWRKN6WYv+RYZQsE+xNsUJElKQNoVyf8zf6GVuy9KeoUCQl5/A9D/HKlQD7sJV96I24yi4/AOU2vaYak/1ccMdYNJ3ciBvW0CGlnq69kZuolUQGP1cfDv+o4+QeAtIA5Q+MWtjN7rPvs9ZVAI3hvL4iVqf9rOTYnNwoaziOSm1/sfajP9tKTH4XYNHc1dMa26isN0n6U7Y9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikyXIePxWa2u9IpVerIXjhj5WlPz3bLUdtGa+jHDNAM=;
 b=VQVqBo30ZuTzRmsi6TFValisdfImkENF1ilwkeglov2KYtQpKD2o9sdoLbQ8NLji4JEkZ4rFCpotBxP4bEbi/YgfrUvJRWdpWfSUTgV1v11wRppu/RuwaOsvUYcDCXoFO8LjjmrgDdru/wtGkI8kZj97rMV1saQzZNVRoY/Y+tkrxEDGQR+U6ys+Z+ztIgt+orIqREMmiEqK0WQGBOjMISD3gcD7MGno9vkptIMM8HMRz14nckDZp9KBnJwjSldVlIq2CLuEofctKtLGAPEq/DuTWsylf8ZkrvsxT+okRknhan+jjXRYAo/3Cue8s9lQExwgYHMLxdNg2e6GtQSesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikyXIePxWa2u9IpVerIXjhj5WlPz3bLUdtGa+jHDNAM=;
 b=nbeSeVHR4weSJNmGU44rYNAM/2d6IXOoQ/APnXs1edKvWQU2dB1RhBdbZWeyb4sLHomwPjMr5V5wfNLHuOuV0LuCn1rIjz9+ltycTiOedrPKb4SRWWGGSRDQaQZU/c4shwn09qWj/faqh/Kh7XeqfAhTRTo/gk+Zk0dPXwV9fJg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 10 Jul 2020 12:37:43 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:37:43 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-luma-oled: Upgrade 3.4.0 -> 3.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
 <20200708094659.27331-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bb10579a-6f19-346b-615d-3ed4a6ad3d04@windriver.com>
Date: Fri, 10 Jul 2020 08:37:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 12:37:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6c9c0d6-2836-41b5-a938-08d824ce0a8e
X-MS-TrafficTypeDiagnostic: DM6PR11MB4516:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45166F478B8D0892B3E0FD859F650@DM6PR11MB4516.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PJRXQplzP3uzDF7ZPww7/Yn7z5u/cXBK9GGqCrKvTLzl2Pj0nwgpWmclsMPBlwx42BuZiG3W/ZlE/B7tYVjKiVtXq9T/JFWIxQ7wcZqQo0zyK4hpsHB9jFz7w+ez/joaeSTFMEIt1dtCxlGG9+e7FLlhUU9+WuheQvss8kcB4W+c06sBunsu5qz35nAx99NEU0sIwIFdBk0bMC7MhUCtHlzUEGnfw4lT8D2go8sEiP2ipgEnTCasME0XXZgCYOHwB3v1yjluK6lejpQN+1Cfl7mmA4HMQvT2TvOH4NdPh1o27Vf1ADXEBikfNc81C9147u7pTQvJXZb46qqMxyfJlUYhqeKSlPqr6j8xJPGKFf5mmVEAlpmQDp8T+ukUThygWF3YsAqBlDKviSjB7Yl8x5o2dARMTV3GR2yq35aRQzIdNBBYW0xwUYtXlg4aZRZ7LMLornfAFZdjZinHsF5xbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(16526019)(16576012)(44832011)(166002)(53546011)(66556008)(66946007)(26005)(66476007)(2906002)(966005)(316002)(478600001)(8676002)(31686004)(31696002)(8936002)(6666004)(6486002)(86362001)(2616005)(956004)(36756003)(186003)(52116002)(5660300002)(83380400001)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Jo4XRuL0V12/vw/v3KIRe32AbnGIWUwHFtSCW27ZWiVe/5sDvU16uQ65+px1jcyvketnB+GXDPMvIqIb1/zozYhhc7gH+XuxWghrEVNUkAfaGcTd7xh6RKVMxoDx4AnBnnwvtpy/SP6GSBZ9iJMOj8c46FNRZy5lcbwsC35oLdM02r5obXJhI1IMG91z4Qh+u8zpecT9cyoZpnUbhfy9nhw1gX/bBUnXz7OYyLL4b3aXdZ4UGD19wZmexspCcXWXfRZfUcxM6gHJ/1n+VItbjbG/25x6Ufsv0NhxIKdj4oOJ2vglw+bOG081B/w/ieYnVrlVGF54/r6/94a+axa0ZI33/XUKtMizNYSan1dY+Re9YvRBcLG7ItAZ+8la1fcKVLCCYCcXwv4V+6jjJvIhs0jGffUjBLWv8ELR0LM0Byn1C9mkfEybfBMPT5Wp9ME3gSuLnQjebtTbPuCPMBEir69VZhrzqNP5SyeB61+R5S0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c9c0d6-2836-41b5-a938-08d824ce0a8e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:37:43.3538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zi09usuM1r+1jwTcC5fVM7gQ/ihMdDS4+t56TGILBJOEX8x0VuqVVkzHm+RY15UUR93l7jPcilOn/qDQtaxbWdL0Hw1oCdIeLtpZFhNwxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
Content-Type: multipart/alternative;
 boundary="------------36E34CABD26388FD6DBF0845"
Content-Language: en-US

--------------36E34CABD26388FD6DBF0845
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 3.5.0:
>
> - Drop support for Python 2.7, only 3.5 or newer is supported now
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-luma-oled_3.4.0.bb => python3-luma-oled_3.5.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-oled_3.4.0.bb => python3-luma-oled_3.5.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
> index ee3b00e7f..39bc37fda 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "2944155b2242b9d2ddeb6e139c6083b8"
> -SRC_URI[sha256sum] = "2ea2b535e7e2f056a51a8c54ad78aa1f00d5699fc439c01bc7c2902823889552"
> +SRC_URI[md5sum] = "64436aaa7a05a205430b38d2f9a9bec7"
> +SRC_URI[sha256sum] = "ca62fd7337ee9780b32a8cdc10bcd69879f2cfd97720ab2e17e254a160f6c24f"
>   
>   CLEANBROKEN = "1"
>   
>
> 

--------------36E34CABD26388FD6DBF0845
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200708094659.27331-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.5.0:

- Drop support for Python 2.7, only 3.5 or newer is supported now

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200708094659.27331-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-luma-oled_3.4.0.bb =&gt; python3-luma-oled_3.5.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.4.0.bb =&gt; python3-luma-oled_3.5.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
index ee3b00e7f..39bc37fda 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
@@ -8,8 &#43;8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249">&quot;file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;2944155b2242b9d2ddeb6e139c6083b8&quot;
-SRC_URI[sha256sum] = &quot;2ea2b535e7e2f056a51a8c54ad78aa1f00d5699fc439c01bc7c2902823889552&quot;
&#43;SRC_URI[md5sum] = &quot;64436aaa7a05a205430b38d2f9a9bec7&quot;
&#43;SRC_URI[sha256sum] = &quot;ca62fd7337ee9780b32a8cdc10bcd69879f2cfd97720ab2e17e254a160f6c24f&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------36E34CABD26388FD6DBF0845--
