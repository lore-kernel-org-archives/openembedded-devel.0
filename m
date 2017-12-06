Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0077.outbound.protection.outlook.com [104.47.34.77])
	by mail.openembedded.org (Postfix) with ESMTP id D38A171985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Tc2EQfsMj6e+4t92Wig2Hmy61bfDaEkxI+PPHWLyM0Q=;
	b=gjSGUCq41VWnPqN27pPA35HDHSb5G+woRjmkG14Y3QGK171LgI5kvVYxAbMMPpEiZUZ3+pJiD+11ysGPK2cacTVoW8/sZT6a2H4e+P8yTXFSEvGk1vWENZaWKsaighEu+kasTG4JvymRpCPfljiEdch92S2b9JNocOMxG5ZNdG8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.282.5; Wed, 6 Dec 2017 17:15:44 +0000
To: openembedded-devel@lists.openembedded.org
References: <20171114182252.28244-1-mkelly@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <818c21a6-29e4-f864-454e-22e828f8e3ad@xevo.com>
Date: Wed, 6 Dec 2017 09:15:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171114182252.28244-1-mkelly@xevo.com>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CO2PR05CA0096.namprd05.prod.outlook.com (10.165.92.22) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15f5c59-da18-4ef5-376c-08d53cccfc6d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603286);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:6q8ZgVJMkhPcwKeo7Ybk4GUdKGEKuERSW6MmxgJv8ue1HEaa69+g5m8XdZDz/KAmCHWPdk+GgbS8vSc6cx+YgE10O7/24T4gzBrawTzO69Q4JWTfrx9yTpmDc1cpTR5vMGMzT1hXWV+KpfuSWMjfLa5zwb6O59sNWInDGAdgXKTs3bj3EWVnqtC4uDWEEUepz4lfJe58E+1mF2a1n1bqcLJbzR05QcYStZJRkAxBnRQf9C+6Mzc97rVFFJDj7Kwf;
	25:5IGcjycKXZ/F9LaReWSYj+3nil8rk4tRbwmZ6CUfhg7ZI/S+ZMwRqLO42vJVSEY/ZBs6YH19xFmy+NJY0+gmPHwjb6n4mZhahSLzevPVlAT18H4tiQAzOtDaewBh4Bq32eqUVzatCxJA8NKhlMcjfU+3r1lfPv3iHwalosD8vdIOl62ICpLKVaTsUjCYbgz43jEDHZZGuCXIZw6CN3YuxW0a9uLI8Cf1KL688hysCE4K1Cb0yb7dc2XeavTdZPmG0rdTCP4u0UX2J8PZSO2iFYf4ezpruCjxmVkzISivxJp6Lpr4cdkstuqsJyN/wendwhz/uaI1QWsQZVWppW9PmA==;
	31:gUIwe0QGLGSURhtBUXqREZDeRBuDGlE807GjeihMBN/KdkjW71KQ0hvhRmyq3un6SaodhxdEqSpuwXLhIaip6ygY+1Ps5sih8ywjJ3jg1daHL43XDlNKYUgfIb8Ckj688TNZF1Xfhji6hPr9cz42fRhEOlMJ9S1lrWS8IxLk8TnwhKZ9gpdxFkoDUSCkYNaOCd7uNUgBlVR77CE+L3ObeU6XSu5qkCMww/7p2372780=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	20:0/iS99ax6sa+n82MINgtFjjyHXcQN3oDgVKsil3ixQqlqDiDSLQLkSw0rYzfV7Kdt49X6AxnG8q024pOPz3UXEQQWyLYYn1O3vp44pH815ezldS+8IljEuAPFistRYMQ9HRbTO+dcvzMdQkROgZm8mX2hw05eD8YLK72F6bHRnd+CLMlfONI2Nyxn97jffk68lLEzTDOdWnkVLVk4V911TgBkNtGrTSh/4RqVyehF46qpQZcgz1axSw2QGJn7FtE6LCZXl4VkdazridZqUUOtB/61uildtcikETakq9tDgMA8ku4QjP5Bv8gzYDutG8rnctPd2WRksY6fRxQAHApPpNj5iLWXiYcr3DKN3jb1cBZ5xFxZPrgAr5sjuMbzVLdcJuRO2sihHIoaUoGdTTcOEOjzmZUmFMqO58OYGiKoWg=;
	4:qhd1vazV7uzFzuF0Bx16Tjx5NeVcEoLQgGXin1LxAcgQpjGoJr/UjKYOsvkc8JI1kV5xyhL16rmU/ikk0s0Z/L8xUV6llZ7lesAvxALzSzf0BCLsSfOhjzEuIIP3htfKuOkiu5bv0MQ3xufs8v8uxBkXbQkR/0+cw5DAFv+JbCQlVpBlx/AJkZ1x+iY7GyB6cEfJczQ9ZxwznTY68g6IKtJ1Odlgw9oKYkx194mCQpqDbMylFZ2Q/6ws8s6FJpM9c1Ub4i6/dhM2hg8SjkIVhja5+qtzhVkG18ymPen/lyf8HnmldEUHZjsMU18pQ4jW
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2932DD47FBC0C640E307C640AB320@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3002001)(3231022)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR0101MB2932; 
X-Forefront-PRVS: 05134F8B4F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(39830400002)(346002)(366004)(53754006)(55674003)(43544003)(24454002)(199004)(189003)(6916009)(65806001)(6666003)(101416001)(97736004)(31686004)(47776003)(81156014)(8676002)(2950100002)(81166006)(65826007)(5660300001)(36756003)(106356001)(33646002)(7736002)(105586002)(2351001)(305945005)(31696002)(67846002)(3846002)(6116002)(2361001)(8936002)(86362001)(52146003)(64126003)(77096006)(90366009)(53546010)(4326008)(54906003)(25786009)(6486002)(117156002)(58126008)(50466002)(16576012)(52116002)(76176011)(229853002)(83506002)(478600001)(68736007)(23676004)(2486003)(2906002)(316002)(230700001)(16526018)(53936002)(65956001)(66066001)(6246003)(11771545001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzI7MjM6ZlNodTlLVFJHNnVmVzlScTRpY2JtVVpk?=
	=?utf-8?B?bWx6dzlDamdQQkhqbDQvNWpEYnNqQWVscXJmN0taYzlpVmRUenQ1U3BCSkNX?=
	=?utf-8?B?bTF6bmRpa0xRTjFGVTBHSVEvZGtzdU9ncDR2UTF2SE0xeEFOSUhtYzRHV21u?=
	=?utf-8?B?OEk5eWh4aDhja2FLNHRFR0hzY0EwOEhuL1VJQ0tpL1ZXa1gwN0JRVklINUxT?=
	=?utf-8?B?WjNuY09hTUxubUJuR0Vpb1hsUy9odm1PUXZ4MzlGckIzZzE4OVp1N3pqZTh1?=
	=?utf-8?B?SGZwY2xJSjliSGh5ckRqWm9EZW9WMXBycEprTlVPeDIyaSsrQUVlTzdaOFFw?=
	=?utf-8?B?d2RFY01LeEZUUHFkaDY2eEdUTVpkd2dCTVI0cnBtUGxhZjBKVXdrRkZWQ1Nr?=
	=?utf-8?B?Z3h5ZTFnWUtpdXViQnUyVmJFNFVuL2FXeHI2anIwLzBWeThjNThnaGJJVCtt?=
	=?utf-8?B?Y2YzUTFMeG1vUzl3Z2tUZE9FNXY2MVJ2Z1VHNG1lRmlQOVQ5TXNBa1c0SEJl?=
	=?utf-8?B?WEtxS1FvWVgrTm9vQ2NhbjRlYkx4eTNFOHptZzlOZ2svdmUxck1ucmI4VXdZ?=
	=?utf-8?B?cHo3TjQ3U1o2Ynp4MWE1Ny9rMDhMU0kxYVZQWmQrQzhFUnFia1R4T3hkTXNj?=
	=?utf-8?B?YW1Yc3E5QkZNUVJuMVNURkRFYkloT3VIcUVIOCtvTnJNL2ltOEJtaCtsU3gw?=
	=?utf-8?B?RmtpSUtZMkFENEQwU2ppQUQ5ZUlFbkJ0NGVFWVBmekQ5OGdoQk9kcUlPS1Ir?=
	=?utf-8?B?eHFPUmNZd24xazhBaVViNzhOazhmWDNYdFFlODdobThMeTRDQXRjVXpQWXJx?=
	=?utf-8?B?TWRNZ2xlUStxMHJHM0RRVDFqZy93Nm9mZklkR1dPSTlJMGxEMkIvYi92UTRQ?=
	=?utf-8?B?L3VrdVBxMjFLaVBTNGJRVDl5N3BpYXIvQVJmWjZ5djN4dzBPNjZjNWN4SVYr?=
	=?utf-8?B?ZG9VTmtsRUNRbnJHbkpBdUZuUzZzTlZmVUV5V2U4RGwzVWNKcG82UUQyTjAv?=
	=?utf-8?B?ODl5TDNFMUt4d01qajFGSFRKTVNmeVFYbkEwNVZid2ZZdFFNY1JDVnMzcGV3?=
	=?utf-8?B?ZzNXN1hYNWk1VCtOdTB1UHF0S1JNTU9pYWxtay9US3cvdnRxT0JGa05ZZ1ZB?=
	=?utf-8?B?VFdYc0NSYndib0t1cmpIdEd4Z1ZsV2lIWi9HYXFKY0ZjdkExQnhFaHBBdWpH?=
	=?utf-8?B?cjcxWHhsNXZhZFhPOWUrYzBWc29jblVEenFVN1kyeWNxRm5OcnY4ZDNBNWVB?=
	=?utf-8?B?QVJDODNXVHJud2lWa284eFZxK1Iwd2dVb2cwd0JVQlFabnZSODRTSEhLTjBo?=
	=?utf-8?B?aTlFb0lFZGhUV2p1SUlKSTN2RzNsQndtQ3dBeE5DSW5sSVlGdnFqOWtibWpq?=
	=?utf-8?B?cnY2NloxMUNXc2tOSXVNb0Z0UklGKytTaXFYQWZkNlJIbVhDaUp0anA4eHl5?=
	=?utf-8?B?Wkx0bkNrbi8wUUhCSTVxVlFoZ1grbXR3S1hVbzUrd1kxd0FiYUxTWGJob3RR?=
	=?utf-8?B?c3N6UUJHdjBBNVFJV1BodmJEeUgzNmtOTnYvd3RGZVl4TGlxNnBSQkVvcDU1?=
	=?utf-8?B?ZEhNRGNneCtDMWdLbUJYRjZwemNkUVFBR3NsUXArV3RzRUN2emZzclorb1Ex?=
	=?utf-8?B?dGV2SithTEtFY2dqSi9wMHYrby91UXBVRkpGZThrd1FVU2RodnpLTXhBYmQv?=
	=?utf-8?B?ek5ZaW0wRTNTTkM3YjFxdVY4dVc1YTRrVU9yZ1pncmFZeVhZVTRSb1oxK3E1?=
	=?utf-8?B?blJmdTZ4dGduSVRqYzFEbVIzOUNCV2FUNHdhdmpSZ01uaXJ6LzJORjMzd2lC?=
	=?utf-8?B?TzROK25wamloUXpNbXV3KzNpL3RyRFpMTk5zU2lEQmRjMjFjT0I4ZWZIdlF0?=
	=?utf-8?B?T2orWUliQnp0Y2Nmc0RCcElzVHdjZnV4dThCSFhxTDdYZDA4QTNPR3FURVhJ?=
	=?utf-8?B?TnNScUVtSHcyWHRDQ09zUEdvc1ZkZyswNEFaNFBsbmUzd3dNeVlpaWdyNEp5?=
	=?utf-8?B?VFZyb2RnaURHRTFSNktkVERjNEpuS3l1WUdlQzdLYWpFNjlHVk96eG80RU9B?=
	=?utf-8?B?NmNKZjBjLzhxV0tzMDdsdGNJd0EyRzA2b2RHTUNaWGp6ejB2dDkwUnpLQXZs?=
	=?utf-8?B?YVI1UT09?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:fBpI1zO8xSmdGT/nw5Nr/nX5Y7P6y/i2bpuED4oqI9YcXe8ZpHYfWYlr4FrULszzmccYzTeiRHyFLAwp1kttlzZjrHebq/RfWM8uCYEl1XYrx8D9Eo09x/U5sxh00CGMN5SKQA3Lnxrfnfd5uTIb7ajAGBe4fLA0Znoe9fyVWnAlzQVXH66cVtJK+YQ791OY5J68UqbQWBRaPVh7da2S7Aic+qWouQ+Ew7CGh/UL1Q5rP7SCCSZp/boDA2Q3N4/8/ntSZnmG/bgu5w/+11C8fbJ5ejlHZo650pEWHY0ZVITrCy3IO8GKE7W1MvEIlkG8J4nQxLOl4oX4aonIf7016STPThOafPJOWYCIWUYLSsA=;
	5:sEUjnnDH9ebKvhRp3FEfSqscU2d/Cf16y1NNwr5NCXd6hPY4o2+KRzfiQucFYQ9iVOIGShtBylpY0LSup/VAq/CLaolijflp2dH/LvFutPlnESav3A0FLiAMIbo8GOr/XEzuY5OgrovV+8EoayQqxMFkyvsgQsILyUh2MNJc9Nw=;
	24:c51PHebGhCttunTkqlA+RHVxI+t1VenJeaoZFHEZqnpFvRpnCKrJOn7qMp0r/VrZyToekX9G1G8j+HuYdjfSNxkJAMppnMVKf2oaq4Xik+4=;
	7:N5ITvIXTw+J5J+ANG6jmL00C6ubtvWcdYpl7n3AhjG7RUeNHF6gKzvUfc4Ozt88KKwDsKUtqsazl+RoX/c8QYSGeiYaQuRb0ur+HpUubTZhqotgkAVCy0+rn4fIchFeN3H1nYiGlFDXGVkDhnD/6pfIn+yE5Fh3GVZgzPfFArKa42k0AqtEdWm3oPAhXG9gWiBy8Ow3olPAyqPrE55Do++THvJnwbaltLISWcvpf2j4KdgBeRC8RzXDzye/ZnXY1
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2017 17:15:44.4585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b15f5c59-da18-4ef5-376c-08d53cccfc6d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Subject: Re: [meta-oe][PATCH v2] meson: export native env only for native build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 17:15:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

Since meson has not yet transition to OE-core, could we consider this 
patch for meta-OE in the meantime? It is causing bugs in my build, so 
I'm hoping to drop my private patch backports.

On 11/14/2017 10:22 AM, Martin Kelly wrote:
> Although the meson crossfile should take care of setting the right cross
> environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
> LDFLAGS, and CPPFLAGS from the environment and injects them into the
> build (see mesonbuild/environment.py:get_args_from_envvars for details).
> 
> This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
> CPPFLAGS in the target build, which is wrong and causes build failures
> when target and native have libraries in common (the linker gets
> confused and bails).
> 
> That said, we *do* need to set certain vars for all builds so that meson
> can find the right build tools. Without this, meson will fail during its
> sanity checking step because it will determine the build tools to be
> unrunnable since they output target instead of native artifacts.
> 
> The solution to all of this is to set CC, CXX, LD, and AR globally to
> the native tools while setting the other native vars *only* for the
> native build. For target builds, these vars will get overridden by the
> cross file as we expect.
> 
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>   meta-oe/classes/meson.bbclass | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
> index a09bc240d..6e38b4bd5 100644
> --- a/meta-oe/classes/meson.bbclass
> +++ b/meta-oe/classes/meson.bbclass
> @@ -9,17 +9,6 @@ do_configure[cleandirs] = "${B}"
>   # Where the meson.build build configuration is
>   MESON_SOURCEPATH = "${S}"
>   
> -# These variables in the environment override the *native* tools, not the cross.
> -export CPPFLAGS = "${BUILD_CPPFLAGS}"
> -export CC = "${BUILD_CC}"
> -export CFLAGS = "${BUILD_CFLAGS}"
> -export CXX = "${BUILD_CXX}"
> -export CXXFLAGS = "${BUILD_CXXFLAGS}"
> -export LD = "${BUILD_LD}"
> -export LDFLAGS = "${BUILD_LDFLAGS}"
> -export AR = "${BUILD_AR}"
> -export PKG_CONFIG = "pkg-config-native"
> -
>   def noprefix(var, d):
>       return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
>   
> @@ -94,6 +83,22 @@ meson_do_configure() {
>       fi
>   }
>   
> +meson_do_configure_prepend_class-target() {
> +    # Set these so that meson uses the native tools for its build sanity tests,
> +    # which require executables to be runnable. The cross file will still
> +    # override these for the target build. Note that we do *not* set CFLAGS,
> +    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
> +    # target build, causing errors.
> +    export CC="${BUILD_CC}"
> +    export CXX="${BUILD_CXX}"
> +    export LD="${BUILD_LD}"
> +    export AR="${BUILD_AR}"
> +}
> +
> +meson_do_configure_prepend_class-native() {
> +    export PKG_CONFIG="pkg-config-native"
> +}
> +
>   do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
>   meson_do_compile() {
>       ninja ${PARALLEL_MAKE}
> 

