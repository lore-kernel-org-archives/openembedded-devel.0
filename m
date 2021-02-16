Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web08.7220.1613480355650207743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I969cuJd;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO6BBn+DP5YD0Z0WR/cE1S/dgktVHIaH6n6NXYC7iPUbg9yVoNVTSIWl8MiOtQu2d1HadKpu6WVBBowxLdneoi51+B/L/ARjTIpWRgnV3ZQrsPqktsFI+WCUpsV51+TCVioYaQ+6SPqmz93nrX5VNPtsUve8mA/vmUcgOeeXr6pFjtuoXc+ZLjI2cTyKXXL5PiU2yz1f7od6oD+LQiAt3t9addouDN/WBgH7XRaj9Z7gcXRFIXurqJTTAxYwvLvKi9Se5Ocb7RIExLjAEb3NN1nDBwVwOJS+e/5yx3EPke4IgA4FgJ1f9opB581NwHIVtqXH4ZMlR2HFTWVkh5xIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZe1GIUxNE68Bzp7tuuMJqUXhO/pXRTPk2jkrqr4TpM=;
 b=Xy+vNG0O17orZNs7I+inZjdnWGiJ/CpecHhJLuFCUe+ZCzy7qgPJJwCiHR4PWwhcUZ5hBun69O1eTntNlYL8vJBxvcDuFN2RqoIF5vIeuhacuyb7EmBFceK6IYUwdQXZh3ivqRJPDcTBRIy0KD93jgfKn7Ls4ln87gfGv+PfxavIfvYAJBDpmG+lAl9eYrqU/xScpAF7Pl2bImLopIOA5FP7SbohP3Y5Zox4JUTuVQB8arGETQDibgX5eOtNpEyNH+dOUg3p7BSzR3/cd4iNSWrOtJ9ncvnRU/kTj+XUxVMcEL0FG6ubdWL/h17BG3zMioaxQz3HkE7/lKnQgK3zVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZe1GIUxNE68Bzp7tuuMJqUXhO/pXRTPk2jkrqr4TpM=;
 b=I969cuJd7XavVeIrYhWJLy4Z+9p3Mi7/oXesJpv8dGPIVMrDoVJgw4N1XH6LwvCihfWEnAQ+QwJMxlKO1sIM4SavqBHh2odoj07RKQyXgyKPgFO1f2u7a/xEmI5wVITEqFW9FlC/RaNK9M6RpSvKTwIux5Yx3UEDQcVgqhaO0Hw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.42; Tue, 16 Feb
 2021 12:59:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:59:12 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pykickstart: update to 3.32
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210214011929.447131-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f5b50643-2797-ee06-a98b-7aee0799e107@windriver.com>
Date: Tue, 16 Feb 2021 07:59:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210214011929.447131-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:408:60::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Tue, 16 Feb 2021 12:59:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f522c99-0750-4fe2-ac26-08d8d27aa80f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2631:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2631468FA7A8BA00067B67AB9F879@BYAPR11MB2631.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ITqpYc7vzfuG7lKt+6K+PO/eV+TiNYWEwGd1djhg4oFd0AuK6t4q52q9XPAMNULUoOPOj39tEtNxJsz3MajJSXpiw0YIXWyNdpnRktwkIOKmJ8GMucKE+5Iasn6nu75/+Ll4Q/jrl53msARNpuoGRnRN4p7RdwdWxCB/NMxECvYpTPw17DB2PsmXVasmpzOpaZB3nQH2wyvh0sdH9Bs1/hWAqkbUwqxVL3E3Mh5ZS21nR+L3CGxBsqAcaQxmWSFjV9iz6jLPa7w3dhj3Ok7r0MxKno9+XYL+6cTOho/VdkV5L9EzBtzLZvTw0nJoD/ib6sfQO5lrdEOOULBqHlaYZhVWLHxnYb97iRpReCHfNQ2uwpM6bmRzlG2BwLpBtOyDcIa/K1Zrcz9LI41heCaLblnvR73kTWJvunffIRjHavmJ81rmZfE9YaSY4evkOH7RhEQo7eEepZ50f/E42w5A78xun6jU+GWXn2kI4BqhwgiMZKy0iVRepfOpcHRDsN8jXAmyferGTatShZN6sa9kOY6SX4+6SLqb5lok3vAixXHkfEJIrg51MKAMV8+JW9VsEKoJDCn/sTtUKYi5QpQ7Ef9QVfCtJM0HDf/r/ZS55aYrmHSfDMELP/ewD0jdEPD3J+ci54VDmZa3X0qvZtPrMIzx0iqPM/h5/MrNbCg4cRYErqNlPq/q7jxrpIloaQDD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(376002)(396003)(346002)(52116002)(33964004)(31696002)(8676002)(83380400001)(166002)(36756003)(8936002)(2906002)(15650500001)(6486002)(956004)(31686004)(44832011)(5660300002)(66946007)(66556008)(66476007)(316002)(478600001)(16576012)(53546011)(966005)(26005)(2616005)(186003)(86362001)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0sxQUY5eHNuZ1RMcldXWnZTTzJ0QjhFcVNhLzM0Wms3ZjAzTklSU29FbTF2?=
 =?utf-8?B?ODFTM1pPN01QY01RL0w5Ym5YU05DUDlESytIaUpGUzNBMVJpYjgwd2ZiUEVI?=
 =?utf-8?B?VGt6Mk9YSkM5ZnNJanlmenhMWlBUZkNxNnVUd0wrNGlmeU1DTlhhRFhyYWNY?=
 =?utf-8?B?N213SHcramZ1QzJDYk1zSENMenBYd0FOV0d4UERaSXZNNnVmUXh0NXNadGZD?=
 =?utf-8?B?THZDZllDU0hZcHhKR2xnWUdLWG92ZGJEV2JZRmJma2NIWGpiWFhna0lpRnEw?=
 =?utf-8?B?ZE5MVnNxSUxJZm8wc2pCL3lZN1BXU1VDQUVNd0l5U2hzcjRob1FnRW1Rd0hD?=
 =?utf-8?B?VDA3ckNERkFYOVRaYlRLeDhlTWs1VlVCeFROT25sMC80UUswQWRkS2RwUklQ?=
 =?utf-8?B?K083S0dtWEo4dUpuSUdUNmdxZHNOOXBRamJYbWVadEFzUEdkS3hYNGdMQkVC?=
 =?utf-8?B?WWpxanlPQ2JvZFRWVjZMUXBnanJVS2VrYXN2RzB2cDU2bzgzSGJDSFg4c2JS?=
 =?utf-8?B?dU1aS0tMdk56RTRNYVVhMmxkZVlMZWhBbHVpaTlUeEh4YUh6V21PR0s5bzNJ?=
 =?utf-8?B?ZERoY0VTQmlvcjdzQ2VhYTZVTnpDdVR4NnRDUkNvWmR2MlBUL2tBb050M3hj?=
 =?utf-8?B?TGNUNTFyN1M4QjNnc01wbDBtQlB6Qlc5ejRZMThNQi9rQlJmdnJBTmFvM2JZ?=
 =?utf-8?B?alR6c1FiWWVFQTliNExEWjZiQng0ZkZWVFVFNExYZFl3OGtBUVNsMzVON2o0?=
 =?utf-8?B?cmViNTFybjFSaEV2THp1cFFSTDdsMC81OFdxU1g4NmVneWhCNGNkajFjZXRj?=
 =?utf-8?B?dXNEWThWLyszSGthVlJnUTREcWxOVGRXUDB1QUJ1MVU1a0o5bWZMTFBmelBn?=
 =?utf-8?B?VDVjdGNqRzl5WnBQVDI0TE1ZanpxYzh4UzZ6ZWNVUGl4cytGaTVaVTNMaENO?=
 =?utf-8?B?Szk3U1NQeVhIMDYrZ0tUR1FiMGpoOVNpVVc4clg3Y2tiTVJWaTdIRUFTRlZJ?=
 =?utf-8?B?VytmdzdJcEt2UjlFUGhRVmVHajE1RTJ4Z1o3ZlNrN3NZWkJnOFc1bUNJMjlT?=
 =?utf-8?B?RnNST3FIWXpZYm15Ri9iSU9tYnYvaXJxOU5uU0lMKytjc0NBRFU1M3c1VGxW?=
 =?utf-8?B?Y0pXejFQY3V0aUZndnFqTlNjREtWTURReXB5U0hZaS9OQUpvVEFxOWFkY0tz?=
 =?utf-8?B?WldVRjYwTmlNbkh3YXFLU2hnbjJTSlBTWEtpelVtR3hyRkRiT0xkTFNnOHc1?=
 =?utf-8?B?Q3grWjJNcXhNYk5rVk16T2xmaDJST0RXNzFaVEJXb05sdjhtK3ZQekhNQzI4?=
 =?utf-8?B?dU96ekx0OW5UQml6QnF3YW9sdVBkSHdWbFkxL2Z2Q3RLS3JNc1AweFhzLzNH?=
 =?utf-8?B?ckJSamt2WGd5QmpmRWorQ3YvakVHRXFzMzd1Wm5XR0hDeTU4ZlFOU3JGYUNw?=
 =?utf-8?B?V0F6ZmIzK1BmNm9FRjRkYnpOWW1jTVpHSEJoVTZDRnU5akZsRkYzcWZtdURJ?=
 =?utf-8?B?T013alRkVUtOU1k2NzVXL09tYkI4QVRONmF5dWJxNUFaVHIxNUFrNyt3aVIw?=
 =?utf-8?B?UGJkcGFWMERPMjJydWJmd2lTSXdLT1Z3R1gwS3lPd3d6NC9ZS3JGUlJtQXBo?=
 =?utf-8?B?VEk2MkJ0QW1ycFcxMEIrZU1MTVd0a1E3WlF4RGdaRS9ZNE9YVkgrK0JxRnY5?=
 =?utf-8?B?T0s3dDNrZnRrbC9oaTJzM2JjZzJXeFhMMmFod1I4QnkyYjF5aTZtamxQN3VW?=
 =?utf-8?Q?vudM9LRqKDhcK3B4ITVVwgd3s5Kepi5BU33J6n4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f522c99-0750-4fe2-ac26-08d8d27aa80f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:59:12.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWUM/QsQ15L2wd8AVTVXi/DZ3l/H2d6vbI4RdkJ7TvTZH7uytNKUNYVEmScVazWlPwfT4fzPZ8RgiEmfLlKuNyvdwiUtjb1v76xhd97FCyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
