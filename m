Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 934 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 17:39:20 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0058.outbound.protection.outlook.com [104.47.34.58])
	by mail.openembedded.org (Postfix) with ESMTP id 0386671A36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1u2kawi24ivz9m3xi81g+VeYLTevaatg0bYRcblhspo=;
	b=B8XJXQ1qFxVpL1AI0FDW9LNajpUvfjiWJs+TFIKLsP1h+QXaMYPnxJd9SqwI7XjDBk9PL8x9NvQQQFa+0OXrNuZ3HYdi333qLjsqtpBtCrgVHWwwZeSEMVkxtvb8HQjPfxxudPEHrHVvYIILCKqKoP5OebTS2AJ288e+X4q47PQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.218.12; Wed, 15 Nov 2017 17:23:39 +0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20171113192711.12926-1-mkelly@xevo.com>
	<ed834096-8445-261d-3989-d97746c53ddc@linux.intel.com>
	<a07f0309-e598-0188-58a6-8592fdf036a0@xevo.com>
	<4f3b5824-0625-ad62-95fa-8b1fae4a9c24@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <9ed55462-72a4-9f94-eed9-ee8a1f798970@xevo.com>
Date: Wed, 15 Nov 2017 09:23:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <4f3b5824-0625-ad62-95fa-8b1fae4a9c24@linux.intel.com>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR1101CA0005.namprd11.prod.outlook.com (10.172.74.143)
	To MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60261ed8-00d0-476f-1fef-08d52c4d9d6e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:5T8/Vh0OgENwgM1ouy0noSNKh+6ytBHZIls9Gb8WJRJIdI21bhtHEvCvdDbfMDyDbxqxeyfyag4UOrKbJzTsWjqfRwoNwgyGPeNnQXiYTje7dpTYBP+oMHTPKHBKnTX+kJq+58OgkOEE1pyFtpxuuSjjMA8uugzD0hBEidx+AhYdLR9o8fB1BTWsvjzxUc9AeXWTn1wqcqXlMmvdlxS2dZ77pvG8JFgYo9RYEG8VaK71djlqsCl6W/+ZBB06jiWs;
	25:mCuGJOpuJKnHh6mP6n1pX8S+PonziVFrV6xPXWO496UQvMrx74NGXGuBdGw3WwC2LbtilBBIxrLXhxfLZnxJiI+GErVB9fk46v3e1uKt2QIg20Rz8s68Ho96huQsopaDkh/HwfbrV5yth39eRkx7wyMFYXHQk589/uk3DXlEuvMLfL4Ek6Q3EtcsluQc7M10ZUPOa+AgFINYghg/n6u0wOHseTXHMTvu3/+RAGCIrWmdjSGJFYN5yHngHX2O1NvatcJ9Xi7MaPjphU7IFG7N8ULEWf7yRrhONcfC1AGzmM/STvLfsAUDxJ7OWov5sSqDRUqzNYE33EUKmHUF5OxalQ==;
	31:PBs/6YUNhhIp9lYRsbndEkauq7Of4J06h1UJtYuMjb9nKdbsC+X7EuMj6TJcwH4zc0kZmj9LFosJtNwQQL+eVv6NsDC6TMwiXfg6+SqkxxQIa4axCbnSZ5ln1ojvlnmBoLapNBwu5I8bMtDq78sRmyZB7zgRkHHmx1wRVdmnYnVZKqca3SvazVEThGIGAlfeL6uutizWBqI+tLF+YTt8h7aP/ho7hLoIsGlVpX3iK0g=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:ZwGcLvEsiJDBBhYFyjLyrpB6SCRgZD5grrw1kDauQAw8L6fTXSf+ZuOB9Pz+oi+6Td4f6yc50JmtiuORFN6a+T+E8WeTL+9/2YZwdQBYO68kIpTtoTgFqGehhmwK7+Ty2eboS7TuRO784rxlQWRf5hQyrAJ3KNB/dSHcv+gDH74xB/kSmKkVUHWElzfLA3E4h/r3T6aQFEMKmJ6YOkWJYwqVXc0ZpjNyEEEZ4MN/m5ACSfioj+RZF9clcqXsIjPbGzZ/67NswMF8C/PGWnmnU5mQHGtjLdauCJF231Yt2Z154gmGYMuxAhJ2xTSPEJoK5xEy3KrEndfHGPbssaU3oNuzvB0zpom5Y5ZAy5VDxTC0kOQLX+Cq9ULNbWgNcj+/7iE0rFCZV9KZDGiVtzqBPn3PwznfgnogIEXbtrXUMMw=;
	4:SejefaktBcsFz+lCzkjm7n8y3wp+2cQVP4DXqnMb03IlWXehe3oubVS9P2TTzs4AuVyqrj8JzvIHJxSjgsTVg8oN3H98WlktTsfXdkiArpBfQKczd+4PDqhoU/ckw18B93cckPulwnH5jbXB5F2XoBIr9iKgnFosvFa2mYxCjmwDdm7ReFZQikU9rkNSe6gHePxllChfdi1Xjx/n/9njciUxv5F3qVm6HGkwHTXlueluxomaOtQNSI4+S/cN6fJUEQQXTZhANbMX8joU+Ew0DA==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29439E098E4EA28653C475E6AB290@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3231022)(10201501046)(3002001)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2943; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(6009001)(39830400002)(376002)(346002)(189002)(24454002)(199003)(7736002)(93886005)(86362001)(47776003)(65806001)(66066001)(65956001)(2906002)(6486002)(77096006)(90366009)(68736007)(8676002)(189998001)(81166006)(81156014)(53546010)(54356999)(50986999)(76176999)(305945005)(31696002)(101416001)(97736004)(33646002)(16576012)(36756003)(25786009)(106356001)(478600001)(58126008)(105586002)(316002)(83506002)(2950100002)(23676003)(16526018)(3846002)(50466002)(65826007)(53936002)(6116002)(6246003)(230700001)(8936002)(67846002)(117156002)(64126003)(5660300001)(31686004)(6666003)(229853002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDM7MjM6OFR3blA0dWVzdERJWlowK0J0Y3hneUJy?=
	=?utf-8?B?NERwVEhxcGlJS1lDTWxpOGpBUFU1SENNRVdSblRCVXh4cHdiUzFNRWRVdDNx?=
	=?utf-8?B?WlU5YzdxSlBneEw1dnk5RDlVRUZDcDhzYmNvN2toemFEajFqa05LM0djWnMv?=
	=?utf-8?B?UEFTdDJRdUgwUlloMmdEOVF5MWM0REJxc3MxVWZFTlVtK0dpRFNUcmJsNFZa?=
	=?utf-8?B?WTY0ejQ5ekxIcERSNUxVSGlzNzZLamVuVk85MzRQM0pQZmdWT2oxczJWVStE?=
	=?utf-8?B?WFBnUmtqU0JYY3p0TGxXZU1rbXlZZWhCdVNYdkRZM1VxMGhLZmg0RmtvTjk2?=
	=?utf-8?B?OHd0YW9Rc3dNL0graXZFeUcwZVIvUWxhOWI2bzd0K254V21RYy80dFpUSXNP?=
	=?utf-8?B?RkRHWkRlaUxmeVE4MXluS1R6WjFXMTkxQ0dZZ2RoczRocGhDRXNWbDVtNzVE?=
	=?utf-8?B?UmdpbGJsNzBXbXI4U25sV3JRckhrWEtHUDgxMlZwOU1VWmY3K0JSRm5WSDU3?=
	=?utf-8?B?TXlBaTRiYytEQXkrVElTRWFEeG92SFdrbHpER3lSeHM3M21CSzRGV1Q4OUpL?=
	=?utf-8?B?Mng3OElodFJtV214Rm53VjduTTYvVHl2S2JkU2t2RG1oaW01ODVzakVSTXBM?=
	=?utf-8?B?c1JuakUvOWQ2NnRxSWFrUWFtYy9UOE1meW1HdmFhcldReVMwRTZBUVZidW5K?=
	=?utf-8?B?cFFqWS9CdjFRSEJmVnR2M2o3cWxGRVlGVTdHYmU3bUNUd3dwc3NqWUY2TEVs?=
	=?utf-8?B?ZnB3UXJnbVNxN2dZNUpMVDdHK0Vkdk9qdHVjK3ZnNEMwYTdwYkdNQ0JvL0I0?=
	=?utf-8?B?bVhISW9NakJJS0FncmFmNGVPNjJpZFd3eHpYbVhkSGJVbWVQVFMwT0h6N0Rx?=
	=?utf-8?B?NzBZNC90NlVhTFQwM3FzMzhvaVRFWExLOGsxVmNGM3pXQ25LSGJMNUlSdWto?=
	=?utf-8?B?QWQxYTBrcFVDUUtHa1NIUktXZEdmbzRpVlVvZWJOK0NoTWdRK1ljNVNpL2Jw?=
	=?utf-8?B?cmdqMnY4QUJiSHFqbjJ0MC9IQkVZMzI5Uy9WVzVGQUpvN1RFQnNhWE9wSVU4?=
	=?utf-8?B?REo0c0cxMmVjazlzaGNlZ0xTMFUxRnJycE44Q0tzUTV4cHBnaUNacUZObFMr?=
	=?utf-8?B?cWxTV0tzSjFiUnV4ZzJCOFFHOHFiWGtjN2NFcno3NzI1dXM1ZHRrTnVBOVZ4?=
	=?utf-8?B?bm41eklHWFZFVlQyTVVvREcvQWI2S1gySnREZ3l1NGVUbUNmUktOdEtuSzZ4?=
	=?utf-8?B?QlZtN0RKbWxoeUk3TXZZTjJLZWFlb0xKU3RId09pSUlCN2JVZndyTEdMQTlW?=
	=?utf-8?B?ak0wTjRMbGs5SWljQzAyV2hTZFh4Q05aeWtPVFl1eWZNN08vd0NNcUpNN1FQ?=
	=?utf-8?B?ODFuRzhsZC82OGlEOENOWTRDc0wxbVlKUWpDKzlEMUFZYllCSEhSMUhRT1BY?=
	=?utf-8?B?ZUxZRzI1SkVYbXZzRUhMaXBhWXU3R0hEck40cDJ5c2xNUHFMMldXUDFDL1No?=
	=?utf-8?B?REtYanFsaE1pQU9iRWx0V3hwQUVSNFliQzExNndKV0hHRFR4SXFOY0gxeVlQ?=
	=?utf-8?B?a3gvam9JZk41alRzTFRNc3BwTWo4QnZuQ1ZGeFB2NnVCd3RkSnQrcS9IbG5O?=
	=?utf-8?B?eHhjSmQ2ajFqN0JxYVQvUFlUQkYxVHBCSHZFMi9uK0xxL3JqeVdZR2lnTVFU?=
	=?utf-8?B?Zmp6b0t5UkxMT1ZkazhZY1daOGhqaWd3QVhlZUZ4RndrQjRnWUNDWUs3SGIw?=
	=?utf-8?B?NjFNNWw5M01MY0tQNEFlM21CckljTHFTdjJBRDk5YkprQUQ1SFlSVHN3bWts?=
	=?utf-8?B?eWp6OUtOKzc4OUlPS2NUVy9aUUI1YkhNa2llNDllTkc0VUQyVnRZbFRQNFQ2?=
	=?utf-8?Q?9NptdqBM9SavE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	6:QckHDXbKAy3/VPprYCRCjrW36v6G2LT//R/XLwlfKfNrIdrdc9ulD71Bsj0KNzdIOEJsqGsyPBeCMECdObRphoF8dcBRSkXy+/VH9jIGkjwHZLQKryav8c4IH3ORwCNAoiG4xWVCzD3EqA2yOxD6UD/4gdCboNBG/pReXWpkn5We1D0n0nOYRmT/oeAGrih0Y4Y7XEBxBwc2OMuUpTFp5K8E/T5YmVipVaqqPGyNG6b1l/u/b4jNZnJbDq3noFxjtQFZh7PR/XtzB7+5LhjkY1ycpawx6kZ1JO2nMnh9hHufPk5YMrXKlP59zUgdGxRy5j6dVlACFsWzEoIPIvKEDdaG8nKR+j5Lg0mKGkY3vyw=;
	5:7kO/XEFgl+hdvgHRse2pfV/RmqhUdii5FkexoGJzOleyMks5B5udVrKkuozr8ktiWhx/YwUfEUku9o58QRSyYDxgbxc3fBsMxDW3H5C/AJXLccA4hNxcJ8ayS3d5f0xKyuiWcsjUQSiS8PxiNGpgWGtEUvJtuVGnPXFupVvO0oA=;
	24:WBvEpGhByMPcXieTPqXt10euOuDn74HXcyYiG5NAsuWkZJwXipLNQq3QtYfS1xfB2GVo7e9EXJ+faIEsSwKqYsxeMIUOumvkU1HAL8rltps=;
	7:LRnfF+oRHwt6aIj12j5mKDlddIAdscCi9itscsIeFg8lBMLsr811rGubEFZML+0kraG3/e7a49MN6FT257gY50Zg1i7Tlgr7Y63c9WO/EXtFE5kLNhWeYdPZdrJ9HlLzbkALYYzGZ8BJOJVMyFnyjOvFW4ZtsPW8WvlRhkvp6tmpLJUUL22GhOBiA6wX8DnV50K0t4pPQP8jFlJDayri9t18oqpB2whE78QL8/DtRLCG46NCUMfKLOKTKU04f8f5
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 17:23:39.8449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60261ed8-00d0-476f-1fef-08d52c4d9d6e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
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
X-List-Received-Date: Wed, 15 Nov 2017 17:39:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2017 02:05 AM, Alexander Kanavin wrote:
> On 11/14/2017 08:23 PM, Martin Kelly wrote:
> 
>> For native builds:
>> - Keep the defaults (which use native tools), but export 
>> PKG_CONFIG=pkg-config-native instead of pkg-config.
>>
>> For target builds:
>> - Set CC, CXX, LD, and AR, but *not* CFLAGS, CXXFLAGS, LDFLAGS etc. We 
>> need CC, CXX etc. so meson finds the native tools for its build sanity 
>> tests, but we don't want to set the flags, as meson will slurp them in 
>> and apply them to the cross build. Note that even though we set CC, 
>> etc. meson will correctly override them in the cross file for the 
>> actual target build.
> 
> Thanks for looking - can you make a patch for these things against my 
> branch in poky-contrib, and send it to oe-core list? I will send the 
> patchset any day now, and there will be a corresponding patch to remove 
> meson recipe and class from meta-oe. So now is the good point to have it 
> all fixed so that the transition is smooth.
> 
> 
> Alex

Yes, I'll do that.

