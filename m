Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0077.outbound.protection.outlook.com
	[104.47.37.77])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC786E660
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bdVXOEJAro9wIudVUnJ0o9IWuwBCPFomlPNVI+Kv5yg=;
	b=xvqk3pmB2vjrWboRrDQ+eiUdfpbcEG6r3goxERKUL5tOhs8dlPor2empMt5yrdmDe3XnW1NFHhVKa0nO/ib8NiO60iyArq6fA5J/AqaJpld8wAvJNkHSMV0dT0urUg59y9vR9WTDcKWxPqOsqhSpLGf1oaie4aJdxE7rgtB9Bk8=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Wed, 12 Jul 2017 18:37:10 +0000
To: openembedded-devel@lists.openembedded.org
References: <20170711181353.4404-1-raj.khem@gmail.com>
	<a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
	<CA+chaQcKpDbFe=iq=BbKg4BiUrFfRHBHJePAEOxeMny9fUs8Bg@mail.gmail.com>
	<CAMKF1sq30C2Kr9JsFE1RqeGsJOSC-NvvZeCDb+dJgdf5R5FoAw@mail.gmail.com>
	<CALbNGRRuQMSr8CB++M1aBC=PRzMQ5FqLs6w5i7StS_7maFG7Ow@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2c3faf57-50ea-64d7-eb42-80fdd0c02422@xevo.com>
