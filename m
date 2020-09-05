Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.47])
 by mx.groups.io with SMTP id smtpd.web11.5529.1599332469538147035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oibTj5xF;
 spf=pass (domain: windriver.com, ip: 40.107.102.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+p+aGZ9bZcl+KT1xEzt1WbGssZex4w50Yfd+SUSyEtKPo1Dcq+kSxnlJnXWJ2VZKxrGjdI1fEidWAGPDpmmAZbT5QmPjC4DsXPdFHubrmMda7jI5JNir2luHMC5dyz9aWtvruchhAMHAWboIaEt+SFAJQ24zzikrXQs3Y1iCGYM382b8JWmBG+RB6sQNLA/s8TE/oYtuAbjDQ3H0IivndiGAhXfqeX1em35hUsu0XUElESg1jJJK+Fswr/tHmaQ9gXt6hq8ygsooCTKXW7wrE5guRQIosvG+YXREsXUAegk5jiK9RqQnMnNwqeTvM3uM7DZLj2dS3wEyOPf9Px8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcyjMvBhNvDG/oyRSMq1Vk18Ep0DsCWdwX3RU8axK1o=;
 b=Su6VRPfcZPK1evr2Pfsq3VeJ3iDdcVejRxifVcVk15hb4rrWxPO2bjAviFHOmBY6QTdvX8MnqNITvnJDRcaOagUI77CiCZaAN6BD+R+eCGj2ewfWpsnoHRmUVxFhstEeMQW8Kbmm4FmJQhK8kbOuZZb24NASAf4oI7Wo7LXLIY5DcYvEVFdqopbcv8RKxJCVWg9R4VAFSIqaXcIPYVW6SCRLK8J3Zq+yn82k0k8YDUywHVZKt2QlACVqRwvtZ8dFlRIjwt9HGI1Qz0iRYgYIZ48h1URuJD2yFBWA4oa2QOtDguwf7OVCIU347W7GQDsgsdiVkMmls1/5zifxXEhpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcyjMvBhNvDG/oyRSMq1Vk18Ep0DsCWdwX3RU8axK1o=;
 b=oibTj5xFZHD2J2poaHscGhCT5Bb92P4NKVXzP+oGVuptB7/oouiNzIG8pJJ8bd6uTaK/6Ak9o3h/ybjDuEbWZVBQ/6sLnk14mcbv8AJqxJXVS+g+nme4oKVZsPfFejN8GyDnjl8zlCsdEP9p3k6QB1P+c3lnOb0m8Wh0Jtf68/8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:01:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:01:07 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-stevedore: Upgrade 3.2.0 -> 3.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
 <20200902083342.22101-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c9e80379-7711-e3b8-41cf-3e50d3560021@windriver.com>
Date: Sat, 5 Sep 2020 15:01:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902083342.22101-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:01:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e319b55-af86-4488-9b8b-08d851ce0b78
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952B5B3F01D13A8B04B21289F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2z7IIkRS4tCYBoYdw89urRGOjhW4lr4K4dDSFsOHv0arjtT/l0VvdzhZYLeUQFseUEnaN82BxRe0sLm1So6xer9opLvuTpr2pXrIOVl+kMBaQ3a0e1EJLfA6+YazvClnOZv2truWgg+/APycuPC1npLJdY+W/4g8k3hu7I2GDhi6zg3IJsuZz2XXx4cjuZ2CU5o3JcPbKEpSDFWIl7VyszaMdy/Nixb/NcXXPiWGEAOzNFx7WYaZXodpR4vpGIMfrZ+W7FTsanKXoSV98zB/LVY/n/+ISTnhLVxrfi2P6l68Jz4hFfgJTmwVDe5WRzxkgesYd/MVTjbdACqwgUpa/7v34RFK4vijrbx3aQRmvRyoZf2oXcSrkGkDV4yZBpLPfJOWDfbzt0ybTdHU3ebpoWedPbiFpNMbBRir/pJMW65vkQ41YYUogVwAu7on7H2WHgcvdolw0Rh4TPkzN5TWYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HSshAcb6JgUl6kQTKGG0lbcFEjtrcboD8Ni8NJv6hFYxV74a5VLnFZVanXvjxVkB91pERZ7+F/uLVRs2dkAQ3W//HXHw8BtnYsyUgvxjlJA0jG7yVtP+zo1BW+U3ZRvE3M0f3z0ByV24Il5D0+yq7uA6TevZrAb4b4l1FKPokeONIVi6ljZDM1nc1hLYt9I22ueS0dnfim6pgm+xuvxTpoE14d7+GNrn+R3hUHGFM/JEpvXI7oq4eGD2/Y2GCvJE3gNanVBsFDBlInPaOn593MMO5khFqtLxWRKH5UQpD/Bk9DmHqid5AfZHyP2E5pA0DyOC0VrwHl2o0h2sU7MCLmfz0ujs6v3thZ3l3r9TGYzCZtNuRAaMVJ8+3viQV+9jT1Z4KGMdQ1qif+j0c2zdBnlSfkeCEwlqGME+utM42daLcFrC2uFjfk7HHiwdvSXci/XiKTy9Tdw1XNWoPlIG3fBepnYrWf4zP1AozWR6/5ovTZhL9gM7UnPVN9L8Z2yplT4OB2F9xIYbdV/cgRKFvDMqWsfHnckScrBraXYCCeKCkV+jPQITz8DxESEi0pqMY9jM9v+R73Y3LffswEZ9lFqgYleqi4PHuFazqV7g3hU8AV5McGNqBmNiW2RvWllYtc197FhIOGnlLTRXun769Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e319b55-af86-4488-9b8b-08d851ce0b78
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:01:07.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXijO6RANpKNYiujvSQCyLWTJs7t3mRDGvMbDjxr2AMebEbNbU5GlggBdgB/Qj8LJ9eIMaCdqvuY/eErYWZXm3yM3A9evxDKBycgieu5NAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------2309EC679BDD62A9B58264F7"
Content-Language: en-US

--------------2309EC679BDD62A9B58264F7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 4:33 AM, Leon Anavi wrote:
> Upgrade to release 3.2.1:
>
> - Bug fix: there were some syntax errors in the comment of
>    stevedore code
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-stevedore_3.2.0.bb => python3-stevedore_3.2.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.0.bb => python3-stevedore_3.2.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
> index 0a2bffdcc..c3c368c34 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[md5sum] = "6a39764d7aecc63a0990cf4635cb430d"
> -SRC_URI[sha256sum] = "38791aa5bed922b0a844513c5f9ed37774b68edc609e5ab8ab8d8fe0ce4315e5"
> +SRC_URI[md5sum] = "5f5660cebaefebbde4607e44e050a3b2"
> +SRC_URI[sha256sum] = "a34086819e2c7a7f86d5635363632829dab8014e5fd7be2454c7cba84ac7514e"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
>
> 

--------------2309EC679BDD62A9B58264F7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 4:33 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902083342.22101-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.1:

- Bug fix: there were some syntax errors in the comment of
  stevedore code

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902083342.22101-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-stevedore_3.2.0.bb =&gt; python3-stevedore_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.0.bb =&gt; python3-stevedore_3.2.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
index 0a2bffdcc..c3c368c34 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://docs.openstack.org/stevedore/latest/">&quot;https://docs.openstack.org/stevedore/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[md5sum] = &quot;6a39764d7aecc63a0990cf4635cb430d&quot;
-SRC_URI[sha256sum] = &quot;38791aa5bed922b0a844513c5f9ed37774b68edc609e5ab8ab8d8fe0ce4315e5&quot;
+SRC_URI[md5sum] = &quot;5f5660cebaefebbde4607e44e050a3b2&quot;
+SRC_URI[sha256sum] = &quot;a34086819e2c7a7f86d5635363632829dab8014e5fd7be2454c7cba84ac7514e&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-pbr-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2309EC679BDD62A9B58264F7--
