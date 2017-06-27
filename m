Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0085.outbound.protection.outlook.com [104.47.33.85])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF4B77FC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 22:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uJHv3JI7/R0xWOdLHjtkj7FyH+B+N9bJiv5h0limoRw=;
	b=U9yGhJhNfFSGUJRuJhh1ahspNZ1UkGoTh8cnr2PzlXTy/4CyAnb3hkLEp6bPm3igkim/jYzkY2l0PNVbTHbN7mY8IUiYrtmzQCpIw/faeBy1qO6oPLrfDp/m61N7XT43lypd605XCItf+v8zOOGWb/ce0+wJxNZLNOQAwOC7Ubs=
Authentication-Results: vmware.com; dkim=none (message not signed)
	header.d=none; vmware.com; dmarc=none action=none header.from=xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Tue, 27 Jun 2017 22:35:33 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1498257745.git.mkelly@xevo.com>
	<98263123-d66c-be92-a5f2-13c7c448f4b2@xevo.com>
	<CA+chaQdTnGWinuu1cBgtphtpAmOL7keiLJH49WYOfDgOryk=8A@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <be48cd6d-d505-6594-16c6-6ab8886c004d@xevo.com>
Date: Tue, 27 Jun 2017 15:35:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdTnGWinuu1cBgtphtpAmOL7keiLJH49WYOfDgOryk=8A@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR22CA0041.namprd22.prod.outlook.com (10.168.250.155) To
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 169af336-104e-4caf-8d68-08d4bdacd2f2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506067)(300135500095);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	3:OQaI3TnMyHHoVuGnRtoL6+3SMur3lvV2Y6MjEJIzetVTmQCgiSf0FVWTHys3J0xYGSpguzZ0jf25LPOZAABiGu4eqFf46cx/r9tguWx/exJFmX9/fBqVQLmB8X4FGwWiVhW6IvuYDhtunOepRNHPzXW8nJDaBXYosGybbePTrnoFOOg2YOH1WDIfY9w5jnJwXJbj8vTo4s/Mq/KasP/tk5lvJpx3loy9hTIOZUrpjoxkBVjLk/yAHYnL5bv8TB3nJpUcnP7XoBlhneePtGZfy09uci/OcOoux/vjTjq3l5WryKrPoicfLLLOG/Yld3Xdcj+P43H5sQB4y4vtO1c/82bh0/zUlcd0pEgKS01pjptHraiVHuxrP1NtI0hxdjbw6cgptUAdWITa9p+26vpngU1R5cdMTN38a27m6t0RqULw6VEA79hnAtbv/cLEX5ajAgicwyz9pLUpKvUBN72wUsex4BMtKmCZMjcqKYF9SkPffBv53kcKo66Tz1vMZ25MhR8576ESe6SIr/sPTpaml6BDdj6MY+wFd6/CfMfRGlV5TgwlL6+BK1lg9WixBu+oibN9I4ay8e0m3NxSmaGwuuQoiGgCykQnxBTOEWUsr4GuCytoDkjCChnsAww7vUsbvGkHZnRjKcYp7HOMvOkuz8foo9g3m71ljMWK15yVYf+Qglg2mGvwMnZXMbkij6KzuhA5XbEltoSw6SlJMcko7+TKcs1a3kA67gTgVcVgX2c=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2941:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	25:KDVUlA8Yzt1AtDgZjvBES+Sbc99vN+vZFZGXjzQ8db3OMJBeu91WOxmeLic7DsW/AH3mftBtUSur+yIVpd63OeDy4IXu/F+A8xaICKATV7J1wr1PrEcRYZDPpkmPw0aJvKa6R7HEeAgTerP8k9Jf0TqXpAhCKx9CDyBaTF8l3zIhDV/voh+DWKVSdoaVSCWIzOrvlWl+AXjuQqGRPPeAHeRHMbL38657qvt7LJq3poku7EuqSFaj8OletR3fWhR4La4fWDfBJsvjQd0UNp+PvupNi8w6dibe42k8Y+39ooRo2dbWD69AVsipNBIhuaxEM85Zxq5O9Nf1d9twU0n9bSnoNGoWPI5ZS+H0x9ftG7PcxhknWmLRS58YkKtGvY5An87P6ukfYzcNMixZfyXUsoJD2lmwLc4/c0q0GoI4aNnRJ3Krd/YzVHERBFhPMRG0lpN3o+RYcowr4pg/2z+MIku3HdIMK/fokVhdU7kC0Yo4pOPhmdhPqbwHPV8zh0heMTXnNDXyyOR5QO6vKXe5AXNfLbKrSurA0KexQirYgrVpi4UbfGN70Yidcx9x9z+VyxyXJaQpMImlBk+wMDRT7OCdbhQtjMRaB8bH2z8cCf8kM31uDO28IjqtXqD6uW+JFbnoAcNk0yL27+JINStrIeB1K3QO0zEHyk0VRuu7iiXXomqyOoylM07VwC5Eflkh5zMparg75Fk/KWb2uBhDhsrIhCPr8y8W0wqhr93ucmB+KKxA4V33hFGmaGFzsXMO3LKzkhluPinFXdRVwVqA217l2RBfhvCD1/8wIq/SjP/fSZVQHtRIHU3Bci2T+Lh47TuBKFfav4Cf3qvO9BXPX/iGjjfKk4JOwzBR2d/5xi/1eG4TeM+9cPHtxGloQhbC/V2RV8yfq7vI3kj1v05nb5FU4Y25DNQJBwky6ScB/ZU=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	31:6bTpO6EPCaRnN1qMcy8SVH34SCXqQKbMe916Tvt3ukf4IThCeWpRnbiOFfjXjde9MlzAWTNJlvmQohlUMgzXsr0/Q3NvvRb8ScB+dm+7lVjtpYLcvCGQHQUSWNPXiOAljFrzbEmtaniP1YBvcemlltUzqy2ycHYh7Ioy7BbYqY/gJDzbA8HmfVi9W7KuK8TGlLpEzhPiLhVFO+7n3T6d3Sk39kJbhmbaxQgu7Q5ir9bWPkcA1q3GIW8lpq/EsdXtJttNq3gddkuTwWoTV5TdbD5qbaI3KzWwQGzj0+qYstIuHTbBbgF0cefZp5QothQRv6vP/p1Gae/56j4PNR4mXWbcFLLGtjwOV/2pla8p4d27+KQj9OaV5riBFkVw442+lRmkglh58Kg5ua61zLlblcGcunvRcXGVHfsMJocpfFYoNuOj9NzY42w+abBYJvUCoCH8VDyR/9vSVHKjPztl++ezaVGoRhbK/rL0Pg08HoSaXJQj/UNRDgkikwlvLG98Q3dNYg0We0/ERa1/ixaKVknkNLlO4b2jzOslgezn9qYfcZDSpuWodZ6xipj8Zw27QFxf6S6B7ivfIkERXDQOJqKUCUjE9NgbJmXBHSXxDJH4FCAaWweFsa/8r+cAZvnK0jQ+2qITqo0eCzYhIhobycZEAr7cBpY8PQTbclYMweTRmlPfeztC0ba5chYsxWmQCr/yP2t8aKtXlG8qq9R1qg==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	20:i3F6PWdznAPmwumRLoexIcvx+Voc8TLQ/S19vP1f+pu3rB6QZlI44tZSjLzct4bMG1FnAPwi6IK2fTCzF2bfAn0Su5zJgniXPcbApVI3Pg2UOzbPx+0nD0QfMUMCJ4GbIDZdG2RpXdvW2GP6KlNNLiCyLfnysdV9NmN8JdsE3RldVyuHwuJOUcqmXH5uglqw5WaCIi0NKyYvHqA2rsFmQza3ZO1712GuLlxAEH38y563otNMkuFZJ3SmHTN++DVgoXg4d46AfQfE6/bMx65Yiw9bbqlwk3daMYgsSseJzTdvqfX0yonY7rzMQj4YQ1QSRHJdTmkLtOUbpxsVIRx01LjONuDr1TKxMvbug6TYmyz/m+2mIYgWuleZbwf/CyKcMTeuOu5LOepjfPXj94wUHYx74cwgh2vSk/jrONC+Fzs=
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29419F62D98C0BACEBC50CEFABDC0@MWHPR0101MB2941.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(166708455590820)(236129657087228)(148574349560750)(167848164394848);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2941; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7NDpsbUl4d0Jxa2pnbzhpa3IwV2pZZEFPcjhY?=
	=?utf-8?B?bzNubWh2MVdpSS9URXhTa0hlQUsxelVJTnhwNjZzMzFVU200c201NW9odnh2?=
	=?utf-8?B?em1YMFc1cmovbVRVZ1h6VDRnTUs4cUxLTmZkZWlRdUJYRkpIRThYQ0tTdTZV?=
	=?utf-8?B?SHBEVkZWT3UvQzJFb1EzNTdPc25OdVBmdWZDSkhoVWJ1c1dYV2RkbE5VZUk3?=
	=?utf-8?B?TTZzdEVSSS9HK1BHT3ZBOEcyeXFzVWRnL2JIQ2E1RHZKYU1LR2NISmp0ZVdo?=
	=?utf-8?B?TnVrMXlCN0pnMFFrbXVEb2tpQ2JHbXd2NTgwRG5VbDBjRDhXaUE5MS9yT0Yv?=
	=?utf-8?B?Tms0TTNaTjVaMzlRT1pyZG1JVnhJai85aUtHQlRBQlhOSWhld0M1R3oxd3Vu?=
	=?utf-8?B?MDN1WTEzd29vL0hPcjNlOEthNHRBOENtQ0tFb1Q0Z2lCOHdtdXZBZW1QaEFy?=
	=?utf-8?B?UThYVW5MdVZaUmV5L0FDWHg5bk1LQm9xanJLNW0wL2k4QnZFQ0Rwb2VKMWhx?=
	=?utf-8?B?LzRiN1R6U1kveDV1REVIdjFaUStFWVVSUEtZM1g5TEtVUUxSM3VOa2hJTGQ3?=
	=?utf-8?B?ZCs0ODlLR25tZjNtWk5RUVI1MXd6bWVXckdZSXJ5M0VnblhZcnlaM2tKc0Iv?=
	=?utf-8?B?WTlrUHV1Y1BoTEZGTVlUb0cyYmh5d3VLYXJVTUhzdzNqZXhpMVRqSFRtcDV5?=
	=?utf-8?B?R0NNNFdpcjV1dmU4ck5BL3Zqa05IdDVpTmJEbTFOQWpCR2s2Z2hFUlJYRWVR?=
	=?utf-8?B?c2wzYWlIRHo1UXRWZmJIbkpSTkNaTmRFM2ZNRGVVNWxGNWo5TE1hK2FQbTdk?=
	=?utf-8?B?a0g4VzBOcTVDc1lKQ3lJS0NhZzZBRC81ZnRMUXo0aHM5dEVSVU04ZFhpZm92?=
	=?utf-8?B?L3pUVkZ2VWowaFNwckVQTkx2bUdqODVmY0poelFGckFLZWtkSWxkbXVLZVY4?=
	=?utf-8?B?YVI5RzlaSkpJSjg3eUR5TC82NXVheEtPb3RialBoSTdIUWt5UU8yUHhQWW9P?=
	=?utf-8?B?d3hNY1BDSTJJYlhnMWRjYWxROWUzazgyUjdwSVgyVmZkUmVJNitjWmcxTU1p?=
	=?utf-8?B?eGloa09SVWQ5RzEya0I4cEliQ3ZiTU5FWDhuUGl6Z1VSYmlFdHREZk94bmVs?=
	=?utf-8?B?SlF6ZDJZc2dkSzc2QThHY2xiMlRhbnFvK1JUM25NUk85UkZOMlM2Y2lGakJH?=
	=?utf-8?B?OGYraFFiSmp4b2VSK09XemtrQ3M1eWlzSHVvbGozNGdaTDlYbGJ4UDM2S1c4?=
	=?utf-8?B?V2hGcjhrNFZabCsvbFNNMHJZSjUwUGVvK2FGeFNzeWJEMHBpU2xHNHRyT3lE?=
	=?utf-8?B?SFNKODZYaERDOXRCaFNBcDR6WGplcmYvSk1DUjVZcW9yTkdwaUNLT2EyaTd4?=
	=?utf-8?B?OUM1am9nMWRpbzhvWXkxdjRBR2pQNklwWk1WOHRRTEFtUFBkVVFtOXZqVVFJ?=
	=?utf-8?B?UHBNS1BBRUxMczlKZlhTZDcvalhjOXZ2U3hnNm93RXE1bDlkaEZkZHFKdjhS?=
	=?utf-8?B?aGJleHd6UE5KSW5KdWxZeGxURTJjRUl0dEJtWTZVanVBQUdZK1ZDNVhaeEh6?=
	=?utf-8?B?bzc4Vnlxc0xIVEJYczZlSTV0NGdDb2JOeXpqSy9wZWpid0czZGlJclc4WmVF?=
	=?utf-8?B?aDJZTkg3akU5NmNabGtuMzU1V09OTjBtT0loZ0ZMZU5DMjZ5NXdkcjNCRC9w?=
	=?utf-8?B?QUVpK3BJWmd0MU1aTFUxZnZZazhycUk3TnNKY2dtZWhjRDZ3ZDFudkFiRkpU?=
	=?utf-8?Q?dRwxJKLihKyQONgIyJ9uZNvlO2ln83CZfKrWtA=3D?=
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(39400400002)(39450400003)(39410400002)(377424004)(377454003)(24454002)(53754006)(478600001)(966005)(47776003)(65826007)(83506001)(66066001)(189998001)(23676002)(65806001)(305945005)(50986999)(230783001)(4326008)(90366009)(54356999)(54906002)(25786009)(6306002)(5660300001)(36756003)(53546010)(8676002)(6486002)(229853002)(38730400002)(230700001)(110136004)(77096006)(2950100002)(81166006)(53936002)(33646002)(6116002)(6916009)(6666003)(2906002)(6246003)(4001350100001)(3846002)(76176999)(42186005)(86362001)(7736002)(64126003)(31696002)(53376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2941; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7MjM6cWs2Tzh2WlhCMG5uQS9UWG00NXdUbE1H?=
	=?utf-8?B?SElYTlhXOVlhSVpLVDRIKzNtWWM2R3pZVkJhMXo4cnN5MURsTWQ2ZmFKRThF?=
	=?utf-8?B?RFdLSXNmV1o0dU1UMzkyNDNvWnlkZkNrOStTYWw5THF4S1VvNkNtN2g2ajBh?=
	=?utf-8?B?d0I3WUlEMmE2U2NhcmVxeCs1ZUcvcXlFQVlDUm41dUxwMWtPOUlqbmhpRXZx?=
	=?utf-8?B?WW43RjVtdDM5bEhNdGcvRXlEUERvdWZ1UFpYM3NteGJNRjNpQldsK2FxcFRO?=
	=?utf-8?B?YmY2dnMwV0c1djg0UEw3ZkdCTTBmWU5aNkliWVhTeXJRemtMZjdNTWlqQ0tH?=
	=?utf-8?B?TUw5Z3FBM0JHTmYzUEpRU2NPSUg2L1czeCtHc2crUmZQYXlXVnpobzZ2cmlI?=
	=?utf-8?B?WEczY1RIUEJTRFJnSTJ5R29tOWtiZVVRU1huNnh5bWN4M0pjVU12bkkxUzEw?=
	=?utf-8?B?NWZBNzZuaXdhZlhrQ1lJSU5VUlJMYkgwRlMyci9pNm5CeHlHcUh0cVJBeFh6?=
	=?utf-8?B?UlVRbXd3YUhySHhQUXg1cWw0cXU3eERmVnlaYlEvREd4alpjY2NwWkc0b3Bt?=
	=?utf-8?B?bnY0ZDhyTmgvRkZzQUlnR1padHJZeTJOSzk2d2x4YlNtMmVmVHRMVlAzbEpY?=
	=?utf-8?B?QklQVHNqbDJYMURoQlpHdW9EWnR1RFdVVTBVeWxqUjQ0dmhDREV2T1Z1T3Qx?=
	=?utf-8?B?TUVGVWRFWkRlS1VpVDMwQnJNUS9KcjFoRk1tZFVWbS9HWk1tY21SNHE3N0pZ?=
	=?utf-8?B?aU9uRDlLb3dUOFFzSEF2VHJla2hrbjgwVnMrYmsvK21LdW90eGsrVVExUnoz?=
	=?utf-8?B?SDJremdSd1A1Qml6dnBTUU1lVkZZTnBZSmp5bGJHQkVTMGpjMG9WSEJIdlB5?=
	=?utf-8?B?cnd6T0R6NlFkYnlsdkxGRThROHlJMTRZMkVzeFJsQkJKZklzNXltOXpHTWlF?=
	=?utf-8?B?S01YeFJaQVpMYis5Z1JLZkUyNkVtcmpveUN5N1BDZkV6V1VmN0xkd2lJUHVD?=
	=?utf-8?B?MzZxMVFOUlhKdmNHMkdCU0VUL2pMLzFWNDBWelVwSENVaHhMOWQrZi8vSzhs?=
	=?utf-8?B?QUpRRnBCTFVxZ3hhUk10em5RVitacEVya1NMd2lIS2hrN3FtL0R3SHJ3QktS?=
	=?utf-8?B?aHkydVVuT09lcXUvMlREeFhjZlo5ZjNkMGZjNU54YzYybDNPWGxyc1JMVWpM?=
	=?utf-8?B?WWo5RjJWVGhqVmMzUG9JRkJXQlNybUxjMTRQaUZkdmtPNHU2QjNEK0poUm01?=
	=?utf-8?B?NTZTRmFaUk96TnN4dzZvZkRSUXA0NVVnbDA3RkZ4YkdiUzVNY1Bnc3QrRjF6?=
	=?utf-8?B?ckhvSHlTRWl0UGhTRlRPejM3TW5QbnhkRlNveVBQbExQaEw3S0hnLzhZTzFv?=
	=?utf-8?B?Z2srTkg4V3FVenBsakZkd3VNeW5FbEFaU2FjSHh6MWsyNHpLVTMxdjFidHhG?=
	=?utf-8?B?d0hFNis3Wjg3eldBZVpSdkNDZDBvN2JtcGJIdm82dUhBSk1qL21lODN1Z2hu?=
	=?utf-8?B?V0ZIK1VacHFadFZCbmgyR0kzU25lSHNoRWVUaElTMTI2cUM0QjY1T3FoOVBs?=
	=?utf-8?B?bmhNbGJLQmhsUDBkZEpkVUxjNnVVc1VtRnVSU1MzVTl2YUNUNHlKSzQ0a0Vp?=
	=?utf-8?B?a2tTVWxNbzd5MVdOZEJ6RC9CbGRmUUlBY0hicUxhZGt2LzExUExxcWRweW5D?=
	=?utf-8?B?STJURnA4eWRDbVZLb1kxQkJ4Y2hwMFlTNzFDMTYxSlN1MXQ5VDRxZHYraVRa?=
	=?utf-8?B?VjlNOWUyN2RqNmxHNFYxakphcG5YMXRTTkxqNHVSVk1rcTZrZm9DTUk1VXpq?=
	=?utf-8?Q?8prY7hxNE4OnLbr?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7NjovT3dHbEE4RDlnVlMvV3Q5NXBWcnBVNzBt?=
	=?utf-8?B?YVZMZ0FUcTgrMGtRUW9pcis3Z2ExMWVpS0VPK2paUjEvS1Nqd3ViWEF5a1dh?=
	=?utf-8?B?clZNdWJLRmUzSmlVem9LdGFySklRMkxZR3lnYklUVXBhZURGd2R0UTNiMk8y?=
	=?utf-8?B?dmQ4TVBvTXYwU2tOVHFMNTlZNHlWL0lQYytWTUFmcTZ2LysxWnpKcUpoR3hl?=
	=?utf-8?B?SFVXdzhrRFA5MWlKbWhlcUxyRStEQ2Jpck1HV3orL2luZG9URzlzWWw0N3do?=
	=?utf-8?B?UWs0dmduTUtXbnFJSTRhdFhKUGJDbFFhNzUwSXRFTm1kUytaNktEWjcxczZK?=
	=?utf-8?B?VTFwN3dqRk5hbzJGREozaEtNZVNFWW91WGNIZTBkaU4yVE80ak40N2Q1Wmty?=
	=?utf-8?B?Q0VzczcwVGtGUkd4bmdTOXNzeGJEWlNKT29nVDlOV1dEcFordFcxVUNPRHpL?=
	=?utf-8?B?SmN0MzJXbEN3WGNsSCtaWkE4emRjRHpnWXlIZHZsUmsvWW9TbWh2bERZc09F?=
	=?utf-8?B?ODl0eVM4WmUraGJXYm5pY1ViUHJWbW91RG5nMEFraDN6N0NmQkxvdE10OFBC?=
	=?utf-8?B?SzBUQ2RpQ3Z3d0QwNFJ4TURnbzJtSWJkcTVSU2ZzK1JlSGFmbGtYVytpeUU5?=
	=?utf-8?B?OW1tanJ4T1ZrazNmKzJLTnNaMlVHNmxVWlpZOWNteHFrVnQwTEJQNDF4K3cr?=
	=?utf-8?B?VTMxQzYrMzNGMU9FTEh0dVR6YVRibTMvaWR0YStTYmd4Ky9NUm5jMG16OUY0?=
	=?utf-8?B?Z3JLdFZIa1o2VTZrczFRUmQvVDYvdEN0Y3ZTUnJHRnVzWUZTNzVPY2JrL3dY?=
	=?utf-8?B?UzNSdmkwNzM1NGcrOTJSYS9td0NkL3A0cmFZOGxObDZsRU0xdEJrMTlpN2Fr?=
	=?utf-8?B?TXl4RzV6Zkpvc1ZyRkVNVnZMbGZQckxUVzNtcnNWS0kwNVYzbnZ1Y3hQbFZ4?=
	=?utf-8?B?S0E2VEIwdk4zVzMvL2dUWnpoOHRBdks4cDIwc09Eek0zaFNacjFlUHNmUWY3?=
	=?utf-8?B?R1N2ckM2N0Q0RUl1L1ZGR2FPSEdTV08zaUhBS1hMTkxtMEtmcERXaHRobjFn?=
	=?utf-8?B?c2E0cmlGeUZJYjV2Vk92VU5GY1hxVUpwZnZiMlZoR2FTVHVvRjZQVGNLaWxL?=
	=?utf-8?B?dHcxZENtSDZKd1prZHhKb055SUxNN0piRlo2T21xNktidUE5RmZ0aDBhWStB?=
	=?utf-8?B?a2hTZm02ZDVrK3UvSWROV0xkaktwYjJBVDcrNzNKcktvS0I5MWFWcmMzdmV3?=
	=?utf-8?B?ZTk2T0tYOVA2TUxKUmplTnlKZUprMFVITXdtN1Z1bGpSUlhJUkcyTSt5SzhC?=
	=?utf-8?Q?edm19ooVWj5dK1P/gLjAMKmvyofQbtIk0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	5:siggtwAU4NTmwAYwIK7+nB9w2KU/rnIgyq6J1TX40vtUtROUes+haOWeAHUQj2SpX3PYB54bkdbYHjcaodEDpohC1riDUKnbSF262FJYc5zM85Lt/nVSKsmw1VYZo3LSocBwJnWirj4mol4z/aGMkpwWmoLht2sc7KdvQfNqPksZdFybrRH5ly93FVwhHfkFS3mS8NgtNsOB1L2JOo1VzGYS8Pl/r5dZ7OUXX0ZIK0WQSIrzRksb3KL7h+YjeLknV53A7Mo7X0aoF45nkSGU66Nw1TXyaNFOZJWOm8ukdp5HKPcSBU3+uoEz5QTwJqCfVFucPu7P9SXybRCqgGdgjMpM+LX2kFBnBcEoo0MO9fBR0pxKi1+yj+sn2Enm7W1MZkfLklDr23+NTCSTuhi9bsbm88YlhLb8/3FXqntnFuul6wAoLG9VVJWzITLRNuLyEViodv2Q/HspTnFm09QZ0LCMpr4DFnDXeo1lUz9Ub9tBq1kyAsUmLz6kz1jFJLKL;
	24:L2RGAGWm5s+nJpzGrVfCWwUlpyG2xzjzbirRmdxnP07SZe+Il+e/PvAkwtuoxF/uTyogH/OgNf9DloSWQ58AKXAUiNyxCCHg2pKX9MRnGiY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	7:ZpqfjUIBw2W4vL2mxvBfF25aogZl1FvwLbMXQBU08fQ/foqlS7b7TxbbQISNStY81xvS+qJUUHD7jOeKwmutp5nHPNe0U05GCjc+gRPyQ4rnOk11sAz0wVnp0SbzDfojsD5/prbodT7Uk/AhlQB1AteJUikHf3/CWoIjqfy9S+cYNzwIozH8bHP7h379nPOoITqylEqzZPWgWdR3ZtgsyTv4Z2g/6bp15o1SrxB2swGvpE/lWJAd2atYaKZX58nnJNZ224bmNthN3lRv6/tLYZ5IuYRwOoVVUKRovz0h7bVS2pDVwAbUViByxONCKnUUMXf0sLHLU504GLfKME4a3ps3TsDz0Ln0/c2hdaFACiVE/6g/sr/dHLaO0G3NUSdstV0fnNPHQ23uBOVoCCA7kS+r1ShUUaW4mjVhQiP3HAI8PWcpXsNaGtaNpx685aFE45+/VGlAC2LzKxnRah2jWh/GYHBSAWaNpeiZ0w1azW7TxBy6sLlP3n+WyvTk+e8mRicCU4pNEpJlp8MfaHDw0u1i4yAqyhbnK0pbt7XnoApsW5kdCSVnjcntzi5uPo4QGOSY6a94xHCTNCLXUzqLdIjZnJZar+f41d5gkmZqFzL6RJb7iPQIxckLqJdUvaTSbXhtY7wD02dnsOTZG41512vpxhlbKMMSE8JLoASfoxIgOvMxEHM4FTsqubWJAhNRfi7KZW32ZAuyNxyrWg+svQ7J5aKp9GlCT+6zdeWZAzo7El6CiT3VvWih1LOm/eGlHwZOFBMWtPg4HFe/8PDNElS0gCEDS7waFEdJx6FX0Dw=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2017 22:35:33.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2941
Cc: Darren Hart <dvhart@vmware.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] 00/17] new recipe v2: open-vm-tools recipe
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
X-List-Received-Date: Tue, 27 Jun 2017 22:35:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ah, thanks. It looks like the commits picked up some garbage (again a 
relic of me missing a characeter in the send-pull-request invocation):

