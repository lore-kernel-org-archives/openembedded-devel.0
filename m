Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.76])
 by mx.groups.io with SMTP id smtpd.web11.42357.1606165036253537655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OvNwfKmy;
 spf=pass (domain: windriver.com, ip: 40.107.223.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDcnmRuAX9W/YV9nfzD+qoHyrnZpeS1NfRR09LqkDtLkRWs/qRzIwAosVNSg48bf+hM5e78pAY3kud37KSvgd7B77BJ7/j4dARA5pKaIqN3hXz+HZ432xW2P6u40mpAhTX0sNUpyWFKHZB1I/rG0MhK2ERWCYg8ji24fwMembz+dEgMFKezrD0jGETnruImdpCoBos3D6TmQXey6ErVlrlIdKDsJgPmZLynRIKizvFjBdUG6Hxjw9qT0ECHXewCYn7Rux+aDwYlga/9jHyJePQpvVv66HbfnkNrYIGvrTekQLDw1W6SNEglemIxXI+epTwNlMLeGK7iX9z4b4PRJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9y4ZyvPRWzwKcaS0MWWaeyiL48FHwcfvWs2tiKg8mY=;
 b=YUZeAOwQ51B3SHSEPxoryDZirDxOSptU3+Zj40ycTddrrWBPRySRtcYVnc5PsHegzdQrr67p2L9L/tiHY/wx0MfXxkM+TJC4pz6gcAkCNGh5La2U0OvyR/9UXrk+fyms2lIStFwHvu4HV1/H6+fARg5r70/STAvZXXvLWWm0eGdvWavNs5GgswePHJJoCGRXVIGPInxPoXT9RQYkLILIFQ/94qMRgM+uTrdbObmdKB6U60zX2xt7vse6HWLzPEIsh8Te5Erb/ttZY3M5HB0dbiVfC43gX+76RpvLTnUGl4qTWBaGhT9Gc7cwMzG1e0stJJUM+b7mUUPhM34Q1l0WkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9y4ZyvPRWzwKcaS0MWWaeyiL48FHwcfvWs2tiKg8mY=;
 b=OvNwfKmyYq1+f8uAFz/x6JG8mKvXl7qcY825YUMWN38qzPS5XjwpXkwZeHsRBWso4m/5tj30FCvUWsycRJfmLkyYcQjGctV2bv1PZ7EpelTdo1Uqzs0kphncQZbtwRvxTTqXuqxQdRT9qJtOtYWExbrvk24rQ7KpPDmtoMViNz4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:57:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:57:15 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-bitarray: Upgrade 1.6.0 -> 1.6.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
 <20201118140220.29364-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ce0b311a-c252-1609-66a8-787498c67b9f@windriver.com>
Date: Mon, 23 Nov 2020 15:57:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201118140220.29364-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:57:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d692982-92a4-4da9-3877-08d88ff25b35
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2600D344BE3A56156120F96E9FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KVFvrpYB8hfrKDjmNrdl2UmU02eU4vDBTuo3mBDh8pGbB7U/4V0HP22/DbYs+HWtDKEuTFSLqhjkrZck81opC7WeKM+uHO5Pldp2IjHpaql3bl7/zgyDRyz4jDezGtwbYazWz8Fw9yd1tct284DoHsTThF6mwRt9SG5ylKa5xapWOv41BXbLFHqEgxotzjnob5wTia45IlwGCx+YK5tD6c+5/LW9JT9HZGWmzkrgRLgZKLsXtGl3Xi5VkqEw2ye9xrCt0hO8HKkFY/ZJ/UKhEL+BI6F/QrKPXtjnxIrF+zzAgbfViVc9iMYgzdqITo/2BUMKVAb/xlB4knqwpy2XgFJNBl3gbEED3HUZvk2ym5gefTxP9Qks7r6+GEC0CpTctG8esJ7P/GLQ/PWFACOOyGW50U9dcGrCAA15xJczMimCoa9hEo96hPRiGIuVCFk4a6V0Tu994WwCG+Gr1DavdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OY8U+B3yOvLHu/HHHEWyqmD0KiRqJy9BslgSeyhkxOW4oXiXNa2a8jKih7DvkAKlnhDPDUIJSorEroCnvVVVfM8AscvXvn6N0YDSD2DiDlJp3LGwIAACnsw6HZvPzAgwKzZyTdD9GV5Uh56sd7E0tdQoM/aQKhdzmbjGLNBXyp4/2CoZXfAK9PSDsSr41fbWK75pF8h658sttcwYFqljNu1sYxEtmFomJTH4kNzjtKUqOsUfqvYMSNnHh51DO2nFtvL+gisFBX22xgfcgvxKcV81019fc9SYHsbjBV3gAnRu0l9rW/QsE2hiamrHbw+tP2ye0ncYzfV3oPWLzPTNqkQuE/HF3k1dKEQYN+bHfgrhh/EQIJ6my+5RPcmltc7FVXr1d0FHP3gfJvhXffdNsDSpjQpPCDH5JjpMWw8LbxvvHH0i6g9m+R+5sG2dRrJLdTlImIBBA0jFOrpQoPjv8IA3skoNGkfhGDQNPpqkDSC9tM810mEnY+wRtheT0dkTJBmNiQhs6oh/iG5qm34dBRMUVGkJeZhUDnqBt0h/0A9nGSr4I616EXbkQhosMPGj/Hj+c7Xt10LiiD/4ayEpUfDTIU+pbuCeW/afnNqhCKenqipnqCaO94hnclRGZMq4mRJLkxUbum1clkcJtCooodXAnir0oOY0ukiJfAtt1HERE55z+4rlidWeVM87mUruStpflkGupGFIJilnQSwiYRm19gTUXSzNTmkxoPMLI1LgA7p+0ekyn6L04fD7BqBxPj4Xk2BH8hShH1JU9YTC7BOyQHZzjWv1snmFyQcg8GNdE0O258yRv8G7amV46+MfPcc6oWil8LQVCiXp/Fh7x2Kip8yOmf6iswadzFkwkY6vndcLBjeQE1ZVRuXZbA3MgI2Gqltm6EcD9sv5zB2OWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d692982-92a4-4da9-3877-08d88ff25b35
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:57:15.0295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXG6Ln2QQEXzTdXQU6OKgswpqJkfvrpt9wsALXxgFH2zLj+kj3QkgC5Pul+s0XW0ysS0A1VNnq0pFt764zpMaJRk+S/ZeGwD0IutSuq6rXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------C4D39EA9B74F9358F2A39133"
Content-Language: en-US

--------------C4D39EA9B74F9358F2A39133
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-18 9:02 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.6.1:
>
> - use PyType_Ready for all types: bitarray, bitarrayiterator,
>    decodeiterator, decodetree, searchiterator
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.6.0.bb => python3-bitarray_1.6.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.0.bb => python3-bitarray_1.6.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
> index b085cf7c09..f54d54f92c 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>
> -SRC_URI[md5sum] = "08ddac722b139c1544087c4953a6335b"
> -SRC_URI[sha256sum] = "ba157ddebddc723fe021fc80595b3c70924d69ee58286b62bfca21da48edfc9d"
> +SRC_URI[md5sum] = "a082075dbae478fb53c69e25cc7f9cd6"
> +SRC_URI[sha256sum] = "ab85b38365dd9956264226b30dababa02161ed49bb36c7ee82cc6545e07b1599"
>
>   inherit setuptools3 pypi
>
> --
> 2.17.1
>
>
> 
>

--------------C4D39EA9B74F9358F2A39133
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-18 9:02 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201118140220.29364-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.6.1:

- use PyType_Ready for all types: bitarray, bitarrayiterator,
  decodeiterator, decodetree, searchiterator

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201118140220.29364-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.6.0.bb =&gt; python3-bitarray_1.6.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.0.bb =&gt; python3-bitarray_1.6.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
index b085cf7c09..f54d54f92c 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>

-SRC_URI[md5sum] = &quot;08ddac722b139c1544087c4953a6335b&quot;
-SRC_URI[sha256sum] = &quot;ba157ddebddc723fe021fc80595b3c70924d69ee58286b62bfca21da48edfc9d&quot;
+SRC_URI[md5sum] = &quot;a082075dbae478fb53c69e25cc7f9cd6&quot;
+SRC_URI[sha256sum] = &quot;ab85b38365dd9956264226b30dababa02161ed49bb36c7ee82cc6545e07b1599&quot;

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

--------------C4D39EA9B74F9358F2A39133--
