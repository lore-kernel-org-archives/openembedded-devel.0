Return-Path: <roman.alyautdin@rtsoft.de>
X-Greylist: delayed 144505 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Sep 2016 21:59:17 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50139.outbound.protection.outlook.com [40.107.5.139])
	by mail.openembedded.org (Postfix) with ESMTP id DAB8A60191
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 21:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=5031003890.onmicrosoft.com; s=selector1-rtsoft-de;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=s2EP0MIqJuJ/YO8ayvYwlLONzOXKDvY1AbByLPQWbi4=;
	b=kq6necjZSyWCEgXsh8o9itQTOCq5xJh1yeudcQtWaw1VNqI8oZE2IyLkMuzYIFTyCxq8hEprd9GOMMXIylRJ/kmOGAnT9mRIWsOym3qRWmRLxceUOQXUYZdWgxmHt/xiuGkXrrEJx+bvNrR9KNGymnr9P2fws8vjhOjTGkGvluE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=roman.alyautdin@rtsoft.de; 
Received: from [192.168.11.42] (213.79.90.226) by
	DB4PR06MB363.eurprd06.prod.outlook.com (10.141.234.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5; Wed, 28 Sep 2016 18:25:15 +0000
Message-ID: <57EC0AFA.1000206@rtsoft.de>
Date: Wed, 28 Sep 2016 21:24:58 +0300
From: Roman Alyautdin <roman.alyautdin@rtsoft.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <1474649164-7513-1-git-send-email-roman.alyautdin@rtsoft.de>
	<20160926063903.GC2631@jama> <57E8F4A2.6060404@rtsoft.de>
In-Reply-To: <57E8F4A2.6060404@rtsoft.de>
X-Originating-IP: [213.79.90.226]
X-ClientProxiedBy: HE1PR0801CA0036.eurprd08.prod.outlook.com (10.167.184.46)
	To DB4PR06MB363.eurprd06.prod.outlook.com (10.141.234.147)
X-MS-Office365-Filtering-Correlation-Id: d512bb10-b994-487c-9fb3-08d3e7cccb60
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB363;
	2:JAjz/cFabkrbsh39k9qFSFHpwRofEmtswm3VHY0ebblWgP4cQF+qYZ89exprD/ODpv/F2SjbYTxB/PwvnSin5LEZrCgpQIj91/XsLeG+kPqfos7VKQMhMi2aiWIle7vSt0ItNKWueR4Wt6hpSurfdgDr1zKX2bg+N6EXzzZKn0lKeybvTnVSFMcELmGMyHbK;
	3:4sGWmoLjLPtuxZZCeZqhOyipLmmTpYdPd6siXUA3KcocJetJ30ZwlNL9Cw4x46KsO9dHn4mVT+NeLhB7w6U2qQ1BtFTgXflEaNUuUkksFgqq7Z+qlxGcypw5S4lM4qva
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR06MB363;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR06MB363;
	25:tkYeykFFujVc2f0QT42gcJuu2DMN5SNBo3BlFrylWR?=
	=?us-ascii?Q?sbESO/CC4n3RoffcZsboRIK6OI/AC58XcFqsNWI/eHA2FMGwNdNLQzro2Ggw?=
	=?us-ascii?Q?+pLV/JyGgaflT2DI3qeuJ308m50GkEVbCHR4axUyWOdi+yqS0daLUNdHrbP6?=
	=?us-ascii?Q?HeTrZyqNnaRi8qSjBEEyJm/R4vakV1VKkDGD+GA5eKS10yDihFWFKM0e4NgG?=
	=?us-ascii?Q?Q80AfOt/cRgAejTctkAvUENSYRCRtFqqmNgqjhPDn09tmESIUokmyDBn2fQe?=
	=?us-ascii?Q?pkPXksqAlHxyAUyRleluHC3KVTlzbPoq2XP0SnF6OLiNrOXb5DJrvbKdYirq?=
	=?us-ascii?Q?yfQQdF0JpDOWM5B/DTJfR6DZ8kbdNywY70dKpjEWvxGncka6DthDv21P56p1?=
	=?us-ascii?Q?hNchez2SPClWBtwkAimX1wMLPV1clOaiOYuXBbqByT2j0ffZPmxv/mvAzWqf?=
	=?us-ascii?Q?HGFM2SbLAY2jbgEbooBGBmxFG8YvT7vs8X1fOHtFj5IMTAG2TYgOfiAxP8Us?=
	=?us-ascii?Q?zOK2rK07AQ0CdEkPzbjMcT61UTHovqa8BYG5fYrVFlPatyWGLJhWl6Nxs34J?=
	=?us-ascii?Q?u8kZud1EqZxFzOrdsSFBhPK2GY282/EYFA+eQIVNyr/4HOHMcejMrW7DSKee?=
	=?us-ascii?Q?3SXO16FD3KhvHT5xIsMH0EQdmOh/dpKo/3uJrZSDU7SVq/5GTx3BlphLnmlx?=
	=?us-ascii?Q?/EYFuD2yHaEtrDneeVVuaL93pO60bda9dUW6oEyfojigUOQMLGrjF6X11yWd?=
	=?us-ascii?Q?ebNK51XtFDR0b3M30xQ5BUt3N6LxosHrWBSlYOxP/mNNIj0qP4NmEcukkM8l?=
	=?us-ascii?Q?tVc29gYIG247vmv1KfrTtbiz909mxkLyEIFPKUkTuCICrhII1LAMhXyzg4pf?=
	=?us-ascii?Q?McbGm75mkIrMkFbZULevfAXE5QAEkelHijiigbiRe7bNygLK4HF7AwODHNk+?=
	=?us-ascii?Q?MQ/jmfyj/N04VpLVmo8LQGQwV+HJfFmF0Y4TdWSvYYaYqb6Xjp8qGZN+SPlx?=
	=?us-ascii?Q?yHxjMXwEh0kJxP4iuDfj+M?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB363;
	31:6j179ElS7kPtjgYGWqTxiu31OFRHIXNdlqzUcdfE6UJrU9wos7CpRwgLjtko+cHJUYkYqL+3oAFWt95qUFl0Z/cHESpkecpALL7J1wzP4C6h1BLXS2b40lDzgngUeTylRUqAu0/Rju0xDw0qISL+cx/styzoP5ERUTILU+X5UWXksosXAIg73PURbyxuuiBgZ0XXCGY4gp6rSjjWvyUO1RWC4YeBG09IMu6eeLjRXJI=;
	20:8bsD+HXDxfAl3qiaP7mVLyrjtVJxbej3jSJnWkuWcl/yKkdkcRSYotfsQOZTxb840C55wtnciPk27qYl3+Bn7HX03P4bFsVgCf8ARunb4IbCrbCGdec5UUQ+oj8Hc20R/Etpo8ZGkYFWv6RhvULt3dZgfcZsU9/qFZqpWTbUFcH2JrW/A7EKLpZHn0OaQSze0m5i+jHOJ7qvMlL2wS4uQxlvEgc7mciiewbSqgElECxS4I7Otcqhvpn8xkEwIq5fLpPN4JYpYnKqyEE+jrc69EbaiB0o32+UxsHJOLBudq3ePdN9vJUH4OJBCN0hk95wzpZYH46DeR85FMlVGNJwvA==
X-Microsoft-Antispam-PRVS: <DB4PR06MB363201ED5014CE1823DD6D8FBCF0@DB4PR06MB363.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6043046)(6042046);
	SRVR:DB4PR06MB363; BCL:0; PCL:0; RULEID:; SRVR:DB4PR06MB363; 
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB363;
	4:0cuHOQ89nF3dMpPbhZwNupyMAJIwzFjQ0tXYcM0xHeTXqu8gc/kIdb7EJMYWHGvyBL55zuzA8a/txAVxGJIsS3wtZTOwPAASFdsES/dUCwO/9Ze0UZT5e8xMJrxayna1Jz3kdNdorTYRU8huUb2mtoJNJrQy7diFP78xq3sJNp7kbjMYsQu/scHl7WJ/6CrRsXb7jRcwuq53JoZPGIYlXpJel2nG2UkAkTk5l5uutks0prTZTWoS7Qol/qKSyzoHuFzyMLsxLMCEAmNhcBbdUt+dfuejBGqqNOCXrODxVcDgyZCYmMEwwZyTHn/G2jNR/77QAMP/BDpR26q7czuObytkvaXHvv7/+FKSdpqm+0GQuLhq7mQSia8UwER+qsC+EFStrMp7Ba8mJav78quld5MqMi5DK7FGvIBGlAT7PeW/YZnXyDOywrd/LMmUeFhYLTWlkgMwcspDkA3hDEb3HtO3nwf9cPiDEtdeJ7f+3KbVbkenDzfJMs0vN3tcDyJu
