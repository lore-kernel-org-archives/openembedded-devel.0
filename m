Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web10.7689.1614177598898364981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=geBAq7Sa;
 spf=pass (domain: windriver.com, ip: 40.107.93.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9EqRUhq5wT0Qd9mTxJ7v3kB/7yGAtkhVVfPa5+MKgN1JFWUd3KyL+Mb4hHVa3TwsubqXUKpp+QrHhZpV2F1YyDKMbv8CdsDX7JvCB88KI24D720YeZPbf+74Zjm+y7mj3plfYqZ1Hx532S5pzrQ+vPwpLGY8lTJzrIKhGpV8Uk7m1O7OQRpUvRuF2waMe0nySg7RJVLYqkX+Fh/aDdyLeAFQpDBOOb3xRj7tcLk/WI9vJdGAtgR0gTNiGmeYqlr8nsO5k1T8EXY3pNUtiDrKqzPSPSv7AOc7TRwra/dm9WDcJANbWEbNaCUTuOV9eL3jwV40qAC2plLsE8DDgrQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8UhFfmIsSOJ16kl2kb+dKy6ECdCoQI8kma0TJLNg5Y=;
 b=nyZJ3hTEyjqLu9oLPMe+QnlhQMIp3T+X7i3JvoI2RNr91X/+ywxRqcdr1vM1o8A6eSSueX0WQkeAe8vzXsq/GxiWcFCHJFroEaY7Y8IYAz9oDmCJ2lum0meB0U+Z3Xlg63EzqKKhqkvXnnnqo1exrq8kZgLFbet2JtPStmvGahuRom5jpzLygRE3hWo8P5gx5eIWWRFHxn5wMGbxTTEzvbk9r3GGQ7I8bgoTebAdiP/zqIJKr9S83ZxeSyc6r1qUg9pcNztlM5FBd6bFBsMnHAAMdSwkWLpqgid9P9F/vUk7fKuCQrGFGnE1lld1J2SGb7YdgzDVwj5Co9vOW7A/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8UhFfmIsSOJ16kl2kb+dKy6ECdCoQI8kma0TJLNg5Y=;
 b=geBAq7SaTJjVrNb+6nTe9TbwykhJ6H85hTAncRIO1iU9X06GlcJVhgMOsBqrXTpFfLHhZYyMW4awu0PeIY5gpxVyXYqlXkfkyRRA33VD/Y6RDctNov7S0+NPf83Kq3BQZjokcHuE8hwByilZbDN7o0Mm/HCM8Xwqyd2TFvMaST0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 14:39:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:39:55 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210222171510.17951-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1b3026a4-180f-1618-9f84-7bffffbb4c5d@windriver.com>
Date: Wed, 24 Feb 2021 09:39:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210222171510.17951-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0913.namprd03.prod.outlook.com
 (2603:10b6:408:107::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0913.namprd03.prod.outlook.com (2603:10b6:408:107::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 14:39:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3c9f7f3-46da-4d17-6a83-08d8d8d20da2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2678FEF65ED139AA6C66F8D09F9F9@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3fuSIWSaEyMBXhNejZ1ZYQ1nq6i+yfQiGgtjGDbYXhhzDuiXciYF0nLcxk1v6NoCdslIE3z3LY67SyS1RXocmE77wkM6MDh4OJRN8pFr2hfEYEkTJMGWKBvb168BBaPIkGCyccpN9hYMxtKy8FifyWn2Jd3TvWhip1yVuNmhPdb7+jvIWdZHX8gMpTcmLlMRKtx9VNrmtN6VW2cMtY1od2f8oBfUL0MMUn0vCbZOCkAXuCUgSmtghm5w62wFo49OFCZw4bWryPU2bAHnleCoSqkikHwt6RK5g7zX7TFpAZyjsTKc3ztc1Ru/Kz2ke2cVBuHaMstslB7xYn1VYdTdYro8BeTmCOgQ/8mH0IfQCtnSfwdU+VAg4W+JvwHTl2c00icnyAMmnrN9EwFHVxtAxRFPa4FMb5qf3QRI+6Wpxhn8nSq1r4fc8f1PCEL8cSLgxJHOcCjJ0dWMjZqAkiRXXao9AcKxFggcujMK+TPA3Ob7J3sEVUvgh49kPgnGzKQqO1pvfu6bfXj7fAHmQNiZlm7Jxf6bXSjKNZQCKRqNwwtkD8fYRoBeEunUQLlMNgEyoTFx4Q1XFSoa9ey5cQcpYYb2pIttnMkwPqq037mn42peukUiH9USYvOVGQL868R6zqPbCI11feZmJRKRc/e3AvSXCIOARgy6GTNDC7ZoqqtLsxl6Qh5M+Y4B2hqe+62/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(8676002)(31686004)(8936002)(36756003)(478600001)(86362001)(33964004)(31696002)(66556008)(16526019)(26005)(30864003)(956004)(2906002)(44832011)(66946007)(66476007)(5660300002)(6486002)(83380400001)(316002)(53546011)(2616005)(166002)(186003)(966005)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZTVPSWVwb0FNZVEvSEptOEFLY1BSZFE4dmFTSUticjloNWlHSThOOSt0YUxp?=
 =?utf-8?B?eFl5dE1laDBXVmFkQml6dll6K0Rrb0IycHBpdldSdUtyK2srYTFPaGhPOXFt?=
 =?utf-8?B?SWhnNHFJcnZFZHdCcWxzTnpnZlk5VlJvMGpTYTZETGdQOC9rTEllcjNCMDF2?=
 =?utf-8?B?VW9UbVV0c2N6T3IxakFzZTd5amFrMnl4OFk0R1RZQTFrbjhjek1EUkEzd01D?=
 =?utf-8?B?OXFDWEtCeis2b1lJMXd3SEoyN3pkc1NVcEVURDdRNG92VDNHanZlRlZRYXNo?=
 =?utf-8?B?Z016cVJwclB3bytzYWczOTVpY2lLd1BlU29VTFV4S2x3ZFVVVXlkOHBQMlBz?=
 =?utf-8?B?SHp4YUJrUjJQNi9zbzVGbkNFMFMveDJRWWNPOEtWbjZrYnZZYnlLZE1TSjVr?=
 =?utf-8?B?N2RpYWxjMlZ4OEIwaGJoUzZpem1Xc1hJVWxPYVBNZVZwVDVIWEVLZlZDNHFi?=
 =?utf-8?B?RW5QWmxjamF2eHZXUmxlMThqOE5CaS92UFFIcVFNSUZuMytkMXp2MnZtZFpC?=
 =?utf-8?B?WHIzb0lTUHQ5MFRSY00vclBPS1NLZlNJN3hoYlRtc0NoaDhBTFdQeTRONVh6?=
 =?utf-8?B?cFF0M28zL2ZsMlpBcnp2Yk4zNWI3TFVRbks2VXpHWC91Uk5uZTNCclhRdGJ5?=
 =?utf-8?B?eUtPcEZBTEhJQVNXTEpQay9ZejFkWFVYRlBWdVhQbUcwTWRBR0tNM2dReXdW?=
 =?utf-8?B?LytZT0grRkRGYUMwa1gxSGUvTEVsV3ZHTmxUbnN2VnFJWTlCbjJYaW1hVzZR?=
 =?utf-8?B?SmM5VmM2cDE2NUtmVnlzK2NhWmhGVE9jckpMcHlJYWo4S2xmdWZxeGlBYmlr?=
 =?utf-8?B?SWFJWmt1clJqamVNQVpPWlMxajFpTm02OUJtQnRwUGpURzViYXlxSkNTVU5k?=
 =?utf-8?B?eE56azZvWUhEb2xlS25Ic255NjNYaXgzMmtJUjRvV3MrWEt1WkpFamx2MVFy?=
 =?utf-8?B?YXNpQnNFS0ZtZ2xNZFJpWlRPYm5ETjhGN3dBWnVDcTY5YWdJVzNsNFhTVXJZ?=
 =?utf-8?B?bThkMEJIanRLQWNlVXZVeVZWbzJpWk5JWGFqYTNtRU9yWXFZekxrcFZYN20r?=
 =?utf-8?B?SG5HM0VzUFR1WjdKa1BKUnhLQTdYOWtBeS9nQVJuNGtpaUtsTFZIOWJOTVpr?=
 =?utf-8?B?YUxHL0I0NUk5RUhiNG13TVk4N0RsT0h2dHRPV3hQU3kxSFlsWitJelFkWFFs?=
 =?utf-8?B?djIzc1JMRlJYMFNoYlFucGxNcGw0UVNNWmJRVi8yazhEdGE3b2R0QkNoTWN2?=
 =?utf-8?B?MUlLbE5HVTJKTEx1a2gzaGZwQ3pXdXdQYUQveTEvWmlUWnBIVXRERExRSHpV?=
 =?utf-8?B?VUhNa2pXM2doS0ExaXZNbWxYbWpXWU1rRENlTG5JbFVJMTdyZGpzUE9qNk9S?=
 =?utf-8?B?WEI4Vk02cjVxcjJYY1FSM3IzV3ZMenpwcVdoQTcyYkh4eDgrTnh6aFYzOFUz?=
 =?utf-8?B?aVV3SjUyL0x1UmUvYkREaVVBS3NORlZEY1dkbXNZcmdsMXJaUm51V0x6YjRx?=
 =?utf-8?B?Z3ZMaXI3SXoydW5pYlptbk9xaFF1eWJnT1R2UmwrS212R0pmZEUxMFBwMTFM?=
 =?utf-8?B?ZE9GR2NJRjlDckd3NTZQdjF0K1kybHRDMTJ6eXIzNENNVldYcHlMR1k3QUZk?=
 =?utf-8?B?SnpEb1BBN29WSkNZUnU5YlNnRXJBT0l3YlZjWStqWmhLYkd5elBlZmV0bi8v?=
 =?utf-8?B?blFGQW80Y3NONC9IV2Zyc1hDZmk1MzZJTkEvcEphbHJaT2J3ekF6RmQ2UXlu?=
 =?utf-8?Q?WlIcYRsY5lUGHHSxoMzw2vhp6LDJlVbxNx1pjvO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c9f7f3-46da-4d17-6a83-08d8d8d20da2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:39:55.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hjE/CSbNUvp32vAaYKuJ1Apn5BZUlPsOIpl8Z/jEFHSW/gvzde5BgLR70UGzaCP4U+nKDYvyPz8zZlnUVieQehYhTmb3zYuZHI41nVuyds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------3380770617CA2234199EBA77"
Content-Language: en-US

--------------3380770617CA2234199EBA77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-22 12:15 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.1.0:
>
> - Fix using bytes as names for :meth:`~Group.create_dataset` and
> ￼  :meth:`~Group.create_virtual_dataset`.
> - Fix writing data as a list to a dataset with a sub-array data
>    type.
> - Preserve endianess in Cython dataset Reader
> - If pytest is missing pytest-mpi then it will now fail
>    immediately with a clear warning message
> - Fix a test which was failing on big-endian systems
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-cross-compiling-support.patch        | 47 -------------------
>   .../0001-setup.py-Fix-numpy-version.patch     | 28 +++++++++++
>   ...1-setup_build.py-avoid-absolute-path.patch | 15 +++---
>   ...3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} |  5 +-
>   4 files changed, 37 insertions(+), 58 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
>   rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
> deleted file mode 100644
> index 8c0b914326..0000000000
> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 29 Jan 2019 17:08:32 +0800
> -Subject: [PATCH] cross compiling support
> -
> -Remove useless dirs
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ----
> - setup_build.py     | 4 ----
> - setup_configure.py | 2 +-
> - 2 files changed, 1 insertion(+), 5 deletions(-)
> -
> -diff --git a/setup_build.py b/setup_build.py
> -index c0e9a28c..ffd3bef7 100644
> ---- a/setup_build.py
> -+++ b/setup_build.py
> -@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
> -         ('_HDF5USEDLL_', None),
> -         ('H5_BUILT_AS_DYNAMIC_LIB', None)
> -     ])
> --else:
> --    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr/local/include'])
> --    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/local/lib'])
> --
> -
> - class h5py_build_ext(build_ext):
> -
> -diff --git a/setup_configure.py b/setup_configure.py
> -index 5576775e..75f4141e 100644
> ---- a/setup_configure.py
> -+++ b/setup_configure.py
> -@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
> -         default_path = 'libhdf5.so'
> -         regexp = re.compile(r'^libhdf5.so')
> -
> --    libdirs = ['/usr/local/lib', '/opt/local/lib']
> -+    libdirs = []
> -     try:
> -         if pkgconfig.exists("hdf5"):
> -             libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
> ---
> -2.17.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
> new file mode 100644
> index 0000000000..4881b023c8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
> @@ -0,0 +1,28 @@
> +From e6c0d487fb5e6063305b8b3187896fbfe5720ed2 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 22 Feb 2021 18:42:43 +0200
> +Subject: [PATCH] setup.py: Fix numpy version
> +
> +Fix numpy version to ensure bitbake will find the pip package.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 7dbe583..6602c97 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -49,7 +49,7 @@ SETUP_REQUIRES = [
> +     f"Cython >=0.29; python_version<'3.8'",
> +     f"Cython >=0.29.14; python_version>='3.8'",
> + ] + [
> +-    f"numpy =={np_min}; python_version{py_condition}"
> ++    f"numpy >={np_min}; python_version{py_condition}"
> +     for np_min, py_condition in NUMPY_MIN_VERSIONS
> + ]
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> index da95ee7af5..d0c2ece19b 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> @@ -1,6 +1,6 @@
> -From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
> +From 1a46082d0889a784037952c4da0cde3822849032 Mon Sep 17 00:00:00 2001
>   From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Fri, 29 Jan 2021 02:33:06 +0000
> +Date: Thu, 28 Jan 2021 18:44:10 -0800
>   Subject: [PATCH] setup_build.py: avoid absolute path
>
>   Prevent absolute path from ending up in the egg-info SOURCES.txt.
> @@ -8,15 +8,17 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
>   Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
>
>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +
>   ---
>    setup_build.py | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>
>   diff --git a/setup_build.py b/setup_build.py
> -index ffd3bef..fb196c0 100644
> +index 3c7c7ad..d824bdd 100644
>   --- a/setup_build.py
>   +++ b/setup_build.py
> -@@ -20,7 +20,7 @@ import api_gen
> +@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
>
>
>    def localpath(*args):
> @@ -24,7 +26,4 @@ index ffd3bef..fb196c0 100644
>   +    return op.join(*args)
>
>
> - MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
> ---
> -2.29.2
> -
> + MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> index b812b323fa..03ae4c9db4 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> @@ -4,12 +4,11 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
>
> -SRC_URI[md5sum] = "504b595237409ab766fbbe568e60a080"
> -SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d"
> +SRC_URI[sha256sum] = "1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5e5c7ec2d65b0fc3c2"
>
>   SRC_URI_append = " \
> -           file://0001-cross-compiling-support.patch \
>              file://0001-setup_build.py-avoid-absolute-path.patch \
> +           file://0001-setup.py-Fix-numpy-version.patch \
>             "
>
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------3380770617CA2234199EBA77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-22 12:15 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210222171510.17951-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.1.0:

