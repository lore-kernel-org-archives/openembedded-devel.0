Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.75])
 by mx.groups.io with SMTP id smtpd.web10.2182.1594577823976105101
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pjvdozZT;
 spf=pass (domain: windriver.com, ip: 40.107.236.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQHgj3k3wUtYu/iolHnwEKuJ+kGJ9/hKEeucSzkXCv2mDwJMvj1r4WDuRm/H5n/p9cayf7DTRwh06Mrd7JNDTSHDTN0FRKxaa6ZvjJ8IobghpQpP8U4GwCWLhHcl72VWl812xcXYzdyNoPt00QE/J3JxkBszUSlxj6wKdCLWiudJ2GuLROcKD4Er8FlaFRsoNDk2zsAiwb/6DXgKaT98y3K8TmOSnnyXzWwKGlKFvFmyRYAplH+it962UwSYNkVflJLaES8obWYKFYdhH9FQxeVxBzrcMvZTakqdeZN05SbqIcA9Ed70mghFAYlE12wQKQNaXjUy10VXsPuTQfpqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsPwhKxQT6xxdaxOUIPuQUp5o2ofbBWOnQqEVBpJGsY=;
 b=RaSv9otvPisoP24Uy67CbWSN04PRzt/UggeeMIm4Lux/o5tq4eHT54t0u4CSkxzUQlIzFPa/QCqEJhqzluX6nbm+eoJkLVV1KdNYuqUjelt+J4VMBQMk2/su9W6r8Xm3UnSM1ok4J/84Io0Yf6WIQ062AwvWnrFNWF+va9+GQX7iF1YHhVVHXZVXIo6Jzf8uM+a9r38HkWlznT9NViFxDzuAHC4LukJkCu53ZS7gZmXRAQZv6xV6hQogAkNMq5/Mmu5ehbD7HQuu1lBTtJs4ewklmgy7fm57V4lrtX6JdK+mos+YAiezA8FghVaWg6OwjHQeaqdHcTucFY6exwsGrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsPwhKxQT6xxdaxOUIPuQUp5o2ofbBWOnQqEVBpJGsY=;
 b=pjvdozZT0cbRy08pucc+SqM+L+FpWroHj+KQMY1Gh8ttQZa20MnH73UqcWzz3g7/UlgElzyDSFmn3KUspaTN6XVgkAi6Uiwz0uJ9rplAJVu9hA0PfxXTfu7TgFU3GmDS+++A2xwfL9bUPBR5gejorZpZ9ICEE4GP8yilFLkkPZs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:17:02 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:17:02 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pytz: upgrade 2019.3 -> 2020.1
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com>
 <1594306837-45766-2-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <399a4138-82dd-24fb-2076-cf389a7f88de@windriver.com>
Date: Sun, 12 Jul 2020 14:17:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594306837-45766-2-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::16) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sun, 12 Jul 2020 18:17:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd716733-8eb3-4def-189d-08d8268fc64d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4532:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB453270699AD44B748AA67C8B9F630@DM6PR11MB4532.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	toXcGY85HU4tKBVlVVt3YbDT2M7WnhnFSJezBK2tLsBp22Z+m2J31iXjDeomIwHLmBIrhk8Y+mblF7lw36Q5YVyn9+z3atAxGwT+P7xQdtG5AoW5xmGonIqUHAS59YfxzIgDkPomWiwWSgOHpRGbqIdG3bVL+lRXf6Q/hTC5a4CDgqaFM/Y844Ri0FCoI04ho8Ayv5Dsg9ybdW1JiCfAZiSnEkHFmOY56tB7wu8sVRLSpQiNJZywBtGI5G/4+Eeflbg5NutItY3ExdyG4F5eZqCISFcmljyR/To8bG951DqePjDpwj8+ZAkaFX9g3arj+3T2rGPHmhxb8DLd1ZM96RIT47oROt4dj22/a0N+p2Ol3r+I2ks+ffR68FgGrU8XyOd5dZW6dkSsUDbrnITiKA18TwUy3+KWQyObgeCl8D89eiD460cf0n956WfzTGKYx0X0XABoo7EPY8vVoE022A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39830400003)(346002)(376002)(136003)(396003)(2906002)(166002)(8936002)(31696002)(83380400001)(66476007)(66556008)(966005)(478600001)(6486002)(66946007)(33964004)(52116002)(36756003)(86362001)(16576012)(316002)(5660300002)(31686004)(53546011)(186003)(16526019)(26005)(44832011)(956004)(8676002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1baY0M+cptqGqBo7RxO6L+KL9DJz1uKEgoJ6DjMbP+5wgKIV+XYDU0s0/xkekbXvAgTLSCsxL8mCIegxgYR53lT+P5JahafNe1uijW+dhlAnPU3VDT9s2GA5lfcHVjg6kL9vuFIdBHFli7Pk8RaUaPV/QK3hXV+bwusyw0Dz0dEQo1ueGH3Oso0EPPg2rt1eTpkufm46rT5uDaPfW9ZgswjtCKu8Vp+BFBsKSfV7lX//Tj/4qMfrh9Glw7XFXB44kmcYoUfaKHjgBjh04e+VOfKKGCRVtszoI4nkFF6MqKcjMfTdHGCmLwVZ29daZfmrXO2NORHk9hIpnY/4NITeOzqTcSRnfQUCN1JPdfxPdVF2GPXGDTJhMmg68MfM7WA/sBscfUlvqUwjthJd2i7UHLYD2+l/lmW9pSY4UbThW8yo43AUdQWui+wAZQOR0a2yHf2QsjSohLrPH4b6NKmLfi4sMxgR3WE1/8K8d7iQNzQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd716733-8eb3-4def-189d-08d8268fc64d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:17:02.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Piaz53GOHEgrC2YzRX38+TXClNrnq9JBt20QryHLKDPp/SWgvEDR/l2xFEnVqRM6Ys6ZKpGLu4L5ha7SRIvwkOKNFnhfS2QwZr5txfR34o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
Content-Type: multipart/alternative;
 boundary="------------CC0818A8D09B12CBE542D40A"
Content-Language: en-US

--------------CC0818A8D09B12CBE542D40A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/20 11:00 AM, Wang Mingyu wrote:
> -License-Update: Copyright year updated to 2019.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pytz_2019.3.bb => python3-pytz_2020.1.bb}    | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytz_2019.3.bb => python3-pytz_2020.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
> rename to meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
> index c28a0148bc..1986263117 100644
> --- a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
> @@ -1,12 +1,12 @@
>   SUMMARY = "World timezone definitions, modern and historical"
>   HOMEPAGE = "http://pythonhosted.org/pytz"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
>   
>   inherit pypi setuptools3 ptest
>   
> -SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
> -SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
> +SRC_URI[md5sum] = "0349106ac02f2bfe565dd6d5594e3a15"
> +SRC_URI[sha256sum] = "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048"
>   
>   RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-datetime \
> @@ -31,6 +31,6 @@ do_install_ptest() {
>   	install -d ${D}${PTEST_PATH}/pytz
>   	install -d ${D}${PTEST_PATH}/pytz/tests
>   	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
> -	cp -f ${S}/README.txt ${D}${PTEST_PATH}/
> +	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
>   
>   }
>
> 