Content-Type: multipart/alternative;
 boundary="------------2A261E1398E71829808339FF"
Content-Language: en-US

--------------2A261E1398E71829808339FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-13 8:19 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pykickstart_3.26.bb => python3-pykickstart_3.32.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.26.bb => python3-pykickstart_3.32.bb} (94%)
>
> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
> similarity index 94%
> rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
> index 7aeb5d6c9..62d2729dc 100644
> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
>              file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
>              file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
>              "
> -SRCREV = "4c93e84c8798da511da1c05f1912d2f908f8f85f"
> +SRCREV = "c56a5fbdd4079b187b21787f072ccc83dc09c28c"
>
>   UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
>
> --
> 2.25.1
>
>
> 
>

--------------2A261E1398E71829808339FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-13 8:19 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210214011929.447131-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210214011929.447131-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pykickstart_3.26.bb =&gt; python3-pykickstart_3.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.26.bb =&gt; python3-pykickstart_3.32.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
index 7aeb5d6c9..62d2729dc 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
@@ -18,7 +18,7 @@ SRC_URI = &quot;git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            <a class="moz-txt-link-freetext" href="file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch">file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-load.py-retry-to-invoke-request-with-timeout.patch">file://0004-load.py-retry-to-invoke-request-with-timeout.patch</a> \
            &quot;
-SRCREV = &quot;4c93e84c8798da511da1c05f1912d2f908f8f85f&quot;
+SRCREV = &quot;c56a5fbdd4079b187b21787f072ccc83dc09c28c&quot;

 UPSTREAM_CHECK_GITTAGREGEX = &quot;r(?P&lt;pver&gt;\d+(\.\d+)+(-\d+)*)&quot;

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

--------------2A261E1398E71829808339FF--