Date: Wed, 12 Jul 2017 11:37:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRuQMSr8CB++M1aBC=PRzMQ5FqLs6w5i7StS_7maFG7Ow@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR01CA0021.prod.exchangelabs.com (10.169.249.31) To
	BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43333ea7-5a7b-4bb6-0711-08d4c95501d8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	3:3qaD2szPpMeOqvbb9AZIng3K1nvxJ8b4+vVf5MR7GIT3miEfSzxBx96J7QiA7Umi+rSLnZjQbjkVZjejPKbwdXIfRVt8fCLjppBT33uL9xzlTfPYA0wZujnXqxUUKez5MD1ZsgmYpYEwpmdgjM7GntN6a8Mmpx4pTq0u26EwP6cV+KUQBDq8lFUGJuRjOZi//PH6XUdKA9J0GyNeLqB3w7OspDiDLW/bQ/w5TlVEQREUFzUqgE4nmlzrk15XHWSQQhDDibTHrmJRBRkNL1Sst064fzEF6UHsAf6xbl9j/Atu0qAcEz2rgrNpEEq5i8jM4xGbbnJI0bBdg47PYu/5EoLsDVZD8UwvsSKIEyCx37CxbA/X2N+RH6NtmCKVVnYPkDMEcnR1NYJByW/xNJc8pmZ1GOv8Tqu+X8vdKRz5EGLd6NJu4EyFEbW2WXzJL8WiQ2tIPyw1FrB6Ym5mdm8ruwO0EO7dRpBhrKp872I7gmVKRvsP6fajDgTLsG6asvUxMNYl6YKqjnsRgAf6mI84oB7uFUxIYQ+35Zwe1o1uELuEaX708nG6pagtXslm5yVYHGCC9CsApli/dvSj4QFasn/SToChp/ECPcd9eBKTvwiFJP0WgnDWbsAKWn53anNlwnBPAhHV0UQ+xcSp75YngY8K1WIFiufVsXBMNgRH79q7g3bJ89Sbr4r8neu28p5SkGOkhpQgT4EgAYcMCoy2UVQsqAUrE2zL+eIgsU8q4PE=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2930:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	25:9YlQGEHaQgSn+3SVGcgLF1yJ2zqEUKtLnMjpPdN6wndV7zZCZGfK2JV81SDuV/5g6VkEAgUzxdXQvEPhi7vGyFtts5rrHzMtvzdImVyzYBMtY0J/sNsfC9FbFWWicMpvRDZ9l04r0gttjtVNwfWkAgiQ5ryi8tdGl1S1Ysbm3gASThJCVbBmelY09PmrylJF0P1gEnVmAMZrKV6rNHtGepqbsbEBzoNWxOUNp0bwPZ8393b+Sy3NSFN6Khn2ul3htiBpgK1tEYiyLkZ5aZmeGsCFRaRib72TquGqVS3e05y3R1V1XQiVqKxI0Dc9voA7Rc6Kf/sTSl4Zpxy97wsljuss9XVDPm63tHBoR5L2ZXzuajI/8npuVmtgQEIyBy8Sclr0XNcWyHhOgniFdqBSZjNPUlKMSBJ+m8WGSaNkJpwIk1zmhLVqkSg6VVUmZwEKOruKdJ0JCOzSZ10g+EBOgA4IJbG47G9TD4DFy27U2aCQxMKChOFgZN41Vo80ch2nhC+hTY6MLgS81LAfA2JQmB6YDAG3u01aTj3/BVWkS8xja29n+WczxUVwtxJZSCKhrA9t8QQaMMV1/wPUvrmwqUhD+Xh0cGWP4IjyBWpBgiTQUD9awxTDd9EF2WbdARzGQ4EA/H9INa+gLecwj/3wDjDq4UlPvk91Rxc/IZu2x+YGWu7hJU477Tu8UMxtOPdZClZFre9YAo6wqlQRXrbGElCrbxlJL5nOOY7VNlTeFAxctPU9IV71uYWmHz+gw8FSmHiRaw248gGg1GRe/R57VT8DdfHhcbIKPR2JREt11HNqTyK9vmpvIhzOSLTQw2U52vKCQtakusq3YuO1Ukyirc3RgmYuGZUJTqtJeCCETWWtzyG4OUGJK8FCGbhAt2n06VzKSc0e5fwyh4/MxrtZWiT+HIFFtuTGVRQwLDgO2Bs=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	31:soAOEFurepd9OPQN7IxIrhrfStSLn97Bkkv1x68FFrLwQDFNCtObyfM/XNLEJ75jHE8lKcbNZjqClhp5x6z+Ly1tCLNVU4jEsCmzrkMBCsxDDvzd1Avo+kpkcXENaBgZ0oag1ckDmpn7hTYorfFchsaESN1QyDg9rLlmc6ZdTUGLvjgnXQV93cNWyatpXN8LWMEhFdmVdMoMV3YyFJ0e5IyKLmoNqdCemA50A+kmuV6mBDy6MxOUygFr3SGKFVUxgE0cAXcQSL85W0n1z8xQmhWhzO7Fvu5PKP9piskbBBZWcO8ZPPWeZ4HMC4qMkpeOxRRxBITzYiuEXbWSNpPzIhCVLyu0NyWqPVlcGGmbJOCQa3Y+taIR3ae0UQlelC6QH73WQLqkLWvLyGcWjTJbGJhU4FhN0cLL/yrJ6IEhlD3TSp6TmA/SNoggrL400hZJmHF41uzioDvuh5TlqSIPuobyw1Zumv7XOOGpscdpMISxoaVYx7Im4nvN2PaAMOVZFLCiV2wfl3yT7Y8eQXQdlU2tjpAyswztiVnvD/H2Q47g1/cBlU4zp85TkfDfRGrWeRxXy/y5XtcHmVYJCvxBWKF5bI5IBoaJOa7wx8DiVv0fLuqILqSntcv2q/OPdMfYJ7pVx+VfGpKqdnoo2NUHKsm5b7MzN3FD0iVmeluUDmrld9FUE7gZ7VpUEfhg57Ga1fgZ5pMITC4C766O14c3yw==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	20:uSWebD2EnxX3Z2qnrTMIVRmZarx9QT1hL+IsefDdhSarAfj5OqCgf9ZqsvJSQf4BNNGCwqE8bHzZbunADRErkV3qJKZuBXRpl0LLSXM18+GGXWFLvy/FX1GJB//vfyZdZDIOIGIEYA22IL1L+WwCqNEGsfnfGjaERyLOmLbnUbnMbl/dhvWxJK6KFFQsMOo08L6h6eu8oPhRNrFPkOwGHAxsYzjLkbEPejot98s+PoMXkA49FF/SFP+eaThj6D4eqVRMtAWj0trvPLUensLbdf9cROgjSKi+ZswI695GU6WKV8k/qSYJ/NUYdivyYu7JgukLB47rYuQes8SdReoVbU93x4z+6o8fG1nBjEGQEHWcJJGqgSzaeFa4C02Qof9VB6Ts/S+A5uVe/BATb9qKUpOuTwf4Kl9p5rd7r/tHj0A=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(8415204561270);
