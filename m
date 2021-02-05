Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web09.8082.1612533737797551211
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i9q1zJ8H;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0SQXcrZUfJoL0tVkMmvIg+YoJIUUwqR1aVqpOH+8H2QXwwRna9Qlf14H2yafu8knbH1iMcBkyOSGdiHJjxjF3AtYX4XlLvl58va9XS+QRwCj/sq7S7+tv2rpeikxeLJqWsY+LjFzjkTXik6W3zg8jdc0WcDgiYzJz58OtlJL+jwnEpLjUBn+ZKPNaTj0Yw6RvnPu6ti3vmLiiHhyyA5n7uTOPe9I4om1/Cm9IzM9An0gklt7K3nALvRST5HCnK1aXYwhSX2fcryWddDfYS5etpf8n+HvlQJeiBi24LUVRAWabzW0HqTo0fJxBaYG1Yov7hceqlwFklaa27H1mEcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsaMHEEcqI1l5tKArm17pf+EZfYBaCw6LfygnsV95L8=;
 b=XkE7Z4xPm4wQ2CVZ0I78aw6TtoDKEGPkp7MHzTDM8bf1YSQhXcHCFx0b4+JQpgnTNzfyrOrFW6dCjzw74zWHpLyZYIpM2hu5h5BWyTj4FfUb3NQBD0Q98BFkACDmsoKxwKa4ghXhfsKS4t4GhEiB1gPxidAvHVlN4NzszVFDCSCC0dfaJKFzeMQpFxUy116PG5K8gwTFs4/NbTHucoNGiyaeV7fdVMn8hExgxqXq/+ZwhVWADVjoj4X5/7YNEyJ5LgTIsKSko2p2yv+9Tu0bMe0IOV5RprYMYUEBcGpIzf0C24JxHVu6rK6QRlxzHYXj9uZGuNnkxzTuzxxsypFsSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsaMHEEcqI1l5tKArm17pf+EZfYBaCw6LfygnsV95L8=;
 b=i9q1zJ8HxGUlvM9N9Ey8hzHhIw7soMBnkeBFtjTTUeKfGub/MNh9w/Mrz2lOcGNxUJ/Z0kHB7HYi4hbu9XX4QCIucWRErxuvRSUz0LkgI0VmH+b968ZU+GXAEmY7RvEJY64fLmM5kNtdJU46/Ui6lXlh++D8083QhEI+vv52BSE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:02:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:02:16 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-flask-migrate: Upgrade 2.5.3 -> 2.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202135410.2217-1-leon.anavi@konsulko.com>
 <20210202135410.2217-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e492dbd7-50c0-2959-511c-9b9667af75c8@windriver.com>
