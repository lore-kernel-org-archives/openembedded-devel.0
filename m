Return-Path: <roman.alyautdin@rtsoft.de>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0095.outbound.protection.outlook.com [104.47.2.95])
	by mail.openembedded.org (Postfix) with ESMTP id 0081C60939
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=5031003890.onmicrosoft.com; s=selector1-rtsoft-de;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UO5nH54DXNw/vcNv5QDORtUVxZDgEfi3WU1qHBXhsPI=;
	b=lu7Be8HipTyif0a2S9m3cAO9IbvKnzlkiNwL4TDzqweUDR8FlVLdmnloMiBRAGiBQYsAmgb6aIG3ylP0MUHIFBfi3o5rAgxoLOOM8Rkozq8cWfMxAuNVwn45VQTR8MjKV6tbti+YgQwUdeMUkbdK9amvfzIAeRrAIUn2Ug/VR5Y=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=roman.alyautdin@rtsoft.de; 
Received: from [192.168.11.42] (213.79.90.226) by
	DB4PR06MB362.eurprd06.prod.outlook.com (10.141.234.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5; Mon, 26 Sep 2016 10:13:06 +0000
Message-ID: <57E8F4A2.6060404@rtsoft.de>
Date: Mon, 26 Sep 2016 13:12:50 +0300
From: Roman Alyautdin <roman.alyautdin@rtsoft.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1474649164-7513-1-git-send-email-roman.alyautdin@rtsoft.de>
	<20160926063903.GC2631@jama>
In-Reply-To: <20160926063903.GC2631@jama>
X-Originating-IP: [213.79.90.226]
X-ClientProxiedBy: HE1PR0801CA0004.eurprd08.prod.outlook.com (10.167.184.14)
	To DB4PR06MB362.eurprd06.prod.outlook.com (10.141.234.143)
X-MS-Office365-Filtering-Correlation-Id: b933ca10-a107-401e-1e28-08d3e5f5b616
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB362;
	2:YJ8WvnO/F9Aymq/e1rYvsIvpYNW/hMMFlB1D0i9m23ZlCeflHkrdBjIfF3MLuJzdOF7wpl0JUSFNwrB6vP1OeWnVzhqt9Wo1K6+5BUZLg3rJMdagdthfUxc4cqFnPPPryuEYOfgDW7WD16JBd+0HOT4si9mWZNJeHSlerFcF9woOqxdOHG5mcIaYh5VSUuo5;
	3:mBgFh/W43dzVInqYbOM57jtgybzK/L8HWJUVYOyiXo3dvAYsZaVdMyVrDr4rVeU0epMxiteHlcPpBT70C3ZEO4ME0bPIDZr2Rw5azNv7VoBPGdLRnb5Y6u5RvmBe/vod;
	25:4Uu2gcXwzUvx7c6rM8loClt8mAnMuuEPap8i2ra/XQN73N5QGc/4EqiqItB+kqMHB7LwAoU6lMpPemEbOCgar95TJypEVBigwVSQCsD5mxVT8fX+NuywIbWr9P+ngljAfjN5fFBAC3w2m2TRQvBT3LKmixQrSlBzgyvPt5kgzardhFEpJKQ/poHszLVkFQGkS4BSgv2If8+UDwrG43sboU2O5fmtt9Fb9yYTbiRTF4U4r4xUwaqJjgUiwRP4E1HUaVA3TJSAV29KRSJayW53Py7fFMvX1oCDi6icPN8KwQ0E7qA4gHoxSAEyjTtaO6+cfqNa4T1CsVEgArnsKXAs4bG+D9jvbRVTsAjlZ8HB+ZLtHPLDuC0ok+sLla0L24YXk4giKUxv/wG8ZkqXZXFYr2tgv/2PK1REMAAY9ijlGYk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR06MB362;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB362;
	31:ICcSYzSkd++fly/WrcUklro+y7YygbL+eyDTHoDgANmQ+9F8mc6dI/6Kiw/QCJhs5bKO7eOsavaf4+l6PIluc7hnQL26g0Kx4jvIKqir52cGDXp4F4/3QeL0t+JS6fSO8CAv/3NsGxNyLAfJ4IaIsQl2X78PGyjjPpnvNqew+YJCtFlZZrWp8KK/QQG7Jfxntt19G90Wt2vGDZMK2QHdNAE6je+9KNSDrxF+/BOl1wI=;
	20:Lw1u4OZqfVfMLcNDtaayGL9O0K41BuaaJRQsQ0F9GvWxExpEKyNdkN+2z2Vw+FwsViA56fZFjo27Zi0XMg/hKy1fEkJSLEurqgMlqhgVGMlVlWEJEO/dVCbIBOfEa4jn3nzwojCIUHqYHDT6Oey/vInqIq/au56OfD85e46F9Pfy21ZfZKPZMEQZNV26PyI1IJdCd5usdqs7leiStBCi9Q5pQwxE/xzH8dZZ4Zu6gktvXwobHb0LmNz06+B2TL1BM/ii+2EV5JBsOegiwAdCUUS9GjPaz7h126yYt8mY2pFOtUvgYMxFqEdTsQLuLQPtHJ8UCvGf4yovj/waOrWxaQ==
X-Microsoft-Antispam-PRVS: <DB4PR06MB3624DBF70D0C653043AA90DFBCD0@DB4PR06MB362.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6042046)(6043046);
	SRVR:DB4PR06MB362; BCL:0; PCL:0; RULEID:; SRVR:DB4PR06MB362; 
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB362;
	4:DFnCO+kMe+usgujIV7CACI+v1bG4S1ZoAxVAB4U5LtJtqRQKG/V0wCZTkjtWvjzD/4rYb3YCQ6aDnckInre+C1C2Tx1ewMP+4Im6Y5eBrHlRGN6DpoP5G7alK5IzVONBDTLOgI3afoFGa4vnjaftx/FwXg4lFAM4dCXHCpPijee3Ewhn9C0ta8fHBrpPbIXP54IQYNxwusTg/el+580TOCuwuCTGpcEKjMuJV3MM6vgrQSCRLsCrOb9QrSWGsyJS/WXNN6PXas3ULUXnSBr2nVnVSizrw3oEWPFip+rhSf94Uko+o2HACXGsOlRmfszO7kWbOICF0COcnuwnV9XRizl+Qh/8D64yeOglB8EkKjAFagzIDVd1/bCWD0KjtqifDnZv0L3nzDr2e02Wvx3oOHLV1NQqNP9F/os8yD4aAEyOcRiolAW18dlpNM7/npRAZ5ddHt85OPo6x+vuTtlBc2CqxN58jBg/sS2U3NWFFxW17IPhZ6QfMmmExoRTfF1E
