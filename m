Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.47])
 by mx.groups.io with SMTP id smtpd.web08.5206.1604568614263125378
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ReD88WYi;
 spf=pass (domain: windriver.com, ip: 40.107.223.47, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItgtTx7atbtKYpcMqQ8Z7n3XI0X/EtCMGh9IPG9M4/Eo2EvoDmJj4FK/j3mfq1Ycyp8doZ87yL6mKlSYx5xWSm7vu/QF+T++PU1jIuc0A0ydKr3ax+aP9e6Mr0QHNjoQycZPTtONhHw5i/lGuUzaCQfEBjNV+2ukNpbgFbBEif1sDt2dgSWfxfeBMwhZ6xDAXHwrW6fwYr/gw02mlQyagBivhkuiJYS950ErMaggYtqmPFXU3Tgq2hKGxdnhy1mvf28PlLjQ42pUSPhX3pLuyKQwGmZO6d9TIMuHebl2evtCOJAq21rjw+b/X8YzjFkiijMIymxs0NpHXYtvXf87Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y6uZ1ZoJtaaF2jSG1dXmnQvxQsmUvCAhYHSQieiHmk=;
 b=VNnfa18GUkD/L+14ggmYCJx5P1qKGHtpdhSvhkgRqWdx1+1jSU9EIHLtNJzk/CVvGHMKgkJubgG1H9iWpN9fe9Y/wlDa2Dl7B7hsXR0yJWEHPgH3JLLLb0WUSEntp/YwLhdfWeuFUpzodP3KFGvM/hCWW63Fr+JQ8yLo842GmwuScK2UwFyqg32PbhrWQbUVBbNfVfo3os1FwVMpXW/RazsCejELIDR/lO1jVCBtNUmc3sG5mljQYvZ4n72Pmzw8KPta1rPM8yhzm1yBxXRhIRFYRJxcMuLy6ATcrRh61EK/fT6O4EXYNbzaFtGvju/dR1WrUOyeMttLeBUMTskYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y6uZ1ZoJtaaF2jSG1dXmnQvxQsmUvCAhYHSQieiHmk=;
 b=ReD88WYi55w6qLrB8+PCjC1sm1vjLSTk5WPy6xMFabiSnruGnn3sYJV/X90ObTcOVc+bCXDsamzYxn29tV5jCuBCmZLnF1oXOX9I5DcCyBkdnf3xuobHrCNaHCs6cg7TcB1P+l6r2o4mEBKmgGY7PqGLzuncZ+l4SNIPCH13jZs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 5 Nov
 2020 09:30:13 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:30:13 +0000
Subject: Re: [oe] [PATCH 1/4] libmaxminddb: add new recipe
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <164492384A65F946.6094@lists.openembedded.org>
Message-ID: <7f82ee81-b5b1-639d-ead3-6b040002537a@windriver.com>
Date: Thu, 5 Nov 2020 17:28:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <164492384A65F946.6094@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.6 via Frontend Transport; Thu, 5 Nov 2020 09:30:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ec836c6-9673-4bca-2be8-08d8816d65a4
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48170EBF1E424F01371B338EF1EE0@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HnC215NbPZDI5nx5c4IU9lGHW8Mkh6l+DGg6OjIHWu9stLaLdY4niwuraMLpndv3Z/OXKvOv9cgp2aAyiV0FXUHqUnMer5Sc4YVfPXo3jNRUj7Dk6l+ROadXGUZTKLwzQFLOBw7WxQBQxzfSk9UJYS+KTLyT8U+8kKB5S+9zzhEAodU8gYeXb09onCbBjHWK1vov5SSyeiQ4web6cVHFuU61QlM3NZbn9U+tBoYU2tQnHZXzt12J6UqbIgR2oxayELBrSitG02CL+RRb3xdkYxy0BsW6YMuJHL6y5HSU14TCQ9nUwQn43xStak2B97U3P1tD51NE4nc5W5twNXjpX0PVXKL5czvKy23wsQU+FAMvPh4M2YRh+pQK7XD9+xVaK/Ou3XE6etNO1O3AtFFKRKf7aWuUttIhwl6l6bvA0z5rsFm5BG7sgpy9ZyXO4iOAbgOh89D3iYy40rq8NaJh+shG/l5u3aAmGJLxhHbfipc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(66556008)(5660300002)(66946007)(66476007)(6666004)(186003)(6916009)(52116002)(6706004)(83380400001)(53546011)(6486002)(86362001)(31686004)(16526019)(316002)(8936002)(26005)(966005)(31696002)(478600001)(16576012)(8676002)(956004)(36756003)(2906002)(2616005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Yi8Xhtx6b5eoIcAzgtVQ0lhKh/nVW1kP3PMl2JhWzqePblNiupbJhZoTM2ActNz8ZZ3BZHS/HPa1qHWuNrgieiOx/+iLz+L0Ndy9pIHD/uOAUmoJ0r7pucP+18oVgLv6afjQjM7Bi2vUH9Cg/9MQ+mbqLItSu7/iNLSmnuBENu8sSzPo09L/4FI7gfFsRTtnyibRBBtSConJWJ2YcdVg5pxSrdSpgj7HLZWbjvFE1CnBLHZSuUos01RTLZRVppA9bCsVl1dLLKdPzRkE3bOjGGOCnmxYLRzfObtNu++zr2rvM/EbfO7IttR4fL8otWBDIT7Tbm2L+2XZ6WuYzFxQa3bDnjZ2Tg4UhZLZL3D36BptL04+85wBZb+A6wN+jjJjyBZ0iQ8TDHIQSzL9vdyEfkKLKuJgTK4wMfsFmJ7ymndsA/JptASac3hNvF150Z4Wox+nPf4JF2x9o3lNWtaCNxjwCYj/zF2YTvZKsRkqg5dd5CQf8GzRMGm0jKe38Utbj2ZmDm6YkQcGCeA+hJ+CICE9h9xWu9Yv0HBSt72VoUlsaEoBBBgTL0ZPc8QwQiA+sfUWs+oAsKMqZIs8bQWQmLYcsNZJnDvI3fYKO4T9hZNXeDOvzR2xM5Jej3Zq4KMLKSyfhPddPdZ14VL2IXXmHQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec836c6-9673-4bca-2be8-08d8816d65a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:30:13.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6ewsagE1eKW48r7vZ3EiBavkC/cNxFYTR8a/PMBdBKAYbqXVL2b5wsps/+vSPQ8Gi2u8PH1e9yPExNT9VvFig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Please ignore this series, will resend with the sub-layer name in the 
subject.

Thanks,

On 11/5/20 5:18 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The libmaxminddb library provides a C library for reading MaxMind
> DB files, including the GeoIP2 databases from MaxMind.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../libmaxminddb/libmaxminddb_1.4.3.bb        | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> 
> diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> new file mode 100644
> index 000000000..d5c303861
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "C library for the MaxMind DB file format"
> +DESCRIPTION = "The libmaxminddb library provides a C library for reading MaxMind DB files, \
> +ncluding the GeoIP2 databases from MaxMind. This is a custom binary \
> +format designed to facilitate fast lookups of IP addresses while allowing \
> +for great flexibility in the type of data associated with an address."
> +
> +HOMEPAGE = "https://github.com/maxmind/libmaxminddb"
> +SECTION = "libdevel"
> +LICENSE = " Apache-2.0"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +"
> +SRC_URI = "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz \
> +"
> +SRC_URI[sha256sum] = "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +inherit autotools-brokensep
> +
> 
> 
> 
> 
> 
