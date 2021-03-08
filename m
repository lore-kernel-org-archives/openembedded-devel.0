Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.43])
 by mx.groups.io with SMTP id smtpd.web10.35715.1615212149383442236
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C3px48Sz;
 spf=pass (domain: windriver.com, ip: 40.107.237.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aN2O6K7Ti/heWSagi6LMCjR1EfUTDRi7aM6FVlxN6XTwlQfkTuyIJW++MEHuf5JddYMq/8eYmIYvjUP0O8KnevLO1D36tkYPF/EDb6upEPh7UrtqD2r+JYAzNK7dRqIeQBwNB9i5Noa0+2yGUBqkTBUMjo4DklUVEr5/CRfyLlWDpDTiX2+fo1X3LngZRSGwQbg2pofOFHx7+vzPwT/FbWfCbCSTRh+h3PHCRmwQ5+XjYz8QFNP9VbEoyiq90vc0ZBGxM46Ql3LveNUyI1AKI2Upw3W+GEXvdNMpXF7DMmXkP3OozcFWVeVy1DukF31x0mMFVKzeZKiQ9+K+huOOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlYSuAbKKPRtVF7MqAdrp5ll4cdiJpln0mPeVIXrWxc=;
 b=QySSkH1QZJL5TaYH9tUsSTcYyln0GJ2TolbCX5MlFdLbphK7YmemCiHJyKVaJhsoDGMkV9eXVjUJDRxJoKLeZwXkT6f8q/Y8OkWDuszwxR6VCZSDMG3zTS2cxSJIx5GM5qlWw8dAKD4F4b+dD9pe6f5hrwc4Z7Y4ZPXJTp3XIapGKdyYIavVgg+LZ/Q01POXSQ0DYCHIcPgofFgjmHgO8CbGtSSYamVlDARyEo5KdOFc9B1fJ0sFAAx+P7FRqEWl7Emo7E8LqkcXSmHB8R6ehaBI98h9UyzMYcW5MZF/yT/d93cYkr1ryPqGnwkjNppIuVn7XGRCzWQyrEnOFiMing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlYSuAbKKPRtVF7MqAdrp5ll4cdiJpln0mPeVIXrWxc=;
 b=C3px48Sz9cm9Gn/oCC55r4n4z8qsh/EKuQBfyHqeawniYNHk9tSQe8HkADWvk1QjWS4WQ7+uEXYGGnsks3HdIl/HjB6UZ4YCpbY8V+8kLkaTpiV8qsZG+j7yALhoaJZqfjlZbbjUyUmk4Ee5te2YgTV+tHjjmCOxHP+5VKlGPlI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:02:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:02:27 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pep8: Fix HOMEPAGE
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
References: <20210302132111.1644601-1-andrei@gherzan.com>
 <20210302132111.1644601-2-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dc0ba849-9b11-6247-6b02-4dcdfd152dfd@windriver.com>
Date: Mon, 8 Mar 2021 09:02:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210302132111.1644601-2-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:208:2d::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:208:2d::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:02:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a48def3-1565-49d3-87bb-08d8e23ace98
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103D4EF13E4FE5A19DD67569F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rLi6s+YjqTSUYV8RN3IaXqW83rMyGqpBkV7MIQrzFhinrsdsw9QL1ldGV5hx9uiTYPp0x+5kv3+5fBzzCyirikboFJoGFM8JKBDmH5S72UXRV/tufNi7ijM0liFxQajF1fipMcQmSrNIh52Y+xux5HvRmxeqJDHyOTB1XxPqQ2mPgrrrwlCKQAUYAMi+VSwaP9r2IhZF+kBswKjlDG8yh07EoozUBJg59EMnNKczfshqiKf4ZC1lzM7ivIYlDvzElBcjN+Ev1osvwYLrzatlRXUEG+8dWe27H9Ch/wQHuC0FVBYqq9t8qFqgsGCq+fG96tKXUN7QXxHRkVUxtsObnRYJUUxVFPidUhfeiVrHNXgf9to9q/9JvZZ4ch21y2zKa8IftgGW8xG0GgJeIAWkrZ1Sc91CyrAAtox4dz9dsw7chkHwgBf7BA3DsDDErLrqZAD4fnXK1oDMIymWHQ1MGbGNN6JcNhnn38IQSHhPcoYG+Btkd19O3157E2Sm58PiVG137rPDUYEQsgTBavF5VXaW+wTCXmUmFuu4A4+MXWSvOqhpIMfxl0C25nCD1yQ6xpJXUXd6ygSRGcnLkaqvF1IrMGdjGHdzc9TIuPYRXQ29byo+HogoEoBP1Hd9IOzQMuAunC6o5iXvB2hGvzXe0KVvkB0EMvQ+4zWmvbX7PYVMJtE2VdKx585x8MS2n9HX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZlNQQ2x6c3hra2FTSytMSWw1SjlEVGZGNWxxUnQ5UEVlU1U1aHdZRzhhY0x3?=
 =?utf-8?B?UiszMytoV3NoaDNzb2ZGZGlWNEgzRjA0YzZtWEVHcFFQNURhN0hLTTVJYW05?=
 =?utf-8?B?a3NPWDhHa0RVSjFHbGdQNEsxUU01VllwVE0yNVJuclNLLzZ3RmdIRkhzenV5?=
 =?utf-8?B?MEE4RXh0NXplYTYvNjFNcE9PQnhBRkkvL0ZuQ0RkbFpmUDhLVERTVkFiZjND?=
 =?utf-8?B?eXdFYTFJSnlJUkxzaklHNmVtamIvajRaU3BHUDlYRHEyT2Q1YnJxVUkzUkI5?=
 =?utf-8?B?WTdFdzcwMHRjSWl4Mnh1WjkyWEloa0FQbWViUmUwNXJKUVIxYk81dnZiV2Ur?=
 =?utf-8?B?NFY1dWhmNmJxQVU3V2E4WGdNejJuTTF2emtla2NwZGZQZktVNkxWK3hpQWJC?=
 =?utf-8?B?SVVqWENweTlZWlFEZExaUTFFaTVxK2FHU0p4SWg2MkxPdFdmVmdGa3RTZkpa?=
 =?utf-8?B?bHJFeEs4MlYyN3d1Z2pDTVhsVkZiRFcvaHBQR0p1cFFYMzAxa2lKa2h5ZXVC?=
 =?utf-8?B?b01iWFN2bHhuWnpJLzlQaXpWajlQKy95M3dxZkVaYnB2UWtxdFV6VTNMeFI2?=
 =?utf-8?B?ZlEzeGZ3V2JjUlhiNUw0SDBGbEsrSWhjU0FwWkxyZ21pclZYb3krN2lrcFJU?=
 =?utf-8?B?SEQ3b1Z6Rnd3UExwUFJubW95NWVhUEJYQlo0STd1RUNteUZrNUt2SU5iY2s1?=
 =?utf-8?B?b1VDTEd3N29NV0lqOUhPR0t2M2Z1cGU5SzVlMUZEU200SXNFdkI2TmdWM2s1?=
 =?utf-8?B?UWlJa01mN2RTWEs2aFNmclp4dnVmV05oaEtCODhEN2VPcGJwS0ZCT2l0VE16?=
 =?utf-8?B?bFFNYitlZHlzR0tzVk5zOEZTOW5Fc211c3EwQi9GVmVWdTNHc0RscnNUNkYz?=
 =?utf-8?B?NFQ2ZlRUVlBWYmlZUVh0M0dveU4yaGhENEFvakRkR2hpMExhSmc4bjRDaHo0?=
 =?utf-8?B?aTZYZWZrQXZUQnRFZGpNeGQ2Q1N5ZTduSTJSQ1hWNlFLT0UrcktTalYzVTdZ?=
 =?utf-8?B?N1lVcDkwUUJ2ajNWWkpWZkxLcUp2VldkRmdZUHk4R2hKdWxKRGUzdVhGSHox?=
 =?utf-8?B?L2J0YWxOaTZZQzFVZ1NPaGFqditKejA2MkR0OWdYRHJEd1l0S0hqN0NzRkxy?=
 =?utf-8?B?a21ibjBuYUd5UjNCVUMzc3UwczlBTS94Zk1XRmVmWUlSSmVWLzhPQlFuUzBX?=
 =?utf-8?B?YVpKa2hWcDBQQ2RhanF2amtGYi9lZkJ2dWNCTU5RQm9KaktiNFZnUExvVnFV?=
 =?utf-8?B?bUxLcmlEWWNzdXB1ZmlXbUh5ZGJSR1hNeHU2clZPRXcra1FkS1FpNEh2cVNm?=
 =?utf-8?B?bmRkWkJjbzFSaFlhQkhqWWxNVDZvUHVwM1cyYmcxb1JtZkhzcS9IVUNQU0xG?=
 =?utf-8?B?aXdEbnExWS9YcWl6NExWNjZIQnJ6MEV2bUNkVlpkUXRlcytaSldJajVJcFZw?=
 =?utf-8?B?cnhyUSsxVEhlUFdNZFZuankxK1E5SU1lUTltNDFDUXhFMnpQK2JEdWdCSko0?=
 =?utf-8?B?SFdrY2xsTVJKdzhhTGMzVldtZkk2NzhiYU9WMFhHTmdkaVRTZDZLMGJEeFVi?=
 =?utf-8?B?ckNUNHlRdTZCZFdET3h4NFFBcGJHNjZpazBEUmhML3F4d0NMSHdHUUpadVhN?=
 =?utf-8?B?K0dKZlg5eHRWS1AyZldXaW1qQWk3R2Jvc2dOV054N3lEL21sdGh6QTJSTWI3?=
 =?utf-8?B?YWdjMWZ6RXBZSmI4SkorQlBFTWtRdW51TVZIYUd5bWRNQ3ZTNGIvNVBadUI1?=
 =?utf-8?Q?LG26PxlH0mVfeASsWYePo3lr6J6XYbPNN9K8Psc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a48def3-1565-49d3-87bb-08d8e23ace98
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:02:27.7297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXSnLfOGxPUcMFWHEhWkwjSdI+oXYG7XO1hGau9SHEvzBGFATNxbdOWEY82bYmMgSfIX/0+uWOdkCPH8nYMgTJDbZLOhKGSEmycfTHm5esY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------C1B3660E6BC35390808A8F27"
Content-Language: en-US

--------------C1B3660E6BC35390808A8F27
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-02 8:21 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> index 8291281ca..e8587c832 100644
> --- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Python style guide checker"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> +HOMEPAGE = "https://github.com/PyCQA/pycodestyle"
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
> --
> 2.30.1
>
>
> 
>

--------------C1B3660E6BC35390808A8F27
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-02 8:21 a.m., Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210302132111.1644601-2-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.com">&lt;andrei@gherzan.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210302132111.1644601-2-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index 8291281ca..e8587c832 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = &quot;Python style guide checker&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/PyCQA/pycodestyle">&quot;https://github.com/PyCQA/pycodestyle&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e">&quot;file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e&quot;</a>
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C1B3660E6BC35390808A8F27--
