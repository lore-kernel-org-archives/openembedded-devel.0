Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0057.outbound.protection.outlook.com [104.47.33.57])
	by mail.openembedded.org (Postfix) with ESMTP id B506A71B57
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=F84bGghoMkjy/8TcCmxtZ4txSl+1COfoi+5Hvh7qmdo=;
	b=m3AkP8S6g3H2XAaSJJpAma4KB957Y2JT9YV5SBy2V+GvfAgkDx/6LLwstzz+22dVA3jkmuiiFNSZApm3RXWOxlBHzIeHaNvQ1/ZldD1oRM0qluoyBERjh8rl0iROY5NOThyWFNNwEV6ZEFrITukljT7dWzg21n9eboaJIg3zsto=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 18:36:53 +0000
Message-ID: <1497897344.1599.6.camel@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQdbrZ+R37sKDXamFwW71G9MvYVF-Bb=8OO_k5ChdUFGGg@mail.gmail.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
	<CA+chaQcnwYQwBXfxbdpEN8D9ZYzG=fOxX_MPNXt1_uzShSSrwg@mail.gmail.com>
	<CA+chaQdbrZ+R37sKDXamFwW71G9MvYVF-Bb=8OO_k5ChdUFGGg@mail.gmail.com>
Date: Mon, 19 Jun 2017 11:35:44 -0700
Mime-Version: 1.0
X-Mailer: Evolution 3.22.6-1 
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR14CA0038.namprd14.prod.outlook.com (10.171.142.152) To
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b99776a9-5570-45e0-e7e0-08d4b7422821
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500041)(300135000095)(300000501041)(300135300095)(22001)(300000502041)(300135100095)(300000503041)(300135400095)(201703131423075)(201703031133081)(300000504041)(300135200095)(300000505041)(300135600095)(300000506037)(300135500095);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	3:S+fGBNMWx2VQhzi86qoCfm5mZ5ZYOH+94XmTL4GWeOGq742WqM+FZcsmbvOIUQnMsaR1jAErs/4JvuKojVE7fxi+FvQZCoic/PLyN7ErHInfX2syYkiSUKhIhxrmymP6W78cUi2Np8wNU4k+ng/4/dCw8j5ABRYdUTc/yoAKJ16tMIlyUAZggcmAiwTLR8wj6BskL1UjskZa/FOac9gvubqm1fz3k4GoH/pjAHp9dbBLMrBdWQteUn2iNVDOL0xbgczqoe2bIN4K4NLVV2BpgQAZxBf0qAccnA3HtLjayhj+jIC2zbkKbjBuHBkVJ13vJ1VM73A3nrNBbVkHLvHi00pJqDzYfx3u3My0FA+6RtPghfWdWepS5mLrWIA/7c8EW8SRFlVmW1NTeeLyxy0rE06MogqkILXCz/X8IszY4DzOSFEaMkKkeBUTYJ6UZIqF+oYPy6nF7mRrsF9Q8T/WF/Lklt0EA9METfaGALO/1gIRbyljBD9XVwLtD3bp60WP+G6FsfXENSHAvo4rNftZYPKm9/6VnU1mUvDE3aD7/twLkPJATisXWO9fzxDG4GGdPIwBxbMoYlK3FGbTy8eBkk9ydm8mOkN/mHGsKGp6rCTHcA0pMP6Z9dzodkO+A9aqTCfCLNFVThWOcFhKPDzptKaqnRD6Jx37YvC7SC3lXrN8sC8lB/obULONZ04gZ+7fXJ7SfAOHsrkDtyuZY7nCN1SaeGeg4TIJHcFK1rD58Xg=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2939:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	25:x4Cgk/zBwSt5vKc5q+1ZaBmBsoGWNpfrqOqdxbfJwuQ/jBS/5oJghXqNYdsIaRn7f1zUm/jEU0DnPvu9FIrrMXsCSNhNLIzffoeA33le71YwS9vCN/KOtlaVR+73ZyWBEefp3WHl88SXSxy5xT5wygTQ7IF2jW9m8muzRRSqSyg2O47Ulb1NKDbSvscuc9SeZP8FFmdqXhfveU8AupfZHNN4i+PubSsiGv454jHLmx120dmIczk2x0X76e9aTVw/J5E08b1Zpq3VAHNWkI9WRUF+YTvUBNZM+wacDMqjgToFcW2M9T7CJcGwcCLdnt26BnfPL+Wt0Pr/a/wVS8E3vn9W0Xm2oP7tBMzSU5WWX4WhEHodoCLT343YWZ57ayGHXyOw1B218cQ2hqkl0Fsro2uqZwMqdKv9adhXxTnD5Lwbc9PbgTeJSNsSyi5fGsReJTULbXhjxmpHUPIEfhwHyU+Opy2ARpIg6wyvKh6gsf3LPN6MWK+b38d4dkRIezvX7CUBzb0NfJXrxWr7ZgervdSidGAkdWr2zT8KhBOdc4GRHHVFSzqlh00eFmjKUUISwcHa+tgEgbuiuYlYbzpPT4fEi03Uha6oCPy935dNWzVaK1WcvuS+wqHZFlj3hqg3VTu2AZwdUDdJJGlncC32m83fuARF6Js62XnoB19KjfsnjV4y9ZxToBbxtcBCxHDmJY1FVwRqcK7VW6Y7qoBembOevO4hL/PInIEXr6bEEMEMBztVI6t08EJLueIYoCNn8Kh8nUXoMrXZDzIkzHhok0m8c1Zfw36K6nQz6nZh8SLwSryWaJD9s5tJ7lAYeALfe0sLajfurqs3hFRJw8KsB39pmQMUSg6hDrcrER94xcwFx3raeMX1pREutrnrD/z61Gqa4R++bv1dW9AtGN8Fuz7L8ZpZKRVvCjJbtT9hhrg=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	31:mpTen7EGERk4jO8ijUWPZBy2wWWQYFUbyAXTd+iMwI1LYgYoX7g0NXGaJCoMAmOce7nsi/M2aUASBVDhGbqDhVh6sqWeaHDwLhhswivyopcpmtAs1DGaSshAsyjqIKWw3gXglhCMbQM6IsQa3AODZkxmtp/OJ+u0mZ5wGwrFqwkFwCjn2+WyEUxzXRoTlphgyw/cIEoOJQp970fbQBpgZOEayfLwol83b+yKiqgELVB5Ch8cifrWXnz6aSDFJ8/29hRF7sb9eqrSXVLwACu4V7kk4MD6hCvm5h3NaEfSzyoyW9UjxOXVoStvEajyM2uURlhpPWV0gSovmwvIpX5oxwMpXxKfS3lcMyqKeUD7nWfNnZRUJnWhIpBJAJwb5i6C2QOi7/w7QeJXg6W+lv3mupaco+/ZdnPb8DfZIaPFngGTwMz2pxu9y46RNZj4QfQAws5dKaRPj6CwASBZ08b2VUmlGg+27Qpm3hjaW94KFZ/aqsQbCmkXvAshp44TaY1QQsrlWvAXsJsYUQsChceIIOfS4jvd1bUN5UFkkSzFb9Hlypbx7O5tuDZKOrdVgp2r9qcZjD8BYPdzoyktyKn1yu9qnwDwmTccC477sW0gM9rS88sdslBp1N88vZDzxpnfiq+HJVKsIgpzAxnm70/O/UCd0f0EAfTG92vurmpGAUEQNd93Eu93pzNrjfwk/4BJFb9HXorI3ETy5Xy7oBnJLQ==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	20:hPvhmR9LebgNVHVb4XzJIRm4eEXl5ekuwXVbSg9yyU6zAbE780rXLSPFog0hJ1rtvX4kDccKw4yrj+r+ZthQN0MlmOB/e8287Dqz1djgwMfQi05tKs9u3XWrB2RRyC4jL3C8d+EJWx9JsP78oy1cwMN3l+RNf4f9XTjAu4y1CRoaz1Dxvz8D0dKuBbTowG563lnDfa4lzrP2W1g+yf7b2+iAsVbwkf+mQAXSQ2cIna1iBFHsLP5hHORotMhYfSfPQySFLSYhVeLRGhZAci6owYKW/0IQAftPKTU2Un4WaXY1UAknKvBB2yg7X+mwm71exobqcZupwoX7VQVCNoGpDA==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB2939F6821A71DAFA6B4A5989ABC40@DM5PR0101MB2939.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6041248)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2939; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7NDpsTGNhOW9nNHp1Y3dLV2prTHAzZGlUVjhS?=
	=?utf-8?B?eWdWQ0JmNVk0OEhycHlSaGhzcEhrWklYNVo3UlBqRHdZT1Y1RURLRXJKRDUz?=
	=?utf-8?B?cUFZaloyY1BFSEg2Vzh1ZFRJS0UxZDdxcVBCcythUVZ2ZEIzTGlkMjFSN2xE?=
	=?utf-8?B?Sm13a25BYUFLTjF4Qm54ZXlIbmVuVHYwYXl3R1BEZGRvQnJTWVRpZ2VmbkJ6?=
	=?utf-8?B?NDJjYStXeDZhTmJ4bnRXM3ZQdHRYdXNtSFpMZFpjVExIcCtrZWMwUCsyM25Z?=
	=?utf-8?B?WUFnS0c2OG82K095WjVsWFlYZWkzRllXcmh0aHQ0ejdOdVo4dnJXZThJekZP?=
	=?utf-8?B?a3kzTnBheG8vaGdKUVRjK3dNOGpONS8vbEpaRUtPR3NIcnBmRDd4YmVEaysy?=
	=?utf-8?B?ZTdqOHZ0UlduYzhaMDNFVWF3bTdNanRjTmxLR0VHTnBNUDdzZTdyKyszQ002?=
	=?utf-8?B?cnFmdEVZaW5PNW8vK3ordXBYc2YxeExnNHArRHlvNllBQlVSZnNTbVMxZlA5?=
	=?utf-8?B?Y2V2cHhhY1gySmlxY2pyL2liQ0FpbGErQnRJMXAvQ0trbU11ck9kVG8rTnFz?=
	=?utf-8?B?bUdNR1RheEQwTnFrMEJnWElCcHdaQUJCWGZGbXZOcUNBZ0FQdGFYNE5KSXZH?=
	=?utf-8?B?L25JaGQ2ZUVzQU41NE43bjZERmIwZi83MEhMdy9ZU25pZDRmb0xnWnorSW1X?=
	=?utf-8?B?THdhVHA1NytaeC84SnA1QXU2ZkJKUHliQ1p1RFloTGp6YzRhVGh5alBSbjdr?=
	=?utf-8?B?SE5abkUzMHFQRFJiQzE2UTlraWxvYjZHdWUyUms5SDVuWUtyZktRWWU3QUJX?=
	=?utf-8?B?N09Scm1PWVNaQndsYXBzalJHSFhQQVBxbW1YeDNJOEttODNKV0duejQ1UFZr?=
	=?utf-8?B?dEkzQ3ptdW5aRG5NTGFkTjA5dllVb203SUhPQXhCQ2pKSnUrYkV3cXpaSVN1?=
	=?utf-8?B?VUtsNis5Wittck5wZG1mdjV5SnE5ejdRaFhWbFZLKzlWaXIyY0IvQTVwTTlC?=
	=?utf-8?B?VE5EWjA1d1AyUVlxSkRLOThDdWN6SXkyZEF6bmQyMThwRVJwdzFuenRhZGlM?=
	=?utf-8?B?RW5vT3pDZVpsbzgrNWZPWm1jZmRuWmQxSEFSKzFvUi91M1MwL0FuWmpNL2tE?=
	=?utf-8?B?Y1JXQmYwQWVRSjBQeVNtQ0w1TUZRRjdITlNsWUxJMEVhRVJ4N3NGaFI3bll0?=
	=?utf-8?B?ZDJRSWhVdzFlbURmQmpsc3lkSk9HWktVNHpwRTU3NUt2YU9ra1NXbTRrUTBl?=
	=?utf-8?B?Q0VWL2JEVmpNOWVaTm5ML092bFRTWFRHaWhRSDN4OSt2ZVJ2ano2a2R6bm4w?=
	=?utf-8?B?V1FFdDdhYU9pZVU0SHV4ZWxNWkxiVjJKK0VqSnlhcjJ0NGFQQXROS25jZlEr?=
	=?utf-8?B?WlJ1NlRxbFc4bll1dkNRbEVRN1R4QTh2ZHZXdHB5THkramJTbktQZnhtNUpx?=
	=?utf-8?B?aTNLTWJJYkdmZE5IL1VNT0ora3BlNllNQnNZN1EzbjYzaStTNlNWcEN6a2Y4?=
	=?utf-8?B?TzB1T0Vaa05sallOWkxRclFRVXdMY1J2cG5VRXQySHUvd2tmeGhJZGhzN3RO?=
	=?utf-8?B?dVFEU1lwbjRaSGNLNWNoaFJoNUFHU0h0L3BMb01HU3VhVW0ycDRVZWNMc1Jv?=
	=?utf-8?Q?1hpKE70otIhDBF5eTxsrM?=
