Return-Path: <mikko.gronoff@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0100.outbound.protection.outlook.com [104.47.2.100])
	by mail.openembedded.org (Postfix) with ESMTP id 97FA8606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FHEnK1FVJl+SDaK253u+otpBbWE1EAxGX185jZ2G6r4=;
	b=kIExp1Ma6kSyEi+BTKTT9yts1vhhx2gWbYIaP5zQ9D1ZAj69DaE9+DsZ4aGtoMWDEHB7IigJWM0w3UZk0bSFeQAk+W2U6RPVbXByF9JzzrzgYimindTaMPcKFoU2mCAHPtUzLO41Waplrg6wx52IP2BWCdaxqJ7cwnYg6e/MQBM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from [10.9.21.35] (192.89.120.53) by
	VI1PR0201MB2173.eurprd02.prod.outlook.com (10.169.131.144) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.845.12;
	Wed, 18 Jan 2017 12:54:32 +0000
To: Martin Jansa <martin.jansa@gmail.com>, Denys Dmytriyenko <denis@denix.org>
References: <1484363626-12770-1-git-send-email-denis@denix.org>
	<72187853-9f6e-e0a0-b09c-c87060ae182e@qt.io>
	<20170117174621.GQ15833@denix.org> <20170118012720.GA3279@jama>
From: Mikko Gronoff <mikko.gronoff@qt.io>
Message-ID: <29daa72b-2c73-3c71-abb3-7a22b8d81e0d@qt.io>
Date: Wed, 18 Jan 2017 14:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170118012720.GA3279@jama>
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1P194CA0018.EURP194.PROD.OUTLOOK.COM (10.175.178.28) To
	VI1PR0201MB2173.eurprd02.prod.outlook.com (10.169.131.144)
X-MS-Office365-Filtering-Correlation-Id: 5204280b-fc62-4d76-bd04-08d43fa1263f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:VI1PR0201MB2173; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2173;
	3:YiEO2Liy9zDYbY2xeqPrtzsUf35lr/cRrW1wb3fn+eEtLPlYqATXvL+u2diGKOXOapQF7by7hzqwC1dIfea2sTrTG8p0TBFTxILnkV0XGCYBkNMYZClqpZNE/K+YqL0+Zp0Cf4cuBNGSMF2xq0gBPO0uAdgVB1dI4ssyBgCg2IDrjlb2vyyUhIl5f9h0iv45QSe1pxQmCc7ZF9+lIEX/g+LrjEQlSevPnF4hOVec48lt8/FZr6Ww6cdW0igIbaX2+22LK36vkbHkrLba4GnZrw==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2173;
	25:oubta4nCy47oMzsdLI/wWBv/n7OPxXnIRVzHeRJwvVWGh4j9ebmlU9tEv6Ryb0Ot0XhjiLLYBiZYlzkfV4k0FtzzKwsRrtdB7PsE9w0g4PC/gOpxx7vUCsx2jyBoRBGitv74JIz0U/WnkvY852NazONcmx+hkoiD3Fze6Vmn0ISkX/whKFIcBl1yPXJuggIBc9ALoLPxCwV3et0O/sOLaduBtvhGOlUwxEsR+XmuO6xjlpI2JBxP9Kp4jOFwLh3WZQRpNVKfanEBDYjw9h+Gn2lpMvyuHWLQmSa1zo1JF3GSxlxFFE2k6LDVrfDnIsodV5S4kjUuZNvim1Tx6gQ0mSyhwezqpuQMQE+KwydqlfsE/qVEfM+0EHnm1X92wiFes/U1e5mcUsnyQz+q/KFJssfrrv0HgTYNuRlCiz0O7cr6ySjgsXv3JXp+m3UwIs/t/kYDMlq9JiAj3N7Mjdid2op18/snWiKsWa/Sz/Aax1Kti2gJUN0k/sQ68jLOvtJAtBavQfjs3JamrtRZoFRK2TVp1lRwBod3EK/j1OsBP3CYgBZfmoP4mBfmxyN3+eylU9oaaBw8bIGEdXPuC1WdxkLcE0Z8UMK9WxbyIgnSvX++EANCkw8IoxADq3Byu0TqP6q4a2ZSTjjNJkja9sqNjidR9jDF0XxifA6nm74teldhV/qmaWafnr2M4rDdDdeV+AvLL6hMdF8GkqD0pKb7alytOvxJTr3Fz8BoQi8h384Pr/HS3jLwlylMK55zbPItu+bfCAg4X8/qtWbNJmy6Ac+0ATQB6lJ05uHsqtOmR91N/SOq1FOWUZ7G22YAloTKsIirmWr51VMx1hD3zRanhWInGEB99gbzVFPBFlsumtM=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2173;
	31:FLWh065+woyIEvUpEq0k00vYfbqrGxv/v5zmrspc/o+g3pVX2hurXW8Bk5E8iJ6XcqaEmuL19N3ta8bgj1kA8j19tInuIdJ3jjKKAoWZA3E0uMtFs08Y42czZ86EJjx5PWu8vmI3TiZPDmOIgF42Sy995To371kMq4aTheZIQmAEQbQ6YidwdH3fXFto1X7LztZtrw7j1OGQxRS737YAkqBD1IU3uMt4kxVxbhvtsuV/EERh0uAwVcy+wdDJpbfQj9B15Eujott6L+Ytr4kJbQ==;
	20:G4BMyrVXZCH34+ujxdaBp5Pz91KuElpWcASc/ZX7Nhpo3izSuzb37BH/g4zakjBrFWw/Whsnukkl1w6fct/N/VSAZYLgn16617is5ocHHYQx/njsnCOv6AiN65l6UBgIdAOYkyxP5CXJzJLWXm9H/H13H5188Hue3ohCwbFXyp6bGCuZk9aKzFulsHfqGWBoZ+Comh/mHqs3QI1p5XVEih2RjOdodqckxRTsn5sRoK8LbruVc6/MJGAy0OAmcgOV
