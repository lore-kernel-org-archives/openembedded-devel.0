Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.50])
 by mx.groups.io with SMTP id smtpd.web11.7346.1613480598936212101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 05:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EdmvSRaH;
 spf=pass (domain: windriver.com, ip: 40.107.92.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCRbh9nEL1QaZO59DO46A7aMKVA0/69Yuev/VyVKmLbsqDh669jwMRS6oryK3fPcI1x7PKqGNGxEo5i56/gDBVovjejo2DxbyZhP+oKb5SngqmQ2Nlcweedcd9hQTYmyYh/q8pk72QWqFMFBDRy/WcpsznZyPCIcpdgSGl/l3y1+uF7IPRiTvxLiE1ot9ZxuIecOHgZFaAZKPw0bNc0tZmYmMc9e+QYfA9gb3bnVRQ0ZAifQwfzpHrRtjjmJJ5yu1NZvvpEMRFbV8MxLKhQ7kPreVYkboSkiwUFNYkIG+lrtH7vgIj1Lcg4huu6DmTtXQbvl+wMu20DBGwPWp2x1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gldWrFdjXkHSYQaPrURvcKCZDT51o2lgctrHrGvSCY=;
 b=QpUo6+5VHSuHoz5LZpBK/E3SOUzwpXKvAYr7zqhtzJIyJ8mWgU038RfDWnYyLjwZU8E6sHNFsI1aLCJ6R1BdVbAmVC5Ahzja8+tyWwCbvzNzSrXlCWcGWoZwyEzh00pQCo3nJbNAByg2Hthla/ZQkSho8VY3cbR5A0NWnmhf8NNw9MM//g0S3qB8SHQcKJs92W+n0HoWevS4DQASjU0di1aP+mEDjaoK5xT1uIuu5zkYIUDwdZGTMRnue75jVVYI/3etcVcC3LHXlwCq72fdTgVmA816WkQi68ayCVILewmNd64gDyL1CBwc2f1uN+lDhgcfSI8UjQlKtuw6HsT3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gldWrFdjXkHSYQaPrURvcKCZDT51o2lgctrHrGvSCY=;
 b=EdmvSRaHJenrMFXRGKpYiOU8dzw4l82UwgfwIc5p0cv7S7G0BPkbtPR4iKiWOP6wzmjBDDyBDNfQbbJAy7WdVhCN+RCQuhAVf5XFJpux112w+/ETtQ2t5hIw/IPuyTdHfYjLKkQ6KMqVqPHgOrUp7ZmWZKEbc1tgSoZyJnGmqaY=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.39; Tue, 16 Feb
 2021 13:03:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 13:03:16 +0000
Subject: Re: [meta-python][PATCH v2] pydbus_manager: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
CC: openembedded-devel@lists.openembedded.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210211094029.8113-1-brgl@bgdev.pl>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <38d79510-025f-38fc-a221-61956df5e9fd@windriver.com>
Date: Tue, 16 Feb 2021 08:03:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211094029.8113-1-brgl@bgdev.pl>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0005.prod.exchangelabs.com
 (2603:10b6:207:18::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0005.prod.exchangelabs.com (2603:10b6:207:18::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Tue, 16 Feb 2021 13:03:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21a72053-d462-4d09-fdd3-08d8d27b39dd
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260FE56158835E837580F1C9F879@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DOwrnnX32vhhGuBvVYF4xATkEofRzVl/c1JI+y122IFgRwtUZV1v7MP56NIWmkvEk61u2k8tWX7KMqEFP1p2jVrxoOA62HNWFly52DgfFWe1X5W466nzmnZyc5JTYdvVByqA+QbNwgxQ6/dmfp/zpwgirDOvtSNcivJQaJptodv/wOCCqM5G7B3e8JPohftRwdqL8gUlOdIwWZ8gWi9Xjtdx5zxPE595L8L0/M3I74WGtmpwEiv7m5oZfTGsCeYjMLABqSL9KVkypwIr1+sJzWA/0plzulyQjNbuVSQV9bdkuEZ6mee7gcKuUHDYpHNElGEA1Jb1EpCCqJdYRrg8gr9d4sGo+qHLUR2nmBGCXxcEILaQHB+rzDeqF6NP8Dj+9WaPm7iqDFdxwcaiWz0IfmxBnT4t5OCVlYkQgB49tGYb1Fj2rp3Bnit5CsYnv5FGnzLzmggct9nOox3+rjdzOTrprSoV10Y/P4ovbkd/hyG6JqRPHM8nti4k3xXLf7dJ91WwJLr4GIn9Rc25+xK8XdvBTYQw0GO3ToApxy6LfrA4Ne3czHKzFnGZABCiZGfl1l5A294JuCfDI6eoHcpQ0A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39850400004)(53546011)(16526019)(186003)(2616005)(66946007)(956004)(36756003)(4326008)(5660300002)(66556008)(86362001)(8676002)(2906002)(110136005)(52116002)(316002)(26005)(6486002)(66476007)(66574015)(16576012)(8936002)(31686004)(44832011)(478600001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?95vCJM3c9pn4tG56pOTQMG2MmmpX018uI2atkuMjCL9WZdv4aoGOag2CXhly?=
 =?us-ascii?Q?2G7gV1q5LhuC8IiS3Bo2q0fDNuUqypbs7D+w/D00lQZWNk3P3cjY/2Kh0hxK?=
 =?us-ascii?Q?U0B6uOKq4rxRw8eU0NpYTFiPlLwEreyArXxz6nb/A+g1pCplMDhoGFsnxsJs?=
 =?us-ascii?Q?mJbmwbwb6UotfkgS1GzYnaz/fjGpsb9K+GI8esbzaKmBaVBfRehJAK779TJn?=
 =?us-ascii?Q?lC7LfyBtsZPdo8AESPcWitSsy3H+6/qF64Pg4iOI9nDrVvy5OaLIexwKNyzQ?=
 =?us-ascii?Q?Iye/e4GdPJ3ZVJ2nrbOv3XEFEpoJcDRux9jaA3cMPhN27rstApLe/a4aa0/l?=
 =?us-ascii?Q?WYkpNICr7chLt0I/uLxKA1JrdTjW+mwvsKFUsWC+0lqHmP3wb1UDdzK1MBc+?=
 =?us-ascii?Q?zhnQzOVjQTZWvWxxvMpJpbzEdv0rfd3tzriSu6fOWb/P+Ba7o+SBNRYGNwJ6?=
 =?us-ascii?Q?gXFtqp7Cvu5gdJHWGG1PYo5BIO2bvU4CPbzngRTcIVE4MyildAlKFBoL5KrL?=
 =?us-ascii?Q?H/FK0s2mm9tRV4hQ3c5Q7w25ohjw1Wwn3LuoBz2pBUVAXWN83shrv5/11QKB?=
 =?us-ascii?Q?l/2rBmwoCHtKTadifUijnmko76/WE4/5QOiUgpohsbG36qQvyHMe1OfEgcy0?=
 =?us-ascii?Q?VSxygB551BoWsrFbxuhX51X2wvFnnaUYPvjLFS3EMg0XotkfRIr3GdLc391N?=
 =?us-ascii?Q?k1+KynDOybfnEjTLoCBVvyV+e+DK0DMkyEi5CLf5OAzdWsIU+RaeUYDnr74j?=
 =?us-ascii?Q?zK4h3sSqL/0xzhrJi+AqNXYSE4rBvu/6jIKG0s285gmg37CBRjrO6w1btNa9?=
 =?us-ascii?Q?04x9AS4bb5u0SNXzeekDjL10LC0rxNN10kUpPFo36GIo0qMPQPZq0RwBjZ71?=
 =?us-ascii?Q?n8Ul7mbdIiHQn+bz3b8ZicA540Fz20Nyx77yCOwpfeMKd1umsNW3T3Lv1w7U?=
 =?us-ascii?Q?ifWrwxsa32RYZcXDjeWcq7Wkq1O89lT1MH9Z/F+3hWOB2GaKp3l9sYo+VkN6?=
 =?us-ascii?Q?seCAS+IJ1qR0gRVNOMF8rSRdoR/P/yA5cmey89FMx45ogMCCLeDjY5V9j0ts?=
 =?us-ascii?Q?lmz0kNxFhRfRnwHVomX91fZgPcSiBX7ia7z8PRF2hxm4AkCt24Eeh5Ob7WQc?=
 =?us-ascii?Q?QSHHqXIaNp0yXeaQZyDyYG8dorUz9x4tls5Je8FUnEXi6ImTahGDFqDTymYk?=
 =?us-ascii?Q?qdRsiqtlFFLVc0PikZf+zpqwxRWrxQ9EH0KfcPPARm0KrGjkvi767OU0Rzn8?=
 =?us-ascii?Q?HZ8tImDtw4bWVVwURA3IFC97QZfChOILppsx7RIsQIjI7xqu5OgtIF6jyWiV?=
 =?us-ascii?Q?SexeoU82FNR0ecaAFxw46etHxgvALZJuzUDX1bkeqQ/7NA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a72053-d462-4d09-fdd3-08d8d27b39dd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 13:03:16.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW0l+Jr47Kj+08IMWt9wKpJZbPOOxX6TjMOlvdSiT0NHtYT5kt6jNhLb4qVt977cyhCkbTBSeJ/2i0lpTVJ7dLq7L3SldCtK8nSsv9u2Jx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-02-11 4:40 a.m., Bartosz Golaszewski wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> pydbus is a popular (and probably the most 'pythonic') implementation
> of DBus for python but unfortunately it doesn't implement the
> ObjectManager interface. This project is an extension providing this
> functionality.
>
> The reason for having this as a separate project is simple: pydbus seems
> to no longer be actively maintained so it's hard to make it part of the
> original codebase.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - add pydbus-manager to packagegroup-meta-python3
>
>   .../packagegroups/packagegroup-meta-python.bb       |  1 +
>   .../python/python3-pydbus-manager_git.bb            | 13 +++++++++++++
>   2 files changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pydbus-m=
anager_git.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 8b267c9cb..e31b0b8b4 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -288,6 +288,7 @@ RDEPENDS_packagegroup-meta-python3 =3D "\
>       python3-pycrypto \
>       python3-pycurl \
>       python3-pydbus \
> +    python3-pydbus-manager \
>       python3-pydicti \
>       python3-pyephem \
>       python3-pyexpect \
> diff --git a/meta-python/recipes-devtools/python/python3-pydbus-manager_g=
it.bb b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
> new file mode 100644
> index 000000000..ae9e42160
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "DBus.ObjectManager implementation for pydbus"
> +AUTHOR =3D "S=C3=A9bastien Corne"
> +
> +LICENSE =3D "WTFPL"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fd5bb1dae91ba145745db55870be=
6a7"
> +
> +inherit setuptools3
> +
> +SRC_URI =3D "git://github.com/seebz/pydbus-manager.git"
> +SRCREV =3D "6b576b969cbda50521dca62a7df929167207f9fc"
> +PV =3D "git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> --
> 2.29.1
>
