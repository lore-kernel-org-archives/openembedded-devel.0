Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 1053 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jan 2018 18:52:49 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0070.outbound.protection.outlook.com [104.47.41.70])
	by mail.openembedded.org (Postfix) with ESMTP id E335C7828D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rWZvyZVVFh8WPEq3342iYzV4TkZx60ENXTdgEYhUI0o=;
	b=wOvpQH4chcR7ghj8RZJw049y698B5Y5eCgWX7iNbb45x/8pPu3FQHc3AKDwFs6DuCPLFGDO8V3ccp/XjIC8s7rJXvJMiaqzF+mve7T51C+wLc3zUn/GjZpVH/vvKo7kox3JAs2Tr5aHMQVwMTCz2/1tlVONxYrsDD8f+D/5slL0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.212.23.153) by
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Wed, 3 Jan 2018 18:20:19 +0000
To: Ramon Fried <rfried@codeaurora.org>,
	openembedded-devel@lists.openembedded.org
References: <20171228145658.24259-1-rfried@codeaurora.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <98b3c022-1720-8d6f-aee7-17a9952915ff@xevo.com>
Date: Wed, 3 Jan 2018 10:20:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20171228145658.24259-1-rfried@codeaurora.org>
X-Originating-IP: [71.212.23.153]
X-ClientProxiedBy: CO2PR05CA0053.namprd05.prod.outlook.com (10.166.88.149) To
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a8cd632-c7a6-4f48-3287-08d552d6a56f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:DM5PR0101MB2938; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	3:H/sw0fXUWlPSIrrWeEG/Mfl5G4fd/l187TdgHn2D8EFB5P5ZUsUVudcEtSgKmVjSLMCDoWBLG+2SmvSYva8MBxBVgs8RI2IEozp+07TThMsp1GNOrjMpLGLpw8baQ5/IGZ8J6pemBSaYX0SxjcWXw3HgScn1zR0FoR3jViaB9rIxbWfHpExh/WOBGcSQyNJz81dMUCz9PhENsTE44NMS9Uo9S3KFuhyJjR4kRKFSmgm86Xlv5wpETwwf8+YUz/eg;
	25:pZOsdZA+cgh6M154aUnFDdz6mA2uGT0MmoEo2oLZSGd6mxKh0v/PMja57AuSXeYw8ZXkIFGnDxHAJwjQoBGUHEw6FYXjH5zIGQnkHxGHyCvf3pIFnP1CzoxpqwmfPaGFTzGkQsEiRQK2qTD4JZc/Algmt0B6g2gJigX9HUxVdAMK7Txzda2i2u1tYHoJ8hVsT3yu7paeqGRrtsR8gGg8ZD23wngxSp51ilwMN5lFz6aupJCCPCrQmBA8cweDIPg5HEuywEiMlgCwc4M5nBpwp+XFZEkGeplSAkaKkTIlhuyNj0MC6foBpiv0A/0hUIlEjMNHfpN+SQP0I1aneoPjBg==;
	31:V4812caPEjyIh2ecfmMUZ6Urx1SbZTaEOD2xmoGLUsSHbCYuxP9IN7fQWRmDIJlIZG2Jrnjd+YLAD3yR545YVNhi16NXbUFrtRYpbjh5PFz4uCIX8EtTnX/Or7PuqC9YvMlw0zOUIIl5TpmxxLpWjhSHMbRxiD24zbgcrdD/zESk1j55XVu1ITPJUDxL0M1YU9UcCL5KMpzVatmidRPtLQZFSxK9ANrXetf2hDcJV8o=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2938:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	20:CfYFQVqBVtQCQ/Qyc8GJgfSvlg6G8eadZOhqnFVyVyYiF776GvOcY0aE15ood8UGpTluacKEnzJZFmEBCffy2Lf7POL35C+kHWeaxfMGpymdvv8LmQSGgBzUe7xYYNRBvHBtpRzsxdwwexyHWQUqxdeadYgPx9mIs6/iV7RraT2sOmmM5gsAlX6P9tIzOLlE2QHfP8T2b7XBU8Hv0OFC3EnlPnfOZCwIKn63+xlDrCd8vhrVLKGjm2QGhcWbjzXbE309df9YTw+dCJJCuDuefRpkayTq19x15yGkgjInnOVJfmyUlVDMj6zWo/wtvixa4vEg7YpurnQJcjXeP62YN+5Vztb6d1t0eklwkH6ZUwRZPrlDnR7VT40opELY/PCA9krTRkWTy4fXE6x3lmjz3J+YP+u3uNhCyYjvCw0AuH4=;
	4:ex2d24yrwR6uglXqA9tQ7kzi8BmyiLegTH83NK/+ZBY1nqGouGhGsf0P3/DFl/qciLXhC81gT2ahotQG8qaulWmOJTOZZObTte47rlAWSV4G0H3S3nHwaCqKjHIxLyPgtsRNH1UbR6k6xPRevb0JS4q+AEhNs4mgGqcAXAprxMI5Ghv/u7O41a4FN3yhWGZ4FIPNPVyEt3rhJweYfcM8nLwuUW6JHuZpxsJENiPKt8+Jr4Ci97WjNLN1C+YsIaFQLxcgUnSFrSOK6DfYHIqcLQ==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB29385046E0ECE7F0A1051F66AB1E0@DM5PR0101MB2938.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501075)(93006095)(93001095)(3002001)(10201501046)(6041268)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:DM5PR0101MB2938; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR0101MB2938; 
