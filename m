Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.61])
 by mx.groups.io with SMTP id smtpd.web11.1506.1602078500652085961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hiyaxPSc;
 spf=pass (domain: windriver.com, ip: 40.107.236.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/FZyEBxAZCkxPwC1LMb7Tt47B9AmEJ4HfWorD+YHLAowub6Id+e/0fP2AlpFM9EkOTVQOIZKMCLtRTRiCbw47L+G6rCpUKfkEJtIBDnRZEaRy7d9y/oJaTLXNw/aDg48NOO/FvhK8OKwqn61RtaY695QPk+qdwnInDczSyEMEmv0cftt1QlbByfLjw5AUl8FTmAVQ4Tl264nuRTS5lz6pqWsle4szAx6fBoXHNnG2u3gGGZw/8lY0BknNecDeJq8BZCgRfjReXMNSlxth069BvvoJLQgK2cBStSCwyy6bD+Mpjk5jEXB1mj/GwaBx59IDfLFi+KCy1u2vCFfue6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOLuwdO409dvOGcik6Jf8dpU8uyoZEj2W9g+NDGExLo=;
 b=eXCcXu/MlJDtZPPDBqSJEbr6HhoqaXhQbTQY3LRU0IiBc5T1sbf588MN6+G/7FmjyjGKfr7HqYQbwoSH9Y8J6mCR+fG/ERKTWUn/PDlbjEGAZfY4Bw5M5BeUyMz55FmOYfM6DTZai8vpKtj3+nFaLTkuFCtZruN545KopDNMUIL55RlOr7YNoUhs4SWSgkCiJJVsqheqc7+YhIo5cW+py2/lEZBegeH6mYiMlsfZbMylahaTztcxKaOhEQ/N59AkGNRMtw6DFDtHvzqXXR+r2+eYfTwvpQfrSZ/p/W/TNgYmHrzR+3UBwdRYyWlPkBl4Qg5I0nBd9N1dI5ryiCLi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOLuwdO409dvOGcik6Jf8dpU8uyoZEj2W9g+NDGExLo=;
 b=hiyaxPScvg78ciwY08gdPpPkHZhSKU+3a5/yrch55JGu7gTyIypDVMneEfbqjGQr9f1AL3SR9mSlGXfArLDMAjDLcR7lxO48Azu5bCjkC+jduH/u8THncEb/vV9U7VCj8qSQN+GK80irsXNAXb/e1IR3FYWm/bUIOcGOw0qj2HE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:48:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:48:18 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-humanize: Upgrade 3.0.0 -> 3.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
 <20201005115507.11563-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <96363956-e6b8-635a-327e-41fbe1dcae46@windriver.com>
Date: Wed, 7 Oct 2020 09:48:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201005115507.11563-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:48:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80dd185-5de3-42e2-d31b-08d86ac7a4e5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2536C37D6F0A9C80CB6AD18E9F0A0@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2WBT6Zn54RC7XdrqDyGZX1tMddn4MnOOL9xeOjJO/KsxS6pwTErEelPiWTgq8cYap1rlgd3+TDMfr6Nbi9fjf0h0gudspLGs47PjyOIlLGWJ6yK+CWqqGlXYPEz8177Blu9RrXL90MT1pXZ/q9AMkDp6lz0+Uc/1Gs4ipZFNFRoEXe+/C2+4mRt3Y74DVUIeVVOBBLiP4b2EKxzzDD+kw1DlLCJydUwmGNh5bHPwAVMONIR5fLJTN2f1qCFj4nsVj5sRAPrQuYZa4p8anT3YVVl4BNd5nUCcQUcZ2++pI2bW7L53EA71/Yus2ER4fgoRoGZfX4JUS52Pr23zaDxqTxLiL3T7Y6/YAxZsJ2DNAfEGUDB5j7eGIEHfQe0pU+0VFoU3mxppVoQQ7BrRkpW3uADK8YVJKmPNXdm4U4wAsSw5LQDHAtJB+LXz5fx6CEbUFuh1VQLSa8EYc3D3VWERUXz0S+0lXjL0gBuTpBIKjMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(366004)(396003)(86362001)(16526019)(26005)(186003)(166002)(66556008)(66476007)(66946007)(83380400001)(2616005)(956004)(316002)(52116002)(16576012)(8936002)(8676002)(31696002)(6486002)(33964004)(5660300002)(83080400001)(53546011)(478600001)(19273905006)(36756003)(966005)(44832011)(2906002)(31686004)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nzsRJEH63iBaK+0J+WdX3AUrJgBSUSeVvAbyZNraBu30f+NPnWi3aDaczr1w1+NyS0XZXagm1s/3Utk8Apf8HlMTYc8feUtMfsTcVZmuyPZmfjIYo5KTXlL1w+S6bQ83N3FfRrABtR8/w6ZVRonWPNyFvB+bv89R2pBEzfqfTicV98I37IC3qSyBN9yTZS2awV+oSB/sHFaubPNAKvad+7UOdyzqhqPRbvH1l5+iTf3f6Ep+5v0CqOFSOELpE+cFC6TzjZJDCKZMakJybYGCITg85QtVWmUEdXmQixvTsbMduqjWj8kq2y0qG6hNpTqwLtQkEuySZjrEOr/l0H1EzVnyDaA0ib42+9vB/easXYVHWQ5d6bkroMF8vWEFVqrYLKjZQGojhADzbPAQMET4C54h2kXT1u/afZDKG3JsTexPTqjEnDbq/Tj+dnxWQ0HaAc5OhrW9XqeaFePJRzCpM8kXnceUI7885SM4517x/LjyNrsoLHjY3NsckKWylRNC3LTlFzyX64MjcRh33BAQGxzEx0T03L9lAcQvrKeBpr0K1BFJ2ZHk1s++a4atuN7OwMun4wo0uso5mYiim+b2xohU95hSnsNCR3VsrzcforbYwowfpO/y49hT3+UzGr2FgYA5YZGk831ScMEd6AmbDg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80dd185-5de3-42e2-d31b-08d86ac7a4e5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:48:17.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCaJ6LM5LrbhtzdMmVFZPz6WtqNGAkI91lK5GLYJFm2PXDcPt95wtm6jA3WeHqbrhM+FYxJziPcCQI9NfmVTGX2SeWHOdzd5BsEZxApHJCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: multipart/alternative;
 boundary="------------0E93A768B62CAAEAF3856EA2"
Content-Language: en-US

--------------0E93A768B62CAAEAF3856EA2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/20 7:55 AM, Leon Anavi wrote:
> - Fix some translation for id_ID
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_3.0.0.bb => python3-humanize_3.0.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_3.0.0.bb => python3-humanize_3.0.1.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
> index 386fb1e136..92831bf135 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "779b291ac40b73a0fd6006c0485c1794"
> -SRC_URI[sha256sum] = "db08acbd8e31954f146467a213a112c4b80a5b8e319e06b76aa184a679bd8b48"
> +SRC_URI[md5sum] = "53faa88dedddba1227f9c41d65440c54"
> +SRC_URI[sha256sum] = "8ff8f292c9bf52bbefdc620410e7defd1c95e7eeb1a5cfc2859aaea4b1877ff5"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------0E93A768B62CAAEAF3856EA2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/5/20 7:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201005115507.11563-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix some translation for id_ID

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201005115507.11563-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_3.0.0.bb =&gt; python3-humanize_3.0.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.0.0.bb =&gt; python3-humanize_3.0.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
index 386fb1e136..92831bf135 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;779b291ac40b73a0fd6006c0485c1794&quot;
-SRC_URI[sha256sum] = &quot;db08acbd8e31954f146467a213a112c4b80a5b8e319e06b76aa184a679bd8b48&quot;
+SRC_URI[md5sum] = &quot;53faa88dedddba1227f9c41d65440c54&quot;
+SRC_URI[sha256sum] = &quot;8ff8f292c9bf52bbefdc620410e7defd1c95e7eeb1a5cfc2859aaea4b1877ff5&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0E93A768B62CAAEAF3856EA2--
