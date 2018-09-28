Return-Path: <jhofstee@victronenergy.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0135.outbound.protection.outlook.com [104.47.2.135])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8D479946
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IQnN8GX86TJeEmx9nTruohifu4EoFx5/buiVA/VUKww=;
	b=ERpXSaPD4ityfN7PNMB11RyiA5wyDVo9xbshFNO0o4fxV3T6tznpNBST+/Aqws+OlTuSFHOY01E4a7DQOqDwTWY0OOzHSTRujgflU5ROjMoEXVhlQv5s71USm4T7JHMOMQzyzMnGuT2itWOEc1ncbPUHjbvp1iI3fO6vuLm+ngY=
Received: from [IPv6:2001:1c01:3b04:4900:68b7:73cd:e4f8:d09b]
	(2001:1c01:3b04:4900:68b7:73cd:e4f8:d09b) by
	AM6PR0702MB3638.eurprd07.prod.outlook.com (2603:10a6:209:10::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1185.16;
	Fri, 28 Sep 2018 18:48:15 +0000
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Max Kellermann <max+openembedded@blarg.de>
References: <20180927125519.2567-1-max+openembedded@blarg.de>
	<20180927125519.2567-2-max+openembedded@blarg.de>
	<ed33c2b2-69df-7ebf-d181-38e25ffbef1c@victronenergy.com>
	<20180927203459.dwvddevjmabhs2wu@swift.blarg.de>
	<CAMKF1soJQv93-=BjXD+GQnGkynFuQ+QMJts+HwSC8fPn9r5+oQ@mail.gmail.com>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <02b24237-5b48-4562-c711-97ad1dd46a0d@victronenergy.com>
Date: Fri, 28 Sep 2018 20:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soJQv93-=BjXD+GQnGkynFuQ+QMJts+HwSC8fPn9r5+oQ@mail.gmail.com>
X-Originating-IP: [2001:1c01:3b04:4900:68b7:73cd:e4f8:d09b]
X-ClientProxiedBy: DB6PR0801CA0054.eurprd08.prod.outlook.com
	(2603:10a6:4:2b::22) To AM6PR0702MB3638.eurprd07.prod.outlook.com
	(2603:10a6:209:10::28)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87a7c22a-6343-4ae3-748b-08d62572f2fe
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0702MB3638; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3638;
	3:esy4bPO3agcNkYBZDZ7EKvFLxk2XpIokrw40U9iOnGO3VYiHqdLt+6M3nmH4ra3BorkD5oMfJvZn3EcHITMApYwrok9fLZqRFIFYMEBfZioOvQ68ZJ0Rka10FFWKL0ARgQv2ilAqCY/7KYIPUMlL/JT1ZTlBcS7CGcn45oqeHWaywrhZZUiQdXydFr4LuqibpSPwQw9Wr6FGOkWyqpzZZV6xmEUwwKWK91eJAVfRYNA67PQRWJQMldofa+ROuq3Y;
	25:b4bR/oVnUTzPzG6kDWcZvzYiYzfPg+/y3bGTr8NVD54bu7ZxyER39J8OYJOdeEWE/qQ4GjRWaLCvWtmgt9wc444zp8DaZGZXahEBGTJSsK8z8CeVfSqyhaYXb+jP73lt9r9aWgN7hqbdaGuMAvHeVyYs2hMUYvJ3P5E+0g4QcG6OwMRq59M2oZaHJqRKjj+eLpXFZfTNyEQDBKLtlX/V+7OqJbx1keMPergrVagaeTIKou9SHhzlBzxSlPZn1UQUyEJmlsTLKJJME+q3hEwRe2q7h6u463n2aBcOy8ZgbrD8PmCi/BHsmV8QonPymT/Ur7TtcFNGHly2i6QIxJ3TXQ==;
	31:Kyipgr9rtOiqmI2aQqc+DxCig8DU6zxo3gdmZ5iZMdyVbZJGJEZ2JQekyBTfEYbNCWpu4j7khqpJrucNCI82qGh3vMCqVkmMrcCe+r9sXKupU4vCazhmcxDobjrxlERBhiu1XUIt5R1+/lNO50pd2ZcKE8oNhq1xZBUUu0xLbpebHOcBtM1haCH1N1J3eJWdBU/xSkfzI/HzJVWVfloLB3sTaAKnfqYfBxTiTqIovK4=
X-MS-TrafficTypeDiagnostic: AM6PR0702MB3638:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3638;
	20:o9NX2i4Ww3i1YwhnCZrieT7WOsV7ogCb8ijS8dKYE5zfFT+t7BTbtAkP2C+cmopINsWiIhW4pX4pMSe/lDY453RZjtMeQWK/1efqRWa3I0rCnBJkWpOLdEqSEV7eRrYGWBnEtnRwCzPiLNGhWokCKtO6vDyYK3qEo3WfyLcU4PFMkd4j3eoVVRWm281V396A4K4ZhdwNGnxgKq3rI4dUlTEdkv1ijV8CF5Uny+uQn+CXtt7TlGo2hV9SXS3tjALR;
	4:5cw+uum0cSl8XJLtmPqPChxfyve1krQAXPCoAAFeDP/7VmeQ/X0Fldq/UH1igJYaJRPNBRUVZs1xCqk9PR/SxecvAtm/hKOZ7bkuj9s4K/vWW5ImCMj4HnKyBsfy9LL98uLNRRT4YjvHpPpztu5LoeDbyJD0KDbwEbW5YQzuBQzfTI1W3nBZFkeedHqKjf4CjW22hKiXXCv/LferD/fbqu4BxKhvJRkRK2N4mJchGoGY4RtDZF0TKqYlGlTEeL/7ncJJ0Wj9o/tgnVz14GipmQ==
X-Microsoft-Antispam-PRVS: <AM6PR0702MB363849174D2909A87F29EF86C0EC0@AM6PR0702MB3638.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93001095)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991041);
	SRVR:AM6PR0702MB3638; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0702MB3638; 
