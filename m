Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.51])
 by mx.groups.io with SMTP id smtpd.web12.7826.1614177609917107813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KeXHjz+B;
 spf=pass (domain: windriver.com, ip: 40.107.77.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOVKfJRs4BD7Te1HIBxmeVUc+T9y0eIGNUTQEUyII+E5v0b+lCoh7m3iKLUcxlU1OWE8BuZab8v6UL4X8Sb8Ol4cXpsX3JP4QGgNml7rdEQPmfTtchI3Teq2bRaqNBct5Rfhnz6pmUBAblpsPhU0ZwzuN4DEBET12cTgmaNVe8bsz38SVh5JehgOSFbLn7g6nSPMTZepz15MqInAct0XI51R3xEFR1Aa6yLzvDrTLWTLPkVZhZO63nRB0TuJb9yJOhJRYrz6xTIiMFYIDlvrQZX5LE6ZBxd8/1yp4WGVcAv2F23S/2mhy9iNj6ngyqY87m+qGcOUfmoF8DEYJScYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvnFYFrhLF5/3EejBnhhUW30/qXOlt7XlQZBdsIXnNk=;
 b=C16EtPCkd1Q1PtfY/AwpobjJYmWry46DUQoHCNI/JUlV9KTMhRJ4Eieg9pOLcF37LQmE6if+BRv4iSnT/AbSOiRDivsC3HSfbAacY+vTvdkFuKzgeOMJmr+UqPd/PaLaLgAYEoMic4ysiJQTbNI7gIA8ViqC0TN4C5hm/chO0xlvHz9bhQJcIDpCzP33N5W7rYfrkBqw/L8tpKcjyvYCx3nD8Hph9kmDGTWRZOVfzDAuQQXPjNhXj6PKTLmPcx6uj2E2fWNj0bfRd2zZo6MWM8kCD8U7UDsMytblk2HBhhU8MfCgU29ecKqpGyUNWno98sOlGUCnONANIg8QWBV9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvnFYFrhLF5/3EejBnhhUW30/qXOlt7XlQZBdsIXnNk=;
 b=KeXHjz+BHZ9EHLpW7llzKrbBMwVMs8OqcWNFbAHz72ygoc+gls+t+1jpKLFcZBMLKNWs2e/zMuamOXHYUN+RDffO35ff7F6CYgH30Lj97eZSuJDaF6A417wEMQqEebqvKops2oqXzl0UpXR27S72LCkD/L598h0rS8oYj8Llta4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 14:40:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:40:08 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-transitions: Upgrade 0.8.6 -> 0.8.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <abd9f3cb-a581-3c94-c6c8-2fcaa2d6f078@windriver.com>
Date: Wed, 24 Feb 2021 09:40:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210222175043.21231-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0903.namprd03.prod.outlook.com
 (2603:10b6:408:107::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0903.namprd03.prod.outlook.com (2603:10b6:408:107::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 14:40:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5927394-ff03-47e9-2269-08d8d8d21525
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26781E1F0F7259436A946C679F9F9@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZcpkxVg7G1F/vR7NkuNY4UqVbQ6/RhiUEttIQATWpmUBJr/ZAJCDIL5KzumJjnOZ6YNwlSxi5br+/pfG9Uv3KwivHcokfMsWeCETA36ssevDDbRHDsAUq6n2pjkt0Ph01o6eUqBkDReHS0/Ue6YUhYNajBbFEAbSvNNMvwsdaiU1s76oEjGSt5Vw3ufjp1An8oTBkVrxF6QpH4ez3QKgGVQej+HFzUcatTmTfnmEGwagKo9tiRXzrBBAWbdH4GLsAfSn2Spw4eiCfLPspIcytNen7DFoLEcGw3sP/sl98rqZvfDCU5dI7HAIvImVKvYbi/vYXd6XApLTmfk8sKSC9vbZrTFRDLKRDsANP4kLPpoXf8NdEUzAmiS9pXD7ucPueDlg6YNMjfno8XyKYtFHxMPws9f5+rrMlTemk1bRM0aZU3ErrltNkIzehT+ELLtO2jBqqaQbjgb4gpjqW+uCu8+pwk6tEmoKeaYky1EC2/tAMP6z7J2B/PchB+llXn+8FEluwv2mDseWTqoKXUn+K42fC27AEyEXwJ4JRoFtt+UOXztg+YwHORHIHEKuIvyzh3uUzwX6B0wyJlzLm3gmtzc7U5WOYBH7ToWk8Wzhfzw2HoAbRHab3usgwB1AXby5s6c9apDpELxtaBO2gGH8D6Hs1Zzy6divd1E+2vXBP2DeertxvdbCiuqFsbba9lj/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(8676002)(31686004)(8936002)(36756003)(478600001)(86362001)(33964004)(31696002)(66556008)(16526019)(26005)(956004)(2906002)(44832011)(66946007)(66476007)(5660300002)(6486002)(83380400001)(316002)(53546011)(2616005)(166002)(186003)(966005)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OEtIcko2STQ1MVoybG05Z29FYjJoK0daTkJrUm91YmFYaTc2YnlHM1l3ckhV?=
 =?utf-8?B?SVlIOENNaE41QzlDZXpCcDVsSkNLN0tuak13NEg4NDM4cXVIUGpoU2x2K0tU?=
 =?utf-8?B?b3VOdG5GRU5pOUpLWWRpOVYxTFpJYU1PZlRkaitRUERtaVVkUXZmK2U2SVdw?=
 =?utf-8?B?T1RzWlNURzJjTjVaTEhMSGJXSVRrSU44RXU5NWNsb2tIWGlxZ21aZDh3bTBM?=
 =?utf-8?B?THZkR2I2OEZoelZzRG5DZG5NKys5MTdZKzdndFdwZ2FlRlVmRWVkOFZNM05a?=
 =?utf-8?B?clE4eFV1bEFXQXFqa1ozZ1VBOXZaN3JjOEVlNVByajl5WUZ5WUloZnVWUHJn?=
 =?utf-8?B?QXRWMkNPMmVDT2ovemhUL3Z1SmdLQ2tJVWliNUdSdGtoS1RDK0orRlZSeW5t?=
 =?utf-8?B?TTdKUDBvSjVNTk85N3owdGExam5OUlBzc0MxMVlBUWlwSTN2NHlXU3BiN2VP?=
 =?utf-8?B?bTJ3a0daaEJHREpZNitzeWdLZmpCZ1EvWXRwMmNrbWV6d1NLcHE2OW16NkN6?=
 =?utf-8?B?Ujhmb3NKUExaVkRLN05pcS9ueXQrWW10dmFMTHF4WkNyQ2JYTG1xM09yODlQ?=
 =?utf-8?B?SUMvZm9oWmN5T2JWdWM4N0FRRGdZNWtyZVgzWEY1RzVHeDNjTnNucjVhZFBZ?=
 =?utf-8?B?dVMvMG1lUG0vL0pLRXYyd0pJUEFRakdQemIzUU9hQTFENjlxaVFWZFJ0Q3Zw?=
 =?utf-8?B?KzlsSXlrNkdjQ0JhQjU3KzVlMFFNbVU2UzJuYVEzUVhUVndGVlc4dmpmczlZ?=
 =?utf-8?B?TndkYVAwSVNFbWhsTDBlbVRnRGhsckd6TzQ3c1FNaVVaUTFxcSsrQVh4MWZV?=
 =?utf-8?B?RjRHK010bXFobjBKUlBId3lpeDBiRG9Dc2VjUnpKKysrOEJWVzFwcmo0VVQ0?=
 =?utf-8?B?RnlpUS9tSk5tTjc2anMwRC9pWWRENzlJcHZGQjdXb2VCMXRLcCt2YUR1bS9p?=
 =?utf-8?B?aWFVUGdZeHhIM2R4M1NGV2dVMUFkSmNCN2dFVk5HMUhwWC8zdzZkcytNeGNn?=
 =?utf-8?B?cGxpOGtBdm9hM3c0V3gyYURCbU4rbXRLS3Jna3ovWVo2ZXNBdTlzQkUrS1RN?=
 =?utf-8?B?U0FIM3JPVEdjaVlzdW9oc1pWcmhHekx0VFovYWNTYWlIeEpiRVRFaFo2NUFP?=
 =?utf-8?B?UVRDaXpsbElERWJGQ2Ixd0tqMHgxSloxZXVvZ2VUcUFzT0c0QnFQSDNmNC9j?=
 =?utf-8?B?UFdBZXB3cUFjNGpITjRTUFVERU9GSkNlV3Q5YUxkRlRXWUhSM2Uycnk2SEdE?=
 =?utf-8?B?MnFpTXI0QTgwTkpCSXFnaU1XejJaNEpvNmRsTGdJZjlVMGh1ZlBYK2JoQ2gv?=
 =?utf-8?B?ZXFTRXFYZVc3dldWWXpWdnZkelgwT0JUS2dUdW5hOHFxb1hCSmpDSlRoaXBL?=
 =?utf-8?B?WVBBZm5iZDd0bGtwYzZpeUdUa200bTlIT3NVK2RDVDRoQVhrS2FxQWYvaVBz?=
 =?utf-8?B?d2dEWVhWZHBqTGdYRVdQcTZKQStKcEZZN2xKUWlZYnB4RGxPRmQxN3diK0k1?=
 =?utf-8?B?MmxyZW51SEcvRnRNVHFHd1hlU09hTUxMbk9hVXhtMzh3Vksxd0tRRTBnVU8y?=
 =?utf-8?B?TDFIM0U0amsyRFlyOXJzRVJRdWxSdTd3TFJMSkNxOEJISi9ESTFUYkVnaXhD?=
 =?utf-8?B?c3V6VkI1Rm9CdlJqOVNRUnUzdnFocFBvOGdlaGNsK3Z3TkVqZWNRN2lhMEdw?=
 =?utf-8?B?KzFJUmRyYnVDY3JzZy9kUUd1RFR4c3ZLY2t4NUY3TDlrMjV3c0tHRGlKSVdv?=
 =?utf-8?Q?lrhKxEmIyXDLOtpuO0ic5E19sQIKaqE0UK8SRVu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5927394-ff03-47e9-2269-08d8d8d21525
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:40:08.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZGXf/1mxfc/xzJ2GbCXlbVKenROqvO+q/MsWP/67hytTpmCMF2haYQxaQFFJMmWz+wslSb2J4zI3wEI28VgthvnSfEO/odbwLw49q7LFc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------5F32F24B63E89EC7EE9CE675"
Content-Language: en-US

--------------5F32F24B63E89EC7EE9CE675
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-22 12:50 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.8.7:
>
> - State configuration dictionaries passed to HierarchicalMachine
>    can also use states as a keyword to define substates. If
>    children and states are present, only children will be
>    considered.
> - HierarchicalMachine with custom separator now adds is_state
>    partials for nested states (e.g. is_C.s3.a()) to models.
> - Use model_attribute consistently in AsyncMachine
> - Testing now treats most warnings as errors
> - As a consequence, pygraphviz.Agraph in diagrams_pygraphviz are
>    now copied by transitions since AGraph.copy as of version 1.6
>    does not close temporary files appropriately
> - HierarchicalMachine now checks whether state_cls, event_cls and
>    transition_cls have been subclassed from nested base classes
>    (e.g. NestedState) to prevent hard to debug inheritance errors
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-transitions_0.8.6.bb => python3-transitions_0.8.7.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-transitions_0.8.6.bb => python3-transitions_0.8.7.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
> rename to meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
> index 701c82cda8..04a033742a 100644
> --- a/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
> @@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "032e10113139852ffb3ecfa4c2a5138f87441d85c3d6ad9122bb4b0978180a8d"
> +SRC_URI[sha256sum] = "8c60ec0828cd037820726283cad5d4d77a5e31514e058b51250420e9873e9bc7"
>
>   RDEPENDS_${PN} += "python3-six"
> --
> 2.17.1
>
>
> 
>

--------------5F32F24B63E89EC7EE9CE675
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-22 12:50 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210222175043.21231-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.8.7:

- State configuration dictionaries passed to HierarchicalMachine
  can also use states as a keyword to define substates. If
  children and states are present, only children will be
  considered.
- HierarchicalMachine with custom separator now adds is_state
  partials for nested states (e.g. is_C.s3.a()) to models.
- Use model_attribute consistently in AsyncMachine
- Testing now treats most warnings as errors
- As a consequence, pygraphviz.Agraph in diagrams_pygraphviz are
  now copied by transitions since AGraph.copy as of version 1.6
  does not close temporary files appropriately
- HierarchicalMachine now checks whether state_cls, event_cls and
  transition_cls have been subclassed from nested base classes
  (e.g. NestedState) to prevent hard to debug inheritance errors

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210222175043.21231-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-transitions_0.8.6.bb =&gt; python3-transitions_0.8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.6.bb =&gt; python3-transitions_0.8.7.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
index 701c82cda8..04a033742a 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47">&quot;file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;032e10113139852ffb3ecfa4c2a5138f87441d85c3d6ad9122bb4b0978180a8d&quot;
+SRC_URI[sha256sum] = &quot;8c60ec0828cd037820726283cad5d4d77a5e31514e058b51250420e9873e9bc7&quot;

 RDEPENDS_${PN} += &quot;python3-six&quot;
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

--------------5F32F24B63E89EC7EE9CE675--
