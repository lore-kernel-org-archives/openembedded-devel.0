Return-Path: <alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id ED40570018
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 17:43:22 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vA8HgqsI024894 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:43:23 -0600
Received: from nam01-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam01lp0112.outbound.protection.outlook.com
	[207.46.163.112])
	by mx0b-00010702.pphosted.com with ESMTP id 2e3mjvf22e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 11:43:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3/q69DgyAQLtKLu9+gtOJ6xWF6y6Ig3ireVVibeJ5nY=;
	b=f5r59o9cwAGO5KxJQk+yPoiqcK7YpDGvcztlbqDqwzDth3Sp5Fa6h2Qe7CY13MoZsle9yD1ULEjOkmOOIbEpEeS5SOL9EvP9K9DPhDQ1Cuz146zGjFDYHYzA33XBkBdmgJHRo6oz69+rBEv9NJ8TpE12QegX0TkScyNrGl2UU08=
Received: from [10.2.106.81] (130.164.62.200) by
	BY2PR0401MB0965.namprd04.prod.outlook.com (10.160.64.149) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Wed, 8 Nov 2017 17:43:21 +0000
To: openembedded-devel@lists.openembedded.org
References: <20171024192754.19623-1-alex.stewart@ni.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <34e1dd1c-e88a-7891-dc26-745946508deb@ni.com>
Date: Wed, 8 Nov 2017 11:43:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171024192754.19623-1-alex.stewart@ni.com>
X-Originating-IP: [130.164.62.200]
X-ClientProxiedBy: DM5PR12CA0053.namprd12.prod.outlook.com (10.175.83.143) To
	BY2PR0401MB0965.namprd04.prod.outlook.com (10.160.64.149)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9494800-d58d-4b64-8ee1-08d526d03449
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603249);
	SRVR:BY2PR0401MB0965; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0965;
	3:wqrfEyhRVR4Ue8HIBzwyDNfOQ4g8fHrdOyebZ069YhMEi9Jo67am1+ZZptQtctP1FK0roEYNpzw5XJ94VSHrMIVruxdzSfTrVVpCXHK3CzRbD3r6HgPLDTOi2BvDILE04qmIeFkIDIJ/CmQUfC+Xs0wG2peU2rMOu/KiAqb9lSusJtiBZT+Ac0hEw/9M78QhpyKg/3fY6lUVZUnPXUqrIL2LmqqL4vy0n8m41ZYPqEqfwXz122xlGZYDOZBzQAp+;
	25:ufJs0yOKMHDB97Z+NE410Dyj6m3Q8OHoS0YI7JOf/7ofov8oE0eKrotu7BIq9X4DuNgzww95O1ZJcSuRp41KFrPHf+E3YU83XRt9/xOU9xQIBQ20TmRo7CaB4EnZVEieMVAys33YBikJronl4v3697tcXkNWBoDhSZCiuMl0/EcghXNgM/UJaZbjg1//zp4Tw6bJz4EaJ272H7kAd190TxuSOSyfEo0KoC6vVHO+DG2cum54B2/LHVQYpboabFeAQXLC+hUlr892THT1q4Bvk9PciE6/1K+epE+1SGX+Jo03kBgRE46VyFSalLN4hdiJI5+CZ2uoOd0+jWDn/icLXw==;
	31:PUqnmJ04K9cnPL7a0n5nNk+2BNIQ1hO3t4E4Y5bszB5ii5FqQ00SMkiE3nzz3GCDQvnyamXDRiq9uYDVsd6Ix9QLEwV8XKkfQohaxEeOuDqBVtOl/sLwYwh6jV1y1dmaNUc2QJpMpvFcvKUCCYVZCwo8RsKNPMlMsIjQmSlQEnIdIJKb2X27Q2zixpsUM5+dFQ0jSoASXXSY6UrNy2VkbOZOoOYH28bFrYAtCWmQlg8=
