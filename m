Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0070.outbound.protection.outlook.com [104.47.34.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7D475783FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=O90WVH/5V2F/lz5JCi/oiOgDcyl3hhXAbWLMnAm5eQc=;
	b=LkqiTv6qrvTZwem5pP4OVY0Q0kJ9SVGc53j48K89xbewOAgvPe296CIvWhXXfSWoyrCCL33yUORRtUmc2TcWbDWsiicOOagxi3Oitsd6lCUXWKiDawbW4Fa9xk9K6SU/+1Pod7TMPJwT/vLkNxm24Irfu/U7rhHUIDALRb0USO8=
Authentication-Results: dominion.thruhere.net; dkim=none (message not signed)
	header.d=none; dominion.thruhere.net;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Thu, 15 Jun 2017 17:22:47 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<7c692d80-c09b-798b-6fbe-1edc78572080@xevo.com>
	<CA+chaQeAHdzfBAaDcx_LQyFpCs_utwiE0a9Sxk3FoDQR+ridHA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <d7a8fd47-379c-2c0f-24e7-ed710e80f523@xevo.com>
Date: Thu, 15 Jun 2017 10:22:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeAHdzfBAaDcx_LQyFpCs_utwiE0a9Sxk3FoDQR+ridHA@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: DM5PR1101CA0001.namprd11.prod.outlook.com (10.174.246.11)
	To BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2931:
X-MS-Office365-Filtering-Correlation-Id: 327eca5e-c5b9-4f12-7a22-08d4b413251c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	3:zsnVKp/02EqK7riZ6ekhcybpQP9jBwiDqVgwye+D7dyGwXe/KgfgG7UXo/eUVhp7bpQ1TlYhq0kcCOEMovDw1ewQbyf4ELywp8ueWntl2Zp/1p4IiiMo4POSE0JZsyIWmnNLZ+afdBBMHC3s3ABLt1UpxFpuW4NPRKjI/iAWnsGywvURG+Co/lQ00zv7bJGN/qMOb6dfK9u3n8Soqt/6R5h7i2Hpk9entC46kr6pW3Q5uL0DUvEhyf4stN/xBu59x4ku7vsNTFLqhkfGMbBx3XAZa97tiJgfU5DmP/QhexWlqhS9+JUextTooet0Ja8ufK1/BAgyu3ZLbUMghCamRg==;
	25:IDo/U4JgzIIl0xkhzao89I/Am6zLvrnkeQpzpT9U7yixRuThqBn3p9ZQKGeQcf3Fc/auU+rtJ1vMwMHRuIbQEU8FzufJFX8nhqz3x/OxqfMctkSZjV9p0Mm303ZcFivqe+gn/1uUCE2C5nWL/w66NTsKFoebvyNtNu1whctejMrZDxK2iy7KZMG0YmRKpBRPlO5AgRKmtnTU5Ml/kMwUca1sLR429WxCRgJ88i4Ae6/1LmdbL9FcKdhECNvE/cki5NMxW3TQjwcN50252in1HA1IcaqReIY6nQ1MDz6SpkWELa6AjVwZWGJadkC1OOTvRt1jkZSKWF6cO2+sV+Nfs7/FktoiOJs93yvKxtmie4orWSy+ssPppQ+XhK9Ez46y3InnhHEtFt/1Yxc6963GsRRKCV5GkoHZFMQMUnUhzwk4USN4LQ7RNtdCrGTaVXuKI+5nxbWzrxioj+ICvA6NKe9bbs1XMpPGKQCZ7mMd8Pg=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	31:cA9KCUcloJAuPamgRxHmFdwnv7B4p2QwilsgdZ1P6YWXAic0AFIe0GT9Dgat1yoxjDS9TH1qbArZCY9GYaMVqsrISVOc/ZuGzHCDWntG9mlH9HqiBJ4bh9cgBRRv+N9jklbdO/oINHOpukwAGOBPx2c3pTaZu56MvOxxDPqDilFxqib97doLGKq2MJsZ3cT8eL/E8pIYJwONHQAGEadoTHoETHYTarOVKUpAa2nMqhT490dKkGM5+Zk+2419qrFVImXYPZUtSU6w0467Bz8k5g==;
	20:tCuBIQ6preD52+VkLn8A0q4klnSbdAjRiy1AnSlUJygTL1hfTVWy0XEkIRJdGdkAksF9unynl7LULQ/k0vCx997kMO/dyZ2L9uR+9nj+e198JJJsA9SsK8Iy/hY6dUwBf64zBxIBIJOhb4wP4Dzf8zp+oOTRcUDY7qLNVLSOgFp/pgmOBi9QGco3dWeqWwOecYjRdzumaTbLuPCgAtKpDW6UFP0X/KQtcGFa3G64iMION2JLCJeUJV+8iiXO2R8PXap4TGy1aN8ZKwTuSvd46f854Idl5iYhMYC/5C18XcDJO7KVvCHKBHxOQ0njgmU7Tco3EgrbxgW3bKCUGij1aA==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB29318E40A9FB12432E329A91ABC00@BN6PR0101MB2931.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6041248)(20161123555025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2931; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7NDphNjh5c2FwTVlzMGw1RFJ2eG1WcWFwZ0JK?=
	=?utf-8?B?V24zM2hvZldGdFZwdi8yb1ZnbVJJeFVlRWxsNVpuS1QzZFNIa3VSeGY0b3R4?=
	=?utf-8?B?Nmo2VkMrQjZWczlESGdRQ1AxS0h0Y0xhV0hUd3VTUExTcE8rMzJqemU1YThC?=
	=?utf-8?B?MExETThwejZPeTZVVXFmZVU1WWZkNFBpYWdzNkF4MmFhdC9JOTRMdEVtSzAz?=
	=?utf-8?B?SmVVNEVIUnZRTXNvVVJVYzVQRnpmNDVyby9xNEpDQUxHL2NVb0FPZmNxOVQw?=
	=?utf-8?B?RTJaUi9GWGo0NEE2eXVSdEFMR0ExZWFqZVlid2ZtUk9iQUJGd3pkUnF0enVv?=
	=?utf-8?B?aWpmTlVTQzhQMUhNT05XRDh2WGZJYUNGdFF2N1J5YmpWQXVUNHYxOStoclRQ?=
	=?utf-8?B?S1VKUFBaVE1aTTlkMFNJcTljK0tlZXdxK2RKRXZpVjVET280UE5kZ3hFMmUv?=
	=?utf-8?B?eGNKQTg2MXVFQldZZkpCc0lTejFLMnYycjkzeEY0S0ptVmlzaDROcWVhY3JS?=
	=?utf-8?B?aHhlZGVyc0ZtSVd0bjg0eWR5MVJJclhDaWcvU1FNVEdIL294aEZHT1lVQmlo?=
	=?utf-8?B?QmN6bnl1VjcwTDRVYUw5Tm9tYVh0OG5TMWNEalk3ejg3d1E5cktqSk0zNzZK?=
	=?utf-8?B?Sy80UmJaVGFzT1lFUTVjNk9QazE5Nk5zV2x0dUFaUVZURmVHUFFzUHhDM2sy?=
	=?utf-8?B?MDMvbXJWSTVuWGpuQ21tanVyTHRDNUNKWHJld0NmSkprUlFnRTlvRk9MWjJ0?=
	=?utf-8?B?YmlmZmRFMWF2eUp2cG5LL0NOUGRRRlN3UmliQzk4aGQwWHdMVExIYnFKTzBq?=
	=?utf-8?B?OW5IOEFaOUlaaE84SjE0S2ZFVTZhTUgxYXNybUVoUzVtVlNOTXcxdWpGTGZs?=
	=?utf-8?B?WTh4d2tJc3ovbXE4WDRjVWd1WHV4ZjA1QjEwUGdhVjFLT2lzM3JuSW45MDRW?=
	=?utf-8?B?WDNVMDlvOGZIRU1YUUFSVTJidHpsUlRvOHlMajBhbnQ4SVRJenFQR1VmODRB?=
	=?utf-8?B?dDZrREJYSlowTkYyc2xURElYQStYVUZMNDFzcG0xS09lZnlDcjJ2bjNBMXpn?=
	=?utf-8?B?QzZnK3R6a0pQY25zSXhYcUl1SmNhSGVTaDFWZ3lDY01CSVZGVWJXbnlzYjFk?=
	=?utf-8?B?dTBBU0piTFVveXJyN2tQa0pLOUVaVEd3SGplbC9mY2xtejJzeFhwWEdSU20v?=
	=?utf-8?B?STJJTUJXQXFyOGxEdWVPcFZ0UlRndUNZSTJLQkIrMmhTbkx4OFV6bWhzT05j?=
	=?utf-8?B?YlhJTXM3RHVmdnZOVk9kNVRueThjcDNMa1VvazhYcjlGNGNKMHdhWUtVNGZt?=
	=?utf-8?B?WngvN3lWdUhUdWltem9TTzcrc0gyNDZkOG4zYkpva0tVYjRNRTVrYzdkd0xZ?=
	=?utf-8?B?ZHBiN2lKdnp6UEllNi9TOGMvaE9pZHAyODFhWU1DR2MwNHZpd3IzTHlHQzdF?=
	=?utf-8?B?QjJtaG9wMDBRYkw2SmxsdlJLblh1SUZrSUkwSkpidzlQNFBwSVFKNjdEMnhX?=
	=?utf-8?B?L2ZYSmJpMVc1UmZZQ3ZncUgrSk9zb0ViWEwyWktSNFlKWGNzeGM5TDhoaVYz?=
	=?utf-8?B?Y1cwUmd5MEJRTCtYQnoyS0Noa1BUbml0b2tObEdJK2dyM3NxeUxNWW44NEZj?=
	=?utf-8?Q?=3D?=
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39410400002)(39450400003)(39400400002)(39830400002)(53754006)(24454002)(377454003)(377424004)(25786009)(230783001)(6486002)(77096006)(2906002)(305945005)(50986999)(7736002)(90366009)(117156002)(53546009)(93886004)(47776003)(189998001)(66066001)(966005)(6306002)(4326008)(229853002)(6916009)(54906002)(478600001)(5660300001)(54356999)(2950100002)(6666003)(42186005)(50466002)(31696002)(86362001)(53936002)(230700001)(110136004)(38730400002)(31686004)(76176999)(6246003)(83506001)(23676002)(6116002)(81166006)(36756003)(3846002)(33646002)(8676002)(4001350100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2931; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7MjM6U21SYnBsdytkMEJkTFppRFdheEUzcGhS?=
	=?utf-8?B?ckQzRjdna2dLQitvT2tGNjVWL2VYeFhFYVJCUlZUc0lKOWtMQ3ZPZGxmZFpz?=
	=?utf-8?B?ZGl4VkQ0cmtqOEZCdGFmaWpZUkczVUU5ZHNNQlVBS1N6alZrR0IxRytiWkZG?=
	=?utf-8?B?Uk9jbytMMmhWK3JVM2VlQUp0NHMxbFRMa1I1TklueWxPK2JPS1NPZHd0TjhR?=
	=?utf-8?B?ODVPbEZ2R2xhSGpybHp5d0p5UEdSYU41MzZQLzY0Uzh1MVk5ak02VVRJSE5O?=
	=?utf-8?B?aWR1YXB4U29sbWN5bHZDdW5YaE9HREtXOHNnNnE2NFVkWlp1OUJaTzliU3A1?=
	=?utf-8?B?eWk5T05JUCt1aGc0c2loSVUrL2N0NWNNRzFUZ1NZbUtzM055MXk4ZDg0TGpF?=
	=?utf-8?B?T1g0QXhOdDFqSXg2ZVJzZndrSGxadFdKSlcxYjlmMzUvYmpSTTdGM09MWnZz?=
	=?utf-8?B?WDNGTzB4aHJtQTQ0MWpYTXN1QXFHbHQzTEpMUVEvK3M3aUVDVzFDcjNtLzh4?=
	=?utf-8?B?cGxtczdXcWc4WFFmWEhaNi93emdlSVFBak8vZnlKNmJlaUJXZUdBcWo1Ukxk?=
	=?utf-8?B?aDNVV1JzVmpMYWc4N3ZaTnRVZDMzM0FJN1V6V0pmZVQ5UVRhUHdOeU5nNFgr?=
	=?utf-8?B?WnEycHhGYi8wK2dEd1dtRjdaVlFuaERSUjJuZDVaUDdsQmYwZ1NMcTRjaVVU?=
	=?utf-8?B?RVdaQ2RJOHlUUGQvRmJKdmZlRU1TcEhyR0lBMEpDSWFHaWtTOWNxajBIbEtp?=
	=?utf-8?B?VmM4VU1NT3dNaTdXaGZXSU1NYWdVUjZxNSs1MEZid2N6eVBlQVVXVWVKZVdn?=
	=?utf-8?B?a1BhVFE4K0tIeS9LeWs2bVBOdlZBZlE2QzlKTEp6UC8zYzRIMTBhNW5RZmtl?=
	=?utf-8?B?a1ExNnR1aFN2ZWFWTjhSclFnUEJPdit3RDJrMndpc255L2dsUjNTRi9SRU5E?=
	=?utf-8?B?Qzd5YU1aWDR5WDdnSkZ3b1RhUzdhQ0JvbTRXYk1vaUpPWUw0eXRvcjVRZFlU?=
	=?utf-8?B?ME5EV2c4U2hGME5NWFA1TEVCTTBmMEJCdGU3MXEweUFKUEM2K0dtU3NOWkRx?=
	=?utf-8?B?aCtTTTh5clhBdS9tS3p6aUVIR2tOUEdKSUZmNytmZmVxTFh1cDV6OXpTVWtY?=
	=?utf-8?B?K251U3JVTWVNaHVURVBzUWVPU3F2eGJubU9KU09qMFBZZ3NQbW91NUpWdStv?=
	=?utf-8?B?R0JodTBrZ1VmMjYzbEtzcmViRWxxWklJUEZHSXp6amVpdXphTkk0VnpMTHVu?=
	=?utf-8?B?TEZXR1hHbmlZczdaTVBMTW9rK0VCcCt6c3NDbTJSMjEvT0IxRFEyRXJWdE9O?=
	=?utf-8?B?cm9VNnM0VVN6c1NKd3RFQlFITk5vQzUxeFFKNzZJOUpwV3Y2cmlpTCs3T3hO?=
	=?utf-8?B?ZERuYmcxV0hFUUJHMHAxSmp4VjFwOGhMYVd4TlVBMmlOUUhEeVlTUkg1QjV4?=
	=?utf-8?B?ODR4WnZFY3pyNkF2MVFoZ1dLd2VVNnlQRFRZUG4wSHFORWVDckgxcGRDY2o1?=
	=?utf-8?B?N05sZW5BZCtsOUZQemFSWXlXaWJTUDhYWHRwZ3pQNFd0eDZmSDBtMTNldURH?=
	=?utf-8?B?QSt1WDRlZ3g4eG9iYXFUMlZiRURSUEMvWnhGYmMwMVljZnFpZVY0WXBSbnp4?=
	=?utf-8?B?TnRvaGpoc25ZYURDRi9IM2tQd0VHOEUzRjFkQ2p4QktPY2xXZXk5ajgzcmhC?=
	=?utf-8?B?bmJNa3RHZjhLQXBWM01nZ2R5Nm85VEorOVc3aWRkSjZKWXVEQUdVNjNxYUpB?=
	=?utf-8?B?UVhLbEluL3lucXhyNHAwaUNUOHR3d1RzREdkU0xIazBkZTQvbTcxd0dZQ2dm?=
	=?utf-8?B?UEx5eEUvaGVRUXc4ZUdqMzMzcVh2Rk84dUVIS0NPR0tTNE1zQ3NiSkVrZ0JF?=
	=?utf-8?Q?TBtV0HcS5+Ijw=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7Njp4OStlY3NuTnB1YmIzUkR1Nmw1ZnlrenlY?=
	=?utf-8?B?UFNVN25LbnZ3UHRVREQvYk9vYk9LYUVTaFVvb1Z5QjlPVGJWMzlXRmtYaFB5?=
	=?utf-8?B?Tk1aRzBDSktOMWIxR2FUei9DRGIrKzJpakZpRzRsOEdOcE4rbnlJMWFwZEs2?=
	=?utf-8?B?T0lHbDhKZFU1RHJHTUNRQmRwL3FQbTFLVm5tUHR3YiszbWQxQS83Y3lEdGFD?=
	=?utf-8?B?aFRsM1paelNqb1p3cWxsUGk2V25pQXZ1dXM3OE5VL3BaaXNuWlUrVkhTamlN?=
	=?utf-8?B?dTMvSUcySTBHN29ZR3VjYWdvMEp5QkNSN0pLc2VLb0FyaytHeWpFZUpXU3hY?=
	=?utf-8?B?S254ejRpakhjSi9nQjB5dG9wVllLMHBQYmpNV1NEenVHczNzWFU4L2VXN2JV?=
	=?utf-8?B?Q2tFeUNucHoyUXZSU0d6ektZRmhvTTM0VDhNczNnL25MQW9ieVhkUUpEdm9B?=
	=?utf-8?B?MzNqMVd6NElaQkM1TkxxWWNxcWt4R2FQMHlsaWJka3VpelZWUjRMY0s3T0VM?=
	=?utf-8?B?cm9XWjM3bmRWTStESzdiUG5kaDBKSndtd1F5eThlMnpSQ2dxdHlSWGdkVEJ4?=
	=?utf-8?B?T0JOOW9rZFpwUWVsb0MxWHltMlhoS3JseE1iV09tSElvdUE5YzlPWFE5cjFN?=
	=?utf-8?B?OGtSQUdlRWc3NytVOTNNMm1XamVqYnRLbEhMOFFzUDd2RHNrZFQxcTRGSTU0?=
	=?utf-8?B?clhKZGVTKzV6enBYWWJycDJ4OUlBWUM5elRtTWdIYUcyTlRIbDcxZnVpTkV2?=
	=?utf-8?B?SG93VEt5bXROMkhUcXlRNGNDVnM2UzY2S0JtcFNSSTgwQVBUTmxDSldoaWNK?=
	=?utf-8?B?YlpTem5PME5ha0dNdjRBdXNuU3NGa1RHNHVsMVcxWDdwcEhGOVVRRDljZi80?=
	=?utf-8?B?T0s2KzB6L0hNb1ZIN2JCdWo5cE1OWVdtaVhVSTEwanBySU5ORzdhTHJYUjBW?=
	=?utf-8?B?UVgrV3dUNDEzRUdnaHhMYnRpdHp2Y2c5T3hNb0RvNHp6VzB1bUt5SkNkNUhJ?=
	=?utf-8?B?RGQ4SVpiZHZpdkJYSmF4WUJIY3VUNkZnTUJ0b3FvcGx5NWdnS21LOU5oNHRI?=
	=?utf-8?B?cVZJT2h5QS9zbjRuUEtVTFdPczlmY2xOeFJMNnhXcm9LQkkwUUZuYnVXMHRm?=
	=?utf-8?B?amxNZkVOTWYrNnc0RXdJRmRJL2Y3SXdxNDVnS3VKNHMyazRjWHdwdk11aGgv?=
	=?utf-8?B?R0hwTzgzWW55aGR4UWZacmdVNmZ1aUp5Ynd0dFJuTEhWSm9WcHQxSHR4c3dh?=
	=?utf-8?B?b0ZQNTYxVU5lNHZxSFZNWktITmcvQTZ1clBFVi9PK0xMQSswVTdRa0thV3cv?=
	=?utf-8?Q?5kY3qJ+CI304/0f3EAmfi006b73Naf6t4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	5:RDXeb664Xpx7OFZBqFvEcrNa1DFOVxQqNEC3tNuaDb1/RD2i4E7VcS+IIqHqEHJaINg5ak3SikDIG0eTGUuiy7WX3VU6XsRbe7pPcgYHjZtnpC53frkfYfDKbxnUAyYNtYpjgq/cHZ0B2/e5ZN7fCzcWh5r5bdZ3rQMX+sS0Ms8aP/l2+XFxwe6BoKAn43TR+1AALmsW8u5uty/Yt5GLQOuzhJr3nByxqrmaFMfV5gCvn9/VhJk0zI1bzXTcdZAeeA215hP2w4O1JFB3x3AIUg2CVnMbcljJeI6hhT+AvL1/SIVT3l9vSy5aB8KCTlunI2CAlf9Z+QxJRFGTZdYOg2fyUWabs8zFEpiNviAvQIoo87X/Pvwr7ngCpJqZaNZQI97ArGPIoWVPjVIMJgpeM0y4kBd/k07mv6jpzmhqgqFGoRqqapCClbMnt66wRpJsRqjtHPK2jPvvG3T36K7S8dTyeQdN9nDheLnLUbTNNyEpekO87fGN8fWKqOU5I+sz;
	24:xpzU8djWVldzq82+966SVBW7onqbK52HXYLxWGPm9D6kJyCSxlH1UH2Al0Tt3J/t+CYgeu5tIKGuWtszxlL87+Ts8A2SbqCvqXCSfdec3p4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	7:CYQ8gadGLDBeZeCVoMvfi0hor5UH5qZdnes6y4REDcHM2631S90ydTJdo6CpZ533Qj6LCocppPtkhhDp6E5fPusk883iWzkUTyaVPn9/8eEQsZ5F8pcpXqwwzECrCx4dgvnpy8Vet5bTfAxdkzTEK1uqIsG7/IETAuvFTLSyyHazNOgr6itbqDIBvgOHYA+3RLLJJv19hCxUwxzB5JgUqOVoQCUH7gV4wkwcJe+Yjy5EO4WmO5Zkbj4LQflYInsoPipWVFRkgnjJkkjwqYRmuKWPhj7+/mwn9gMcJmISBee/w+kz4F+KLelexBY1Xg32J0lJtSTKWpyQZdbURx/NSgFPadcAH56ipBWqoZnrjeYXTtqHIlIvWFqttC6bcA3QabPIfzO/jID0HInkAdRC6riGlIDlC+VuEGH6LcYWPLF0Fg6fFOXy0tV9NkvmZ4zjFyvDOhYswmrlVA+gwxOtNT7cHK1WXMZt31Yv9y0IJMWLM9tucm6ORNd6ElGIsFfpAQoKimfHa+0zItrMBtdKhFvXc/EanXEDhEhl1kwVEa3VHLSuhFixFi8RBYXilE8Ia8c3z72wNKCFMCLR5RYYDGq1ToJEJUG8YYosWlCeLqSC7HeKyf2TkpRpteyBrzJEW5ZOg0qQuTwWRqt0mZWIJYNRkxGUSEVj+XMFcZNTS3DS+GZb3ZWb5ZEACIzPKK9HrIHHAh6jt4BAvmod1MVKkDTPvGIlCx1TQNAp2aN48Ia8QFdQLba1JUv27UIjcRVm6YnMWJqufViDnSMY9SvSTcdIQTkYIpko1fxJIIqIaeI=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2017 17:22:47.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2931
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 17:22:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 10:17 AM, Martin Jansa wrote:
> No problem, I had issues with that script as well, but it works for me
> if I provide all necessary params manually (when it doesn't try to
> figure out anything).
>

Makes sense; I think the script may be too smart for its own good :).

