Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0048.outbound.protection.outlook.com [104.47.33.48])
	by mail.openembedded.org (Postfix) with ESMTP id 320877822C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3o+wVBGVhHnt/hBAIwVl5MyT4hSy2KpT4RT9FirhNwc=;
	b=B+jZd3ss60yA7tnoqyYxoz9BjyciLR0qAJP7Q4+AHiOqLQOjI+H43KYDu4oXEhaVRNXilx4uPY5u8tIUfsHyzeqAaHWVz8VFlTtFRA8SG01kH1vSf8aBx792VnfE7xOba6BTN1CcUw/OeGiwjF3J5w+yrduvD1tjqU9st7OC6+c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:04 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:40 -0700
Message-Id: <52d66f84e5b787b8cffd1f73183f30c0dc892c34.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d37ad240-4ae0-42ff-7d33-08d4ba8a0cbc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:K1yBPzWgU7oDTbPEl+b8bfUm0i0JFcKJim8gUtzKSeyuyAh0M5SrZsm6wRyjlykJykeCrWm2WuqkZl32EiRVSnFHJeAdFm0YOL+8aADWkZ1dxtCdmyFDA5vk0kzqHtvNlzfYHA4XjGxi/rQ576+h0df/f+oGvwfC76Qc1ZLAe67GkIpB8manCAkcf6TwnOnSW3W2Bj8GrSB6CQeRC1Z5VnTVIXAw/ZNjjKulFRcn3rPU4Cxh5idxY95fpMqGHvF9YTEWH0P1ELAVq6RwjVSzd5YxqlXkubC/pgpIPB1fDJyFHD8QQyriQTg7xy/zD+PkLjv1EbkqeBtHYj0wdqGxu0fhu8eW5JdJC/OvfBHhCjChR1baJhHcCrqJAwBNvhzZK8LydQHAhrl2qQdj5rM4cBcOq67+/Be6SzMal+cC4HmmY9kk8zOgMZjNxlqsJgWk9QaQZ6YwjhxYDEb8S5tygluSzJ4g8UUbZlbuSomhty6pRj13plxA4ikodqhb7qdKuQDcOOmnBJh/wkHEnFH8dTFivRB+RxI7Afi2g7q6QM+x9Iftl+S/7HLIEhqrSedqMmxNOXzCCJiHrlRfXAGp2coTeHQC9hidxr82q3gjlJy4drDCo5uqAJmF9XvlMyIFtDtToETQ2/szZtjQGxtcd+WnLK3zHHljOgcNuQe3WGzLwE7IewYwtnSXglNanonZyzBMy808IGLsl0uAbYU+XYuO2f9IstHWhWsYKBFePcc=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:H2JBIm6lSUafbyAmCVQwIva97G3SNdlLl5ea3HdiWxgWv5T7olFHQ32dEqcSncmoj96Fn3UPaCS87ChlGwpx+yaTjQDKfukZFuKkkVkOMi/K0Es013icjgqDQnAVweAICTIjXYpgfj1jP9j0Nx0HBQ5sW8Vf8Ni3AAx/yXvP5wUm5T3KYpgHoa+QM4Sp0L8h+rZwbwxFcr2Vwrmeme0cvNae48zw0fk8uMM28CdXiZqHkF8hHG9x7rJ2UWi0lTOElWhGo36R34V6soDBT2BKguVGS/591GGM8cimERwqq6oQQEQVyGvK6uAE74pRF1nV/NeWiWaQVX/f3Zkvih5cJNPNiREIxK8BNVKSPN5o3csDjNljyoUYbIpBM1cTr8qyseHDipZR9Iy+vA/U4bkYk2nFqnfNUtXKfR2JYX8obFXpamBTTufT5+hLceYhy7tvIdVv2MfqnGNbuluohzG+Rkpw+cXgZGKLVE4Pw4cELE7+5Ilwi8W3F0RWPdMBRJ9n89/ng+OOUjqojUKQM5Je5MSq1Allsku4JJcfM1Gn48HS8/KSkNi+Lh6QO2Q/UuBr6OzKekUAqFwWR9QH5Ust2z1iEaWzwyFk0Tp7oUXyMlJVXzbXxB2MUAjzxOgD+AnKBv3X03wPWMeNuoazFZXpyb31pHH2GyvM/Kn4YSFgs3FdrjwD+G85/zhzg/jJG2ZLTeZP3aOA/kVCy7vP+tCGAryNqB5Yv6dV8aqrXIP22EmJwUVVLCZ3elbJsy16PrWv5upwEGEqNcLPhGPX/S3t+FcYzKXw3qWlJ1vhfNEcSrKtD0tuY5rpesYEmSki1tk25sh02j/oHk6DAyzlMBwvH32nXB5MKnv6nIlcK7Roev3VOndYoLF8HWOxRb/ktmej1yZfnwn+A7rWpEW9z+GSGP06LGKT2XwoKs8QnDl7jmU=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:R6KxX4l3HYHIRsyMwE08rz6D+5SasTU0kBKB9GUs9/ApIG/5ZdS/uX/yImhtwTcE16Od8iARZBcqi/xZtkwt10Xagxi70/bX4UWLT3o3FJHeRPPijn4KL7isXXlSpV6AWqtAU491s0MT88hG2xanQMhIkrbmCqCxW+clXf6YXvNTERyMQhAuRJXPVzPNf4gyFB+jZXP1HTLkc/AQN5tEQTcRjYgq5lkJbVJ8ruk9DUPPkF5qGc/BTtFv57c1nCIWRBlmzbN0/H9UsEyq947KJxhGD8GhQ+CMN7AWNUdJGL0BxfZPuRxWaQWEu58DfvhNDePy1mQ9S7QM0HWpRV12SJ6v3dOKqii1MV1jNrUQ8kOIg6jASfiyLYWWF0U+yhnDkwoJP4gS//1QHG8aKY/gz1dQvWxMddG3W8T2tHTRzPDoHU21tTOeNHFLYzeqA6bB5xOcArlU3nQUhkPDUGGLLmBhcMlTGd2vJjbEe0LrZBvYekfwHnnzpbG7OcZRHESIPf+B33nbWh7fzL/Y2Hlr03n+o+RvPjuwn4VWiX7CWHCjFyq2pU+IwXHWhu+r0rV3+eo5e7sQ/8kbUCUylhHAICWIP71bbTV+fRw8TI/nTkhH3DphYSCKs6OKq1na5XHitMp/dk/TBvGXRM/PmICJ1eoNLosKD8efcE+PImbGnqo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:q75+aRkXg/B1+2ipKwQNBdzn/Q6ro/t9dkzV7hbyhDbxPgowqv+dyOOgujQkUXAlMD3eH9EynHH86ouRO/wKAil7z0E0FE+bH04DrrMWRRhP7B4XhrR0dTJs6BsAtpBmETVY1k0bw49n2ZtDjhye1mEGURJhxkhwypguhSVl9Wn9NE3louINA8viLcp4HBaFdpfjFUiPgGExUzbEqbOxgAHSIUJHM2HUJvG+TZ/369DfZdi+5v4EI0ZSS/dmR6pirncGuuw9i0m8E/eyApeLy9L1W0JLX+lo/OK152LP0fhPI4KYE8kVU1J12quwk/z/FpTQk24srkOq9dxL7imxwg==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29357AE0FEDBEEEFA9A0373EABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(236129657087228)(148574349560750); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:luKEOTCNhIJADnlMsRQfZtzhnH847PMPcuVpIOKu?=
	=?us-ascii?Q?AImK5Ya7M5hq1peeBeQl7x5FPUQrdIwVU0kBFkezXnf7aT/5cAWtlofTB/6Y?=
	=?us-ascii?Q?Mpp1clZMh1Lnm+NN3jOYclzw73c9XfRMK8PY5KIlEqO6QViCnuzx6fw1eD9q?=
	=?us-ascii?Q?egT0HqCilbtIknvOgHLfyL3Yhy2BTVa4VgKCv3a1zHFavXCoAUM+nHseFcLD?=
	=?us-ascii?Q?EvyYnV4eTc/VLBkgW6tOsaeLfsD0/cW8QZwCsnakslrLPeym+Drv/N+C5ECv?=
	=?us-ascii?Q?vgojNMHZjHyQ9XZEa1m0evGZeV4yEX4sgnpk+36qD/GVC8FMs7axlRRTKzXo?=
	=?us-ascii?Q?0IC7RFtpRCob/oEFBvyelQPvZvynDdMiFyv0zeB0+gW6F4LlFvv3bqZmliTf?=
	=?us-ascii?Q?yW0fztjzDTdp1r10UYXvBZ5sQWDuqdzCHu4d9mXUNcrijsNAYSK12dh+89bB?=
	=?us-ascii?Q?M6l3yGY0C5l4FcEH+7lNsYna8y96a3r0CCTYGgnkzLG+xixAytFKkGuxa/vd?=
	=?us-ascii?Q?zGQBeXs36DCL7aZnob5nZTLeppGMK/WA+/u8mhOVB+o0zO/L+CfXggYejkLf?=
	=?us-ascii?Q?3+uLl3Gz0UTxHzBFfD9mMuqIq93QMgMRQWJZHMNOXZ37i91IMiYYBgzNIUZW?=
	=?us-ascii?Q?QOXdOPCbaCv0/5w06Drt9/93/TJfoUlo9eUjJeXzPJTvZESkczy7syKwj0Es?=
	=?us-ascii?Q?9LIo67qNLNEUu1auXQH0BzxBfn63wEp/DDNmKERtXjivFrcLnFHOtfHsPkHC?=
	=?us-ascii?Q?JzPfI+J1GC8y1aUouobZaEoSPexDLGG/SAPr47UwdJ398AtfkNdACbXah4Qo?=
	=?us-ascii?Q?sBYPvrHcXHxF1va/WjZ3Q+1k7vBENaSw291PGbhX534KqUFflt4EEQFbKMbK?=
	=?us-ascii?Q?gi2ayNG2DogdA9/NTptLtX3eyvR0b43Fx0PqwN72aSwhVlHCX8NJ6GO+6rIE?=
	=?us-ascii?Q?beubea7+7M7gmdhSLbSByLktdrhy+2mho3QwCuVLQFxJWHsz3PnywZ2pHeDu?=
	=?us-ascii?Q?CgHoX89bYIxeywapPafJhqawj5gRwfj3H+cLkiotiH88yWwvMgrkcsyd3V0u?=
	=?us-ascii?Q?PArYQZ3aodFAmL+4Dh6gkeOMo+iHblxtZ0jUBwhq78dL9iQkJhXcCGiUfhfB?=
	=?us-ascii?Q?V9Gc79zQ/UNo2vDS3MUqOIMOEYRY2PCmtURrC/in5zx5kBQl+kDXv7JcxRbn?=
	=?us-ascii?Q?BDJaMib2RptHNUtu7eJwvb+DFJRj7qhy3LPlgzy8YzMP1DXHK8vtMPrdxcU9?=
	=?us-ascii?Q?59GSOe/0+vyWawdsi20=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:OElOoMj/nCwJMaGbWfrK+t8CrakfAnby6QAp1zt?=
	=?us-ascii?Q?lk43YYRM1cNBBQw5qfnUsWMN/O++t48nB6BoGXQT8Qfrk8jmq0FOfR8km2Q0?=
	=?us-ascii?Q?77sDIZsFjeU+c3p9b3IhzrGfj/KlHw3fgwY0pHcIEJ0S76nbwLn8Nru4YVkv?=
	=?us-ascii?Q?UTBnQAiayIBHnLq5eMoLN3ZoRIBHuPsllLf4kv6aXM6MqKwdiMbo5Rf9obAu?=
	=?us-ascii?Q?lxpmrvBYVwOXDWpSaT1JGXE9hiudNCQao+DmqtOK91+tSbG85qpm26IcB7B3?=
	=?us-ascii?Q?PTRLbXTnHqZ/Zdl0dFbphF6Jlu/l5v4N6U1jnVXjs4FskuJAseoOF3i7661k?=
	=?us-ascii?Q?GzETYEbyDl2VpFgba/P6+mOO6X4qbtW16GSzaBVkf6QbaxHlD8zmFxhB3tvs?=
	=?us-ascii?Q?f5zgvQUv958fh1b+4nSKaHeWkBeCqaKKOqv0F6iP3rzB9UXaAFqYBM9ilH6J?=
	=?us-ascii?Q?gZ/FWc6sa7CBBnYeRvNaGzERVza9yjFpG9G+ksBn5uC3svRBLuDqX4uf/nY5?=
	=?us-ascii?Q?IRu9Kx7BOUrAol+hSmHtf0J9FzuhxLaKyPUVLzFkE0qi/8D0b9K5pEarfCW8?=
	=?us-ascii?Q?HMwz7H1qS8NjCQJruE34SfvRFRNZt7hXSFJGpsvp70bbFy2IjjDDd/6RQk44?=
	=?us-ascii?Q?Ygfop5ivPDznathCqW05or8QSkWYBU/0CSlAVg0SKsqIVDfRSJQxRUtCut6k?=
	=?us-ascii?Q?Z2AyLM4ROsvrFgOMkoXeDhs6/CicxI1YQteVz9KAZq8gHrr+pJf8zEXLr1xV?=
	=?us-ascii?Q?G9MwQUdYOH5sK8G8plaUOwJ8pol2IyRmehY3uDsBFO+H8HQCevf3MxaMjfPF?=
	=?us-ascii?Q?rjCQQlpNdO/6CFAizZ7o66B6wvdvVPc2nBV1AWnjBw0tz//MsGhSmL2LBdKN?=
	=?us-ascii?Q?QSWfPooks02lB7Ln1NhzlwBcf83Z8pejAaTjozV4ZbGJSkRwTs1ALMk0by95?=
	=?us-ascii?Q?oscciNB7N/IF64/cN9S5xEnzz3aotxypEY2NgvKG3zxU40E1fF0jUITsV1WG?=
	=?us-ascii?Q?6CA3d6CHsA13qVSJdCcCVFVzOiwqll+jcSaiJe2wAQdTrBoyKm+a+UVYnXq+?=
	=?us-ascii?Q?lfDgfRr9TZ071vHOpn03L7rpmp+6WEXq47W03nD+te0uUmiyg8Y7AV2Wtc5S?=
	=?us-ascii?Q?7X1K1rvzhzz4=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:ZSDZamRdaRWGk+3P2K71ZH69yqbFH0PeHdnDS5I5?=
	=?us-ascii?Q?WMTRbFCcMMPSgp1TTcLFedsYDm+4OyRPgVy05ivq7E40sepss4pMMQQCQCYg?=
	=?us-ascii?Q?Mnjz9RJt3bjkHYJLUZfAQSYljwbmmRRkbKoJd29pe8TqA9l2SwKm6Py2sUfT?=
	=?us-ascii?Q?Imx7mfxxHw6pG8wT4EhTgriUc1shPURXAH8xj55XWTQ8DtiyZRy0afGTqHvq?=
	=?us-ascii?Q?6m0gHgyb9/kDCt6s6X4Uti+bY1IjlHLKt1RKJMd5HNV2yTIAYSE95BbYgIwI?=
	=?us-ascii?Q?+BQ8myyx2u1I2MzFKOo4sVQXyu9fHGJXFkE17q857kvwFdwuu99OlyYTuebG?=
	=?us-ascii?Q?0ee0kFQYFN8Twto06PO+wdxzXx4MXg8mu99A1JpgwXs6HZTZ4ineWedHRsIb?=
	=?us-ascii?Q?B4/abV6xVW6gOovfmwFWSLMj7UIa1wdn2P+1B7Sd1frunOyrE3xASim7+DOg?=
	=?us-ascii?Q?kvSk97T+TmWag9+Iy847Exo2suKUCVFRS/8o/ycc9ks5PGxgQovty1OsVUUr?=
	=?us-ascii?Q?MVYPOOabE9FqmMfKFYB/WOvKTNqcbKl1cjGmkAY9TuB9G21samhxD6ktHjnt?=
	=?us-ascii?Q?ZIv02QlYcMI/UfbMSsOnVS+LBA19l4tQdwkvXVHYjTz807h4BXzVdxu7vgDA?=
	=?us-ascii?Q?hd/nr0fT5K0gr+h1moZCvaCQ7HbiqDOdMe/i/oTFTDmuKYBDwMaNMqPWTHL1?=
	=?us-ascii?Q?7wN0c6QR1Fdo3CXnq3MUyQ7QAkjM1YIAMeHzNEfz4OiUzJAoS9yfGYqleBpg?=
	=?us-ascii?Q?tBn+oZ/pPHhlw7C18EXAzGzJC5YOBWp7XWCafjBpVUX+Bdj6z7H1s05MUCuQ?=
	=?us-ascii?Q?ldBNYJD4iqzmfPGI0mACiebHoiKL7kae52A9CKf5ibxmS6QSB5/VUW1jer90?=
	=?us-ascii?Q?5p0x8ZiGVNMTEigiDj19H7Tp2nr9FtzG4oAiDb54B+vbnT7CVAD3F7krfmAl?=
	=?us-ascii?Q?4I0AJcPGu3vbUraDoLpu68mvVYNTdhxBjUanI1BUPiRrz9DJnHSK/h45HaCs?=
	=?us-ascii?Q?P8w=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:G05yCA0hhyRzWc3n4g+BLPfgbuvCj8Z9hEMT4OIddVNF85kEZDIwee3a7mzj9DHUIvm5lRNsDsmWVgnBu6QwMZLiHbxB1ltIfOYt3/u2YTa32RMST5sNuzoL0210Nna2euVdN3FltBogEB4Q1lC+oUFbi9GP85yATBguxwKQ7RQmVZg37b79f2ArolXlEgCKuoaqYtpT/vRB4ujyxlJXFBUIf+zkPwsUNECXP4apcgZ2Blh4gezIvNz+CeLlCkA/fFOyOkAN1CyiFvEs1nGY5LMGM71BRupWg+Qi4X9pRNjQ6wwuwp0S/94hqAvOPBbpx2PGwgd3VFUPZZ3AJaZQ4M7CiOPWMwrVQkGipFB4CotihvQrngsiiqS3MZRcWP4ZSkCy/kIlD2L/v+eX6WwktNBaYnvzcljdudHl8F16eB/68th5sSvd6uxhJrV/hvlkOoxVo+SYABIAoJ+6siLjnNXuGU5cin1NFjHlakyQ7Y53hNhu+RNKimHqnW91KrjY;
	24:ZSFkW0jA6bTJ1QBgGMsdtW+fDtFurX1bly6CKxafzP2pz7IpPAVgf7aMhA9BM7eLBnjyVZXm6t+YfmTfCWGNIFhy80nM0+qoa5gvWvf748A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:3jdCUL8BeXdXuneE6GlbFTjAS1vGIa79v5jviG2m5fLN24v4/Gfr31EDcKRs2IkT500ggYqoO5NP6YXN5AWyo6oIw47KU1lGnp77CPwuHKGVCgJj616pURRWky/QML3s4D9l8YvbBN3Kwcx4FdXbZ+ZzUJEGI+b7whoSI8D74jSyJbr3ZkQNuYOvjiPOIp83EQWXXfin8/a07/0DkxVgRdv0TNwL12zcYwQpAjks8mxbfJ2jqbFyS+Bhnz2K8rV7QDsAI/S0NFTaUJ4ysVUodhj+eNJ9GuVHB6tB2BOggdnH0ipoWyw34Zl1ZtuVicWJxvKsELRWQ08xQsoLWfblEI/ZXf/oH7Y4md4S2hRosmwf7p/SJnLC+tolt40UVvYlYuq3SutEfBu+vB2mcfURV3vxkgAFmqWlKEgg9Y4iZAUPyELdjprXq9jhXD2DOnercRYje93LkkUzjE9ZeAnfWwvUpa767bLFQ1hKjQqsq5Xnm27LlXwDOqcWcyuOMgGH+G6GJyFnKTJwqtpeY/59gKeFrMZGlaUZ+NphjdvBFQK963jz7retjlARVmPuEqqyx+tsIFCpIPYXT0edHMeVaA24tSsriClGNNT6mv5ODWIAq/RFOFTkony4XZ4Ak2rkodXrYDhmvQH3evggQ1OqaBcscZphL0kTWWXNAeDwrO9e2dKLEPe4Afx6yuv2NEXOFPgbFDU5qgAjsCvRj4sOCN6lhfBzRqME2sHC6/pgirzWW25Z8iy53ULP9fgvjumSSc5qvPNx/qJ1JyivGhgWW87KTnDFq9w6wLSeLTgrc90=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:04.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 09/17] open-vm-tools: add #include to fix build break
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:54 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_10.1.5.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
new file mode 100644
index 000000000..f905601d5
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
@@ -0,0 +1,33 @@
+From 5818acc8032e3247257730376e947330340a07b3 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Mon, 22 May 2017 17:00:05 -0700
+Subject: [PATCH 2/2] add #include <sys/sysmacros.h>
+
+In newer glibc versions, the definition for major() has been moved to
+sys/sysmacros.h, and using the older version in <sys/types.h> has been
+deprecated. So, add an include for <sys/sysmacros.h>.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ lib/wiper/wiperPosix.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/open-vm-tools/lib/wiper/wiperPosix.c b/open-vm-tools/lib/wiper/wiperPosix.c
+index d389eee..1f221fc 100644
+--- a/lib/wiper/wiperPosix.c
++++ b/lib/wiper/wiperPosix.c
+@@ -40,6 +40,9 @@
+ #  include <libgen.h>
+ # endif /* __FreeBSD_version >= 500000 */
+ #endif
++#if defined(__linux__)
++#include <sys/sysmacros.h>
++#endif
+ #include <unistd.h>
+ 
+ #include "vmware.h"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index b3e0afca7..2b2022864 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://vmtoolsd.service \
            file://0001-Fix-kernel-detection.patch \
            file://0002-configure.ac-don-t-use-dnet-config.patch \
+           file://0003-add-include-sys-sysmacros.h.patch \
            "
 
 SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
-- 
2.11.0


