Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.83])
 by mx.groups.io with SMTP id smtpd.web08.88.1615992805113191481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZxJrO3I2;
 spf=pass (domain: windriver.com, ip: 40.107.93.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI4gMFfMTFsAHFyc4g2TJp0a+jUN51gQJlKU/5QgbbRUBk6oL+FQPBdPmruqu5eI8nUOy7zM2au70SUuNSYCiXOenecPdKo50hdpRMIGpRlcfn6UcyoSiPuweOgJOz45LWF0x4pQ19USKCSkeuELVwy5WjCQydAuk3dGWi3MUczUiD4eMRikohjRyWD2+/FSA/qZnavZn+0ChPNEKLCzxcHhgcsX4zpdfXlv43GwsSC4Gu8DkLlcMsVlCnFGR0FXvyA59wYEUmNUWS8gMvQGOHgzVLJMVkc6st8vIhuUeXZefzVh8TQI9x9owcuJSi80RwUssU0c4zXZF7n5QdlLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9jdllwJ/aOQ8K/RR86OYfUSRLzFnO2xYBnLPepZIxM=;
 b=cyVSMD10Dk3VfLj8K9V28GBNKnAqZJLLmCr4dyncsa6rHGw2gGoNlB+fyP6hHT4bkYd1G31lbiC1shk88xP34cY1CouWx2FQSQM3Kq0zIHvYzXDIrSSpvepidRZ79rVP207MfWaV+JTZgigwKpR97kUHg6VYaaipa2apryuDkzPQKB5J/y/LEoRTbX77rQ5R2vLeEqYxQDlpWC5OVCaxIFAfi5uzR+08ttaZDUrev3b86+QakAJ/KdBmsZQQx6+Hx13R9i3u56ldPglBAq0J30lgd/cHhGmgUT/xkOVfAwGBnyuxJq8VwNs6l3W7hg00n1r1a+VL8ZE7eDGU8mXtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9jdllwJ/aOQ8K/RR86OYfUSRLzFnO2xYBnLPepZIxM=;
 b=ZxJrO3I2XjMvtciw20x9EdS24QpJypP4WdZfJGCBLBtKW+ZMFQu/D1+sfaSM2e5CmaYJ2yD3WDvaa8bUj4l+jjbQU/1t38VkAniyKDbo9GXcKi4tnLrPsVmrn8ZZ00xhiYGJ9Qff8lKWvYfzDbo5rNz572IRBvQBXFMGjjpIHLk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:53:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:53:22 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-bitarray: Upgrade 1.7.0 -> 1.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0981e9d9-0e4f-9736-ad5f-0ed40f890392@windriver.com>
Date: Wed, 17 Mar 2021 10:53:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:404:11::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0049.namprd13.prod.outlook.com (2603:10b6:404:11::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 17 Mar 2021 14:53:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3877089-0d76-4772-f4d7-08d8e95468c2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376517ADE985666C577042EF9F6A9@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lghVhxoaFzxgrLGf1I7JtNqjLwu4Do18ffrfzJ0aiBqU/Yn2T9LVEE3ms7uNxd12W1BKYfXEnDrzsmHmpIH8ODkUFdr6vf6wJGe8dBRZasMFpgmjo4njEv3g7gXOdYAVsG3Vtduax3LWkmW+SE2lts9RVDTr0unTdaNeMn21XGwxCTx2Wo9fkc0FsHCUG2g0qn6Q4PFXVWP0rvCN0Ezy6oqsw3vTxhpwtH+TbbJO8zVZeEOyS2r7GLWqtTXrCjBzIAZjRyrKqyqjSSRDj3t+ob3ZmXWD7MqKvOMA8LExOcvLeQnC9mXHUvZ9lDovUbIl5xxDE3NMKuwmCP0QB5a6/CwZQZ39Wn8GemTSb5NThH1YYyIXZgck3aj1u0cP4Ege5Y3iavRcZ7FJpRWDe2nVb16vefFNk2HrVqO1B26CDa7GROLWsiB/BFJb1L9O/qZFmbUvt3C+8m3+WLYoDkqv1/EKe9mJeBf9LwRfCyUenvXSNpNHdTznK52ex2cJvMHK3G/eaNbeSNsb+uQSsKClTY5znE3H8XNQyqSx3K3e2TuIkALF/PKq6gMRMJlZ+JiWH2t63kGZokUYG8tDptQSDQh8JTtVqoFqm9g9TaNjhf3OQRhMaAStXU0xdhrcFrDrbGUnZEWt/nJCK1JxbGDTZvsktc3aYCQRtOaESbIi+WTNlJ+W3ONipDzZPdpZZkm+a9Pk007XIOAxr3ToPhQxLH/2fG7yMODbdSgoBZLRmhE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(6486002)(8676002)(44832011)(66946007)(2616005)(478600001)(31686004)(66556008)(966005)(66476007)(166002)(8936002)(26005)(36756003)(33964004)(31696002)(316002)(86362001)(5660300002)(16526019)(83380400001)(186003)(2906002)(53546011)(16576012)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?elJHS1BRdkRiellPOXJPM1kwK0hudUsxNzg3YWR4U3d5TnN0TmxXNkRnTndI?=
 =?utf-8?B?MEtPcmdnY3crbkZDanZ5a1NtUDdmTjdlcENYejA5cmpaeG5KNWVQOWs2Z3pT?=
 =?utf-8?B?YlkrbHVVV1UxUGtSTEx0aXB0bGl0RXEyL0Y2aysxb1YzeE94c0x3WEpFM0lt?=
 =?utf-8?B?d215MXc1ZEQyb2w4SUdLS3RWQitncks2cENBT3NXaFFIeGNXZUxMdktaVmZp?=
 =?utf-8?B?ejZYRjZIZW56Z1JjcVBuTytPQ3YyUW5SMlNpV0ZqK3U4Y29UeGlUY0pPMmxO?=
 =?utf-8?B?RWdSRTk5cDNZeVJGd1RCanhZUXh6Z1RZb2dPT0RTR05XSHZOMldWS1pCMzdF?=
 =?utf-8?B?cXpSVjMyVTVGRWhjZXp2QkdHNUU4eXFyMGZYWmNUMTFaYmlNVU0rWVRMTVc4?=
 =?utf-8?B?UCt6elpxcFFjdk9rN1QvU2o1SmQ4b1lJeWRYRW9Eb00vajdIVFgvV291ZkIv?=
 =?utf-8?B?TS9hRkh5V1hmVVVGeGhGN3N4TEtOcUhKNUdiTVUrZThzZkFnZk0yVXF6eGI1?=
 =?utf-8?B?OUowYUhHRW00R1g1UHllejZ0NGpTQTFiTy9wNk5SR0xjdnlrSjBEdzZJaVhI?=
 =?utf-8?B?aXcxM0xqMjRualVJb2tiMmt3Vkt0MWU1a2ZjWVMvbzA5YXVtMk1nZFc2VFYy?=
 =?utf-8?B?eVZneU0rVXNvcldDd1FNN2NwWUdFa1pTeVVLdGRZRlRqZ2dDV0g5S2lhN2Zj?=
 =?utf-8?B?RWVGRCs2REV2M0hqRmNQOWdLSStzU1Z3V3lwRGZ1NGg5aElLUFRmUXlTbGdE?=
 =?utf-8?B?NW5QWWdUVnpRWk9sbzVZRSs2Sm9UY1lnVlRrdVNROVFhTFU4YmZYb0pIbnZ5?=
 =?utf-8?B?OE55M1Z3WHowMC8yeWlDZ0xsajBGaGZYSGJMMlVBZDdycTZpTDNmK1A5bklt?=
 =?utf-8?B?d1V4T0ZVekZyZnNPS3NlWjRqUDlhM2pYV3U4dVNvY2kyaEtzdGFRZkUzYU9y?=
 =?utf-8?B?SHkxQkRRT083T1lLVGRBR1F1VW0rQm9UeU00MzhTVmVwbCtld1k0Z2lJSU5K?=
 =?utf-8?B?S1FQUWNyWlNENFRzeEVwYitiYk4zZG9vUno4a01XNEpxRVdpZDZ5TTBBWTF2?=
 =?utf-8?B?aURKUXYzSWQwRktBOGswVml1RXpUcFAvYXJRdkpLYmFyRTlyVTNGWURNRkpl?=
 =?utf-8?B?bXJ0QlBWTFZTZWdmRnlQc2pWYk95ZWd5OWRhd2FlZ21zblBIVk9TOGtkV25r?=
 =?utf-8?B?bmVOQmJVdlNvK0Y0c3RqekEyY0J0SEpoa1dSOWhDcmlXbE1odGdIeWhKdHBS?=
 =?utf-8?B?eUY4ampLcEh4Rk45NDlhRlNPT0k0VXAxbnpyaVVMb2N1SWNpUmFvSVV4RnpG?=
 =?utf-8?B?ZTllVWFIUk5SaW56dDIrTGlZeFUvb1pGczJrekJZbDZxdExTeWovb3hIWTFU?=
 =?utf-8?B?U3h4NitVT1JPb1RFUGxPQjdBZmlPcFZuMGhFRmV4ZHNnMFFDdjN4citXVWhu?=
 =?utf-8?B?T1ZYeGxuRkgyZFVpQnRiWktBaUtHLzZSUk03T2Z0a1BvK3huN3lKQ1EzbWhk?=
 =?utf-8?B?bm1jYkVuK2pNbDNUNUUzTHovRUVDU2NFSnh5Y0hpRk1lOFBxTDFtWTRtaXJr?=
 =?utf-8?B?SVc5VkM4RnlFS0ZBWUlCVVkxN2MwTmpLcEdNOVU3ZHp1NmovTk03MWhwbGgz?=
 =?utf-8?B?VkZsbUxra01nK0NoRjltdElGREJxdmxiMVJSRUNXZWw0cnhkaXIzL205K1M2?=
 =?utf-8?B?S2VjdHlFUzNmYzREU1hKQVdHT1FIYkx3eDlhRC9pN2RnLzZydEFqY21JeW5Q?=
 =?utf-8?Q?0+jCtcdA5oiSgDZHWV4EuUcEbHc/BjbU7e8Yxj5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3877089-0d76-4772-f4d7-08d8e95468c2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:53:21.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0e7+SNjWBfIZAyvLkBPxC4ZBEuFgQvhtfg1fpzBDcqBXadge2C6aLaqTcWb1VlawxnakjB3mz5qFcumwQxIWiE3fucJ9OYG97VK4RhyrUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------067228B4B1FC66020B293E0C"
Content-Language: en-US

--------------067228B4B1FC66020B293E0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.7.1:
>
> - raise TypeError when incorrect index is used during assignment,
>    e.g. `a[1.5] = 1`
> - raise TypeError (not IndexError) when assigning slice to
>    incorrect type, e.g. `a[1:4] = 1.2`
> - improve some docstrings and tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.7.0.bb => python3-bitarray_1.7.1.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.7.0.bb => python3-bitarray_1.7.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
> index c91b7443e..f859283ab 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>
> -SRC_URI[sha256sum] = "e31b472ac92e04ea943723cf781ec168e15049d91a3052203defb81652d2b086"
> +SRC_URI[sha256sum] = "e4de977d708b7024760266d827b8285e4405dce4293f25508c4556970139018a"
>
>   inherit setuptools3 pypi
>
> --
> 2.17.1
>
>
> 
>

--------------067228B4B1FC66020B293E0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.7.1:

- raise TypeError when incorrect index is used during assignment,
  e.g. `a[1.5] = 1`
- raise TypeError (not IndexError) when assigning slice to
  incorrect type, e.g. `a[1:4] = 1.2`
- improve some docstrings and tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.7.0.bb =&gt; python3-bitarray_1.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.7.0.bb =&gt; python3-bitarray_1.7.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
index c91b7443e..f859283ab 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>

-SRC_URI[sha256sum] = &quot;e31b472ac92e04ea943723cf781ec168e15049d91a3052203defb81652d2b086&quot;
+SRC_URI[sha256sum] = &quot;e4de977d708b7024760266d827b8285e4405dce4293f25508c4556970139018a&quot;

 inherit setuptools3 pypi

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------067228B4B1FC66020B293E0C--
