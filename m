Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.74])
 by mx.groups.io with SMTP id smtpd.web09.34925.1613999973410149207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RlmwC5C2;
 spf=pass (domain: windriver.com, ip: 40.107.237.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/vXmORJRxtV1Ezb3F2MblYFUTXfDy5HXiwo1KyCUSu6vH4ewBlyenljUoLh9e9o2lSuQp4CIn8GytHSjHeZdbNiTZL2v1q7Dmag5YlVm5NCFlxn81Tdw7iRcxKxyI0lEvAkfIR9wsp4l8jG+MOzIi0QilpELwFolQH+WepjotBNHdMtzJGeP58KaTTY8Gt4Vr7EYlD9e5YpD93Cqb/UbuRq4uPKkBAGhieJW9oCp3tp4aQI76rWtUUNP/2t3WB5lB1mqHhM4aOcbq+zS/UrUsZyxzErRQgVYy+e7Pz/GpBxBbsWPEoTDnHpOXHVyBu8b4oJlYkkwb0hFeAvv1ZEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCFjQ8E1W+WjSYdoqX94ZMuTOMw1HzaLZqxqaljWiVE=;
 b=ZEkIJeeCHpHVqHhsYask1c8oVHqui/RsXNk7/LIwggzG0+2+U1HY1EJzzLSPT07OVNXfR9QYms0OOE1sppqbf87n3O2T/7DPSBy+W6yptkltAVpnRH/r30EW6YH4q44QS0W3/Vln1O0u5I/KuChan7a+WJeYvC7Qm4I5HZ8o83yiSuX11e6J8M2JEo05hLMCfxe1dpipc9+vsl1MH6x6Nsv+Hy553yhlhgk92f4sVBtQioS05Jnymm0i6aEnukfvORwDS7/5lRamd+8Hqc9rCSeV/32erJ3CaK6rRMZy6HSL8GxxHgW3o6L5PJrnRrrquqbsGSxLCSthT7W0j/5Fog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCFjQ8E1W+WjSYdoqX94ZMuTOMw1HzaLZqxqaljWiVE=;
 b=RlmwC5C2drG5sQRalFMHLqUVsgixZXKUSo/8SRYlXcmMNGR0sxio933V2WeGU5JmMjdCOvxUayPeepF2HTgnM3iEH8C+PV/EkLkSs/l6cWNavnZmGt34VS8vcr30JUVjhOtwM7hbZCb0KcBBAf+rpbGIfZro6L4HH6GHs2ngCkw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:19:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:19:32 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-configargparse: update to 1.3
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215551.2368621-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cb73139b-1b01-31ed-cc8a-9ea31bd76803@windriver.com>
Date: Mon, 22 Feb 2021 08:19:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215551.2368621-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0453.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0453.namprd13.prod.outlook.com (2603:10b6:208:2c4::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend Transport; Mon, 22 Feb 2021 13:19:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c929c10-8da1-4290-e0f4-08d8d7347da9
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389352DA191726C09AE62F7E9F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	shQphtiozYosfPuFT2pEXmrpQtaZQ971qACrSf4I18dBIPotbWg3q0zLBgq1C8twTArKnfGnnl2o6lcPdqMF7icdYBPxX2AeMCLaLyZv0eWfViexMjkLhOqc5RYwdobQmsYJt+fxJwLNQoukQ5U8xm9r1+5HS8sb97MXi4VwkN5Bbb0m/J2pmFpV6nNFEZOYSHT/8Bmv0Q1J3jUbwfUEM3LZzTXgd05JcynZkEOt9Xr1bYYTXZYxBN4qMDwfuDw0rPavEE6o8iVJxDtGrL4pgEGDdrFEHqETpe1ecflhqEXXpo/FT1TD6rqzfW9vD4gWlPB7KnmpHipcAYLPgq8ogd+b7ZDGnvAgbP2JqYA+8EAX0qYX4RmFOBysBgoN6Gb92554hx7Fs9tcz9jLPWg9kJwa81w8frNnHmXMSPdKjzlPMonJmneYGkM7hr/P0oBz290pmzXurawRafoJkp/thVJz+jmaOAc0nwQfsNKsfWnSpn66rSH0w9S7aRFLKLfU6M17PHN7d8K7pnAYsm9TORCU0ajNY6rW7wKPzEuFOQN5UxVzD4pPlEzaweYJpzKbMWtj5+WHN/wflTOkyNkfaIQAs0GCpL77HIQmGDeMsj7o4Kuc3I4c1pvDvwFM8BefjEl4xOLAmXejOmwM2pIwUKJ4s7fO+Qwx4WCUQa08kGkzhU/mffOY83iWbvXRodIV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a0tuVWt2ZjN6dDRjdmJSTmFNWThPMXFaR003OGZFT25ZYTJ5KzkwTlpVbGQ0?=
 =?utf-8?B?WEZRc21OMjNYSnB3MHdHd1ZIOFhKenFESjhoSko3dmM1US9Wc0lnUVRNdFdn?=
 =?utf-8?B?TnFqb2ZIQXd6a0dqSHNDTjg0blVZY29PU2FlVVJyN3haNmNTSjlEWXdoSEJB?=
 =?utf-8?B?Sm82Zy9KbVBxUDZ6endYOEpkMm05elcrNEgxbDA2YVFhUTFQWVFFZ1dtREM3?=
 =?utf-8?B?VnB5S2d1Njg0aDVvc3pCcHp0UkVKNXAyVU85Y3hNa1JYdjQ4NHR5RDdwRjgv?=
 =?utf-8?B?TFNDRkJobWtBTVdqN1VaYWRkdVBnNkhqSGV2bjRJdlVDT1BTQjUyYWl3MjhP?=
 =?utf-8?B?cklCSEUveWRLWVRmcmZndnlFd1pvSXJ6MjVuUVFSQ2lmYzZtUFppM1IvdDAx?=
 =?utf-8?B?Skt0dDJtOUxVUlZrUVErU1NQeE85bVVlSHduZzFKakdPdm9PNUd0YitJOE1o?=
 =?utf-8?B?czk4Q0pVdHAxdC9XTkljRlNqbTFWVFUxaE95czFnOTlkZk5neUFvajFRQjdn?=
 =?utf-8?B?b2JNWFFibVFyanA0bUtoeVpSMGFJdWcyZkFkZWE2cW5yVHB2TDE2Tm82eGgx?=
 =?utf-8?B?dlpZeWI2cTQ5S0FYcTdZSzgyVUk4eUJ0TThQTlE2QzFYYmlJRCt3SFVZYXAw?=
 =?utf-8?B?bytkcENncVRJdmJvTzRiM2lLMHdycFFMZ3poK0w0dVpLQ0NWeW5RMnFFYnBM?=
 =?utf-8?B?ZkhOMlBBUno1eHRjMVhyaHZVejM0VHVyREhBRWhZZWRueU0vYkU0dTNkOVc4?=
 =?utf-8?B?MU1KdGdkZU9TMmV5QURZSlgybHhVa05PUU1lK2tmWHJXZXBPYnhkYTMzQnpS?=
 =?utf-8?B?TEpLQzhGNGhhTTE2RVlLUFlsTjdPbWJmSWtKWTJGZ1lmdXozKzJqSjM2cDdx?=
 =?utf-8?B?Q1dLMk8yR2VQblc2TzZjQTViajcvczNXeldsQ3JQRWtzSjNvMWdPUy9XVHpv?=
 =?utf-8?B?K0hVSDgwTUtsQlVFYmRoZkUydWhESUVUeENuMDBDQU51WFlwNndwckYyQTRC?=
 =?utf-8?B?K2lsaHEvYk1odEE3ZWFWMm54RWY3MmlCQ3drRDBEUFhacXVjSWE1dHVKQ2Yw?=
 =?utf-8?B?M2pQS29MWHEyTUZraTh6UHA1Z1dWUkcxTFdsZGFBeDJDREttb3pUelNoejlZ?=
 =?utf-8?B?VEJkMWJkRVJVMm5hR0FqbkYzV0UwMHhYTGFNQWlPYUxwYUZJcG0zcVovM3pz?=
 =?utf-8?B?Z05oUmNNQ0dwTWNVanVBZVBVdERNQjNTWHNqOWMzQytVVnZ1N3BaTFk0SEZj?=
 =?utf-8?B?bjVReU56RUJnUHVKL2xBYVZSMnZ1VE5tVG9wdHZoQ014TUltZHFKMFNYQUc2?=
 =?utf-8?B?NW1oZjR0OGZlYkVtYmxTK04yVjNldWlOWitPVnB1VE9neThnVmtTaytyVE9D?=
 =?utf-8?B?UHdPTnRNdXlMMmdqRG1KWDFSYVphc0RHVVRiSUt3MjJGZkZGWlNDYnFRRUxE?=
 =?utf-8?B?cEl6NHZCQm9HanoxUjNsSzZlZW9jWHJ2Q01GVjhqUnNKM2cxRjdjb2dVeVdB?=
 =?utf-8?B?R1dpUGJWMEhYMnhnOTgzL3NGbnpLTitpTW14LzJYbFhuK0JnRGJDeVFuMTFX?=
 =?utf-8?B?dlNJU2xXaWp3c2wvRTJYMGZWNzNMN1kwUnFnOVRjMUMwd0VRZU1wenZFZTBG?=
 =?utf-8?B?dE80NmUvSXQ3R2xxUGJuVUZDOFV2amU3c1BodXZJcnFXQTd1bDhkckk4aGZG?=
 =?utf-8?B?djB1ZW04bjZmNG1JMHpWbEJoeHRUVFZGQnhYUHNpekpaRUI4aVljTU15K0dM?=
 =?utf-8?Q?FtKMuxtFgxR4KqfZ25dzSfgbLU7G/dqJUWhL5FU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c929c10-8da1-4290-e0f4-08d8d7347da9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:19:32.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBlRVw41hkItvhjvnCAb5gG3rDldpASQy0bTAgi8NLkt9shh8ll6QB5C5FPtz9XZq3GxCDbmSksHBBWmNceAykmdp08aRwOtn9pFDsJhBhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------85B0700E7A17DC9796478101"
Content-Language: en-US

--------------85B0700E7A17DC9796478101
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:55 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-configargparse_1.2.3.bb => python3-configargparse_1.3.bb} | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-configargparse_1.2.3.bb => python3-configargparse_1.3.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
> rename to meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
> index 54841c243..aac58de37 100644
> --- a/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
>
> -SRC_URI[md5sum] = "8978866babc7ff0994f691ebe48b5aba"
> -SRC_URI[sha256sum] = "edd17be986d5c1ba2e307150b8e5f5107aba125f3574dddd02c85d5cdcfd37dc"
> +SRC_URI[sha256sum] = "0428b975ab6c48bb101ccb732e1b5cb616296e28268e032aa806f32b647a1cc1"
>
>   PYPI_PACKAGE = "ConfigArgParse"
>
> @@ -19,4 +18,3 @@ RDEPENDS_${PN} += "\
>   "
>
>   BBCLASSEXTEND = "native nativesdk"
> -
> --
> 2.25.1
>
>
> 
>

--------------85B0700E7A17DC9796478101
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:55 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215551.2368621-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215551.2368621-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-configargparse_1.2.3.bb =&gt; python3-configargparse_1.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.2.3.bb =&gt; python3-configargparse_1.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
index 54841c243..aac58de37 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bw2/ConfigArgParse">&quot;https://github.com/bw2/ConfigArgParse&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=da746463714cc35999ed9a42339f2943">&quot;file://LICENSE;md5=da746463714cc35999ed9a42339f2943&quot;</a>

-SRC_URI[md5sum] = &quot;8978866babc7ff0994f691ebe48b5aba&quot;
-SRC_URI[sha256sum] = &quot;edd17be986d5c1ba2e307150b8e5f5107aba125f3574dddd02c85d5cdcfd37dc&quot;
+SRC_URI[sha256sum] = &quot;0428b975ab6c48bb101ccb732e1b5cb616296e28268e032aa806f32b647a1cc1&quot;

 PYPI_PACKAGE = &quot;ConfigArgParse&quot;

@@ -19,4 +18,3 @@ RDEPENDS_${PN} += &quot;\
 &quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
-
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

--------------85B0700E7A17DC9796478101--
