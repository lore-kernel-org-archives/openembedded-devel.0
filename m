Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.51])
 by mx.groups.io with SMTP id smtpd.web08.1294.1603410319505940193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UJIQvyt2;
 spf=pass (domain: windriver.com, ip: 40.107.77.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrUJ6eqktQOjjDC6o/MBvM6gY6fccBoz1oXyDUMrUFssHCPSRydlU8z+P2jgdIeWdG557hKFl7wJI4pLNPHi+rjfMuxj+hgjvJEHYWRD+L6q/WmMEO7H+prbT5/ImtY1aPhCzYI6kXV0sequMyAstxReTWwC454M/zmG2jt85Dg39rOHRMsuTFO+G3KKB3Prrg9z/zvrq2g8zKa2mAGeGpBi68R5ch/25Heyeyl2/ZIUUY7J6xCQZSThDdzW9DO4rr1RbXy+CH4wGnudO4XzC6NljJfCOwL1QglLdTurqKw0/YZpjoYTPSucKIMQSwPHm4t9x1/VWh3wVORkL05JEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgNrXnOIJ/oVHE5VZ0K2V1P5TRkan1jaKnEJioWPtWE=;
 b=C1zUMnuJvdjfW9y8QDaXS8v8WtrHLjq4uitX3ygPyY9rbQMFLF3gM3dSopEqIHxWtJ6sRf/bQzIqTj58wqL4Nf6Iu4aX3388CiLNfeVjPRH1ZKDgf0IAcM9Xh7P/896B3hB/h42nySsvLLh2nBdOb6KrPxANbrQtqcQInwDyQtLyjfVnA6otpWsTAmqSAZjTGBCbm1RlLmKxuSbDiVDSqjJb6m3bhoH6QG9phv6NZrJPX+JyvvzQ7Rfqhnx8chDWaj16IJYuPKqH3naVXxwUwC+Ywryi39S5n7AzhB4DUSs33SCR5efmUZTX9jprVmZk+HC/xRMDiQIwYvem+/WV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgNrXnOIJ/oVHE5VZ0K2V1P5TRkan1jaKnEJioWPtWE=;
 b=UJIQvyt2KArS2JfCcfSu8RXa88yaOt9sxVvNF7VEX+FBeekv7/UfVUdwAL2nBJIj4JTNmDJSw+IzvekrUYP2Z2ZLNMaxGsUQguSyzU0zPMGeSl8u6h82NxkqKG5jKqlMufUTFm1sPI2XSrekFED7I/i50kETOE6ZZMcjCaV4jAg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:45:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:45:18 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-pymisp: Upgrade 2.4.131 -> 2.4.133
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
 <20201021111609.28237-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1d28acb3-216f-1b8f-a5c3-4fbd6da6388d@windriver.com>
Date: Thu, 22 Oct 2020 19:45:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:40::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:45:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f46f1e-68b9-4753-feda-08d876e48840
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48968A63D197AC565984513F9F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IqptLsKlEryBWP0gk3pjwFQPmOf8kt2QlYsqIQubvG/ZAWTVirc7P4Qeybi7FoA8Z8SI64uQuYCD8F5btf/n6E4ml2g2dW4/K+hpG4bIfrsCt19DLmxvkFszmBKBG/sxKP2UmAHPk2Rr/6peD/LwtAYmDeW5bpcM768yIEYsyEPhGOTJ5oSNn5c7hxiyc77+15D95m105vx0+AF1IG2SnIPLNjUKjahL+fCZhniXW6KKwPLAhEtowBJEKm4MWybY7ZdQ9b+IX3tN8TZyYA+WAheco5neQkPKps7sqK+pZvTkOkO9JwTGJCJroH+NAMtKMo5/fN5iSkSrMExlkeIi76xjhsQLk88GhMoyeDMmpSqmjWV+YlADz20ZlZDx/zAZkvJGSW4P8uaUseAgyb7itH0w6xbtUb+QdbHGIThIzrlwQquW34QP7cEEdhR6xhNiD92RHE0snQERMA48zZ2uBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tR/vibcxNjvEBC5bbRNazCszgCQ48YseKIsL23oLlQ9tj7mnOHVury2PV1H0A+EDn1cr29xy9WGgy0XUtDQ9wJ8cMeQx+eVfv1KkhsTNLXWPzIQkIw/EB50ADvVWSkitBrP1WxNHEJA5SEIkTQ5JbIU+ecdgFEPnYG7D7weMdXDu6xStwjQpeBJqL5axyZx86iz+wXXqIhj4M0fK6iVoCpRG0xMKEDkjzxue3/tyVBHfyxyzFJxxYN3Cv7uj8jA/oRhTnFdbzPug0aVSxM0mkzrf+AVllU8W6JtiFT+0e3LTOJvPwDIQdiaGp+r6LMOJnsZppfLrbcP7Sfb27t4Z5PpY2e2LOrpZLQulLRuvZUp9Unu0hyTSS8z7oCgwzbRIpXVwgfqyG2C3G0c2Kq4knlQn6eBcKqZusgO1Y4WN14PqDNFkFAW4ddtxePv0hoJyG68g3sDlFHKMzjJmCg3XhSmiexgQHaui0JLfg6zTfWbiTnjRqSNw5etD5KxIfnLMabetZq760igjFZ7sTko/Z0Nq3wh3zPr9+5NFHmeMV0vHGKYrbGb9lEXboKSZaiPbT49gdBxXQwRcZMGBv+fX/ICjW+7l7kZLUUQByzGJ4/0iEx14/W4cTV0Z0X/MF/N1NqaOrJXkiFRpMa7mP6c7VQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f46f1e-68b9-4753-feda-08d876e48840
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:45:18.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsbX/64TfZJrYR6LnxM9euiZweEtMpg1qzbVdItc5IvK+s8KlBqZ56uUYKXtbidN2S/a4sIbHvVVPHeSUwMnWDB/kmuE3EAkruVLEPjBzhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------903876F24A16BFA3335458D7"
Content-Language: en-US

--------------903876F24A16BFA3335458D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - [attribute type] telfhash added.
> - [add_gitlab_user] new gitlab user fetch script to MISP object.
> - Bump object templates.
> - Bump changelog.
> - Bump version.
> - Bump test cases.
> - [type] updated.
> - Bump file obj version in tests.
> - [data] misp-objects updated.
> - Bump build system to poetry 1.1.
> - [type] new type added.
> - [add_github_user] add ssh keys of the user in the MISP object.
> - [add_github_user] more fields added from the GitHub API.
> - Bump deps, objects.
> - Add test for delete=True in get_event.
> - [add_github_user] add following to the MISP object.
> - Bump dependencies.
> - Pass a list to add_attributes.
> - Use MISPObject instead of GenericObjectGenerator.
> - [doc] add a reference to the license.
> - Add docstrings and extend conf.py for RTD.
> - Remove PyMISPExpanded from the docs.
> - Add comments to ELF, PE, and MachO object generators.
> - Improve error message, add comments, rename whitelist to
>    allowedlist.
> - Remove SG search for search() func as this doesn't support SG
>    searching, but the index does.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymisp_2.4.131.bb => python3-pymisp_2.4.133.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.131.bb => python3-pymisp_2.4.133.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
> index 82ab80314a..28a24fed55 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
> -SRC_URI[md5sum] = "8844204f8b059ff2fc508ba9ac07dcb2"
> -SRC_URI[sha256sum] = "59adb7ee95bfb1b5c35abbc01b5372df7327baea4a8df9efe30140ea64b73c18"
> +SRC_URI[md5sum] = "00e258da18f59845687f58389a2e8e12"
> +SRC_URI[sha256sum] = "4a2a8a4da78c6321550522d5cf1575c095773d0867c0a4f5157a658f6e1994d5"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------903876F24A16BFA3335458D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- [attribute type] telfhash added.
- [add_gitlab_user] new gitlab user fetch script to MISP object.
- Bump object templates.
- Bump changelog.
- Bump version.
- Bump test cases.
- [type] updated.
- Bump file obj version in tests.
- [data] misp-objects updated.
- Bump build system to poetry 1.1.
- [type] new type added.
- [add_github_user] add ssh keys of the user in the MISP object.
- [add_github_user] more fields added from the GitHub API.
- Bump deps, objects.
- Add test for delete=True in get_event.
- [add_github_user] add following to the MISP object.
- Bump dependencies.
- Pass a list to add_attributes.
- Use MISPObject instead of GenericObjectGenerator.
- [doc] add a reference to the license.
- Add docstrings and extend conf.py for RTD.
- Remove PyMISPExpanded from the docs.
- Add comments to ELF, PE, and MachO object generators.
- Improve error message, add comments, rename whitelist to
  allowedlist.
- Remove SG search for search() func as this doesn't support SG
  searching, but the index does.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021111609.28237-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymisp_2.4.131.bb =&gt; python3-pymisp_2.4.133.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.131.bb =&gt; python3-pymisp_2.4.133.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
index 82ab80314a..28a24fed55 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MISP/PyMISP">&quot;https://github.com/MISP/PyMISP&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>
 
-SRC_URI[md5sum] = &quot;8844204f8b059ff2fc508ba9ac07dcb2&quot;
-SRC_URI[sha256sum] = &quot;59adb7ee95bfb1b5c35abbc01b5372df7327baea4a8df9efe30140ea64b73c18&quot;
+SRC_URI[md5sum] = &quot;00e258da18f59845687f58389a2e8e12&quot;
+SRC_URI[sha256sum] = &quot;4a2a8a4da78c6321550522d5cf1575c095773d0867c0a4f5157a658f6e1994d5&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------903876F24A16BFA3335458D7--
