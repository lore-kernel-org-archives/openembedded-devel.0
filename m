Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 101537 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 May 2018 23:44:12 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0062.outbound.protection.outlook.com [104.47.41.62])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9D77514E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 23:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BYaKozOp1FBMAvsFTTAwiGR8RehVeuVCiRNrGbMNKjE=;
	b=f6E2E2JB8MKXnNsppLsXATicmNq0w2Tp30CfPUO+4jMdbFDBx3qGp8ClRF55r1x7BWJ74YVG9V+AFS2C+s1AOlrUvyGsFzuwIpNkHy4yJX52yjK/IqU8llECCbRIGJltUY5qQrpaiSepa6r9bTZLOAwMxyunTmQPZ15Ys2HEvTg=
Received: from [10.156.22.30] (205.175.119.193) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Wed, 9 May 2018 23:44:12 +0000
To: robert_joslyn@selinc.com, openembedded-devel@lists.openembedded.org
References: <OFC304E1FF.C64CA001-ON88258288.006EE4FE-88258288.0073C3D0@selinc.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <5119af28-2811-83b7-d913-46c5966fb1dc@xevo.com>
Date: Wed, 9 May 2018 16:44:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <OFC304E1FF.C64CA001-ON88258288.006EE4FE-88258288.0073C3D0@selinc.com>
X-Originating-IP: [205.175.119.193]
X-ClientProxiedBy: MWHPR03CA0002.namprd03.prod.outlook.com
	(2603:10b6:300:117::12) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:2id/k661jUpRuCnbLWaULnDlBNunypvK3MOeQmNJyHw6h5fdy9C1cOg04dmDwXGZ1c6iJN2GEa7oEYGlDA1KpzOHHsZptncuCVukOM7sqQWLCKVGsg6XjgnsAxW1+EFhLKqdskjX+sNvIbZGF7G2nmx+TP7prWw2TPkJRdDuZGMnNnVgwX9CYj6iJ81E43gD3qeVCUmqGxW57bsopiSQ99J/5TCZ+EKIW3yRK31OYZCwMhqFSM5wncqVZodM83jP;
	25:Bc5WVkc5Dg5HryU50IHzxq0x19dSw2vedluO0JKuJ2NTY3q66e9NUYyliPwceE1m3dDMxpCpDgtEggCE1MPgzmQRAkm8XhV004EMgTLD8ezAWPZvaSqAlB1V/D4qhdXfdgbcqCNg5kp09DvMBST42OcEjBJK4WrKB3ybvDydiz4sfHUBxDFWNIEQR9x5345Cnt2CwfDE2tELRZFdEUt5LUk88NUrMEHeg5QLVYlJ43SIPmvfEfVUmETQmZ7QY9kkNYDJR8IxNNVeOAhyPgeBF05G0mc48dmtLdnKnnPvg1GANKxdqUVTtu2co9tSQI4fQfwLdIWP4qt/hvKMJJiAJg==;
	31:GPu3QNufisDb5YyFUIVt2mThqqAlOqJ3cU8pIccsbXH9ozGPp2byY3HRGGCb5SXTtj9HiWO8EZG3sZ2jAeUupcfd/f3kvlS4HXa0TRCeeXvQb41iipN3VTfFWlSZRj/20mrHHkitnnlVOF9Mcl05sNcsp+kWLrGke00hrGtbEbXGjdSVvOIhP8tP3LVBXWq6PS4G5W3V9H9o3FHQTTyH3sVxkZsYbhkEBJysNoTKEPw=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:kIkDkm9CO4TNNVgqW9rchPC7b7MX983kysi/JJzCdDT8cmZdqVPpdIlu+1z5wk2M4t6NEJ0r3LyQ70IcrT0KMSk9ExlOyNsUa71ouySTqeAnfJhNO7Drx/s4Z4ZG/i6QG8fHuwdc7AhmNTLW47HYL1zq9kC5wq8pgjykB65G93sBgLUaSVLbFrmE5pOZSDffNs/6i3A+Q7mqa50T6mihD/1l26fhjUv6kurL/J1rjSwE0h4V50eCi+yCaScccDg0Srj1BsD6e26rzH5oovBIu6JBqx+F2pLfD5eomxr5smIL95lcd/jq++lutN0/lBmWUNQ+WUQZM/fDX5fuaS+VO1hNaKefoCqCBug0ALSuowwKVSC06CausPsHXGcmUxwqHrS/SMDZPdQHLuY2dTTkB8zftyeMNHCOxKebKmNAZ6iPweyE6Hjd00owR+lGlcaV7Id9tanC29GYFZZnvf4+TWbfLBWY3cmEGVDHMeBSAHcQDEH1b1r9TJfn6J0o2fNy;
	4:PiC8eNpKGLgmsYa/NV/sYaPnrCraZ4rssqjhDizf+r+WjFPom4HrOhP9k5zHK6H1flrXaRpn8kyl/o6e+VhxJg5FndWLUmQFk3A86kBAcoTryBp31cGNsQMLHfK2xGxXamzbsQ9QaMCiRorlrAlp55l2ucYxEcLJckV7ajcpAGkH5KcxqcZgcAqpM7Kehb9B789REKmOszQxwkFjRcL2qF/akaU50d16eWtQz925zs14PRZ+bbCejLEJKIMT4rptrQBV1Xq0IXjtbmpjs++1wzhKPAsf7r6VWA0cBFYCrhpBgEy7GyMc9WrV0dP+ZxwJ
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3419E568071241EF798C1E0FAB990@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0667289FF8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(39840400004)(376002)(366004)(396003)(39380400002)(189003)(199004)(16576012)(6116002)(53936002)(59450400001)(7736002)(305945005)(47776003)(3846002)(25786009)(230700001)(2486003)(26005)(66066001)(6246003)(97736004)(65956001)(67846002)(23676004)(58126008)(76176011)(316002)(31696002)(77096007)(2616005)(65806001)(386003)(186003)(956004)(476003)(575784001)(36756003)(11346002)(86362001)(486006)(53546011)(446003)(52116002)(16526019)(52146003)(65826007)(68736007)(31686004)(478600001)(81166006)(5660300001)(966005)(2906002)(229853002)(6666003)(6486002)(64126003)(105586002)(6306002)(8936002)(50466002)(81156014)(8676002)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419; H:[10.156.22.30];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjAxMDJNQjM0MTk7MjM6RmQvdTRsTmwrRzhaTER3SXB3cThzY2Nx?=
	=?utf-8?B?RjRhRU9uUHVaQmcrNCtxRlg2NXFualI4bXVSM3pOb29NeEJLY0Jsc1NTc2tw?=
	=?utf-8?B?ODFMVm1yczJQQWdtTmM0RDZPZFRqNDZ2elVwMXJjR2pSd0ZIaFREbXl5SkR1?=
	=?utf-8?B?b3k5anE5dEJKRzQ3clRkNmhycTFvK1Q2ZGVqb2lxYk81TEErdmdYSnFQSFJi?=
	=?utf-8?B?SmlhS1NaalMvaGlWRVRKVzhPTlNFL3MzVWlSdDFQa1ZFODlSeHh0bDVEQXRx?=
	=?utf-8?B?RUJFUTRWN2dZODJ1S1h0UmE1d0ZjbXluODFRWXBkNEZ4Z0tySndkNDJER2F3?=
	=?utf-8?B?SzJGbHJjUVZPUmQ2bzdHbGoxVDV6TnJzSFFDalY5Z3hrVk96TUpTZjNwOTdk?=
	=?utf-8?B?N0pDazc2Ukd0UXdQSWxyYnEvZnhBRFdhcTdNbVRSNkZZbllzT1pjVE4wSXpT?=
	=?utf-8?B?TDFvVWdWdmIzSUJ4cndCRmhnSXQ4OG4rYjZPakxwWklpRGlYekY5YVBtdjRN?=
	=?utf-8?B?SGphVWVwUktiRnlvUVNqK3dPSjlZdS9ySGREeUtGVTRLZWQ0MC9aNDl2NzVu?=
	=?utf-8?B?YlZXbXZEUDA3MGRUL2cvNThmaVpKSEE1eEdoY3hDR2RDTk5ueVVaL3hHbm1u?=
	=?utf-8?B?Z3o5dmhRQUFLMVJjSXlnZWFXN0VhRStJSU1wb0cyajhTajh0bVdVbnNjbWtt?=
	=?utf-8?B?a0pQa2VUOGxRQ1A5UnRiWGlpVFlXcTU1UU01OVRuMGZ4bU92MXJJcmVmOUFy?=
	=?utf-8?B?bGtJWVVKakxtcEsxTVN0M05EakhweG5Cd3R5S1F0OWhiaVZFMUtuR0pQZm80?=
	=?utf-8?B?YWZmN3MzbDBhZ25PVTdBdTFHZ2tPcnhVTDI5Rk1LU3ZQalhWSXgzRllZaTVt?=
	=?utf-8?B?K1AxWHlHUUt4cnR1b1c3V0VxRjZFUCtxV0lrSFpiZHZPMWpVVWJCSzhFQWdx?=
	=?utf-8?B?ZTBrb09vY0pUeUR2Vnp1RzBaNng4aEZHU2FQbjhocXBWVHN6WU43Wi9rNUdo?=
	=?utf-8?B?aEJxeWYvZVFLYTR3Y0pEN0c3cTJRUE1QU2MydzBQNDhsenJJaXJPQkhLZnJl?=
	=?utf-8?B?bytBejAxdVMwb3dwWWZuZGptczhzSmFMa3FTZzB6OVNTamQ2YTdsUmtzbGVX?=
	=?utf-8?B?SWFpYzBoSGhreHg2UHl2M1JtSFhyVGg5Z3JwWkdjQkRUdUpuQXJNUlFuK3k3?=
	=?utf-8?B?MGFUeVpVaFpOMW5SaThFN1djWWJCSVVRTEhqbTlSSFg4TFlCMW1EakZIaUdQ?=
	=?utf-8?B?L1RSdDBSUFdOMHVVcjZWQjJObXFoL2N6YVl6SlZUSko2d20wL3FHN2JLa2sr?=
	=?utf-8?B?RlB6aTNFM2lRVzZUV2RCdlJvenIwYWJWTmVRSWN6V3VhbVJKZVMwc0pBMmRo?=
	=?utf-8?B?QmVrblVxcStXRHNxbklhYXV6TkQ2Zmh4R1RveFBIMlE2aGEwbDNNR2JZd2dh?=
	=?utf-8?B?YU90bFBoTlN5aS9tQTJHRytqRkNWbDk5Z1l3N3dpNXhNZ1VFbnpxc1kzN2or?=
	=?utf-8?B?OXhrUExKTXVSSThXbVNmTkI5cG1TV2RoOGlrNEE3SlF5N1NObnBmdk0rcGZO?=
	=?utf-8?B?L0hkMXB0Q09Ba0VrNy9rMEFaMUdOSXJwT1dabTA0R08xcnBKd0RFdlh2Z3Na?=
	=?utf-8?B?Q1EzV0oyUTFPbldwaGRHcVcwbzNobysyZmJSSjVpaGk5ZW05OWZzYzJyS2lS?=
	=?utf-8?B?cVVRQnlra0ZsV3AzdVkwTFhHTDlXWDBjMi9YSUJ3WWVkYlFLRm1sZk0vb1ZD?=
	=?utf-8?B?eDhZQ0QxclZzSzZKV0lUb2xVZWpDL0dBd2E2eTdnbnpQTmhZYlVVS00wb3hC?=
	=?utf-8?B?RDl1ZnpRNm9sQnBoQnRvZjI0NnBCaTJ4SnBwOGlhREFFVXRXOEVpTi9LU3F2?=
	=?utf-8?B?VWxCSk9lcTFuNGcwcTJzUHZqOFFJM1QvOHViOWpMRHY1MTBhNGd2YXFxTFkz?=
	=?utf-8?B?VjhtcVQxNGxXUnQvOFpNU0hOUFRiUTJBMDgrVVRTMTk2SVdHenNpcFJld2hj?=
	=?utf-8?B?QnY3aHdxVXRNdWRsb2FEMTRBVzR3UDRaY1J0WVV3PT0=?=
