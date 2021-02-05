Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.45])
 by mx.groups.io with SMTP id smtpd.web08.8346.1612533955415341204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V8Tsd9PL;
 spf=pass (domain: windriver.com, ip: 40.107.243.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkbTIYKOk22E6TNEyDPNmrAK52mLJVvCIItO/6Y2/zfCycsrLOhPHestUo707qe3MMQotUJORyXXmiADn9p9YRgZuoSkyfGcfc3gSZP8nM0MbY9R0wX5NRFe9yT4hFxVNa0rRiV6juWYXhnUpwxupoiDGE47v7XTtP3zhf8ZSw45pADv4Nkiy4XlliVJe1eOca/VR7uLcwuzyiMhtM0etXeodR71CH8bOAruhqkF/rE3NY+WYVFurR9fhXjEgfQiaREYY1x/Lw/3TvoycujFDLJMuEviYTcbpJKQIrEKy/SSDiyioyOemZ2p5PvawImg7357YfKwLSPhJ7OV0FpOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w6JgBarAFNRap5umwXPSAVdKU8V8lC16FvmMqpKVVQ=;
 b=gmngxbFNP1iVX6A0DyBYTNUYWS36UFjkcrLVHmZr5hBPUcxCU81kEITU1YdtwmNtsQQM+HcKpOHwwPFKGx8kgreZ/5Ha2wTvKPatAcDVfPmN5vRVovck6AZvw5IHFN9c3gWkPJua6e0jjipzJKCWZ/0BRLm+1ni6F85JJZcX3TmhqG7hCQ2YfOSGOmAB0euQJhMBLuOnm5DKsDmG7OsZfzRkQhCmPQJEILMDVY5Tho0mJa3/zVYBQVHj+dpB+bVBLVJqhpiMiMK1Zl5PAvxLlPmKhgEBe7f6iDVhdEfWmy0deBCTvVGl1y8R9XvxIe7gf4E0d36zige5bygTDryHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w6JgBarAFNRap5umwXPSAVdKU8V8lC16FvmMqpKVVQ=;
 b=V8Tsd9PLyyT4eHWfuS8ZjrECX88j8AP6DA57d+Lv1SsxGxnLS6ddJEvh8dOfYfAxlVQAlU34llzFG218HOWkoFVZWFQtJAqUbnzI7I5h1KPGpe/z6Uka2cIXprKVK5J59ssO/xdiG6ucC057rUaKgtO/bUeb+TxcdMKbet6DPrA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 14:05:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:05:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-ruamel-yaml: add native and nativesdk class extension
To: Ross Burton <ross@burtonini.com>,
 openembedded-devel@lists.openembedded.org
References: <20210205092437.3099545-1-ross.burton@arm.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <13684693-987b-e8ff-b9ad-4ebb7843c7d7@windriver.com>
Date: Fri, 5 Feb 2021 09:05:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205092437.3099545-1-ross.burton@arm.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0477.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0477.namprd13.prod.outlook.com (2603:10b6:208:2c4::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 14:05:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 406823a1-ec59-43e1-4712-08d8c9df26ca
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352B7CF218E7C774D5DA90B9FB29@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VZ1Fbb9Z7C0CqC7v7m+Xue5pt9jvQ8wbMIyP7ZCez2SMZrHBXllJx2nAWr7WPRzwPUl2NGoFh6fJeNbOGomPMTF7lMRmBezdPUDdM7giSz0we/lO7hLCnKK5AlosndLsd3/obOoZhJOyzCOpKANCr/GewmLOZtuxQDnZgQWUxhhQ8J52Inn5Dr3zNSHu9UVjHhrk/Zugh8Eg9Z42Wo0kY5h0J92qvXgGoSZ9mQD2KpNbsNVbViIuiEIKUI3wiVfJASsR4vxIWwCqCHR7t5gcGu3IE4VrrFFzKHRKH0n2aostfXfBQuvz4I0hM8+iSVtwkrdjIz+rhv8+cYX3xHhvGVap1XTspnwfCk08rg+a+56TYIUFXsYf6qnnpOJhIQrGR8eGVilJcfGt70RomfX6JHBQ9PH3H3MbXQzPm8BSh3xTkp9oBhV6Ky4KcAVHJeYG9TJCh1jS3iZLnBoa25MbY4s88kHPlZn8EMWBqOoX9xEe0zPKqHnGeLE8/7V7vRKG7vUFKapQzOPq8N/W3l8HyldfIPDghP4AqpS4d3qAyVx9HmSWVMtjnTbLQqzl8u1ZadHYVO2YXy6ekSX0X1kS+86zDHsuj7JmIQ5atdqUHr8dRUimCvzW5jGNof71cXWE/4gzRn5gZBIPv9J4O8YynqhbjXWEcl8t3oEOoL2/RmrCor/HKKYbVyzvx/NzjrNW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(8936002)(83380400001)(966005)(44832011)(5660300002)(16576012)(8676002)(36756003)(166002)(33964004)(478600001)(66476007)(66556008)(31686004)(52116002)(2906002)(53546011)(186003)(26005)(16526019)(31696002)(66946007)(6486002)(86362001)(316002)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S0xQSXNyd1g4em5sUWl2eXRVeVhtTmRESHNmZzRuSHJMWGJRMjBWNWVxUUZF?=
 =?utf-8?B?bHpjVGM2VzBWbDB2UUN4NVp1d2RGUzRpV0p0Q3liWkhPbTVhanBYZmRGOS9a?=
 =?utf-8?B?c25lU21ROHZyYjlxWnhqYVZ1ZUxPWm9YVVZYMURLdkNRRzdsMy85OHA3N2Ft?=
 =?utf-8?B?eDhIWlI4Y1IybytRZzdUWDVSRDlBTzFyU2NWWEdXMFJrbnZVM1EzQ0IrVjJi?=
 =?utf-8?B?TzFWenZjUHk4eDNybDQ5S0E5UWtDbEFKNHhxbWYzUEludDRGUXNJdzBLS1Bl?=
 =?utf-8?B?TmtURy9VY2loWE16SXBtQyt5cXp3UlptNkZoeFFmY0xBYnZNbEFBaGkzRTl6?=
 =?utf-8?B?UXhZTzZ3ZVdEZDVsTzV2ZysrcXhXVnNqOXMrN3huMG0zbTFHUlFjcTNLc1NQ?=
 =?utf-8?B?dW0vS01WNWo3ZHdNR0pXRFQyVnd2Y3dZWDMrWUd3eTZXR1hKY0hqM09zNnAr?=
 =?utf-8?B?TDRRRWh3ZnRXMEdUNTBHbDljcHRTcWJYQXNJMUlZaWsrZi9UOWZkUjZjZ1Q2?=
 =?utf-8?B?TXFsVjdham5EVUtNbWErRFpZakNNcUUrTWVVOTVoNHY5SHJOb3FsS2c3cHZv?=
 =?utf-8?B?em9FT1Z1a0NqZ2U5c1YyekxLMG5VdGhaTlZxNHppVWNNb2hzaStvQmwza0Np?=
 =?utf-8?B?UmRqaTFyZlhxL2lTUG9RWWhGSDU4YWU5dGhmRW5raGtxYlY2L2JMZlMrZ1Fw?=
 =?utf-8?B?dG1NWHBHZDNhKzJBTERnRm9ZRXJDTlFxWC9RNEZVVUg0a2tNWGhyT0xkbGVY?=
 =?utf-8?B?N3NpWDUwWW9JcnFqMVlkYWd1TTAwY214aXphcEdkRnhyaTUrdEoyVWV0N3Iz?=
 =?utf-8?B?VzVNQ3lkMFRPeXFVL3Urbm4rMTJpaEhUTE1HUXlreUZ2Z1JvMjlVWlhNbWNR?=
 =?utf-8?B?MWNnTWd1UUVvZDZmWmgyWmQ3ZUFWcWFrUk1Saitsb2JMMFpGa0JKRkFDK3U0?=
 =?utf-8?B?N1h2SXRIUVdYb3hYeDNKR3BRdHNGa3R2cHlvSFZMUDRoMlhjWDhabHVUTHow?=
 =?utf-8?B?bnYzM1pIT3lmTHQ2aTZjVk5KK3RHQzNYUlBNTCtkTHNwb3h5ellwd2hBY0Jx?=
 =?utf-8?B?OWU3ajh0b3RUblNPSWwrU0d2Z0VVczl4R0NuQmgxNWRzL1MxVTJFbTZGNGZp?=
 =?utf-8?B?OGc2aTB3RDVCWUlJU3orejIvZ3Q4S3gvU0xxaXpaSC9oUm9ZbGgxU042SFNF?=
 =?utf-8?B?S1J6b3N4c1lIZFlHVzJ0SzkyNXBHcDNBcFMwRW81QUJXOTBERUp2Q1prUGQv?=
 =?utf-8?B?ZC84eUgySmhhOUw5N0RWYkppdGp6VzFMeGhxaEFON1BsNjBXOHd2TGhjME1i?=
 =?utf-8?B?aXB1bVlHcUVsUmJKRlZXVW9MbWtIb1pXcTVCQVl3b3k1akVYZkZmY1RRT1Q5?=
 =?utf-8?B?aHFoRTRXYWJQK2VQUE5XZnJZUlFPM0I2K3dZOUkzdHd0S1B2bG9oYjVZSmZl?=
 =?utf-8?B?NXQ2UEpvMkl3WFdqbXFiTlZPOUxSdlRKV1kvTUxTK093cnhWMG1CNXJrenRq?=
 =?utf-8?B?SFFhbmhZYitZdnV1MTRkT2RoNDc3R0V3clkxekxYYXNGTWhRc0RjczB3MFVB?=
 =?utf-8?B?Yi9CYzBpM3grc0FyZm1VRmpzeDJQaVBudlY4blM2NGczUU45bTZEUkdKYkYv?=
 =?utf-8?B?TC95bVZZNjE1OXFvcCtnQTNSblhyZWx6Z2NCVFkrZ3VjcUZPYTljOTBUMEZP?=
 =?utf-8?B?aXlDTEVtc0lDL2NYSW5LNEgrQWtYQVEzNGU5RWc2dm9EUnBVM2ZCMFJpYnBp?=
 =?utf-8?Q?1NZtZyQYhtIz8Xc1ZPIsM6PVz48yF4+becTtOWW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406823a1-ec59-43e1-4712-08d8c9df26ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:05:54.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70aGGFEVzAjIpXjx7+h1mr+1oorlSsimn53vQe/jIrHeEYYNAm8XAuLb6atSyfq6ueNtTp+mOSQAXgd7ukHs9PnxCTtI/k3fyGd03xbkyOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------5C8FC58D6A6A97397C1B5FD5"
Content-Language: en-US

--------------5C8FC58D6A6A97397C1B5FD5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-05 4:24 a.m., Ross Burton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb      | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> index 406da80f40..7593ce7f54 100644
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> @@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f2
>   do_install_prepend() {
>       export RUAMEL_NO_PIP_INSTALL_CHECK=1
>   }
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> 
>

--------------5C8FC58D6A6A97397C1B5FD5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-05 4:24 a.m., Ross Burton
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210205092437.3099545-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210205092437.3099545-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
index 406da80f40..7593ce7f54 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = &quot;076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f2
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
 }
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5C8FC58D6A6A97397C1B5FD5--