X-Microsoft-Antispam-PRVS: <VI1PR0201MB2173DD03AC3F25308A6A4877E97F0@VI1PR0201MB2173.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(31051911155226)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123555025)(20161123564025)(20161123562025)(20161123560025)(6072148);
	SRVR:VI1PR0201MB2173; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0201MB2173; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2173;
	4:V/7RvwKq8RTndyjcNUy70bhmw361oc7r/eSyRVy1SLkMVTcZRLIZKhc5PqZ47fYdc1LnDa1rKKCFQrmUYr/ewUxP/S66eDTF//Uhkbwhv4MjeDMpjtFRmAk70JPDdPqybG2NRB3qXJNYH57YYgp+RxhhaL4jY4dcsz90O1S3AaNOp4nbQ4ype1/1JHRZ1ZJbTJymOiVzXPt78uIGsuAx61cGD30k+Dxd5HPiZ6molgUCfXz14yNTX30BOhtLPlL/A8mCGT91J7kim6DAXXv8ogxZlN0yNagJ01dxOWewvogecYJ9IanqwKogaulkbl77yQ9KzAulkT3jjLiTD7c8wFy8DKpqfVvLZEjXFz9cQ46oJlNAbvOc1JrQRDTioOWFf16LIV5rex/6lxu4NUzQ+L1qwF6jcH72eoRImfUz5u5MiPU9sMCJ9dbRfwuQcuEZx72ny2W0ucnTF/CrGT1CkZsWJFzDB+fap7dotFJaezTwJf58fAK5K31uSBnjyhaUp+pWGCc88OvMJGm/a5laXYlDsYX/GntZqcqKti28t8KLYCoR/9okt8KnmxuXrfGNsv1Rg3MIsZUj5Zz5X4q3YD8jRFqdcEGfXgnmsGnqf+1xEUOp78OA+xPY1L8CsWKk0yOHzLmKounKl+VJWXIgSA==