X-Microsoft-Antispam-Message-Info: dwcJsQgAUthw46e80ZBZn+OyknO/Dvk8hZMm7bizoZiSD5mVahJG52sQzFqLWyyLrNRmw30LB9f1Y3CsWuxDlrDJtoE/u9L7mkUuC2q4gue/U458JrT69niDouOvVcbuJ7JHjXJsOQOJ+1XQodFdOg0ngOUosDsYVwPZogPXs2AYAlXekSTpSFPaAJeEZ4Sn
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:PPrRDRxRjSYyv+fBOSIxIs8tpGNsS3tvjAKeo0iTh1Ry733vCNXz0XmrSsCdcGIRRVZQbYDlj/JIIpWrQ2DWa2GzvgXbhvwV+aJqT4io3P3InR/Xme1RsYivMqSnem1XWV5iMfoRgBMQu/0HHlmY5S/NDCDmG3QfimzLxXZtFmnI8jLdfE6CkVblcWlkOLN/7VNgxkVUyUL8inrA+sKYbIoMbTrdgclX4JEtToMm48yVtCVzsFNjNkFtdZqz7lh88OhbXC6uJFAunGO1EdcCG3/7b0gIHWszIA0wdgnCPha6Y4jH+gM5VQD494rqxtUNZ6bZ/DbJ4zcDlYKO4hbaU8B29JMRHDxpZHwxRqN3ke0hBnXc2uijGTG2NLlvD0IMw4mWVau2bAfFi09Ah42/7DIEmWdRIeBU1sspNixePQkfTMrGzz3RwvgP0ay2YOIy413c9bf8LgLnZz8nku+vyA==;
	5:WxMCkXqlLuSqtweM6rTSCGrYo8/k/O6x9M3kppHALPTc3YpmDRGwxl+/4/Gc+YP4Z7uQSv4EDuYDWSsIbluRFCURMj621SmVl3RUdNApLVVXQydo2pa34KaCEVjkJB8UoUHHGXMD08U402N+LeQzhCb1j8pWJVST3yGmB8Sy4cI=;
	24:T4A1vn7CrPB1gFEYzsO1TzWn8tQK4AOeUbitX2ee4er1U4kmUn063BtAy6UWCtPiW1y+cDFOBLJkcYwapuz7x2G8pAafs406dafPh8+mxdw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:wvA7YfbH0Mv8z5w8/X4kQwWdgVXxhznRCKMd0xr6F1r5VG2ho3TJwlQiUO6+Z//kDZ8Gt7qupVB2F8ODw0w9dNSxluJyaMp3hPeCwI5EcCWVy55uF6Yc2qmLXTEhMyXWkCaDh1XyIkTmMo3kYN6liCSEEY9IasQ2u665r/kT0BqOVq69PRVr6aOteBvpVEjVCcRmsPrGp6/xoDqJMmLXjoBf/19UHWB9O1tTms0ajnTeoozYJQHH/PpAgu8A8KiF
