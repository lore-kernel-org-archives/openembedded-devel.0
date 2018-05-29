Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0D59A7470D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5bc9BJio76LtV55h2Dh10JRyOxgbNIJZS/Ob6VFmxNM=;
	b=I/UpNs1PnGk0d/Tr/XsP2pn449X7DMyWzpqv9PfIf2xIUvUZcKldcUmN3abwt+qMA8I3DbdJ4rF1slXHcd6w31I2Pah/ezoW6wdOce8mw38e5e8hvGD2jzE4fEmMbYhEylUUArjUq3lA5lAVLvjaOeG7ToyAfsCRUN8ffmwtYmk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.21.3.104] (87.54.42.112) by
	DB6PR1001MB1429.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b6::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.797.11; Tue, 29 May 2018 12:24:45 +0000
To: kdgoncharov@gmail.com, openembedded-devel@lists.openembedded.org
References: <422140a5a5f8db29ddc6a78f8de60a73@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <8d5182e0-1a9a-7951-0a5b-24d7e66f625a@prevas.dk>
Date: Tue, 29 May 2018 14:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <422140a5a5f8db29ddc6a78f8de60a73@gmail.com>
X-Originating-IP: [87.54.42.112]
X-ClientProxiedBy: HE1PR02CA0109.eurprd02.prod.outlook.com
	(2603:10a6:7:29::38) To DB6PR1001MB1429.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:4:b6::9)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR1001MB1429; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1429;
	3:aUsxgJmVKa2J0ZtI5zXSuvv3B1qEjt7DPsTkm6ZEHsI10BhG4cGipJSwNOzc0o4+sjpSOq4Id1AsIMEiXNEY8hr+DBSBhNYk5zp4bMVo0YGekn+k78nDLnEjMM/ij1muyzWJmZm3aaUQz1e/judwWvQEdIar8VEz5M3+FfgYqJiyGFI2FclVstZAJrFfige4WJusWx+xUTbl5LP7XyKqtnZCLK1bMyu7/p0JStG50snpnvICT+HaJoqXYcLj2rvE;
	25:ZEtVgZF25TaQXztmXNHzrKtX6QASEG0vX0ikyMt+mtd50vyAVNlP/v1M3oMoIgRZ5ZaBn/u1rZSj4G3EgnIbpeHDrDRzykn+pAoZK237c60EyiQzJ6bT4G//PFZPtqcx3f9LxF9CFWehwT2/Gkvn5L2kL2BlMgPuKUQpTikYy+98a++neyztkN2YNGeTX8h/wli2PieEbTlqZAoZRVsxMD+GH23C8cMuSwK+FPFHWShiysWgRh2fEVnUYUUKhskQj8z04uHQ1+iOboz9PfYwfa8O5b+PGmdZFcyA+emRwJ+Be+GZRhmiZGHmRB/hDRrvDVamt3Llqf1+FYULfnmQ6w==;
	31:B9a02wb7M3nLRQRihbFN9Q99Z5mrH/HubxGzZKR5u+EAYxiUPGneeysriQHvs+48L5BuphONq+YLClCwUfATva5488hDgA5ypSvbfSgYFPZaF0e0tesPERg6eRCGXMIW3jbbx/fn4KlSet/4aavYJiV1KkO1uOwu+EjF0AHFgHTOnC0tnKinZy3mrChc6L++eN0y9R8S6AWVz7nvZkLBaXMogVTY/674bSzBN3EaIGA=
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1429:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB14297DF177B49C0331C7160E9D6D0@DB6PR1001MB1429.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(3231254)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR1001MB1429; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR1001MB1429; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1429;
	4:CtDRqPQvD4wh4TYg41gJzB9217bpZfhMTFctTNZUkq5dUniU3RXhsZ6WDNoUcNSakCXOLsxN0SA/ovJgxuvmHJHPVBGdSkxV0QxP85uTGTqMLXNckOPFHwKRTotSFsFm60bVuvlpFbJgSiGRGBA731Rrv3wmRGDs8miXH8xv84V7SRsYLL1je4ygXlY9Bgu0/FvhXa4DFkqFir30jyngxIF+oRHgNVBK7vkhfXMxoU1aPUpfn0ZqXBzFfrHts/4pYXtFF4vOSsvPR3qx6J9nBDOtz5PONNDwEx36wTd/Z3IMs11lVh8E3Ht5w8F+zYwh
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6029001)(6049001)(376002)(39380400002)(366004)(39850400004)(346002)(396003)(189003)(199004)(377424004)(52116002)(77096007)(16576012)(446003)(8676002)(6306002)(956004)(31696002)(2616005)(65956001)(66066001)(65806001)(11346002)(97736004)(2486003)(52146003)(3846002)(6116002)(8936002)(53936002)(67846002)(53546011)(8976002)(50466002)(2906002)(47776003)(386003)(59450400001)(31686004)(23676004)(81156014)(476003)(81166006)(230700001)(105586002)(106356001)(64126003)(486006)(76176011)(478600001)(6246003)(39060400002)(6486002)(58126008)(68736007)(966005)(72206003)(42882007)(316002)(5660300001)(74482002)(229853002)(65826007)(25786009)(305945005)(36756003)(16526019)(26005)(7736002)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR1001MB1429; H:[172.21.3.104];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjEwMDFNQjE0Mjk7MjM6U2dXMFhaa0RGdmpkcllPRjZWb0huUnEz?=
	=?utf-8?B?ZUpQNkxERE1Dd3ljWW5yQzRrZjNnSzdOdlNMU2lwMU1TcEZzSEdwM3FxVCtw?=
	=?utf-8?B?T3hxb3RoV0RlYmU5Vys1L3BRTEdVYjNmYmxTSzFsTUp1YWVCcjJ0SFZDUmZj?=
	=?utf-8?B?TTVGRXBTWitzaHY4Qk1xZlNZcHZSbGJ6WE1WTW9VbGNMYXhyRmpSaXVxQmZn?=
	=?utf-8?B?ODhGYlBtWHJLeE92MWk5M20zOHhJUHE0VFpoMUNvS3dLRUhNekdhakZ2QnNM?=
	=?utf-8?B?ZWVhRXBJZG5tbGR2NTJnTWs1RmdTVjVoenh2TW8yaVREanBwU01LV2dMK3ZH?=
	=?utf-8?B?bEVnZHRsZDlDc2VsK29LSE9mcGh3clVkY0IxRzVTZEVxaEtNNjVrSWpiMG5w?=
	=?utf-8?B?Rjg4dk5pZHFhWUNIMW1hME9QZm5XRFRScU01VUdzcDY5b3l3SXVwcUhiNkh1?=
	=?utf-8?B?OFAwNXhMeWpQbkVNK2E1QWgyeGh2NHFFeVU0M3hlYnhYR3R2UjNHYmFScW4z?=
	=?utf-8?B?TzBrSEZZRXp1TEhLeDJNSDZIOHY4Y25FdDZyU0x6ankzMVRPaTBFNHZhTlVB?=
	=?utf-8?B?TXFUL2dpR3J4VUVCUnRobUMwNGhOc3BnMFlWa3VRN3lPNVVxVkhWNUlFUFoy?=
	=?utf-8?B?Yi9ZQmhLQWhSeEVJR1dtQldRWEd2d0hDY0grUVpYeFY3Z0JmZ3IzMXlkakhQ?=
	=?utf-8?B?Y1p6RGtIREIvTmZoQ3NxN1o5bHZQeGowczVjdlFOeWZ0Y3NDZjZ1K2dZRUlR?=
	=?utf-8?B?andlVmZ4VUlrMDFuQkVzWUVqdkY2Q2pxakVqa3ZjZ0JCelF6N0JGc1VmaU5j?=
	=?utf-8?B?bHdrQ1pPYlNXVnhuTUxEa0tMQm5xWVBQbiszQ0xBQ0pMSzlzMGZoZ3JRaVEv?=
	=?utf-8?B?dnBMTytvKzFJSy93SXhjWW92WDkzc2cwSFZFc3o3MjZzUTdYZW1neVc4TE01?=
	=?utf-8?B?b0Rtd1oyc2lGQ2E3Z3RhUXJwR0Y1V1NqbUNWeGZ6dkRtRE5UUHpNSk1zQ2hP?=
	=?utf-8?B?Y3l6Qm9ic2xyRWZDSzNnRUl2aTlERmZtbEcwQ1I1N3BhN3ZwL2lLaTQ1RVFj?=
	=?utf-8?B?ZjNjcm00bFVGc0FqbWV3TDJiMDRwUXRGbFlMd29zdTJOVFByTGN1bUlyZFNK?=
	=?utf-8?B?eml3Ky9tL2NadEVQU1hWZkgrOGNicGtHTWRIRTMxVTF3RGV4d1VyMXJIYmdl?=
	=?utf-8?B?cVFWTS9xWTd4SnhISGc0SXM1M0NKWTRab1ZueXRVRTl4dERuOUxOekQ3MUdR?=
	=?utf-8?B?WDNndElMWEdYbVJxSnhZcytPNzFxZEt2K0NWQVF5aTgrd0o3M1pyQU05azBX?=
	=?utf-8?B?SjhkOW9WaXgySXZuNU5Zc1pMb2JYWTJESWlLV2F4MmlrNVVaTlU1cWx3K2F3?=
	=?utf-8?B?Y1g1Y2VLaEs3WVJuS0NJOEZibE9IUE85WFFrVEUyeHFyLzd1LzhTcFJlek1Y?=
	=?utf-8?B?U1N0c1JCc3V0SXJpaDFKWnVRZzlXN3NmSk9pZThpYTkzUU9nY2xUdUNrODNZ?=
	=?utf-8?B?MlRYNDZYaXhjNk8zOEhmNFpzQWJBRjY1L1hJR0JlcHY2V3R0MTBOMWxRbVQ5?=
	=?utf-8?B?cGc2MTJ2dG41MTZnbzMwMFpwOENYRWgyMTM5ZjVRcUpTUHEyTWJMVnB1V2FH?=
	=?utf-8?B?TDFTTmFOQWdkZ3BNSUZIYnV4UVprQ0orVXE2R0lOOGkvUkQ5L3UydlQ1Q1dr?=
	=?utf-8?B?R0c2M1dDd2hPc1RjL2dWdnhIOHFDaFRrK2Q4N2FKYktkK3BCKzA5bFdwLzhi?=
	=?utf-8?B?NTVsNllTQ292TE5EYlRhYWRaZGNlc0prVnhVanVzRWxqOGFnVWZrNVhlL2VS?=
	=?utf-8?B?VmJkOFhDdkZ5V1lEdzloS1h0SXU4dS9lTlJtRjR0L1RSdFNPSE5NeGdKWVQ4?=
	=?utf-8?B?NVhsZGxKVk9LeVI4T0N5WEpKVkJuTmZtbkJCd1lEa2xUT2szaDFNb2kzVUo4?=
	=?utf-8?B?dGREZ055Q1FrZmVtdzBnanNEalJLU1M1T2I0MEhScDNPbUl3dHdBYTlRNTFY?=
	=?utf-8?B?dG52eWlFVTFjbWRRVjdsQUNjUXNvNWxRYkY2RVNzZ0dmMWpDendNNVM2bklP?=
	=?utf-8?B?SnQvTXlibFRBZGtVUzBnSGpjbFFnbnFlVXBQYjZiS050SlVFTHpKOXQvZkpL?=
	=?utf-8?Q?Ff/gyumUOJK0f7wYcwDl+dnCM=3D?=