X-Forefront-PRVS: 01917B1794
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(7916002)(39450400003)(69234005)(377454003)(199003)(189002)(24454002)(50986999)(65806001)(42186005)(68736007)(2420400007)(64126003)(92566002)(7736002)(76176999)(4326007)(54356999)(38730400001)(25786008)(66066001)(305945005)(2906002)(65956001)(229853002)(31686004)(6306002)(47776003)(90366009)(39060400001)(106356001)(10710500007)(105586002)(5001770100001)(36756003)(6486002)(77096006)(97736004)(101416001)(5660300001)(2950100002)(189998001)(83506001)(65826007)(6666003)(53936002)(8676002)(4001350100001)(6116002)(3846002)(81156014)(50466002)(15650500001)(23746002)(33646002)(81166006)(1720100001)(230700001)(7110500001)(575784001)(74482002)(31696002)(93886004)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0201MB2173; H:[10.9.21.35];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; VI1PR0201MB2173;
	23:O1ZALj7Se2ZgPaS/6dZJgiWKkyW5FbL9BLX?=
	=?Windows-1252?Q?4eqgOZcxO/TtJmBAGxFiKHOGEOeELagms6LdYw7C+hvbpGL3WSvoj32e?=
	=?Windows-1252?Q?MUBKUft+QzNhjrCxWvEXiD/U6x+qcbix4+VuMVSEBTrKN1euiA5/Vfra?=
	=?Windows-1252?Q?q6wN4AlK2+yEK83PXaGGSqMQT35//OJaXTb1IVRMOf9kPyDtCbT6NZHj?=
	=?Windows-1252?Q?pXTq/l5PxYbStQVeAIWxXQgzM/yr5Vxg9EdWYz2e/evrsz4p+/Xxz1kQ?=
	=?Windows-1252?Q?/rfWAWa4Kq+QLlxeSsaqVUvGllOhqx+S8yTS3VZjymFsh9fEDxiQrGSs?=
	=?Windows-1252?Q?LMouwWnE2MLlbl8YEcjQVzVIPjtPZIr87S9ZLOadinvhQ6NSvNRmXbJk?=
	=?Windows-1252?Q?fl/A7BnhRKKynCDKMieCb15/te7gQzUCWn08EEg9Mn1JgBS2W1O8HazJ?=
	=?Windows-1252?Q?YW9FmwUQ3DX9DBREPr6SXJUkZk7Lu4IvohDEmBhQMn7gA/qj12Huc2dk?=
	=?Windows-1252?Q?DrafOYdoGvBPGjrYZ+Nc9ty7J9cUvpJ3kgwsAzAr8dIF/vqDpXr1fy+K?=
	=?Windows-1252?Q?HByHt7d0EtWyN4WvuVEEj3G/XmxAehZmYTa/DwEoXNsBdYUY90qHLE+v?=
	=?Windows-1252?Q?xjP/+r3Q1akW7iYnP4EyN/MDtjt3ilM/RIZkMyWAmHvrYIll114mx2CV?=
	=?Windows-1252?Q?DTjCp5G/eXN3UE4Xjv23WwYDOB5f2SXRQWYEf74iGuDgXEVwyg6Yr+sh?=
	=?Windows-1252?Q?nCaT70D+5l2ExtgAFiw3OqUyKrTAcXEFc2WHP8GLzf9ZG1VWf93h7qzk?=
	=?Windows-1252?Q?AQh5FqkryflrVlO+aKmsp/QGTadD6F+YiNDvu5/YYKluqiJbScqjRKL9?=
	=?Windows-1252?Q?psDLNWjzufa/MUlyN0wCKEh/98kUZb048fVIRGLokMHg4Et+xyzXkoWx?=
	=?Windows-1252?Q?B+XGcGBb4wK86ixnvmZuztUlO3Pq1ajNrrm5CSdO+8H7Pyl31x1/PpCN?=
	=?Windows-1252?Q?7ixP6iQPKGjJi0KyBGIi3DJPJ3eLsaiQ8dpVXOFPNLC1VVOL0+24cfnu?=
	=?Windows-1252?Q?ANau/djhLfdrsmGeF/wA5VTze9kZXXoMbmzYmE03JLoNhKWainoqg93m?=
	=?Windows-1252?Q?TMJ9Dw+NA9Z6YnY3j8rq6WGXysKQrgYufgzDdHZAH8NEqwx8vZgmwoU0?=
	=?Windows-1252?Q?4OJtt7LoCWsID8by8cK83MQycNQU2gVmYpfNzGMQhNImvxosJ4UelMnC?=
	=?Windows-1252?Q?mFVM1hlgRcqXKTkPaiQckZ/yQT89hPSFu6jm+dTEsrnjT4L6pQBqBvmO?=
	=?Windows-1252?Q?w4mJKHitdgOKxB+xRs5kNMKqH0CCGCFlZMtN1S275GRoH501pLRTNQzA?=
	=?Windows-1252?Q?dXMYfdoBEz67cqweAUd5n4AdMwEydXB3lsqkC75S/UU82L4HUneA97ha?=
	=?Windows-1252?Q?i2z346KPFeb0u5O0WsG/gU72HXjsAmBf3gDKB4etSpAOxXQ22gb9nEML?=
	=?Windows-1252?Q?j9qTclTPEDUp9SSZjpDzXIEpygldDX8hYPr7NNgbdyBUkAuFVeq1bP+F?=
	=?Windows-1252?Q?kjCjdLVC3WnKM1QDtr1Bi36JF/0IZFZ3kdpEjS6svWbJoOCbRJqB2Bhr?=
	=?Windows-1252?Q?YE0nDaRj3+rp5435hB28wxfy7f/BaBF/RUgkL7cRajR1BcCGvMfi2uSU?=
	=?Windows-1252?Q?IGxsh1z5gzLyrP6ZsyGqwptvNd45vZxr6CTDzAdhESHzcbs9y0ZPy06H?=
	=?Windows-1252?Q?7JBm4MJe1D8RPA2Ri8g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2173;
	6:bkZJj+knwJTJvWJmkaiK6+kUB1mq4oTaOe7Gqmxvpr7V5bKfhxI1kBZT/AsmwrP790BJXnH9Y7+LC+KfWC7IAINqdXxWnfAXEy0j0mst2P4PginRQgtKOOjDQYoGsUiGG+ZE74e5Sh2RrxWUf6a4NbEX9sVEhEiFtpusBJngHu2nh6KWfC8DUUdagYgfqe+0r+nAhShbCOCQld1IhmtZ4PR08Q9SmDSnBEpBxl6ww/5npzQYCVpwVQx2hD6f/GU3C6GdhXi6081M+5IlCcKa9r3D4TUFVnzGoWOQQ3ilxcFTKIzgTVol6aa8mDcaZjXafqeCwZBh0Etm5S/ahXLpWoqEEoaNtwTHvytLO8HuzA/7sQa1TcA3qyTFLizRDRvpZcDvfWySzp55MHBGebbC6nJ1/UUFGhWRiTfhx19WIV0=;
	5:XGwIEoelCDAOq2xDIN93XEWqKMbhUUuHcpidsbxzXOmuKeOnXtiSS3AvoMkCmAMmHHIAYy2zrkNy1OpfUaGdg5LrA/UPioS+w7RDLsO7USp5jh+WkYHDLsDZ9O0v4UK1loSNk58s3lL6qHKi5noQcam+AViK7X0+7serdQClkws=;
	24:zjwnpUA74Aq4HGAmfLs7hv2SQtyG9g344TJ6Rfg2iL2CfPk1oxRZB/uMIt8odPkVjhFDCp7YdV04o8X43iVQoUfoIfgF83dWNBh3T4GZm8Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2173;
	7:O1YtraQv8us8oAMEy7L1pXZw706cjOLS93nYJhLJHz0Ig1ucZ9PoptXKxX+oDSzomU5UgVcqxOBy8Dg20D+MKQAXjK8ehLTkpcTsHUu87fuCVe/UigKxW+5fVpJdqsLmd9XhrC2fwbl3iM8vUzMMSj4eaH+cpLvEdjZ0uBF9TkCvZVKqKmOj/yfMX2rvcTV749fEsKKTvvkGsErbi6giGCRWl7inGZh2iK4f5Jy07awVQJOCpcnW4uPZUHO/n3x5CkMvoQ1QpYhQIMrHBmMUXM5R8mpAXl0qKqJ5Ap9A1AcJ81vmxyUNd+z8+O+f8GmXoEjFBd3JapPiOAjr3NkKgePbZNGORYdOt8GwDOjZLfg1M1iuvILNC5S0DGP6q0vHRbZ6XEgfPuGeD61xy9WwgnvsjGJFGPd2ltNa/Woj9eWdwcu770dDeJD5Jdm/OBKmJlwCdON0HDY+eYwNDAR6iA==
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2017 12:54:32.7085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2173
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][morty-next][PATCH] qtwebengine: update SRCREV due to old commit no longer being available
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
X-List-Received-Date: Wed, 18 Jan 2017 12:54:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

