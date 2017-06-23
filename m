Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 3735 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jun 2017 23:51:14 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0069.outbound.protection.outlook.com [104.47.32.69])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF5B78204
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Wdo7YT3WHoOIcMn301wyU3g3Ezbzr9eansazw0p9H4w=;
	b=gqjr/goAyTRDD2+JZXQ4sd6gUzb1iFdsKAyIIyPIGlima+gLdJXZSHskwPs8d/aHFey+1B7TExEwtuwjoJfI3ss2aCQflAsasFOHY+rZ0Dd3ELYAywvK8CCbX4oiYIDLXAvdOkJMaDWaBmNUFLlw0Sdwu4WQqg0X+62qCe5ni40=
Authentication-Results: vmware.com; dkim=none (message not signed)
	header.d=none; vmware.com; dmarc=none action=none header.from=xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 23:51:14 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Martin Jansa <martin.jansa@gmail.com>
References: <2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
	<CA+chaQcnwYQwBXfxbdpEN8D9ZYzG=fOxX_MPNXt1_uzShSSrwg@mail.gmail.com>
	<CA+chaQdbrZ+R37sKDXamFwW71G9MvYVF-Bb=8OO_k5ChdUFGGg@mail.gmail.com>
	<CA+chaQdrvQK_uDEkEcBy7NEn4EhVXKWx+FOfbmqM+bPfL7ad-Q@mail.gmail.com>
	<1497915785.8604.2.camel@xevo.com> <1498151700.8385.2.camel@xevo.com>
	<CA+chaQdZdHS1Jny07kXGcNu7ZU+VBBirgvceNQ+6dBxk36gP2A@mail.gmail.com>
	<8904009a-6498-afa6-e077-4dd166bb04bf@xevo.com>
	<20170623103306.GA2791@jama>