X-MS-TrafficTypeDiagnostic: BY2PR0401MB0965:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0965;
	20:AFaI6u6m38Aqg8iqMf5RkS8z9KgocPWAijnfRcTowobxxsJsOxoSeLdTfYI+K7lXodc2rfoK5PpSExG5GPP49C7JiZIigf8ptEKbA5Yg4IERWdM9S66tdTg5GGMAnYFabT1oSSjcDjn1Asd3LZ5oMRjozdndfAKsA7zgmGEC2QOTuasl9IH1m/bP5oUOKO4BvBc4J76JVcArCLDdM+hzDgtSwvDOZ8QtvTIYBUYJEYA9CzgPDa1wq80ClynfLYX41xNjJX1+IsHO+DmLoB+wE1XYH7TFjjIvDKMx8pZYKUxC68gsqeUPQL+IucE7BKUegxBx2HIKcmzNTYSEUtYKqJ+KK8U+zvC1yQZ3nop1CzWXU0O//pNq+dQmyJ6g16HPEZZCzElgrYC/e13n4C8Nk3JwI2p4j61R0bzqhwd/zs5BW2bdnrwfhkkkmXV9oWyHUxnEa4TO0dLaQuSe7q/v6kO23ur0giM637+DGIZ65cvTzI9wYosy4YHrL/B594L307xZHXMtp28QfJ5Y+0QQAmYhLAjpx4NvBnLE/MX1tBoBPpGuLKdSXLOYLiH19xuIXW0jB0T7u5GZkdPG3TstT/vMpPGaOHt75dMHJwOdPmw=;
	4:+/ADjZLFPm93udbOvppcWP2KQisVuXI28EAKlPqO9wLtkBKogHks+wqWlCesF2N/WKls9b+D2mEHTtGCqzW+6owu0u1zpKXdy30f88CLzXSkstQfTD8EF/FlUd/ewmSBGWjHPwdGOvfoKr6bTJL7OWFEHx7AbygRKu2VREnth/bXEBdHSHdspsSRSdYA+1cjmRSP+7NM8MmntmskCiydBkA1CZ7bCiXogw2SEV/dyQhqExQ3qVsNrBY/U1ubGskGpzn3uX2uSzxhFUI++9agqZbCQGKSnYAEW/XXocxKZPUz0GK4szKXDOs0+9+diZZD
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Microsoft-Antispam-PRVS: <BY2PR0401MB0965E8580856069B6003C08AFE560@BY2PR0401MB0965.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231021)(10201501046)(100000703101)(100105400095)(3002001)(6041248)(20161123555025)(20161123560025)(20161123564025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0401MB0965; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0401MB0965; 
X-Forefront-PRVS: 0485417665
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(6009001)(376002)(346002)(189002)(199003)(24454002)(65826007)(54356999)(316002)(101416001)(5660300001)(6246003)(2906002)(50986999)(16576012)(76176999)(6666003)(6916009)(36756003)(53936002)(4326008)(230700001)(106356001)(2950100002)(31686004)(53546010)(58126008)(105586002)(2361001)(65956001)(305945005)(90366009)(77096006)(66066001)(47776003)(50466002)(65806001)(478600001)(6486002)(6306002)(575784001)(3846002)(7736002)(2351001)(16526018)(23676003)(6116002)(31696002)(68736007)(97736004)(25786009)(67846002)(81156014)(189998001)(86362001)(83506002)(33646002)(8936002)(64126003)(229853002)(8676002)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0401MB0965; H:[10.2.106.81];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjA0MDFNQjA5NjU7MjM6cHo0UmNueW9JbXBsZTlvVkFRV3F0M1Ur?=
	=?utf-8?B?UVFlNjV1ZTJrYWM1VFAxOWR1MjFNQmdEeE92c1pUeHRadnJQMEZDclFBbE5z?=
	=?utf-8?B?QStaWmw0SE1kMVNtYkYxUmc1eXgzWUgzWDlQT2VheXlQSm9iRnBDYWk0dVNy?=
	=?utf-8?B?SWZiS2l6SGtFOFZ6RVFPL2w5UFdoaVUybFp0UWtGaXBRRGd6eXhJWTJOTFdF?=
	=?utf-8?B?M0RsNHozOEU2SFZKMGt5WDdvY0ZNVmlGU0tCRVU5ZWlobmRZOU9aVFdqSzRu?=
	=?utf-8?B?a3dMcW16WjEvNEUvT3Z2U2VkSlp5TGQ3ZnpKb0FkRHFhbGFENm5CSVA2aVNY?=
	=?utf-8?B?Nm4vMmppR2xwcTNpMEhWNmFjQjJ1RDJPYkxIYm1WS2t0ZXBXSFp2U2N3MEJl?=
	=?utf-8?B?NzRGY2dFZWVXdzVFczd4V3RMYnFLeG5qcDJ5K0hjcUFpTHoxcERBaXh4N3BK?=
	=?utf-8?B?Z0plcU1neHhzSXpkNXcrck92RTZ5QzlTR216VGlMNm1XU0NpTGg2c2ZQZlIw?=
	=?utf-8?B?eTJIU0t6Uy9NZk5MSTNpRkxyZEhXR3Jqakd2VTNuSXNUMFdnOUg3TnliOFFu?=
	=?utf-8?B?bDVaaWZxVXpPUG9yakpkWU1pbHpTWnFJT29mT0s5bG1ZU3FIUXRtL2UraUpF?=
	=?utf-8?B?NUwrZkhJVGgrWEpERGZNY25STlp1a0JSTGsxbzFhNjhySjZDb0MxVzZFS0xK?=
	=?utf-8?B?bDVyVWlVMTVKQ3lyK1BCbTE2d1NxZitiUXFCS25kL2hQbGlkb0UzMzVSWW4x?=
	=?utf-8?B?SGltT0d4a0dPNUhLdnF0OG1ZNE9kSkZxYlI4VHdqVkkvK2ZZVXNtdGdva0U1?=
	=?utf-8?B?ckxZMVFReW5wRjBlczBkMUQ0L3F0OVRsTHV3YkljZzVxQkJxbno1ejlOTjI3?=
	=?utf-8?B?dnZZem1OUkJwZ1VMaXZ2cE9la1ZHVlh5bkg4TmhNMnVoTWVTbkNkTmlSRFYr?=
	=?utf-8?B?aDRsV2RaMDNrU0ZBVWNVSTQzU3Q1TFpYRHJSZ3IzRGJxclRQVW5UcUcxelY3?=
	=?utf-8?B?UkhQWlYzZFROSERuTmJ5bVAySVYwcmNiWXIxZGRTY2Q0eHovSXV4ZndwSE5K?=
	=?utf-8?B?T3pwcFdPT3Buc2IvTExYbFlHSlRQZVhHenhSVHBhS0VnbmxNNDQ1TkNRUjlT?=
	=?utf-8?B?QUhKUzFhUmxmMTRLbnczWWN2c0xwUURWQjZuTWNZdEJFOG5hekJKNklqczU4?=
	=?utf-8?B?blNtQjRXUHF2UG5qQmcvZHVxTU9xb1NkQXErQThHaVZ3UVBHSGRCOUdrVkRC?=
	=?utf-8?B?QXFvVjRodWxSQjEvN0pVUVFWN2JXclNxQVBiSHFkVGd4S1BBTDhmM1R3UDNP?=
	=?utf-8?B?RGN6dU9ML1BZRUMyYmZoVkNKVFdQaE8wMXZwdHBrcW8vYkhXYjJIM2FYMFFL?=
	=?utf-8?B?dmcrMTJyL2ZJdWh5VDg0UHZ1Wi94K1lYU2pmL2lrK0dlV0Joa1NucjNuRE10?=
	=?utf-8?B?L1MzcEFzUlBGRmlZTGRNMW1OaTlmZllBU01YVVM1TmlBZnZuQk1QekFnNnpR?=
	=?utf-8?B?RGs5djFZVzkxTmxFSndMMFdpT2lWbU1HcUFJOXE3Y0tIN2pJZ09SSEtXMnlG?=
	=?utf-8?B?K0h2MTMxTHpzTXpDa3ZhL1BkRGtzY1B2c1RyMjRCTnNaYjU3dGFUM3UxTk1U?=
	=?utf-8?B?U3dodkZGK3VhdE5yb3FuZEc1TFJ6Wjh3NVIyMmpCTVFsdjdLT2F4Q3REUjR4?=
	=?utf-8?B?eFV5KzlpS0ZzS0FmZGRROW56Y1ZJQnpzbVRyZkhBa2NZRmNzcFNPQ0dFQ04y?=
	=?utf-8?B?anZuNlNnZWovOHp2NHJuNWV3b2YxTkRwb0hGeWlLcTZtUjVCa2JTMTM2RjdP?=
	=?utf-8?B?Q0RwelRSVkNENGVyQjlTRHNDb1NHK0lxVDBPYzNqYmpNejVxRDhSRHJNSy9a?=
	=?utf-8?B?RGtKT1I5WWJqZHAxN3pGUFpXNWtXZlEveEJLcHc2TENaazhDSm45RlZvckFV?=
	=?utf-8?Q?r6hS/VZQfg7Xe56VaXyjmCNCaqou1++k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0965;
	6:GSUdERAZTCwuOmA24/YByruCV9CKqBM9MtSiYrBfHsS7itKAuGCDzWQ+R45bpCDZHunnzWdtgx+40tU3AIW5PiJYkkO+27q/tAqU78RbgDWeoNfyOlgHrsQhIp1QtSIq341BxjK94wa+kkF6r7Jd+LebU3zBtXMwDnM9AJoxmvDjDdfeqLutYwEy0ugi4ou0MIY4FrzlLb6/hrmgyHltEtN/hhwO6oo03P4+59iFU2ixZ8GIIG4NlQvwdngfrVp/89KW1InT3P+54llK415NDOgpfJEfSVhHx8LWIe4uyLOVXNJP9aYx2O6iFHhzkl9WrIeRqtymnUusfxTyfPyisPGRGDaEvYRh3YTJw+eX7IQ=;
	5:PWzVtGN5lCl0um0dpS+N74iSe8Ir+kAvMo/TpOL07L6gS/L/ku8bBhhR63lv1julgdxA6B0IuwFICmCTj7ms6AShQsHLuuOtgEmfpyES6t/NHvUfbv20mnWdhUlGYq/lbrE/tZ8fPwdqfH9el5KRgB1KA6z+W+yOXPczxkiDJBE=;
	24:sZliCZc33eYTb5Ebdw6C2iQ0iM6SjXaGK9BPmzBzGayrEmehUNvAHUXI8Shu4QKWLPYAxbVn4XOW7SP7qeSrmPPkBu0+5if3iwZmm4vivp4=;
	7:WIzUY6si2l6Ev9EFXbDV7FG/ZD0k4ovSyxB3THCht/giS5CQFiVXHPiBvcyjGSbTi1FPzapYp75PgPobwrhI1DOA6UmDmpd1o/HvUhMOtVsrxwvi6WTByijkByURtL1SUTInA9giwfsdgVg0JRuvMBnxmpHkxuiwFemW4ayCHMOOkK0nSa5dWhspPJMqxCaDLW+xyAbYW9yD4E+vezw8xE+ca/4k7vXtpXTsR1vxI8qsdLJGZuPjMXTqj14FvA4h
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2017 17:43:21.1957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9494800-d58d-4b64-8ee1-08d526d03449
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0401MB0965
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-08_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1711080234
Subject: Re: [meta-oe][meta-python][PATCH] python-future: add new recipe
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
X-List-Received-Date: Wed, 08 Nov 2017 17:43:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Bump.

Is there an ETA on when this patch can be pulled or is a fixup needed?

Thanks,


On 10/24/2017 02:27 PM, Alex Stewart wrote:
> python-future is a compatibility library allowing python3.x code to run
> on python2.x runtimes. This package also includes the 'futurize' utility
> to convert python2 code to python2/3 agnositic code.
>
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>   meta-python/recipes-devtools/python/python-future_0.16.0.bb | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-future_0.16.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-future_0.16.0.bb b/meta-python/recipes-devtools/python/python-future_0.16.0.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..46f7fe50f6f9cbc7223e2dddfe2fb29815f083bd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-future_0.16.0.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Clean single-source support for Python 3 and 2"
> +HOMEPAGE = "https://python-future.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f457538b297bd0ef86564b8ac216ad7"
> +
> +SRC_URI[md5sum] = "3e8e88a2bda48d54b1da7634d04760d7"
> +SRC_URI[sha256sum] = "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb"
> +
> +PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
> +
> +inherit pypi setuptools
> +
> +BBCLASSEXTEND = "native"

-- 
Alex Stewart
Software Engineer - LabVIEW Real-Time
National Instruments

alex.stewart@ni.com