--------------CC0818A8D09B12CBE542D40A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/9/20 11:00 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1594306837-45766-2-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-License-Update: Copyright year updated to 2019.

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594306837-45766-2-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pytz_2019.3.bb =&gt; python3-pytz_2020.1.bb}    | 8 &#43;&#43;&#43;&#43;----
 1 file changed, 4 insertions(&#43;), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2019.3.bb =&gt; python3-pytz_2020.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
index c28a0148bc..1986263117 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
@@ -1,12 &#43;1,12 @@
 SUMMARY = &quot;World timezone definitions, modern and historical&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pythonhosted.org/pytz">&quot;http://pythonhosted.org/pytz&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d">&quot;file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999">&quot;file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999&quot;</a>
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = &quot;c3d84a465fc56a4edd52cca8873ac0df&quot;
-SRC_URI[sha256sum] = &quot;b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be&quot;
&#43;SRC_URI[md5sum] = &quot;0349106ac02f2bfe565dd6d5594e3a15&quot;
&#43;SRC_URI[sha256sum] = &quot;c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048&quot;
 
 RDEPENDS_${PN}_class-target &#43;= &quot;\
     ${PYTHON_PN}-datetime \
@@ -31,6 &#43;31,6 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/pytz
 	install -d ${D}${PTEST_PATH}/pytz/tests
 	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
-	cp -f ${S}/README.txt ${D}${PTEST_PATH}/
&#43;	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
 
 }
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CC0818A8D09B12CBE542D40A--
