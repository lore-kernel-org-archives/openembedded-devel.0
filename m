Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web11.12558.1598359234211402971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gHLORanS;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB9wzuiXyx6qAZp7vpb4XV/yhk18Zusza5m310WEARj4c1iCc0A7AL8wvhj5XO27WL2kD6Q9bGLZv0hOpZQ3HgfyKImNjJpiR+/Q0ygcJ25wOdNT5xXeUMGI3mFmlNXVzU3pbuWtCCmhZm92M81QmEgDSB6TR1CiquGKBSoo+zfbeJ+38wRL39mfWkigwDGHIR7sVUFtBfzWb6pCXpIZigpvVuIfee0KfwvpPPJI1bSlDttSOKI0GkUQqOaHfj4h6YbIu4vRmusXe2TBmjiqRIVMMKP8bcAeydzBvF4jTMNPCljQjP+xlCvP+GQoaAwHQ985EpoUAhVKjtGeOn4mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WFEccWzAsZ9Q7OJlz0moDNAhjsN0EHg9ziq2fPC7SI=;
 b=lhbW6+gvCzVzph0cGQZRy6l3F2OAT8Fgb2yWyWswtO3Zi82ilH3k8SOiOtCQvveozOxscXBluw4znDZqfOKVK3SH6MHiER0b2wr2G7oxSVeKkzhjsCGtRHZ2PoRqrLA03JoPl53tnfMdZH+ZkSwVAlGYgE0R+Q834lF46aYTk7dWOLe9+I7XUvkCRxs88O0p3dDVmBFSZrE5DZ8svH4kufK5o68kSHV0No0kA8nQhZsdZmHc4HZfbrfWuYvsnMmRocdQJGHk3BiwdZctvtsq73Y5IJ9TElQrvgBLcXupnAoGoJrUwdvi2Y8y9jRZJdMM+wWGusIZFllkJmX6OkvoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WFEccWzAsZ9Q7OJlz0moDNAhjsN0EHg9ziq2fPC7SI=;
 b=gHLORanS+DzZfGGc0NzSy/NqJRR24IyBGg+DfwpMjO3vzTt+VAsrx2kzcCS2CZtWuVHokxzIArtVqJQYUAKgUH6y92sU+KXEnq/JCmIMrhvhFTPeWTGW3oyefNtzrLc65/nGq44Rvlk+kL6u4HSS4SEzlGgQvJ+nnlbM+OaM4Jk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:40:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:40:33 +0000