X-Forefront-PRVS: 0079056367
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(7916002)(189002)(24454002)(199003)(64126003)(5660300001)(86362001)(74482002)(75402003)(3846002)(7906003)(6116002)(19617315012)(83506001)(512934002)(586003)(270700001)(575784001)(2950100002)(84326002)(77096005)(15975445007)(106356001)(65956001)(7846002)(189998001)(101416001)(42186005)(59896002)(107886002)(65806001)(66066001)(117156001)(105586002)(5001770100001)(54356999)(8676002)(33656002)(19580405001)(1720100001)(2906002)(7736002)(68736007)(92566002)(76176999)(81166006)(80316001)(19580395003)(97736004)(81156014)(4001350100001)(65816999)(50986999)(87266999)(36756003)(142923001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB4PR06MB363; H:[192.168.11.42];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: rtsoft.de does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR06MB363;
	23:1FH2hyNwTz+DbGXTloYAyXkWLrN5otJJi/Gj1OVGBG?=
	=?us-ascii?Q?eLM7NG5kZdvaqia+VELSnLGgv8xVJO7acXvTwLmI4ZD7BN2kChVsH6rHlbmA?=
	=?us-ascii?Q?c6VO1V62+UByzas+F0kzSQ3czrkYl28MbRlRuJTh4BRPh7lzos4/8KAsJVia?=
	=?us-ascii?Q?XlCY8hM9kBAPYKfcANpWROO6ifGlS6LHRok5MPM209wP0KuFThBSQ/Alixe9?=
	=?us-ascii?Q?zzxt+EjPxX4A+qas30978zzVsiFVi/I5HjKjwHEAHqLSXAcpByNxVvPkD0gi?=
	=?us-ascii?Q?cxHRlHamNZAg40BYuRlnzKTj4dK7BIqBITOJ/5djhX8PEZECwlND+0a4qbtG?=
	=?us-ascii?Q?d71Yf3HzzNQKAuoY4UOOewmiGRfJK5S34wLtpjV/3YZQIMwQfA8qVh+Z9vEu?=
	=?us-ascii?Q?ZYPvybPQJ7HBcG8dHwQU1eTZCqztPmEnK4mmYWNwxChdYZ2xtnG/0rtCMMbO?=
	=?us-ascii?Q?07rPMPdhemSf2uEfnyJfsHJ8Dcm9g1HkX1UvuWTtnJky42PJp6lcqpcsEVYg?=
	=?us-ascii?Q?PBvfrifI4StLm/n8ZR07kmhSLnSXo9n62yVHvf4JBFVv7Ol+1KNelI7OjD9M?=
	=?us-ascii?Q?O4oVJRNNZU9raZ+GMEA9P3/b3ZF3O3nSCMiQBKSde4FHZvAPTfkI8dJDY2Hq?=
	=?us-ascii?Q?kgPleNrRtEyfSgqrA/a2q/83xEL8ND4bQFBvnamfadJpA8Mp2bXcnKtJlMcF?=
	=?us-ascii?Q?zkL1Z/NmoAi1B/oTVmbpzpRrNTfJEHguVfG1db0bYuXn0wtMMvyjV4oHhP8U?=
	=?us-ascii?Q?8noU7vyPXsCR5GVncXNXSBzfuAXYFyAmc1FZIL8Jb2WKet6YCOKEqh/hztwI?=
	=?us-ascii?Q?g4ypmDdtME+mN3/AHuZhIEFc/c40plw4bPwuVjRFzO05sj2f708f7VZ7vWBj?=
	=?us-ascii?Q?Riru1Q5K2K4HLczdHQKbVEY7gFHAedbF4Vu2e6A+SbgnFPOQosAMqieEj9bb?=
	=?us-ascii?Q?qsVPMqb4OTlaslltbuBGIH7SpqWu/y5t6gWZAbFNomiYfpCa13B+DXsHnsGo?=
	=?us-ascii?Q?2yZRefnfuqX3G/KxpPH1iodb6J8haj6fPIILEOifQO6SYK3HRlfu8+if3i38?=
	=?us-ascii?Q?SKOwYRm1LIt+KmOiZ7pb3Y95OdFiGq8peZC1Kj+qTtZQxTNXYtmS6MaeaGRZ?=
	=?us-ascii?Q?sEKj48rQ1nSVwd2JvX7PGq+70wi9GRHdYHMNkmCyZFCt4rbdiNkEUTNWTE92?=
	=?us-ascii?Q?j6aZSNe28FHyLIvN3T3eKUzH1xdKzwKVBKVsPh7lPSuQj6TuPg2ABeNEPRIk?=
	=?us-ascii?Q?ni2V5OB+5ZWg1qbgXpDW06qzBLzJ+EbpcnCshKQZGq8zpZQx8VBek7yWO8PK?=
	=?us-ascii?Q?DRQoQrcQY6ouHZx+bDUBtU4dRmSjfuWb07c+EY/8OrcIG/alMHv5BiNIwGpg?=
	=?us-ascii?Q?rTyraEQ2bBsh0fokpdn0hUdABHC2iE+RW6DZ2Yr0c5Zo5BS0VddDxXKXtnxw?=
	=?us-ascii?Q?h/nTi7SmMcPj7SYh7adw+bTgMS/Ks=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB363;
	6:iyb3ex2kkSg6NMDqkecYWxTBFOgys6nQOQDhatqJ5l9xkok0j/ne64+w8T/TbZHXgoCgbK6j3a/QCDGUS8vuhkZimFemprsEQcQmFB00fXhzSNtC3zNa5kJ15Rpmz+khHWL5WIgiEKoiF5rtcl97pT1tuApE9YnAlgkvYaDxGtb3EBCGvlPrG4p2e2xwHQtd9cE2OH/JmKFM75Rly5RSFheWQhPZsPuKQ686U1hDQUUulKiXgh8Kbj8Fy7W1Gvj62306D1YcMpLolLnUL5oFux8BInmAwHlSbYXDD2Y68xw0SQSrG01fV7clCw56jABW;
	5:rdYddQjb/c2ToP4Zyujfy4pO6p6l3hqqnXvQPeVSRfeSH1wKOr4GJuWeuDeOYHZEv06eA+3WlIpSpXy8Yq9zcuar3Xxs6cKflJ3On3ClPHsK5CgsJlR++UX988bBfV67ANjyNrRL+XTU+JXiHy4n+w==;
	24:hxcbHohQamnjFx1K4PRk6dKsQItndm4aOoJAsdjDcIhhZjO2eoKUFsNl8BC5Bckuu2v2ieAdQl2pGiHlueEFORlmFiBbwsnUnfQKdIybLO4=;
	7:BpC/iQtt+zdzgShtRhLUYIN/Qbl2cssVvqaGJGdRHy7bEG0USJRgY+sj9DYXtyE2+L5v4pO//w0tI1ivEvU9kr/hlCDcq88H2VKmRwW2sfXwfXfWmkYGxixM8YOBgUTgblajRcdG+BdcH16ukr4h/RS7JQNDRlfr2L/joAXQbWcz3lPG+14wJxIPPalgWoqUOTsW+AkJv/Qc2zNiSYc7I/MkY+pPj4ljqE91BYkZuJyOpIuBNggw1AvR3LUYbFg0URrRlhaPxNo1mS3/njIyvLtg1CCpgHGrTshVQuw+qaVn8Tt1y9E96quxydTjr+w4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: rtsoft.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2016 18:25:15.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR06MB363
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] mbedtls: separate general .inc and version-specific recipe
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
X-List-Received-Date: Wed, 28 Sep 2016 21:59:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin, should I prepare "mbedtls.inc patch" against 1.3.17 in 
master-next branch
or you found my explanation was not reasonable?

