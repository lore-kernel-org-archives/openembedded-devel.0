Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.58])
 by mx.groups.io with SMTP id smtpd.web11.35850.1611578454685501459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=meJjKPPi;
 spf=pass (domain: windriver.com, ip: 40.107.93.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk4FyVug+JZ50NdJfX8aMxh6LmZKkT+5TC8fcIkXce8STFMR2YRkPUWZSEs3E5Fzll6DXvd/lkxZaAHyW6pw0/GA2S3diVFtHBSu7ZMU5NQgYMrO2YURaWMJ5lasuvZd1k773T71CYhqUe+cyu5aGpi3M3yjjAR6067augNZdEwCj+tJRkMRP5YmqNyB8jDnq9oBNXCWQ5vvbXpZPWBGEoew9Tix6Li0OwxztSAXDRUksH0zEFpmLjC/LTmVpY+i3lxOQtDVO2gFpKzAm6odQo9fGfuTOnh1N0e46ISwyJafxzpTCzTUs6FYMmLFl+fWbSDFmRRS7GoWYkmi2AuIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rslqjr0Fz9fEbn195+kX2CPEx028wvAP+BuYzhI6Rds=;
 b=fdAO9linzmaWjJ/lPmhPu4R9lpAXd0HOCyPzJQxc9tdL/uOLYQFT7xF1IufJZwXtqURIQtiJePm9a1Fl3EEVE6kzTXUUR/jqMlLW3tNz8oagIbT6yrDZXYv3ikLayi6M6IuVriHBJkEV4Zm58uMGfoWFVOXWm/Pt/NaNGcESXrgMSweAZ6oY/16ahO3h7pjSe4cEzaB68NunceqoGBbEBtJqgCRG7N1GfR1ot8eJV+9yGHs2sH+Q5kunH/4c2/j0eYaT0d6ReRX7vwDcHChE146P5/uaFLUWZhGwI020ihyV4gb7cAPs9AHZ6yAnrvGt/DRM48vHcjiErw+yKusjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rslqjr0Fz9fEbn195+kX2CPEx028wvAP+BuYzhI6Rds=;
 b=meJjKPPilNwrg0zlcWW4CqeYQJRjm/x5DzxgChYuOStPwoeKKpv9vhGbgxcH+nmEutOwnAGYFNG8Cunb9TulpsJXzyP6HNi9zk3q4KyOEzBSabLCWhNcZLul28MAr1b45WwguMoImb61wQu54BPqIl/e4xHBANsOqkUaQwhGKeA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:40:53 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:40:53 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-lz4: Upgrade 3.1.1 -> 3.1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
 <20210121131709.27097-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5ba3e495-7d6b-4243-55eb-3c54995a805a@windriver.com>
Date: Mon, 25 Jan 2021 07:40:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210121131709.27097-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:208:23e::31) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:208:23e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 12:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c724785-0c0d-4d6c-2219-08d8c12e7426
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984AA7F1FD5AD4D0F87A3169FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+CSL1YRsgfe5JTcnrV0kyr7+yY2dZX4FOR0kwDJ78ox9t+pcgkTiDx3ZWZVj+2LP1bXlEG5V3G5LBlJr095caVouvw7XBrgB9Nn/RwyToCpirTMK4OwlFXpyoqBopnyIrvp11LmfCmyg+0yhNYhmRfXxuvkxEnK1E3u/FojHJ26qd+EatdE2/OP/nxpqWQKXP0/1kkfv/9ZiETMdS0tPyxpoSpxn3OdmTX87S8wEfl0xR+uyE0vSInOf+8ncgJW3k9cJu4pDMseAUKyBX4oPUXRK1siSBBwPqpbWink+Gei4ielsmLdpCYjOe1pHGXpOVUGMSDQEq9rQhQbvc931FEvvVSR3tXh1o/AKg/0HdM9z+Rx+W/oqHXmoZG7Qadk6OpinqZAiHCZ981+WXhc1WSzgON7Yyb0BSzct90izI7gznjAeUR8+neyVcmD1GeD+gVLDXm2c8LyMmAp2JluRm22N1Jds+2/zWQMrF90oPSWz5ssosuF17gW4NnoJDAJ47guutJNLJrcXj47bO+Utx8C0a6kticJW1InJCx+XAGjqC/wtIugNy9vsYRt3+IJI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OFJYYUlicjFUU01pajVPM2M1Z1ZScC9uWjdTbC8xcjhmOUorbFlobXRRNnZJ?=
 =?utf-8?B?N0pFWHVScEVyaXdmSUhjRnZ5UFRsazNOR1hwRXIyampnckhudVFhQXFTSUlS?=
 =?utf-8?B?NU04U082MDRWTzNWYkxMUlhSZnI2OEpNRnZXRXVuZjVsL2dqSWswOTZEamVa?=
 =?utf-8?B?Zjg2S2dROVY0MHRtOUlFMmFXUTJHVDYwS0plTnA3TUU5SEdmU1hWbER3Um01?=
 =?utf-8?B?TjNTSjF0SjVWRFRZM0hMQ1R5WktFYlcwMGQydys4N1B4TStqMTllL280S01V?=
 =?utf-8?B?V1Q0am1LU0t6SVpkYU1vVTdYaXVHVkpmQ3ZjZFd1S01vZlRjeTNKVEJSSm5H?=
 =?utf-8?B?YjNITGpEZ3VGbWtJQ1F1SUZ5NFBCYjRIRVJlcmJRSjdUci9UVEFBZmV2NURq?=
 =?utf-8?B?NUFrSkxldjhKaE9OVEtnYk8zVmVFTnRSUTgxczJWTkhsNVVlMjU3bXE2Kzk0?=
 =?utf-8?B?WElhcURJS1FIcGMwUGh3ZERJcmFMN3NBZzhvMDdoUk10REFkQm02emV6WFZE?=
 =?utf-8?B?WnlxSzNHLzQvbmlVR2p3N1k5RVkyYWQ0SkNJMUI0WU0zcUs0OStaTmx2Si90?=
 =?utf-8?B?T0Nab3VRczdLRlAvY3pkMGsrdEQwa1QwUHlibENtSzlZTkRJQk1RTldndHps?=
 =?utf-8?B?V1dHZU9iVkY2S24yR1lwOE83U0ZCWUYvZ0NnaURIRjRxdFdXYS81U3E4NW5G?=
 =?utf-8?B?ZnU1QzhiL1FXWXZWVHZMenFIb3ZTNjVNTjFJUWZxZmVtakFMdnl2N0lXTS9j?=
 =?utf-8?B?Y0xqN0wvZ3JYcUttVWJqYm9KT3NpU2JBZnBzQmJtS2ZKMlhXZGRtQnc0UkZs?=
 =?utf-8?B?RThjM1hBN0krQnVYcDJWY3k1dlJvVjY0MHFaUGlRbjJzUU14VHNwendTaTVM?=
 =?utf-8?B?THBzSC84c1VsVEFaU3NLYjROOC83RElxM0ZoeHA0ZjZEMnRLbmhlUVZkdEZz?=
 =?utf-8?B?V1FHTTQ3Wk1lU0FhMTJ1ZHlJU0FEMEFqdWVlamRaQXkrTnhPbWthWnpaMXZJ?=
 =?utf-8?B?QWNrZkJ4dXRXZWcrQ0hvUWdzYTE3NHRySkVYdHZqNkpQYWhOQ1ByRjdtMjlM?=
 =?utf-8?B?Y3FVSkIvVTl0UmRXdzZzYWw5a3VGNjIwY1VFSFdiVzlTdXc3Y3g3K0lJdkhv?=
 =?utf-8?B?UWRDK21QTHcwTzhsQm14c0YweDl2NmZQajRPZlFJZjFieEw3Q3BRVDRqNlE4?=
 =?utf-8?B?M3ppck1YQklhOTVqU3dsYko0RllOMWkzMUExUHlOanp5N1lhQUFITnprSG1S?=
 =?utf-8?B?bjNIRWc4eU96bTY5cHJJczBaM2F5QlU0REFZU3lTVnhybG56YlpCTW1QZkVr?=
 =?utf-8?Q?47SgRLoZQlhKSNyUb6joMAsuyldCcIz28q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c724785-0c0d-4d6c-2219-08d8c12e7426
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:40:53.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2B5Lj+Z7ky7HtaXHkulFXOG/QgUfAf/zm0pr+djdK4Gps0CjdayhzkKrbVNtvFIV4wwK3m633878Zy278xHrr1XnhAzxTH7CG39TkFNl/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------C1943187D19DD6CCB433463C"
Content-Language: en-US