X-Forefront-PRVS: 00770C4423
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(7916002)(199003)(24454002)(189002)(4326007)(2950100002)(2906002)(84326002)(19617315012)(33656002)(59896002)(6916009)(68736007)(92566002)(512934002)(117156001)(65806001)(19580395003)(19580405001)(80316001)(83506001)(66066001)(101416001)(75402003)(77096005)(42186005)(15975445007)(5660300001)(65956001)(74482002)(64126003)(1720100001)(50986999)(106356001)(4001350100001)(36756003)(105586002)(7906003)(110136003)(54356999)(8676002)(81166006)(76176999)(65816999)(87266999)(81156014)(270700001)(97736004)(575784001)(189998001)(2351001)(86362001)(3846002)(6116002)(586003)(7846002)(7736002)(142923001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB4PR06MB362; H:[192.168.11.42];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: rtsoft.de does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR06MB362;
	23:78L+JH+/hGP1rop4gF8Qq+Hr3ZEc5UykrUEL/3m4fl?=
	=?us-ascii?Q?9AYuYcBA5NfPTEaLlgPh34h2v3x2EGnqXnwcgzzdNjkLRl3JLaz4UJF1bg0E?=
	=?us-ascii?Q?rD1ON6OnOe6M09UmF5CpCMnktblMFSH69FE7pzhgbaoTbOoTSs9kjyu6a7V7?=
	=?us-ascii?Q?BpLHC0RghbrKujjC+pVV3Ck4hgz2dLz0EOxlLlQOE/Q4cBNK4vc51dswhd3g?=
	=?us-ascii?Q?3F0b1pjszrv4JEl0dTPg5HQpmbwne4GFQcE5JADRCIuLu4ldqGrAlWBVr6+w?=
	=?us-ascii?Q?NOK+9FJX82HF9u1h8Y3yC/JrQJZACzpArJatl/WgKMCV3kygaQSWu7vXegcL?=
	=?us-ascii?Q?U8/cwtgFI4TBoTVH1XS4r6/7ssKu0WJf1xk9vShnhPJAoqtg4/nzWjW/4Jvo?=
	=?us-ascii?Q?/XAICdPk7Lrg2tNEJdJ+f+mIbZ0At0CNf5KPBtWHgFiGpmm4mKeCndmV+sZr?=
	=?us-ascii?Q?2kR2ufv8bXc4CjsnWUgL1GmlAN7ze87hwbDwAsu+TMZPVApcj5NHnwLgbGQX?=
	=?us-ascii?Q?G7h7TzHzf4AgDc2zRzcHcCpXYUANVTjbI7TuHOSZoVgq12RPLQJjboa7Gsae?=
	=?us-ascii?Q?fOgOsbOlwm8qfxfH7rRNWbKIEqC9Z6PXldIox7aLsgxHdCox0UZQVnqnRZpF?=
	=?us-ascii?Q?62tSV8VF+au2m6LTcbAXm6qTh0adG8W6ieDHSyFguOeRyH8cgl62EPiEKKx+?=
	=?us-ascii?Q?rqiY0J7jLFo9aq2N2Zyf0Fb6bQTBaMnjDsmhW2rCIIQPFEcZbnMwgoJcVXT2?=
	=?us-ascii?Q?KcrXh38IwMKBQwZYO/roEU+XctaaasnkCcxWzCdhZxRN99YXcAAQJYwrcdBf?=
	=?us-ascii?Q?AMIhcDKSIKs8013Bh3lWN1v8bLJIpmYFAdnj6zL/eYiaDjTFTJ264ZQWCytr?=
	=?us-ascii?Q?F5shmG1KmPaE1sVPnNaL3gYv8Z180aZK45hg7sJSvgrKdlCz3q8OnATUPdle?=
	=?us-ascii?Q?TKK2lnQxTBaOWi5IuYLN1RUKR60SWjTqHfOOcWqvWb3rovnxY1/2d25QAweD?=
	=?us-ascii?Q?AWXK+ga8CSVjZIVjqPxus7127FDpvi9urmxto8oiprr+p+K5Fqn+/IurEWXq?=
	=?us-ascii?Q?jxp/1BJwv43Jckn2GkEYujWj1cAul0buVMpegwnNnDcbamv3NlHTQCzccZSN?=
	=?us-ascii?Q?Ne58gF37Xchn0TZ42k9acECf/JKcyOT3DJFclYDyrKWtMkqa4BcRT+xfA0OR?=
	=?us-ascii?Q?5ckByiaWSqAit+KuWgunKusRV9JeelXhMZhgJzTXEKIc5muQC27+XynxU7cq?=
	=?us-ascii?Q?PXpTA0fiDQTHJm2UxUUBMZA1cid8f4SJgx8nAwcvLnsqRVeumCnlwtEHwMYR?=
	=?us-ascii?Q?KfYRvf+Tlbwioq01P/R43nXHC0RudHRxWM2ylXFS04ADXVbQs/P4ltq/2/GA?=
	=?us-ascii?Q?AgE/8N0sshn8p2Jsgkyj1v0syiFeJeAK8czufQ0cumQVn75IE/iGcOjGhHMG?=
	=?us-ascii?Q?kKkaALLL5g1zXWIg3/akdqeF4mG2SacbRtOQ23YBVBgwfU2Saq?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR06MB362;
	6:tFwZ8fXmoIq7PeO51dQDZMKHsn8S+gKzXInjq6K+bQHLG73yR19MI8BZ/cQ/d+QeAkoTSQS8tyQtKrCSDGXfPI8x+4588MSatVbWziqH4jRjRd56+hDr2fiUfSX4ppr8ZZKLzDy4JYFHwmdThd28ApDrbe1zX+i9sXmIs0vvQ58TsVVEAEiErt6lasCF4YIi947T7X1oZiQjxk/Jcbs8RSUy4kIeUTBmfXu4xPfPtOxrPg8e6t+teW/WQJF6rIEQ6Ztd1MPPZkfX4B35WI0pbwvkrRS0ORs33HLqt1dhorUTdHOy68E/x8+OINuE0JcB;
	5:CxjpgvN7vYyzhkfDgErJUFrHwuT3Oy5JLkqg8weBxASQcq2RKirOC47QqWIm6ERyAMBmW4RDe3wV4PPtn1xyOJAzqCAyDlWlRCqdFKOYt6EOes0F5xZc8ep9e3r3u2Jz7F8KwlbOIwomnCaq3D8/+w==;
	24:AFArQE4W+pcSZ/p6Ghn2SY7Vu4x3ZPLwoxawegkYls7kH/5y9OPy6qWQsfLJC6MNCioIBP1A4zrvdbN5pRK8anlJcCIhpSIn7sTWgLa4BvA=;
	7:qUj6Mqt8CuQD3MEm11TlTzffFNVcntlSZl3nloxcnoMqjBjcsan/NwOy1+9LRKsuGB9DgcvvYQd8oXoXjbripChb1ytfrQQy7EAIOADGrjFyfZOLUQgtvhhnJ50xWCP9pGW3MvJsxuTtOwVMJYSnGjSb8C1TdILsZ/kI6AaX2XHS70BIWUmd37SWwM2+HCwGQKlpRWHWJOqT+yJNdNsjksvDpJwZF4M3d9y2IFYIpbrG1SOcdMVYTRAkow+zbQOuKTYnOfn7O4Km7O140J2E+59Pk+Cv7Xe9ATF7a5K3izsOTHGP6WIMubBLD2vpsd6l
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: rtsoft.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2016 10:13:06.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR06MB362
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
X-List-Received-Date: Tue, 27 Sep 2016 06:51:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/16 09:39, Martin Jansa wrote:
> On Fri, Sep 23, 2016 at 07:46:04PM +0300, Roman Alyautdin wrote:
>> The patch proposes to separate general part of mbedtls recipe into .inc
>> and introduces mbedtls_1.3.10.bb that requires mbedtls.inc. This will
>> help to add another versions without duplication of general stuff
>>
>> Signed-off-by: Roman Alyautdin <roman.alyautdin@rtsoft.de>
> I don't know why it was sent 4 times, but there is upgrade to
> 1.3.17 already in master-next:
>
> OE @ ~/meta-openembedded $ git log --pretty=fuller meta-networking/recipes-connectivity/mbedtls/
> commit c5af6e71907714821c0edfb23085f0a700b1118d
> Author:     Wenzong Fan <wenzong.fan@windriver.com>
> AuthorDate: Wed Sep 14 01:49:13 2016 -0400
> Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> CommitDate: Mon Sep 26 08:29:34 2016 +0200
>
>      mbedtls: upgrade to 1.3.17
>
> Which version do you need that it requires adding .inc instead of adding such version to meta-networking?
>
>> ---
>>   .../recipes-connectivity/mbedtls/mbedtls.inc       |   35 ++++++++++++++++++++
>>   .../recipes-connectivity/mbedtls/mbedtls_1.3.10.bb |   35 +-------------------
>>   2 files changed, 36 insertions(+), 34 deletions(-)
>>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
>>
>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
>> new file mode 100644
>> index 0000000..8bb6855
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
>> @@ -0,0 +1,35 @@
>> +SUMMARY = "Lightweight crypto and SSL/TLS library"
>> +DESCRIPTION = "mbedtls is a lean open source crypto library          \
>> +for providing SSL and TLS support in your programs. It offers        \
>> +an intuitive API and documented header files, so you can actually    \
>> +understand what the code does. It features:                          \
>> +                                                                     \
>> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>> +   Camellia and XTEA                                                 \
>> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>> +   ECDSA and ECDH                                                    \
>> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>> + - Abstraction layers for ciphers, hashes, public key operations,    \
>> +   platform abstraction and threading                                \
>> +"
>> +
>> +HOMEPAGE = "https://polarssl.org"
>> +BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
>> +
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>> +
>> +SECTION = "libdevel"
>> +
>> +SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
>> +
>> +
>> +DEPENDS = "openssl"
>> +RDEPENDS_${PN} += "libcrypto"
>> +PROVIDES += "polarssl"
>> +RPROVIDES_${PN} = "polarssl"
>> +EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
>> +
>> +inherit cmake
>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
>> index d5c7afe..3f1c1fe 100644
>> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
>> @@ -1,37 +1,4 @@
>> -SUMMARY = "Lightweight crypto and SSL/TLS library"
>> -DESCRIPTION = "mbedtls is a lean open source crypto library          \
>> -for providing SSL and TLS support in your programs. It offers        \
>> -an intuitive API and documented header files, so you can actually    \
>> -understand what the code does. It features:                          \
>> -                                                                     \
>> - - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>> -   Camellia and XTEA                                                 \
>> - - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>> - - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>> - - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>> -   ECDSA and ECDH                                                    \
>> - - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>> - - Abstraction layers for ciphers, hashes, public key operations,    \
>> -   platform abstraction and threading                                \
>> -"
>> -
>> -HOMEPAGE = "https://polarssl.org"
>> -BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
>> -
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>> -
>> -SECTION = "libdevel"
>> -
>> -SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
>> +require mbedtls.inc
>>   
>>   SRC_URI[md5sum] = "19ebbc96feceb430ad958dfe89cb633f"
>>   SRC_URI[sha256sum] = "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8995094aa6adb407e"
>> -
>> -DEPENDS = "openssl"
>> -RDEPENDS_${PN} += "libcrypto"
>> -PROVIDES += "polarssl"
>> -RPROVIDES_${PN} = "polarssl"
>> -EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
>> -
>> -inherit cmake
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
Sorry for submitting 4 times - email misconfiguration.

There is a  need of mbed TLS 2.3.0, the reason of not updating 1.3.17 is
that many project will prefer to not rely on "the latest and the 
greatest", keep
staying on maintained 1.3.*

So this will help to have a choice.

Secondly, unlike 1.3.17,  2.3.0 CMakeLists.txt depends on perl package 
presence.
And this might be a significant thing for somebody.

My plan is if the approach is accepted to create mbedtls_2.3.0.bb with 
handling of this
new perl requirement

