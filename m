Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.63])
 by mx.groups.io with SMTP id smtpd.web10.12771.1598359450661156545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N7wz7T+C;
 spf=pass (domain: windriver.com, ip: 40.107.94.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlZT7vfEoMzBU0+hylO8j7IpI5b2/8kWoXhK02wXsFKFLU37wN4iUHQjxIUP3dcCyf3s47Eiv13ueQ3ryWKT3Jk7Sdm0wXAyFbtNiumo+KyJlzInPTh1iecZVMBzRSI9zgEtiqt2rlDHiCJb5B9aUSVd82S2hv++D0cgEULdG26PKjXNJJjk/ZINrGyj2fel0417MAmMv2ahw5cer7sKL7fL7htCAc9vtcjP3G/un/Fo6oRFoRsZo3nMpS0VE8PRvMomGBrw0OB6V7lr4+S1z0eWJYbaqMQlbKlnmrnKf0rVt/kgA8xrUenOWt0kradZj94lxBoM2HHxoPuOdS7/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G6hKNsPaZNnBXFYtAz/fvCiIU4YZPudv86fmnRYx1A=;
 b=GpSNtB8Fs1WEMkrRGa5kp892VJgXTgpezvAYQR851WInI2rIR/F9whGG3FvRVlnqoidTiLkFnzM30ivjz5tY1Tc7vC12CKy/Wd4Q0EHQSPFK/vsLc+v8Wfg9jHkGPZDIxTUpQ12tQbkB0SlfMdMWqFmMYPHWEVmYKzPA0g79a6zm4ejETcFwbPizy6Ooi7+RrSHki5p1pHqnfwHEK8h/eXymbVnTdqpkouu9+Ynh4B71jIV9GQrCeYSnlpO647aBNvO/goWq7MNZ8Rver+vI4VMp7e4SwzSToROWSy4MMLVL+QoI1aRs4gqfzrDq6xAGmwy5S2cuXtskax/1FPjqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G6hKNsPaZNnBXFYtAz/fvCiIU4YZPudv86fmnRYx1A=;
 b=N7wz7T+CHs0PrA7TnrF8terUDjTD8VNvNYFOZ2Z57uGE3Vtdlp7t98oJYQN7oFmFjx/WBoMQkvQJxDAmR1UM40tXLDnlxCYTPMoUjaayc0ZipC14JjjejpDNM1CyOrnBdgzEcw2MGsCRu78AFJUvyvyiQG0KLlhr1vKLcAp+2aI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:44:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:44:09 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-langtable: Upgrade 0.0.51 -> 0.0.52
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
 <20200824091457.3360-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9aff0ff3-041b-0060-56e5-080ee25b6e77@windriver.com>
Date: Tue, 25 Aug 2020 08:44:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824091457.3360-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:44:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbfcbeb5-81ec-4fe4-f4c1-08d848f48f93
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB426010422A0AA1F3A7607A0B9F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hv919UpMxVwCegPk4Fi/s7hrNdtSLK1mZX95Z0YTb6wnrvYOdEyvVX12GyKr4BTLMRz6X5tXgV0vrQySHeCdUnWESYiVJuCK7VCx3/6fqQIsS5l7o+g1ZMkBuyb7pyFSrvKXZoKBNesS9NOWa3B5CbzMQgJS1MnT69v0NAS39meGYB79a6LRRm0nxZPk+W1iVP6ZXib72CZKMLBDKrVI6ByjE2iWFS9D2jwcSvcpIRD9Le3R2wE4vZqWAvfsOtWIjoiayLt/525hQr67kNaTXz0t9N03/jgPNrJV1WxFLMdhgFZT6oGupyA3/JYgN8RUdtZI+SUhrpOPhU75fCOn2gZDWPHB9DCCpPBwkDk0Ty0PafkS21wC5ZuPW7gkkL7zSPVaEAgIJk3hucrPQ76YGEIvNe3x6rreiBxLZNvkikKENyjX1hP1zccpVq6gwhDMWvLDZq5HP0RlDIGNnYn1vA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39850400004)(346002)(86362001)(2616005)(956004)(53546011)(26005)(83380400001)(2906002)(8936002)(44832011)(478600001)(166002)(8676002)(36756003)(33964004)(966005)(186003)(66556008)(66476007)(52116002)(6486002)(66946007)(31696002)(5660300002)(316002)(31686004)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SbrqZhBg5e6CXsDFHO6cAkYHP94AfU4Jr9IaplXOG27Ja1HkTxI4CsP59eMzMrJVjGOfijdFykpsAVlB4iDVJuBRjs/HcqSnh8w6NBFKJ2wqft/I1YZaVBegypCpKvHAbOkh6lf9CL5Q5EV2IpsMvoLdW5STUC6NHeyWIJX4QXdwxkhGR5PJ5GPFYG6MGvGwFULNv98j3eGO+ru6h2aJrcGsqGpYGaaBBJkb6++WVrqRnjIdWmM0Y60yW+8OmrNQe7lBV+byVxq0WHVIEhqOlPCneKqFCTOiGTFJFL9j6D/Ir1FdTz55QGrQM0rFg2qZ11w1EgbTDNTOb2Gw8cJ5AnVK7JpiZoBOaqm2RbToMx6tCGeg8Zi6mTQxu+Sb+4kUojacd1M7D/OAQMHHYwdxQsx7TfAewdbJHp9LmZoYJoFoi9bZLClGASimG9LsbDuaZwJ8Dz2YxbDbbjzl4JCkq5KpciuyRLRYhhpwjIqBkKW37fjvmVUXqZnZXYEE/Q+k0gijghEZMJjiyCugV3zluf5TaMPAFzsZlQpPdVBEG5d3FgqUZ//UF7Sset/V/IJhTOfaBPMmVM+NVLWzdUzQgIxU0BQ2BGj1ReStPsXtmQvtAigLZYctw5+flOz4aDpR//0BIfz6XySZs8DSDGwfZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfcbeb5-81ec-4fe4-f4c1-08d848f48f93
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:44:09.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBDl2eschGzH44eEhYm1KdegF8USlZUIk1dqB16zk0QnfsyM3SOV+4yBIkAmOXRW+UMBL4GnqVHxEFnlP7ffm627xHeeK764gx+RvP05RYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------C5BC2A820DC3DE9DCE59833E"
Content-Language: en-US

