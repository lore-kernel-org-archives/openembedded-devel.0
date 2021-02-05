Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.51])
 by mx.groups.io with SMTP id smtpd.web11.8442.1612533834631559526
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TcqBs4bA;
 spf=pass (domain: windriver.com, ip: 40.107.75.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+gwlzxxKWLKZ4wHh2Y2PE3jZynXZuSxOdqO9B9ouPL6/7WZT8QLb086GFIUc+H3Hbfw+fJU3NSoD+DO1DRF3w426PjHqOQjxUcMXsvclcbbQHsSx6vnQtOe+lCMO85KtApJN39P1LTmgeCU8unfzibkblVaJd5K+JCc7lFxri11voqyf1iEjKm3UVp8pctjYGlVbuHCZm+bdifNkNjOASxIyXfLv3jvKJLlnzibPAIehxLPEuw9IJcB/+PQKXcjR31/qpl4BYVdk9ShbHUk2Yl0BkLXEDpig1NZaySAQqDWeIbk2TQ2LL9VX3c7a82A2YQmsbXkkmUOoLY++i4ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/Mmg+7xabSIT5CZAK9HpZODM78n8xQAsbZa+46nPFM=;
 b=ffFFEOmm5vNyteX/sBUcfeTZfVuLSbAIegY4bEr48kp3oRhFci5B374gk3JFT+XdKhxUTdiG/E0ARXmN9txamJdP6/M5vqrqh6Tglvd00mOxEjxT4K8jIRUujbpiDF5Pa6lpEONUGvz1ONnKO8SJis9kA5q0Yn9E3lcgIdVgavXfkJ/gal6v6n2Qim4P0vBT6q9twn43z+PV68bolz3g/zcSim1CbZlcO8XOJRrdBtXS051CUH1nOgQaH0Uz+rTy6UV9+mCeLzsqZ6UnyoLP7Pq07CqgyF2xABkr6l5FoZ2xGL8LTqgN+7e+R9QFs9OU+lTV3IG7wYJVaxRY2hcmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/Mmg+7xabSIT5CZAK9HpZODM78n8xQAsbZa+46nPFM=;
 b=TcqBs4bAfScwIhqXKDhsAZYbpJNv52ZJAb78G0uZiNX/gc5J37EQLqNsIpMVn/XgN/myLX8pHW69cwehRvOL0Bacu9fiIhubzx5mHcTqNhYpTp0dj4RFLvy3yIk1hMoJgdHfIF6HIC2vVnfnMZ7J0/ppg+oM+UAOYMawgC6TojY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:03:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:03:53 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <705cccd4-b386-75b7-374d-5f89484df713@windriver.com>
Date: Fri, 5 Feb 2021 09:03:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203153822.25077-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0544.namprd03.prod.outlook.com
 (2603:10b6:408:138::9) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0544.namprd03.prod.outlook.com (2603:10b6:408:138::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 14:03:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bbd1fb1-2dcb-4544-3df0-08d8c9dede9b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4830491779DF7C7552699A3F9FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0ZAz10xmDA/xhBqb6A4tawZp1z122hqxqGnzdBmkOiARXGLO7pT9bygt9vEiEC9RhuU7zOymPycbLjP2/vPj/i83ta8ICaNL7FDHoU1b963Ar6nL8jwDS08lOTNeSLiVQZFyTy6UioBdzRGB8eMOJRT+/9OdTRhBFDZ84tP4khukZ2431+56eHoyK9ZkMppimt8ACsww80LOHa+FIE/35q51eLbvv4UaODnpK3MUvGHQB4QVenL76tEHXtUFkQZQSjAc1k6yt5tvvaAgQMQC2LWmg3NjBkgPxzSL79JMKQGP/jPxzIDpeo7YK3sl1pULd4ll8nq+xSxMYcP+v9n1gMFUS3xW59JZn6uwVNiR+0qqviXgGew83YOOUR/m3+jlRVUDrYmE/QcIbju0PA2QQWb3lSnAzJzs0tD7cFfidILYPu5oaHuyhHvTqqLQjQRja52gc+ZFssytXrmdTKD4p1EqJ5MnCBWh9edAXF9NZmoG1jtptrO+AYzF07Bzqgh03et+oyUc8rm5eRGShlwIMMnxPR8sNGAozIc+jMVj2vcHU74qGPvT2Wmbex/tdZlKr40BR9beLtbA6RLqEVpyYHWZHGWSu5Nh7d4LX1ItMcCrSCZD3T9h0nEZUVsM1pp6hZW3v93I7QWaG4b9CBOeDJ52mdrT/aG5SvtKX/uYzjpq6Lc8Wg7djaexUX1hsVvC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(30864003)(83380400001)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cDR2aGFabzFWYXR0YWlNa0txNzljbG4zOS9LWGlvOWl5RFBNdmppelB5L2Nq?=
 =?utf-8?B?WWliOHh2dU5zOHdaamNsZ0owUEovQjQveDRDRXlPcXN1S0l5ZWI3Q3JBT2hX?=
 =?utf-8?B?TXRodWtuajFQaTBpM004RG90eUVVZ3c0SWNKZmZHTlZldHEwcWwvUUY5WTN4?=
 =?utf-8?B?Rlg5RG1zdnJEZmhuM2orOExUQzZvYU5KTWRTMUxtVmNuOXd4K05vSUI5QUsw?=
 =?utf-8?B?QlVYVFlubzdmaDdDMzdNaXUzNkZqRFJYT3dCSUZha3U1ektQTlJFeW1aRDJD?=
 =?utf-8?B?TytKMDBtYXJzbndaSUE3bjBuR2JJUWJlMUNCcTFLY2dIcThWSEVPNHNkS3NW?=
 =?utf-8?B?c2NEd29vR05PY1RzcnRYRWlNbmZtSWE4ckFXTk5raFl6ZWp1aE1ZUG92WmFE?=
 =?utf-8?B?Z2E0N2d2RVEwMEV3YlN5cVRjRkcweTN4ZzFaR2ZQZk40ZHdkaDV0RmV3SjRw?=
 =?utf-8?B?WHRUUTBoNkhqY2Y1cU5XT0NxVXAvNVV3dlllemdHMk1OUlhlMy9FN1c1eTJO?=
 =?utf-8?B?MXlucmx5NWQvdEtHWFFSVHUzNFBEQzFEdnBxYlFSNkNtQTN3MWRhUzZxdWQ1?=
 =?utf-8?B?MHlNazJmZTZBQ09YYTN6Yks0VkZyOXRnbEVjZldWL3NIRHhLbmRGcEhqdW54?=
 =?utf-8?B?MHBnOExPcjRqNEdkajd2eGxWdU9hcExhMHBSRStvVVNrOEszbEZWdlJITzdX?=
 =?utf-8?B?Snc4Vmt5cUZKK01CdHBPOU9IcVNqcUhFSzNuMGJJbE9UL3pVUDJTbUFua0tD?=
 =?utf-8?B?eDI5aWRreHFocFV0emhUQ1hZaHVSOVdsY0s4a2tqYStRNUJCWUFDQjBBQWRx?=
 =?utf-8?B?bmt6SVEwVnE0cVlDRHlEbUQ1T0RUYVFrVHl1d24remZvaTU4TEZsREpSU0k3?=
 =?utf-8?B?bE15SzJZVUU2a3pSbDVrNm5EdlczVFd3VzcrUjNqWU91WW5SeWRmMmNlU24y?=
 =?utf-8?B?c0EvWUZQWWZFTFRnRE5IU084MWVoQ1RWcExrazhoem1VankzZUdmZmpFK0tn?=
 =?utf-8?B?R0lJWGc2aksrTDczVHc0bDhybXpmMWFwZkpGdk1xR3FOTlplNGNhbk8zcjZB?=
 =?utf-8?B?R2p1RW5mdG1UV2NXd1EzaTUzN3RNc2F2VmFYelV0eENVc1g1YVo0NnJNd0Q1?=
 =?utf-8?B?U0JLUzhtU0kvRk4yS2FPY2YvaldSOWpCSmg0bkVRYVdrcm5hMUhVdnVETnhr?=
 =?utf-8?B?QWI0OGhybnZxTG0xS1VnTmtkc1Q5dU12Q3ZMYURPMzFzaVVHcVJBSERSQ1d0?=
 =?utf-8?B?b0pIYTEwSFJaa3loeEJoYXorY0pFbzk1TEJNWWl3cko1enkyV3l4TFMxeWlD?=
 =?utf-8?B?MVdLVkhrMFdXd0wwZDZTN3h3WGRrMDNGd0w5RFlFbXJFRXN0NDJFRGhUVFRz?=
 =?utf-8?B?Y25XTElYMU5CNmRRNmt6ajkzMGFaQVVjSFVuTStUZHlEVlU3bUpGbXBhMXRD?=
 =?utf-8?B?dXZyemtPVFBnNjZWaGhpdmk5cFRrKzlZVkh2VTF0QWxieVZvdG5LeEdjcDJk?=
 =?utf-8?B?NDVQODRnN0lJdHE3R2taY2NNNE5kQysvZ0s4a2IxYjQyUWdwamJ5Zk8rNzZK?=
 =?utf-8?B?UG5Tdko4NnBxMG1lYTZTMUtzZkZUZHg2V0VTeFRRU3RqcVNsc0JWb1h6UXI3?=
 =?utf-8?B?d0FTODZXUGlqVzZYcTJ3NTNLRmpINE1MVHJXMjN1aEtVekQ0Z3VBV0YzNm83?=
 =?utf-8?B?My9VTHhYeFhTNDFRYnZXZWdXdVNWRUk5YnVCUWhid0trVHBVRVhOTFd4U3Rl?=
 =?utf-8?Q?Z/+hYJpeMdZ8Kkp6PdbuKXN/wULoAVXQvd3wgen?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbd1fb1-2dcb-4544-3df0-08d8c9dede9b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:03:52.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+51tQgWz8rTW9Zcdib0GVhAAyAjHxxwXLRLIkAnSDTNMhGOCs/HIcSh2YKh9KDYr5YtiaIytrSxrP2bIT/CqGC/akPtQYln2u3XJQkJmsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------B6A9C260050F10C6FF4D74FF"
Content-Language: en-US

--------------B6A9C260050F10C6FF4D74FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-03 10:38 a.m., Leon Anavi wrote:
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
>   .../0001-setup.py-Fix-numpy-version.patch     | 30 ++++++++++++
>   ...1-setup_build.py-avoid-absolute-path.patch | 13 ++---
>   ...3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} |  5 +-
>   4 files changed, 39 insertions(+), 56 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
>   rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
> deleted file mode 100644
> index 8c0b91432..000000000
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
> index 000000000..57037a91a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
> @@ -0,0 +1,30 @@
> +From 7c88e3762c2381a507dc86b90152216abe79a804 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Wed, 3 Feb 2021 17:23:29 +0200
> +Subject: [PATCH] setup.py: Fix numpy version
> +
> +Fix numpy version to ensure bitbake will find the pip package.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 7dbe5835..8fc15bc8 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -30,7 +30,7 @@ NUMPY_MIN_VERSIONS = [
> +     ('1.12',   "=='3.6'"),
> +     ('1.14.5', "=='3.7'"),
> +     ('1.17.5', "=='3.8'"),
> +-    ('1.19.3', ">='3.9'"),
> ++    ('1.19.5', ">='3.9'"),
> + ]
> +
> + # these are required to use h5py
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> index da95ee7af..05c126e54 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> @@ -1,6 +1,6 @@
> -From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
> +From 86a2c95941a3854fda763037a16b5b22ec6f15e9 Mon Sep 17 00:00:00 2001
>   From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Fri, 29 Jan 2021 02:33:06 +0000
> +Date: Thu, 28 Jan 2021 18:44:10 -0800
>   Subject: [PATCH] setup_build.py: avoid absolute path
>
>   Prevent absolute path from ending up in the egg-info SOURCES.txt.
> @@ -8,15 +8,16 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
>   Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
>
>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    setup_build.py | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>
>   diff --git a/setup_build.py b/setup_build.py
> -index ffd3bef..fb196c0 100644
> +index 3c7c7adb..d824bdda 100644
>   --- a/setup_build.py
>   +++ b/setup_build.py
> -@@ -20,7 +20,7 @@ import api_gen
> +@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
>
>
>    def localpath(*args):
> @@ -24,7 +25,7 @@ index ffd3bef..fb196c0 100644
>   +    return op.join(*args)
>
>
> - MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
> + MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
>   --
> -2.29.2
> +2.17.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> index b812b323f..03ae4c9db 100644
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

--------------B6A9C260050F10C6FF4D74FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-03 10:38 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210203153822.25077-5-leon.anavi@konsulko.com">
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
    <blockquote type="cite" cite="mid:20210203153822.25077-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-cross-compiling-support.patch        | 47 -------------------
 .../0001-setup.py-Fix-numpy-version.patch     | 30 ++++++++++++
 ...1-setup_build.py-avoid-absolute-path.patch | 13 ++---
 ...3-h5py_2.10.0.bb =&gt; python3-h5py_3.1.0.bb} |  5 +-
 4 files changed, 39 insertions(+), 56 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
 rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb =&gt; python3-h5py_3.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
