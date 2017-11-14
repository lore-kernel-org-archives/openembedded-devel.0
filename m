Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 84594 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Nov 2017 18:57:30 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0040.outbound.protection.outlook.com [104.47.33.40])
	by mail.openembedded.org (Postfix) with ESMTP id F013D784FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Nov 2017 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UTTCpy5k7CKRkN8ETVcG74Tg8iO6y9WiKKJhz9ihAKw=;
	b=TWSocUEdX+z29g8gaTek2vxKKXSxomKRfKI618hEmlJ/EBa7gYkAQ2QKRLLgURRqCggE0FlOKkhHJ0tCGZq58OO5L19HtI73suEZ6kX9/vUc0aoDkctSCf7xsnHlHTnmgLB13BAqSJ6LkDi8OgGxGsMyjkSofMq2Tm+uWtRk1qc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.200.14.252] (4.14.243.50) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Tue, 14 Nov 2017 18:23:48 +0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20171113192711.12926-1-mkelly@xevo.com>
	<ed834096-8445-261d-3989-d97746c53ddc@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a07f0309-e598-0188-58a6-8592fdf036a0@xevo.com>
Date: Tue, 14 Nov 2017 10:23:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <ed834096-8445-261d-3989-d97746c53ddc@linux.intel.com>
X-Originating-IP: [4.14.243.50]
X-ClientProxiedBy: SN4PR0501CA0051.namprd05.prod.outlook.com (10.167.112.156)
	To MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5c31449-e909-4117-b903-08d52b8cd95d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:YF6mYQmUMkPADxPz/l5k9Jz6Pb6uj7Z2Vmu/Re8BRT2eA2yL3xV0KoD5iBy2iYIlsSSiMnrORNAxrTK91GNn7+cJyVO/C5LWY9A1n6/J+RVCQGWG/PeotakASsUzFXgIuHbwP3mol91+fiOsRgG23ZnuUxuH1m1c1hN5anZbbsL+tHDBm+oYBXmZ6I1oJ2MXs5zMcIJNUs0YdCHgpabPcum0TMurAfUxi8jQAp7rWETlLNotB5v8A1/CUmfkbgMI;
	25:pxSiGnlqTfRuKcjNp81hdoEUcH/G3l529FISSrF+RId8hML+9c/Rtq36jYHShxvkhvuT6rKy9upsKpGzV6xOrtTRAbv6yGm/T+DRvNGWjxhde1NkcSIKnaxQMjSthY1iCzck3M0GVl+378ZNJEhzbSGhv34JfIW6xCgBUhYvwL1JZD+AJ8PCya9cg4WUmV3GX46ny/jszw0oQsgrLMCQKvbH9iYOZOUiiVcEkCF2nA4h6cpulZAnhWdd+tatrZ2ErYZxDn9I8R4SRx0lfpPCzBTkBK1uiUcntjrlZwqRDhyVMVRd89UAa6YbiaQOpadLOxX8CoVMVsDRQeYSI5yczA==;
	31:eAUPEEA4DfWifEIvCAyLFmoXYtow3W1oooXKo0M6ppJhpfn9rbCVF6ub95iJ6ejjXG6hu/j0NhPoevBkI1HUVzrK02AcCDCaUU6zdupOQGCRBxj82CoXNt/vsalIHTr5k4Pl+o9GOkfc/Kb5wzb4KamEsCGbbAowqN/k4aRIUFFtv7thOk5IG84vbLF+Sj/7eSrCqjRppu3vSQaPKbTkiKTeMhvN2oFUe3yKDbp/wdk=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	20:qTkuoWkHtaZ3o7obPc+YTzYHkzuQ2q36/sb0KvIswJPDOQEYvmNJrYNDQas53VX/bxIl8k5/+ZzBHNH+kKXyw3/j8KjgNdVOhEWOVDuBFbxLTzXTAvoLPVmORDW6oOvJT9DCwqqzWXdx/EZ5cm8O3qmSmhzsFNah4BNHm9/17hO1RGLqHRT2QesDswcdyo5B1bKYhkjvhP8N1fR+HOffA3mTLl8Ke14ZZYXfhCNBMFwI5ERE0l+FTwYwyPn9f3pRqrfp78iZ0k94iqW7t+UMgCJZonI37TzY8SqCJTDgRDoyICM59UHHv4vDvNRMSG7Dud7yKm38rXDjKvnT9sA5zWTPjGyWGXY9+aDjvGJPF4nDRZfKI42SI7pMZEMokjL/4z1ugvPIlBMo4nNJ7Aw18O5M4obYiEEPYafb5yMATFM=;
	4:cTADrR7GMc06elr0WN+gCVAkT+cl1hzW+sVheue3G4D5+63LoBvCsMd2631Kzv0A+I8ZrRE7zdjzSGbCe7iKRSRgLQvYyHIoELUX+8wVmWufVAUG/U9vDlxMZG8rICZ7be88wdaQsdS+QBHzDPMkjyCEDLNkys/XZUobww/ZAonqQCMAydGWwaJxW13wxISWd3Gc0e0U5f8hz2zAneaP0y4A5TjHx50fxNk+O6Pets1/IxSxTA0dQBsNZQZswOhd1m+7f6DVOrbHaVrtDgXmMg==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29421EA3C5AA71FE21097C37AB280@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(10201501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123562025)(20161123560025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2942; 
X-Forefront-PRVS: 04916EA04C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(39830400002)(376002)(346002)(24454002)(199003)(189002)(43544003)(68736007)(105586002)(8936002)(966005)(6116002)(316002)(5660300001)(25786009)(101416001)(106356001)(478600001)(50986999)(6666003)(189998001)(54356999)(97736004)(76176999)(77096006)(230700001)(33646002)(90366009)(65826007)(6486002)(3846002)(16526018)(16576012)(58126008)(53546010)(36756003)(2950100002)(7736002)(64126003)(31696002)(31686004)(305945005)(229853002)(2906002)(86362001)(8676002)(23676003)(81166006)(83506002)(81156014)(67846002)(66066001)(6306002)(6246003)(65806001)(50466002)(65956001)(53936002)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942;
	H:[10.200.14.252]; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDI7MjM6S0NhZVBhMm9BNU1EZEVCd2NTT2x4WUxt?=
	=?utf-8?B?RUdGSFVlR1JndDVVUlZ4eHkvNGJTZjBSNVJpL0Z5ZHlsL2dzUkdVbmdUVjI5?=
	=?utf-8?B?SFZiZk5JUi9pV0VWN0lRdHZLRDRNS01aRUdqODdxdGVVa3pQeGx3NUhYOGtQ?=
	=?utf-8?B?b1BsV1RSc3QyRnI4TXNxNFQvTlZ2bXZoUUkwb3JxOG5sdkY3bkw1ZWZRK1Ri?=
	=?utf-8?B?WStWZUc3cXc0TWZjNTNmcWJhbDFZd21WMjBxRkdLSWZCK0JGcmZSSDZEeTJq?=
	=?utf-8?B?RVNHQ1N1SE9PbWg5Qm5Hb2J6Rm5UYkhrZ3RNTnc2NWlLZzl6aldxa3ZkaVV5?=
	=?utf-8?B?RFNBMlI0aERkdzNockh2Sk03eWFRVzFaN1VqcWwyb2cvYTlXcWRUbTJ4NWpJ?=
	=?utf-8?B?TjhJUEtueHNsT1dJeVA2THFiNlR2THhSekc1OFoySHJ6bEdEWEhMZUYrRXkx?=
	=?utf-8?B?QXJpZnVDR2VxdmJWNUhYVUVGNjZNcTlQSG1xK1NEaDd1RWp1NmpOTlYwSWVT?=
	=?utf-8?B?Zkw0S3E5c2ZrY2p2a1JUa0E2d3FhY2duRTc4WDh1Tlp5UTUwV1dubFJSRDBE?=
	=?utf-8?B?WURmSFRMWUVOM1pIdlVFcDgyd0FlK1dZU0QrbmJDWDlMdHh6ZDIwMGZHTjBr?=
	=?utf-8?B?a2tadDhRdnBVWlU1Q2Q0Sm1OV0ZFalRpNlY3WDJLZ0dncFJRTGZjWlRYbE1l?=
	=?utf-8?B?S0poaFpkSEIxTWFQMVpvTDcyN2JoM0ErRXk2dUVyeXdsUkIyMkNwcnhZS1pk?=
	=?utf-8?B?NFA3bHVuUWRoUTdQa3FoSmUrL0g5YnhncWNEdUFjcllQZ3k1Y0EvMnFlQ2xp?=
	=?utf-8?B?SzVOOGNJbDRXK3RZdGs5NXJ5WEttWnFtZ2VHVVRZSmFlV2hqQmhoWFNITmtl?=
	=?utf-8?B?cWY0WXg4b1gyREZXKzBoUDF3QWlrTy92UC8zTjJmdzZDWk5iWVBzT3VjNFRw?=
	=?utf-8?B?Z3Q1RHlEU0wzY3BPZjNyMXlkVkhJRUR4N3FhbHF5RG9qL3NuVjdzWVNEb1RI?=
	=?utf-8?B?a1pwYWZlRVEvNEpKSUpLOXF4RzNoWXZlckhaYldYRGJzclBlaS90RzZnQTNu?=
	=?utf-8?B?REhHODZ0cEdrdXlwV3JKVGtXaGQ4MGF3MVJFRGdnMVExL1MzZ0oyUG1hZ2Zt?=
	=?utf-8?B?VEdDN2FMNWVMUXYrZnJlVDU2UnFUajQyeHNXOWRobUV1NkE2UWgvTnlIK2dJ?=
	=?utf-8?B?MHFkLytpVm1NZ08ydGJLZGJYb0FiUnFHVVVDMHFMMGdUaUpnWGpvZ043RDVI?=
	=?utf-8?B?Y3pLZFdkRFJRT2FVZUVOd2tVQVhNM0p4eUhNV2pReTRXc21oTzlKZVIrSlRG?=
	=?utf-8?B?cTJmVnEyelRsNGZVZ2gwODZYY2NLZ3VEYVRzY0prUloxWG9kRmFrcm15NHlT?=
	=?utf-8?B?MllxTHVuejNVQktObWNKY3pjc2xFam8xdTZGUUtKaVVEZmVuWmE1Yi9jMHRm?=
	=?utf-8?B?RHBDL1NpRFFKS3RhYitFUEVxdENTQXNKN0gzVlp1RVhUZ2ZlL0g0dmZrY0c5?=
	=?utf-8?B?anNqOXVLOVgwU2FITFJGZjFQL0YrTWc4bHduQzlYZkpoby84VWJWUjJLaWYr?=
	=?utf-8?B?M3l4KzJIOStIcm5vRWJBVDlHcHFJQXJkbFhkckJNYmNseTJ3ZEwxMzRUNzA2?=
	=?utf-8?B?TjdkTHNtZndWcFpNeDB2NVU2eEtNSlJNNjN4ME4wb1ZRSUExRUZUVFU2SDRt?=
	=?utf-8?B?WnZMNU5VZFdXRmI0ajNZQmNQcFJUdzRzMm10Z1ZTcVFYRGFPVktSM21nVjVl?=
	=?utf-8?B?RHlWVnZTKzJHQ0lrdnlFRXd3bVQ5UmVyNmh2QkVWMytZYUxzQmkyTllFbHVn?=
	=?utf-8?B?Vi9EbWtPZnNMWW5CVHl1UTNlVmY2eVAxTUNROVRDZFl5WWVCN2FiTlBrT1ZM?=
	=?utf-8?Q?5BXNGfJqmzFgCEEG+fSPKC9OKX8ws6XAea?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	6:ugCLENRy2Lv/Hs8sg77GMDm/Z5u74ZF//f9Mi9WbHxjlt+SZ+GZ1QyLxS1pCSYaJfm/B/xGyzTb+aXYX4URVRXpWfWyAgoCLgpkJHoF0yHt2h3RgkqGsGvJDm1CNeNMqgXjazzWYc8AppRpapMBAvU/4XEeUwXefwyLsEeH02vv98cE3cq4BjIYWOpdcHThn/H/8zm/melcs8BsdRaTc7zlUpFHI4rqRU+6d88UgXpOQ2bJGdSr3mnWchzGaaBrgQi65e47zUHcc7Gm7UW8tqDLA28DLEXM/ds22ucrVIiCLvEr8huLDtq7oCGbMDdg2rkN7AmITIgvskQkjpViKMF+O026Pzp4y/EiAmPRPNIY=;
	5:c+e3mWiKxO6jVxqoKl4m9wwtsG5l9qnErnPAna8S7oWq0gKfpw0mZ6zadPar45DarDYN2LEvJpBH086JBOSmo7f/lHDBmblZq04ESh7x6alXMdwYwGOO4z4XKiS00pA68aa2HCVwXWufl5vbHmV4QIdARU8Yxd5muZTfRciV95Q=;
	24:Ede8EONhoX1kUcC1KnWsqTQCXbPPHpUBZ7fqeMgZR5pkLclkZ3MQoWDSld9GUVELnx4gGOq9EzRSpe2Kqadvdnobnxjfw5rB4hslV0qjXfw=;
	7:GqiS2+DyoEdaLG70duupgIzJkDSo6s78STfoB3hpRJiTNSIMJzVWYw9ZJg/+NZcj95O7qUC+3tGqcshq+Rf2FemW8P+eyzwrhvQfVWQcDC2ZGfsF824iv8uYzeklkXbSty61IV4nXtU3x8n6qgRXKvcnNCGiTahraKFThlaFEJcw62Ccl8EMVQwzWvfYm12qu/aQy2LcoDBzd8Bw9dpxOWCRZMbj4iUAWfqAjj7T96IWHUMqhd16M32xNRGWbfgU
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2017 18:23:48.1100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c31449-e909-4117-b903-08d52b8cd95d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Subject: Re: [meta-oe][PATCH] meson: export native env only for native build
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
X-List-Received-Date: Tue, 14 Nov 2017 18:57:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/2017 04:36 AM, Alexander Kanavin wrote:
> On 11/13/2017 09:27 PM, Martin Kelly wrote:
>> Although the meson crossfile should take care of setting the right cross
>> environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
>> LDFLAGS, and CPPFLAGS from the environment and injects them into the
>> build (see mesonbuild/environment.py:get_args_from_envvars for details).
>>
>> This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
>> CPPFLAGS in the target build, which is wrong and causes build failures
>> when target and native have libraries in common (the linker gets
>> confused and bails).
>>
>> That said, we *do* need to set certain vars for all builds so that meson
>> can find the right build tools. Without this, meson will fail during its
>> sanity checking step because it will determine the build tools to be
>> unrunnable since they output target instead of native artifacts.
>>
>> The solution to all of this is to set CC, CXX, LD, and AR globally to
>> the native tools while setting the other native vars *only* for the
>> native build. For target builds, these vars will get overridden by the
>> cross file as we expect.
> 
> Hello Martin,
> 
> meson support will land in oe-core shortly (and will be removed from 
> meta-oe), so can you please check if my patchset is doing the right thing?
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/meson 
> 
> 
> Alex

Hi, excellent, I'm glad this is going to oe-core. I tried the 
meson.bbclass from your branch and it fails one of my builds because the 
CC variable is not found since it's unset.

It looks like the meson.bbclass in poky-contrib was forked at some point 
and some of the patches since have not been merged back in. I think some 
of them have needed fixes (e.g. the patch for PKG_CONFIG=pkg-config-native).

I believe the right configuration is:

For native builds:
- Keep the defaults (which use native tools), but export 
PKG_CONFIG=pkg-config-native instead of pkg-config.

For target builds:
- Set CC, CXX, LD, and AR, but *not* CFLAGS, CXXFLAGS, LDFLAGS etc. We 
need CC, CXX etc. so meson finds the native tools for its build sanity 
tests, but we don't want to set the flags, as meson will slurp them in 
and apply them to the cross build. Note that even though we set CC, etc. 
meson will correctly override them in the cross file for the actual 
target build.

By the way, I simplified my patch a little bit and made it slightly more 
correct, so I sent a patch v2 for this. I CC'ed you on that patch.