- Fix using bytes as names for :meth:`~Group.create_dataset` and
￼  :meth:`~Group.create_virtual_dataset`.
- Fix writing data as a list to a dataset with a sub-array data
  type.
- Preserve endianess in Cython dataset Reader
- If pytest is missing pytest-mpi then it will now fail
  immediately with a clear warning message
- Fix a test which was failing on big-endian systems

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210222171510.17951-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-cross-compiling-support.patch        | 47 -------------------
 .../0001-setup.py-Fix-numpy-version.patch     | 28 +++++++++++
 ...1-setup_build.py-avoid-absolute-path.patch | 15 +++---
 ...3-h5py_2.10.0.bb =&gt; python3-h5py_3.1.0.bb} |  5 +-
 4 files changed, 37 insertions(+), 58 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
 rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb =&gt; python3-h5py_3.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
deleted file mode 100644
index 8c0b914326..0000000000
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-Date: Tue, 29 Jan 2019 17:08:32 +0800
-Subject: [PATCH] cross compiling support
-
-Remove useless dirs
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
----
- setup_build.py     | 4 ----
- setup_configure.py | 2 +-
- 2 files changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/setup_build.py b/setup_build.py
-index c0e9a28c..ffd3bef7 100644
---- a/setup_build.py
-+++ b/setup_build.py
-@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
-         ('_HDF5USEDLL_', None),
-         ('H5_BUILT_AS_DYNAMIC_LIB', None)
-     ])
--else:
--    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr/local/include'])
--    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/local/lib'])
--
-
- class h5py_build_ext(build_ext):
-
-diff --git a/setup_configure.py b/setup_configure.py
-index 5576775e..75f4141e 100644
---- a/setup_configure.py
-+++ b/setup_configure.py
-@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
-         default_path = 'libhdf5.so'
-         regexp = re.compile(r'^libhdf5.so')
-
--    libdirs = ['/usr/local/lib', '/opt/local/lib']
-+    libdirs = []
-     try:
-         if pkgconfig.exists(&quot;hdf5&quot;):
-             libdirs.extend(pkgconfig.parse(&quot;hdf5&quot;)['library_dirs'])
---
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
new file mode 100644
index 0000000000..4881b023c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
@@ -0,0 +1,28 @@
+From e6c0d487fb5e6063305b8b3187896fbfe5720ed2 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+Date: Mon, 22 Feb 2021 18:42:43 +0200
+Subject: [PATCH] setup.py: Fix numpy version
+
+Fix numpy version to ensure bitbake will find the pip package.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7dbe583..6602c97 100755
+--- a/setup.py
++++ b/setup.py
+@@ -49,7 +49,7 @@ SETUP_REQUIRES = [
+     f&quot;Cython &gt;=0.29; python_version&lt;'3.8'&quot;,
+     f&quot;Cython &gt;=0.29.14; python_version&gt;='3.8'&quot;,
+ ] + [
+-    f&quot;numpy =={np_min}; python_version{py_condition}&quot;
++    f&quot;numpy &gt;={np_min}; python_version{py_condition}&quot;
+     for np_min, py_condition in NUMPY_MIN_VERSIONS
+ ]
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index da95ee7af5..d0c2ece19b 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,6 +1,6 @@
-From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
+From 1a46082d0889a784037952c4da0cde3822849032 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
-Date: Fri, 29 Jan 2021 02:33:06 +0000
+Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path

 Prevent absolute path from ending up in the egg-info SOURCES.txt.
