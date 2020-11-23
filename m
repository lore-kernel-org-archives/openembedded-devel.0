Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.67])
 by mx.groups.io with SMTP id smtpd.web11.42377.1606165108335313723
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CFzNxshq;
 spf=pass (domain: windriver.com, ip: 40.107.223.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iE6JJOWCcRv50WsSIedCOINEuhWKODOj6L98lYri1kB7B+3Vk0sR5IV5hLMKAX5Y3AUqyDFyhhQj+40/QzY7VmTUR/WL7NPGNc0hJfDALlJ/5jrleZ/Cy8T1zCYmRNH4D1ODJ5ZvwqOFuqG5U262VqsW/fKvhYCeNzFC/HBgROMIEYNEuQkypUC7Ur+MxgLJtxj7asrYzWTjpZeMVafestXaEKj13VtKIXGiYCZEIJlwF4vIcpo8kc9fRYWExzx9gptDjLBjgpV/Y5zkcl6MU+PDZEv+KUBEzgnwFX3cxcxbW51CVQkNVXuTWQUIOwsojuCzFDj0ccE+WcQNdx7vtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fduoa5zE458HadhxvdFCVS51ep4jmt3OzF69lMuIQjU=;
 b=bZHb2PYFcldYb4kYk5oeOjYhXBJSauB/PB+xCraVZcZEit0dXs8jpiPj49YNvE6WS+myBNsQS0TE8LQunND/uZ+/6D/Cpry4UDCoFtHT3tzQbxUVO7DJ9CzRV6D8q5CEgJxk5sLP+Pc5mhjrp4nP9T5AJB+wb43AiVzgeBIl/7SQSKfiDStLNeoqNEh0O0siiRZtum27MrdrgxQSzvLi+uHI3fG3N0iiqFyBLDCg8vKr+omAY94xAiM9Jr3Vvy17U3wiPVf+SjvdC5huh765zoRlzMLymfAPGPzbzvei9DF2U+fOPR9g6FQFy/Y80G9EVjfV6GlRie0ZTqW6a6qXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fduoa5zE458HadhxvdFCVS51ep4jmt3OzF69lMuIQjU=;
 b=CFzNxshqefTsVJo2zk0rAG+0Qm2YMDh+jgY5LAEcAJBv6+ykT8qfbOaE3uOwtnNkyXCb4qDq1fRSS3DDD7ghjTuZ3YBihjPwoTcBqQyK8QH9uNCZR1rkGxWNoS6IKiFFYgcECm0wPXzPhOnNzQVJ1jwy7n27SnbOmwN1ihEhjRs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:58:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:58:27 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-hypothesis: Add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201123062441.2998158-1-raj.khem@gmail.com>
 <20201123062441.2998158-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1b64c37d-4683-7340-b077-35a554f04522@windriver.com>
Date: Mon, 23 Nov 2020 15:58:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201123062441.2998158-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:58:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c25a5cd-cf4c-4742-cc42-08d88ff28648
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB260001F57D37CA90C68861529FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zbf7eZs4SzZhSTEa2UfCfrxYYHhTUwhYNbs6pCnkGnqsw+LEpV0OE9zm2HMQck6N+qusKhWGIlavBu65QtcQ7nRLSmdj3VbUgA7Z272rIoMDGcs5AcalTKBFZe9k1M5K0yfFIewoun/7GQ/wig96hPKAI2LoV+95IN0t/j+M3f/aM60quU84DQ1vdrGUIstd9ZPveqDgLj1kbJ1NkPWqmvQxjxRT0PvNWIqH/dJSZwmBPc2AU+KaWdpT7VcqEbfBuiFPycJeaxh9Hro1Jttjyk/xwNlhSp/KwZnRsRa75WqZoac6xYhS3VImKXZ6mVwGJ5Lv+QLMHTcODP2LGFiyz5/k2NgMnnMoChKmw8QSg5njaLVX/8eS21b732j2CpxZqSX33M8T2GWBek4FqhBAeZTfwYxeK+v4K7VL1gfXrM6bjzCsp8Ogc+UL8HAibIHMe/96L3DFAaAXbywX3r01rg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Eg0C+EAG/8KrMERjC9cCtMqUwB6aR/kBLdHZd+GimFXErnT1cJweh53WtUkekpe42x8F6QNJiWtf8wBR2O5IcH9FT9YVBJpOnZgkzhMN3B8yZTn4+qHonry0K4984i+xpup7rM+nvMYH18E+AhnDvxg5lO+pIsWpjyJXqca5jW6h2Fz33A9gycMyFUcRtvU1ZCjDT62S4v/zEhKfwEtgppif092NKTMgt9S86gn6ZlWDhbGaN1yiD0gvy3x/fFwqvyVRAjh2RdSBJYGlQlU+dMUjhlVo86D2GssDLkZX7ImcYZaAEKa5JSNhKqhgPGJ4amqs/20uTkP2ASxH0QfltBgWFvnWkIVIeXtYDvX9z1PDt27uHhkSgIf3vbeSsAH8nmrxr0e8QbBQEfEEXBj9IN/3OMublH5Sqipr6XTCOuQvHg0wJoxWQ2EiQPAGnRyinGH4N/nOdO8gnn/R8JhYtC1O6js+npaMARXPdRl1If59OXCpzrKCV+Li3NS0ctlWEqgwQOmvX7q1Tk7cZq4izTneXR+nRPDs0gKgEUVX80EXWRevbzEOBjBIEDgtPQL+oMiyUXbIWPQy0z7vkc/2Db/vl7hk2bzPTxyei1NQ6449w0C/9BWzC/l1ONzpvJX3QHM5cmGFq2buAafo8omxAjZphk90i7uVH0XJFytvkHm+xXtTZVgbnwW400Q7loYn696SJ20/eTfyOYRSk9pgR5DR4WRp93szlavhBxCeImJa2ef0TdKTyTIngpoT0HldOEFF4dRt/WsVnwrAc0S6CkVywhPDeYwYyVjP2Xyh66AG3TZQMKw41oNQ1fVnRTq4RUBUVTZpf1Q1tgHSqZIHqed99Cz8gVOeCq3EfX0Jfs4fCPvnbRaZ+eMMFU1rw1m8bckyV5VBENGr3xZ8zS+pYw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c25a5cd-cf4c-4742-cc42-08d88ff28648
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:58:27.3748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjBj3mwT7ayUhE/vc8bHK0w3frHGlChFg9wzzad06JZIb052utBjL39pFyh6kSEjvc8quYYcAyeGggxyw+GXaFCCQa2CNLDso70JqTfSzYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------1961794FCA4FBD0661AC2118"
Content-Language: en-US

--------------1961794FCA4FBD0661AC2118
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-23 1:24 a.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Its needed by python3-numpy pytests
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-hypothesis_5.41.3.bb            | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
> new file mode 100644
> index 0000000000..b7bf15c31e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "A library for property-based testing"
> +HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
> +
> +PYPI_PACKAGE = "hypothesis"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
> +
> +RDEPENDS_${PN} += "python3-core"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.29.2
>
>
> 
>

--------------1961794FCA4FBD0661AC2118
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-23 1:24 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201123062441.2998158-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Its needed by python3-numpy pytests

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201123062441.2998158-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-hypothesis_5.41.3.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
new file mode 100644
index 0000000000..b7bf15c31e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = &quot;A library for property-based testing&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python">&quot;https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python&quot;</a>
+LICENSE = &quot;MPL-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c">&quot;file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c&quot;</a>
+
+PYPI_PACKAGE = &quot;hypothesis&quot;
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = &quot;6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688&quot;
+
+RDEPENDS_${PN} += &quot;python3-core&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1961794FCA4FBD0661AC2118--
