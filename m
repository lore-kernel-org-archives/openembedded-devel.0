Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0074.outbound.protection.outlook.com [104.47.33.74])
	by mail.openembedded.org (Postfix) with ESMTP id 962B578224
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=70Po3uDRhSlDcaKRzvOIMzL6NkYmDHrEjEq89cnxTt4=;
	b=rXCcg54UuZ3gCRSguZ4JjMxSRuHpvq8YxYB5chrtiBFVp1FeHiChgTex+QiEOfn0e0gFZGav3exhlO1CGW5IGXqsvROfn2k7T4+F9pGMQlPjMLjIeMIn6z8YOgEzc/L5VIZ+N3exjiV9gNjZDylttxlfnNkg8Lcio9EbwYe65cM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:06 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:44 -0700
Message-Id: <932516d2825dc64d5f128be28eabedb1047f4315.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 241ae172-1940-4578-530f-08d4ba8a0dbd
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:5JKQ2SwhbCIld9UPDR4GBIMwq9G+8aFk6Q8a69zeyNMDyc10hemK+CPoBk/IV1pPeSdPFwmhOMGNJUefHyOrJVrU0W6bkSuZ+SGCWDeIE1bfSK/ifa9W7IiHU7BNoKqSsLutFZQ8oiTEbHjPnbmWjtfqBnNc1DTJOequeUiRoeDqWxJ6WnSNeq/15Y+ZVgrxxDoF9ozWe9iRTnkL3RFd64cE0QT4Ek/xIlRynD0TUFlZmIdMeHy2Zwx1xrjR5zc9HNbkcG084CCDr1DYchdOnAPRuSXsKK9dWOwjo07ZGj05Ge2DVrnUuTp+B2FYrpxNrewrUOde+yna81ptPg0Jw1p1fH8kNTAph2R5VxPo27XBwKzNjI+FskIIpFiKRJ9gHvvk7/KppVLiHAPmA9DflQ+PRgR6Aiu6Yar8RUnJDPK2IW5GhWMAMXmmQXg+g/5o4ReA+UxlmJ546prM83rwmV5KTqDRDnFecKwH6Ed/pDzlx0PvvBsdq5eRfuBcKITk3uYP+vPv26H8f5tvHL44u/AzuIXlZMhYMrEAEYZhLDkq4cIqnLd5j2CuvnoV2axMm+NE1AVFGLtQiG5XjU2jRzw/6BfTZo7ryLzcyVnfUZhf0j++m1pBCxCKKi0xtkd5sgJrSNeNaJPCWaaVbTzX3S+eqZP0agC/kNsYLrYhL9F60yJm4XQGSLrpU/kefQ7+T2Ydwztf5mpd9qT3TNHJs4+eSJSOObDeoOp77K1irps=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:A2nJ0o90szoypNeMse1ua7XdNEVz7agIuY6HSBNoOM7ORquWP8HTi8ow5tD+x5RMyeeiTpRFStu5mvAShkpIukXypwZWwj1GJf1a8SLp7T3oiWtVFLRE+Octo64XI9dbj9ZdCB69gYrqAsSQZrqIZLCF2Vy5Hliydaej9A3XTjRY4VfUmCTiopL5L7zWjRPXXUKXk42vDPefPjCOoG1JFzTykeZigEQoDMVsn44UjUfMfwzCrbM1S8qCU16u7ZLnmYr8D7jw991H25yNGQjPF/KwsLAlz77rrqKJtRdvJnIQZoTDFMKRtQbDyfbA42PMgQct/yasS+7mBQ0jf9fpiEKAZztnmHVgxlSo3G035NCFKt8nfPIHQd6G7p+igp2Ydh80UkdGVbij9i0RmfJNQfikicGkE/kW2l75cGY/TVZVOa5OCfUAtf87lShonGVywOPJ+motI+RzzGJ2Ug9geL7WAlCQHErgbGkn9HgyDG7kxau2J5f1QtNH0a6HQPnUDDJuYLh6THAEG/aQdTKSIdJzj9Tg7ja2kpWEezijRVfK/F6Rjk6XaoXpaoouSzrfNDA6X9nJAQvO9pVzbVwZWOY+wcdf/IKg5Dm1V5vraERAPqu/Cc3Vbi6GpdikzQkAE7TKp2UzivqOkz/Whjygnz2JMfRHxiG8DucunygkwFl3vZeYYPnWlze9O4y5xhVYN90rnjE4pIet0votL7bcxdrJEnnZmKjNE+rZxz6RsY/oqFlzICePuKDW67w95bUl4UpycU6lcnQs8omXS0BDAjNz+NZTAT84cy5VE/mIYww4b9Yzr/EtUjHHadBJd1s/zfknTHRfcBWsMfsxOrqzeRpn2x2HK0WolKwSHAMOLPV3oXpTuFAlYvr+TPadHbEcEmAlHI+N6SDcXYaHP3p+fs83pNDscoU5d8MfIgDSECU=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:iStewBmMi0sufEPt8fppS2k/mMi/SZqn1eXhr4fjZBZNtmtDrqLZRh1gVcjmnws+QgX6SkiXM9vz6Ww00x4+qfprfJ9a1sXhWrKArI4+0HsWlJ+DIY0wF0YWlh+LVlKSztwvC9cWN0g9TWUIOTeq21lMGmn25oyQRIQSxVpUikNpYKw1EKjpAhgoiNNHynChyTrgXGSXziY+M4gIn9nKlMG2Kd0XrJubqYNhcigmcStS/wCzaesIXOeMlngHOo2sJCIs5WFJIKNu+1/P6soq2RXeoGAbUtLy77lh3xdr7v/xCBPmk7/gWw5re8rUvgUnoT0IheFRvUmy3TjEbi0n74TTuwc4aIUokjKuz2ELN8WTrcS7ehUe4YB0GGF0ABXjfq7Nshokl5MPwS0LIo3W6yMgaO11sSv0bgavHn+smJuR+I6ybIvCr+54fde6YpnFDyqqaXp8yYyozWt5RtMokJ0WXduyE/rNj6rVQjgJGY9qeax0L4czV9N4qnaPg+Ys8rOpnk1/X5vC+PSCo1RayT89Wh9236OMaAxlXyvGU9osT6cThENAyNQslGnXI1nfFENX+mWdFZ4TK/aYnV/8tPQDl9xXreORWVYRF2f9RynFur7jEbJN2iIvLpcIxe06NlYa0AzOwMDPbJgHPvzXjSc4Yf9BMEXJ3Y/68CMu/f4=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:7c9Ymod8hG2tBvVY5kWFhtcauZ4H5v5h0n+XNRTU58DYCQnOTbCqOrCLMGULi45IwcjjVBwkg5e7xagG1BYGxOVOtXP28XWo5cDEH1/Z0nVwOMWW9v96slvuIZmdaddVJJcuAVBEf7PcCSvu9Ptf6APojSmJIPwCk6JP11aS21pten1x6rzfjtBiODqA6VfMwdi95i7Nlv5ni8Tn5gUpj9dz+ua1ou6/EYPaU/G+y2tqKmUHPHtsz7+O4bP+tJtmNnKKmqPEiQhVwd1tV/bsm0r+g/Irp0WSUI/0M+3vO+4nYs70xaw3FJKVZXvkefWILP9lcGgQQ/cMWNuSjq4F+w==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935B0E5855E19839A61EEA3ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:FawDGUdCMPzqEVpeN9krigeDu6pYMgz8BKcigBbV?=
	=?us-ascii?Q?dpUGaG5MlXNHxku4SkrpjyqdJIBaHg6imShG9rG1t0PhnSTmNqjeCwxCrW6d?=
	=?us-ascii?Q?Z66CPNhlsFG/KjRLVDnH7Eurou+nj310g5uZjunrzVG3Xy3zHta3uxB2ULWd?=
	=?us-ascii?Q?Dk2ntdHtVuQQvjmoPPBH0xOrhuysRCNkdHFP1EbCcJaaminywel6DRXOV3bq?=
	=?us-ascii?Q?Hkdbd56MNM93JnbUoK2lIf8O2onK5xHjxAsq/5aMKk4zIR28q+FuTZGvAfXB?=
	=?us-ascii?Q?Se8urTmpA7MyT1rbf7FRI2RqSr5qNqkZu5TQ/3pZpd/Sb2uLdU9bVciclXSV?=
	=?us-ascii?Q?M/IQe4eT1iY1w2bh1z45qT4Y2d50QQMOfsclJQnoQuuPGjUejrDTo5GTZXtR?=
	=?us-ascii?Q?U6MZ0NjLGzZZFKEJqLnZwrmoiuT/+9kQNtxf6lfpEzRMQwQmw4fnBoSxtGtA?=
	=?us-ascii?Q?qtP8cNKXno2dqi1SzxcmaPjcLFuobouLQAh8AsBxLadqEztZs9qDnaHAT4Bt?=
	=?us-ascii?Q?lZ2HrQ80DcxCPRo8WKmkVUMFQKTdGrMqWmUKLhCO8W7kBY1fC1y6EEmnV/6z?=
	=?us-ascii?Q?eGbBYu7CeMK1Yqd9sFPBv1s74x/AFMHX3gTB6zVbwdVr4Nq7YlnkjDDmctms?=
	=?us-ascii?Q?cE/cjdjXiqaIq84V5+Le/hWk98bleiQh3A2Butk1Kx2e+DW5d4nDJ7FsFgED?=
	=?us-ascii?Q?1nvdgJRRzGrW9CtNLWxy8ukyBbqOaWx1AqTM+3VuiYOjzcR1FnpO8tABrqF/?=
	=?us-ascii?Q?1KfPp9glgVZYxmxaXEr+bYAGevim9MpCjL0dvJ4ALcY5kJLYxjHb84Y8cHm7?=
	=?us-ascii?Q?6FqGxbt+m/RaBc9bOfx3K5F/XUOGn9vgbJDkMDYJR+9LIT1mQIAHcqG2H1Gs?=
	=?us-ascii?Q?EOoM8ciD4LoCQGH9r0Z8ru0ic1PTCoKHPPBFc6U7KKcj3xl2uyHCG35wmIAK?=
	=?us-ascii?Q?ZqINCibV4NHUEuHTOvw4VWNwWC5gW4bUaN77MTSaSc1SLsmBtIhelIffnb9O?=
	=?us-ascii?Q?iNsb2xaZrMRFX1zJeT2mYl8OyFXsCOLJwzC4GqAXF3ae+PMfbzPdBFEHMLxB?=
	=?us-ascii?Q?6AoJuiWJXM2u+5OrkYeXGV4q4w6NT+znJVyUsd/XedGXyh2CxlEiz/sk8wPL?=
	=?us-ascii?Q?UMC/vyJX/cHWB+fpmnjyuvk8WWVECg2+ob31+vsxjWj2YszT3qgbnWYvkO/r?=
	=?us-ascii?Q?NFandlTZopl7ksklHLRr+vHhTLd7wJLHJDRm?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:M8yIt69yCLu+oOcj/HYaXeKCZ7OM6TWiBrkmAQ3?=
	=?us-ascii?Q?8TfmfzNdzOhlHhWYIqt3faPwpvEBDM/2LihXeTsKK/pxqhVhaKVqTxEYX1m/?=
	=?us-ascii?Q?nWintwXNp5zVT/8beT0NzzpVA51+s8dsOfgebOYLz5JZFpU/fy79YrZ1va/M?=
	=?us-ascii?Q?l0i89pGY3h8OHvP96c5cVIJ6giWDQa1rt0mQq3ZZFH8hC6/UIdxwb00gxMew?=
	=?us-ascii?Q?UCxHJXaWXb+CjM0Kk2PQjKPqHZUqf+yDGkCqdyGS0wfYA49yT6rVX7Wd/Jhs?=
	=?us-ascii?Q?iaQswVcIAFuQhYT/GzDHxCQTYNS70aKaBD6fGTtJVWR6u1zWleMk7P2TPA2N?=
	=?us-ascii?Q?H/+7ZP4VMRKTkTOAb3EkK2AWfoPY80D94/HN9Lixvq9yi/GJx83Qx7eFI1u2?=
	=?us-ascii?Q?Dk0r+hQM8EQ58StWv32+lpksEAlwSWE0snEAmIyUm4JV/w15fzTF0L+2tBGn?=
	=?us-ascii?Q?wB3NQHqTSAUQwQevpdoWLkd/EvKgAq4bRVf47qZpXeqkzXWDEMBN4MFhDcPq?=
	=?us-ascii?Q?FIpmKo6RTQnyTxZFGxjFQosdwIJeO+zFIzNwMnofo1+ncHmmsbkKLMVaU+yC?=
	=?us-ascii?Q?HXNUNKUwy6S/zS8ZCdt9UPItUOG5SqASO1fTtnmj7fVM7+f/ixNdRVYTb9LT?=
	=?us-ascii?Q?0oMesxkPu5xaHh+0+EmGlRW8Yn7cLrf5TjgAZx6RE9zCPXEaLaAGvHNZ5rdb?=
	=?us-ascii?Q?58mBzPZT05OvLSOfsOLCBB+GbxB6s5nRSK59OodR96cSWRvhhjgh1cJPo0R0?=
	=?us-ascii?Q?7RbDXBEV8pefbZ1yHdd7aIEzoXgk4hHnBHAA1aOPuqdvMwlLlnPehlKXmbn6?=
	=?us-ascii?Q?2pYiq44oEblOLOj38A3AGPo5bZnOhxgg6sc4kw3z7/a0qzF+fvhd3Em9eRu9?=
	=?us-ascii?Q?B1uDSbeOc/nICwCavuuK/bKtXVrqyrgU5inv5N6pOePocWim2BHAkWkTmY1u?=
	=?us-ascii?Q?u7k9VC5pAYSNO/KQE+shCcqs2l0gIjrS7ZUsuHpZRYXLpud3NRRRMD3pE8rB?=
	=?us-ascii?Q?eY6pe71qeQgznyvvega3BMgPP2QwCM7omyowphX64RLfVf0EDmMFckeD+R4/?=
	=?us-ascii?Q?Hjm4SFGpOuLxD9nxBBF0+9x8iKheK/bXC/GON6QpOGWCxBPBMNQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:Jhh5iJBrwVn5ytO1Z4nltX60iFLDsznTcyyu0T2Y?=
	=?us-ascii?Q?FYguqqyDA96ioEVbFwXls3DWqu45akyvjroPxnG5SwYrt1O/HQinYfSCgbOo?=
	=?us-ascii?Q?hx6KS1PaeMHejs1GBfkzrO/8cIndDfYDCNoAT7bkPAvFb4xhrRDY5SFWfKVj?=
	=?us-ascii?Q?KeBhx27TJBC4vQXto1wbqlDH45HAWasz/3DlRJocOhG9iYvZphlMxy7EhFg2?=
	=?us-ascii?Q?qozTIRHDQheV51Fnll2lpauioN2cYDIQo3N3HTUOCpMQyLwmv9lFlCrmJfUl?=
	=?us-ascii?Q?f0zAUhDWgLs9/2++wP11U+kHDtlGQWwbjYLz/h1pDNIcMv1vnNcoT8ZhciEh?=
	=?us-ascii?Q?0vJOg9jJ3i8emuGteV1qML+mOppSIAmLEhkwB1/pI85zJcAO6l7X+pBiC1H0?=
	=?us-ascii?Q?7swziefRnwD6StO2inJ5wXIJLMiBNbdPjAoWklu51EF4S44W3BEUXJPFCoQr?=
	=?us-ascii?Q?Jv+ncIGghkCVwfYMvsfyjDciKmufkH9YtC+T7eZN7ZxlTWn2q7tODP3F6o5j?=
	=?us-ascii?Q?4upZajtkDD3bvh/zq29DkbMlFo1jqnDV1cVcaaO1arls9FT+GbEB88baoKEb?=
	=?us-ascii?Q?R6ddwm9ctcg69OshFAAjOwPBO1ywkjR0av1fwBZ22/mLPvv9kd2ZMxwGgoV2?=
	=?us-ascii?Q?qxkjeQd8LkcxZpxUUsHPpUk+mmX7bw1KioEq2SPnSsKamSXTendPeL3Y8Sxz?=
	=?us-ascii?Q?E4vaoqLv3Ps2am4jIng9MLiYEKe3tjW45WDVJqtP5nN/Lm4lxNmwdJXW0nN2?=
	=?us-ascii?Q?V9XA4jo95hE6bB7hWK6hgqU4r3Ssvv5Q79Sr8GmGyLgf4kMlD+SZRb0MLp83?=
	=?us-ascii?Q?n7O9LFHCMhj7cFduorMaN2xvybVBK8FZCqUy2W1BtxDPteJLN+COK2yS7g9I?=
	=?us-ascii?Q?Lz3gBoBARRpwRU/rPuvuVtqnNqo4olIDGTxlfG3ayJJJ7ughLkCuRPozipeD?=
	=?us-ascii?Q?C8PrjhqTncMl/97Er/eMJnOrPkOvHlA7sGRZVEJpXcLITVNAE7HPFu0VYyTL?=
	=?us-ascii?Q?lsk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:NOBqdDopmj5Oa989WagoXSYoopXMakBO4l0H1J5hTzT5Zaic2XFU0f6Otl9ZD/79IKVScRnP/UCQNFJFn2FolgrwfqUr3J1ly/CXHuHH3ER9pgET3WCS1Wjr0sawoV7fFXjPXSWnW4rHlpNIpw6/UKSzqc1RdudYlBmuSY9IdvYMuWj9OzawgSEVFi511KIk+wIvzeg6JfIY6wb/61pxfR0DFciPt5XwaoQEx98K1emZTHkYmbV/KN8oaEZWVQu58+MIDx4CNPo76PsWwmAPxzOJMAvcmKMvB6q17yzWiFxhRMLRLalSF5A1cPBrlcsgExfBFoQvyOUUSWFH8cI3808mbPLKJHT2ULd/ACMulnx7o7HQ23YBLoc8dWsiSkrEFspPD1U5yqhlUkpSNXpjADyGAMtZKvterE9fF02BACVOZTP5ZrTJ8r8DCsE9pbIMDvwM6zWjqIc5C3WNvbf7V3z69u4WE/YD+4/B7Q/biy0FeRBQY0odjqFP3B/wEFoC;
	24:94Yc4HN0IsneQzqGynsfYMY7duMLFRyeVypUBwGBPARcLpG91UUi/6QC7hfCgqPDraPArBRCxJ8P7YTIKsau5H8Ls6K6mJU4xqlnJbYUfgQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:UuNhbiBByeeUZmogJo5y6luNC/aFxwy+C/W2BKd4ApCgoWbYlQP1TeMTn12ectzjkKRJQSZYBpK6/J275kVKNxQi9/Fliah6c+zALHKXRSnk5bchKzRsI49DWPZkshoOWaiMKCNxoZQQhb3k9nVUpBU49HRqUAoyqEXEZgEcoUKq5it1y1LQTE9QUUqYv2BCS5ft0tHdCLKrAjKZSv3zV9hOw8B0y2QwyTKoXtwdxf3NFvCs1wYj5OVtX2jXLjoe5gUZ344aKfLqEFQJ71NIFuMnqwuZtA9yjQwek/3EYvg0n8+MYp3jTSVvcTl88YRath+4je1m4AXQgkAZkrV8j5dbqYVe4qPCfgQnrCcnwtdQfFJUTa+31dFoETH8HO1rTM42P4tnGnh/dhFqMRSpUdniWMNVsxh9aTu2y5fQABSLeZnNTnwcXTWX3zLeyQJyo8CYicSUcvIzvocaAOhgu34RSEAimh4F6puYFBkoKuq8pW48Phe3Sp3NBU0DD51IOZ3/eSYQonkDWwys7C9vpBFAi+3BYclr8oe0IIyfw9ZxLEtZF0vAqXiwek+SqiG5CpOiy3ufDvrppOavVBF+Ds9CNjXCERmSxUy+baodPVY78M3Id3dyS/XJWrlOBRd8B6ClA0aV60zwg9RGR4EX/U0kRNmDytMp2yDQdJMBRiX29RFIQy5UjeGlQ1qDTXmomWF2t+3pW4ZyTy48WhILGwemxJ3B4TH/8XB2N2nW6ftvORXaKKw2GhsRv/1TH6SBrAdwrhxMgVbCSABtiKDRIZOTY/E29fKHcl44tbEIhPU=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:06.3045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 13/17] open-vm-tools: support FUSE
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:40 -0000
Content-Type: text/plain

The vmhgfs driver is now gone, but they use FUSE instead. Add FUSE support so we
don't lose the functionality vmhgfs use to provide.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index c3cb9d567..7d024f260 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -47,6 +47,9 @@ NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
 X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
 PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 
+# fuse gets implicitly detected; there is no --without-fuse option.
+PACKAGECONFIG[fuse] = ",,fuse"
+
 CFLAGS += '-Wno-error=deprecated-declarations'
 
 FILES_${PN} += "/usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
-- 
2.11.0