@@ -8,15 +8,17 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
 Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/h5py/h5py/pull/1803">https://github.com/h5py/h5py/pull/1803</a>]

 Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+
 ---
  setup_build.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/setup_build.py b/setup_build.py
-index ffd3bef..fb196c0 100644
+index 3c7c7ad..d824bdd 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -20,7 +20,7 @@ import api_gen
+@@ -21,7 +21,7 @@ from setup_configure import BuildConfig


  def localpath(*args):
@@ -24,7 +26,4 @@ index ffd3bef..fb196c0 100644
 +    return op.join(*args)


- MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
---
-2.29.2
-
+ MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
index b812b323fa..03ae4c9db4 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
@@ -4,12 +4,11 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=113251d71fb0384712c719b567261c5c">&quot;file://LICENSE;md5=113251d71fb0384712c719b567261c5c&quot;</a>

-SRC_URI[md5sum] = &quot;504b595237409ab766fbbe568e60a080&quot;
-SRC_URI[sha256sum] = &quot;84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d&quot;
+SRC_URI[sha256sum] = &quot;1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5e5c7ec2d65b0fc3c2&quot;

 SRC_URI_append = &quot; \
-           <a class="moz-txt-link-freetext" href="file://0001-cross-compiling-support.patch">file://0001-cross-compiling-support.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-setup_build.py-avoid-absolute-path.patch">file://0001-setup_build.py-avoid-absolute-path.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-setup.py-Fix-numpy-version.patch">file://0001-setup.py-Fix-numpy-version.patch</a> \
           &quot;

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

--------------3380770617CA2234199EBA77--
