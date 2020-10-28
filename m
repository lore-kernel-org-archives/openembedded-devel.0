Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.80])
 by mx.groups.io with SMTP id smtpd.web09.10614.1603898508094229944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XWJ8Bliz;
 spf=pass (domain: windriver.com, ip: 40.107.236.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zpx8zREtIZZiupbRJsJMehiUJA14IZdZ2w8h/sCNvV4vGl9Z3rKpddnnlI6Jm07tXhCauG0hUlB9jGbb5vt5CmohwlJlvlHRRdo9CCdPvka3YfLz8KaaXDUup7307tDV2+ehRE4sjXSprBwPAaelJXRCgjEBVdscnHzj8mZfy7hKvBmui6abkEZzN1myQ5fZ0CzIWglhon0MbDZKQx+yIJ9y+ppv/QgZpIq1RkIdcUzNgc0FqPIDA+dnUxM8zwG4M4sKfBXg42tKPk+pDBdMgw8UTacwF3vS5zq5EBuf8qmq9yDBM0hKoFT838Obk5WLzmUZ2t81vFvCQTkJdNuDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VPMS7M7XdODyRJATZ8Jgwc2NWgrlnU1QDR+jTctZqU=;
 b=d/ezlJH6DCqBUcmNgADKgYRfea6CLvk9e7t8JJ/V1ksozti8aPwIwO4rtSdQhUKfIQR9U3v3h7RcQWbk1kxwX2G/kSZPCAVRU1WeaWQLl75mcsVA5Ma2/Yq0S8gco7+0a7WtLTlljx2nelQE5YrpXwvR7iA298I7vlS2eUs4kHWPFVkU4OvxRKAj3DtAQTsm1rDqlP9ufP3WmjivLEwC0MnzNezt0FjckniuuI9qSSkszfZzSbT/Ci3uv8c4ZvyW8c7QVA9NH8VaXVdGpFfH36tLpUE3xPsLb/21K+qPDrIODcmVGw/WJ0kV5Fk4GcgwZ9AIxCT3xxDouzUYnAtJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VPMS7M7XdODyRJATZ8Jgwc2NWgrlnU1QDR+jTctZqU=;
 b=XWJ8Blizpfdn8bO9MpuThXio+D5c9faGhj1FJK+ho28pi6qRLfgSPk4+7b4I0k13JP4skoCY2myKtB4lMxXkaRb7gCNruU+RODUhNeG6jC/Py2ho9XqZJsbsn4/xStodcyjzGFA+jsStWuUWkqR7ZDXThScK6YSy3DgJNo/pBYI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:21:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:21:46 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pyparted: Upgrade 3.11.6 -> 3.11.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
 <20201026090217.21174-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1cbe05ac-9991-c9e8-ada0-d5821006db13@windriver.com>
Date: Wed, 28 Oct 2020 11:21:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026090217.21174-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR06CA0066.namprd06.prod.outlook.com (2603:10b6:a03:14b::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27 via Frontend Transport; Wed, 28 Oct 2020 15:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0e2cbb0-6145-4d53-5979-08d87b552f23
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50083576B3E2FA9A7194B3059F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YXPvZ1U/9HRJUpf+gigP+r161fKR9MsVsfbBvWdbR5h7SSxfXoirw6jHdDFC0bEL/7q1Fe5Q42IRqyuBLqpom/9U0SmH2+1bIWMZNNuaFzOe9+jofSudGa1n7v06wvq935HZfjEvHH46kr5pSAl9u6Gx8lKiX0YC6jqwtzdRV42VQWczU6SlpuJoWxTOMczTW/zeo6cWUAwQiMgXfF4XyEtdHh5U5xWlEPeTjbNTt4Oyx9UZmhGftSqOn0Up2/0MrKxVkOIWenhcYxAS7W5TpVBN8TSjUOxf/OrP6B0Ms9Xpql4Fa3Eg8fKLI97ith357asnWsoOQ2psU7PwE/2i/i5KEzj4jIs/dhV43x4KCmdkTRCVdTvocAjCOHcqdWEru4gPccMxfunky0WF3tC+yrjuvo4/NOD5R6m5Yh66ScxsOld4FMxTSYEsblLJt+Yyvidmtx42fFrXZ6hksKzlEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+Cql8uNt3qDl52LMJXIZRQWrZ3KjsHc3OSWJ2xm1K9K86wrfmAo1VWF9kqpHMT/U2SDV2jZluj8L7nDeKW9JECmo4XA0ywss0YvWkapLfwa/9iGR13vUluA37hKX4GEb+wHBsoDAoUg2TBk/vN7acFcdbUnBbmCcGcO+u9IpWT472RBkh09gYl2IL47Lfj6y02p+V4bg1+/VRRmO2kJp9f3JqKcQ/IKDxQAOlGSbzg1qrobkzI/c7z/14cIxJbvzy9ba1lhuBa5Gkqlg1/xYev58+dw0HTI6a4yMeXNFeupEnYqCJc42xE2mNoUQQjKG+pp5mJzvxesV4evHHydy3aPvXaU23NBy1yuRaR95+XE1ra1OsNniQnr5cu++9Ur75C+W7/jZZFu0QFJrRsvQwk2zeyPqFA4Pd45Glmwss0TFxtsE/SjR9+xwHHmJ//VuTJCweJtp5J5neKy4eFMTCg1a4juDP5Plg4h8h6JsFGqLTToKfHhp//gD5k7oc06l9rLBz9A0lcVMMhGjomMCHBfc0YLHG3kZqvPm1qtDT8h2Hen+C6ofjsUKIXOf6LaooqKBYrNjjGM32SXbxjhwecpYpZzL8SSRdG5btVM2O8xjGwhRuOtcDYg7p8IOvCUSv+N+3Di1Q/n/Rip65gMtnw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e2cbb0-6145-4d53-5979-08d87b552f23
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:21:46.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpwgEYymueSypK+J+vBXpaT+nSAHIsuWRCy2qltYbVOse7yA68KZbNrsYUn+lLiqcEpDJM72ag1QPFa8iF/9NoFGJHAEwAU+UceJNH69G+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------DB311757112C8174335F5598"
Content-Language: en-US

--------------DB311757112C8174335F5598
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 5:02 AM, Leon Anavi wrote:
> - Set PY_SSIZE_T_CLEAN for the build
> - add nvme support
> - Update RELEASE file to make last step be "make pypi"
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pyparted_3.11.6.bb => python3-pyparted_3.11.7.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.6.bb => python3-pyparted_3.11.7.bb} (83%)
>
> diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
> similarity index 83%
> rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
> rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
> index 63f4933667..8909aa11f4 100644
> --- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
> +++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "\
>       file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
>   "
>   
> -SRC_URI[md5sum] = "b85dcaecc3106eb6e9a117270b09615e"
> -SRC_URI[sha256sum] = "727ccdf308c194069aa9797f7a6a973bc95b2e407cdf5d58d6c8bc4c9dec92dc"
> +SRC_URI[md5sum] = "69284f943982f54ded76960c92098a02"
> +SRC_URI[sha256sum] = "61cde7b096bccd69ddc75c85b17f8baed45c3687d404706d91403a319453b903"
>   
>   inherit pypi distutils3
>   
>
> 
>

--------------DB311757112C8174335F5598
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026090217.21174-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Set PY_SSIZE_T_CLEAN for the build
- add nvme support
- Update RELEASE file to make last step be &quot;make pypi&quot;

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026090217.21174-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pyparted_3.11.6.bb =&gt; python3-pyparted_3.11.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.6.bb =&gt; python3-pyparted_3.11.7.bb} (83%)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
similarity index 83%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
index 63f4933667..8909aa11f4 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = &quot;\
     <a class="moz-txt-link-freetext" href="file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2">file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2</a> \
 &quot;
 
-SRC_URI[md5sum] = &quot;b85dcaecc3106eb6e9a117270b09615e&quot;
-SRC_URI[sha256sum] = &quot;727ccdf308c194069aa9797f7a6a973bc95b2e407cdf5d58d6c8bc4c9dec92dc&quot;
+SRC_URI[md5sum] = &quot;69284f943982f54ded76960c92098a02&quot;
+SRC_URI[sha256sum] = &quot;61cde7b096bccd69ddc75c85b17f8baed45c3687d404706d91403a319453b903&quot;
 
 inherit pypi distutils3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DB311757112C8174335F5598--