--------------C1943187D19DD6CCB433463C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-21 8:17 a.m., Leon Anavi wrote:
> - Add support for publishing wheels to PyPi for Python 3.9. Wheel
>    building is currently broken for Python 3.9 on Arm/Aarch64
> - Drop building of wheels for Python 3.5
> - Move to Visual Studio 2019 (14.2) on AppVeyor
> - Build against the XCode 12.2 image on Travis
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-lz4_3.1.1.bb => python3-lz4_3.1.3.bb}       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-lz4_3.1.1.bb => python3-lz4_3.1.3.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
> index 1cc378def..b14484b78 100644
> --- a/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
> @@ -8,7 +8,7 @@ DEPENDS += " \
>       ${PYTHON_PN}-pkgconfig-native \
>   "
>   
> -SRC_URI[sha256sum] = "1ac354804cb2d5fb3d213857a6bf8590a301ef051cc16fbb4938bd2d6e524bda"
> +SRC_URI[sha256sum] = "081ef0a3b5941cb03127f314229a1c78bd70c9c220bb3f4dd80033e707feaa18"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------C1943187D19DD6CCB433463C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-21 8:17 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121131709.27097-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add support for publishing wheels to PyPi for Python 3.9. Wheel
  building is currently broken for Python 3.9 on Arm/Aarch64
- Drop building of wheels for Python 3.5
- Move to Visual Studio 2019 (14.2) on AppVeyor
- Build against the XCode 12.2 image on Travis

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210121131709.27097-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-lz4_3.1.1.bb =&gt; python3-lz4_3.1.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.1.1.bb =&gt; python3-lz4_3.1.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
index 1cc378def..b14484b78 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
@@ -8,7 +8,7 @@ DEPENDS += &quot; \
     ${PYTHON_PN}-pkgconfig-native \
 &quot;
 
-SRC_URI[sha256sum] = &quot;1ac354804cb2d5fb3d213857a6bf8590a301ef051cc16fbb4938bd2d6e524bda&quot;
+SRC_URI[sha256sum] = &quot;081ef0a3b5941cb03127f314229a1c78bd70c9c220bb3f4dd80033e707feaa18&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C1943187D19DD6CCB433463C--
