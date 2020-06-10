Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web10.3804.1591820847931909495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 13:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BLx+a4N8;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiUxJPmQiUKdzDdpxHMfFyl5SJHxFGq9EyGeGbtNo82oqLF7aPTnW+evjPkws6Gy4VGWvojUhzBGaR+89iuTaFIVefA7aNS5xJirJ+lm7B3sDT/zhSZiAEaGvbxzP3GH/HIeDIf09JDgyPxksJByU+2f/9nvE56lLG2fD/xlShPQt/95z8h72MA0kKpdbjH1ito9MvnzZh+44lHz/lLjWyjXfDa9WtQlzKx8R9JcvgXZ/U0NeuonO07QjcxfAUVuM2LSzz31J5zKTwmSzDjoD18Y6aIOPpciqWMIrIC73SflBe6cyVJSCpcLSDsVAs31tzYvQaJ9tj5StG+/4SimwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wALIIzNFWXK37w3d0KLLn1CPY0VXnyalmpEwvEW/SA=;
 b=nbjfiGFXvxJoL3ma7978TYm2oRi5De3EEWoy9aWYv+WMZdxyyf79Oc00lt/GISxJVj7jLo87mfAImoBRmj4YQan5nV4vSFxo3vI3IR1rTCZGItxRE4gZIjqM4mS7TO6oZKSSvKjPgW4cn8shdYaQd35BqCnS0GDEMaIyU6SQBT7Xg2Qq9CLkY+9rYMOwSjxUVDwzUrl6gCcqfAlAWoVlK3Lt3QexR5ng/0nKn3UjLPutXbwp46HTWEGvNXye+qkc6FbcfXSpV+2Zs55V6hkKGwlCL20QU2WZIJmxnqikRjl9q/6kGQAxGkeNM7cbJgqLRZlGzOh+d+NELxOuSVyPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wALIIzNFWXK37w3d0KLLn1CPY0VXnyalmpEwvEW/SA=;
 b=BLx+a4N8aeL4wtg/eviffcmI0buVT/a8BynV9T06ULEq0tQiZzxzJsi9hI+dRP7JbdYqK6tk7biLAfQyZvPkKEdG0m2pDAr6MUTCmCzgF++0kZvIwjcmPUXSv3dC/LLjqrZ9PE4CBB1eKrwVvjl4cdnDBModmmLDBHjxvEGdb+A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1715.namprd11.prod.outlook.com (2603:10b6:404:49::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 20:27:26 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 20:27:26 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-paho-mqtt: add native,nativesdk support
To: Martin Kelly <mkelly@xevo.com>, openembedded-devel@lists.openembedded.org
References: <20200608232558.1179770-1-mkelly@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <887c0dbe-21ef-2ec4-9b0b-1ca733bc6c68@windriver.com>
Date: Wed, 10 Jun 2020 16:27:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608232558.1179770-1-mkelly@xevo.com>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19 via Frontend Transport; Wed, 10 Jun 2020 20:27:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce41e1cd-8739-4081-62f2-08d80d7cb088
X-MS-TrafficTypeDiagnostic: BN6PR11MB1715:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1715BF39D39FD71266CB3C899F830@BN6PR11MB1715.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yEFJlXA8LJU9Vad1wZV8VmGMekB5RGRtIsO1P2cWT40T6pIF7qAmzgDjkUkETACGKF8P0yfUwx6vU1CXHtm0lHA57i7+7Y4Lv+mJHplJTdpIxvwwGWgUUGAO1sH4q+Pqtqthf3Clo+SshLQW8w1qXiZbquv4tYjLMuk4+nVQ03PSaBCLi1hue06Jc0NtxEOS6hOnEKPi0srui+F7Hz1BhjKnE4cLkDqWQAKkszKz9ck9ulPKKFozL/uhQ6EqJDxeQe9uaHrnYlbe48OcsZ6793NdAeQlZlF8i5vJ5V7KpzQZr21mlARzTcGeHBBxz24O2JucOyo4sHaW5VCyJuEinrtp7M9Ro2bGF5zyelyKX40gVuc0wSvoxwjIwsFk8f2Kb5d2t95rw+KRJ+P3Zd7/RuI4H6LqsppmM4heK9r4jZySbSHKImoF4MjnJ4Ypq0u2yKoHNa5Qplf11JYy8ywqAnIIjBeMw5jWuxGdrRZWqQg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(39850400004)(346002)(376002)(136003)(36756003)(166002)(31686004)(8936002)(83380400001)(66946007)(16576012)(966005)(478600001)(66476007)(66556008)(31696002)(5660300002)(316002)(186003)(53546011)(52116002)(26005)(6486002)(2616005)(33964004)(8676002)(2906002)(956004)(44832011)(16526019)(86362001)(142933001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MlwPlrfarF0kiX6KFnX/HHnEEwghcuvIxpxemgHNU+hY8vvI2Y8W9Jmq4F8Ma9bPwdwWCApFw/sjtYKBMUoXlF6DNM3ywTZXqPfjSwlOlL150pn86BOgSXtrLIZSaPkcDhAKxZ1qbGpt/8p0lbigztrpnbaHAgEKKuGpjiCIkRh/PBSu1e9FV8RmYYeN8k1Ro203qcDUOR3E2FCUuL8mRnv4GriHsZnUM0f9Sq5Bs6kacToJRp+dGUZ+DFtVG50gs2e1jXrksFzhEtIvEHGLapvGakrT5IXN2itVNEAt743jmdAhCgchl5piZDInI4449A6RQOBwYSC1IeumFWe6KhBYDW5QfnUtAES0WBhbaeHzJbklxVBl3nyvLBLE+0bSl3XuvVHx0eUdslYZcTm65NF4nKYtndzipatF4VRhedb6yOa5ptH9iDHgGl8rQSf7BRP7zcZ0+ua9q7ZbxJEUDb1MCKlsZW+TllB0IMlz/+X7zdP0DubJ8BZjxQI1jAdR
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce41e1cd-8739-4081-62f2-08d80d7cb088
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 20:27:26.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/eIDoBo64ZilYnoNHEESPeXHEI3lkzYKSALD3zIKpBM0t8SR1Rt1M73qG3v/xFLfrkdySQKB1xTMLYvgarCG9eXYNy+YGP58hv2RgqIiGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1715
Content-Type: multipart/alternative;
 boundary="------------A221FE215317852AF85DF678"
Content-Language: en-US

--------------A221FE215317852AF85DF678
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 7:25 PM, Martin Kelly wrote:
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
> index cc6f4dc8c..8bf80e601 100644
> --- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
> @@ -20,3 +20,5 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-netclient \
>       ${PYTHON_PN}-threading \
>   "
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------A221FE215317852AF85DF678
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 7:25 PM, Martin Kelly wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608232558.1179770-1-mkelly@xevo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Martin Kelly <a class="moz-txt-link-rfc2396E" href="mailto:mkelly@xevo.com">&lt;mkelly@xevo.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200608232558.1179770-1-mkelly@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb | 2 &#43;&#43;
 1 file changed, 2 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
index cc6f4dc8c..8bf80e601 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
@@ -20,3 &#43;20,5 @@ RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-threading \
 &quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A221FE215317852AF85DF678--