Subject: Re: [oe] [meta-python][PATCH 01/11] python3-pywbem: Upgrade 0.17.4 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <50adb76d-8a18-6eb7-dafd-b3c7dfc30856@windriver.com>
Date: Tue, 25 Aug 2020 08:40:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:40:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b8efcd-56ca-4b4c-d51a-08d848f40eae
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260E2E97510A9A0BD2F23489F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kET7q1UsHjIei5798ysnDQk2MI61ZjoA8AnVyhyVxbYMYWzsUEcQI/bolIxQiChX07OjqS6NHRMxonQYn1KWaFws80b5KnaymY7nWwSjymH/YPQVu5rVglr/UTyxnQ+iK6H7OPH2CmHPCxDUvsgUykON5FJ5Rso8hggKBpLFhSM4rSG13EgYcksH0H3R97xb59IpiMJ023n9szfxRFP5ErYagHfpK3MIbKRRsiNfvqIdU5cS1hIwmZwxvFaogJui1xBkqVkEjt3HZieOgIm7Miipv6RQ6fOcdWGiJcD1z2RrMaFBRyLADZfteoWMF0R1dbanjHfLRmjoHXg8UkyzsIbhBE41KeKvL7DXPVYyn9/9GnbH5LTc053g1HL95dvp/fk3OqOu3H7Zbahm7n5nJ7GiYo0WUcdZDYnDIk8V1jPsaCvndnTt0hdGQnKg/i+w8QPeoeLsOs70WlIxG20QSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(83080400001)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IkETGzYapHQ3aKCG3Gkop1ocfZXuobObnaj7Kx8meQCx39gfjM+aY9CBKNylHRZLyNzdCLrFwxfxj/fU3FcwdgLUrwOVJrmUM8yAKlOuQVCgu8xGe3t0TUU1Higpi2kYCfJ1BvweG152Viga5/YIhmRQ/mLPnxplNtmhAtbsjyETW5j5kcSuvZKTGTxIq6SSFRy+KW8OVNxXEKGZWuBAmCw/W+uK7yZpb/m5ZGlKnO0AourDPa6fwiIQxKU3WN8mFWDmZ9Ii/BieBducU+JvE6d4D3+yK24MWUQwcJZk4CoYR6DHg+6NDH0LTqPF16A6e3OILyL0Mp8LQWL7eGpZOZ9A87g3pgyPM7VLYRMfJouOS7Kg015fX/JPsZPQA7CNFIjuPPuLFHc6StW1p7Y62Z2mzDXHDTSL5LBc9hd3SFg0NTDnWr3OQWIONeAtLZCvasYJSw2Nqx+aqj7qKsmITyJ8Yi+A3WM2Zl/o5KMbmxTu5NeeeV5abLLNYLKSLvFwUmNrwGQvTjzAF336SZ0HlchD2QXoIsjewz/zoHRRMrURtFqHq3PzP7zCh7/dVH9MC5dGfwpK6bLG8Z8HJwA2rv4C15tmgnc3/oTCPG8zVw27ixmYq1IRr7QtNIjT9p3Q/qzn/69tLfc7bwr2PBaMeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b8efcd-56ca-4b4c-d51a-08d848f40eae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:40:33.0522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kD7kN+cbTWNCWwtfBHNBz77KL9hugimgwVkFDmzhe28L50nF5FeNlo4Bgkay4ogJIu9L0FnbRuVh9BkgWNmRk00dRW6EFO+6H90tekRoBxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------BF10B10B62262D6E64403B8A"
Content-Language: en-US

