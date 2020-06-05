Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.70])
 by mx.groups.io with SMTP id smtpd.web11.212.1591385290050076107
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 12:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TfFd/noU;
 spf=pass (domain: windriver.com, ip: 40.107.76.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhP9Mbe1Jp9FsdgakBx/b6kos4dpdjx7EsN6QgMomYtAf2nj/bSH2FwrJEZbIZ993xHM5ylHNPLd3sOUaArgrLo4dCkogOhV0/lYq8Vgmn4EYwox6J5e2XpK0IF5YsCX78owlL3lMYb0qCzEX3OD9zYmzG//JjNS8y5gB/486NDEZVHY5F6XrmQAlBREQ7r2KLBBRl3WqMhJTXWQK+onagpQN/2hhNgi0T4Hy5aOKRuk/AE/PpTL+2t1qXlHtU2V/E/1nbSQ6fks4E9sdjIvckVICA/Di8737LNj9WOy1Kmz0X4hbrAHejcsjFhBH8vsXI+5Z+uK3xBUJNlSayjuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgoxxgOvyzhIotVoE6E1n1Zs9BpPln0ZSYdVCYHxIF8=;
 b=gky206ULQ49taZBShtngxZEUuuNN0B9TrKSECb6V4dJEqlj4akhCWgqytZx3EuR7mWtV7GEukXe2x2HL3jO2ALWVY2pzt5YPk2oGW91FazNeUMviFGD5z97TFXzQD1EPSwlZZWMoneVaBu6RSQAtlR0eYYi1YJlXaw776PKBqNy28Qepo2I0mSmIx7k8B9UvUrseazidDEmuJZnOfgT+hGe1zVeHKzl8zVkGQ48iNDg2nIr13/G+rzARmBp7a3JuAcD9XMnIRPB+eBHa42GA6NXmJpdyEKfbKuJns+eM8ARFdRRMFFkiR5vhEMQ5FFPLhjOmiW0Ps1xouYtP7p421A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgoxxgOvyzhIotVoE6E1n1Zs9BpPln0ZSYdVCYHxIF8=;
 b=TfFd/noUF5pXE9WGFRWUw1CxlQ/FKiuy57Vx2YVfXq3DA+xzr0nyLfLo5LhB3MdkQljkRMPt2yF6zMuR6E+DhNr+9g/9tQ+uqwiPxURAv1eN8Tdbm7qj6BKfInHaQ40x7+EWA1R7NMCynK659BHoLo6aHe+yZ6hU5dE6uQbpkSc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4033.namprd11.prod.outlook.com (2603:10b6:405:78::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 19:28:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 19:28:08 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-jsonpatch: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200605173152.2360-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a48b1153-9354-1933-7f0a-28f30cc6369d@windriver.com>
Date: Fri, 5 Jun 2020 15:28:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200605173152.2360-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 19:28:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c515055-b573-4e8b-632f-08d809869375
X-MS-TrafficTypeDiagnostic: BN6PR11MB4033:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB40333303C02A7490B16241E79F860@BN6PR11MB4033.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I3SO8UhotNCEp8bdl+gwCVT+0W8eIL/uphIPammr1uPDhlrV9jXI1WfOqvFHqxQH5FbtCRvDWf+dh1eZFFinQggC41rpIC1o2GBO+geL5c7VHU/skjdBtXOSfVXufxAMiDZU47VShqXVR+VLnOlcEDBXSEe5lNXHqrmSrk8r0PU25L61cPDicY7hbgR8UwZCXoC96GharlI6Gq/woS/Oo/SNcIf9LGpcubPOTrbOevCtFdFE1iRO6Z/KIm/esFfPS1pE3pqsh4EjkuQYbTGjFYQyUIxD18dXeHUvDR6cC/5MJ0vjjxvI6xHC8ySjlfSk/zLUHJUT+ecAnhFdxWHhdCD1dCANwpSd8mgPiHKM/WzpzAGqnH3kHdtFDrq+NtNscKZ/iMtHhvcUzMWryEiogxnCW2bBH2009BhXakdeFBAnGfPMiGaPgV1lFKyJZ/DpYA7J//w1VkR2sLzUpBSAAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(366004)(346002)(16576012)(16526019)(86362001)(66556008)(186003)(53546011)(66476007)(44832011)(66946007)(316002)(956004)(26005)(6486002)(83380400001)(2616005)(36756003)(31696002)(478600001)(52116002)(8936002)(966005)(33964004)(5660300002)(166002)(2906002)(31686004)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IF7ffveVrOc0iMCQmtyP5854XPv3sBKkdsTjTaXxojdEIpsyrABzhSGLE2Oa6hXJeVPRRyqqA670S7PJhJMOOvsHBjlBKZG2HNpy0+eatEWIFj3H1JTcdLgHWDV0yvawooWUsZ2kvDeJgE6ocYawfpXxjyJtpTV5h3QrkEprQmqkObIRimyjyCPAY2hD3+coSCDZKDTSsRNsUHRsmuG71Gq7P2u2URwYjjZWqGJ5xMwvhkXNuviWnA3QZU2AE1gy9RpS95K0CMefK/cQApvCNKcTVxsk9Z4aTI5L0ZpI9hUkU/iYOEVApA8fES0n+/YjA7sggeABp3mlahBH83rqyZ5c6EUDIuMj//JlpC3KR8RyCEDJUyBDJye0vUXgix6UHIXguMNwMQ5tSCkuQk5HfQOTgAxbWbRH9+KnYhukct91wAdgoG8O434H0s+4fOum7EyNip9pUTBq8Bip4lAQdg/OPQw7a9ay5GTvRNFYWOiFKt/JXWUNis+GhMiLGoxQ
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c515055-b573-4e8b-632f-08d809869375
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 19:28:07.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAELkrcV0NYvmyylwuX8Am02gVdz+LdZ3MLzl8De459r17to7Onm9IPziE4o0q+YAnuKEFKO2d80Z6pAExbY932l1yn8mRDIdpJ3vS4k2DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4033
Content-Type: multipart/alternative;
 boundary="------------D3EEBE7ABA4C1B138E374DD8"
Content-Language: en-US

--------------D3EEBE7ABA4C1B138E374DD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/5/20 1:31 PM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-jsonpatch.inc    | 12 ------------
>   .../python/python3-jsonpatch_1.25.bb                | 13 +++++++++++--
>   2 files changed, 11 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-jsonpatch.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> deleted file mode 100644
> index e23f96b61..000000000
> --- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
> -HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] = "fcc546892414bef2f7f89f0e2a618a9e"
> -SRC_URI[sha256sum] = "ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
> -
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
> index 73efceeed..8ec21ff11 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
> @@ -1,2 +1,11 @@
> -inherit setuptools3
> -require python-jsonpatch.inc
> +SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
> +HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "fcc546892414bef2f7f89f0e2a618a9e"
> +SRC_URI[sha256sum] = "ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
>
> 

--------------D3EEBE7ABA4C1B138E374DD8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/5/20 1:31 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200605173152.2360-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200605173152.2360-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-jsonpatch.inc    | 12 ------------
 .../python/python3-jsonpatch_1.25.bb                | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 11 insertions(&#43;), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpatch.inc

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
deleted file mode 100644
index e23f96b61..000000000
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
&#43;&#43;&#43; /dev/null
@@ -1,12 &#43;0,0 @@
-SUMMARY  = &quot;Appling JSON patches in Python 2.6&#43; and 3.x&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/stefankoegl/python-json-patch">&quot;https://github.com/stefankoegl/python-json-patch&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>
-
-inherit pypi
-
-SRC_URI[md5sum] = &quot;fcc546892414bef2f7f89f0e2a618a9e&quot;
-SRC_URI[sha256sum] = &quot;ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a&quot;
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold&quot;
-
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
index 73efceeed..8ec21ff11 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
@@ -1,2 &#43;1,11 @@
-inherit setuptools3
-require python-jsonpatch.inc
&#43;SUMMARY  = &quot;Appling JSON patches in Python 2.6&#43; and 3.x&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/stefankoegl/python-json-patch">&quot;https://github.com/stefankoegl/python-json-patch&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;fcc546892414bef2f7f89f0e2a618a9e&quot;
&#43;SRC_URI[sha256sum] = &quot;ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D3EEBE7ABA4C1B138E374DD8--