Message-ID: <766bf02d-c72b-9359-d135-12ce910a75ac@xevo.com>
Date: Fri, 23 Jun 2017 16:51:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170623103306.GA2791@jama>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR10CA0063.namprd10.prod.outlook.com (10.169.238.25) To
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce82ce06-38d7-4e3a-b50f-08d4ba92bc0a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500076)(300135000095)(300000501076)(300135300095)(300000502076)(300135100095)(22001)(300000503076)(300135400095)(201703131423075)(201703031133081)(300000504076)(300135200095)(300000505076)(300135600095);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	3:j966M5e3J24wVRYEPZy6SvEGjoDKgScQYxS3lTZxJUe2Ac7y6mJc/4BLoQrAww3DP2g2KHpbU62yAhwEfI1CnOnpkvOYg5stB+zBKoiGF6zsZWc/C1f6ltjAtn7SLlr2FQliHC9tOpSwda5M/mUpsAsXZ1udwYxO7vCKAh2szRVy7/OqrOVQoiPLkMF9Va/Ht6u4xV4Kl8tpMCcssbCsatSsmrPv6a1kDkCqY5yOxuLRfTHyq4HeFhiSeX/vXJ1AdCB6vijGR/X4wlimEs1ck9ZIRL2fURi6njLKU/qcdo4rWO57ztSCY/xoWRfvwB4uBVjM3khCsot+wi38MnSTUvzhWCYbPmZwHrMrT5xuHQH0f5kimUwHzBJXmd7gZ3Av+NHS8+0/kKSGCFum8T/IBH6hucC7ywZisdNM4VELkgr74qnA06VHHHzsX8wjJtxlXjiuT+5iFLnbg1lXRP+HeoW0eVyvf7nIQQlUZzifX7fAlfoluBE3E6BM9WgkwHUxXwfyWodhH9bEgoUw4oS/QHv9Ao33AECqQbK8mY8jzwYUu057RXyurL3eE/BXH3lAdrvE/atPWlhW1j3BLIccxMcYQrQRF16t31stSmTC/5Y5hPU1Lxda+RTY7J4bqg9fPS0pccYPyy1YnAawyvKkqkD7txeRGtd1ESNCSk0fSbG3PqDHwRwJ5KPFSQ2UtgJm
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2941:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	25:liuMKUtA3J7YnZwW56ONY82jrUNq9HZVI8ffF293KQtSm10TZRne+WmZERcigrYG7uWaHH1ruJhpY88xPsG+HsnvrKS63BUXntdAObSHuVxYiRL3+1hIsaTUy6agdGXJHFJouqgt11Mg1jWUAx5oizwku2HBJTLlEywUA29dPXQAVWUPlvax2tFu1bxK1E7Zf7aS782dcfS6s2Udo6aJrHVGlCWfY+dJq0mKDBOwSw3MJeeXQ3/S5UnD/8L/6PPc8qp2LbD0K4xILFmXAklXMA2kZ+Tqd6TZOWLk8paw6w9s4c/hkooWBASzWqMBZEgGDvK2C0JrtG9SIsr2o11c2Zw8/yDKZtO0bsG/brSl2pl0/nKDddgzCvZCrVovP+PO2RwQvF3Bz9eqtKUlKr4GFqcmVV6MgqoxOJp7rWkx7w8vm5RHAoHc+WPhnk8O8HGD7m53GhlGMvhhHNJMbkboy0Nc+CNIL0gggguKEV+TNnR2vLUz8KNh2efUmuRNwamVpCqwIb8MCCiLBtVWo2l2/fQBXbosaQdiY04MFSK4t7HzlfttrOKcG3PsfZh4eavufWbIyZlBqqprVTQui0WLDBGUrlu4AUYaj8g63RtrUdQHirLst5naIkRjYaYKmqIUi7N6UaadIIuMbs72JDHZ+F9EIcNQqrE1ha8UOUm/RVhuzXQDTuKFBYw8xCBtjnUWt2Qs97rt3zqEY5oecFxJumPhIxHmLdSdwiBv2sOmbBm8FCMS4gKmzrP1ksn8nVMnquMst8GWZ2WTcNFwPunQxTvMiwjNeapXVLMjDEUu3we+ivITLSUnybXzLw1n56BO47l8QAmjWAs9GEwaK/bUD/Om3SUB83zCTeX9mhHA63v1G7qX2I26OU0jg/4Jk7cK4vu8EqyuNFW92nJad+zzRWyy3vRM9/tpJaScpdTbcJ4=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	31:kE0V0w0pMWD1pX/K1qzRyKfS7GgJo2LEG960zoEz+Znc7I96j77EushFPMyVGwQd+lIukhA4kFEHcbU0Gdl1tbsFVZe7Tkx15uzfzrY24cN0qDue8UCZBfKGalb4AsD3TTElnNuaPowEf834m7zxPbze6vxUfes/KEwSNle5j2pYA3o57pGduCEjOpftio8P9++DYr/Ny8Ol0VQoFobIbd2XFsUEPZz8Nd5yBZFs0miQaIgf+ECtEpVXX5G84YChhrNpygB4eIr7+ICFNJvxtsZ/DZr1imWqg7v+WgCTw/y2Z724U5lndNPrl2jUcWgYFQcVPev8Zg/m2i8n/Ct7lFWBN1gONNd1bhwf1uvhJlIUWHZ0ubOagQeAA0T58tar6/h1GTECknvHVVEF99e2YdWWTVorfVBxQ1CKbn/l5DbpYUuHXMpVZkPBbPjKK4jkz7h03joKTkoxWfTzHiPzQB657wfGyEgWt2vNbr2tw3eN1MYbrV25EXtu+Hbza/21xRpg1wrxlgX5Vu5tB2xwTP+Bu2FBRVZVg5HmnF1VWM+U7nj+P0F26HahiEJABHWQoX2qb16lyU0+4ZUHyr/TKuL4HMu3LuFC8JDIR8m2z9Y8qdjoMEK0FyTCzetJ2HyEo0lZ7Esm0SNpBJIOk9CcKCw5KTk6lmbcsAmW5OgKwqxRSOV7k/oOJuTCsxfPcupYKIPhr6K2W3WAkkr3o1k4fg==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	20:yw31Hgh6/sQcyIoAB4LhFCGiahlqp4ncq3oDANPzV/TrRgofJBx1KX4jbRIcIDeXKMNwYTmrNZpXhNJwMBXx2XmZI7Y4LIs5s78htkjfs1t+KTHA3kraf+5Rk+w5VM1WYsRrn8SoUrD8BRIRKbCeneoJf5Chb6VQL0MGSPhwb2MYc0138wp+xd1U/ps1QS+ua9mafGXbOTQtXrJ5WPMJ8F86glrtHfGDbYcG7AihzAArMuJTYCAun1wHSq51dpxyi7+VVbGQ5Xo5ej5ko4NAoKAdCKHaHHWNbwXbh1poZYeeIzZ9FE5aemU2Amq44/5bmFmxQrKLiqLjKjyUbUXatQ==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2941F3176C4EA3D0D5BCE377ABD80@MWHPR0101MB2941.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(166708455590820)(236129657087228)(48057245064654)(148574349560750)(167848164394848);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123564025)(20161123562025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2941; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7NDpOZUVUS0tvNEwxdy9XL0Y3Unc4TVRzMTMv?=
	=?utf-8?B?Y2h6V0txT2xWUmpBeEh0cXdDc1M2anNteWVYNDB1NkxFMWtwa0I4UGVCS1kr?=
	=?utf-8?B?RnFxbStVUndVMHZxQlpjemJacEZaNzgrOC9TNitrbWh0V1RLNTFlQ0NES0k0?=
	=?utf-8?B?SlZpSEgydiszSVFoa1FvQkZWMnI2VUlLRlVoMmQwTHc3RWgwL2MvK3dNdjNx?=
	=?utf-8?B?Wi90L1BOQUJHVVMyTXBDQ1BLMThsWnRpYjl4TENoTGQ3ZkF3VVBtb1ljLys0?=
	=?utf-8?B?bVdyNmtDemg3T2cyazJBN2tWTjJVRGJ1Y0FxV2t1ZERnZFpnSFJLNFlvRFlC?=
	=?utf-8?B?Z09LbGx4TENtTUJvMTRBcytVRDdPNi9GQlN6WTJkVWJXRU1rQUZxSU9QR21r?=
	=?utf-8?B?SUt3V1JVMm1Mc1h5cThIeFhMRW83ZEtZTDhvbkZPeTBlQmdDMUR0QUwyYWFN?=
	=?utf-8?B?d0d6aFgxcWdnK1NheGpOTE5IYkFBejlDaWhQNFNrVm5RMVVMcW1nQTAzM29v?=
	=?utf-8?B?UjFDSlh3dnUyeVd1dThrNTkxWEcyVnpwY2NjMHNrUk5vbG8vK2pUQTFoZnFz?=
	=?utf-8?B?TmhDWWZMN3EvSmZOS2lRamZCa1JTY3oxTmhsTUxtRGJ3WkNXdHg3ejBnN0VO?=
	=?utf-8?B?VVdtVDF5cTZjeVdEZEtDKzBYanhjUTB6NmRTTWtaTHR6cDJFWng0TG92MWg1?=
	=?utf-8?B?UWxJa1lIc3FHbGJyUDl5dnBhY3VBNlhnODdtZnhadnl6MG9DdmltZG5uNUln?=
	=?utf-8?B?NEpFM28wSlZhd3pIcjFkampQVVFUN2dtbzhVa094RXhtK3ZoNHhJZlc1cFEy?=
	=?utf-8?B?TURIMkJkYXY5YkwraUJSVFpkTXRzSVVBQWUzZktwQWNjRGxBV29ISGFSRktr?=
	=?utf-8?B?czJ0YkNyd3A4VENiNnRpazdhUVE5SVczVWRlT1ZGbll3M2VnNU1mMnJzSllS?=
	=?utf-8?B?VlNJYUVkNnFFR2xzb1B5R25PVTdvakVJdGhoOFJPNFhyYlcrKzd3UWk0NUV5?=
	=?utf-8?B?ZHhFRy9ibmFRTmVHenFLSXZYdmtENWpzcjRrd09DS3BSdDVOZkFxNFZDUVUy?=
	=?utf-8?B?VTZwZUlVVkYrRWwvNXV2MTFnNjBnV3QxelJ0V1pDSXY0ZlpVSmdQcEVCWVNu?=
	=?utf-8?B?b3l4bkRKelgvM0hjbkFBaENSaVBPY1U4dzJsRFlvOWVLSlJ6RlpZakV2Z1FQ?=
	=?utf-8?B?RmRJaXBPTWU1UTNzR1B5R1RBSGRBTktwUVhJeW9BMGpjRmpJK00xN3czeWJ6?=
	=?utf-8?B?N0VYSFl5WXpxU0dEcjN0bUtQWXNWb29jNStJWWJLVVFpZkg0a3ZNVGM1aVFP?=
	=?utf-8?B?Uy80NnJaRDZtYmNVb3ZyV3gvbjNMWEErVFZTNXFOSndJZ081dUsrclExMi93?=
	=?utf-8?B?VjdodVIvVGhxOGVDamtyVzlEVFhjZkhYbklCY3JFNUpWL2toWExWZGpudHAr?=
	=?utf-8?B?YVNmem5PQjc2enBnSUo4VTVUdTNXcFRXQXY4QnVJbXVWYW02RFN4YnRmS0pI?=
	=?utf-8?B?clJocitDQ1R4S2lQNTlYZkpxUFMvb1BBL2E2SnRJMHVjYW1PeGlscUI0UjJT?=
	=?utf-8?B?ZTl1UE40SVpGWURzdTFzZTNXbVA3UnhSSC9HYjBubkpXazJJMjZ6bnFLVjBt?=
	=?utf-8?B?Tkc3eGFOQ3VNcUMyMCtVeTJBR0p1aHltUFJuYUNqYlYwcjNrd0R3KzZna2c3?=
	=?utf-8?B?VVFEL2NsUlp4NFVudWpHRCtXelorYkYwNFBGditPVFRHMC85REd4UVNBUDVt?=
	=?utf-8?B?NTRQdWtGTXFrY1EycWV5amFTTWZaMDlvSWQvR1FYV0JGRExhaWsxQXNHZHA1?=
	=?utf-8?B?ajZZcGVyaXNaTFRYR2NNQUp3Y3Y2OUFkbkRPL09iZm5JTlZBPT0=?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39410400002)(39400400002)(39830400002)(39450400003)(76104003)(377454003)(377424004)(53754006)(24454002)(93886004)(90366009)(36756003)(6306002)(54906002)(53936002)(6246003)(38730400002)(33646002)(3846002)(230700001)(110136004)(230783001)(6116002)(91966014)(83506001)(6916009)(229853002)(5660300001)(25786009)(478600001)(2950100002)(77096006)(6486002)(6666003)(65826007)(76176999)(53546010)(54356999)(50986999)(305945005)(4326008)(8676002)(81166006)(7736002)(2906002)(86362001)(31696002)(42186005)(31686004)(47776003)(66066001)(1720100001)(4001350100001)(64126003)(50466002)(23676002)(189998001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2941; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7MjM6YzdWRVFndkN2cVZNTjhnbjhTV3JiZnlQ?=
	=?utf-8?B?L1ZUdHNucG5iWEN0N0x1dmVBMjdFS1IzYkV1SCtxQWx1MDYwZXVlZHQyTWE3?=
	=?utf-8?B?Ujg3dE9NWjZNSXpMSFMrc3ZqK1dsODByY21YU0VESE0wUUxqNHN3TzVlWTJL?=
	=?utf-8?B?aHVOcFhnSjB6dHJOb281TnRYTEFmWVpNcDZQT0JNNTc1RS9BZ05LbzZqQ21P?=
	=?utf-8?B?bVlRVFNHelVpdWZEUTBWcm1WUmVNYW55K05mbHhJN2VJR3FoRmxBSXlOUk44?=
	=?utf-8?B?QkFBeStKSjljYStyVThFakFhdFBNcWR1OVk5RDlEOGJZaWlHRXZrektxQjlo?=
	=?utf-8?B?SldUWkJ6d3VPK1hPaUk3TzVmN0cwZkhuRkt6YlFoaXZDV2toVUZGTy91TUp2?=
	=?utf-8?B?d215SFBGeTFFUi9JWTBkcy9hbUpqcldWSVBNRWdQSE9pQk1MYlhLYXExYmdi?=
	=?utf-8?B?WlRNdmtmaFVEaVdwNm1iM1lNZHJEM1MvSUdCSkxUQUkwYmtENlV4RUY2RTY3?=
	=?utf-8?B?Znp0a3FHS0F6Yk96VlVHM0o2K3pTOS8yQnVSYmtTL3VpVGxoYUlmZjFTaU5k?=
	=?utf-8?B?bUN4bGpZWTRiWUNQRmFtSmdsQkg2c213QXRIdm90MVBnVE84ckRQcUxTSnF3?=
	=?utf-8?B?K24vNzdUbkN0b3FGcWJxRjBVRE5xKzJ4aGVRejE0S00xWEplZEM5WThWS0Z3?=
	=?utf-8?B?L3ZqbFE4R3RVU0Z0bnF0YVQxOFQvcDVEWWtaandGMDNUZUh0NkdQdUZTYit0?=
	=?utf-8?B?c2RxR3hMRndDVHdNYVlFR0dkN05qMlNCeEl3TElSek83MXoxTGZJR1hUSnRJ?=
	=?utf-8?B?cUdlWkFMNjJQRitORE5zRkhDdFNGZDVVM3l1VlNDOXpWV2ZPRzkyRG5TS2px?=
	=?utf-8?B?QTBqV1cyTzZrMnp4a1ZPYXU3ZmI1am5EWENwTWh0R0NoOEUzLy9JY0xJVDlt?=
	=?utf-8?B?WU5xNVNGMW94cUlKZDNmQ1IzRDNWb0hjZk9hTFc5dE5pYy9NcmxwZjJlZnYw?=
	=?utf-8?B?WldienIxbnRLOVpsQWg0Z1krM2w2bDY3c3l3bUlsRXVOSSszV3Viak9kaDFK?=
	=?utf-8?B?clhiT1FwZWIzTU9uQnFsR1l5eWErNEJtN2lsQ3VXZHRhM09hZ3JCbFdma0RM?=
	=?utf-8?B?clJCYTQ1YUd2NnY2Y0NCOStabUFFSW9uS2xKWCtveTdNU2c5TU92c0U5YXhE?=
	=?utf-8?B?SnZHTkFRa3QzTzJsQS85ZnlVbDNMVkc2RzJpYjdublNNalpDWXlZRXBqUjZh?=
	=?utf-8?B?ZXJKaUxGM2VHajFaS2tWTG1JQ3VDMm05bXJPcWpBVjc3Um8vMzJxUXJyZS9s?=
	=?utf-8?B?RzE3K1hMNkVDVGlJSjRuWGFTRVdtdm90N0FmQzdvWkdEZFZ1d1pEc1ArbG1C?=
	=?utf-8?B?YThGZzdaK1dRNHpBSmVOWVU4SWJ4V0dxQUdlaFZNOEwwaXlJRVVVTTd4TU9M?=
	=?utf-8?B?N2lXbUNsajRhTzArYk9xREc1SmtGa2pnUGJCMVloSGlTYXVQemN6VGM1UDVR?=
	=?utf-8?B?NDRXSGYva2lLTzRxYm1BNU00L3QwRkRCRGNnUGh1alB1RTEyS29FWUlUQzh0?=
	=?utf-8?B?TEJEUnhmS012VEt6QlY0UnN1RWJ0VGVTWGJPRGRrMzBNSGdlY1VYcWVpK0xs?=
	=?utf-8?B?TnRPWmpJemswd1J6NHRrdUsxcFd4d3RVbzlhOGVMS1o0K3U5SlM2VmpLZXNl?=
	=?utf-8?B?SjJzOWJKRW12VzlOS01YZXpHZm9RbStyaFYvMm5vSlJxUDk1cmZab0tTSCtr?=
	=?utf-8?B?NEZVYm93YVgxeXYyN041bVdIc0VpUTFxcWpJdlBaUC9FVTRjL1hxSnduODE1?=
	=?utf-8?B?M0dsRmlBVVF6dVNSZjB3RnBqeHRKc1pwbjVTSHVJZlJtTnJ5cjhrdjQ2MXhy?=
	=?utf-8?B?VnVTc0J6aW9PWjVPNXprV05KbTJmd1dLam1NU0ova2xJSnZ6Z2QrOUk4bHh6?=
	=?utf-8?B?Z2g4dDFqZlJNRzRmK0wxZmRqYnYrZFhaMytYMm5tRzlzeWxoS202Z3g0TENj?=
	=?utf-8?Q?GUT915p/?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7NjowUlVuNm9mdkhCbm9MOHo0YXc4KzhNZnJQ?=
	=?utf-8?B?SmlmS1dLdzVQdkJDVjlDUUFPQUNkVEVUcHEzQ0xJYVRMQVpzRURHRHRkTm9z?=
	=?utf-8?B?VUxiTlFPbDNUWGFGemd2c0xhd3dLM3BCV2VxNTZOOWxZaXppRlZjM2Jhamd1?=
	=?utf-8?B?QzVMU3EyMFVpdFlrSHVMejhSM0xWU0VsbXFPTDVjUlF4S3RxMzNwVU4zZ0VV?=
	=?utf-8?B?RlYrZU9PM1pBdnFIUUViSTdPS0xnZUVNYk56UUxtbzhmMTRaME45QW5xaklE?=
	=?utf-8?B?SmtMQXNHMjFNV3cyQzUyMCtGSS9hWjdpaTU5REFlQlVUZUpyclJNMU5wNmZo?=
	=?utf-8?B?UnB6bW9FbVJVckpKT1pQdTd6ZHJqbzlrMW5xSmw2NWtTSHUwVWM3Mm0vNUxq?=
	=?utf-8?B?TG9EZWtiWVlMRHJQa3kvWFVjQm9VV25MWmxGblE2NFBWZ091eXU1ZVg1bTha?=
	=?utf-8?B?WXpKNlU3ZkU4MW1zYkJiWHJ5RTMyMjB4cEN6RW1oYkxPTmZkUm5na3E1VkxB?=
	=?utf-8?B?enVrL1JVeDY2aERCTnUwSVdZTG1IMEtqcXloY293NWxybzVpanQrZW4xNzQr?=
	=?utf-8?B?WGV4cnJBaERnVmt1TnFIZFdOTzM5U2R4TzFHdFRPTmlxVkl0RGFjMTlkQWtQ?=
	=?utf-8?B?Z2g4ZkVPTWZ0YnZkWFZRdWxkZWNEL3FlQVZaRnE3TVBtcHprVVd5N0VRNC83?=
	=?utf-8?B?ZUx2MGExa2M5YmpiVUhUbWphL1JMQzVLdE01QzhXU0hacERZNkoxSk8wcXRN?=
	=?utf-8?B?cFFybHFhR1VRNmhpbVRmcU00bXFQZjBheGdML3hpUVFRTXVEVHFPTjdwRVBz?=
	=?utf-8?B?ZHlzN1Z3M2xpVGFwYmFLZWtvNGlSQ0hDR0JTUXZWN1h6a2RoTzE2aHpFaGdU?=
	=?utf-8?B?Si9OYm53OXh6bnhyb3Jac1lzVk96ODBYaTlHUkxaNGYzTkdINnFVMGhXb0RD?=
	=?utf-8?B?UzgrVExOK3kyNHdBOXdJN2ZuaGtOTUF3cFgzbitVZ3NJVVZ6K1huOVowNHJm?=
	=?utf-8?B?K2RuQjdaYkppa2N6dFRrWGp3SVNzTGRTQXp5VFhaTllSNGUzUXFqY0dqRGQ0?=
	=?utf-8?B?dmpGTHBjekExSU53RWJFcVpOMGtuUWJaSlB1Z2R3RkxLYWptNTJ1MWlVQVF2?=
	=?utf-8?B?SEo1bWFzcVI1aHdzcnc5bCtRaVdkZEM4elN3Q0dheEFVbnh4UXAwckxpRU0v?=
	=?utf-8?B?elNQSXpwKzNRTDNUKzVTOXFsZFJqUE8rSDRmOTQ0b1VpaE9DcVZRTmx0a1RJ?=
	=?utf-8?B?RlVML3dyWnYwSWJTZ2lERFI1cXFpWmdHZmo3WDdIVWFGRzRDV1lMOG92eGZE?=
	=?utf-8?Q?1zNtNCyq9Q3PdrKhCslCSMcFOTXSt2y78=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	5:nRdSfSXlgOxLgvC537jqfafVbd4ZQ8pxNxsfjfyUwAn4EYz7UkwpXPEorUSEgHNWwFY/FRB3Y9d/RV2gAwJ+WscfDhqNXsNvZ7psgFGjNHWx9Zts2jZrHDMExyvpvpbYBtrMr7h+QpGpDgg97mAD2g8oyySzJpdvRUqSrr/X6PnGK1x4rCvqcAwVYid6GZTLFfHYCyRP2mX5FvMxvAVuU28FOpOzqohrq4dCNHkPkag4Z89VSmVBJ0UWYkf8oVACL3KyWI9uRDLjIlNsL0ozLnc/epE2PxlJsGWrU9B3AcXUi5qWRQZ3YjOCIVWPrtqK6pLM0vomZvpMDfQ6kd6+IA6fdztOw+h2kT+LLMwfIVSSh/yTw5giMo/ap8yCM7/Q7SR3K380TRp66wAIJ8lZbpz+unb/Ui6IBiDfSsbm09iWW/Cx63lPqhOFdA16s8ngmUpOhfhW+0MXhhj3B29A/SSxZ5Vx0fhau8n1vIxavy0VJpiPHEy4rUfHIGuMZSJg;
	24:GjJYl4VBlinRe0Yl+wr95N4jDPNkkh6/jCSS0MXLedwDpZTJggcCapGpd7VJZXbTg/k0PpRkddxYyV8hNTycyoFqUgFU/lGMEkfglw4aTDE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	7:kwJTcBnm7XLXySpPsjlGOOU8nj1zQQ08f/AzjqrYRmPPtUvjrn5lDyGj6i+eGFTmkU/ntJEc7gkIXKdV6y7yk83zPCMBZzztyCaeZni4aIGYmmjLCnCj+bF6lEZ5SS3AgKdezOgo5OWwf6A4Wl1IKGZktXQhmUorxWC+/N6tqrj4k/+/h7Gcj7xrKQqp5/Tz7/uiHgfD7eo2dardAf1uykhcscdNL66GyKXOTbrriCrS0CkHr2Kw2y7VTtIfDQmltL6ggHu+3RFBOMZl2w0UNGM9WJtnU6/PMyenQ1jZXZK44u+pcx6OEfB9gr4hLn742zxJF9LpJG/yAroMmM4qGk+6rU10O0T09NR1/XeLTkRGiHazbqw3JimBx/6wzCLjXuihd5B4YLzvB1CyaRrVOFgCrydosuNU7mFJaaLMY7FxwCxUcIxKpsr9neVHWN6lHDRnmGMa92frhxLYTJx3AFq/f9BJY3jnACDS+dUnAew1+WOyT5+fyJqhd/9gdVRSNCut+Zer92EyzQ2nw0QoMkmxNsN8ARIhGW56tw9uI+64ZsM6XOXurjjjti2nSWIZ7N8ZwDeN3hjUF7vP5xC9HKr20qNIwHyLh+Z9i+jcI3vgpnr1V95bTl7DTrWyOmaOfuCD6yqdSJYSX3bd8mgV2FE+khBqCxwFsf0OImT2adO5WESmzE0NIeWVJGJkaleJdqdXuHQHv8cVt5qE09iohMAaSH7ZQ+bvDrsBSdCECfPr4iDe582HcIAwcObp0oDqowmZAkEnkvBdPva+hGiOmC70OLWSyIUXzrWNsH1g/Ss=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 23:51:14.8512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2941
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	Darren Hart <dvhart@vmware.com>,
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
X-List-Received-Date: Fri, 23 Jun 2017 23:51:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2017 03:33 AM, Martin Jansa wrote:
> On Thu, Jun 22, 2017 at 11:21:16AM -0700, Martin Kelly wrote:
>> On 06/22/2017 10:32 AM, Martin Jansa wrote:
>>> It basically just calls this script:
>>>
>>> openembedded-core/scripts/sstate-diff-machines.sh
>>> --machines="qemux86copy qemux86 qemuarm" --targets=world
>>> --tmpdir=tmp-glibc/ --analyze 2>&1 | tee ${LOGDIR}/signatures.log
>>>
>>> see:
>>> https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#L258
>>>
>>> for qemux86copy you either need to add meta-selftest layer from oe-core
>>> or apply:
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=9d45c08641b868322af4bebc2f095340cf4dac3f
>>>
>>> Sorry I didn't reply earlier, I think it's resolved by dropped kernel
>>> dependency and I didn't notice the question about reproducing it.
>>>
>>
>> I'm trying to run the script, but I'm just getting output suggesting
>> everything is OK, even with the old change that I know has issues. I'm
>> guessing I need to manually run through some steps that simulate what
>> Jenkins would have done before running this script ("bitbake world" on
>> several arches with a particular directory structure?).
>
> It doesn't do anything special before or after the script (you don't
> need to build anything in order to compare signatures).
>
> The whole jenkins setup is described here:
> http://www.openembedded.org/wiki/Bitbake_World_Status_Setup
>
> You can even call jenkins-job.sh manually if you really want, you just
> need to export JOB_NAME="oe_world_workspace-compare-signatures"
>
>
>> It seems to me we have a few options:
>> - Try to troubleshoot how to manually run the tests
>> - Submit the fixed-up version and hope it works. I agree that dropping
>> the kernel dependency will probably fix the issue.
>> - If you know how to trigger the Jenkins build manually, you could test
>> it on my new branch before I submit:
>> https://github.com/xevoinc/meta-openembedded/tree/open-vm-tools-v2
>>
>> I'm happy with any of these; let me know what you think.
>
> Just submit the fixed-up version and I'll include it in next master-next
> run on jenkins.
>
> For the create-pull-request issue we discussed earlier I'm using
> following parameters:
>
> scripts/create-pull-request -u contrib -b ${B} -i ${B} -p "PATCH][${R}][RESEND" -r origin/${R} -s "Backports for ${R}" -o pull-${R}
>
> Where R is release, e.g. morty and
> B is e.g. B=jansa/${R}-backports
>
> While branches are on openembedded-core-contrib repository:
> http://git.openembedded.org/openembedded-core-contrib
> and "contrib" is the git remote for it:
> OE @ ~/openembedded-core $ git remote -v | grep contrib
> contrib git+ssh://git@git.openembedded.org/openembedded-core-contrib (fetch)
> contrib git+ssh://git@git.openembedded.org/openembedded-core-contrib (push)
>
> and since this change:
> commit 98faa3ec872e06774b5870fcfb52f3ff91494779
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Apr 5 19:31:27 2016 -0700
>
>     create-pull-request: fix for newer git
>
>     Fixed when git > 2.1.0:
>
> I also need to specify local branch name with -l or it will wrongly
> assume HEAD and fail with:
> NOTE: Assuming local branch HEAD, use -l to override.
> warn: No match for commit 9d45c08641b868322af4bebc2f095340cf4dac3f found
> at git://git.openembedded.org/openembedded-core-contrib
> warn: Are you sure you pushed 'jansa/morty-backports' there?
> warning: inexact rename detection was skipped due to too many files.
> warning: you may want to set your diff.renameLimit variable to at least
> 1151 and retry the command.
> ERROR: git request-pull reported an error
>
> So currently my script calls it as:
> scripts/create-pull-request -u contrib -l ${B} -b ${B} -i ${B} -p "PATCH][${R}][RESEND" -r origin/${R} -s "Backports for ${R}" -o pull-${R}
>