X-Microsoft-Antispam-PRVS: <BN6PR0101MB29301F9646FB5446FB5787A0ABAF0@BN6PR0101MB2930.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(2017060910075)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2930; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7NDpldUVQSkJ5TFBsbGJCWkoyYTZlejU2WnQ4?=
	=?utf-8?B?YUFtRFVpUExXS3FobEtzdEFKdXFmZXdaWVZZSzk1WGZncFJkd0pjVjlCbkRN?=
	=?utf-8?B?cDFWNXhVK1k1Ulk1VXFSemJNaXh1VzFCWXJpaUtIaGdpOVpGV2MwZnFrMGhU?=
	=?utf-8?B?cnk2UDZvVklZeUt6d2tkaHA5MFVwYWV6SU56cVlEc0NFYzVnRjJITGlhMkMr?=
	=?utf-8?B?ODlkSHdjS1BpM0w3MTFTOEZvU3ZnOHJLOFd4VzBybnZYVTFDaGh4Y2t1YXVs?=
	=?utf-8?B?bXlWdmorQ2QxSFlENDZGRWhYZENNQUIyMzhiR0xaK3p1TXFPaFptUzhPQVg2?=
	=?utf-8?B?ZkYxV1JPWGw0RHRJV1NRcDZLcHpST0tJRElIRCtjWWcyODJhb2htV1BvT0d4?=
	=?utf-8?B?cmJGM2dCM0JWRGJDQTdjaUp5WHNWdVlHWUJGVHlUWGQxUURqdVp2eGV4bzVp?=
	=?utf-8?B?NHhERDJWNkVzWHNMV2ZBbGhKc3BKd3R0MVorTEJUUTg0M2IyYklkSURBRXZX?=
	=?utf-8?B?MWhWbEtKTFlycUtjNmNHSitpUWc0eW8xK01yNVJidEk5cE1mcmJzbUZKSkdO?=
	=?utf-8?B?cUZjdlo3ZWFWK0VJZnJuN2lFRE0ydFZDOXVabW9rVG9PaDAxcGNORDAzYm9m?=
	=?utf-8?B?QjFCcm5kUTFGa1c0TTErczcvREY2ck1ZMlV4THUzbk0vRDNmblluZys2WUho?=
	=?utf-8?B?SXpYWEx6eVVzVEJ5K1dtMHFOcEF3WTlzQ1BnTDNSZXlqeGJ0dHJkeHFpVU5Z?=
	=?utf-8?B?aHByU2VnQWhaN1owOUo3V0p5OTBscVZWQ2p0Z1IrdHkwdnZrZGVmNmhpOEMz?=
	=?utf-8?B?RXJ0a1IzYXhkMHhyTUI1bno5aHJOM0l5aUJWSWpxdWpjNTgzT05aSjh2MVZ0?=
	=?utf-8?B?VzgzT3lteGJnUDFKN1Nqdm1kK0tIM0ovZ2lCRmx2aUdzQVVxdmt0THRTZHRP?=
	=?utf-8?B?Z1h4NWdxdTdxcVNhM3RwdzFOVHF5NUFlZU5TMjlFaXRoWFhqeVAvZDZGQzJm?=
	=?utf-8?B?SWpnbUtuYVBBVndMZkFQZHJtdDdhSTdTQ21namhSL0xDd0ZNQTMxenRIT2dq?=
	=?utf-8?B?Ym9hdWQ1STYvUW51WTBjWlJadkVSSCtGeDg4RC91V3VxZkloYTJkOU5sNW5U?=
	=?utf-8?B?WGQ0VDFaVlZCajRYb3J4aWtkcyswalFEeDlnN2w4Tm1rNjhoMmd4VlF6Sk5H?=
	=?utf-8?B?NzJGSi94bnhYWHUrbHRkR0hvQ2VRejJ0UzdCM2RTRFdRYU1LQWRCZ05wcGZF?=
	=?utf-8?B?eGdrK2tCUjdVTDduOEJ0V045WTVEK2pKSk9PTk43N0Z5Znh6bk40UmNjOXh1?=
	=?utf-8?B?KzI0MnA1MkdQd3NiYUI5TEh4VkJOaUlsNUVWMHdLSmNBek9uVExsK2twZ2R5?=
	=?utf-8?B?ZzFWVnN5K0RKa2NrZWYwOFpRV1N3NldYRUVqb2s0T1FIc2lHRDF1ZnM2UnFP?=
	=?utf-8?B?cHFEcVB2M3M0T1BNQ25FcDdKdGpjUUE1TXl0c2RLZ1g1bUlrWXc0Z2xySHhJ?=
	=?utf-8?B?bi9uaHB6R01xY1p4dzZDUnppYzhBcGxyVzRuRVJPR0V4ZVJlS2t2RURscXRj?=
	=?utf-8?B?SXBoYkd1ZWEySVdwRzQ4akpaMFpENU9BZnZYYm10aFdzV2F1S2FRbGUvSXRY?=
	=?utf-8?B?NzJ3cXNDNVVmZHl6L0NLMURUZ0RFVlVNMGNBdS94TjlyRmwyZE1aWVJYM09q?=
	=?utf-8?Q?aMlBiGF2AnSthc5FW7Q=3D?=
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6049001)(6009001)(39450400003)(39410400002)(39400400002)(39830400002)(377454003)(24454002)(36756003)(50466002)(47776003)(66066001)(31696002)(86362001)(64126003)(2870700001)(65826007)(305945005)(83506001)(8676002)(478600001)(7736002)(5660300001)(23676002)(2906002)(189998001)(6486002)(2950100002)(77096006)(53546010)(6666003)(2361001)(81166006)(229853002)(6916009)(2351001)(7350300001)(50986999)(54906002)(31686004)(4326008)(33646002)(93886004)(42186005)(25786009)(76176999)(6246003)(38730400002)(54356999)(110136004)(4001350100001)(6116002)(53936002)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2930; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7MjM6R1dIbUhtM2NGWGZSVUpMdnRUTGpGNVpO?=
	=?utf-8?B?M0d3bllqbnJMREZBamFhODE3S1doNGNQZm84U1JGQ0p0ejBnNnJ6TDdsdXpE?=
	=?utf-8?B?U1hYYklBTVF6b0twTnZHWlJsTGZ4WnJqVHEvbVRyZDM1YTBvb0xEdndMVXd6?=
	=?utf-8?B?K0lQd2htbWFpbU1HRjlrRVV4Zm40d0JRNDNvRnRQOTFFMGFlQ3F0K21QUmNF?=
	=?utf-8?B?MSthZENyWmxTdzJLaERnUmgwN2dQV3hHOS94VGRON25HaDUzRnVEQWV2eGM4?=
	=?utf-8?B?UC9LTHppc1Q1azBjV3NyZTVKUUdvRktiN0R1YkdTZ2swM3hOWDBLTndWUlR2?=
	=?utf-8?B?TTZ5SmFia1EvWjlCNEFwWkJJOGkzWVRCcWFmWVhKTFc1K294NUJRc055Nndx?=
	=?utf-8?B?VXhvcFRESXZkeVQ4NDQyUVZQK0IvQVFCUkxoR0tmYWp6WDVPYlBzUE1MQkYz?=
	=?utf-8?B?aTZRZkszaXhlcnp4YXNidjhqTDRnaS9GaWp4Qy9OUkZJMXlEaXJKR1JkaXFK?=
	=?utf-8?B?WHRYSFJiYitGREhrVjZFUGhWalNTRURDbDFHclFWditEZjJ2UUZDbFlqWlN5?=
	=?utf-8?B?ZlVBTUVxczM1Rm1DUW5lTjF2MDh6RUQvZ2dzWW56UlFmNXkxNit0bDJWZVBK?=
	=?utf-8?B?N3pqUUZtaXQ2emxKTnlmVGRnVHdTSGd0NkU5OWY4VWgwU1A4S2w5cUFsakpm?=
	=?utf-8?B?WXUwQnlnMzFobE96OEE0YlRXcXNJUDFpUittdWtCOC9ROEQ3YTJuUHVvZitX?=
	=?utf-8?B?aFo2MDhYaXR0Z3VuVUE4YThoc0MySFM2VzlOZ1JXKzVWV1NsMURwZWx2K3c5?=
	=?utf-8?B?VHB1bjNVTkJtVGVDbkVzczJzUUk4S0ZRcXBDRWFWcU9LTXRpS21pVlBjM3lu?=
	=?utf-8?B?anM3Z0Z1QVRCMkpZOTB2Mm1Fc1RyZ1BoMnVrc0tNVTRNRmorb2d5QmFDUlZY?=
	=?utf-8?B?L0NwWVhXUWJZVG5nRm5qVVkyRGxVK3hEdHVoeEtTYWcxVlo3N2V5VDltdGNt?=
	=?utf-8?B?ZWhEYVMrUWp2R1VZaThJbFVOQ2RoUTNPOUMwSkJIdk1qb1lEWldweHdjK3B6?=
	=?utf-8?B?R0R1c1duWi9HdVZSZlBhWXBOUDB6UHNUZGYwcG9GWWx5ZXFLTXpKcFdiaUdq?=
	=?utf-8?B?eUxlc1FUTHI2aEJPVFlaMXEwMkYyWG9IV3NtWDNldEd3d2w5UzdZK0Q0QVB4?=
	=?utf-8?B?K3p2ZjdIcHlvWlFldHl4MytHSnp6RXZQMW9QamJUc0Y3VkNPMnJZQ011NEQ5?=
	=?utf-8?B?STF2UjF6SGdYMjFyc2ExRzBwbHd5VHNDMU5XeWdhMStXWWJ1ZkxRZlJMWGJm?=
	=?utf-8?B?MlVTR1FxM3UvK0taSDVGNitteEhWWkg2OVpuc2FwQWZkZExTK0YrTzExM2RZ?=
	=?utf-8?B?aGVsUkJEZ1pHVU5CUHJtRzNGVXViZ3JydHl5WW9nTUNPdVpPTWtvRXFVOWtN?=
	=?utf-8?B?YS94bGpxQ1lyZE5XZEV1QzArYnRrQ2N6eFNyaElzUGQvd1JqMEVHeThpR1Iw?=
	=?utf-8?B?bGhUbks3R0RzbU91dWw1QnpHOWtCamJxbUExb1FaUjBOYXFsWUFKTHp0cWl5?=
	=?utf-8?B?VFVlU1ZRcTZ6OGtxcS83ZFRSV1V2Qy90REFyQnFnVTJ2M25FTGFBeGUveGR0?=
	=?utf-8?B?WllsekQySnBzNS9LVGZmKzN6aFZIaDk5OUExdXVvdkFHUXFaQVdFMnlkNlVu?=
	=?utf-8?B?VFd0S2NrMzg2bkhMcFg4djQyaU9LelQzUzUwYVhoNGhrcnorR1pCTlZnYXlI?=
	=?utf-8?B?TmtlV3JUY2NKRGFnZWtnK2dpeFBESG1IM01iWnd6VHlUNWNNT3NXV0VWT2lS?=
	=?utf-8?B?ejlBVTFLN1h6aFUxcU1PSkNHbTlrY3JuY3UvWG8zdDcrdVBzaDZkd1hoNkM0?=
	=?utf-8?Q?hrTXpKC8LJZ6E=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7NjpyYXN5L084QmVJSnkzYlRENCtqT1NDdmtq?=
	=?utf-8?B?NDJRdnBwWFQybFFCOU5hb21nQjdHOEhOMHovSCtPblExNWdYSkg0UXZSQXhL?=
	=?utf-8?B?Vjc0V21zVTIzUFR3SXltTUpJbkZCN0x3eE56NzNNVk1Gd1F2U1RPaTZ6TlZn?=
	=?utf-8?B?L2JwamJ2RnVjMFpqV0kxazA0aFZYM1JiUit3QUhWaFl4U2NySjFmL0lxSlFu?=
	=?utf-8?B?aWpodzVVMkpMZ1NwSnZINmlsQ3BscVIzM0lROTUyemN3WGdoTlU0RnFRaVdq?=
	=?utf-8?B?dUJ6L3dLZ0xibjJjUW1tb2Q2bXFEeHFhNW9ScE1QM1dha3puYmJQYlNNc2t1?=
	=?utf-8?B?SmFVNlU5dkZ5MDhHMFZYdjdwRVFLbDExOE1jK3N0bGNsWHFUK2o3emhJbjli?=
	=?utf-8?B?SUh2Rnd5YzU4d0RnM2hnS2QwdjJPVmthaDNMcXNXVkJJRW9US2RDYUFpWjZt?=
	=?utf-8?B?a2VMZTN6bEpiM1ZFbU9sYnh3RHpuTnc5Z21TYnYwMUlFVnp6R1dwNm9ZRkMw?=
	=?utf-8?B?RmNnU1NqWGNuZEQvRXAzbUJLVDErVlRNMHVEbVByTG1YUU9adXkxY2l6OW1h?=
	=?utf-8?B?SDVXbUc5RUowaHE2YXQ3THcra3N0VytuWEtjUHI0aGRnSmdWeFBZMTc1dFAr?=
	=?utf-8?B?MXFpZk9WcHY4bXA4bWVGb1hKVVh5QzcxTXZKdEdCTVFWTlo4dlNvNEV4UElD?=
	=?utf-8?B?dFRkSTVLa2JxclhhdHlVck9NV1hORnFaVVF4ekRuWVNVcWFueWVYeEdHLzFH?=
	=?utf-8?B?ays2QzZZQ3hRc0xJK1FXRThxRi84WTdIQnVWQkgyQTN0eWxhU1ZXSUkwL2h2?=
	=?utf-8?B?MTJuTm8zWExSa1hyMVI4aEJ5TTdQWXlBenhnRlc0WTdZaWpjTTBWc1l0NzFy?=
	=?utf-8?B?UHFYUGZhdXNWRWtsMWFvWGZrbzZHdmdxMFhtaTN5K2ZKczltazNOSThIbTQx?=
	=?utf-8?B?REtBeHZJNitvWFh5Q2s1eW1ITmlhOXBDWTh3NmdWbWkrQlU2L1liNHUzZnRt?=
	=?utf-8?B?Zzg4WXBQUkFUSEp6alEwcDMvRU94bWt5eW4xd2pSa3BMNndqYVZBdDdQS3VF?=
	=?utf-8?B?ejVmUTd0d1ZMUjdKZjF3YTRtRjhXQnRCS2ovV291Yko2KzRERW1Yd2psaXF0?=
	=?utf-8?B?KzhiZFpOUFR6OFFIbGhqdStHTk5GVzdGV0V5L3J1OEdLUW9FTkJLVTNWRm1M?=
	=?utf-8?B?Um5kektJOE9oVjVvdTh5NmJlemZjQVF4cWVCeGZ4eWtRLzk4dWs5OVJKeWt0?=
	=?utf-8?B?bTZQMWhmSys4QkxWdUFVbituUjNrOXB5NDVhQ2dzZGF3ZnpEaHI5QjVzZlZC?=
	=?utf-8?Q?NzEmTczHJxlmoiRaYXI135Cmp70zV/9wI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	5:8ARPIK86ZKVXbRZqS3Hb1FqNYRHaSzTlp2o3i7r2RlBM20bPJtO5kDU+pryAeDX2tg5rPpdopfDVSc+l5HUHqOu1tf8EQAaMgxAVZ7op6Xlw++NuFAmOAhnj0yalhHsvnQfn4VgT9G53ET8zYZjFuDLVoa9Sybl8+LwjsQk74a9DOJUY/FSQPAZM4YJcztCWSZx8QHgGhVcoj036BbnDMcipqNtc9c/cZ+/1gv6krKsSzwKeteRSfWkprdMfGd03B3myIFE0LqGNfMFRkWnWwCsEXzDpSSA8z6nukryaL1WWVgqMlo88USNPLkoNQ4xe3iZQZS9zNzT7KyHjSJbxIsP8QSJfXKx8mVEElqicMPwPMP2PjMoyYodjRJ+8cFdI1aEiTjgJiqS6222yLfgIDIFOuxavBcSY4iBD5aolik5X0GRlREuraS7PpiZxgss7V3swmNorYclzCd5TQq5LNDm81DPyJ0mV3jvMmzzQOxHZciU/i2ts6h7rFIZsS1oS;
	24:n5B6uC2o7t3i+6SlN6mwFXvJQNyF7ATlgGn167HrNQDuwUWYVmwnvKaUORRWko/WVa0H7BGFUje6A7sYBirZASYGk/S5b3EKZFdo4u9w8m8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	7:ufjyIig7oljuCwBbGjH74VZOIyr2ie1tUY9SbQZ2KB3NumWsgHpQfUs9+qfkNYjiA+hHyDRCPgFEhcWq+Ogncu7ZW+dR3EnbagH/+83mPTVQvNY9Uw6I6rj6Q/RX9KfLXxy1h0LYFseZMVKycRPKVawGwl6URMxgMre0nAYpvKzIVeHG5HCoypj3Gf9+pDSgp846UaQXF3b28Fccwi/71RzKPXjtVZOheW2V/RZD0IYw13GKjIy+5OTJZnQQ1AmSTYFKhN6zNeo9JPnnhZOi/aNAukDCKZHFiwLuUgB7NvLv97CZ5+QHImjOLfzTh++w0spupOEa3tb3CvTuPHhdmwc8p4sdwvndJT/HGQBCKNWuEewW8qP/Tryo7Ektukielh7l9aHK62NL07gedcv3JU97onATS0ggLAhub1m38Fr8hk0R/+Ez7x40MTR5QNbmJJNcsO+1YPujo/M9FoXQT2JNKtIQu0haG4Tetr5dRsRUiBYiV5+mnucy6b9f3NAPLcL+1r+K1hfbn81wUvRKBU6AaWGCf9IIKAGVAW009J1jNEASnKJu7e1m5U7/gOWaHUYnUSDfGk1H7a3IEq7OCuqdQe0BWKohuepHFS4vVKejXiWHydk+aBgUxrNORieG/TDjbDHQglepEGHcJyL15QG3/Upx0neBN5HmS3nflmBOq0FyIAL82Z407oWABcTCl/VGv56nlEYPCOto7Fl6uQiBEIHmz/9MpcYAYqqpK9dNs5x7601ca3lbruVHgZVeH4Nqg++viaPs8m+fiky7MQN/8iMuCstspBnL6eNxHYs=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2017 18:37:10.2217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2930