X-Forefront-PRVS: 0343AC1D30
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39830400002)(39400400002)(39410400002)(377424004)(13464003)(24454002)(377454003)(53754006)(229853002)(53416004)(230783001)(33646002)(81166006)(8676002)(93886004)(3846002)(6116002)(478600001)(6506006)(50226002)(42186005)(25786009)(5660300001)(6666003)(103116003)(7736002)(2950100002)(6916009)(66066001)(50986999)(47776003)(53546009)(5820100001)(36756003)(50466002)(76176999)(86362001)(305945005)(6306002)(110136004)(6486002)(38730400002)(189998001)(966005)(2870700001)(23676002)(6246003)(2906002)(6512007)(54906002)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2939;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7MjM6Y2g0OGs3UXFmYmdCL0thQUIzY3ZXa0h1?=
	=?utf-8?B?a01aKzNQRWhGc2JjNTh1NG5FN2VvY0NodTNGZXdJSlVrbGhzYnJwaFpwYkor?=
	=?utf-8?B?aGtuZzZwMFBjOElhaWZhTmlheWc3K2dIbExOS1Vtem5Gald3YXRBZGZtNHBi?=
	=?utf-8?B?bTdVVzlYb1R1NmJBcjk3L2dtYnBYYW8xY2xvaHg0emRHM1IzMEFwSmc2TWE0?=
	=?utf-8?B?VEkvdHZ5Q2pHcytlV1FtOTlXVFhsYTRKTzVubGlTdjNYSVNINUVyQzErbWtl?=
	=?utf-8?B?TlQrVFh0YjJlMG5GeHdiWDk4b0RxNWtFaWdkdk9pKzZKa0FCWkhNV3kwTzVV?=
	=?utf-8?B?Z255VXNpVTlFMldxWVRHSW9JL3c4a3hEc2UvSm1TNkp5YklwemhhSFlQSkJm?=
	=?utf-8?B?T1BDYy96cUlKekhLekpEMGprY2RjdUdZZXhrYWYxeTA3bzNMMEI0Zk5xaVRU?=
	=?utf-8?B?WkdkWnVNWHpDbzIvbDlLUWpEbytGNGI2c3NDUGkvUEJDVUlvbUZIQlU0SmFM?=
	=?utf-8?B?dFp2am9GNzFYUzBRZlV1YmEwSDAyeXVZRFBqYU0xdmdxejFZY3BQTTZsVlhS?=
	=?utf-8?B?Sit4TTJMNWQ5WFcrc1FwNnVpMUZMN1VxNzRVdFc2d1JKWVVtUCt4OXZXRDJR?=
	=?utf-8?B?UXdVemlpeUt5dWlubHJKcmtpV2IzV0FmL1o3V0hKNGlKR1prbHlNYzk1NE1Y?=
	=?utf-8?B?Q3RUdjN1WThxVFhQK3N5Ri9jZWRHZWxNKzJxdWtIYkhYVWZ2a3ZZZnBhVzRX?=
	=?utf-8?B?UTh2c2phVGdtd3ZyaFZyUnpNUTFNWDlmdnFQcUxyYUNiL2MybmdUaU8vcDdN?=
	=?utf-8?B?SW96VkoxUTRpNytBNVVzbE5KQXZ0aUozVkN0K2w1aVpnVWFzVFVlZlMwUERC?=
	=?utf-8?B?cXg4c3pzdiszcFlicFVPRDlJcmpjTWM3R3FwUmkwb0hFYjNnTEFBWllCUmxP?=
	=?utf-8?B?T05QSkx3YzBMaCtDRlMrS215VXhaVzlCOExsT2xmeGRXditBYTh6UHIzTXpM?=
	=?utf-8?B?cm1RZWMvdksrckJIRjBZQnVub3YxSVkvbTRabzZKdTIvSGtHRmE4Y2h6TnJj?=
	=?utf-8?B?RzlLck5wMVBhSGhZZE1YTjFKUmFwYnNISUdLVWxiY1ZEUWR1MjR2cnJha2RX?=
	=?utf-8?B?TnB4YlM3QndPU3pjaDRTUEFiVGlCcEFmZmx3eXJQcHRIS080WTdZSXNlQ0pJ?=
	=?utf-8?B?OXQ0Z1RLMXp0WG4yYlhLR2ZWTnRpU2t4aFJ0VFRZMDBjNmZDRkw4ZmxpNzNJ?=
	=?utf-8?B?WnVNQ0ljblFtMmdkK0I3TWt1UzV2c3pRenY0WTZQdGhqQ0tadG9XSktCYlVG?=
	=?utf-8?B?WXczRjlyYTNDUDgrNDZ4SS9OUEdxRFpHRCtxQmFXdHllWkxxcXhXVzI3MUdN?=
	=?utf-8?B?MGxSMWhFeFJUYjNoemh1Y2lUWDQ4UE5BYjFvM3BFODkwaGgzNjNIMllvekpT?=
	=?utf-8?B?TEdmZEZPYXROR05VYzhCeENqNlRDMXRMQkhxa1VoeDlpOUkzTDZMc0crZGxw?=
	=?utf-8?B?Q3JSM0o5dG8wK0FmOXNUa1ZFdlVFM2xJb1VLVWV0dmRzNVhmQkVHak50STRO?=
	=?utf-8?B?UVJZY3hpVFlGcURSS1JQeDZraW9uNGVKNWRwbjRYbVlWUzA4K2ZINTFqcmZx?=
	=?utf-8?B?L3FYdmM0bHJva3JrMk1LdE5PdjZYSzR1R21rM0VQRUFRVE8yOGhWZTNDY3Uy?=
	=?utf-8?B?aXliU1RKSE0yTzAxaEVNQUJXNnpCRW9CdUJvb2xoZ0d6SlVyZ2o3SmpBUFdU?=
	=?utf-8?Q?lL+kD03iuL7C0YGdqxB4CBe8E1/pl7KOp/JREqA=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7NjpEemIwdWM3VjRsV1pDNDJiOVAxemtKa3oy?=
	=?utf-8?B?Ry9rM29ZV0lVYkVMVkJXVFV3VVo4bWV5OGliRkgzeEl3VHkrNFhuQ1gvWHk0?=
	=?utf-8?B?dS9LOHYvY3lUWTdLYmFVUU82aDlKMHJHZGE5aUNwNUIzY3RPZHZrZE85SC9v?=
	=?utf-8?B?VEg0SDZydHVNaVRsT25LcTl3SDczbmxVdzdJNDRtbHRGVEJqUkhMTy9ScmtC?=
	=?utf-8?B?bzV1dis5VlNhNVVJNkE3NXFKMFdTR3pxb05XbWk0a3ZQbzg0b1lXaG81d3RX?=
	=?utf-8?B?QllRZHMvSjRyQm9RNExNbXhhSWRFQlE5NmQ3R0kxRjlhZGZsRnprUjVaUHhm?=
	=?utf-8?B?dDJDV0VZZkNodVhGZXJqYitUY1h0VHQ4ZU1WR3dIcE5KUmlNMTFuUldoVHZF?=
	=?utf-8?B?a0VRajc5UnNhVkJxbjZBNEQ0VE51ekV5U3JVZStUTG55M3pHN083Mk93c1hm?=
	=?utf-8?B?NWdhY2RMRDdyVVJ3MkdpOVF6YVhXSjdBK3ZGYWsrUnNRb3VSdnlTMmxHY3ZT?=
	=?utf-8?B?TlVyRmFSOWtJR2tqMzFMUFdYL1IxQW1tb3R1ejdmcUJXYkVvWUtRdVE2N3Q0?=
	=?utf-8?B?VkdEVFRxWkc4Nmp5bnplWklxbUN1VlE4U05lV3FFcTJReC90SCtRZGJWcDFE?=
	=?utf-8?B?aFdNNGlRTkM3aXdRdDJVUnJhTW41WnFTVTU5SDNKZVIxL1BGU1hIN3NhSkZq?=
	=?utf-8?B?MDE2ZDBnRzVhYkIxNjgyU1MxdmF1b0JMNW9VaWZxMEJqRUg0ckJyYlRHckRC?=
	=?utf-8?B?MnU5c1B3bjFOajBJWlVESFJiS0ErbXp3ZFI5MEQyTEprZnNIWHZMTThjZ2xD?=
	=?utf-8?B?U0JGSVdJZnFkeFhaUEZpNzliZkVtaFVsbEFtL1E5dVpHbHE0NEc4T2JvRDF6?=
	=?utf-8?B?c2huRjd0YTE0SVVXY1p6b3o1WEk5RGc3cllubUp2RVFxRkppQTk5QXdnNENY?=
	=?utf-8?B?cnN3R3FOMWd3STdCODZPeW5peGhtMmJ2MlFkNXJxZjM5NkcvWWZjdFlmaW5L?=
	=?utf-8?B?TXhtMFFXdGpOandMQ3Bhb25HeFcxMDRkeVhNa2hoYjQwTzN2UldVM0Y0YVA2?=
	=?utf-8?B?KzYweEs3blRCNEFRZW94a1plWmtoYkRzcnNtb0JJR3lkWi9UYXh5cHJZM3Rv?=
	=?utf-8?B?WVJ6TWlRQWMyMUkvdFVYbHdGZ2NLbGlFUXVUTWRBR0dHUndoTlhEQVlZWjZX?=
	=?utf-8?B?TXdiWWw1bEJsSXNYS3JmYnl5d2dQYW9ENXowdy83SXNiRmtJLzFPV0tvamJT?=
	=?utf-8?B?NHY4QUJGd3N2WUx5S0VQaSsrTko1UGM0WVIvekoxNGFvUWl5QmpaVGhqVWVP?=
	=?utf-8?Q?tM6Zk9SrgkTipxcRcM2ujGAz7FV4Yeqpo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	5:d9diQOy2B3qYc/aIr8egYOkT9CA/GarXNjqzsia3lmeTF/iILhMZvRENKbQcWX5Yef7vj0kJplPsfJp1PYtk/riADVE21wuxzR+0asdyjXkXYy9aZKUg04UbMSa0Dc3ZT5yi/hgc+OgvofaEZX1qBJLXRLvzZ0/WkywgjsFYpIDPbT6M5Qd+qHDHbazCwZj1uziT3sALMQpqoojt2s48ncB4AT+wvEn7RbsfsXpa4j5XtfORKeKHPU4OCuBajJ7tY+Xxlj0ztdiuCwO+czJB6bL1uV5loqFzMGpxTkxwE9ZPPfDjRFCc4Ypg8yhQnS9zvVAiPfjybvrUVmk/JwpAL0DF0lVOPnh/j6RNSt8bUVJlsha24DJPT/1yh6VZv9ZAnwxpmgJidajXQKWTv/4EabhSbQG+oWbMJYfz6XjZV4fG2lJzrgLAMkq3Anaja+02zaG7RAr2hC0pJoc9Qm1cpWohoMzrmRg38EuU54PTcYnriA0bXgTBv1yuSKk5Qv9h;
	24:ANH8+HHwkp2imt9oDnNXd1AEX7sqp4+FEZZRtrycVRb+S+k4sxeXW2Ubv+krrI6te6axO6Olk2x3OIPdFIu6NCqSiIwme+V4umrVFc5qxo0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	7:LL5ceClVxdNjuNseNP+J3O4D7vaJbFz3VlauragGWDrAwj5CkTfWyyUnv+L4AdLA9SmlahSXsNfdy8g0PQv2DH/25nXiERoBaGZ0lUTQzc1a5A4PwXLbwOMkL4zVOC2qfudXLnpAcr9Jo0XTcOAFii2ML9s/8f2WL/QmUuscOqcR+hOvKxSPOfjdpeP1JYTR8nvm3Pl97/5L5+ypOUmDceH3FajLIPYpfGXMmGAnNkTen+7AWAMf+x7nLr0Hx8JqpqKxoR7Cyjjg4ThtSJN7RDBBsyb2PBN+LdUoutz+XaVij06xhWZlAGO4iOaKgV0MndvmMC7/zcwejYZSIsX7rcRRV2oauRGQg7jgyATqGzqOfW4QqDjC5+LEZ+eC8n1ldYKk0if9tC0Wn2MPAL/jxV7rEQew+593OMw/XnVg9kwRO8VCRFFKPjJh3EanZ2DlfXlWtuwKBJYmS8ZTUQKx7QSON04yeD7+KMOUToA6vXgIJEn38hgDhNfeAynHp6UuFJ9oCIQ+OnhxU9iyGxLrUnIxLgm/3LYWAstvpOHzP2k4FuvD5Ah2VJgHuBXjmVn46B8Yd4l7mZSEQqlV8SfMlNAKUNFo6cijB0vuFLVhp90VDKgN5U2wCjFQYQj1rBPg5t/aLpxMur3s88b7GPou+a2bGjG0CEcCHseVds6Ha0q7GVn9PshpnTxLD/jBI1cnfJrWpcGYiaYvd0encRiOBVY0m47P+l1t57MX1j41a19hTr6NwrV0tRoxOu7Gd9u54DUoFC04tbmgTjLkSex+3kJpTVnLHnAZ8SeRSBMMyfw=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2017 18:36:53.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2939
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
X-List-Received-Date: Mon, 19 Jun 2017 18:36:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-----Original Message-----
From: Martin Jansa <martin.jansa@gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, Koen
Kooi <koen@dominion.thruhere.net>
Subject: Re: [oe] [meta-oe][PATCH 00/14] new recipe: open-vm-tools
recipe
Date: Sun, 18 Jun 2017 21:58:47 +0200

