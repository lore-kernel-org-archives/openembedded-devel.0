Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.79])
 by mx.groups.io with SMTP id smtpd.web11.35.1612303833773495145
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 14:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EeILh3Ic;
 spf=pass (domain: windriver.com, ip: 40.107.69.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+FTSsvMXkzaKTLLmWokfiNqkVnLJa4tlgc8GBQblAD9gR/QLYhlDzMOpArL9WUZoKCn/6OuT/mLPAAFlbuKhhJUF1hqL90xgPezOtyZ3Zo30aSKlgDVwC7UM6/P+jjJ1FlFJtqpOpCVfY1LhM4kmU3OYtU55wIIN+9tGmZayYozqagN0hK300YNGw9cWGEtB+Mro6Q3MnJWrr4qHK2pDjBiEQCY4WXNU5oM4GYlfK1oalstAN2wUBv2QkWuIj+Xf5yDMkJ62GMbyhlf4skhuyO5dN2tTjBa3NUOUVEx78f2Kiji+j+RwMEjf4rSJbWErXlglfIHatiiZgPrVQHzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGwGNSp/V4TCqcou23+aDVmGj0xxsWvShIyw8CV8d1A=;
 b=mHpKBmz6eLRGtzTkrfKVfGg01zhmhdT4X8V8WmQEQHnwrTqzPw5GlpUxubwqYzf1+tEUUUhcNQ8vEgS//z4ICcDMaqN2+k+1/6X3mDA0b8hBdu+H+qo4JVVUccusVEu1keuSzymnEbsy63RVQPGPZRwckNW+qX1gI0fXofbt60enLIpIsLDny4ZvucE5mtu4a9v70rxqeO79LH8AvIFsed6N0CqnpDWQjjEWitcIzCBa/CKKhq94vttP7TeF+aYaNLLffhBXTqaxmsesbKl/5lwT8MkSalHg4cxhyH8RxqQGNtxUlf//sOSC1/jKoAWyEKJtZoF6fUFvA92mmsDbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGwGNSp/V4TCqcou23+aDVmGj0xxsWvShIyw8CV8d1A=;
 b=EeILh3IcMsqo4daUmgDnE8j5c2/zdUi48lTLjjeegRk+4z5DFeWw/JeNUUEqcbom4u24xET/xpWkH1b4Yno5iQG2WW3/5KP/fB8/8AWldmD7hpe97gvico1DmU17/Un7PQDjYE6mRFs0yHanOuKSNi93xwYb9aoOl2wI0fWHRCI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 22:10:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 22:10:32 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-alembic: Upgrade 1.5.2 -> 1.5.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
 <20210201124516.30135-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d921059c-b204-3a01-99ac-65644576dc27@windriver.com>
Date: Tue, 2 Feb 2021 17:10:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201124516.30135-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0635.namprd03.prod.outlook.com
 (2603:10b6:408:13b::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0635.namprd03.prod.outlook.com (2603:10b6:408:13b::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 2 Feb 2021 22:10:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9acb54f-6372-4a68-b74c-08d8c7c75bc1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3448:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34489001D24F4EB171BAF0379FB59@BYAPR11MB3448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l7IWFchzJ518UXXR+zIYFh/HAT2xhDW2jnh7rdwnchAz1IesGufUoGvMMYIDSBqaQE3322Ii47pikmtpJ7FpUaML2flxDgB0fvT/Mey8LBqBQdn1hY49qD1jyXQWSbAu6WeQEIWkrZugHyVxwi66vuEK6GW9dhtZASihBCs1KCVVFYHCYPU9NmcP+5vGKyT+YbmJ7QJVZTqOLjm0ZDNz9WmhY17rgacqxwWbYaKAaW3sd17JhTA+2QG2fbAzbCIBRuUgmPUWwZCS4E9P0qme+EUzGBqxPF56FKfwL+iED7ZqOIxLuxRwMpTjri/8Ubl8nyVRu89IuYlNQhQ1+jhVSLyuKhdzenFv9+7fSMSt5uCfUulDOodM6oUgO9SXsJpTiAReh2PXRjh80vr2eSXOah+zLJoQXpZmWCIIdGXtCVg++gS+RoZ+vHjw40odOIe/aS5NQDSgE4Oio+GAujlTmg+XCt6Yh1hdmSTs8miAvcCaEWSVIZauEC5HvRX+rznlxDbjnrfEh6YBTPqIdOxS7sk1EM9LXqjYAEA3OUU2l1kidPXAW9wFHJEWBnjfA1HFEJnHPTgjWNd5Yrr75ZzMpUcg8kEVDRgAN4hxYAtHmI7Rb+LZlk0Pn9TMJ1AgsklbiCX8oEmaVWnZrqeA0MW/+UARuQS4s0PJYm86129MQ1XOq+DCPC7+Owzi/6IImMEr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(66946007)(31696002)(186003)(86362001)(26005)(33964004)(8936002)(31686004)(8676002)(478600001)(52116002)(83380400001)(316002)(16526019)(966005)(5660300002)(956004)(2906002)(166002)(6486002)(2616005)(53546011)(16576012)(66556008)(66476007)(36756003)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a1VKOG9nazhGc2xFUzQzUVM3WW9UUzZUalNGZnFHZ2dkakw0VHNUWG5VZlVS?=
 =?utf-8?B?R29handrOWdqTnVZV2g1ZDZIYmE1bEdIOUtMb1Fxb1QyMC9BRmtKeVhYNjJG?=
 =?utf-8?B?eEh6ZS96RWkySjVJbFFoUDc2d3dBVUtPTEFCZFhqbkVCOW5QZFhFRUYxdkJj?=
 =?utf-8?B?OUt6WWs3SjZGUHp5Q2VSRnFha21xYXpyMFdYSXljbWtlbitBZHFYOXN1d2pN?=
 =?utf-8?B?SkhMNXpJc014UVpsOEMzNVRnL24xRjVVNnFFL0tRWWVocDMwczNySSsyems5?=
 =?utf-8?B?SmN6VVpsNExxRUxTNmVQcEsramUrWVdyd3VFWDY2R2VpeCtmNDVxWnVzWTNy?=
 =?utf-8?B?eWgvSjFOd0NMaDVodUN6RnpZbHRJV0UzZnluenc4WmtnZXorL1luVlozVEtG?=
 =?utf-8?B?Nkg5VVdMaEFEZEZ4ZG5tTEpidXFocVB5VjdXaVFvR3U2bno2S3g1SW9XSSth?=
 =?utf-8?B?UWlvbUE3dVJmT2ExNGpJeG9qWXpFZVdsRkN6NXZLRlJvbHY5UE5Ca3Iyd1Jr?=
 =?utf-8?B?d2hLaGtiRXRqbGFvWlJhYXZDVmR1OEJXWk5uL2VIUTlHbEJ6VzVqUTNsU1ZS?=
 =?utf-8?B?dXNiR0RRekZvSFBBRDhCMFduVEZRR2dKNzFocTc0U1Y2dVdzMWdNS2JGVkdx?=
 =?utf-8?B?VHd0M3Jsb09QbTNKWGtxaE9RSXZyV3VVM2RGQjB0aHF2OGlRMzUxaWExdWtS?=
 =?utf-8?B?L2t5bGkrbFZveDZ6Ykc1Q3RjNDJ5OXBvUVFtdXRXM214bGpQMEtuUWl2Y1JI?=
 =?utf-8?B?L2VVSTE5elg0alIvNE1qSldzTXJqRnp0dk5Gc3pqdFVFRnBSM0NMcFUyaFFa?=
 =?utf-8?B?RFl5R050OFZzZWVtQXI3d094NCtyTHRUSWhsd3BTbWIyeTRCM3VTaVZNa3Nv?=
 =?utf-8?B?bzBFeFdlTE12R2JSRXhqbUJweXJmcmZ1S1hURmx4aWgwT0tEREg5YzdYb3Iy?=
 =?utf-8?B?Ly9yVUtRVk0xRytsNG9vS3V1NzlVZG91czlLOElUbVR6TlBPZllJMERPS3NX?=
 =?utf-8?B?QUFRNWV1VXFwRGpodjhvcFplaERmNmQ2MG43dGhkZ2NlL2ZnYmRBdVRyTW5k?=
 =?utf-8?B?dnVOY05wdGF6dHFYNkw0Q0VEM05hRlVqV2pFeElUK09kSVFiL2dsQUswaEJr?=
 =?utf-8?B?TFFFbFVsS2laNmFpbEp4bUlkNUxCMHo0M25rR2NSbHpOREF5eGEzaUliQkVs?=
 =?utf-8?B?NWV6SytoMUpUUjFpclBac08xbTJpOUpTdDM2akpNU2J0WFBSSDBTQXFkbity?=
 =?utf-8?B?UGZxbE0zQmxLb3RGNXNPOVVjUEVuNEpXMzdHeGhTRlIwU2ZlMENncENJVGtt?=
 =?utf-8?B?K1ZrVU9SamE4Qno0TkpkblVDUGtMSnQvUnR5b09zOGtzZ3BQOCs0L2k4NFFr?=
 =?utf-8?B?NXg5K2pxcHBaKzh5eGdXckRXcGx0KzFjSnBkR1NlUE9tOEVHZ0xXRlNaWWdR?=
 =?utf-8?B?MldzbjloVmFCY2RHcjlIVzBrY0hPS3FjTVRoaVBnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9acb54f-6372-4a68-b74c-08d8c7c75bc1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 22:10:32.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgEsvNGcTq2HEJJFdVb4LCsHci6GMa8k9EIeqDHP8dxBUnPI1q1XYy8PxyE7HygpMnY8L5j2+SvzDKsYoQoWUBao6MPOHuARpVSUL1ZiEyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3448
Content-Type: multipart/alternative;
 boundary="------------6D8198CA1ADBB20C93AC9C8F"
Content-Language: en-US

--------------6D8198CA1ADBB20C93AC9C8F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-01 7:45 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.5.3:
>
> - Changed the default ordering of “CREATE” and “DROP” statements
>    indexes and unique constraints within the autogenerate process,
>    so that for example in an upgrade() operation, a particular
>    index or constraint that is to be replaced such as for a casing
>    convention change will not produce any naming conflicts. For
>    foreign key constraint objects, this is already how constraints
>    are ordered, and for table objects, users would normally want to
>    use Operations.rename_table() in any case.
> - Fixed assorted autogenerate issues with SQL Server.
> - Fixed issue where autogenerate rendering of op.alter_column()
>    would fail to include MySQL existing_nullable=False if the column
>    were part of a primary key constraint within the table metadata.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.5.2.bb => python3-alembic_1.5.3.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.5.2.bb => python3-alembic_1.5.3.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
> index 9e30cc131..c263300cd 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "a4de8d3525a95a96d59342e14b95cab5956c25b0907dce1549bb4e3e7958f4c2"
> +SRC_URI[sha256sum] = "04608b6904a6e6bd1af83e1a48f73f50ba214aeddef44b92d498df33818654a8"
>
>   PYPI_PACKAGE = "alembic"
>
> --
> 2.17.1
>
>
> 
>

--------------6D8198CA1ADBB20C93AC9C8F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-01 7:45 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210201124516.30135-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.5.3:

- Changed the default ordering of “CREATE” and “DROP” statements
  indexes and unique constraints within the autogenerate process,
  so that for example in an upgrade() operation, a particular
  index or constraint that is to be replaced such as for a casing
  convention change will not produce any naming conflicts. For
  foreign key constraint objects, this is already how constraints
  are ordered, and for table objects, users would normally want to
  use Operations.rename_table() in any case.
- Fixed assorted autogenerate issues with SQL Server.
- Fixed issue where autogenerate rendering of op.alter_column()
  would fail to include MySQL existing_nullable=False if the column
  were part of a primary key constraint within the table metadata.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210201124516.30135-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.5.2.bb =&gt; python3-alembic_1.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.2.bb =&gt; python3-alembic_1.5.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
index 9e30cc131..c263300cd 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb">&quot;file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;a4de8d3525a95a96d59342e14b95cab5956c25b0907dce1549bb4e3e7958f4c2&quot;
+SRC_URI[sha256sum] = &quot;04608b6904a6e6bd1af83e1a48f73f50ba214aeddef44b92d498df33818654a8&quot;

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

--------------6D8198CA1ADBB20C93AC9C8F--