Subject: Re: [meta-qt5][PATCH] qtbase-native: Fix qdbuscpp2xml segfault
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
X-List-Received-Date: Wed, 12 Jul 2017 18:37:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/12/2017 07:50 AM, Andreas Müller wrote:
> On Wed, Jul 12, 2017 at 3:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Jul 12, 2017 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> Is this meant to be applied only for 5.9 or are you seeing this issue with
>>> 5.8 as well?
>>>
>>
>> for 5.8, i havent tested 5.9
>>
>>> On Wed, Jul 12, 2017 at 1:13 AM, Martin Kelly <mkelly@xevo.com> wrote:
>>>>
>>>> Thanks! This bug has been bothering me for a while now, and the patch
>>>> fixes the issue for me.
>>>>
> I think the patch does not cause trouble for Qt <= 5.8 installed on
> build host. It seems that 5.9 for host is the crashing combination.
>

I don't have 5.9 on my host. Specifically, I started noticing this when 
I upgraded from Debian Jessie to Debian Stretch. Jessie had Qt 5.3.2 
while Stretch has Qt 5.7.1.

> As the author of the patch:
>
> * I am aware that removing this patch causes kde balloo build errors
> for cross 5.8 (current)
> * I hope moving cross 5.9 (future hopefully) will fix issues properly
> * the patch seems to do the wrong thing: it causes dependencies on
> build host's libraries
>
> So
>
> Acked-by: Andreas Müller <schnitzeltony@googlemail.com>
>
> Andreas
>