FYI the commit should be available now.


On 01/18/2017 03:27 AM, Martin Jansa wrote:
> On Tue, Jan 17, 2017 at 12:46:21PM -0500, Denys Dmytriyenko wrote:
>> Mikko,
>>
>> Are there any estimatest when this commit is finally coming?
>>
>>
>> Currently, morty is broken for me because it doesn't have the corresponding
>> QWaylandIntegration patch from master and Martin doesn't want to apply it,
>> since Qt 5.7.1 is coming any day now. And while 5.7.1 is already in
>> morty-next, it is also broken for me, because it points to a missing commit
>> in qtwebengine, which is also coming any day now.
>>
>> I'd like to get unblocked on either of this issues ASAP, as it's been in the
>> limbo for quite some time!
>>
>>
>> Martin,
>>
>> Would you mind applying the old QWaylandIntegration patch to morty, while we
>> are still waiting for 5.7.1 update to finalize? You already have the modified
>> and squashed version for 5.7.1 in morty-next, so should be easy to rebase and
>> merge it in the future... Please let me know, thanks.
> ok, I've pushed your change from morty-next to morty.
>
>> -- 
>> Denys
>>
>>
>> On Mon, Jan 16, 2017 at 02:43:05PM +0200, Mikko Gronoff wrote:
>>> This one commit was missing a merge from 5.7.1 branch to 5.7 but
>>> it's coming very soon. The merge commit is already done, it's just a
>>> matter of author submitting it in. Should be available very soon.
>>>
>>> -Mikko
>>>
>>>
>>> On 01/14/2017 05:13 AM, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>
>>>> Previous commit used for 5.7.1 baseline is no longer available on 5.7 branch.
>>>>
>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>> ---
>>>>   recipes-qt/qt5/qtwebengine_git.bb | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
>>>> index 4712441..210f791 100644
>>>> --- a/recipes-qt/qt5/qtwebengine_git.bb
>>>> +++ b/recipes-qt/qt5/qtwebengine_git.bb
>>>> @@ -122,7 +122,7 @@ SRC_URI += " \
>>>>       file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
>>>>   "
>>>> -SRCREV_qtwebengine = "9cc97f0c63049a8076476acc89c875c9e240abfb"
>>>> +SRCREV_qtwebengine = "6766290699acd0d73c81cf690012d52729e518b9"
>>>>   # This is in git submodule, but we're using the latest in 49-based
>>>>   # SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
>>>>   SRCREV_chromium = "b3c79e92f0a631273b639af171e59f4c367ae02e"
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