X-Forefront-PRVS: 0809C12563
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6059001)(136003)(396003)(39850400004)(346002)(366004)(376002)(189003)(199004)(52314003)(2906002)(50466002)(93886005)(2870700001)(8936002)(6666003)(81166006)(81156014)(186003)(16526019)(31686004)(14444005)(229853002)(68736007)(105586002)(53936002)(6306002)(6486002)(36756003)(316002)(97736004)(58126008)(65826007)(106356001)(5660300001)(110136005)(486006)(11346002)(446003)(2616005)(476003)(53546011)(386003)(34290500001)(67846002)(7736002)(2486003)(6246003)(39060400002)(478600001)(52146003)(305945005)(23676004)(86362001)(52396003)(52116002)(31696002)(65956001)(76176011)(47776003)(65806001)(46003)(6116002)(1706002)(64126003)(25786009)(8676002)(966005)(81973001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0702MB3638;
	H:[IPv6:2001:1c01:3b04:4900:68b7:73cd:e4f8:d09b]; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTZQUjA3MDJNQjM2Mzg7MjM6ckZ3bXduZGxCQzlpU2pMMTRKZThBRnk5?=
	=?utf-8?B?bnJYQzBiR1VPa041VE0xTWp0OHBHRDFxbld4Qm83Rm5VRjJoL2I2U1BwWFBv?=
	=?utf-8?B?UWZFaGJjL3MzRjRMRlZqaU5UbW5MQTZMQmtMVXRSQjdkYXJsaWEyU0w4dnRM?=
	=?utf-8?B?VURLOGZhcGttbVhLbUZhSTlxL0FqRjdQTEF4RjI4eDJyNkhOdFR3K1E4aDBC?=
	=?utf-8?B?anpyU1N3UWpJVzRZVGQ5ZVpZbmZMRXFtY3VPTjFEcERUY3hEZ1l5OTFMQXBZ?=
	=?utf-8?B?dis5ZVFYVEh5VHRlemlaRnhNQVcwWENnNDl2eUZ6blg0cjlTdGpNUkRudzBY?=
	=?utf-8?B?aTRxaW5BUCtxbnVHVEV0NTZFUUx0bDFyTUxVUjdta2Jpek1GNEtLeFRzVnQw?=
	=?utf-8?B?WHlxTTdPMkpYVnhyYTJkRmN4M1ZmSkJ3aVJScnNHT1JwNG9iK3RPZFExSGdN?=
	=?utf-8?B?Rk9kaGYxS2kzNHR2Nkx1ZEo1bldwMVh2MEdRMVhvYVF2NmM5b2tLellvSUJ2?=
	=?utf-8?B?R2FQckczeDRXazE2YmVtV3B1ZUNQVmxpRThvcHJtbktrbHdkVXFEU2FiVGtx?=
	=?utf-8?B?dzRYUy9UNkNhZ0NZSDJYdE80OGpnT3F0czdSNWNFcnZEKzZ5ZGtlZlhJaHlE?=
	=?utf-8?B?TFJta0MzU1lFZDdGRW5MNzVWd1kyOVFxZHAyWGpOZ1RXNmpYUTMwb0gxd1BJ?=
	=?utf-8?B?cTdGQ0ZmaG9KTXk0cWM3S2pBYUE1MmRzMTlTVldxeWtaYzBxWlNsdVdOTElV?=
	=?utf-8?B?Y0ZLb0psTytKYXM4QUwyN0VIQ3h1Y29kaHIyd00weDgvSU5TZkRZSmtEa0hG?=
	=?utf-8?B?eVZZRTJ6c3M3TlQxa2M5VGR2QnM0cnl4R1IwNkVBbFRTb0VtSmhKZDZCWHdO?=
	=?utf-8?B?T0xFaGdmVC9tSjR3YURtZk1nOTZMN3hSUVNQZEZaS2VQbFlkZ2FsUzR6RURC?=
	=?utf-8?B?a25qOWFQMUxPSGxUWWlZcUJTUHppdEU5YnNYenpDYW52cjltdlpteHBHbDFj?=
	=?utf-8?B?RVAvSHR5S1BTTmNsZ2tnUUNNK2FTaFdhbmFUY2xWZzdEMmJnaVJ0VEtreWw3?=
	=?utf-8?B?clN3UmJyMFp0MkxOY1RhTnR1ZExGRWh4bENGZjZ2Y0Z1LzlPN3RwMSt2bVJv?=
	=?utf-8?B?cWpEaVJMZS9wNTMzNmM0YjFDQThnRms3VHNYNldQYUtUa3dIQ1lmeWZKbVRQ?=
	=?utf-8?B?WGpDb09YWmxTZFUxaXpZZzBPRDBmTHNwQUpibEZjWm5FdDRreDAwUkhRWGpO?=
	=?utf-8?B?M2Y4cjZ0VlpmWHRrT1hoNUZHa1JOdFBGdmVGWWdaclV3OGQ2a2ZzbEdPZ0E0?=
	=?utf-8?B?S0sxekp2dHVuUHRBZ2hTRGV6NVJhS0o5NkFxaTk1NVdvQlFEUHFqbTRXdTc5?=
	=?utf-8?B?S1ZBenhzK0RxdllxNnhiYzhJb1pVNWZtWnBiMHUyWU9TZVhGYit1QmlBUGdD?=
	=?utf-8?B?bGIwclBHcEZ6dTkyY0x6RmF5cTcxNjduajlHc2xvZmp4dy84MHFCcW9JWVNG?=
	=?utf-8?B?YkRUUUpmZldpdm56Mm1nZEN2RmkvOGhIdnhCbWFQSXlqZEhTcGg3dEwzVzZa?=
	=?utf-8?B?dXlhTGFmTHRuazRWYjR6bE1Samt4akJIQ09wNDQwMTRqYUtueGJSUzRvQzJ4?=
	=?utf-8?B?alN0ajJlcS9Ga0R5b2Rac2NZYXp3T1pPRmFlVFBMcTBwVlVDU3ZtN0Vmd2xL?=
	=?utf-8?B?Zm00SGljMHloMGZpT0lyWmFwSG9ydlFDcGdpV3pzR0xwU3lSR3hXeFAzYmFn?=
	=?utf-8?B?amNwRm5IMWQwZXorUE1TQ01PbFVlVFFZYW1GZjBwVm80NTVma0MyRWdyVytt?=
	=?utf-8?B?U2xCenFpSXpyd05LUDM3bkRJNm5zU3VFaEpkSzVzODhIZU8xYWMraHZxWnJY?=
	=?utf-8?B?SHVhcVZwSEVoYjl5RUlsLzhVZmhKZlNwQTJkUkJRckNZZFJwbXg2WGk3QTQw?=
	=?utf-8?B?NmxuckxLUlhnaEd3Y2RpKyt2RWRvNVdRQ0gvWGtZbWJ1dzFKQUNDTVowSTBZ?=
	=?utf-8?B?ZDhYbnVsRVpsSGIwaFRPUHRtSHJJdWZ0a3JUbkpFOTdDMi9XMDFiRU45Tlhk?=
	=?utf-8?Q?eHxfWD+1QntfVS/NBkmQf3WOBKB?=
X-Microsoft-Antispam-Message-Info: BwK8YZftnF1+4/7mAO/V1oGO70FZhKzfDEPzVtnKpuyuBn7mHe8jKHS86znQnN0zJ2vSUxFGU8KytxFhF7GzhsNfZS0J62frhyUC/7xorbvgdu+1LGzmCxcfnWepQW/C4ikoiwuXRIQq6I4ySiA4lysixpNc959iGRW5Kuma9xEw/kuOeIiKkO7HmDeeAUKn/XIpOVmLLH/CjlZbjtlpJW+njGGbCFJ2SKKYWEVFYCH2nwSA/8Mni62Zv+gZqxz+cNuWr1KI5lcSiabiWFizhcEyR+lHmu9LU13GjVQvesq7iX6zXQxfvtTsyWzv80svbnO6OEV0WWXClV3xwZgbIjk/XsQrrlwfidlSuxTk9Xc=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3638;
	6:vEfoq8QTUtkUYCSKyJfb/U24ps00zyFXQDeaXa98J7q2d4ZBRi79iN3YI8Co887jzQLLW1MZmWqABtvOTCYDdoGDABvD0bkinOWgfYWXHLd01oMr7v7pciWP3Q5IDuVDjND1PZQLQ3rYUwfUxE+UrsHO4TbDBmrXwP7h2T6iTon0yEAENo/yxrDMBsy/XNfq3Dwokuowhejvy1MvNwgCQQm25o1KjDGgOo3BCoXDrWzLVE70wx+fzQ9IYS1SPi+RFCI949Lo21QmlI1bFUXF2hUduWbGvU+Ia1EDy/Ff23GbpRUbpvgC6dhOXcm3G4bwGfqds5YXBXYTvtsVNoBjN7UvCEDOT8EVuszngwCIWBHMPZbK/mYoxpHzMRJkkPUMMkYctdmk8NPeiGjNhJqZXOriNTm02d0jStxHaONHgFYjQbPPBi+CxMH93XeplU51LxdXWevM2P6zbvb6c4YC1A==;
	5:C6XNstsSPfrnsPDh3BpZhh5JOdJjbKNLSfiUQgTpzaUp41q3tUeeImoQW4HKL5P53wYdHg1sYnSBytN5jW68XRjM7bLVu/Bi4Rom5WNYZMk+vVb2Dq/T5w6uR7AkoMSZIyPtj4HkyFvhMrWKETeuoMsINwJMF604KumhvxfVL7A=;
	7:z3gjCG6oRg5+4gDSVvIRwhct2aAKQGCp4hQojuH1qNrjVB58aX+bHljy8gtE8G5z8ZAOwQ0Qud6WsLJOgwnQQxuHQexUcKdMQVI217LMI3bFYA11ecz6tT3cqH2eI4Y0jyaGmOU10er+VbxrnsDWfCmjteTeGbKX1I3Otk931cx0rG5TTl1VwB1/epwGHgDBc3YJd69ZmkGprKzYvC5F+HtBDtnjJwphg3f1FUY43XWXSqjKj5domlSkyv83XWeC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2018 18:48:15.0163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a7c22a-6343-4ae3-748b-08d62572f2fe
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3638
Subject: Re: [PATCH 2/2] php: fix linker errors by setting `ac_cv_func_dlopen=no`
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
X-List-Received-Date: Sat, 29 Sep 2018 00:22:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,


On 09/28/2018 06:02 PM, Khem Raj wrote:
> On Thu, Sep 27, 2018 at 1:35 PM Max Kellermann
> <max+openembedded@blarg.de> wrote:
>> On 2018/09/27 21:27, Jeroen Hofstee <jhofstee@victronenergy.com> wrote:
>>> Removing CACHED_CONFIGUREVARS completely also seems to work
>>> for 7.2.9, but perhaps 5.6 needs this?
>> I thought about this as well.  The reason for hard-coding those
>> variables is a mystery to me, because I thought doing such detections,
>> even when cross-compiling, is a first-class feature of autotools which
>> always works reliably.
> see http://git.openembedded.org/meta-openembedded/commit/?id=0d052a48c9fd6d2207f150729a20804e416c91b1

For what it is worth, php_5.6.36 builds fine without the 
CACHED_CONFIGUREVARS
and opcache enable. I am not sure I get this part "AC_CHECK_FUNC isn't 
suitable
for a cross-compile environment". Yes, it will check the cross compiler, 
but I would
expect the cross setup to be the same as on the target, or that should 
be fixed I
guess.

Anyway, no objection for the patch, since it does already fix something 
(building
without mysql support e.g.), but I am tempted to think the 
CACHED_CONFIGUREVARS
can be removed completely.

php 5.6.36 does seem to be broken in default setup though, with openssl 
enabled,
at least I had to disable it to test this, see below

Regards,
Jeroen


| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_sign':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:4801:13: 
error: storage size of 'md_ctx' isn't known
|   EVP_MD_CTX md_ctx;
|              ^~~~~~
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:4845:2: 
warning: implicit declaration of function 'EVP_MD_CTX_cleanup'; did you 
mean 'EVP_MD_CTX_create'? [-Wimplicit-function-declaration]
|   EVP_MD_CTX_cleanup(&md_ctx);
|   ^~~~~~~~~~~~~~~~~~
|   EVP_MD_CTX_create
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_verify':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:4859:17: 
error: storage size of 'md_ctx' isn't known
|   EVP_MD_CTX     md_ctx;
|                  ^~~~~~
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_seal':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:4920:17: 
error: storage size of 'ctx' isn't known
|   EVP_CIPHER_CTX ctx;
|                  ^~~
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_open':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:5048:17: 
error: storage size of 'ctx' isn't known
|   EVP_CIPHER_CTX ctx;
|                  ^~~
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_digest':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:5154:13: 
error: storage size of 'md_ctx' isn't known
|   EVP_MD_CTX md_ctx;
|              ^~~~~~
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_encrypt':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:5233:17: 
error: storage size of 'cipher_ctx' isn't known
|   EVP_CIPHER_CTX cipher_ctx;
|                  ^~~~~~~~~~
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c: 
In function 'zif_openssl_decrypt':
| 
/home/jeroen/software/venus-upstream/build/tmp-glibc/work/cortexa8hf-neon-ve-linux-gnueabi/php/5.6.36-r0/php-5.6.36/ext/openssl/openssl.c:5316:17: 
error: storage size of 'cipher_ctx' isn't known
|   EVP_CIPHER_CTX cipher_ctx;