X-Microsoft-Antispam-Message-Info: /kY9wM72p+uOvVNKqWRHaMSmCw+cUA2sIioyJii7nZ6IbBAWECKhhCoVBOdVAleCcfC+Xf7PRTEuqMVm2WswBAteookcTe5NifcAKg9kus7AhQt6PYnFmmZ9phVWDisON+jVaDWG62QdtOptkfTfgCxLveFvYmYbOR54yizS7D8JBhEHvJE41FNclv9Q4oz8
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1429;
	6:+rsQ7jfaMsI76AtPY38cpfUU0FhBq4aKcbfmjfW0yNKcEN3lCwQyUVfmjfkT707Pl8PSLlG6UNm7lsJLgpkh9M3ukLFBsrqyP3LMy/JhYQH6X1lNfVxnuFpVYUfvXdKEgsj5229jFiYxBaIoBvz08h+zynkuvW4EeDPwJwA1zqa0dp/Z7IeAwpszYlAjHWGvQ9ZRESQ1yv5+OHkcHYrCwDErsuZsyvvifFlBLSpzLaiVgTfrrIdUnY+WfjHtlE9/PzdcFy2nRPikPIl70LY+vlNuRYTXziAhPYh/jYib92ZlI9rmtlLe4QjT9L4lBNzRplfbxXfXhtaZtm4GqKeQ39BdOvOM242fRr22etCwqskdXhNgMKSDkO1IYJrooeOMHz/8CselIKMTdyf1UAbWAfy+XbyFa+jNyzZ6dbcbLKmWTXXc1i2QrEcUUV1E/GO5RTKCU4WP5kQIQMnQjo/rBw==;
	5:eK17R4t6JLnTXNH80Yh6HYxGzvVDgPyNpfvVP3G62QDkEEtq6zeeg57Hz/wGFIbb/s75YCOME9SRljOGXbBzLzrmZoUXgomBZXz5EoCU6BN9Jp1gA1bABPy3BdxgRSHcY5uOaEIpMx9udOVKhFOiYmoeaQhhwlafJBJ4i74hnnM=;
	24:pgQBUkatjs2yRmW93MbVl6jkaDsJq2Bxj3QOn9Tl/mzHNK/RLCQNEAyzdRsP6+lqoEOOjo2IC01o08LWCssDgd1WSG7tdV0GuMA+83CYw1s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1429;
	7:7rdgi5faz3LNR1qmTC8ncz8eoerzwP6q8X+Y2RBx+Zo+RzXFi2f8XeoPVYgNMC1XXlmCS76YqpBdzvAacdZWz8a4Iu9Is/PWkl2ZhIxI/cnZSvXnadIYKu0tw37fJcmvpMhO7cGkvh6KQR3CeBFEIqxPLS0twoZTo0mhTnHvqjF3cmAx7hJXd/qic4m8cJK083h3G/sB/Lv07YiVJvWjxUE+tWWQ1qL+rQFNVE4kT54B7v4DvuxOLkeeQ3+5XvsO
