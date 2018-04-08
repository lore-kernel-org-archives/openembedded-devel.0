Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B444B744B3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 15:46:52 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id j73so6620631qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 08:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4yBSLVycfYT5mRMr468PunwMlMF3yZHLl6MhAVI69V8=;
	b=T+3Ey73EPG7n+WlzF46NJKGU+E4DjxOw8J843o+jxOwo4hkXNT7b5CJVF6773OJbCW
	B48q+Qubpa7aXHucCGjjoPasEpxWgSJWKtKC4j3vcXeNxPnpNUUcYJ3W0i5tFOX2afnh
	E+/PpTe1mftrSZhLjHKCOZKlVbbxP3YhQLVa2QumLHt87vewFzSLaFv0LAGhOw5YGAcl
	Eiv86aoslncPThujp7rR/lAYhd3OAOpkHFP9K61Djg6j81Li92AEDKPR3bL3NZUi3TCi
	rZ4CSXtleJ5H7w+dtTgbFGcOdEvCDvMhzMBJaebKqLfNf8AHmYVUuCz3fUHLXNTm5i/m
	6SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=4yBSLVycfYT5mRMr468PunwMlMF3yZHLl6MhAVI69V8=;
	b=fEgACrM/BIA2Ys6bnWX23dCGyoUMYiWddjcQRapA+PaNECs2CUVb5ptBLFBeEFy3Qu
	EHvcnRl1/KC15gzyr9/8T2/yqIEdEPJdA3M5gmTzvBKQrl8p91b8W2FVgNlACGiuzgef
	qCoqgrAoXbaPRBqxR1Qga2K0iA9R5PosFVDakq1DScQ78VMz4xkpfyoyRrvZHMNtNSPh
	r0UKS5/4fCs1lg3QUGWy4zyRilNNS8Iw0lF6VFc2WZeSjgNJ2+bLS4O74jgPySECtVvE
	+zPJKEZxajzbwozkZ0rvkShhuVeHmBrVtv8zvFZ8S2vFLuR3aTFUJ7dZVHANCEvP/WZ3
	JJYA==
X-Gm-Message-State: AElRT7HC8e2GkY3o5OzNGNWoxn9c7H10/KfFNVKddlyLAwmwFiL97V76
	HSdtl/GpMzlLK4PfEg1+lTf6uw==
X-Google-Smtp-Source: AIpwx49SvXA9mFgShpqy9QiemdoMhCNVG1jgOD7+PyFkK6Y4ODM+Eahrll55jAN8OUtIuEEIbnZgGg==
X-Received: by 10.55.217.145 with SMTP id q17mr47310222qkl.302.1523202413097; 
	Sun, 08 Apr 2018 08:46:53 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	n67sm3750790qkn.21.2018.04.08.08.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Apr 2018 08:46:52 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
	<1523170729-26321-25-git-send-email-akuster808@gmail.com>
	<b6171aed-e4eb-a7e5-a370-913f38217f19@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <cf99d40e-6d18-8bde-2e50-44bc8bc9673f@gmail.com>
Date: Sun, 8 Apr 2018 08:46:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <b6171aed-e4eb-a7e5-a370-913f38217f19@intel.com>
Subject: Re: [meta-oe][PATCH 25/37] mongodb: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 15:46:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/08/2018 01:03 AM, Anuj Mittal wrote:
> On 04/08/2018 02:58 PM, Armin Kuster wrote:
>
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
>> index e517d53..ad9ff5a 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
>> @@ -18,22 +18,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   src/mongo/util/net/miniwebserver.cpp     | 1 +
>>   4 files changed, 5 insertions(+)
>>  
>> -diff --git a/src/mongo/db/dbwebserver.cpp b/src/mongo/db/dbwebserver.cpp
>> -index b202e0500b..0255613524 100644
>> ---- a/src/mongo/db/dbwebserver.cpp
>> -+++ b/src/mongo/db/dbwebserver.cpp
>> -@@ -67,6 +67,7 @@ namespace mongo {
>> - using std::map;
>> +Index: git/src/mongo/db/dbwebserver.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/db/dbwebserver.cpp
>> ++++ git/src/mongo/db/dbwebserver.cpp
>> +@@ -68,6 +68,7 @@ using std::map;
>> + using std::string;
>>   using std::stringstream;
>>   using std::vector;
>>  +using std::string;
>>   
>>   using namespace html;
>>   
>> -diff --git a/src/mongo/db/matcher/expression_leaf.cpp b/src/mongo/db/matcher/expression_leaf.cpp
>> -index d562bff141..4d931985e2 100644
>> ---- a/src/mongo/db/matcher/expression_leaf.cpp
>> -+++ b/src/mongo/db/matcher/expression_leaf.cpp
>> +Index: git/src/mongo/db/matcher/expression_leaf.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/db/matcher/expression_leaf.cpp
>> ++++ git/src/mongo/db/matcher/expression_leaf.cpp
>>  @@ -44,6 +44,8 @@
>>   #include "mongo/stdx/memory.h"
>>   #include "mongo/util/mongoutils/str.h"
>> @@ -43,10 +43,10 @@ index d562bff141..4d931985e2 100644
>>   namespace mongo {
>>   
>>   Status LeafMatchExpression::setPath(StringData path) {
>> -diff --git a/src/mongo/db/repl/master_slave.cpp b/src/mongo/db/repl/master_slave.cpp
>> -index 05faad1259..ea25d7151b 100644
>> ---- a/src/mongo/db/repl/master_slave.cpp
>> -+++ b/src/mongo/db/repl/master_slave.cpp
>> +Index: git/src/mongo/db/repl/master_slave.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/db/repl/master_slave.cpp
>> ++++ git/src/mongo/db/repl/master_slave.cpp
>>  @@ -78,6 +78,7 @@ using std::endl;
>>   using std::max;
>>   using std::min;
>> @@ -55,18 +55,15 @@ index 05faad1259..ea25d7151b 100644
>>   using std::stringstream;
>>   using std::unique_ptr;
>>   using std::vector;
>> -diff --git a/src/mongo/util/net/miniwebserver.cpp b/src/mongo/util/net/miniwebserver.cpp
>> -index 5f4165d42f..239720c349 100644
>> ---- a/src/mongo/util/net/miniwebserver.cpp
>> -+++ b/src/mongo/util/net/miniwebserver.cpp
>> -@@ -46,6 +46,7 @@ namespace mongo {
>> - 
>> +Index: git/src/mongo/util/net/miniwebserver.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/util/net/miniwebserver.cpp
>> ++++ git/src/mongo/util/net/miniwebserver.cpp
>> +@@ -47,6 +47,7 @@ namespace mongo {
>>   using std::shared_ptr;
>> + using std::string;
>>   using std::stringstream;
>>  +using std::string;
>>   using std::vector;
> Looks like this has been fixed upstream and this patch should be removed
> instead.
Thanks for the feed back. v2 shortly.

- armin
>
> Thanks,
> Anuj
>
>>   
>>   MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
>> --- 
>> -2.13.3
>> -
>>