--------------C5BC2A820DC3DE9DCE59833E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 5:14 AM, Leon Anavi wrote:
> Upgrade to release 0.0.52:
>
> - add list_common_keyboards() to public api
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-langtable_0.0.51.bb => python3-langtable_0.0.52.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-langtable_0.0.51.bb => python3-langtable_0.0.52.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
> rename to meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
> index 8340382d1..e6ccd7b54 100644
> --- a/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
> +++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
> @@ -6,8 +6,8 @@ SECTION = "devel/python"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
> -SRC_URI[md5sum] = "5d28198fa933dac5c037108d8f5cf3bb"
> -SRC_URI[sha256sum] = "8d4615cc0bb0fa49faa05b55ff49b1f41122b8092ca18a5d10f1e1699d6d7b3c"
> +SRC_URI[md5sum] = "240a62b84ed29f6530ceae60609f7eff"
> +SRC_URI[sha256sum] = "a2c499704c91c0a23e5db92e80ad1d45e51466b82ffaee478e5bb781460b3db5"
>   
>   inherit pypi setuptools3 python3native
>   
>
> 

--------------C5BC2A820DC3DE9DCE59833E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 5:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824091457.3360-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.0.52:

- add list_common_keyboards() to public api

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824091457.3360-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-langtable_0.0.51.bb =&gt; python3-langtable_0.0.52.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.51.bb =&gt; python3-langtable_0.0.52.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
index 8340382d1..e6ccd7b54 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
@@ -6,8 +6,8 @@ SECTION = &quot;devel/python&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
 
-SRC_URI[md5sum] = &quot;5d28198fa933dac5c037108d8f5cf3bb&quot;
-SRC_URI[sha256sum] = &quot;8d4615cc0bb0fa49faa05b55ff49b1f41122b8092ca18a5d10f1e1699d6d7b3c&quot;
+SRC_URI[md5sum] = &quot;240a62b84ed29f6530ceae60609f7eff&quot;
+SRC_URI[sha256sum] = &quot;a2c499704c91c0a23e5db92e80ad1d45e51466b82ffaee478e5bb781460b3db5&quot;
 
 inherit pypi setuptools3 python3native
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C5BC2A820DC3DE9DCE59833E--