Date: Fri, 5 Feb 2021 09:02:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202135410.2217-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:23a::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0021.namprd03.prod.outlook.com (2603:10b6:208:23a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 14:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60419d23-4ec4-42f2-c1ea-08d8c9dea4fb
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3894BF16030B84A649E4EF609FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QSUwTOCLCcQpIRv2qyEAwUzwADms9G5WzxbP97HpvkyhTPlni4aUhPwbDNF9xoLFu5pEYF8ctkVMGyHoLvQCM8/oDRI9BkzAhBDpIbly8t1w0rylmyVx1lUc/SeE8IdzZgLQftGj1IgRuRd7hVjX4C2NyO6U6c/ts+Y1LXrW9QtdXJQ1pC6YDGOvk++lN3OfQY0MqV6G5Su2pATCGbWVblS/buXpYj1AymRDPTPJS3SvfFBNpFTiB0y5YgXPMKr8j6KugdlEjWxdvAzhrKt6ctVCF+u7O77Ieil3BinTMLW5SGLDPHefkcnWw9CplmOSnJbAzz6aG9kzraJtZZ+IJC4bWrXAcVw6OIoS0Mi/dBv+Tt+CvtCOR0lGw1r/PKma8gFlD4fVbZ/HdBLyeB2n2x/c5GRpCOy1F7f7WYwpR2d+qf3FOtajAi0cExspRSWtcM+CDGmeeIwFu7noPdEEvgxRxdFyJ8623KvH3qNFENdEZupQQVLxb5Ayq+9R9DmQnYHvcm3QjECsE2OvlZsReAtwbkyA+mIZW3y/b1YeafQ0FJCe4JNnjr0LhlgDJRYX882kPZOzcpu4B+CVXBl00VYmnBmEyhFGM+eXXbc3xjbopzBDB20DJVmFYpR8Gbxiuzh7q5+DAVmeRIsoV/kLRgvgruB70MSgCbpgNK782V5rJ0iFV4CyxO1KpdVd7slG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bThDazRlSnVkdm8zSHg3TDcxV3ZYQjA5WUtaQ096YytmUXptNmtVcTd5aHhS?=
 =?utf-8?B?d1A0dTFPQ2dnWlVrZXVWK2kxck9PTTRRV1RjS0lzb0taWlBRMC9hRXRpT2Fa?=
 =?utf-8?B?U2ZiK1BGZ05BZlBjYUZpR0hia2wyeVdEMDBpYWE3ak1oR1pWVWJYUE55OFdC?=
 =?utf-8?B?NXNwWWlnUThjeU93S2RYcGRVc0czRFA2OXdvcU1mcHpMUHhyK0FNYlQwNjdI?=
 =?utf-8?B?cDNoVUQ5ZEtUeTZmR0FOSEhlUERSb0dTRkdzbW5GcndNT1ozNlVwL1dmNjkr?=
 =?utf-8?B?dGROV3oyQ3dvWk4vTGFaanRQdjIxY2t3NW5RK2cwWjVjMUloa3gvRUU2TlZw?=
 =?utf-8?B?N24zN1dVOUhULzBmRzc5SkxvRTVOQmtXQ3M5eEhhRzl5QjhHMXlBYkNYRUVE?=
 =?utf-8?B?YWdYNjZvWWc0R3owSnBRS1hRS1lEZkEyaDF0eVJtaFBMelR6U09hSDB1NkFw?=
 =?utf-8?B?bEkxQjBYNHVZV0dMR3R3QVQ3K3Jib1BZV1pYa09CUE9ldmxlVkZVVTNRa3Bm?=
 =?utf-8?B?QkFvMnlLSS9iN0JjOHdsV0ljMmtKZWNoK2FsVVA3WGFRYkU1L2FEUk9TS20y?=
 =?utf-8?B?NG5GSWhpU1JkbWZka1NqdHE5dlh0TEVaVjlPamtBVUVaa2Rxai9NZnVLSVpz?=
 =?utf-8?B?RzlXc2lqQ3pnMWkrNmtub0R3TmlXcWY5dWRtazJzK2dsTWw4YVJKYzFJU1Zo?=
 =?utf-8?B?NU52S2Jwd1JneFVDTkFVc243Ymx6MlhUbThjeUFOZU81WHcyTzJoMk40UVQ5?=
 =?utf-8?B?WG8xNk1NTHJPMXpoM3pya2FXdmpGYXFDSWFIWk9RVWVUcHQ1RGZGQmQrZFhW?=
 =?utf-8?B?OVh6ZnBMa2JqR3NYSXVQRlc1RWVySzIwdFlwblNsdGEvV1ByVFNhYUJ4bHhR?=
 =?utf-8?B?TXRUYXA4VUZoVWd4UlVQSGNjbU1iVUFmQ3FtMFNORVB6WEdJOTBXOWljVW9t?=
 =?utf-8?B?NWpFa2poYmV5SlhCTmZDTWJGTnVOUXIwSVNDNFU1THd3eENlVW1SVUxmMmhh?=
 =?utf-8?B?a1dOS0kwRHVTOTY5c0dkckp5Mm5HRzlWSTlkSE8wdWEzd2F2M2pZSkx2K0dS?=
 =?utf-8?B?MFFJZzZOMjR6YkNDSmd6ekRtUWFKSlk5M2tJcU5iMUg4dHRYRjJEZmZtN0ZQ?=
 =?utf-8?B?dnM3Zk1zSzZ4bWdPRVpuZ3crYlpVL2Y4TUdSU2ZTMzJoSDFsNVE1aHRYaXRP?=
 =?utf-8?B?anJZTnNteVZWK3E5VUt0ZEc5WHN0Qkk2bnY0SFgySWIvUHNjbXdUSnZkcWZ5?=
 =?utf-8?B?aXBTRmxIVTluWHZrQ0laNytsTnlEVXZXazd3SExjazh1QzNLdnc2SHU1aW9s?=
 =?utf-8?B?VkpnRnBQSXowOVdJVVk2RTN0TkVrUFFHajhtbTFacGhOb1llQXl4Um9oL29B?=
 =?utf-8?B?Q0MrWVVFdk1tZEIycFlHUXlCRnZhYnU1ZmJNU0xldjNGVitWcU9UUnFEbUEv?=
 =?utf-8?B?YWVmUDlqcGJsS3psRkorMzdNQTZOczM5MEtwVUNpcWhBL3NRWUxnMFVDNFoz?=
 =?utf-8?B?elRhNHlGWnY3bldjMnE4YXZKU1EzZWt1TmlZV0M2NSswWm1XYlAxUkxRcjJm?=
 =?utf-8?B?QzdxMS8rTkw0clBVZXBic1JJSHA0cGFlbEZYRnE1MGkzMWZQdjJTeVo3dWJR?=
 =?utf-8?B?a2xWSmJtRjV5cmlHNlZVUTB4QWMwcVYrYm42Z2tMcC9YNCthYUgvaW9RQjVQ?=
 =?utf-8?B?aDdMNTdBcnpkZTFZdFBTdkgvRXpLNGhLRHFucW12TWt5RW9DOVlTSElxd0lt?=
 =?utf-8?Q?fWP7ClpKa8FRWE2NvZLVDsbQhL/qxsLCupxAfha?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60419d23-4ec4-42f2-c1ea-08d8c9dea4fb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:02:16.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhcDv00Uj8gD82xaARwfCGTTiYUNO+9+rINqd7rQ+lvieTMFfWYhuJoet12jFyVleWvADL9mgJsAUn8MmtiMXk1QknT7YDaMjbUoAk5cSV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------F7B5DF051D49743C0D526F42"
Content-Language: en-US

--------------F7B5DF051D49743C0D526F42
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 8:54 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.6.0:
>
> - Removed deprecated --head-only option
> - Initialize logger with a name
> - Move import to the top in env.py file to avoid linter warnings
> - Add a note to the documentation regarding logging
> - Move builds to GitHub actions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...3-flask-migrate_2.5.3.bb => python3-flask-migrate_2.6.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.5.3.bb => python3-flask-migrate_2.6.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
> index 54fa1dd97..810f0eb27 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
> @@ -2,8 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
>
> -SRC_URI[md5sum] = "707d4a5fd4e11d3113a1228aa7793176"
> -SRC_URI[sha256sum] = "a69d508c2e09d289f6e55a417b3b8c7bfe70e640f53d2d9deb0d056a384f37ee"
> +SRC_URI[sha256sum] = "8626af845e6071ef80c70b0dc16d373f761c981f0ad61bb143a529cab649e725"
>
>   PYPI_PACKAGE = "Flask-Migrate"
>
> --
> 2.17.1
>
>
> 
>

--------------F7B5DF051D49743C0D526F42
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 8:54 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202135410.2217-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.6.0:

- Removed deprecated --head-only option
- Initialize logger with a name
- Move import to the top in env.py file to avoid linter warnings
- Add a note to the documentation regarding logging
- Move builds to GitHub actions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210202135410.2217-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...3-flask-migrate_2.5.3.bb =&gt; python3-flask-migrate_2.6.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.5.3.bb =&gt; python3-flask-migrate_2.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
index 54fa1dd97..810f0eb27 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
@@ -2,8 +2,7 @@ DESCRIPTION = &quot;SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85">&quot;file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85&quot;</a>

-SRC_URI[md5sum] = &quot;707d4a5fd4e11d3113a1228aa7793176&quot;
-SRC_URI[sha256sum] = &quot;a69d508c2e09d289f6e55a417b3b8c7bfe70e640f53d2d9deb0d056a384f37ee&quot;
+SRC_URI[sha256sum] = &quot;8626af845e6071ef80c70b0dc16d373f761c981f0ad61bb143a529cab649e725&quot;

 PYPI_PACKAGE = &quot;Flask-Migrate&quot;

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

--------------F7B5DF051D49743C0D526F42--
