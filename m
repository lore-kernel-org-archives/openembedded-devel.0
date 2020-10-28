Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.55])
 by mx.groups.io with SMTP id smtpd.web09.10612.1603898499538562906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Iq4wJQpY;
 spf=pass (domain: windriver.com, ip: 40.107.76.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibqIbVhZ2iD4PttMchTfGlJLWCozCJNQ1vzgeUgsOf+t81vc2ZVXQ+sVtCMWO89Vz9xOaPvdgroAtYdvwOop2zsKPFIM+wKzx5tGEhouZMrMJYtTPLCaLnx1vOC8J9jUe6jHXggswLrFQW7S/er4eRobNTxmy3SKpmPOYwokzrGDX62Weq+9a8dcMBhbnE3mpUQIlT2i8roCAhq5lVbsrsi8H1Tw2OpL2cHBcKwo+O5aQI5mAEdpIktYyBx6L0uxaP+Y8iRU6zyM0zqzbYE4ecuZMsTCAZrxqZVThi3DrbO6bWbYwO1R2vZDtj3CVRZcbBIrfyi1tkeI3X6RnQBDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dyaGZK5W++FMI/P37zYHRqwcjs4AA60KzDhakzcjUQ=;
 b=OFv3cRzBvu/PZL7fk1EN1hds7a+DimcHPoNfEsGVZbmgyhSCwdDmdMr0tyw7+SKPq/SQry4OsUu7ZH3fTaid77stj2a1iyjKyr9Q4VbxQLRRgwcAnbP4f1z6iE8QVMy8UKEuuAeSa/xABXZZnsiyJgfdk5m0wAK6TvAYD3/PTXyH7Lf+0r1TVrYR1/HOprnLUl/077ZLaxMBfjUD87Rm4DKGO1x6JiQ86uJF/ZpeuRdroffz9nxfxXiPR6Bgg1PxgHCmgpxeYb1Tu9o99o1RWWhoCgT37AxmJStZ1jkc2aU858GB96IJRb4E4guGElBnBElz/UrzyWaLp6FcE8wg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dyaGZK5W++FMI/P37zYHRqwcjs4AA60KzDhakzcjUQ=;
 b=Iq4wJQpYgy2bsLACT+PJeSRUWJxMdCXsznE/gx4fR7D9Dlrsk2/XGI4V0xqrf9n0fb82SSparXY9opZxdEnwXXb/BDpdChoT7kc2U7TfRU+pgMLgsupzmL3gJYgkVQrHmuMTLckXU8vggrGcBy7oJqPkbi0v/mrDrb7d94ZTwb8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:21:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:21:38 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-psutil: Upgrade 5.7.2 -> 5.7.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c6efeab2-587c-5d56-8f80-ef8758a7491b@windriver.com>
Date: Wed, 28 Oct 2020 11:21:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026090217.21174-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR06CA0049.namprd06.prod.outlook.com (2603:10b6:a03:14b::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:21:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0071dff5-52cc-49e9-202a-08d87b552a2a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50082BC64FDE35F12141F6069F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FZNIVFDZSLDfZNKq6eT0BUtrCBLuuz4S//oc0dzadEmDWK6xDHQ9irMfia2xV8A5DatPG3RIeTFiWHXFPljgDtamDBQszIr8EvRmFo7jTuAhNSqjfQ56SkV8rdetPh+T9ptV/CCGD592E3Oipmq/SP7OXevRan2Pt+oclGWOpU1qMeErguUaosgmxR2JyWiMwbOVjAz7e1QEXa7QbpS8FZe7/UknGFWL3KV/UldVtlSWBY90lIphjzmm8KRhM9jGAJUhYn1JhV1NHXgkb4JqzkeaGc5/emdJ6q8WhBDWHr22fp2gXYlArHIax4qgspXhvf63vOpMPlp3J7kjX3Jvc+VKQlMZUq+DbdXMSlGic/2EUI6RUjPRDuuXeHyCooZVTAsKJ7Sf1lvNH0FpocC/WPmMr0+MA9eRe37J1wzjYTdy/eL6VOmE+wTvbyPDKd/nuJFjiw6J+JBFXxT+J0qH2V5AEf/WCoHQ0hgsqyHEXxY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002)(460985005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BUaPh58P3hHKAmmtfk2CsATA241pDjm1TzOHNliCO8DH3bXjt5JsTcMEH7wox0XD4m2b8/C3bcbxAY7O2rLTrSxbLDH30xZFTuOucztpgE2Mzr33g4z4bxEz4boTSI4jNuzzHamMxn7Bao49Dp+NU9yNjvLC/B7VRANfshW1WMCdpN6MCYqkpzmR2tosrVoJkmYZXAY+aSbSpmXtnkUj9QvW6jmANVn5IyITCeVkJM9kkpq4l1Bkp5E6XhzXvG1BXrPl7VpSRuo8zN1VSD6DhvZR+91uDqzQlepT1Pd09dY1Vc6JWMZ80O/U/bc0X+RFbITINMxUeg5t4KOy5Hua1+GNCIEemp2tNqXLu8XkKEs8qGvJzpxW1ntDf0Zw4xwpzNgS/4cjjxuD6xZH/xrsX6hJXn95gzTb+Gi75seRUxXxszrlbYZHfriZPxGfej08NLxrxEppYTiFsLMTDR7dMC+qQNWtYF1GVtPaDfy9dlJ4gQHmqn5H03IbO8z+fQCr1EYhQGMdun1FIu7DCkfBtntfD0rgxxHLWS0AYYPLSd/Br/4OpCZ+sqWC0LuMAZQpFwWgX+xrJlqmFL1aLBbQ4Bq54+4jpqtHPW8yIuDMwEh//4R2ysczzbLwqzu/Xjv97u6sBl7kCmACOfq6/F9EKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0071dff5-52cc-49e9-202a-08d87b552a2a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:21:38.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /plbTTgsCqRbmDZ3GfsIYNcVYMey7DD5cgyV8c4kGC3jHEY6dpsy1ZgOiMrRp94DCU67o6XEy0bW7forJAA6ArNy7Ojhm5X9iTnG6llTkg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------E5DA95C00A5157CCC9FC2376"
Content-Language: en-US

--------------E5DA95C00A5157CCC9FC2376
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 5:02 AM, Leon Anavi wrote:
> - [FreeBSD] add support for Process.rlimit().
> - [BSD] add support for Process.environ()
> - [UNIX] net_if_stats()'s isup also checks whether the NIC is
>    running (meaning Wi-Fi or ethernet cable is connected)
> - [Linux] improved battery detection and charge "secsleft"
>    calculation
> - [Linux] physical cpu_count() result is incorrect on systems with
>    more than one CPU socket
> - [macOS] Process.exe() may raise FileNotFoundError if process is
>    still alive but the exe file which launched it got deleted
> - [macOS] fix missing include for getpagesize()
> - [Windows] Process.open_files() may cause a segfault due to a
>    NULL pointer
> - [Linux] sensors_battery(): if percent can be determined but not
>    the remaining values, still return a result instead of None.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-psutil_5.7.2.bb => python3-psutil_5.7.3.bb}     | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-psutil_5.7.2.bb => python3-psutil_5.7.3.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
> rename to meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
> index d61d501e9c..2f927d2da2 100644
> --- a/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
> @@ -2,9 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
>   
> -PYPI_SRC_URI = "https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz"
> -SRC_URI[md5sum] = "50bf39b4faa268ba1da8a9730bb38bb6"
> -SRC_URI[sha256sum] = "90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb"
> +SRC_URI[md5sum] = "b07a067e6a930608235f4e5d9b1f90f5"
> +SRC_URI[sha256sum] = "af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------E5DA95C00A5157CCC9FC2376
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026090217.21174-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- [FreeBSD] add support for Process.rlimit().
- [BSD] add support for Process.environ()
- [UNIX] net_if_stats()'s isup also checks whether the NIC is
  running (meaning Wi-Fi or ethernet cable is connected)
- [Linux] improved battery detection and charge &quot;secsleft&quot;
  calculation
- [Linux] physical cpu_count() result is incorrect on systems with
  more than one CPU socket
- [macOS] Process.exe() may raise FileNotFoundError if process is
  still alive but the exe file which launched it got deleted
- [macOS] fix missing include for getpagesize()
- [Windows] Process.open_files() may cause a segfault due to a
  NULL pointer
- [Linux] sensors_battery(): if percent can be determined but not
  the remaining values, still return a result instead of None.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026090217.21174-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-psutil_5.7.2.bb =&gt; python3-psutil_5.7.3.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.7.2.bb =&gt; python3-psutil_5.7.3.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
index d61d501e9c..2f927d2da2 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
@@ -2,9 +2,8 @@ SUMMARY = &quot;A cross-platform process and system utilities module for Python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b">&quot;file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b&quot;</a>
 
-PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz&quot;</a>
-SRC_URI[md5sum] = &quot;50bf39b4faa268ba1da8a9730bb38bb6&quot;
-SRC_URI[sha256sum] = &quot;90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb&quot;
+SRC_URI[md5sum] = &quot;b07a067e6a930608235f4e5d9b1f90f5&quot;
+SRC_URI[sha256sum] = &quot;af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E5DA95C00A5157CCC9FC2376--
