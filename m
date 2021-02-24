Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.75])
 by mx.groups.io with SMTP id smtpd.web09.7845.1614177906099207424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=D/mL0e9z;
 spf=pass (domain: windriver.com, ip: 40.107.92.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeMsWTJl2WN49n2/SNVrInl4C8tlH4HY6DpAC8tOGDMC36hLGxsY+id6GWCwMiOOQw5O4zXrJNwLpToFpRBxkAdTHmpP3NP5FmzcqeB8LUWOfeEAqHGOHY3sTVWLUgUVX7rafMC9fkaTzwaxazdxav1PD7NnJQEaCOrkuh68sKchXa8YzNUs4vCM1yPbcOU/JcGD0Mx4wfPvWG/OLLUCMXi4LUV9WBTZdQPhcqHOcCydyx5woaTm21H5tA/aTiyVUtpDDUVjc/N9SoHtRDF4n+X9EYiv7sVOwobQrUrT/gSnrI0doFK8mnz4T9+8+BtIjhOFho2Add6ESFrmA9RNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKd4JCwOVyzpGyiXsbdgXtC4D0HUZuVhSXJx+MCfvTs=;
 b=MpMYpImOyYzHpU0ViO/cn7MBz8RXX0l1rni+NvrOyr/yZdW7zokOG6DQgq4coPlP6adUaXR0NwNtS4zK4awE+gzfaXncVsiUMCKafE0Lkg1p8YLZ5+39zK9Ajf6E77eqzSlBxw8FSQb8IAa1W74253xRKjL/MP7E77XdIMlYEenVpqwJmikmncFJ5oDCCsqztgWz+6XZdNCkAnCKEt6rsx0Aw37O8XDuVFDpA9KptQpVUaBbcXC8/gmnXb+F2B1gDHySDPAHN/ZBBx7I8RkGWJXUdx1voM1xrmQ+cdVoIs/8J8vIT1xjKegNzasvr0ShD2cosdRe3SP0xBTY+CpFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKd4JCwOVyzpGyiXsbdgXtC4D0HUZuVhSXJx+MCfvTs=;
 b=D/mL0e9zLiLMFsmAYsrcC2BJh7oWs8f2DtWY7Gfx8dpD5viNMfqgF+JNs9duVJIr95oS2QOQYUyl9+E8djermsY0cfNL2PdvwBBU9301pvfV8v2wI9huBYDwlmWfTEfsREBFPV7Z3pJynqC9dRZWD/c6JQVSxW2ELW6+1tcQAEM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 14:45:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:45:04 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-httplib2: Upgrade 0.18.1 -> 0.19.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8d20dc28-440d-abc4-c6e9-c50b5b23e4e2@windriver.com>
Date: Wed, 24 Feb 2021 09:45:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0289.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0289.namprd13.prod.outlook.com (2603:10b6:208:2bc::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.12 via Frontend Transport; Wed, 24 Feb 2021 14:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be3c6af-2deb-4f74-66be-08d8d8d2c579
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260F54919888008E8735FB39F9F9@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l3bN1yN/itFbN7b09DA40SurMkaW2+m+KDbRFHjqIUF/XgMNWLoIdLs/LiGm4BvtfNy1pGTc5Fdcexl2KyN8fZd71wm97uzRmchSxIZGDuEFFMTphe4VdX1IFkPdESyEcKAAftld25QsRIiLAP0RoPecI6DFt85Mc75453MhC8kB/Au1mVWStrwqAlUaeWzu5zrz26uJPrwyGPyToKX8/LumlawSXlLB7fQwWUVyYBjeDWUN+6/cvbeb1mueMgCOATJo03BHi3v75WfBn2PvQ8cT5hEKWZnIBTQ9WaQS0/svlz152ZbkRyg+jUxDe7MO7aTxh93n+sddsIv7BzCh+G1VBQXHfGhOxmFjAnoASlQPeInD/6TXlplUi4k5cFNTITzNS4EQbcFnd1Y2WwjYFWeynkAePinEPyQuI0F1OGigpLa4IF7xmSgEJ6cEpoonOjTKBiMlc4YMhxpn7xPATYUsBWUA7OvIc1yTQMjqIIMbBv9DjSq5WfoPbE6qtTEbz9seSLs8IqddMlLL/5eJB+i9dVVfWPkFB8jE8oRsmWo57LB9VfTOcoS3AaXIoCcqqrO1GvPg9EZQdwMhenjmhiruEhpe/dvjfDUWOg4rjefD+sw162vCkthwtgdoaTHMKzKGjb33KfdCnrIYtAHr/C5kMYlxz+IsmS8o4FkNWGgSy4wFq8jidOV6BHRhPeB6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(316002)(16526019)(186003)(956004)(5660300002)(166002)(31686004)(83380400001)(16576012)(2616005)(53546011)(86362001)(26005)(478600001)(44832011)(2906002)(66476007)(6486002)(8676002)(8936002)(33964004)(31696002)(66946007)(66556008)(966005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dHJDSjlsR08yQVhQTzVOQkgvNDNMdk50ME9rRXFRMmJXNmdKY0laOWdBbVpx?=
 =?utf-8?B?UXlaYzl4Q2VHT3hLVmxkZ0tGTTQzWlM2K1pRcU1HK2hnR2srTHFGR2dhZFlG?=
 =?utf-8?B?dDRMeTJ0L3VoU1R5QWNGVkVPN3Q4S3BKTDRVM1hJRGRmOThjQ2VuVlYvTzBj?=
 =?utf-8?B?TE1MazVRNzUzVnkzSjZhbXRkdFo2VnA3MGQzYUlKS3JPU3B4djJ4YU9OSG5w?=
 =?utf-8?B?S0UrV3J5OGREZ09TSkJ5OG1uUHdKaXRxcVphYmlGdmZsNXlpOS9JM0hyT3px?=
 =?utf-8?B?TUUvaWFIMkJaczN1aWFsSTNwTjJ6aHh0NDM3cmFmNGxuMVB3M3VIZ041VjI0?=
 =?utf-8?B?d1IwQ2RPVWo5bnhBb2VRZDE0NFFOSVpTaXJaS215WmtUckxPVGppemNvSGpB?=
 =?utf-8?B?akZFaHFvYmVHY2MwVVVOT0h5T2hsNExtWjJMQW9OVmRIZ2lKYmpnRThyc1BE?=
 =?utf-8?B?bWhDUVorWnJyK0FHcVJweW9VdUVuWVRUWGZtY01hZGFtOSsyK21MWVdsQUVI?=
 =?utf-8?B?TWk5emF2MHVCS2ppaGY1M09tSVhzMHpQbDNCajdUMUFDQVNTTGMwaEJ5QVFQ?=
 =?utf-8?B?Q01HZ3NDYWdDS0c1UmtKN1JOK1B5N2dFQ1RMZlFza21HcTh3K3RKUExjT3pS?=
 =?utf-8?B?d2d5Y3JyU2JxdjllaWJhT1V2V0xJZEtKU1NOQ1hqQUtTaEpnOHpGY3ZqajJQ?=
 =?utf-8?B?Q1pXMlI5bVJsOVVxZVNsS1ZtZTkwMGN2cHFVM2Nwbnd5RW5FSzV0RTlrM3pj?=
 =?utf-8?B?N09qMzFBenpFdmRtRXluNlQ5U3c5YkwrQVk4YmVCWGxWNjdxdlVzQ1hwNVdo?=
 =?utf-8?B?YUdVa215RUtldmhLY3MwYzlaZEpIYTZEakJIVWl3Z1A1UDk0MlRHN0gyTk0r?=
 =?utf-8?B?N0xSVWVPMUxXRk5RUlBQRnNmRnVkbXQ0SnB4ZkN6Z2xmRUF5eXoxQzhFS0Jh?=
 =?utf-8?B?WC9oT1VvRzdJZ1VYbjA5TnVYd1hJazJERDFXcjdLSkJ3WWhkMWpqTFlmS3E1?=
 =?utf-8?B?aERSNVlVaHpFYTlrbVpJd083Q1NQTzUxOHJWK3JndldjNVlMRlNvRS9Cd0Nn?=
 =?utf-8?B?L3dVd3M4bTBuNFVBNFdxVVA0cnNNL0VCYW4vbUg5NXlpa3BZeDlPcExJQkFj?=
 =?utf-8?B?VnByVW9FWXUrNlJHUytQOGFNR0Q2dzRrWHNsbkNxcStsRExZa0VDbTlkZm0r?=
 =?utf-8?B?bEh5aDBCR3NGUDNyTHE3YjY3WklkSVpFSXdBbHNHaFFLUlU3Y21SZ2Y3cits?=
 =?utf-8?B?aDEra1QrUzRReGhhcFdvMUFhL2pLNkVlRjhxZ0lvNkxoVy9LQk1WZmFoOWVu?=
 =?utf-8?B?K3Q2bWNiekYxZ1J1MTNvNUdwRjRSRU9ndmgwdzZsWkZZUWkvVUcvMCtKQVR1?=
 =?utf-8?B?blYzMkJQRWo0anZJTkROSTdPb3RGM09sL0xETVd2SFlnYS93RU5PUmJNWWJB?=
 =?utf-8?B?cGJzU3NpNWw5cWlpbnQ3MHMwckdMY1g3ZndwVTc1bnVkb1pPMjlSbVovTE9E?=
 =?utf-8?B?bTl4M0p0RmNSNk9aTlFLdVFGUTNmMm5PM3dlQTFWMnNlTGtSNWFLTmpxSFIx?=
 =?utf-8?B?b0ExVE0rcDlEKzB1bitwUFVXcmV3MDVpVEwxTTBZQVMzanJ4K2s5RjVxTUtH?=
 =?utf-8?B?M2N1SHJ3Y2pXclp1NndtRjZ2K2xJREJZSFhGUFgrY3hDdDVlQ3E4VW9hcUxp?=
 =?utf-8?B?RFdoUWVXRkFWbmlZSE1LSlpTWExvenlwRTRJQjBYeUpkd1JaeE1QRWtVZEwr?=
 =?utf-8?Q?CYtG43sK1W3MN0HnQjESQEQJFzJ2GrRazsD+4zN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be3c6af-2deb-4f74-66be-08d8d8d2c579
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:45:04.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFRJzmhUdUrCYNIzUjKFHJ/ZEuUngrMfzHl0lZGaCeKoROwrjHKttykh7WWmqt8P2SjfCLs0OcQ0KHi1Prznfe+DOQ+tWmAewDZCrxpDQLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------F184C34EACFF22BDF08502D2"
Content-Language: en-US

--------------F184C34EACFF22BDF08502D2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.19.0:
>
> - auth: parse headers using pyparsing instead of regexp
> - auth: WSSE token needs to be string not bytes
>
> License-Update: Use file LICENSE instead of PKG-INFO
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-httplib2_0.18.1.bb => python3-httplib2_0.19.0.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-httplib2_0.18.1.bb => python3-httplib2_0.19.0.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
> rename to meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
> index 9c9b6c5b01..f720723a65 100644
> --- a/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
> @@ -2,9 +2,8 @@ SUMMARY = "A comprehensive HTTP client library, httplib2 supports many features
>   HOMEPAGE = "https://github.com/httplib2/httplib2"
>   SECTION = "devel/python"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
>
> -SRC_URI[md5sum] = "0b331f96cdb2ae0e0342d4ea0f5f0502"
> -SRC_URI[sha256sum] = "8af66c1c52c7ffe1aa5dc4bcd7c769885254b0756e6e69f953c7f0ab49a70ba3"
> +SRC_URI[sha256sum] = "e0d428dad43c72dbce7d163b7753ffc7a39c097e6788ef10f4198db69b92f08e"
>
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------F184C34EACFF22BDF08502D2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.19.0:

- auth: parse headers using pyparsing instead of regexp
- auth: WSSE token needs to be string not bytes

License-Update: Use file LICENSE instead of PKG-INFO

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210223152219.32129-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-httplib2_0.18.1.bb =&gt; python3-httplib2_0.19.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.18.1.bb =&gt; python3-httplib2_0.19.0.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
index 9c9b6c5b01..f720723a65 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
@@ -2,9 +2,8 @@ SUMMARY = &quot;A comprehensive HTTP client library, httplib2 supports many features
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/httplib2/httplib2">&quot;https://github.com/httplib2/httplib2&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2">&quot;file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf">&quot;file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf&quot;</a>

-SRC_URI[md5sum] = &quot;0b331f96cdb2ae0e0342d4ea0f5f0502&quot;
-SRC_URI[sha256sum] = &quot;8af66c1c52c7ffe1aa5dc4bcd7c769885254b0756e6e69f953c7f0ab49a70ba3&quot;
+SRC_URI[sha256sum] = &quot;e0d428dad43c72dbce7d163b7753ffc7a39c097e6788ef10f4198db69b92f08e&quot;

 inherit pypi setuptools3
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

--------------F184C34EACFF22BDF08502D2--
