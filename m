Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web11.10474.1612879406650807498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HVLwomwN;
 spf=pass (domain: windriver.com, ip: 40.107.243.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG+95XdC5+4jrO8oyYM0ixjRjb4j3prz26NHV7EPLBmRv7pofNIZe2/4yLfgjyEifChJVqDgD77Z6vwq2LEwlS5cp2zsB4F/e/DCSMCoveX0tbc2PfVJYSeEuk2c3E4WtApcDoyC4JeaYrtMoV2oCQ5/0/jl7kr9ZWVd8HqLMx8/UlKpGaWUQD17j9/D0KEAXNXMy/AMpVg93F1Q963ILs+r4CyTjKRzgf5EsuKehHzgy6gOQ6vBWp1xBjPBYi7EOSo1ovUsY0bUysNvacKiasBpdXzOBnkxkCj5/W46T21rQCwY2Dzf0377KKULxkESCZzT4wiJaPpkX+AynthKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvGHQai297M50cMRs8cFrGX8Rw2PsT4p/nZ4hmPCE1U=;
 b=V92tgS12WmnrCO0O28adiVUo3yeF+4RsAdpn8eXacIGeDVE1ixwCkfvCYEfM9LVYLhrXqpbNboVYZXk0QLN3iYtg+3mDWe/Gllp7jkONfs/l7NBnubrayCtHHjGXKZC7MQYVOsnB5f4UZD2Gaa//PZFEWvEd7TylrLrRxWY5aUqlw4Y14A5Soksu7dhJSmIne15+8pcpIlBazY59QavEPf+fRrH9IKlODDQWM3pKnK/BQo/COdeWnQvG+tWE4YN09IDMBMZV39awGwVnBwb5NlOHqcuLejXPaVACEy4iKzEYrsu9ZtlPWHcaiXLzatdVa49kkvvqB3kSBYIaoGqXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvGHQai297M50cMRs8cFrGX8Rw2PsT4p/nZ4hmPCE1U=;
 b=HVLwomwNWbzrx6mTROehpnCi+XVhDTC3rgiKFAb+VKe+HQjb/nTTAtTHebb2f9PVLTftdsdqXlgF1Lh6uxhYt+/n9trQlybgiTI0xEHtMzUqCYOXG1R2JoRQt2/c9JAyrFnYzUxclHPF0ScL3Nv2hffUHFrwe/gZSUZMrR9lKvk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 14:03:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:03:25 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-aws-iot-device-sdk-python: update to 1.4.9
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210206230435.4106978-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e1d64056-59ab-b8e2-ff73-9dfe9d2cb728@windriver.com>
Date: Tue, 9 Feb 2021 09:03:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210206230435.4106978-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:405:14::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR16CA0047.namprd16.prod.outlook.com (2603:10b6:405:14::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 14:03:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dacc8df-3fbc-45dd-43d6-08d8cd0377bb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165E9396DA73AEC555191B19F8E9@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	73qvpRP7io5+Oj50YB0TkFPXw8DxJQ/ena1mLg3Mxwhj+KRnA9pnsQFgPnJUVheK2yJZUwShLA1yM6vOZnAfLBcbwR1WaxQI3PHodxxFF7H3rxRdUTSRWhPR1E1895l/vf4h0jWjxwAMfmg+xttE+Hj19IlJES97U6W83b9qioqFa5Tx/v+vvKrORVhapc8BbeBI0hogUby/OQmA0G0hbDb6fl1rOu3pUpoMWHVYIZ1cZTln/WJMUi37ByX4WO/IfiaS0Q+2mGI/PWtXS0CaZyXFdq+aI8V0O8NnOhuspLnrrfmWk7VGcErtynXlc1M10ic7KzMyh2dzQw3dnHI0lBFMr43UpAjN042do5lR6sRAjEztChkvHXBLOPhztT1cYikNW7G8pVAUP5aqmWW0iRFzG6l3+JCKiWMxMGNsSXgtJUG7Pm58LcsTGRDByEpufrN0DtLns8/mJ250PkM7NzlDF2oNYt2SJTvo3usXFcavCKoG8k1+Y42l3CPuMLSz2FRNujoiHFxlw4h57c0+F1XLXRymJlnbpTDz/tC34TzFnUWztBiTWpdSDD+Ubd6FkRYo0gX7INSOFww5/XD06BtkwL/QScCyLDeKIFT3qbsOzcqIHgIjRz2yQ5foOUpe5U58BJrOdvuS0c8lUKPyQ2yR02Fg/6m8WdZgAsVTkgh7RarDT6uf7RU8dbN17h31
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(36756003)(186003)(16526019)(31686004)(956004)(44832011)(166002)(86362001)(15650500001)(66556008)(66476007)(66946007)(2906002)(83380400001)(6486002)(316002)(5660300002)(16576012)(26005)(33964004)(966005)(2616005)(52116002)(8676002)(31696002)(478600001)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hbrUsNfUO1s38q59LCpQYRnaXMHOnqVr3YMn+MfNmOdvsq0gCAKBz5zoDRXkgsqCepzavUrCfKOaVpGEBJKey4oel6XzfLyqc/UkPZlVhECFTJ5XjlCk4+FDKxBk7jfKnfHmvbsXi9TYGR3+gZL3ihQMy10jIqSRWHUmhxGB2qk21AlU7QftguAwkUV+0FEs3QTJZ86gxSa8GDDrPJQdFcveDQn5EgDLhIAkxSEian7X5LqZu32+R4EmqFMNVNJNM3b3D4nTAvfLgkG1m+7qDjKnDRYltUBITL5DxTETBVCEejTxZ3xKp28Et/Iqc6vFQOwcQel90W0YfU3r6LvmJc5PwaWhVdBME2/yh7LT2vjbApKvxP+lkqQ0sGH4YjU6T6QMEzI4INuaRlcf4HydnwvOsRC6npX94N8P01xvE0KGejDIIoqjKEXqieYY8UahuYMeg1p91Zn3EYYtV2CDVVS4J73o8c/n5tXkSA/qK/qR9TY58A9eJfHtI6rBuFa1Kv8f+EKaHMb/MWJKwPa1bi90KexHpsRmzGiQz8lct+HnXJuR5hke9hqza5vD4WUX3pulYE52KzuZKvv0/MQuBFGiH90rd3fDFNx2xBE6CUp/nHWvV+KT8ki4H4H5g79lo2wOCI7TSipwzmn7t2aSvw7rkjhKTkJqK8F1ntCj/ITgP8v2rkyrbQEYyMGIkux7o6kQhobfVjLnJwP69R99ZMIJCNQz/kuzsAViF1SFKVAakUGD7nxjnZnC7pA1Jop3
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dacc8df-3fbc-45dd-43d6-08d8cd0377bb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:03:25.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkO0YUVr31d79CoOQYeiS/V69/UTEDr5am6KuxPOQGiCd/BtUgY3OaaXKEGjNiBScYjyrvSKB95zurfJzDNkBGl5JGX03UyxyChHGbevoJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------79E73F39358DC823E428AAD9"
Content-Language: en-US

--------------79E73F39358DC823E428AAD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-06 6:04 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon_1.4.8.bb => python3-aws-iot-device-sdk-python_1.4.9.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.4.8.bb => python3-aws-iot-device-sdk-python_1.4.9.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
> rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
> index f763067cf..5408c5aa8 100644
> --- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
> @@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "\
>       file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
>   "
>
> -SRC_URI[md5sum] = "d05596f02774ea39517765c5dced874a"
> -SRC_URI[sha256sum] = "bcd68cb7fdb044dbd5e5d3a02c311b25717c0376168e7c992982130f19c51b03"
> +SRC_URI[sha256sum] = "84b440c5929f33da1cd204f3ad0ea891e208637dd63de9fb039ed7d49d78c303"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------79E73F39358DC823E428AAD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-06 6:04 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210206230435.4106978-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210206230435.4106978-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon_1.4.8.bb =&gt; python3-aws-iot-device-sdk-python_1.4.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.4.8.bb =&gt; python3-aws-iot-device-sdk-python_1.4.9.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
index f763067cf..5408c5aa8 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = &quot;\
     <a class="moz-txt-link-freetext" href="file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9">file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9</a> \
 &quot;

-SRC_URI[md5sum] = &quot;d05596f02774ea39517765c5dced874a&quot;
-SRC_URI[sha256sum] = &quot;bcd68cb7fdb044dbd5e5d3a02c311b25717c0376168e7c992982130f19c51b03&quot;
+SRC_URI[sha256sum] = &quot;84b440c5929f33da1cd204f3ad0ea891e208637dd63de9fb039ed7d49d78c303&quot;

 inherit pypi setuptools3

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

--------------79E73F39358DC823E428AAD9--
