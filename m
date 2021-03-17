Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.57])
 by mx.groups.io with SMTP id smtpd.web12.91.1615992819708352240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BTzB02E0;
 spf=pass (domain: windriver.com, ip: 40.107.93.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n03Y8Dn31uf+d8v3BlNgqs8lPEZMbML/W0+9qhjohlhJVxqwFuqz4JLBHTDQuE+EhrW9SuYO11eJHlfS746JzWyPfDU5+MNCvJKNGwk1WHbh7DcrO4Yc8gRzC+wu2Bef5Ha3VUSeBVvJBi620y4UYKmTqKmXj2c+g/GzIsVr17GzITlET3Vn0XFFK2J4UCU1F24aR3hA4gXCCx+4t8AOr//PM9Kvf/wWnqqGr3/4Qm4nKFPXUZ95yEXP0oijp3+GBgh7Osia9P+Lo8/j0biZ0U9MEDJzxSDrGevM+Vz9lADSnq3UHQTL2BZC2Mt5nnhTr5a4YDnScMv9JuKpqM/7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW5H2r+zWjFNj+iJB4az09tkea10uDglqX51PeXXCc0=;
 b=C9XlBu7+3LP48YYaxK/xDZYbiNeWmCf9HnwfPnS1ZBO0xUhDw8m8b7pwnHzAe6RKDzbeYA+52LX4ectIdt512YAHdQWyb1YNt3zIq5nzLoHPob2n3hxOrl0hCzAQjgu1ScP/a+NLdjYU9P2T+6ByOaBuRRK+t5qOgNDcdbSBxZpHfwCOvaYTLdH4BMfrxbT0+15iLNVAciMSWagyYM0ofLOSA6zQOsiK+XRXKNFqbrpF5oSGc+1jk8GDT7+yg+Uiopqwm4Ci/MZrZp2eBQhFRi5d+0eSpyaiE/SGBRqZhdUMv27ioPeSzTjnQdbcEhGCSuuvH8uKK+XFOjcRuoyWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW5H2r+zWjFNj+iJB4az09tkea10uDglqX51PeXXCc0=;
 b=BTzB02E0gvlHnmjq/bAx0BjAJFVU1SGEark26llwQU/L96iGo82s1hz5BtL24AFEpcRfiZN98KKqCKRbKxkNxPzGAJkjpYkcbxQk/YfgWRpjlYaRfGweaIB3amT7D5JvzKV4YtDKmW7S2y9KAbhI37Gf4FXgrcLODDZOyuPZbMM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:53:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:53:34 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-alembic: Upgrade 1.5.5 -> 1.5.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eba3c897-22cc-4750-8c43-393d19fee029@windriver.com>
Date: Wed, 17 Mar 2021 10:53:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0506.namprd03.prod.outlook.com
 (2603:10b6:408:130::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0506.namprd03.prod.outlook.com (2603:10b6:408:130::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:53:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 006a8914-f16d-4f80-6f5d-08d8e9546fd5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4784:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB47841AAB46C3CD4AB19169E59F6A9@SJ0PR11MB4784.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	44U+yyRIxUYiys4DG5WkEqQfLKM5KlZgjniPVXv7vUXGTbLCs0sg3QDTF6aaEZMiG1frHLB/i6XKOhTADwLaf4EHfLov5in1Ghdp62BH/LiArQ+EHEBRWGLRnJ9A0+zgToz1iGI3FLHfs2IS51A5+SUEXOQOkAKQAv0B787Ley8Vp2rNzuVwkYbwIULhsQMk4K/pmAnng8snCIKbcv/uic7TIOxFyvMVwOvVSXEu4UHOV8+zsUxvPP8QZ36mlA591xrTsVTWt+LenYkTtvhaPw4W4oNP8axAQcIO2WDjAAzT2EtokplzwdWc04v0qtnM8obNIoaD+C9vazLlzisQctIxesb2EAXBvxkkGQ7ivHXxhOAHlaJ8jreCrt9Hy5lKI1VjQHA9pNm5xIAZ+7JLI/Sbke/+f2IFOuHvTsZL5DdVqL+CuSuDFnu7sIqKxcwB9VSl+fubfPZAzUltkhdW4ru7xt3GlVlid+7O4O7+UZXd0TXJmcPEtL/PiutzSLuiPDymwdtQkDgWzWNc+3lRXuheZTosEt6vPG6FZKTwTxZH7HFmYn73VS6sOehezSZp82Xnagp7rlKyzjpxb4hxEWGjDC7DwtC6LvtIi/OPG88WZfWamdKO37CtDv+FsDVtrgkQaCOgDRvYgSDVZpBTnY8xiXyKPFDa/0EFGjb2j6mb6/RMQUcXC/AA0ha26z+ypl5mqC2nRWOiVSAsDDDGO4WFFJ27avuhYPWkS3DtX3o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(2616005)(8936002)(956004)(8676002)(33964004)(966005)(66476007)(31696002)(66946007)(66556008)(6486002)(44832011)(53546011)(5660300002)(316002)(86362001)(2906002)(16576012)(36756003)(31686004)(16526019)(186003)(26005)(166002)(478600001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZWJSTmlZSHAzQzcveGNKZUhMZjcrVGhIUlhSeHJETy80SkZzYnU5clpPTW44?=
 =?utf-8?B?c0p0WEIwaStNaFVTSUdYRHdxbEprZGJreG9rUnljVDR0WEs1MUlwdi9namRG?=
 =?utf-8?B?dVgrTW9BNTVsSnhpVE9TMEpsMTlGOFM4eUxQS2FUUys3c3NwNkY5UlUwTzFU?=
 =?utf-8?B?WEp4eWpxeUJsMVhWUU9XSWxMd2VPWEhSbncwcHNDK0tnK0JtbkptK0N0T3Vp?=
 =?utf-8?B?dlJwTXJOd2JsMzVVZ0daclNWT1ZqektqbXZoVkpYLy94SWl4YVdEY3pqOS91?=
 =?utf-8?B?aHV1bEoxR24zZ1V0QUNnMGVVcE9EaElyT3U1bHR2dWtKUHlMSEhrUkkyTkxC?=
 =?utf-8?B?K1RZUUMxb2pEMDd6K2FLY3l0Q3AydURUUjJCand1M3pqbmRwUGFvQTZzaENB?=
 =?utf-8?B?ZHVFZlFHLy92dWdrQUp6V2I2K0RZNGZTa1lidXFjN1RGT1lWd1RENVpVeWRI?=
 =?utf-8?B?c2dMeWY3dFVaeEV4M0NBenZtaWJiNExGc24yeXZkSUQyVjFrTmx1ZEVqejI0?=
 =?utf-8?B?bEtUUllycXV5eGJxY1dhdlhWUXJmVURyQ2dOSkV1RFV5MUo2TXhxY3YxdXg3?=
 =?utf-8?B?MFhxUE43KzFSQ1AzUEk0eGdvTXBvY2VVTVc0dXBLSndMNnZ0bG5RWENpdHY1?=
 =?utf-8?B?M0dNdGNLcStkaW1ZU0lucjNORGU5RUg4Uk9LU0RDajBKdmpJL0lNd05od0Rt?=
 =?utf-8?B?Q25ZVnJqUXczazMrK0QzOG1WTXZxYnZVVmpmR1lXV21tS0ZydklKLy9mUjdj?=
 =?utf-8?B?bkNLSDJQeVlHWFF4RWRMZTU1Rll0WTRvSWF3YWl4ZGM5a1BVMUhjWU4wckZD?=
 =?utf-8?B?a3M2WkJabzVpdHYwMk1lYlNvVnpzM0J4TENzYm5NeXlDUEF1KzRiQklxTGMz?=
 =?utf-8?B?blFsOE1WcWt4eDFHbnlaK2RnVDdQa21MTmhNcjdqak9RYmk0NXRRa2M3blhm?=
 =?utf-8?B?VlZSRXByUnRQSHd0aVhJV3RpdVIvSXZjT01GU245SHdJUVNscy82Ti8rNjQv?=
 =?utf-8?B?TjFSa2Iwa3RzS3k1TUQyRkJkUDdSRkNzV3pQMHVkUEhDVkRCNFcvVXRBeFBE?=
 =?utf-8?B?dndhVlFxcS9wNng4NitLU1dCbnZ2U0tPTkdncG1ZNkc5NkcwR3JkRlJJNHR5?=
 =?utf-8?B?V1hPckZBQjgybTVzNE45UXhGS2lZTWNVZE1NTjBCQS93VGZ0UDJWMHZOc01s?=
 =?utf-8?B?YlZZbjVteXpJeXpWbjF6U0cxaWsxVGJCcHpYT05sUVZ2UVJZa2pJS0V3L1k3?=
 =?utf-8?B?MkkreERkUnB0WlpRZGRFVHBZRWpoVFBFS3R3Um1JWGRTUml0S0x3NWJBK3ZB?=
 =?utf-8?B?NWJ0VnVSL0c2NTNoTnY4QlV5Q0RXZmQvQ2t0NGhRcjRHQk9FL3krNWNSNVlE?=
 =?utf-8?B?ZDMvZWVReUY2NHgrQzgrdTdkYm5RUkZZTWt3S2pEL0Z1b0RKNjMyc0FIdlpL?=
 =?utf-8?B?eXM4RldhZ1IzOHFISklvQWZpYWJuSGs5anhlNlRycmFIWkRoWndWeEVlUkF2?=
 =?utf-8?B?a3ExdHBuQU94ZEhvb3h6QWJDV3ZhSlBDYlVrZlJnNk9QZlFUbWtjRndTdVNR?=
 =?utf-8?B?SVF2a2hLU0p3T2xQcU1DdklTTS9PMkpzMkI5Q3ZLOGNUTk5aQ3ppQ1dDT2ha?=
 =?utf-8?B?V2l6RC9sL0V2SFRxaml3U2VIcXYrYnc2SnNlMUQwWEdSUm5CTWQxL0VDb2Ry?=
 =?utf-8?B?TXRQOUpmV3pBcTBieUlLZTZsUVVHbDVzTGlQSkZRYzZsWnJqVVVGNS94d3dZ?=
 =?utf-8?Q?SkSAY/M3hQjp1RxwZtkPqL1wupHyNh8JrBfcANq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006a8914-f16d-4f80-6f5d-08d8e9546fd5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:53:33.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXquYI4/RiVMPy/qjxH0eUH43EQ41GlHbZXv20DLNj/b/czhyoFUnr6HDsqY/hV9jMEYNzE0LzmWD3mvtYSg8DUWTf51tIBxaMblQ6c6mtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
Content-Type: multipart/alternative;
 boundary="------------A48694EE6C5BA8A64FD9140F"
Content-Language: en-US

--------------A48694EE6C5BA8A64FD9140F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.5.7:
>
> - Bug fix: adjusted the recently added
>    EnvironmentContext.configure.include_name hook to accommodate
>    for additional object types such as "views" that don't have a
>    parent table, to support third party recipes and extensions.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.5.5.bb => python3-alembic_1.5.7.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.5.5.bb => python3-alembic_1.5.7.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
> index 92b691e17..d30e1b696 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "df0028c19275a2cff137e39617a39cdcdbd1173733b87b6bfa257b7c0860213b"
> +SRC_URI[sha256sum] = "66bbb0e7d6277b007dfe7e27237093c79b76cf4f94e6fbd0f7af6f9409546fe6"
>
>   PYPI_PACKAGE = "alembic"
>
> --
> 2.17.1
>
>
> 
>

--------------A48694EE6C5BA8A64FD9140F
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
    <blockquote type="cite" cite="mid:20210315084727.26812-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.5.7:

- Bug fix: adjusted the recently added
  EnvironmentContext.configure.include_name hook to accommodate
  for additional object types such as &quot;views&quot; that don't have a
  parent table, to support third party recipes and extensions.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.5.5.bb =&gt; python3-alembic_1.5.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.5.bb =&gt; python3-alembic_1.5.7.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
index 92b691e17..d30e1b696 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb">&quot;file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;df0028c19275a2cff137e39617a39cdcdbd1173733b87b6bfa257b7c0860213b&quot;
+SRC_URI[sha256sum] = &quot;66bbb0e7d6277b007dfe7e27237093c79b76cf4f94e6fbd0f7af6f9409546fe6&quot;

 PYPI_PACKAGE = &quot;alembic&quot;

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

--------------A48694EE6C5BA8A64FD9140F--