X-Forefront-PRVS: 0541031FF6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(366004)(39380400002)(346002)(376002)(39840400004)(396003)(189003)(199004)(24454002)(31686004)(39060400002)(68736007)(25786009)(4326008)(64126003)(117156002)(478600001)(53936002)(6246003)(305945005)(77096006)(97736004)(36756003)(229853002)(105586002)(6486002)(7736002)(66066001)(47776003)(90366009)(316002)(81166006)(16576012)(65956001)(65806001)(50466002)(8936002)(5660300001)(31696002)(58126008)(52146003)(106356001)(65826007)(2906002)(6666003)(52116002)(575784001)(81156014)(67846002)(59450400001)(2950100002)(8676002)(230700001)(53546011)(16526018)(86362001)(3846002)(83506002)(386003)(6116002)(76176011)(2486003)(23676004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2938; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzg7MjM6NUw2OWZSMzZhTzY4bCt1alErVjh3alpJ?=
	=?utf-8?B?K290QVNvVUNKMFdVak1WYy8yclV6VGxkZ2xGZFQwdW5oOEowQUJhcjhKYVNv?=
	=?utf-8?B?K0trYUVPaU1ldm92alY4ZnlNdmlKa2NlOS94Vmp3Uk96Q2t1QU10S3BVUmFh?=
	=?utf-8?B?WThEQUJqcDVlSHFhWE9PSUcycmtIK1IxNlZDdnVwaEExUldnd0hlU1Nmdk5o?=
	=?utf-8?B?RjJsVnIxa3k4aU9BVS9NclMwMVFzZVJ0M3BtbVVUaHgwNExJRm9Md0YzcHFu?=
	=?utf-8?B?OHF0SDZwbHdMVy9NaGlpbUZtL0ZPTVdmYVJJdE44VU1JMUpPVTEwRExHQjBk?=
	=?utf-8?B?NlpZY2xONEZ5MWdycWFUOEZNOVlFWUxWdmR4QTBlbllEdTVWd1gra01YRXAw?=
	=?utf-8?B?N3lsYjBCT0RMVUxiUUhSUmNRYW1JTXYyWXM2ai9BMnd6aC92Z2E3a0gzWWxt?=
	=?utf-8?B?bit4Y0wzWHlsb2pETnBBOFBkbEsybDlFUVNCS2lEMU9XbGhhdzNWUjdrWHQ5?=
	=?utf-8?B?VmFiQkF1SUo2REZxNHVqWGhRTnUyK3BtK2hwa0d3QUtQQ0ZhQ3Z0OWlobnhQ?=
	=?utf-8?B?TVFvaFdOWW5WazB6SC9FdUhDNWNFdEdPZEdvUUFLVStHdi90MGJ0eW5lOHMw?=
	=?utf-8?B?ZSsxVzhmTGt1cXhpYlkvTmQ5b2FORWZvNGxObG1LWmw2cG1sR1ZMckk4eTBG?=
	=?utf-8?B?VzhjZVhIelpwTlY2RVM2RlJvVktFVm9CM2wweU5GQ2R1WUFFVmtTWkh1SUNY?=
	=?utf-8?B?R095N2RHSkxMREdKL0hWci8vaWk3U3BmMTNCOEtFejhVa1V3czRCbVVESUJK?=
	=?utf-8?B?UGNvdFFFOFBQODdXcHpvR01BOVBIL2M1NUV3L0k3b0JmS0tpRFVkYTVtcFFm?=
	=?utf-8?B?MGgxbVpVVHd2a1V2c2V4WDJpRy9ub0RkQ1NqdlhuVXhKZE9lKzNMUlRqRXgw?=
	=?utf-8?B?UnVjbDFiQUZjd1NCdldMQlRLUGpEclYxaU5NVWg2Q2VGRXVXWXZOU3NQeUVP?=
	=?utf-8?B?elc0TWxSVmhSK3I3dW1YVEZmWDZaZzk3MFZsdjlBRDhIQXkxTmc1Yk1KMGhT?=
	=?utf-8?B?azErSEg1M1NYOWo2RnJEKy9EeU80b0JCTlNrUFlVK2t4UVdyVHE5MXhidWJM?=
	=?utf-8?B?azFQSlJ2eE1zR3hQQWloa0lTQ1hzbnB0T1lmVzJPRjRQdHZSMUI4YXExaEZ5?=
	=?utf-8?B?M1dNQ0t3VnBncVdWc3ZhNzVXcG40VWNZalBCQ21GYklwYjBjVXRGRmlSWVNB?=
	=?utf-8?B?SjBYbkVmNlZkcnQ5VlJnelhKUXduNS8vZnFROUNHb3l4ZzJveVJyb3RpcUFF?=
	=?utf-8?B?czZTSEZncmlkeFRLSFpnZjJPdXpZY2tlZVVRU2dveUx0SjR5Y2hmTitGbkc4?=
	=?utf-8?B?ZzF1RDZRRlV6QnFhY0M5UzhUR0xPK0hkYkVRLzRXallwK1hQVFJ3Y3h0Y3VV?=
	=?utf-8?B?MTl0M3lLdklpakFUb2Jyc1J5Y1NHbWMvMFZmVSthcE9Rb0lCQjRZLy9jdE4y?=
	=?utf-8?B?MGkzOTEwVjJwdWs0aFF3RGFMSm1MRWNNOU91UWpSaWlNdDY5c1g5d1h2TVV0?=
	=?utf-8?B?UHdYWitxTzhydmVBV1p5VVRvVU9WVzFTa1BJUTlRNVQwRGV3czd3M2RYZmZY?=
	=?utf-8?B?QlZIRFNHZ3c4RUhDNXVMSkMyOUcrY2N4eXlLSE9heXFlemdmamlwUUhvdE82?=
	=?utf-8?B?cnk0SHltNVNjOU5qM1N1RWlxUTZ2TnhudmlTdEFFNjFxZkdERkY0dXJYamJE?=
	=?utf-8?B?MW9PRW9yWnByR3krcXFDZTRiMDJLQUkxeHU1UG01Z2Z3R2ZxbFNSajluZGt5?=
	=?utf-8?B?b0NpZzcvd09Dd0Y0RVBxeENWNUp5NEs0QktLTEoxNlNRM21ST0lITzVyTlNK?=
	=?utf-8?B?K3JEVjNPK1IyNVcyaFI2ZmpLWkF4UVFzczluZm5icTVIQmpKM3Vqb2Fsejl1?=
	=?utf-8?B?dktpTU1ZdzEvOTg5YzFLMk9mZHJaY2p4U05DRGs5bTMwR1FLaE5rTzlycUpm?=
	=?utf-8?Q?mUmOEwIG?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	6:SvRwBvqMk5jbFfoNIRWSZRa43NMJTHRKexoe83I2+fueUy6xHQkz3cnIj7oN5LUmAQfF4zzHfpRTXA1YHfm9ux5EkcVJBFMczETfzDlt6lmp5/ZdG5sWWwXAfitoJFmjQzsg7II/elrCQ7NDKLbT5ZX6obQUkafaUUWPeR8PX9z8R2JBwb2BIsrgRJvkqe5afexhhahCJXCxdnzdmIOiOIzmfB15Mu9y93Ax+L/DDtMIOPPidYYNhk4oCCrTg31p73olbYYZ87BJgu8Na2EOZx13L+PEh67ms5hz9VimuL3pDMsrmkyWE4Q4mAiwnGYZVU5CwJu0niOg41EAnMDADkNAe5PElDJfbC++BdeXruU=;
	5:AqbI29j3P2pPdQCa7rDChTdTZwrB9OmVej2FMSEuDlmvZcSjnRlYCgBbHPOHBVfpG+9TUqp66JuaFYiUiUmp9GqwR3anHmHpJYjZDF6hz34gqxgIpQlYOU9sDqLjX/gudbrlmN3ZPe8BWqj//SWXPGGbWFiC7GuVkWsHgMsJT38=;
	24:IHozJc2Ec8yZ/Ks8Q2Vtf8KRyU7D67b8sK0kha+luE8rabI1CP0bDIPk7VVhz+jIUeZC2kMQMbLs52GgeiNWZ2gu9Kc3cHZ41o0yIuC2kxE=;
	7:DAVAnDs/r4VDLK5tnJCZWKHqOidbyX4a/9IbwuNwtkaRiNCFImaw83UjDeL7nQ/89xkXg4GyH6vqYN1HjglZUb0DMv1WiAr1/MAj/bRYcsAfWQhG8uqDHMMUUiwI9unQKZT0QGqlDHSUswTtbDBL1oaXzVYIm54y9ZwiDRjAOqB/XK6GzyidmfrUBdD+AF5u+Q0/xApZCU68n3OwP30TtNcP72VEwwIdyZyVE2krFmcknzbZffNm6CCFp6FsQsb4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2018 18:20:19.2612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8cd632-c7a6-4f48-3287-08d552d6a56f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2938
Subject: Re: [meta-oe][rocko][PATCH] gpsd: fix /etc/default/gpsd ALTERNATIVES logic
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
X-List-Received-Date: Wed, 03 Jan 2018 18:52:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/28/2017 06:56 AM, Ramon Fried wrote:
> From: Martin Kelly <mkelly@xevo.com>
> 
> The ALTERNATIVES logic for the /etc/default/gpsd file is broken,
> specifying ALTERNATIVE_LINK without brackets. In addition, it refers to
> ALTERNATIVE_PATH, which update-alternatives.bbclass doesn't use.
> 
> With this patch, /etc/default/gpsd correctly gets a default link
> pointing to /etc/default/gpsd.default. Currently, no such link gets
> created, and gpsd starts off disabled by default since it's missing this
> config file.
> 
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> (cherry picked from commit 194f855b44319c7834ba11e6e0a77ef279970a04)
> Signed-off-by: Ramon Fried <rfried@codeaurora.org>
> ---
>   meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> index f8e6a2b13..47fed2d97 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> @@ -129,6 +129,5 @@ SYSTEMD_SERVICE_${PN} = "${PN}.socket"
>   
>   
>   ALTERNATIVE_${PN} = "gpsd-defaults"
> -ALTERNATIVE_PATH = "${sysconfdir}/default/gpsd.default"
> -ALTERNATIVE_LINK = "${sysconfdir}/default/gpsd"
> -ALTERNATIVE_TARGET = "${sysconfdir}/default/gpsd.default"
> +ALTERNATIVE_LINK_NAME[gpsd-defaults] = "${sysconfdir}/default/gpsd"
> +ALTERNATIVE_TARGET[gpsd-defaults] = "${sysconfdir}/default/gpsd.default"
> 

No objections from me.