X-MS-Office365-Filtering-Correlation-Id: 7164c588-1aed-4736-307e-08d5b606c43e
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2018 23:44:12.0793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7164c588-1aed-4736-307e-08d5b606c43e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: Re: meson.bbclass broken on rocko
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
X-List-Received-Date: Wed, 09 May 2018 23:44:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/09/2018 02:04 PM, robert_joslyn@selinc.com wrote:
> I have a build based on poky that makes use of meson.bbclass from meta-oe
> that is now broken after a recent update to OE-core. When using the latest
> rocko branches from poky and meta-oe, my meson builds end up with the
> wrong paths to ld and libc. For example, running ldd on one of my
> binaries:
> 
> linux-vdso.so.1 (0x00007fff4f9ee000)
> libc.so.6 =>
> /home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> (0x00007f1136f8c000)
> /home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> (0x00007f1137560000)
> 
> Those paths going into my home directory are obviously not correct. I
> bisected the issue, and commit cead3c4925d39f8adc328007d8a8c1b23cc72842 in
> openembedded-core is when the problem starts:
> https://urldefense.proofpoint.com/v2/url?u=http-3A__cgit.openembedded.org_openembedded-2Dcore_commit_-3Fh-3Drocko-26id-3Dcead3c4925d39f8adc328007d8a8c1b23cc72842&d=DwIBAg&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=FXexzueMZc3SeYPHXBmsGdHLENOHmHsvnD0cO1_Z0j2tHI6VqrQPNkHBCZO8dAdc&m=JSVZRc5Fq4IsIwtkdFHpTXsgF8aCQ0vP6j_F7dT5tYc&s=OutJG7fOSrT6ANwnnyxx12eHu6yepO-b2NWHJeP93x0&e=
> 
> When using the tip of rocko, I can make the issue go away by removing this
> export from meson.bbclass:
>   
> export LDFLAGS = "${BUILD_LDFLAGS}"
> 
> I'm not really familiar with how this works, but it looks like the change
> to BUILD_LDFLAGS in uninative.bbclass is forcing the binaries to use the
> uninative ld, which isn't desired here. I assume meson.bbclass should not
> be setting LDFLAGS using ${BUILD_LDFLAGS}.
> 
> I can send a patch removing this export, but it feels like all the exports
> in meson.bbclass are incorrect. The class has been reworked and moved to
> OE-core for sumo, so I can send a patch backporting the entire class if
> that is preferred.
> 

Does the issue go away with the oe-core version of meson? If so, I would 
be in favor of backporting the entire class. From my memory of the 
changes between meta-oe and oe-core, some of them are significant and it 
wouldn't surprise me if important bugs were fixed.

> Thanks,
> Robert
> 