Thanks, I finally got the invocation to work and sent it off. I think I 
recall hitting the note about "Assuming local branch HEAD", so I 
probably needed to add -l.

>>
>>>
>>> On Thu, Jun 22, 2017 at 7:15 PM, Martin Kelly <mkelly@xevo.com
>>> <mailto:mkelly@xevo.com>> wrote:
>>>
>>>     (ping) I apologize for the top-post but did not want to have the ping
>>>     lost in the noise.
>>>
>>>     On Mon, 2017-06-19 at 16:43 -0700, Martin Kelly wrote:
>>>     > On Sun, 2017-06-18 at 22:28 +0200, Martin Jansa wrote:
>>>     > > And there is also this:
>>>     > >
>>>     > > === Incorrect PACKAGE_ARCH or sstate signatures (3) ===
>>>     > >
>>>     > > Complete log:
>>>     http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/
>>>     <http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/>
>>>     > > lo
>>>     > > g.signatures.20170618_014055.log/
>>>     > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
>>>     > >
>>>     > >     * ERROR: 1 errors found in
>>>     > > signatures.qemux86.do_configure.sigdata.log
>>>     > >     * ERROR: 1 errors found in
>>>     > > signatures.qemux86.do_populate_sysroot.sigdata.log
>>>     > >     * ERROR: 1 errors found in
>>>     > > signatures.qemux86.do_package_write_ipk.sigdata.log
>>>     > >
>>>     > >     * ERROR: open-vm-tools different signature for task
>>>     > > do_configure.sigdata between qemux86copy and qemux86
>>>     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
>>>     > > glibc/sstate-
>>>     > > diff/1497786055/signatures.qemux86.do_configure.sigdata.log
>>>     > >     * ERROR: open-vm-tools different signature for task
>>>     > > do_populate_sysroot.sigdata between qemux86copy and qemux86
>>>     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
>>>     > > glibc/sstate-
>>>     > > diff/1497786055/signatures.qemux86.do_populate_sysroot.sigdata.log
>>>     > >     * ERROR: open-vm-tools different signature for task
>>>     > > do_package_write_ipk.sigdata between qemux86copy and qemux86
>>>     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
>>>     > > glibc/sstate-
>>>     > > diff/1497786055/signatures.qemux86.do_package_write_ipk.sigdata.log
>>>     > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
>>>     > >
>>>     > > So it probably depends on some MACHINE specific variable without
>>>     > > being marked as MACHINE_ARCH.
>>>     > >
>>>     > > Looking at:
>>>     > >
>>>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>>>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>>>     > > ab
>>>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>>>     > > vm-
>>>     > > tools_10.1.5.bb <http://tools_10.1.5.bb>
>>>     > >
>>>     > > It's depending on kernel, so it needs to be MACHINE_ARCH, also I've
>>>     > > noticed few more issues:
>>>     > >
>>>     >
>>>     > Thanks for all the feedback. I believe I've now fixed all the issues
>>>     > you outlined.
>>>     >
>>>     > I dropped the kernel dependency entirely, as we're no longer building
>>>     > the kernel modules (they all got upstreamed). Thus I suspect the
>>>     > issue
>>>     > is no longer present with my latest changes.
>>>     >
>>>     > That said, I can't repro the sstate errors on my local machine. Could
>>>     > you provide repro steps so I can verify this is fixed before I send
>>>     > new
>>>     > patches?
>>>     >
>>>     > > DEPENDS is there twice:
>>>     > >
>>>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>>>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>>>     > > ab
>>>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>>>     > > vm-
>>>     > > tools_10.1.5.bb#L24 <http://tools_10.1.5.bb#L24>
>>>     > >
>>>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>>>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>>>     > > ab
>>>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>>>     > > vm-
>>>     > > tools_10.1.5.bb#L39 <http://tools_10.1.5.bb#L39>
>>>     > >
>>>     > > What is supposed to set KERNEL_VERSION variable in:
>>>     > >
>>>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>>>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>>>     > > ab
>>>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>>>     > > vm-
>>>     > > tools_10.1.5.bb#L58 <http://tools_10.1.5.bb#L58>
>>>     > > ?
>>>     > >
>>>     > > Don't use tags in SRCREV, use git hash instead (otherwise bitbake
>>>     > > fetcher will reach upstream git repo every single time the recipe
>>>     > > is
>>>     > > parsed and will cause failed builds when github isn't accessible).
>>>     > >
>>>     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
>>>     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2>
>>>     > > ab
>>>     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
>>>     > > vm-
>>>     > > tools_10.1.5.bb#L35 <http://tools_10.1.5.bb#L35>
>>>     > >
>>>     > > There are many hardcoded paths like /usr/lib/ or /usr/sbin/, please
>>>     > > use proper variables like libdir, sbindir.
>>>     > >
>>>     > > Once you fix these issues please resend all changes to the ML, it's
>>>     > > much better to review inline than this.
>>>     > >
>>>     > > Regards,
>>>     > >
>>>     > >
>>>     > > On Sun, Jun 18, 2017 at 9:58 PM, Martin Jansa <martin.jansa@gmail.c
>>>     > > om
>>>     > > > wrote:
>>>     > > > Fails to configure on qemuarm.
>>>     > > >
>>>     > > > If arm isn't expected to be supported, can you please update
>>>     > > > COMPATIBLE_HOST restriction?
>>>     > > >
>>>     > > > http://errors.yoctoproject.org/Errors/Details/145599/
>>>     <http://errors.yoctoproject.org/Errors/Details/145599/>
>>>     > > >
>>>     > > > On Thu, Jun 15, 2017 at 7:50 PM, Martin Jansa <martin.jansa@gmail
>>>     > > > .c
>>>     > > > om> wrote:
>>>     > > > > OK, I'll try to remember to fix it before merge.
>>>     > > > >
>>>     > > > > I'm sorry about it, tweaking other people commits always
>>>     > > > > strikes
>>>     > > > > back :).
>>>     > > > >
>>>     > > > > On Thu, Jun 15, 2017 at 7:40 PM, Martin Kelly
>>>     <mkelly@xevo.com <mailto:mkelly@xevo.com>>
>>>     > > > > wrote:
>>>     > > > > > On 06/15/2017 09:54 AM, Martin Jansa wrote:
>>>     > > > > > > It didn't make it to patchwork, because you've sent only
>>>     > > > > > > the
>>>     > > > > > > cover
>>>     > > > > > > letter. I've added it to master-next now.
>>>     > > > > > >
>>>     > > > > > > Next time please send also individual patches. So that it
>>>     > > > > > > gets more
>>>     > > > > > > visibility for other people to comment and also that I can
>>>     > > > > > > use patchwork
>>>     > > > > > > to pull it in.
>>>     > > > > > >
>>>     > > > > > > Regards,
>>>     > > > > > >
>>>     > > > > > >
>>>     > > > > >
>>>     > > > > >
>>>     > > > > > Small note: Looks like the initial commit (24b2ac) has a
>>>     > > > > > small
>>>     > > > > > typo that should ideally be fixed before it's merged into
>>>     > > > > > master:
>>>     > > > > >
>>>     > > > > > "open-vm-tools: add recipe from meat-foss-openswitch"
>>>     > > > > >
>>>     > > > > > "meat" --> "meta"
>>>     > > > > >
>>>     > > > > > > On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.
>>>     > > > > > > co
>>>     > > > > > > m
>>>     > > > > > > <mailto:mkelly@xevo.com <mailto:mkelly@xevo.com>>> wrote:
>>>     > > > > > >
>>>     > > > > > >     On 06/09/2017 03:22 PM, Martin Kelly wrote:
>>>     > > > > > >
>>>     > > > > > >         Hi all,
>>>     > > > > > >
>>>     > > > > > >         This patch series adds a new recipe for Open VM
>>>     > > > > > > Tools
>>>     > > > > > > to
>>>     > > > > > >         meta-oe. This
>>>     > > > > > >         recipe is invaluable for using Openembedded with
>>>     > > > > > > VMWare, as
>>>     > > > > > >         without the
>>>     > > > > > >         tools, performance is very slow.
>>>     > > > > > >
>>>     > > > > > >         More information about Open VM Tools can be found
>>>     > > > > > > here:
>>>     > > > > > >
>>>     > > > > > >         https://github.com/vmware/open-vm-tools
>>>     <https://github.com/vmware/open-vm-tools>
>>>     > > > > > >         <https://github.com/vmware/open-vm-tools
>>>     <https://github.com/vmware/open-vm-tools>>
>>>     > > > > > >
>>>     > > > > > >         Please note that, as mentioned in the first commit,
>>>     > > > > > > this recipe is
>>>     > > > > > >         modified from the recipe originally found in the
>>>     > > > > > > Open-Switch
>>>     > > > > > >         repository.
>>>     > > > > > >         The first patch is directly from that repository,
>>>     > > > > > > and
>>>     > > > > > > the following
>>>     > > > > > >         patches are modifications to it.
>>>     > > > > > >
>>>     > > > > > >         Original recipe:
>>>     > > > > > >         https://github.com/open-switch/ops-build
>>>     <https://github.com/open-switch/ops-build>
>>>     > > > > > >         <https://github.com/open-switch/ops-build
>>>     <https://github.com/open-switch/ops-build>>
>>>     > > > > > >         yocto/openswitch/meta-foss-openswitch/recipes-
>>>     > > > > > > extended/open-vm-tools/open-vm-tools_10.0.5.bb
>>>     <http://open-vm-tools_10.0.5.bb>
>>>     > > > > > >         <http://open-vm-tools_10.0.5.bb
>>>     <http://open-vm-tools_10.0.5.bb>>
>>>     > > > > > >
>>>     > > > > > >         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>>>     > > > > > >
>>>     > > > > > >         Although the original recipe packaging was Apache-
>>>     > > > > > > licensed, I
>>>     > > > > > >         received
>>>     > > > > > >         permission from the author (Diego Dompe) to
>>>     > > > > > > relicense
>>>     > > > > > > it under
>>>     > > > > > >         the MIT
>>>     > > > > > >         license for inclusion in meta-openembedded:
>>>     > > > > > >
>>>     > > > > > >
>>>     https://lists.openswitch.net/pipermail/ops-dev/2017
>>>     <https://lists.openswitch.net/pipermail/ops-dev/2017>
>>>     > > > > > > -A
>>>     > > > > > > pril/014715.html
>>>     > > > > > >
>>>     <https://lists.openswitch.net/pipermail/ops-dev/201
>>>     <https://lists.openswitch.net/pipermail/ops-dev/201>
>>>     > > > > > > 7-
>>>     > > > > > > April/014715.html>
>>>     > > > > > >
>>>     https://lists.openswitch.net/pipermail/ops-dev/2017
>>>     <https://lists.openswitch.net/pipermail/ops-dev/2017>
>>>     > > > > > > -A
>>>     > > > > > > pril/014716.html
>>>     > > > > > >
>>>     > > > > > >
>>>     <https://lists.openswitch.net/pipermail/ops-dev/201
>>>     <https://lists.openswitch.net/pipermail/ops-dev/201>
>>>     > > > > > > 7-
>>>     > > > > > > April/014716.html>
>>>     > > > > > >
>>>     > > > > > >         --
>>>     > > > > > >         The following changes since commit
>>>     > > > > > >         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>>>     > > > > > >
>>>     > > > > > >           Revert "rrdtool: add gettext-native dependency"
>>>     > > > > > > (2017-06-05
>>>     > > > > > >         11:13:09
>>>     > > > > > >         +0200)
>>>     > > > > > >
>>>     > > > > > >         are available in the git repository at:
>>>     > > > > > >
>>>     > > > > > >           https://github.com/XevoInc/meta-openembedded
>>>     <https://github.com/XevoInc/meta-openembedded>
>>>     > > > > > >         <https://github.com/XevoInc/meta-openembedded
>>>     <https://github.com/XevoInc/meta-openembedded>>
>>>     > > > > > >
>>>     > > > > > >         for you to fetch changes up to
>>>     > > > > > >         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>>>     > > > > > >
>>>     > > > > > >           open-vm-tools: style changes (2017-06-07 22:31:34
>>>     > > > > > > +0000)
>>>     > > > > > >
>>>     > > > > > >         ---------------------------------------------------
>>>     > > > > > > -------------
>>>     > > > > > >         Martin Kelly (14):
>>>     > > > > > >               add open-vm-tools recipe
>>>     > > > > > >               open-vm-tools: add missing pkgconfig
>>>     > > > > > > dependency
>>>     > > > > > >               open-vm-tools: add missing glib-2.0-native
>>>     > > > > > > dependency
>>>     > > > > > >               open-vm-tools: clarify and expand licensing
>>>     > > > > > >               open-vm-tools: base_contains -->
>>>     > > > > > > bb.utils.contains
>>>     > > > > > >               open-vm-tools: update version to 10.1.5
>>>     > > > > > >               open-vm-tools: don't use mspack
>>>     > > > > > >               open-vm-tools: don't use dnet-config
>>>     > > > > > >               open-vm-tools: add #include to fix build
>>>     > > > > > > break
>>>     > > > > > >               open-vm-tools: add missing X11 dependencies
>>>     > > > > > >               open-vm-tools: remove kernel module logic
>>>     > > > > > >               open-vm-tools: line up configure options
>>>     > > > > > >               open-vm-tools: support FUSE
>>>     > > > > > >               open-vm-tools: style changes
>>>     > > > > > >
>>>     > > > > > >          .../recipes-support/open-vm-tools/files/tools.conf
>>>     > > > > > > >   2 +
>>>     > > > > > >
>>>     > > > > > >          .../open-vm-tools/files/vmtoolsd.service
>>>     > > > > > >  |
>>>     > > > > > > 11 +++
>>>     > > > > > >          .../open-vm-tools/0001-Fix-kernel-detection.patch
>>>     > > > > > > |
>>>     > > > > > > 35 +++++++++
>>>     > > > > > >          .../0002-configure.ac-don-t-use-dnet-config.patch
>>>     > > > > > > |
>>>     > > > > > > 41 ++++++++++
>>>     > > > > > >          .../0003-add-include-sys-sysmacros.h.patch
>>>     > > > > > >  |
>>>     > > > > > > 33 ++++++++
>>>     > > > > > >          .../open-vm-tools/open-vm-tools_10.1.5.bb
>>>     <http://open-vm-tools_10.1.5.bb>
>>>     > > > > > >         <http://open-vm-tools_10.1.5.bb
>>>     <http://open-vm-tools_10.1.5.bb>>          | 90
>>>     > > > > > >         ++++++++++++++++++++++
>>>     > > > > > >          6 files changed, 212 insertions(+)
>>>     > > > > > >          create mode 100644
>>>     > > > > > >         meta-oe/recipes-support/open-vm-
>>>     > > > > > > tools/files/tools.conf
>>>     > > > > > >          create mode 100644
>>>     > > > > > >         meta-oe/recipes-support/open-vm-
>>>     > > > > > > tools/files/vmtoolsd.service
>>>     > > > > > >          create mode 100644
>>>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>>>     > > > > > > tools/0001-Fix-kernel-detection.patch
>>>     > > > > > >
>>>     > > > > > >          create mode 100644
>>>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>>>     > > > > > > tools/0002-configure.ac-don-t-use-dnet-config.patch
>>>     > > > > > >
>>>     > > > > > >          create mode 100644
>>>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>>>     > > > > > > tools/0003-add-include-sys-sysmacros.h.patch
>>>     > > > > > >
>>>     > > > > > >          create mode 100644
>>>     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
>>>     > > > > > > tools_10.1.5.bb <http://tools_10.1.5.bb>
>>>     > > > > > >         <http://open-vm-tools_10.1.5.bb
>>>     <http://open-vm-tools_10.1.5.bb>>
>>>     > > > > > >         --
>>>     > > > > > >         2.1.4
>>>     > > > > > >
>>>     > > > > > >
>>>     > > > > > >     (ping)
>>>     > > > > > >
>>>     > > > > > >
>>>     > > > > > >
>>>     > > > > >
>>>     > > > > >
>>>     > > > >
>>>     > > > >
>>>     > > >
>>>     > > >
>>>     > >
>>>     > >
>>>
>>>
>