> On Thu, Jun 15, 2017 at 7:07 PM, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     On 06/15/2017 09:54 AM, Martin Jansa wrote:
>
>         It didn't make it to patchwork, because you've sent only the cover
>         letter. I've added it to master-next now.
>
>         Next time please send also individual patches. So that it gets more
>         visibility for other people to comment and also that I can use
>         patchwork
>         to pull it in.
>
>         Regards,
>
>
>     Thanks, sorry about that. I was trying to use the send-pull-request
>     script and getting errors; somehow it couldn't figure out the branch
>     I was using. I tried to fix the script but eventually gave up and
>     did a manual pull request attempting to mimic what the script would
>     have spit out.
>
>         On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com
>         <mailto:mkelly@xevo.com>
>         <mailto:mkelly@xevo.com <mailto:mkelly@xevo.com>>> wrote:
>
>             On 06/09/2017 03:22 PM, Martin Kelly wrote:
>
>                 Hi all,
>
>                 This patch series adds a new recipe for Open VM Tools to
>                 meta-oe. This
>                 recipe is invaluable for using Openembedded with VMWare, as
>                 without the
>                 tools, performance is very slow.
>
>                 More information about Open VM Tools can be found here:
>
>                 https://github.com/vmware/open-vm-tools
>         <https://github.com/vmware/open-vm-tools>
>                 <https://github.com/vmware/open-vm-tools
>         <https://github.com/vmware/open-vm-tools>>
>
>                 Please note that, as mentioned in the first commit, this
>         recipe is
>                 modified from the recipe originally found in the Open-Switch
>                 repository.
>                 The first patch is directly from that repository, and
>         the following
>                 patches are modifications to it.
>
>                 Original recipe:
>                 https://github.com/open-switch/ops-build
>         <https://github.com/open-switch/ops-build>
>                 <https://github.com/open-switch/ops-build
>         <https://github.com/open-switch/ops-build>>
>
>         yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
>         <http://open-vm-tools_10.0.5.bb>
>                 <http://open-vm-tools_10.0.5.bb
>         <http://open-vm-tools_10.0.5.bb>>
>
>                 Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>
>                 Although the original recipe packaging was
>         Apache-licensed, I
>                 received
>                 permission from the author (Diego Dompe) to relicense it
>         under
>                 the MIT
>                 license for inclusion in meta-openembedded:
>
>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html>
>
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html>>
>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html>
>
>
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html>>
>
>                 --
>                 The following changes since commit
>                 41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>
>                   Revert "rrdtool: add gettext-native dependency"
>         (2017-06-05
>                 11:13:09
>                 +0200)
>
>                 are available in the git repository at:
>
>                   https://github.com/XevoInc/meta-openembedded
>         <https://github.com/XevoInc/meta-openembedded>
>                 <https://github.com/XevoInc/meta-openembedded
>         <https://github.com/XevoInc/meta-openembedded>>
>
>                 for you to fetch changes up to
>                 402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>
>                   open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>
>
>         ----------------------------------------------------------------
>                 Martin Kelly (14):
>                       add open-vm-tools recipe
>                       open-vm-tools: add missing pkgconfig dependency
>                       open-vm-tools: add missing glib-2.0-native dependency
>                       open-vm-tools: clarify and expand licensing
>                       open-vm-tools: base_contains --> bb.utils.contains
>                       open-vm-tools: update version to 10.1.5
>                       open-vm-tools: don't use mspack
>                       open-vm-tools: don't use dnet-config
>                       open-vm-tools: add #include to fix build break
>                       open-vm-tools: add missing X11 dependencies
>                       open-vm-tools: remove kernel module logic
>                       open-vm-tools: line up configure options
>                       open-vm-tools: support FUSE
>                       open-vm-tools: style changes
>
>                  .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>                  .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>                  .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35
>         +++++++++
>                  .../0002-configure.ac-don-t-use-dnet-config.patch  | 41
>         ++++++++++
>                  .../0003-add-include-sys-sysmacros.h.patch         | 33
>         ++++++++
>                  .../open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>
>                 <http://open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>>          | 90
>                 ++++++++++++++++++++++
>                  6 files changed, 212 insertions(+)
>                  create mode 100644
>                 meta-oe/recipes-support/open-vm-tools/files/tools.conf
>                  create mode 100644
>                 meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>                  create mode 100644
>
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
>
>                  create mode 100644
>
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
>
>                  create mode 100644
>
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
>
>                  create mode 100644
>
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>
>                 <http://open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>>
>                 --
>                 2.1.4
>
>
>             (ping)
>
>
>