X-MS-Office365-Filtering-Correlation-Id: b073ab36-bdd4-433c-ccc1-08d5c55f2a30
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 12:24:45.9449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b073ab36-bdd4-433c-ccc1-08d5c55f2a30
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1429
Subject: Re: [meta-qt5] QtWebEngine SEGV_MAPERR when opening web view on Raspberry Pi 3
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
X-List-Received-Date: Tue, 29 May 2018 12:24:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 2018-05-29 13:25, kdgoncharov@gmail.com wrote:
> Hi
> 
> I'm using meta-qt5 and meta-raspberrypi layers to build an image for Rapberry Pi 3. The image contains PyQt app running with eglfs plugin.
> Starting from QT 5.9.4 (commit e1046125d212a016d96944ff907e17d51a5b41af on rocko branch), QtWebEngine view started to crash with SEGV_MAPERR. The error also occurs with QT 5.10.1 built from the sumo branch:
> 
> Received signal 11 SEGV_MAPERR 000000000000
> #0 0x000072a7ab4a <unknown>
> #1 0x000072a7a9c6 <unknown>
> #2 0x000071eda2c8 <unknown>
> #3 0x000072a7adc2 <unknown>
> #4 0x000076bb4d30 <unknown>
> [end of stack trace]
> Calling _exit(1). Core file will not be generated.
> 
> I posted a bug report on QT tracker with more details about the crash: https://bugreports.qt.io/browse/QTBUG-68484 (https://bugreports.qt.io/browse/QTBUG-68484)
> But maybe something is wrong with my configuration and I have to update it?
> 
> I'm using core-image-minimal with several modifications. Here is my qtbase_git.bbappend:
> 
> PACKAGECONFIG_GL = "eglfs gles2"
> PACKAGECONFIG_append = " fontconfig "
> 

For what its worth, here's our configuration for Qt graphics on a RPi3:

 > DEPENDS_pn-qtbase = "virtual/libgles2"
 > QT_CONFIG_FLAGS_append_pn-qtbase = " -qpa eglfs"
 > PACKAGECONFIG_GL_pn-qtbase = "gles2 eglfs kms gbm"
 > PACKAGECONFIG_append_pn-mesa = "gallium egl gles gbm"
 > GALLIUMDRIVERS_append = " vc4"
 > GALLIUMDRIVERS_remove = "swrast"

// Martin

