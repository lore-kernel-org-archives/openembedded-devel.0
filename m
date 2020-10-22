Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.58])
 by mx.groups.io with SMTP id smtpd.web10.1319.1603410238073494129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CxX2tOkQ;
 spf=pass (domain: windriver.com, ip: 40.107.77.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1RbycrVCRMH6TsM82RZqXVnt1FJ0YotwQHUES9iNlriY0cYxK5TSTGON+aCs5NXslCDqw4XIq3FMURRxAj5ZPl4T+z27OhtRqvjixTOqml+Pzdarp+cvrHGvSQFe4/qGt1NO9vLhBulP+GJelqXHU7Cjbg6HYYS1nDWDue+GxaIM+AqA3a267PrmjPVXqixIjQnvWtT3/+cGuWdh5TpeK0SZLI1bfoOq5e4voJWw73VTV4NV5VBNKP7TwdiX9KxvLvCmyLZ6gSxuILx8b7B0IOGF3hFyOn9RVRBUm6SIWhZbRSN9Fho02I/+qZAov/YxbQ+wEm7yBg3XC1Hafxwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8vnKHxq4XhEo0gKwfIbJ/XFegJlZ9oXhJ4gSpeD55Q=;
 b=OioFyEChqN88QBA5lLfpIjAC/lJ1oIFJ/C1vMe3wuQjHwZoVnGv18T8KScJwVi3iGRVzT6aSJNlUZROpvnWfcyEDyeJgfrwr7N+5mdWywPhOj/5JPnBnkii7BLlVivRxongmvf0T129J/djV9GpWKGxI6L0IY8PXkJLOqceVY2QOp5A9ltZc4V3ZrPEceW9NTOJXdFsoaeXRIPywn0XGvDrfSKCg+xXjvd/CW5ojjP+N9kvxnDTNW8D/CzYey0H+IXlO425L5V5K2P5yl9z6iWpzfS64pIaN//q4Cdh3jPdW4P0JryHYccyktolDVWFU1V6ydgdow5vIpZuJTOVEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8vnKHxq4XhEo0gKwfIbJ/XFegJlZ9oXhJ4gSpeD55Q=;
 b=CxX2tOkQU9l6mSgLR2iDBpEFVtZHlU9pZjrBqTyxHL6wWea+X0WT+2Hz7sBedBZLrTRcAsbSLuoBTE49hkjUbR8BW7cG/TQfSCGGrlUI3kovlSt51KjBHFSP85wCiKkDpoWUjZnsPOzOgWCl3smYo3E6qVkz02ymkVEDQqMBGHg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:43:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:43:57 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-semver: Upgrade 2.10.2 -> 2.13.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021082530.10132-1-leon.anavi@konsulko.com>
 <20201021082530.10132-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <675f8a27-6c21-5a41-4acc-3b048b21d429@windriver.com>
Date: Thu, 22 Oct 2020 19:43:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021082530.10132-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:43:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3805a76c-7dec-47d0-432c-08d876e45795
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896770945220B444D1E20999F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mO0gxrKpDP70q35Bv5KL+SqO7heb4C1gWVAlYArNUBBGEfZPfqHfnlHrR78fgC4D/IzyVK/d8y4XZeiPIR7ypxApdJJCp66gBW9mjXxsVzaon2sxXzE/xEaYOC28YNwx7YEjSwiXQJ7fgRbsRX7TrGTcGMRZFvSABwIGAdr/HT3HhdqZaR7FOxUViY+0ovTBrjehzuhT0pcUhQsoeUDpLexA3Jex7cyfgHBUPqHfmm4aDTZ3a83Na2rVQ2RewFiITQzCw64Cv5AoCTvhAGqYcxPy0w31gG0wmguP33a7GzxuSzOR02wRp6/g5Qn2dFjkWGRbHJ8pIf6c5DY9yOjS8JRU819nIMipViS7oikWw7J0DSKWHokoNoKJuYekJ6VdDZI9+BVWpVqRQhEXtUl8dvgEW/FinffasUgHw61Rz4407GRVcnNGrsgaDvJXBQC1QJz0z8Jxsl+DZr4yfizDLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8VQkN7B/3Cxw8vC6/Pg/4lehKoAAQj16Tr5yihLQcmx9WAcH1FSUhUSarHA9RMpPeeiURhG/xqzRkp3AmPfqs4Ycff0lfVC4T5s5WOhDODk+Kv/7nuwyVeyIrjkN5Q+4KVd/6hjps1wwjpOwPu2Yl81/OyHl5VS47NVj4bhca8OPn3qcNpoAQ5x/WkOsxuR8FCjXZYNpb4inC1LAzwYT+zKhAk4kpdccPpaNVlTuC19IteL1nNfWrVSSJ5E3Rlv+slwVTW6RTC2fZtmodR9liManigxnN8EOLhCwyjXhtWV3phb6ugHhxpWZSZYgImfcSjDh2xWlWZKaxY7Vn3pO9exHajjbdqAAggH3HHJUUjgzg+wnuEMWiivF351aJQQX82l5hsuOaTahcexLzNmoAMZMiZtlwoSegfZkBFPXDg1TMWKoD3TpggZqKz0ixewHAhk3xcwgm6oGzQt70bpa9WEbalKbpjfK7k3vX7FqpNgHyNSTjMrFzRCN9HU55MwOPORYpg1fYMjYUrVckzXY5sTEA4LrMuZPOKokDTg6VkXXoCGyaBlTW/7GNMBqkgUdDPSLe6XwemO2KQRJWsmcUUI7eIY3cKKt3Dg3ZngOlYOs0xjiUsngkUO4Rp9zDW17IbvW91aH6ojoXK5Afebmiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3805a76c-7dec-47d0-432c-08d876e45795
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:43:57.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7Q0ldcuZ56M5/ng9ps4HAfUQAf1JL1Dev4aYe3+zZsGYy77Ztyf4kLCcw9xNO39qtpozRs2t7/GLenGyRas9WzFFCZm/cqCMHCtE04lr4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------1C468252F70CD347EF7D6C7B"
Content-Language: en-US

--------------1C468252F70CD347EF7D6C7B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 4:25 AM, Leon Anavi wrote:
> - Document how to create subclass from VersionInfo
> - Ensure equal versions have equal hashes. Version equality means
>    for semver, that major, minor, patch, and prerelease parts are
>    equal in both versions you compare. The build part is ignored.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-semver_2.10.2.bb => python3-semver_2.13.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-semver_2.10.2.bb => python3-semver_2.13.0.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> rename to meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
> index 71cb1acec3..8c7c424c6d 100644
> --- a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
> @@ -4,8 +4,8 @@ BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
>   
> -SRC_URI[md5sum] = "3e11ae9782121e8ffe9f8a8b763a8cb5"
> -SRC_URI[sha256sum] = "c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276"
> +SRC_URI[md5sum] = "e98b5fb283ea84daa5195087de83ebf1"
> +SRC_URI[sha256sum] = "fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------1C468252F70CD347EF7D6C7B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 4:25 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021082530.10132-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Document how to create subclass from VersionInfo
- Ensure equal versions have equal hashes. Version equality means
  for semver, that major, minor, patch, and prerelease parts are
  equal in both versions you compare. The build part is ignored.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021082530.10132-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-semver_2.10.2.bb =&gt; python3-semver_2.13.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_2.10.2.bb =&gt; python3-semver_2.13.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
rename to meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
index 71cb1acec3..8c7c424c6d 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
@@ -4,8 +4,8 @@ BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://github.com/k-bx/python-semver/issues">&quot;https://github.com/k-bx/python-semver/issues&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709&quot;</a>
 
-SRC_URI[md5sum] = &quot;3e11ae9782121e8ffe9f8a8b763a8cb5&quot;
-SRC_URI[sha256sum] = &quot;c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276&quot;
+SRC_URI[md5sum] = &quot;e98b5fb283ea84daa5195087de83ebf1&quot;
+SRC_URI[sha256sum] = &quot;fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1C468252F70CD347EF7D6C7B--
