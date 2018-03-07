Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF68600B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:00:43 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y26so1236969pgv.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=gC0pGAhe4O5QeMNymft1rpej1lbatDxoNWxoFXrxD6I=;
	b=hetQTIY/CLisdDRFAbL3xK3PqKMfMVQN/k+Yf45Q/3OdwfbW1laxJlX/wjQ1N3m4p+
	c6P+VkHcNCuoCDcLuvDq9c/wrpWp9pwiagH2fpVxkEzZ38a1Et8VuTP/Jsa0qjDLZPSu
	mp7bxdVcVnUmQA0jXW9bYIa4S2sHxR1CbrEyEayCIs+4H3V9w30LUeFBUFK5OPbDmBNK
	cq5Dtmsi5ljqX/LrRAU2ewF3DutS4EetCUNLP9xcOoANEymOdPdaGlcMEOIoHNZMyYmj
	fr2RmPSL/8ovi15bHBp+SKCe63GMnjQKEh4RuBcIARNq+Wg5oXTW0VK6Z5ORclHHnSHk
	X+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gC0pGAhe4O5QeMNymft1rpej1lbatDxoNWxoFXrxD6I=;
	b=eC1wwP8wnWPrExWSDHvvx25s+zMdyd18po57H226JUpQ0VJd2ZuTntXyRu7dIe6Na3
	uDHyDrr2XlkXGJuBqzLrtZaBR++nf8pl2/p/RyrRFeeyxzsSI+9Kes5cPQ2xtHIyIYXr
	KJb3yk866tO4BHGv4/NMb3aNibcCaDVQa6/6Avfux1LaACVlq07StV4TiXxwxRRh+vLv
	v20TBmhQqpQhOJMVloPKAyxk8V9wZxC+8PHNO4ykEEpNNTKDR5NY55ZjmLxDb6KUv4ND
	sIMLS7ZZ1EXfhWB/fBba6iJ56VLKSKGwmNn7UxlAX1FyXOmUtcDmcLi5RNqMh1X6F1nD
	7tLw==
X-Gm-Message-State: APf1xPAKllOzKP/d0Hxha3ttea4Cm6M6cDjeDMkGEWNLQjUXFTnibYxI
	rE7kFblvs6m4Oa0wrrq3503v8Q==
X-Google-Smtp-Source: AG47ELutZFihyNuXWYtI+cKNdmrvhuA6mEUTVOj7NEnnqjKyz91FmlxJ2HLOkZ0EB8o3En342qnMjg==
X-Received: by 10.101.65.5 with SMTP id w5mr18955392pgp.214.1520449244420;
	Wed, 07 Mar 2018 11:00:44 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:6d76:b853:98d2:431c?
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	q66sm36364785pfi.95.2018.03.07.11.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 11:00:43 -0800 (PST)
To: "Bach, Pascal" <pascal.bach@siemens.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
	<1519594406-24490-32-git-send-email-akuster808@gmail.com>
	<355BE46A91031048906B695426A8D8E61733E141@DEFTHW99EH4MSX.ww902.siemens.net>
From: akuster808 <akuster808@gmail.com>
Message-ID: <4e31641e-29b1-b4a3-e0ec-4dff8fc5ad5d@gmail.com>
Date: Wed, 7 Mar 2018 11:00:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <355BE46A91031048906B695426A8D8E61733E141@DEFTHW99EH4MSX.ww902.siemens.net>
Subject: Re: [meta-oe][PATCH 32/36] rocksdb: move to recipes-bsp
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
X-List-Received-Date: Wed, 07 Mar 2018 19:00:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/05/2018 04:44 AM, Bach, Pascal wrote:
> Hi Armin
>
> Why was this moved to recipes-bsp? I don't see the relation.
Hmm, don't recall how I came to that conclusion. recipes-dbs better?
> The same question is why leveldb was moved to recipes-security?
same response as above.
>
> What did I miss?
you didn't. Thanks for query.

- armin
>
> Pascal
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Armin Kuster
>> Sent: Sonntag, 25. Februar 2018 22:33
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH 32/36] rocksdb: move to recipes-bsp
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-oe/{recipes-extended => recipes-bsp}/rocksdb/rocksdb_git.bb | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/{recipes-
>> extended => recipes-bsp}/rocksdb/rocksdb_git.bb (100%)
>>
>> diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-
>> oe/recipes-bsp/rocksdb/rocksdb_git.bb
>> similarity index 100%
>> rename from meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
>> rename to meta-oe/recipes-bsp/rocksdb/rocksdb_git.bb
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