Martin:
> Which version do you need that it requires adding .inc instead of adding such version to meta-networking?
Roman:
>
>
> There is a  need of mbed TLS 2.3.0, the reason of not updating 1.3.17 is
> that many project will prefer to not rely on "the latest and the 
> greatest", keep
> staying on maintained 1.3.*
>
> So this will help to have a choice.
>
> Secondly, unlike 1.3.17,  2.3.0 CMakeLists.txt depends on perl package 
> presence.
> And this might be a significant thing for somebody.
>
> My plan is if the approach is accepted to create mbedtls_2.3.0.bb with 
> handling of this
> new perl requirement
Thanks,
Roman Alyautdin

On 26/09/16 13:12, Roman Alyautdin wrote:
> On 26/09/16 09:39, Martin Jansa wrote:
>> On Fri, Sep 23, 2016 at 07:46:04PM +0300, Roman Alyautdin wrote:
>>> The patch proposes to separate general part of mbedtls recipe into .inc
>>> and introduces mbedtls_1.3.10.bb that requires mbedtls.inc. This will
>>> help to add another versions without duplication of general stuff
>>>
>>> Signed-off-by: Roman Alyautdin<roman.alyautdin@rtsoft.de>
>> I don't know why it was sent 4 times, but there is upgrade to
>> 1.3.17 already in master-next:
>>
>> OE @ ~/meta-openembedded $ git log --pretty=fuller meta-networking/recipes-connectivity/mbedtls/
>> commit c5af6e71907714821c0edfb23085f0a700b1118d
>> Author:     Wenzong Fan<wenzong.fan@windriver.com>
>> AuthorDate: Wed Sep 14 01:49:13 2016 -0400
>> Commit:     Martin Jansa<Martin.Jansa@gmail.com>
>> CommitDate: Mon Sep 26 08:29:34 2016 +0200
>>
>>      mbedtls: upgrade to 1.3.17
>>
>> Which version do you need that it requires adding .inc instead of adding such version to meta-networking?
>>
>>> ---
>>>   .../recipes-connectivity/mbedtls/mbedtls.inc       |   35 ++++++++++++++++++++
>>>   .../recipes-connectivity/mbedtls/mbedtls_1.3.10.bb |   35 +-------------------
>>>   2 files changed, 36 insertions(+), 34 deletions(-)
>>>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
>>>
>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
>>> new file mode 100644
>>> index 0000000..8bb6855
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY = "Lightweight crypto and SSL/TLS library"
>>> +DESCRIPTION = "mbedtls is a lean open source crypto library          \
>>> +for providing SSL and TLS support in your programs. It offers        \
>>> +an intuitive API and documented header files, so you can actually    \
>>> +understand what the code does. It features:                          \
>>> +                                                                     \
>>> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>>> +   Camellia and XTEA                                                 \
>>> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>>> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>>> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>>> +   ECDSA and ECDH                                                    \
>>> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>>> + - Abstraction layers for ciphers, hashes, public key operations,    \
>>> +   platform abstraction and threading                                \
>>> +"
>>> +
>>> +HOMEPAGE ="https://polarssl.org"
>>> +BUGTRACKER ="https://github.com/polarssl/polarssl/issues"
>>> +
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM ="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>>> +
>>> +SECTION = "libdevel"
>>> +
>>> +SRC_URI ="https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
>>> +
>>> +
>>> +DEPENDS = "openssl"
>>> +RDEPENDS_${PN} += "libcrypto"
>>> +PROVIDES += "polarssl"
>>> +RPROVIDES_${PN} = "polarssl"
>>> +EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
>>> +
>>> +inherit cmake
>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
>>> index d5c7afe..3f1c1fe 100644
>>> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
>>> @@ -1,37 +1,4 @@
>>> -SUMMARY = "Lightweight crypto and SSL/TLS library"
>>> -DESCRIPTION = "mbedtls is a lean open source crypto library          \
>>> -for providing SSL and TLS support in your programs. It offers        \
>>> -an intuitive API and documented header files, so you can actually    \
>>> -understand what the code does. It features:                          \
>>> -                                                                     \
>>> - - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>>> -   Camellia and XTEA                                                 \
>>> - - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>>> - - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>>> - - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>>> -   ECDSA and ECDH                                                    \
>>> - - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>>> - - Abstraction layers for ciphers, hashes, public key operations,    \
>>> -   platform abstraction and threading                                \
>>> -"
>>> -
>>> -HOMEPAGE ="https://polarssl.org"
>>> -BUGTRACKER ="https://github.com/polarssl/polarssl/issues"
>>> -
>>> -LICENSE = "GPLv2"
>>> -LIC_FILES_CHKSUM ="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>>> -
>>> -SECTION = "libdevel"
>>> -
>>> -SRC_URI ="https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
>>> +require mbedtls.inc
>>>   
>>>   SRC_URI[md5sum] = "19ebbc96feceb430ad958dfe89cb633f"
>>>   SRC_URI[sha256sum] = "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8995094aa6adb407e"
>>> -
>>> -DEPENDS = "openssl"
>>> -RDEPENDS_${PN} += "libcrypto"
>>> -PROVIDES += "polarssl"
>>> -RPROVIDES_${PN} = "polarssl"
>>> -EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
>>> -
>>> -inherit cmake
>>> -- 
>>> 1.7.9.5
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
> Sorry for submitting 4 times - email misconfiguration.
>
> There is a  need of mbed TLS 2.3.0, the reason of not updating 1.3.17 is
> that many project will prefer to not rely on "the latest and the 
> greatest", keep
> staying on maintained 1.3.*
>
> So this will help to have a choice.
>
> Secondly, unlike 1.3.17,  2.3.0 CMakeLists.txt depends on perl package 
> presence.
> And this might be a significant thing for somebody.
>
> My plan is if the approach is accepted to create mbedtls_2.3.0.bb with 
> handling of this
> new perl requirement


