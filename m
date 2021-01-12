Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.81])
 by mx.groups.io with SMTP id smtpd.web08.11497.1610468115627558962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V7IGaLiM;
 spf=pass (domain: windriver.com, ip: 40.107.77.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+QOeKyFUPlWhUzaFXZA52CFjnXpLDESZNjW54SUNUfyqo14rh12RZY6qsceZIsEJnbQi8kszD+jxVKU+u2s0YNdX1VkrjAr+JaJPN+P06/+TvfJntKvyP8ZrlhR16pY0KjEBw8f63tNZaE7fwXWeGp7d07ZjcjwNyXOHCEVjxA6ukkxkrayRt02SC9m+XLuVvbbK4ZjqnReVqdi2WnnyaOf3rGAOmGOlT8DEg6flu+/LHDDGiQKrxmv0T3jhkVCukvaa9xhkfhEvViA8ExEWDGLebHZc0Q+UJ6H4Wo1dzEQ3UnFl6Y+4908v1pTS36XGAHyxfzKp2lXRXkjAqn7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu3Cgb/3ZnX5oiyGq+3xrSURzdb1q//fHEeymIvucwM=;
 b=KSfcgY6C3uGN87oR2jCYphDbmBkgz/SfPbcQLdugCuVMdOu1qgFOOIGeqPDxbjxIyv14unhfVXGnGp5UuUt5kV9theWBu/ipBxiuB9boUlrUg5ZJzOIscYq+5Lxvv6rzM3LegGqjfBsNpQssjINcwHWeLtxDVqvYCAy6QI77251KAtzHGXqjBXaAHlhv27ywPKIOGFlGQ35pX1X7ByVqvzs3/Xpi5yf37fO85ANybpylYDMynhZlB78l0a9Fb0e05FCreug2Vx1loc0nk8yDT2aCvq0d91WwaY3QsOLI27m/Cdu0Uo5WDA9LCikdXQrm95zc6O+EJ7D4hQIAXXDFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu3Cgb/3ZnX5oiyGq+3xrSURzdb1q//fHEeymIvucwM=;
 b=V7IGaLiMLuXcdkwafIoO+3BACjMID/LEFE32ZgYNuh0jFfYHbJFYtqPCZ9DUixydATgBHSR4H4+51uBqMX3w1i/Hw12FGdkxievBndHZH/Y8IYl3mTyyXXDZftmskfv0Q0bQpkvyAM7vkHUzGEcI8tu43IdgqnqJqheD9Nfwm7Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 16:15:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:15:13 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-dnspython: Upgrade 2.0.0 -> 2.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9f5c5014-1426-6e72-41ad-36e03467854b@windriver.com>
Date: Tue, 12 Jan 2021 11:15:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:208:c0::44) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0031.namprd05.prod.outlook.com (2603:10b6:208:c0::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.3 via Frontend Transport; Tue, 12 Jan 2021 16:15:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 199014c2-5b6c-4044-b90c-08d8b7153dd9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4370:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43708E762EB81D704E8A752F9FAA0@BY5PR11MB4370.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NxNtfd6ziXlgOiePtuN/ZpHHJiTbSyfJktYnQw6EgWKP/JAc1MSPthVMyAapKha6tCKTCKWaA+RfIcNn12cQRCTuGh2ia+ALIG79giQLm3FQLrM/lwco0xTQu4ixR4t6XCjkNWEuNw66vhA2drRHoAzE66CGkCdkJwcDz0WCmR+CIbqqLXjuOiEPV/D2r2/PcVh8+OeofrMWD3j2VEbfTizY7BA8vNLou4viaOcssMVlYETylmM6fX/Ezhi1r1Xrv6vREyDkJkYg913BA4uEeT7pnQPRiVsiI5H1VxPeIIP3brP9Q1TKhUQmmPrdq3vFw1lVh8IIevTn586xCQ2ax5z/+1GQaAKWaAtT1OHoAA+xIz6Db66i88sJprnC89wXFG2ESjzuf0Da6rfTmSMmzGUxvSW0BNYk+DErrtn7pKdB/ww5AgR2Uj6+zu3oOAZgPyJrqmg5ieMGYg0QEgcV8+hwGsiqPT8/xGw6DLKtQeEXHE4+Vs+2XWvYpfuyS+rek0E7KQSIw9OlJN5rSbZ1gL7eaRf0MtP8lVhyLnmUJlo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(53546011)(956004)(2616005)(6486002)(26005)(186003)(52116002)(8676002)(166002)(5660300002)(16526019)(44832011)(8936002)(83380400001)(33964004)(2906002)(66556008)(478600001)(316002)(16576012)(66946007)(36756003)(31696002)(31686004)(86362001)(966005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZVc5cHAyZmlJNGFLVS9DdWU2NTNRbjE5UzhGMnoyS0c2cFBLY25Qc2JKOTJJ?=
 =?utf-8?B?Z2QyU2JsZmw0VEd1SFRxaTNxQ0psaDNXS3dZSDdlMFVyV0JNMDdPVFpWYmQ1?=
 =?utf-8?B?cWlFeXhGTW9iR0puaGtQL1RQMThRenF6eHZRdnFmL0RqMjFkQ1U5ckRGZjJs?=
 =?utf-8?B?MXV1cnIzdW50eWlkRnVOcERSSlV2NUlMZWpjbkxPWi9wZFJ4UCt4UDFRZ1l4?=
 =?utf-8?B?WjJPd3BlMG45bUhwVXgwNmZaTmhEMFgzTHBSdzk3VXBBbnNRa0ZmRDkzU0ZZ?=
 =?utf-8?B?OXhwRlV1OHNLL2J0VDc2UFVKcWxvQWVzQmo3YmdiSkVZbWxkKzh4TkI4cG5w?=
 =?utf-8?B?NGpidmtvSTNua2RjdDJ6ai9PZHpQcVcxb0V5dnNHNHVuZGNtdXpxOWZQcDJO?=
 =?utf-8?B?cDBSN3VCc3d4Z3ZtZzZxSWVBOWEvdmdDalNlVE4vVHI3ZkpyWkRSY2VUV3Y0?=
 =?utf-8?B?QUVldnd6eCtRNWNaNWU5b1c2UEM2QjBoQkxucVpxYkt1Y3ZvZXhGeDBHTjRr?=
 =?utf-8?B?VnloY01VOWF0OGpIeGtqS2dMcDBBd3JSS2k1N2szeFlVV2wzOTFBTjJSZmNU?=
 =?utf-8?B?K0JuMU1qRU5HRDZpTC9HS3FNNFVid0x0S21xMmdiWGp1ZU9lbUxKc1pyMGVG?=
 =?utf-8?B?dFprZHE0QWRLVlozOHlKb2F0VHU2aThzMmJmZWJVR3RJNDlmNkxvMTQ2VGxV?=
 =?utf-8?B?SE5rMlhwZkV4OWZ1VzdVQ3MwRzhvTHNmRzNoU1RZNFRNaDA1WFQvWHBYZy9u?=
 =?utf-8?B?ZEZJK2g5eDc5dUhpRU5YVEFHRURjMW90MTNYK2I5eitzZ3UzQTdXMzhzdkV0?=
 =?utf-8?B?bUFpRDBUVnVFTEVkL3BEdkI5YjU0cVZ4T3VCS3U1TTJzKy9tdS9Ub3liZmQ4?=
 =?utf-8?B?TU5QdldvWkFMVk1Gam4xdzNkaWdibWdPTG1wQUNXeGh1dWdMcitNMFQ2SVkv?=
 =?utf-8?B?Vnh6cUVkRVJlUk8zY20xY3JMUzJQN1FrQ1pQT3E4Q281V2FGVFZOaUg0UGZY?=
 =?utf-8?B?eUx0aFJtUUQwL3F2dDVRenNXb3NpaFVGMXBSWE91TngvNjRWc0cyZ0dXTHZD?=
 =?utf-8?B?aXdYT2swV3F6VEZ6TzA4NTk0OGt4YjlhL0lITkNUMjI0ZVpFV0FHZlN3eUpp?=
 =?utf-8?B?SHgzSGxuUGkydDZXWTVxMEk0ZTFWTm5CbnJkOHMzK1ZjMlRnQ0lsUTU5RlNS?=
 =?utf-8?B?TTlMZ0dLbDlzM1hxTXlJZWNHSUdVSXZwUlJWODFXOVBZSzFJYnR0VkR0aGNo?=
 =?utf-8?B?VHVUd25mQ0pRZjZoVFRYMTJzaUtvZXJNWHArcDh6S2RhYzZuZFlGM09WTCtG?=
 =?utf-8?Q?RDIVwFKtWHdSfmeOieMyp0lYZe+wNbdaqI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:15:13.1081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 199014c2-5b6c-4044-b90c-08d8b7153dd9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExdAR+qlXOKfLrQJhJDhiAf7qN3rIGyQqzmJB08xa/voNnQDhc4/Z9uJhX51lPbwsMceu+6shMFhD63MmKt4wlIVZa/UnVLSiFPfF0G/8Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
Content-Type: multipart/alternative;
 boundary="------------63CB073D02FA0D5E0E5833B4"
Content-Language: en-US

--------------63CB073D02FA0D5E0E5833B4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - End-of-line comments are now associated with rdata when read
>    from text. For backwards compatibility with prior versions of
>    dnspython, they are only emitted in to_text() when requested.
> - Synchronous I/O is a bit more efficient, as we now try the I/O
>    and only use poll() or select() if the I/O would block.
> - The resolver cache classes now offer basic hit and miss
>    statistics, and the LRUCache can also provide hits for every
>    cache key.
> - The resolver has a canonical_name() method.
> - There is now a registration mechanism for EDNS option types.
> - The default EDNS payload size has changed from 1280 to 1232.
> - The SVCB, HTTPS, and SMIMEA RR types are now supported.
> - TSIG has been enhanced with TKEY and GSS-TSIG support. Thanks
>    to Nick Hall for writing this.
> - Zones now can be updated via transactions.
> - A new zone subclass, dns.versioned.Zone is available which has
>    a thread-safe transaction implementation and support for keeping
>    many versions of a zone.
> - The zone file reading code has been adapted to use transactions,
>    and is now a public API.
> - Inbound zone transfer support has been rewritten and is available
>    as dns.query.inbound_xfr() and dns.asyncquery.inbound_xfr(). It
>    uses the transaction mechanism, and fully supports IXFR and AXFR.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-dnspython_2.0.0.bb => python3-dnspython_2.1.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dnspython_2.0.0.bb => python3-dnspython_2.1.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
> index a4e984619..20de09391 100644
> --- a/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
>   
> -SRC_URI[md5sum] = "42f922c9223dde0275e8c0695ead37da"
> -SRC_URI[sha256sum] = "044af09374469c3a39eeea1a146e8cac27daec951f1f1f157b1962fc7cb9d1b7"
> +SRC_URI[sha256sum] = "e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4"
>   
>   PYPI_PACKAGE_EXT = "zip"
>   
>
> 
>

--------------63CB073D02FA0D5E0E5833B4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- End-of-line comments are now associated with rdata when read
  from text. For backwards compatibility with prior versions of
  dnspython, they are only emitted in to_text() when requested.
- Synchronous I/O is a bit more efficient, as we now try the I/O
  and only use poll() or select() if the I/O would block.
- The resolver cache classes now offer basic hit and miss
  statistics, and the LRUCache can also provide hits for every
  cache key.
- The resolver has a canonical_name() method.
- There is now a registration mechanism for EDNS option types.
- The default EDNS payload size has changed from 1280 to 1232.
- The SVCB, HTTPS, and SMIMEA RR types are now supported.
- TSIG has been enhanced with TKEY and GSS-TSIG support. Thanks
  to Nick Hall for writing this.
- Zones now can be updated via transactions.
- A new zone subclass, dns.versioned.Zone is available which has
  a thread-safe transaction implementation and support for keeping
  many versions of a zone.
- The zone file reading code has been adapted to use transactions,
  and is now a public API.
- Inbound zone transfer support has been rewritten and is available
  as dns.query.inbound_xfr() and dns.asyncquery.inbound_xfr(). It
  uses the transaction mechanism, and fully supports IXFR and AXFR.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-dnspython_2.0.0.bb =&gt; python3-dnspython_2.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.0.0.bb =&gt; python3-dnspython_2.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
index a4e984619..20de09391 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.dnspython.org/">&quot;http://www.dnspython.org/&quot;</a>
 LICENSE = &quot;ISC&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5af50906b5929837f667dfe31052bd34">&quot;file://LICENSE;md5=5af50906b5929837f667dfe31052bd34&quot;</a>
 
-SRC_URI[md5sum] = &quot;42f922c9223dde0275e8c0695ead37da&quot;
-SRC_URI[sha256sum] = &quot;044af09374469c3a39eeea1a146e8cac27daec951f1f1f157b1962fc7cb9d1b7&quot;
+SRC_URI[sha256sum] = &quot;e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4&quot;
 
 PYPI_PACKAGE_EXT = &quot;zip&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------63CB073D02FA0D5E0E5833B4--