commit 18dd8d0:
01/17] add open-vm-tools recipe

Once you merge to master, could you remove the "01/17" prefixes?

On 06/27/2017 03:29 PM, Martin Jansa wrote:
> It's already in master-next waiting for jenkins builds to finish.
>
> On Wed, Jun 28, 2017 at 12:24 AM, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     (ping)
>
>     I mistyped a character, so the patches did not correctly show up on
>     Patchwork (sorry!).
>
>
>     On 06/23/2017 03:47 PM, Martin Kelly wrote:
>
>         Hi all,
>
>         This is version 2 of a patch series to add a new recipe for Open
>         VM Tools to
>         meta-oe. This recipe is invaluable for using Openembedded with
>         VMWare, as
>         without the tools, performance is very slow.
>
>         More information about Open VM Tools can be found here:
>
>         https://github.com/vmware/open-vm-tools
>         <https://github.com/vmware/open-vm-tools>
>
>         Please note that, as mentioned in the first commit, this recipe
>         is modified
>         from the recipe originally found in the Open-Switch repository.
>         The first
>         patch is directly from that repository, and the following
>         patches are
>         modifications to it.
>
>         Original recipe: https://github.com/open-switch/ops-build
>         <https://github.com/open-switch/ops-build>
>         yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
>         <http://open-vm-tools_10.0.5.bb>
>         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>
>         Although the original recipe packaging was Apache-licensed, I
>         received
>         permission from the author (Diego Dompe) to relicense it under
>         the MIT license
>         for inclusion in meta-openembedded:
>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html>
>
>         The following changes since commit
>         d2da8b82cfb2f8e55236751c1c56c9e7f3b5f68d:
>
>           scsirastools: Upgrade to 1.6.6 (2017-06-22 16:04:14 +0200)
>
>         are available in the git repository at:
>
>           git://github.com/XevoInc/meta-openembedded
>         <http://github.com/XevoInc/meta-openembedded> open-vm-tools-v2
>
>         https://github.com/XevoInc/meta-openembedded/tree/open-vm-tools-v2
>         <https://github.com/XevoInc/meta-openembedded/tree/open-vm-tools-v2>
>
>         Martin Kelly (17):
>           add open-vm-tools recipe
>           open-vm-tools: add missing pkgconfig dependency
>           open-vm-tools: add missing glib-2.0-native dependency
>           open-vm-tools: clarify and expand licensing
>           open-vm-tools: base_contains --> bb.utils.contains
>           open-vm-tools: update version to 10.1.5
>           open-vm-tools: don't use mspack
>           open-vm-tools: don't use dnet-config
>           open-vm-tools: add #include to fix build break
>           open-vm-tools: add missing X11 dependencies
>           open-vm-tools: remove kernel module logic
>           open-vm-tools: line up configure options
>           open-vm-tools: support FUSE
>           open-vm-tools: scope build to only x86
>           open-vm-tools: style changes
>           open-vm-tools: fix all hardcoded paths
>           open-vm-tools: remove -Wno-error
>
>          .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>          .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>          .../0001-configure.ac-don-t-use-dnet-config.patch  | 41 +++++++++++
>          .../0002-add-include-sys-sysmacros.h.patch         | 33 +++++++++
>          .../open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>          | 84
>         ++++++++++++++++++++++
>          5 files changed, 171 insertions(+)
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/files/tools.conf
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>
>
>

