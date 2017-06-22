Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 84383 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Jun 2017 18:21:32 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0076.outbound.protection.outlook.com [104.47.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 444E077E96
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DHVRfLQW2ffB/hRzLEkeSRv+6HA9gjgAIKD9mn3EXo4=;
	b=p2YaLxAWWqf1gILSDeBQiYeiLWQ0NQT8P9+QnuxISq8LW0jpaDtbeCqy7R5IFbWz21k1CxVd9ueTv8bs7yR4n3Ev0NS14Apif+goyWQHwtccSKbIlzRBAWd128oVRs9ip3+VkddxZYK7CPQBz5WVVDl7Y3lRhhCbOS3ybsmqLBs=
Authentication-Results: dominion.thruhere.net; dkim=none (message not signed)
	header.d=none; dominion.thruhere.net;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Thu, 22 Jun 2017 18:21:31 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
	<CA+chaQcnwYQwBXfxbdpEN8D9ZYzG=fOxX_MPNXt1_uzShSSrwg@mail.gmail.com>
	<CA+chaQdbrZ+R37sKDXamFwW71G9MvYVF-Bb=8OO_k5ChdUFGGg@mail.gmail.com>
	<CA+chaQdrvQK_uDEkEcBy7NEn4EhVXKWx+FOfbmqM+bPfL7ad-Q@mail.gmail.com>
	<1497915785.8604.2.camel@xevo.com> <1498151700.8385.2.camel@xevo.com>
	<CA+chaQdZdHS1Jny07kXGcNu7ZU+VBBirgvceNQ+6dBxk36gP2A@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <8904009a-6498-afa6-e077-4dd166bb04bf@xevo.com>
Date: Thu, 22 Jun 2017 11:21:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdZdHS1Jny07kXGcNu7ZU+VBBirgvceNQ+6dBxk36gP2A@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: DM5PR21CA0042.namprd21.prod.outlook.com (10.172.92.156) To
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6bf1dc-f0f5-41cf-37a9-08d4b99b822c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:0r1XYqdjBtfO7MpXwxGamZHsVswNCC17Y4Mds0go1hyijRCB1BygWO89xdQIqBoeUDcX8aMVfCqQn9v8tFF7TQJDhbcMVTpKhNJyMRyYeYvhA/9iGTZuEmyjNGdPKVB62HfPGVqGVU3REGjfTec3vTqoHRfmWV82M+XFl+mg6iziEOLBZGxR+9bFV18q4LVwGzxgQXaAl6noGqpHgoS42xPzJTmD8d7AX6S9lFgXAUyri5dxCn9v9E+MMw+BHNKkFWJMeL6pYlSjyOUB+PElsb9dLsURVYpqDRJvXHwU+t5qGZZPoB04GemdmOe1Cr2ZmWTpHoZ/emylYPgVYWDMaQ==;
	25:/Bff8UcOMIAXbhje/V6P1s/s03HgYtNmsVfwGGwKQOXdTGICMpnMGwenD+5hQceo/w/lEPskDiMR4CJ//0K5g+0mUaLLQUajfPsQvD3d4OoZyW+Uw4BsvhMVW9Sv/TUMhNgrglLa8ek5xHUc309/w9jLL03y3RcLUOLMODny/TNdQu7Gz5LeyQY+hTUWoZiVooeV1vq9tMwiFJTf/9q3fzLlT61R7G8Omnu2PM07OyJ73snYSx9FKYEFIii8bA+GfD1s/ULVS+gaWA+F/rNIM0YfiIL2SuiHPgx3eGRjNyUqiDiCygUxqte7jFfT51f2cjLCogCRTYBHXHKgv7vVnks7nkgJq1mwhIdUGvZRBcyoBcCMbwVn/aHZVWaYt8hQzyMToZq3oK8BzFCr8iWq/QlhiEUgYFBZ6H/m1wLer8Q2nGu6i9tmzcIn7FMCLRiHq1GXaoECfnq0b04tM30Bj+AfYR3chKL7U4PUWVrines=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	31:G/QIfDgDuADWUsVcYGyoL1U7LvD1r19cvEQzPMWrcPbpT63G8IeILgh3uCk6qaCUuhBLKUIMZbW33kYvU7tNgGP4h7WYA5UTpIs7OGdjB5OnW5xyQHr7+iXUSlXJpRIU6/42EUUcmvWA/5rSEZV1ivPu+MJZHTCquj8G7TUMWGhxze0mi0SvFC8vszzb8qABVXtGbJI+4r+SerJy4UrumcKHKTaZTcg4GNaU5j2EnsOc6D8WIisio1KfGwM/YydZJyMS0qzjIQGkatayKu3l+g==;
	20:7tEBWun3MLLD6eVqjqWJOZnozYrEg1TxAisE4ePQ/EYJXVCdvprC7rNCdCIdDvSYeYIUD1pm/rO4FoFCI88LYiQwfdu8sg1Xqlr1SQYhNUcfJhbIhMK5fJixOx4asWjbIifKfv706I7FaHyw0j/NwgLRVyTp82Fevjj83sKs+g1IvRy/nJyrZ+9lV66aL/icLe9oiQX43TiAwTxFhwOYOS+Wp6MZ/NvaT9TD4JwZbQSszjc3Kjyh8cwHOlfUbbSki21Afgf4J3nirbbxY1oeY1lhFmTEZIGssTwifIickg/30h1D7kfQGVYBiokcvkpJ2R4wBd6RlcjVep0SFYWf5A==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29442B48CC4296B7ADC03063ABDB0@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7NDpyR3B0dEhzQ2MyeE5RYk9qb3JvaTFrVkgr?=
	=?utf-8?B?STIvK2h6enVNSDZqK0FIRkhUUHNUN3FHWUswaitWWDREeDJTVEc2dDVvVTdm?=
	=?utf-8?B?TmdQV1lDTGhTZkJFVFBwYThDbmZ4aDZka3ZqdlNuV1B0RU91dnd4bHRVOEFx?=
	=?utf-8?B?NGEydjA3ZUxHYlhVTFAxenpndnVsQ0hZMVJhdC91eFNwUmhTR0ptMzZvdFkz?=
	=?utf-8?B?akRPUnlvcmo3RFFmeUQwc0UrQjRad2x5Nzl0YW9YeVBUdm0xZDFRVjNlMHJv?=
	=?utf-8?B?MGNoaCtSQ3JtdWlCK3N6SUxDUmNhYU1RUjJZVjduMyt0eDBwMjlBczNIbDdM?=
	=?utf-8?B?ZEwrUzlRb2J2RXhVSDloM3QvcktKR1dMTjZkVStvcU9rZE9hMHh2bjVVT0dy?=
	=?utf-8?B?M1pQbHptN2xxRktpR1NaeTR4cm43bDE5SnZIbVdBNFptR2s0TVl5SWxJT1Ez?=
	=?utf-8?B?NjhnbVU1OTlwK2VTMnJQQkthZ0xKa0RsckJkWmE0aS9YOThXY3VHY05qRU1j?=
	=?utf-8?B?anB3MmhVdFNrWTM1cmM3VkpTTURVNzJWNGZBYU1sS3dDODIyc2UwNk8yTXo4?=
	=?utf-8?B?eW5jN2xxUzBTNk1DeUNDNkdlZGtEOW9PQzgxN1QxaUtsa1k1WENwSlVKQlcx?=
	=?utf-8?B?YjhScFllOWZtSGRsNkhwTlNQWm1icXpWTU1LRWVnZHdlTjVVbzQyeFFnU2pE?=
	=?utf-8?B?V0ZtU2NlRDM2bkZpSEllS2paZWJ2Z2tFU1Mzd2x5dTk3ODk4eVpDSy9tcXBS?=
	=?utf-8?B?Q2oxSVkrZmtBQllrUU1PS2VhM0tzYlVEUkJjWUpKZGpBWmY2RDA1ZWVRalR0?=
	=?utf-8?B?OE43L1FwaHIzUXdDNG8vVGhsSzNPdXA2aTc5Ymo1OXFkajFQL0xodHY2eTFU?=
	=?utf-8?B?WHRocGZQdThZcVFWdE5aSmtabi9odGhFTG9UNEt1UTlZWTZpN0JGQzd1Z2VL?=
	=?utf-8?B?TDJ3SDBpUG5vYTNKRElqTlhXa0lZNDh2TTRPZXNpNElZS3NpMlN5OEZhT0Ju?=
	=?utf-8?B?Wk1FNUc4U0pwd3h5bnErQ2NNcHgrV25ka1czZEtrRUV1RU5nM0FMWXVERVY5?=
	=?utf-8?B?eWNzdXRyN3FTZ1ZqcFFuNVJNZUZueHZTVS96OVc2TGdtQjhCNldoRWg5b3Rq?=
	=?utf-8?B?TnNlc3hRbE9xWm5ZbVZ6Y0luWkptelB4aU8xQkxtbG5wRE1XTXd2QUgzTVJi?=
	=?utf-8?B?UEI3cFZVRllmOFhCY24rcjBmakZnZ1FLUnlXd0svQVJNZzhXbmhOblY4L1RJ?=
	=?utf-8?B?R0ZzSnZTa29yc0hUUkZiQTA1eHE4Y0NvNnhCYTVLNEtTdG5zZ3MyaUtRcEJs?=
	=?utf-8?B?QjhCSXd5alNxMXFXYlczdlZmU3R5OUxvTEJtZWV3bTJaTUpUSVNYajBIY0NE?=
	=?utf-8?B?Z0dIVkhMWEpRTEF0dk1PejZhQnp4Y1lXdDIvcjI3VXc0YURDWDM5VFhucFRl?=
	=?utf-8?B?M1llVUJUMW9UTmlzTTFHN3Jva0tIaWVTYm0ydWdjc0djejE5c1pMaXIzaU5K?=
	=?utf-8?B?c1hVWDc4bXRQNHNRMS9lNUV2cjZBWVFFYjVnazFxakc3VkpmUUVIWko0REdF?=
	=?utf-8?B?eUpnNVBxNis2NVd5NEphOUlOOFByVmZ4aFZGKy9kZmhpZTFHc3JBQkZBUlZr?=
	=?utf-8?Q?=3D?=
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39830400002)(39410400002)(39450400003)(76104003)(53754006)(377424004)(24454002)(377454003)(69224002)(230700001)(66066001)(8676002)(65806001)(305945005)(76176999)(50986999)(3846002)(6246003)(230783001)(110136004)(6116002)(54356999)(38730400002)(25786009)(33646002)(6306002)(54906002)(64126003)(50466002)(93886004)(65956001)(117156002)(4326008)(81166006)(6916009)(53936002)(42186005)(90366009)(2906002)(31686004)(6486002)(77096006)(189998001)(36756003)(7736002)(6666003)(2950100002)(966005)(478600001)(4001350100001)(31696002)(53546010)(5660300001)(229853002)(86362001)(23676002)(47776003)(83506001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7MjM6QnpGZmF0Q09HUzRwaHBkNzg0ckpPcG1N?=
	=?utf-8?B?SlBoeU9qdzJrckZON29WV1N5RkFhc0dRaTF6ZGtkMzFISjdOQXNSMWV2K3ND?=
	=?utf-8?B?UU51YVk2ZnMvSnVxbldhTXpXdVpINFZFa01tdzhRMHdhaWZGdG5Samp0bkQ4?=
	=?utf-8?B?dFNwQTd5aHJxdUMyOEhjSEtNSjVmUjNMejZOWmRoak5tNE1MOVNuNFMxS0la?=
	=?utf-8?B?enVkeGhNWTl1RVBsTDZsYi9xZmlhWmtaeSt2QUxnRWZvL3V2L0ZZZHRpa0s1?=
	=?utf-8?B?Qmo0cjFPQmovVzRDdFJTZDFMYW0zL2IrRlFHRE00Z0c2cjlKdk1lbVBrczZP?=
	=?utf-8?B?dTBVUGdXU05uTHdVQTNSdU8wSG44U0ZJM3l3VzFCaFVyOVhFZ01zUFFkelhB?=
	=?utf-8?B?aFNTUkpjUkFmL2U0YkUzTDE5N05kUHQ1SUFkR3lhcG5ucGVMQit2VFhwNnVN?=
	=?utf-8?B?T2ZVbUxtRDY5dVVkYzFwd0czUHdlYWh1clR4L1grcEQ3b2NEWTY2VXdMSDZ1?=
	=?utf-8?B?VG9DV1UzU3pmZDdNRlV1MW14amlDQmtJcVRSUDZyVnFzS2RKZWtzNHNac2sy?=
	=?utf-8?B?V0k4VDEyeUJVT3RueHc0NkF5a0ZQY1BwMllQQ3E2MkpjMlNiMGdVSzFYV0NE?=
	=?utf-8?B?VzFDRkgxa1oyWmJOSk83TEhwdnNOeURTL1NkNFd2eDljeEVoZThjTUpUOGFO?=
	=?utf-8?B?T0VLNzQyZm9IcWdObFlvbEdTOXArM01zcEdhNGJnbk81SmNQYVNremR1VlJt?=
	=?utf-8?B?UGw5NXBXd0RycE1Tb1JHMFVVUzBwbEJ5b2hkRVl2akp4Uy8yNkl3b0tRTXhL?=
	=?utf-8?B?UG9nU0F2eVlhZWpLd2Rkd0p2ZHc0bm5MbkFBUk15VTFSWElDQlFqeXpMekpG?=
	=?utf-8?B?SDZDWHNJSXVKM1hGNzRNWjBxVE56TXh2TUlwTmtGcS9zQkd0cndlQW4yM3Nl?=
	=?utf-8?B?Z0FGSDNsaGlsNHB0V3NoVmkwd3d2NHdDYy9vWVlMYjEyang3MFNCdWw1aW03?=
	=?utf-8?B?eW40RkNPTDZYZ0UrSXhBajZJTUxwYkw5U1BxUmNBK3grTStnTTRTZW9GMjl3?=
	=?utf-8?B?VUkxMEVHQnY5N21PSUZPR1VyZ2x0TmZhT0h6WWJEVS8vRVcwTUV6MVBUU2Z3?=
	=?utf-8?B?MUlXc3RHRjNjQkx0N2RZazJVZS9nVVFpR3QvU05GdldYeW80cU5ndFBKNTJH?=
	=?utf-8?B?NjN3ZXYwbzFpbHVpbG5WbGVNWjNWQ0tvTkxZelhxMUJFUUJHZjVyNGVSOEky?=
	=?utf-8?B?NTN3ZTVwUUxtbjBUenBKc1hSV0tRNzArek5GZFRxcldYbWFSTW80NG16aGds?=
	=?utf-8?B?cXZFbGFkaDlXV21YdVd5U3pMc1lMWTUzTDFMejZhblIvOWw2aFpGcEJkVjJT?=
	=?utf-8?B?anJNYkZMaWMxMHFsamhDR3JnQ1lrU0s2ZGpYQkNBRzhzNzFaUGgyR29YMXpl?=
	=?utf-8?B?UGFRNWF0bU5DU0ltTDJ2azVDbXB2WFltY0tWekV0Yk5RRFhRVTVNcEFtTGEz?=
	=?utf-8?B?TFBaVGRPcVVrdnRkUVpHU2lEU1NlRUg3akRHSmFFSVMxK0FYTHByR1paUExy?=
	=?utf-8?B?N2tBSTc1UXZvdGN3anI2ay9Ic3lhbXRQTG1DbHdxTDQ4c1pTL3BPK3BRZFdU?=
	=?utf-8?B?QWxBaUd3K3AreTlpS1gxdDd4REZ6WEtRYVR3NDcwVzhhK0F4RDR3cVE1V1Q3?=
	=?utf-8?B?WGZ6eVovUGhkV2lkeUFFRkNFRGFLMVpNbm9sMDBqbUU2L1QyU29ISE81dStP?=
	=?utf-8?B?NU5KZFo4elIvQnorUWZKVERoOHRLajFOK0ZsbjArekJYZGZSN0JBczZ4Uytm?=
	=?utf-8?B?Q25ETDJEdmNlZW5vcEI0SW50VlRnTFg5SXNqc3JoeTJkUzZpdmNiZ2hSZk9q?=
	=?utf-8?B?SElxKzR2KzdiekNWTkNoU1UxdjkzWi9TYTFrNWlLVW9RbW02NDR1ZkxrTHZm?=
	=?utf-8?B?V25rT1YwNlBZdmZIL3hha29Ja0ZucjNUVGp0WWlQT3Z5T2xSTS9iT2xTZ0c3?=
	=?utf-8?B?S29nZDQrR2JtMzQxUWpRQThNdkdsY0lWYlU5VitnPT0=?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7NjpDNFhKeGpzbGhVZ1FvV3RQb3NUVkMvMEMr?=
	=?utf-8?B?aENPa1FvaENXMjh0RExMb1ZZZHFRbWxaVVRNcUFWWWgrOXdoOHVBT0xLK0Js?=
	=?utf-8?B?Y0RWS2J0bzJlR0F5SEtsZ0MwbWpWZ2h6QUhyVjF4bmc4UlE2Mi9aQTB4Sllv?=
	=?utf-8?B?RFJZRDErYmxqNVl6cnRuVkUvRlFCdDJ6ZS9rLy9NUlQ5SEwxbmxqVFF0Tmtr?=
	=?utf-8?B?NDQzQmtxN0pHQXFtQURhU0FKMUdLY21TOHJIWVhURWVMRlg5QlloT2JNS3hl?=
	=?utf-8?B?SzloUkpNWGVIQ1V2dnZsenNVSUF4S3lzU2twWDg3ZUhrV29NM2xBcVVhcXFJ?=
	=?utf-8?B?MWM1Y1BXSDlLVDFlVFpRQW4zWmJHak9XRittcEV1bWExaWFNR2dwbU9sQVFI?=
	=?utf-8?B?TTFMOGZRUzdZSjFvOExUQkZZOXNob2M2YldKMW0weEU4b2NtS2xVOTFoclBx?=
	=?utf-8?B?VzlOR2VVYktacnJTZ0pMRmJrSXE2V0Juc1RRRm1QNkFIdUIyTllNVUtZWHVw?=
	=?utf-8?B?Wnc4Wk1HOC8rbFlwY2dVQ0tnZFZhbFIrUnVuOUlNTEdteFBkTWl1a2FCaW5K?=
	=?utf-8?B?c2dzMGxTS2FVeTd3R05Jb0ZKWmptSUNRckk4Qml2cGMwN0E0RmdWa1I4M0d2?=
	=?utf-8?B?V2M5YkdMaFdyazE3Q2xkYzNMSFZCeS9yZVBWS3BnNlRaNEt2VnJuN0lCbWxr?=
	=?utf-8?B?MTNZM0xJaVNqNVhHbXVxT1Q0cVNJa1FkVEl4L2RqN3JNNFBlWmxqM0tXUUpR?=
	=?utf-8?B?K1BGT1lGblBBYkx2RzFWY0VxMG9CYWwxdGsrd1pNMHhRNG9YYVBYWEpWeUxh?=
	=?utf-8?B?OWZlYWQ3d0V4dUxSaHJwUnZpM1g5cVdkT2ZoSWhrcHFEUDNRa0pXbmZhODZu?=
	=?utf-8?B?aGRBZG9vZ2xoNklpTU81M1B3WEpZNWRtT1lKc2hCOSt2N2ZvcklCMVY4ZUpG?=
	=?utf-8?B?S2hjdjhMdm1wRDFvWmxpaC9aZmRnVkxBTk02ckJLZi9xdklhWCtjakZ2OXpv?=
	=?utf-8?B?Vkc2VTJ5ZktaOWt5UWFFTUJ0RVFoMWl6NWp5V3VMazB6bk4yQVliVlNEanZs?=
	=?utf-8?B?WkVoS01raWFqeTBYaFErdXE3QjZaYVZnTWJtbzZ3emUwMjljUjIzOVN5aENC?=
	=?utf-8?B?VDFxUWtnNFNEK0NIaUM4TmU3R2p6bnlONW0zR1lFRWtTZjhrbzlKSVpoTXp3?=
	=?utf-8?B?anI1NEZxMDAxOURmaHpHVXpXTm0xbDBUT0hYcmNGRXV6Qk9kQ0ZWN01TTUVW?=
	=?utf-8?B?bmZhRERDTzJKeDdXK0syTjlsNjkxRGtsR0V1eHFRTFlqcm1Kc0RwNkpBRVlu?=
	=?utf-8?Q?qklXPIiPwgHBPwffm3SgdHv8Xt6+BnVwU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	5:9AtO/RAY+e5wTPkCQYYnRWCWheCkJqURUKI3RyUsj24wc32jLx97U2RfaFQoY+YgmpFjxNhnoUiqvTqOUM+rPkzR2NY4u+ZF1V9v/Yy8loYSyUbPl2i7qdeFwAckxS8+rsf4PmvuN1hGnGprb6umFai5QgltqoDXjihs7gCAxkcT9xc78v74IuDnPlEWdGt35DCwOlqeHv7lfwZQnTkq1UkIQrqciE9xkGN52sL1TuR9gMhK8zj2TRTtlJyesJwLjqXt7yGEGSA/HtAQ0iWt8ijoCx0HTXnHRJw1d/QA2saG7jkd2dHkN072jmDe8vPbv01Q8SYcUvSG6VPi+gLWdVCIxRJAIC0QMyerhxI+a6TPeKPS7UjFB5DvEiCkoKwCsj7U5r6ZEjQS4HJqerXHtYVRIsrseK3z5MwK+jlcdtLKL2LiEpCPuxfTjC1d5fxgqZdY7qALfZCbi6MJX+9JKGAdCpdmCmoGArEZ9vlra2+VhSqOx2VilluWrvbT379I;
	24:9IMhI+j3xhPklNY/y70yhPIH9gf57jwWXCXJk0oWi7n7M+fF/yk1cO7AtpgHNe6yEPp7J6E+XsFTiL5MpXbWTbLHROVo1XqDztsw7NdWAww=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	7:bhxpGRsJDYMADyAakrwv4iKgVeLZaO5BLVCmxS/fUE/fT3flR42wXq8D96foX4opmeXw8wp8lnkDtsWr2OFl1eYV5B2jpUySEaF23lKuYZm6uHfofKWf0xhu79pLaMS/2PMdxOCZ5qgXXkdKYeDSrBo9LodLOeIg+RLtUjVGiQylnaaHkxhvoGHdsKuAlDGKbPpWeqQ2b4ifSYoS4SgGRzDv6g+KSVh+ulWRWLubzVQPVFR30u/q/D7nvGe46ROKs+mRquiVsMFEJn3ncs40aDAUd8+NfXOoF87KtuqJ1HROOQJhcdQhpI/Ddhbw0/hdjongnOwiZ+S5xlfxqbWDaqLT++elE6gG7SMEs7Mg5rMd/n107jr+qbFLqH8SuBZ7oPBAGb+TTr/xltn3dCDkKxLEN9l4LCDiZNQNW+xRAYJ14hepWd428O2ttKcL68lPECwI5GbSLCxHGFR0aRpSMvSJCvGx72xHjRFmeDDgnqHHvd1cZTHyBrN9mHKWrJQNaLFoJgiQXxr0hJXqhfNwdPNJtuvLddU8mdGQdfjFOO0WuLNpFed+Zu0LMt4oROOCKDI3WKn/r1FjBdOtmj4TDsj+dOupeXOC2gwnHiwVq2kHcYq694r9D66pApU7qYnLDSqlzWV8sG8au9/oIcrc8cl4p8yAY19AseIqivggJm4L/yNtCVayQHxnK5soAGtO66ez7OEJpcU3AYklN3PwHMoK/oRKuOTP1b9IJHK2Y6AEurbjlworS9ff0a3GFyfqRWKLQ4+t2AetSW+/mOzihHyRez7GC2F5m+aeFjjDSz4=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2017 18:21:31.2772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 22 Jun 2017 18:21:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2017 10:32 AM, Martin Jansa wrote:
> It basically just calls this script:
>
> openembedded-core/scripts/sstate-diff-machines.sh
> --machines="qemux86copy qemux86 qemuarm" --targets=world
> --tmpdir=tmp-glibc/ --analyze 2>&1 | tee ${LOGDIR}/signatures.log
>
> see:
> https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#L258
>
> for qemux86copy you either need to add meta-selftest layer from oe-core
> or apply:
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=9d45c08641b868322af4bebc2f095340cf4dac3f
>
> Sorry I didn't reply earlier, I think it's resolved by dropped kernel
> dependency and I didn't notice the question about reproducing it.
>

I'm trying to run the script, but I'm just getting output suggesting 
everything is OK, even with the old change that I know has issues. I'm 
guessing I need to manually run through some steps that simulate what 
Jenkins would have done before running this script ("bitbake world" on 
several arches with a particular directory structure?).

It seems to me we have a few options:
- Try to troubleshoot how to manually run the tests
- Submit the fixed-up version and hope it works. I agree that dropping 
the kernel dependency will probably fix the issue.
- If you know how to trigger the Jenkins build manually, you could test 
it on my new branch before I submit:
https://github.com/xevoinc/meta-openembedded/tree/open-vm-tools-v2

I'm happy with any of these; let me know what you think.

>
> On Thu, Jun 22, 2017 at 7:15 PM, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     (ping) I apologize for the top-post but did not want to have the ping
>     lost in the noise.
>
>     On Mon, 2017-06-19 at 16:43 -0700, Martin Kelly wrote:
>     > On Sun, 2017-06-18 at 22:28 +0200, Martin Jansa wrote:
>     > > And there is also this:
>     > >
>     > > === Incorrect PACKAGE_ARCH or sstate signatures (3) ===
>     > >
>     > > Complete log:
>     http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/
>     <http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/>
>     > > lo
>     > > g.signatures.20170618_014055.log/
>     > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
>     > >
>     > >     * ERROR: 1 errors found in
>     > > signatures.qemux86.do_configure.sigdata.log
>     > >     * ERROR: 1 errors found in
>     > > signatures.qemux86.do_populate_sysroot.sigdata.log
>     > >     * ERROR: 1 errors found in
>     > > signatures.qemux86.do_package_write_ipk.sigdata.log
>     > >
>     > >     * ERROR: open-vm-tools different signature for task
>     > > do_configure.sigdata between qemux86copy and qemux86
>     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
>     > > glibc/sstate-
>     > > diff/1497786055/signatures.qemux86.do_configure.sigdata.log
>     > >     * ERROR: open-vm-tools different signature for task
>     > > do_populate_sysroot.sigdata between qemux86copy and qemux86
>     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
>     > > glibc/sstate-
>     > > diff/1497786055/signatures.qemux86.do_populate_sysroot.sigdata.log
>     > >     * ERROR: open-vm-tools different signature for task
>     > > do_package_write_ipk.sigdata between qemux86copy and qemux86
>     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
>     > > glibc/sstate-
>     > > diff/1497786055/signatures.qemux86.do_package_write_ipk.sigdata.log
>     > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
>     > >
>     > > So it probably depends on some MACHINE specific variable without
>     > > being marked as MACHINE_ARCH.
>     > >
>     > > Looking at:
>     > >
>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>     > > ab
>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>     > > vm-
>     > > tools_10.1.5.bb <http://tools_10.1.5.bb>
>     > >
>     > > It's depending on kernel, so it needs to be MACHINE_ARCH, also I've
>     > > noticed few more issues:
>     > >
>     >
>     > Thanks for all the feedback. I believe I've now fixed all the issues
>     > you outlined.
>     >
>     > I dropped the kernel dependency entirely, as we're no longer building
>     > the kernel modules (they all got upstreamed). Thus I suspect the
>     > issue
>     > is no longer present with my latest changes.
>     >
>     > That said, I can't repro the sstate errors on my local machine. Could
>     > you provide repro steps so I can verify this is fixed before I send
>     > new
>     > patches?
>     >
>     > > DEPENDS is there twice:
>     > >
>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>     > > ab
>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>     > > vm-
>     > > tools_10.1.5.bb#L24 <http://tools_10.1.5.bb#L24>
>     > >
>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>     > > ab
>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>     > > vm-
>     > > tools_10.1.5.bb#L39 <http://tools_10.1.5.bb#L39>
>     > >
>     > > What is supposed to set KERNEL_VERSION variable in:
>     > >
>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>     > > ab
>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>     > > vm-
>     > > tools_10.1.5.bb#L58 <http://tools_10.1.5.bb#L58>
>     > > ?
>     > >
>     > > Don't use tags in SRCREV, use git hash instead (otherwise bitbake
>     > > fetcher will reach upstream git repo every single time the recipe
>     > > is
>     > > parsed and will cause failed builds when github isn't accessible).
>     > >
>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>     > > ab
>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>     > > vm-
>     > > tools_10.1.5.bb#L35 <http://tools_10.1.5.bb#L35>
>     > >
>     > > There are many hardcoded paths like /usr/lib/ or /usr/sbin/, please
>     > > use proper variables like libdir, sbindir.
>     > >
>     > > Once you fix these issues please resend all changes to the ML, it's
>     > > much better to review inline than this.
>     > >
>     > > Regards,
>     > >
>     > >
>     > > On Sun, Jun 18, 2017 at 9:58 PM, Martin Jansa <martin.jansa@gmail.c
>     > > om
>     > > > wrote:
>     > > > Fails to configure on qemuarm.
>     > > >
>     > > > If arm isn't expected to be supported, can you please update
>     > > > COMPATIBLE_HOST restriction?
>     > > >
>     > > > http://errors.yoctoproject.org/Errors/Details/145599/
>     <http://errors.yoctoproject.org/Errors/Details/145599/>
>     > > >
>     > > > On Thu, Jun 15, 2017 at 7:50 PM, Martin Jansa <martin.jansa@gmail
>     > > > .c
>     > > > om> wrote:
>     > > > > OK, I'll try to remember to fix it before merge.
>     > > > >
>     > > > > I'm sorry about it, tweaking other people commits always
>     > > > > strikes
>     > > > > back :).
>     > > > >
>     > > > > On Thu, Jun 15, 2017 at 7:40 PM, Martin Kelly
>     <mkelly@xevo.com <mailto:mkelly@xevo.com>>
>     > > > > wrote:
>     > > > > > On 06/15/2017 09:54 AM, Martin Jansa wrote:
>     > > > > > > It didn't make it to patchwork, because you've sent only
>     > > > > > > the
>     > > > > > > cover
>     > > > > > > letter. I've added it to master-next now.
>     > > > > > >
>     > > > > > > Next time please send also individual patches. So that it
>     > > > > > > gets more
>     > > > > > > visibility for other people to comment and also that I can
>     > > > > > > use patchwork
>     > > > > > > to pull it in.
>     > > > > > >
>     > > > > > > Regards,
>     > > > > > >
>     > > > > > >
>     > > > > >
>     > > > > >
>     > > > > > Small note: Looks like the initial commit (24b2ac) has a
>     > > > > > small
>     > > > > > typo that should ideally be fixed before it's merged into
>     > > > > > master:
>     > > > > >
>     > > > > > "open-vm-tools: add recipe from meat-foss-openswitch"
>     > > > > >
>     > > > > > "meat" --> "meta"
>     > > > > >
>     > > > > > > On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.
>     > > > > > > co
>     > > > > > > m
>     > > > > > > <mailto:mkelly@xevo.com <mailto:mkelly@xevo.com>>> wrote:
>     > > > > > >
>     > > > > > >     On 06/09/2017 03:22 PM, Martin Kelly wrote:
>     > > > > > >
>     > > > > > >         Hi all,
>     > > > > > >
>     > > > > > >         This patch series adds a new recipe for Open VM
>     > > > > > > Tools
>     > > > > > > to
>     > > > > > >         meta-oe. This
>     > > > > > >         recipe is invaluable for using Openembedded with
>     > > > > > > VMWare, as
>     > > > > > >         without the
>     > > > > > >         tools, performance is very slow.
>     > > > > > >
>     > > > > > >         More information about Open VM Tools can be found
>     > > > > > > here:
>     > > > > > >
>     > > > > > >         https://github.com/vmware/open-vm-tools
>     <https://github.com/vmware/open-vm-tools>
>     > > > > > >         <https://github.com/vmware/open-vm-tools
>     <https://github.com/vmware/open-vm-tools>>
>     > > > > > >
>     > > > > > >         Please note that, as mentioned in the first commit,
>     > > > > > > this recipe is
>     > > > > > >         modified from the recipe originally found in the
>     > > > > > > Open-Switch
>     > > > > > >         repository.
>     > > > > > >         The first patch is directly from that repository,
>     > > > > > > and
>     > > > > > > the following
>     > > > > > >         patches are modifications to it.
>     > > > > > >
>     > > > > > >         Original recipe:
>     > > > > > >         https://github.com/open-switch/ops-build
>     <https://github.com/open-switch/ops-build>
>     > > > > > >         <https://github.com/open-switch/ops-build
>     <https://github.com/open-switch/ops-build>>
>     > > > > > >         yocto/openswitch/meta-foss-openswitch/recipes-
>     > > > > > > extended/open-vm-tools/open-vm-tools_10.0.5.bb
>     <http://open-vm-tools_10.0.5.bb>
>     > > > > > >         <http://open-vm-tools_10.0.5.bb
>     <http://open-vm-tools_10.0.5.bb>>
>     > > > > > >
>     > > > > > >         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>     > > > > > >
>     > > > > > >         Although the original recipe packaging was Apache-
>     > > > > > > licensed, I
>     > > > > > >         received
>     > > > > > >         permission from the author (Diego Dompe) to
>     > > > > > > relicense
>     > > > > > > it under
>     > > > > > >         the MIT
>     > > > > > >         license for inclusion in meta-openembedded:
>     > > > > > >
>     > > > > > >
>     https://lists.openswitch.net/pipermail/ops-dev/2017
>     <https://lists.openswitch.net/pipermail/ops-dev/2017>
>     > > > > > > -A
>     > > > > > > pril/014715.html
>     > > > > > >
>     <https://lists.openswitch.net/pipermail/ops-dev/201
>     <https://lists.openswitch.net/pipermail/ops-dev/201>
>     > > > > > > 7-
>     > > > > > > April/014715.html>
>     > > > > > >
>     https://lists.openswitch.net/pipermail/ops-dev/2017
>     <https://lists.openswitch.net/pipermail/ops-dev/2017>
>     > > > > > > -A
>     > > > > > > pril/014716.html
>     > > > > > >
>     > > > > > >
>     <https://lists.openswitch.net/pipermail/ops-dev/201
>     <https://lists.openswitch.net/pipermail/ops-dev/201>
>     > > > > > > 7-
>     > > > > > > April/014716.html>
>     > > > > > >
>     > > > > > >         --
>     > > > > > >         The following changes since commit
>     > > > > > >         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>     > > > > > >
>     > > > > > >           Revert "rrdtool: add gettext-native dependency"
>     > > > > > > (2017-06-05
>     > > > > > >         11:13:09
>     > > > > > >         +0200)
>     > > > > > >
>     > > > > > >         are available in the git repository at:
>     > > > > > >
>     > > > > > >           https://github.com/XevoInc/meta-openembedded
>     <https://github.com/XevoInc/meta-openembedded>
>     > > > > > >         <https://github.com/XevoInc/meta-openembedded
>     <https://github.com/XevoInc/meta-openembedded>>
>     > > > > > >
>     > > > > > >         for you to fetch changes up to
>     > > > > > >         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>     > > > > > >
>     > > > > > >           open-vm-tools: style changes (2017-06-07 22:31:34
>     > > > > > > +0000)
>     > > > > > >
>     > > > > > >         ---------------------------------------------------
>     > > > > > > -------------
>     > > > > > >         Martin Kelly (14):
>     > > > > > >               add open-vm-tools recipe
>     > > > > > >               open-vm-tools: add missing pkgconfig
>     > > > > > > dependency
>     > > > > > >               open-vm-tools: add missing glib-2.0-native
>     > > > > > > dependency
>     > > > > > >               open-vm-tools: clarify and expand licensing
>     > > > > > >               open-vm-tools: base_contains -->
>     > > > > > > bb.utils.contains
>     > > > > > >               open-vm-tools: update version to 10.1.5
>     > > > > > >               open-vm-tools: don't use mspack
>     > > > > > >               open-vm-tools: don't use dnet-config
>     > > > > > >               open-vm-tools: add #include to fix build
>     > > > > > > break
>     > > > > > >               open-vm-tools: add missing X11 dependencies
>     > > > > > >               open-vm-tools: remove kernel module logic
>     > > > > > >               open-vm-tools: line up configure options
>     > > > > > >               open-vm-tools: support FUSE
>     > > > > > >               open-vm-tools: style changes
>     > > > > > >
>     > > > > > >          .../recipes-support/open-vm-tools/files/tools.conf
>     > > > > > > >   2 +
>     > > > > > >
>     > > > > > >          .../open-vm-tools/files/vmtoolsd.service
>     > > > > > >  |
>     > > > > > > 11 +++
>     > > > > > >          .../open-vm-tools/0001-Fix-kernel-detection.patch
>     > > > > > > |
>     > > > > > > 35 +++++++++
>     > > > > > >          .../0002-configure.ac-don-t-use-dnet-config.patch
>     > > > > > > |
>     > > > > > > 41 ++++++++++
>     > > > > > >          .../0003-add-include-sys-sysmacros.h.patch
>     > > > > > >  |
>     > > > > > > 33 ++++++++
>     > > > > > >          .../open-vm-tools/open-vm-tools_10.1.5.bb
>     <http://open-vm-tools_10.1.5.bb>
>     > > > > > >         <http://open-vm-tools_10.1.5.bb
>     <http://open-vm-tools_10.1.5.bb>>          | 90
>     > > > > > >         ++++++++++++++++++++++
>     > > > > > >          6 files changed, 212 insertions(+)
>     > > > > > >          create mode 100644
>     > > > > > >         meta-oe/recipes-support/open-vm-
>     > > > > > > tools/files/tools.conf
>     > > > > > >          create mode 100644
>     > > > > > >         meta-oe/recipes-support/open-vm-
>     > > > > > > tools/files/vmtoolsd.service
>     > > > > > >          create mode 100644
>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>     > > > > > > tools/0001-Fix-kernel-detection.patch
>     > > > > > >
>     > > > > > >          create mode 100644
>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>     > > > > > > tools/0002-configure.ac-don-t-use-dnet-config.patch
>     > > > > > >
>     > > > > > >          create mode 100644
>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>     > > > > > > tools/0003-add-include-sys-sysmacros.h.patch
>     > > > > > >
>     > > > > > >          create mode 100644
>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>     > > > > > > tools_10.1.5.bb <http://tools_10.1.5.bb>
>     > > > > > >         <http://open-vm-tools_10.1.5.bb
>     <http://open-vm-tools_10.1.5.bb>>
>     > > > > > >         --
>     > > > > > >         2.1.4
>     > > > > > >
>     > > > > > >
>     > > > > > >     (ping)
>     > > > > > >
>     > > > > > >
>     > > > > > >
>     > > > > >
>     > > > > >
>     > > > >
>     > > > >
>     > > >
>     > > >
>     > >
>     > >
>
>