--------------BF10B10B62262D6E64403B8A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/21/20 7:44 PM, Leon Anavi wrote:
> Upgrade to release 1.0.2:
>
> - Fixed erronously raised HeaderParseError when WBEM server
>    returns Content-type: text/xml. This content-type is valid
>    according to DSP0200. Added testcases.
> - Fixed handling of ReturnQueryResultClass=True in
>    WBEMConnection.OpenQueryInstances().
> - Mock: In the mock support, fixed multiple errors in the mocked
>    OpenQueryInstances(), and added testcases for it.
> - Mock: Added support for more ways the output parameters can be
>    returned in method providers: The container for the output
>    parameters can now also be a Mapping (including pywbem’s
>    internal NocaseDict or nocasedict.NocaseDict), in addition to
>    just the built-in dict. The values in such a Mapping container
>    can now also be CIMParameter objects, in addition to just the
>    CIM data values. This provides consistency with the way the
>    input parameters of the method provider are represented.
>
> Removed the wbemcli command that was deprecated in pywbem 0.15.0.
> The recommended replacement is the pywbemcli command from the
> 'pywbemtools' package.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pywbem_0.17.4.bb => python3-pywbem_1.0.2.bb} | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
>   rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.4.bb => python3-pywbem_1.0.2.bb} (78%)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
> similarity index 78%
> rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
> rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
> index a804b0cc0..da731989d 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
> @@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
>   
> -SRC_URI[md5sum] = "b65c03026bf2174e58e3e47a5e7e4825"
> -SRC_URI[sha256sum] = "5b54b65a5434bb16432415743c0d154feee0c6d7a8a2fee208719c67d6d24c97"
> +SRC_URI[md5sum] = "0f171e365e294554f8e7624ccf511067"
> +SRC_URI[sha256sum] = "66d8ec82d30f2b95d8b4bd51659429066c2879d3f46292561f5fdbc7fed10f3d"
>   
>   inherit pypi setuptools3 update-alternatives
>   
> @@ -27,12 +27,6 @@ DEPENDS += " \
>       ${PYTHON_PN}-six-native \
>   "
>   
> -do_install_append() {
> -    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> -
> -    rm -f ${D}${bindir}/*.bat
> -}
> -
>   RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-datetime \
>       ${PYTHON_PN}-io \
> @@ -46,10 +40,8 @@ RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-xml \
>   "
>   
> -ALTERNATIVE_${PN} = "mof_compiler pywbemcli wbemcli"
> +ALTERNATIVE_${PN} = "mof_compiler"
>   ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
> -ALTERNATIVE_TARGET[pywbemcli] = "${bindir}/pywbemcli"
> -ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
>   
>   ALTERNATIVE_PRIORITY = "60"
>   
>
> 

--------------BF10B10B62262D6E64403B8A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:44 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.2:

- Fixed erronously raised HeaderParseError when WBEM server
  returns Content-type: text/xml. This content-type is valid
  according to DSP0200. Added testcases.
- Fixed handling of ReturnQueryResultClass=True in
  WBEMConnection.OpenQueryInstances().
- Mock: In the mock support, fixed multiple errors in the mocked
  OpenQueryInstances(), and added testcases for it.
- Mock: Added support for more ways the output parameters can be
  returned in method providers: The container for the output
  parameters can now also be a Mapping (including pywbem’s
  internal NocaseDict or nocasedict.NocaseDict), in addition to
  just the built-in dict. The values in such a Mapping container
  can now also be CIMParameter objects, in addition to just the
  CIM data values. This provides consistency with the way the
  input parameters of the method provider are represented.

Removed the wbemcli command that was deprecated in pywbem 0.15.0.
The recommended replacement is the pywbemcli command from the
'pywbemtools' package.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pywbem_0.17.4.bb =&gt; python3-pywbem_1.0.2.bb} | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.4.bb =&gt; python3-pywbem_1.0.2.bb} (78%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
similarity index 78%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
index a804b0cc0..da731989d 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
@@ -16,8 +16,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
 
-SRC_URI[md5sum] = &quot;b65c03026bf2174e58e3e47a5e7e4825&quot;
-SRC_URI[sha256sum] = &quot;5b54b65a5434bb16432415743c0d154feee0c6d7a8a2fee208719c67d6d24c97&quot;
+SRC_URI[md5sum] = &quot;0f171e365e294554f8e7624ccf511067&quot;
+SRC_URI[sha256sum] = &quot;66d8ec82d30f2b95d8b4bd51659429066c2879d3f46292561f5fdbc7fed10f3d&quot;
 
 inherit pypi setuptools3 update-alternatives
 
@@ -27,12 +27,6 @@ DEPENDS += &quot; \
     ${PYTHON_PN}-six-native \
 &quot;
 
-do_install_append() {
-    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-
-    rm -f ${D}${bindir}/*.bat
-}
-
 RDEPENDS_${PN}_class-target += &quot;\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
@@ -46,10 +40,8 @@ RDEPENDS_${PN}_class-target += &quot;\
     ${PYTHON_PN}-xml \
 &quot;
 
-ALTERNATIVE_${PN} = &quot;mof_compiler pywbemcli wbemcli&quot;
+ALTERNATIVE_${PN} = &quot;mof_compiler&quot;
 ALTERNATIVE_TARGET[mof_compiler] = &quot;${bindir}/mof_compiler&quot;
-ALTERNATIVE_TARGET[pywbemcli] = &quot;${bindir}/pywbemcli&quot;
-ALTERNATIVE_TARGET[wbemcli] = &quot;${bindir}/wbemcli&quot;
 
 ALTERNATIVE_PRIORITY = &quot;60&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BF10B10B62262D6E64403B8A--