Fails to configure on qemuarm.

If arm isn't expected to be supported, can you please update
COMPATIBLE_HOST restriction?

http://errors.yoctoproject.org/Errors/Details/145599/

Yes, I will fix this and the other issues you found. Thanks for finding
them.

On Thu, Jun 15, 2017 at 7:50 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:
> OK, I'll try to remember to fix it before merge.
> 
> I'm sorry about it, tweaking other people commits always strikes back
> :).
> 
> On Thu, Jun 15, 2017 at 7:40 PM, Martin Kelly <mkelly@xevo.com>
> wrote:
> > On 06/15/2017 09:54 AM, Martin Jansa wrote:
> > > It didn't make it to patchwork, because you've sent only the
> > > cover
> > > letter. I've added it to master-next now.
> > > 
> > > Next time please send also individual patches. So that it gets
> > > more
> > > visibility for other people to comment and also that I can use
> > > patchwork
> > > to pull it in.
> > > 
> > > Regards,
> > > 
> > > 
> >  
> > Small note: Looks like the initial commit (24b2ac) has a small typo
> > that should ideally be fixed before it's merged into master:
> > 
> > "open-vm-tools: add recipe from meat-foss-openswitch"
> > 
> > "meat" --> "meta"
> > 
> > > On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com
> > > <mailto:mkelly@xevo.com>> wrote:
> > > 
> > >     On 06/09/2017 03:22 PM, Martin Kelly wrote:
> > > 
> > >         Hi all,
> > > 
> > >         This patch series adds a new recipe for Open VM Tools to
> > >         meta-oe. This
> > >         recipe is invaluable for using Openembedded with VMWare,
> > > as
> > >         without the
> > >         tools, performance is very slow.
> > > 
> > >         More information about Open VM Tools can be found here:
> > > 
> > >         https://github.com/vmware/open-vm-tools
> > >         <https://github.com/vmware/open-vm-tools>
> > > 
> > >         Please note that, as mentioned in the first commit, this
> > > recipe is
> > >         modified from the recipe originally found in the Open-
> > > Switch
> > >         repository.
> > >         The first patch is directly from that repository, and the
> > > following
> > >         patches are modifications to it.
> > > 
> > >         Original recipe:
> > >         https://github.com/open-switch/ops-build
> > >         <https://github.com/open-switch/ops-build>
> > >         yocto/openswitch/meta-foss-openswitch/recipes-
> > > extended/open-vm-tools/open-vm-tools_10.0.5.bb
> > >         <http://open-vm-tools_10.0.5.bb>
> > > 
> > >         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
> > > 
> > >         Although the original recipe packaging was Apache-
> > > licensed, I
> > >         received
> > >         permission from the author (Diego Dompe) to relicense it
> > > under
> > >         the MIT
> > >         license for inclusion in meta-openembedded:
> > > 
> > >         https://lists.openswitch.net/pipermail/ops-dev/2017-April
> > > /014715.html
> > >         <https://lists.openswitch.net/pipermail/ops-dev/2017-Apri
> > > l/014715.html>
> > >         https://lists.openswitch.net/pipermail/ops-dev/2017-April
> > > /014716.html
> > > 
> > >         <https://lists.openswitch.net/pipermail/ops-dev/2017-Apri
> > > l/014716.html>
> > > 
> > >         --
> > >         The following changes since commit
> > >         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
> > > 
> > >           Revert "rrdtool: add gettext-native dependency" (2017-
> > > 06-05
> > >         11:13:09
> > >         +0200)
> > > 
> > >         are available in the git repository at:
> > > 
> > >           https://github.com/XevoInc/meta-openembedded
> > >         <https://github.com/XevoInc/meta-openembedded>
> > > 
> > >         for you to fetch changes up to
> > >         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
> > > 
> > >           open-vm-tools: style changes (2017-06-07 22:31:34
> > > +0000)
> > > 
> > >         -------------------------------------------------------
> > > ---------
> > >         Martin Kelly (14):
> > >               add open-vm-tools recipe
> > >               open-vm-tools: add missing pkgconfig dependency
> > >               open-vm-tools: add missing glib-2.0-native
> > > dependency
> > >               open-vm-tools: clarify and expand licensing
> > >               open-vm-tools: base_contains --> bb.utils.contains
> > >               open-vm-tools: update version to 10.1.5
> > >               open-vm-tools: don't use mspack
> > >               open-vm-tools: don't use dnet-config
> > >               open-vm-tools: add #include to fix build break
> > >               open-vm-tools: add missing X11 dependencies
> > >               open-vm-tools: remove kernel module logic
> > >               open-vm-tools: line up configure options
> > >               open-vm-tools: support FUSE
> > >               open-vm-tools: style changes
> > > 
> > >          .../recipes-support/open-vm-tools/files/tools.conf |  2
> > > +
> > >          .../open-vm-tools/files/vmtoolsd.service           | 11
> > > +++
> > >          .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35
> > > +++++++++
> > >          .../0002-configure.ac-don-t-use-dnet-config.patch  | 41
> > > ++++++++++
> > >          .../0003-add-include-sys-sysmacros.h.patch         | 33
> > > ++++++++
> > >          .../open-vm-tools/open-vm-tools_10.1.5.bb
> > >         <http://open-vm-tools_10.1.5.bb>          | 90
> > >         ++++++++++++++++++++++
> > >          6 files changed, 212 insertions(+)
> > >          create mode 100644
> > >         meta-oe/recipes-support/open-vm-tools/files/tools.conf
> > >          create mode 100644
> > >         meta-oe/recipes-support/open-vm-
> > > tools/files/vmtoolsd.service
> > >          create mode 100644
> > >         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-
> > > Fix-kernel-detection.patch
> > > 
> > >          create mode 100644
> > >         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-
> > > configure.ac-don-t-use-dnet-config.patch
> > > 
> > >          create mode 100644
> > >         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-
> > > add-include-sys-sysmacros.h.patch
> > > 
> > >          create mode 100644
> > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> > > tools_10.1.5.bb
> > >         <http://open-vm-tools_10.1.5.bb>
> > >         --
> > >         2.1.4
> > > 
> > > 
> > >     (ping)
> > > 
> > > 
> > > 
> >  
> 
> 