deleted file mode 100644
index 8c0b91432..000000000
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
index 000000000..57037a91a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
@@ -0,0 +1,30 @@
+From 7c88e3762c2381a507dc86b90152216abe79a804 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+Date: Wed, 3 Feb 2021 17:23:29 +0200
+Subject: [PATCH] setup.py: Fix numpy version
+
+Fix numpy version to ensure bitbake will find the pip package.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7dbe5835..8fc15bc8 100755
+--- a/setup.py
++++ b/setup.py
+@@ -30,7 +30,7 @@ NUMPY_MIN_VERSIONS = [
+     ('1.12',   &quot;=='3.6'&quot;),
+     ('1.14.5', &quot;=='3.7'&quot;),
+     ('1.17.5', &quot;=='3.8'&quot;),
+-    ('1.19.3', &quot;&gt;='3.9'&quot;),
++    ('1.19.5', &quot;&gt;='3.9'&quot;),
+ ]
+
+ # these are required to use h5py
+--
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index da95ee7af..05c126e54 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,6 +1,6 @@
-From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
+From 86a2c95941a3854fda763037a16b5b22ec6f15e9 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
-Date: Fri, 29 Jan 2021 02:33:06 +0000
+Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path

 Prevent absolute path from ending up in the egg-info SOURCES.txt.
@@ -8,15 +8,16 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
 Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/h5py/h5py/pull/1803">https://github.com/h5py/h5py/pull/1803</a>]

 Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  setup_build.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/setup_build.py b/setup_build.py
-index ffd3bef..fb196c0 100644
+index 3c7c7adb..d824bdda 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -20,7 +20,7 @@ import api_gen
+@@ -21,7 +21,7 @@ from setup_configure import BuildConfig


  def localpath(*args):
@@ -24,7 +25,7 @@ index ffd3bef..fb196c0 100644
 +    return op.join(*args)


- MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
+ MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
 --
-2.29.2
+2.17.1

diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
index b812b323f..03ae4c9db 100644
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

--------------B6A9C260050F10C6FF4D74FF--
