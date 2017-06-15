Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 8330 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Jun 2017 20:15:19 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0080.outbound.protection.outlook.com [104.47.41.80])
	by mail.openembedded.org (Postfix) with ESMTP id BE524783B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OoNBbzx8IEb7s4mT7kQ90dTWIKJCYeZW+1cNb22rF2E=;
	b=PaKBPq42Y6YcAMfZbGiIaGMR8iTjmFEX1brsYeDXwOafW9bicQEHgDR0/xm2hnAJ4bjh7Lsm8Hi7B03ACrtgyN5RvBK5ER5HE0n7udA3LVUJisGgH7njifT+RoJY4ppM6rgu+ChVFHrehcBoWKag73bf5DLPOC42fuV6e3PfYIU=
Authentication-Results: dominion.thruhere.net; dkim=none (message not signed)
	header.d=none; dominion.thruhere.net;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Thu, 15 Jun 2017 17:40:25 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
Date: Thu, 15 Jun 2017 10:40:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: CY4PR20CA0010.namprd20.prod.outlook.com (10.173.116.148) To
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2931:
X-MS-Office365-Filtering-Correlation-Id: f845d724-5e05-476a-6e4e-08d4b4159b4e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	3:VU6LT6/9ywcs+v2sm1VpEBrxxDyA0tm6/zKoTfiVO1xrTkW9k1pZ5wWFIKX40RULuOD6Fg1xH1oEjv8Ezi4Ti3ynLpoJ0ErlplQ8GoYkcQuv5ANAHd8pjNVFaoYJ4VEhcOVUpMZwfDmjg5gB4ZLvRez3KD/6FoLMadlQ4JY6vRC1ZkN7UvXwUNeR+uIshIufgbO81SrDv62nwMnYzGS2DgtPdH5Fwfvcp8Z+fxAfqz7PALvpNe6rYvgUPLJvaILJhEV4R/2PEmBWTTD9ipzURBbRzTYMiTbgBtlvZ8xVdl5GDuz4s32ByEipsNu5d+O5U0m+6vDZs34zoRbms0+wrw==;
	25:3uZJbwusH/hcv1zLPSt1YW6ps4lCp+XCd/br7zM+UiD8fKDnROwVJOafpeVVcsi1jm9SLh25fRrVrnSKnLJ4Bb80SaAnhE33iTRqKXnebZNGWfhlq1gez9cUVXORQaQaJcm40u6/NvEHFIbV5pZZ3xz04S5p/SdB6eJoxiZhCYoNG2Pdjl4vnFy6N5pACY6vF4pmRrm2IxgAGnLA5k9xMkN1rPHIPKLVW7CU5TS9SLHCrlpGGCJkhZ4VE9V5rh0N+l7luWKo4MNFdy3R+FPM/FBoF062eB+ynntoMI/A+OaueMhGY95RvynMThD4fKdvk2sGxxNAiK2J3ruxSWtC+w3aqNMMcSRm1AqTn3xyLIWNEAbldLL14NClylv+IJjgHS9obcopfKoQl78LWB93rTwnO4/kP2Ns13vp6d/dwXcljoGGVZvK0ARaa8slmmfJ/XYoxnq8it0RWV0uPcViXkzAtVvnGL8vgUq5TO14RAg=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	31:3hDpCkBFbLj5afzHLWUCgT0DHuAZRH/e14MgVhjFhkqK3DW0abfo5WYsDKXtPCwqd4dBB/ojE19uRuVzklRCyvVp0NtHizOxHKVkpP0B6LMBMkur5eYtxydJuvBhT6hiFHv76nPSxUFDNvsdnii4emgQ6tK15V8u4tz6Ze0VrQOKCUi5ylNwHsmF06gDnSWZFvIFPGJW687k7H2XeyP/AZEgwvZ8SPakaiuIDa5ngjO+PTQBFTEGxjPbgIvnavYFSSbZRB9K9adkV/LjrkSezA==;
	20:yLVH1v60yeABHLaO9K0L5YA12ivMknVp7QGpHZtG6zEShX+eV7rQf/makcrqJFB0laNhf90Ap6CFv9GCqbBmy6x8nBsxOeR891uNdCF9Gp0Wmb6TCxcVKPpLpRF+Tm9bnGP+/opac/9GnUtbaNG6K3c1xjn8+j2ypA8lKNIIR49dVGziT1xRtOrZuxq6X/aj3jYw2oeZXaD0MVwY/8Exzi6FKs9w+XQLwKfX7gCenaRGejZUsexqPdKY4PqeTVWWcSaooOAN/OsT56tpHoJtf3YcUlrURU5EoNCAmr1hHmCTWNcsfEs7kGtUyWqSAjmhvPvn9ecbttaCt5O69zqlTg==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2931C43C99914C0BBF865FC9ABC00@BN6PR0101MB2931.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2931; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7NDpnMEFDaWs1QjRFdjRDR2lGQjJwZXpSMHJz?=
	=?utf-8?B?TTBxRE05ZWcwNU8zcjF3dzNzTGIvK1A3aVIyMTA4b2J4d2Z1SDFsMTY5a1J0?=
	=?utf-8?B?RFdhN0J1WFNXa2ZmMlFuN3BUNXBEUkJUelNYdE95QUF4eUFQci9Rc0tRSmVv?=
	=?utf-8?B?a3V0c3Bva0hZRXcrMFBxMVBXcjJlSC9SUHg1TWxGbUVsSjlsbHVGQW9ab2lJ?=
	=?utf-8?B?VlhtbEVYeWtNeEc0Yy9KM3lJUEw2eEpDM3doa2JDUmRuQ2gvek5lem1UY3or?=
	=?utf-8?B?dVdzd3N4Z1loTXcxMXVPRm1JczJxd0w3RkdXWkxCc1lUZmtWMjlGdi9Zb0ln?=
	=?utf-8?B?U21LK291dFd2azhqdUllMk9sSkp6ZXBJRGRXUlRZbENuOUh6d3VQOTRuejZB?=
	=?utf-8?B?b3dONWtZdEo2OVQyOTlTU3BtcTE5cUszM05MRERQMGhmMUNpSkliemx1RWY5?=
	=?utf-8?B?d3J6dVlGSWRTZFRXRm5BNHh3bk5YRFliRjltM2EvNlhtcW9IV0Y1UFBWS0Jk?=
	=?utf-8?B?b21KdE9aWjFJYUM2K0ZFTDR1elBYMzVFZDkzMkJTM3RzdnUzenM3Qkp6Vkww?=
	=?utf-8?B?Y1ZtVFUwZmhucUorYko4UkVsVlZ2ZXRTMzhrYjhUVDlQR3VDRUtFUEk1SzJq?=
	=?utf-8?B?T3FZNmRGaEFpbmdiY25kNmdaWDZjTEwxWDI5Si9QQ0djTTVhVzA4M3V5ZUVQ?=
	=?utf-8?B?VVV0Q2VSK1ZWK0ZUcDZmREZlWGwxbTNYY0FNWkd5OE1JL0R1Vy9LSTkxb0hK?=
	=?utf-8?B?ZnhFTGtFNktpcmRKU2VuTkpXNkFaUGI1RExKcHArZnBVSVk4eHp0bzJJZ0h3?=
	=?utf-8?B?SzdJUVhKMzBsSlN6VTU3M3hlTXhXN0JHVkk1WlFqVjBZUGZ1UmxRYTVVdkly?=
	=?utf-8?B?c0ZJc0hNOGhZL3ZaL2REVEhqaS9YenVvTUgzL1dqcGtnMUxJTDFwMHNId2do?=
	=?utf-8?B?N25TRHhJYkd0d0d5U01YOWtsaWJGdlpsdVdlMUpERWpWSW96ejFRZjZBdVl6?=
	=?utf-8?B?OWFTQ3JndlpTNHJiOXVia2dDRFFuZVR0aVdWR2NYWDJaZlpBMnJWZy9hbEEw?=
	=?utf-8?B?MUd3bzNwZGRsSXlBYm0yZGw1dHIybWpybFpMUlM3OE1ZSHFEM3M1VE9Seito?=
	=?utf-8?B?aEFweUJqNXJOcjFvRXdvMWJBR1BLbmFtVDhRaG4wR2Nuc21VcVpuSWdZMmx1?=
	=?utf-8?B?VityZjF2QTdVUEN6NEZWMmdjMFdoMEFzZ2ppK1Z0MFFRUlcxc1hzUGJmQ1Zu?=
	=?utf-8?B?U2FPYnhkQjR4RS9QZHEwOWFmTkY3WUdQNDJNQ2lSOWJFcC92Vld3SzgyUlJn?=
	=?utf-8?B?eGxUNUFlM1lac2pZTEpiN3k1bmVyUWhBbWxnNy9QRVJwUWZTTGpUTVlDaERn?=
	=?utf-8?B?cmkrZVR2YUE0Wnk1L0g1Z0Z6SG9nQ1Y0cUVQZitUa2NWWmtJdWI2Z3JwTm1r?=
	=?utf-8?B?SlpyV1FxT3ZrMTl1NzFpUUl4RWo1eGRLL3lCSjBMcjY3OWpPWEdScExTanVx?=
	=?utf-8?B?d0Y0cGJNZ3JBTk9wY1YrOWFHVWppcWxEQVBJVGdId1E0RTh6RWl2TmZwZExa?=
	=?utf-8?B?ZWpaUDRFRzlCa3ZuR0dGeU0vaTRMdklwQTVsdC9BQnZyU2VsWkR5bGJkbWYw?=
	=?utf-8?Q?=3D?=
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39830400002)(39400400002)(39410400002)(39450400003)(377454003)(377424004)(53754006)(24454002)(76176999)(6246003)(31686004)(83506001)(31696002)(86362001)(53936002)(50466002)(42186005)(64126003)(230700001)(110136004)(38730400002)(33646002)(3846002)(36756003)(81166006)(4001350100001)(8676002)(23676002)(6116002)(66066001)(47776003)(65806001)(189998001)(6486002)(77096006)(25786009)(230783001)(53546009)(117156002)(2906002)(305945005)(50986999)(7736002)(2950100002)(54356999)(5660300001)(6666003)(4326008)(966005)(6306002)(478600001)(54906002)(229853002)(6916009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2931; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7MjM6dGIrVk1PaU9mbVJ5RmgxV0JHL1BCSDJB?=
	=?utf-8?B?MEo5SFVwb0xGLzY1dTZxUjdzK01wbUhPNVJNNjcxK1dJdm5EVnA3TTU5dHJU?=
	=?utf-8?B?Z2JLL1F0anhLNlNRRm9HVnZtUmlqWmplWGh1M1h0TjNxem16RWJiYTl3WnA0?=
	=?utf-8?B?ajR1cEpTZGdLVEpwMWliQWc2Um44cklVdDBFYnlHVWZFSU8wVDVYYVdEYU05?=
	=?utf-8?B?MitGVHNhYmo3citoNTJKMkxTZ3Fxc1crQVBJWENDdnJSbzhJY1RreXRKbmxt?=
	=?utf-8?B?dEZwVXZjUWpoNzlhaE14anRveU96YTlBdm9MNFU0a2lzU3U3R2pSSkczZHl6?=
	=?utf-8?B?bFpGRkJZWnFOTFN6K3V6THFHTmNSTDNFQW1kOWRETHBWTTI4cXgzZXNIQ3BX?=
	=?utf-8?B?VGttb1BEUk5rbWFvRjlrQnJmaG1Sclo1S0JGV0RSTW80U2FmbkcvWUpkdnFj?=
	=?utf-8?B?bkM5djFGT1dRdlo5eDYwRnBVTE1TTGRxUHJpNWVSS0NubStpYUdBSG4vT2Jt?=
	=?utf-8?B?REtPSko2NzFzRzdmcUtLY0VOOXNESitsMHFHcFZpaVc3b25OdDg0ZTZPbDJV?=
	=?utf-8?B?azdYZEJONlhzam4ydnliaDkzcHVvbmFpbmRFTDJyd0FMYjBnZUJhZjB0aFlB?=
	=?utf-8?B?bkFmREtsM2p1VS9udUh4UTFWR0Voa29aWmFOZ21IZzBPUFZycmtDQlRBcG1U?=
	=?utf-8?B?NUN0Q01SM1BCWlZYcDhSNXVZTTdueXEvak5zemQxTGxMZWVZNTZseWJOZzFh?=
	=?utf-8?B?c0hqUWV6aVd2RlpWVklLbFpYdFVXMmhCeXNMRkxUenFIVzJpRDFLRWVWQ2RX?=
	=?utf-8?B?bVFYZ1pWc3dXZGFFaE81VUhQZDBRS2I4cGJBZDZRVmdnaWdTbmQwTklVQTV5?=
	=?utf-8?B?WHRLR1FGbTBqVlpjNXlSWFRUMlNNZlpkcDlsUS9WTEFzejV3eWpFV1dVaDB0?=
	=?utf-8?B?dmxseTRUV3V1VUNYUVVyTkhvQ2lYK1J4Q3luMjFGL2NQRmR0ZzVBTjlEQ1pL?=
	=?utf-8?B?RWlCQWRDYUs5NVNjWDFxYzdrMUdFQnJxQUF3blZQYWl1VUNWMXcvVmtidkZJ?=
	=?utf-8?B?d1pIRGw2QVYySXNsUkNvY01LSUNZUVl5RXJ1aGY5VWxvNTBwNlJJMkNuNGNU?=
	=?utf-8?B?QlRxNmpLc0VNa0hiWjVtTmREQStzdDlLMjlrMUxJR3BoLzJzdWVleEc5bGpu?=
	=?utf-8?B?aHpQSE1oaENSZVhRQVlQTDR5Zzc4SVlocklyWFdXRFdraHpOT2tKQWlUdVVp?=
	=?utf-8?B?OEtOQ0cyUGdaWGdMQWN2cGIxY0JDQnVwcm9lTHZNbHJ5YmhWL05VajJRR3Bx?=
	=?utf-8?B?aVVLTWFLN3Bod1pJV0hGVnhQMk91K1pUZmVPUm4wUkFEelBXRi9zb2hQUU9K?=
	=?utf-8?B?ZkNKaTVNejZkNUcrMzJ3QU1ETnNqdnY3cHpxdjlBbzQ4NE9rdGw5SFRGemZZ?=
	=?utf-8?B?MDhjTnc2Uk5QTnMvanFyNFd4Uld0VE5pQi9YeDFoOUtUWXd4UVJzNVNFcVZq?=
	=?utf-8?B?MTBaTXJ0d2lGZXVFWWE2K2o1Vkp0OW9rSzVaZmR2WlJrQmo1T09hTWE0UjBn?=
	=?utf-8?B?cHFSTEZvTCs4UlFYSE0wZnViaktNcU5uU0p1ZUxlRWhpY3FiclhNVkdoT0o4?=
	=?utf-8?B?TEYyYzJudXcxTWdVeUpuWUVNNUpkb1VFbS9jdmUwK01CYndCdVlZc1BJdEN4?=
	=?utf-8?B?eHZUM2FLcGhkbW1WOTdUZjNZZDJBbXBZWEtLamgzaGN1Qy9XbnpDbFlsK2F6?=
	=?utf-8?B?Rmora2dmdzZCWVFLMkNMSGF4YmVOdGNUcWxua0k0QXpxNSthd0ZSaStHZ1Jz?=
	=?utf-8?B?azRlUlMxczlzRWwwS1p2eEpKNWZWRmJBK05pcmpuQTJaNTk3Yk53Zjd2WjFa?=
	=?utf-8?Q?LCOLqlL75Fkqs=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7NjoyUjFmTks1VmtlcFh0RHdpM0RJNjJYbzJK?=
	=?utf-8?B?NFZmTURuRjdWSVM1b2J6NFpBQUFFbWxjSlJPNHFVaWpFYnIvejUwb1RHRVFH?=
	=?utf-8?B?UzFjS01mYnJvNUtIL0VmZFZSWWxTMmFQMHJxcFhMbk43SHFRQ0VQZFRJVCtv?=
	=?utf-8?B?WHo4K0dRZ0wxN2NUbWh1d2M3OE9ra3BKbVpRdlRLVkxiWHFxRnRmMHBFY2hY?=
	=?utf-8?B?ZGdjT3hSTm9mZm9ZN2d6dGJ4YkUweHFRQXNWS2VYZnB1TUxheWdBa1o3TkRJ?=
	=?utf-8?B?UXdRRHl1aW9pNTQ1UlE3dXFxY2dEZS9uOElvb1JqUUxaVVFmd0RjZ0U4c3U2?=
	=?utf-8?B?SmdyZyttMU5adTJtOENEZk9Kc1p4YllZQThGMDJTUWFSTS9ZTGpBZXVuV0RS?=
	=?utf-8?B?SWVKdlR2RkgxdGUxbnoxZXgyNmcrckg1SkRkVHhRQmIzeERYdXpuc0RBSFJm?=
	=?utf-8?B?TWtIRE1EajhhOUNkbWt3am1qUSswbk9LOUpNR2FFT09VYlhyL3o4MDFma1Vj?=
	=?utf-8?B?aVhTaUlIc3BaOVdDRkRwbXlEQ2FzOEhyZ3VOaFM3SzhBQWgvTTZTOTVIejho?=
	=?utf-8?B?eHkwWXAvVEw5QkZPUFpkcnF4QXBtYUlFQjU0bDVPOTNYQjFqY0RhVmRtT2F1?=
	=?utf-8?B?cVlwTXRTQy9Rd3YvSUtlQUxoZ1A2RFVsbnVNZ3JLVmpEdm5GMVFVRFZDai9l?=
	=?utf-8?B?VFhTWXkwK0czZVNSQmNSb2trV0p3WlNJcmJMc2craUE0TXhtdXRDVjZCMzk5?=
	=?utf-8?B?d0d6T3ltdXpUOEUycUdsM012ZDJUWW1oTFhhck9TWHdEa1gweDROREo3bEls?=
	=?utf-8?B?TisvRGsvVFB6aExjeUZyNm9rWkJMMXNxeUZ3VHVUZGlaemFpdWt5cXdybFRt?=
	=?utf-8?B?Y0RhUFNUWFhrYlhDWUh5aUxxT3VPYmRLY0RsVCtEQ1BwTnlZMVNkMVJPMjlK?=
	=?utf-8?B?UElVazliNUFINjFGRlVPeW53R05TMEYyaTRHb2RndHh0UzluTGN6cW1kbG9U?=
	=?utf-8?B?NG9lZUtPSUNGY3BxaStodUV2SUhLbWN5eGpzMU9wUVQ1K1ZZZ0RhTmg2M1ky?=
	=?utf-8?B?blZ0QS9DdUEwaHpKektLM0l2dmNhUkMyWWFtTU5JcmF2TkpFcXRGdFM1NVRU?=
	=?utf-8?B?Y1B5NHVKNUZRbUpOZW5mU3ZXaFJpUnRsNzVWVzJ4c2RjZlRrNHZHNmMwRUly?=
	=?utf-8?B?VDZiMzRPUFRrdHE3TzJsWFNlVjhFVnBVM0xpbXoxZXpHMEphVGtBWm03QmtQ?=
	=?utf-8?B?dlNtdCsvVXJ2eXpSUW1XdWZxVnBkSEhrbnN3R3FzUWRnbFgvemdWcmJGWmpv?=
	=?utf-8?Q?Nh0ZGozm7VqHFo4DegKouno1aQaHvAPoI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	5:xoWZLY8m9pwehPjy+4AZxw5T4eCNIyHN8x3HBP5Fp0VLhDo1jKfRH0MQoxYH30GSwXyNoXzxGJYuEdS/36XEkwo5AZoMSsGPsF3xHrkbTXytnaShXr0P6N1u6DBAVWuL9KAjF06jT8twHWjJQ6tcJe/mdpfoMCFIF+Mw8ABSVb9dR9pkPtfq+gBnNAv1ytGJloPlN7/4gDZ/rrHnGyEHkiXzv9+VrdM0ngCM4/fpVzFUogyC3CcmpoatdyzcQ1xffqfrF429lFaHHr7sZuJ0gMhSIC0TNZ9AJ5uHgfPN4nNr8d2bazgLYYkRo0aT2q2NofmEmuDePsgSACjBCxJynom+OBzW/e1fD/CykV8T2v0Qhg0XPiOk18tqoyrKItZUjy/xudrs6FC6H5zI11oyTJixKjczHH7NX5J3FEfMGv4ikghodMUd9oRhpkdOr7JV5razwOu5G3CT31JTQm5y5zEKB5Argq2+Cvif+Ozn1aX0tsrjOqA2TeFJ6mZzYqUd;
	24:zeCKHbJYeHe1jh+qTAXa9hBFNPkS16THSMbdpSScgd4HPJ6YObMCy4tC2v6zTPvjSN3a2wuKUo1xEBUyIfWwEP6gyHZP+OKVie6bwbDrROs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	7:mGg+uf2+EFJWhRoQe5NioIIdHKuYCtKVWcwpEaoPGYF315ISpv0otfrkKr7rxmyi/HCTwk8RSTd7SCF35cu+TZQd1ByGNJ1bOtL32RUCAUM3WBfN9XDZCP1DqemDGPyGizSCkGtu/LehrZ6D/Q8D/P2DmHqHdVmZQL2qW0fl7f8GA335H5H8Zph7vettpZjmI2AzgVmULqvLot/2mkdjPpxmgPVIx0P6mkvYLUX/xy5Q0xcdR6l/SJ7pkGj8e4ZclqWPsZjG1iw7nk9W7J0KA5h2szHyakq9sL0S8nY99WGVofxu1rNMF2JxXJaU68tTR/AneXPb2xxVK9AMJoXGIuyigR+LAwfkt3BvvHDFzQzkU45RCNX+bL7bUrQkGmkKIP/Cq2LgghTP7oWXZZntQZN7hFFXn4rkwWSMmeJtdugg2gqvoNQDkd/DkHSH+KH88KQg74hYRuLYNm8a1s1rAPiM6xRvAFoBmYe7dfagEmO1k+bMtahpM+JbTZC1DTcgCLA8rwiZ/XyOCm7ceMez80sisD5i7MasSWsVjLAolBMivaSDVv+YxsJTan9+AK1b9KyZk9tlIjwDKj55kKUizlgPnfv652JU2q1F9DKGm8TjBSdFKsW3C0X+bGJcnT9LR3OHlIR+LCJkx4vQu9V40b5cH0NkArN8CbSCsVq0uBVlK6yrwdnc/Nt3FRtQsKYV6Du0hBq09o4NF1jiBe4pAFNSUUYQErmmlvtxDS4lYpqrrwsyC+1grz21oW1J4vng0Uurl8udg+dFZnoP2ayA9WGhiswt/Ut7EAWQuTsr20c=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2017 17:40:25.3847 (UTC)
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
X-List-Received-Date: Thu, 15 Jun 2017 20:15:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 09:54 AM, Martin Jansa wrote:
> It didn't make it to patchwork, because you've sent only the cover
> letter. I've added it to master-next now.
>
> Next time please send also individual patches. So that it gets more
> visibility for other people to comment and also that I can use patchwork
> to pull it in.
>
> Regards,
>

Small note: Looks like the initial commit (24b2ac) has a small typo that 
should ideally be fixed before it's merged into master:

"open-vm-tools: add recipe from meat-foss-openswitch"

"meat" --> "meta"

> On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     On 06/09/2017 03:22 PM, Martin Kelly wrote:
>
>         Hi all,
>
>         This patch series adds a new recipe for Open VM Tools to
>         meta-oe. This
>         recipe is invaluable for using Openembedded with VMWare, as
>         without the
>         tools, performance is very slow.
>
>         More information about Open VM Tools can be found here:
>
>         https://github.com/vmware/open-vm-tools
>         <https://github.com/vmware/open-vm-tools>
>
>         Please note that, as mentioned in the first commit, this recipe is
>         modified from the recipe originally found in the Open-Switch
>         repository.
>         The first patch is directly from that repository, and the following
>         patches are modifications to it.
>
>         Original recipe:
>         https://github.com/open-switch/ops-build
>         <https://github.com/open-switch/ops-build>
>         yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
>         <http://open-vm-tools_10.0.5.bb>
>
>         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>
>         Although the original recipe packaging was Apache-licensed, I
>         received
>         permission from the author (Diego Dompe) to relicense it under
>         the MIT
>         license for inclusion in meta-openembedded:
>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html>
>
>         --
>         The following changes since commit
>         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>
>           Revert "rrdtool: add gettext-native dependency" (2017-06-05
>         11:13:09
>         +0200)
>
>         are available in the git repository at:
>
>           https://github.com/XevoInc/meta-openembedded
>         <https://github.com/XevoInc/meta-openembedded>
>
>         for you to fetch changes up to
>         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>
>           open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>
>         ----------------------------------------------------------------
>         Martin Kelly (14):
>               add open-vm-tools recipe
>               open-vm-tools: add missing pkgconfig dependency
>               open-vm-tools: add missing glib-2.0-native dependency
>               open-vm-tools: clarify and expand licensing
>               open-vm-tools: base_contains --> bb.utils.contains
>               open-vm-tools: update version to 10.1.5
>               open-vm-tools: don't use mspack
>               open-vm-tools: don't use dnet-config
>               open-vm-tools: add #include to fix build break
>               open-vm-tools: add missing X11 dependencies
>               open-vm-tools: remove kernel module logic
>               open-vm-tools: line up configure options
>               open-vm-tools: support FUSE
>               open-vm-tools: style changes
>
>          .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>          .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>          .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 +++++++++
>          .../0002-configure.ac-don-t-use-dnet-config.patch  | 41 ++++++++++
>          .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
>          .../open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>          | 90
>         ++++++++++++++++++++++
>          6 files changed, 212 insertions(+)
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/files/tools.conf
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
>
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
>
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
>
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>
>         --
>         2.1.4
>
>
>     (ping)
>
>

