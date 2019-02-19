Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61F1F7C8D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 15:13:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q206so10280358pgq.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=apFL2EZKDUXWbyJP3pnQS77GRMCCt8fRg0WVe8kKdx8=;
	b=PNyR+X2GWY9+rQ/NXWJ0JW6qrnN5fO6eYXAPab0eFttel1MgtbTK+iWrnqmhPLWkMD
	y7T9pGDIP9HYuAwefxHSNCvq4sQQ9+BNkASyILFJ+B4GX1+RW7g1Uj13YKpn10gIjs7s
	mFQ5byF/MGRuDX05KDZuapv8C60sWdALaUTCp4UV/tWK4jiVaDr44II0A7mav5PvRtS8
	a55V85+fNOFJt+/3+VLbBBoreWMl3aTDjsXF2qrxn+efOfy5qyS48MgSpLc+9w8929FK
	cOVKI6HVlQrlqYwipPFrYKSP7xcEntNJRgBZnPVxRA2QTTJX2/qMYPOtsEdsqgin2knA
	SwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=apFL2EZKDUXWbyJP3pnQS77GRMCCt8fRg0WVe8kKdx8=;
	b=X15PgRRuaeim8U17ra1R6S6oMVco5PRFRwZYGnCKE8AYV+9TWhCdxXCUDs8bAMfMUy
	uwlFk1JkgDHIWt14Rw46+Eml0Hh9OThrf6j9K4ITM6ho4Jd4UM3HXDpaErk2R4pBkiB+
	zlpBXVS1sBV+eW4bHCpX7rf2A3qsKxRVKCUrL2+wjWymAPZpotD3vhSInGPUcIIGYsuA
	E5NYhgLIEUVbAb8l6SqyCjZEbHvYnRvs7jxWuNHzrvkak2zIV2fERk8+sVURkfXRp/wU
	SUzqQSEDHmALk6wb/l2/lGW+FA5fYITIXsWll3Hto/EK25xQ1mmSyg+hWMJKUTZG5Gbp
	dHcA==
X-Gm-Message-State: AHQUAuYceO3oKzB7CpxoKM/+99POV6T3X6hOLDck92srPPkYHm3fH1JN
	dor9F3I/WtqJ3UXgsPsFVLs=
X-Google-Smtp-Source: AHgI3IYXk89w+nxWuYoM15YpmxadVL1CZtifl8neXKUh5uzdeH/VVsaye6ne2992OM7jWg5OXv8VPw==
X-Received: by 2002:a62:3811:: with SMTP id f17mr1787823pfa.206.1550589229113; 
	Tue, 19 Feb 2019 07:13:49 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:3d85:1fb6:f0d7:cd99?
	([2601:202:4180:c33:3d85:1fb6:f0d7:cd99])
	by smtp.gmail.com with ESMTPSA id
	e63sm30775028pfc.47.2019.02.19.07.13.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 07:13:48 -0800 (PST)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20190219135006.20859-1-nicolas.dechesne@linaro.org>
	<CAP71WjwybzzDJ=wbZN-RitHmDC5DNEv4b7L_WYp_t8FHnWULfg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9eb3ac67-056f-7c47-f474-0e5023fb3bd1@gmail.com>
Date: Tue, 19 Feb 2019 07:13:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjwybzzDJ=wbZN-RitHmDC5DNEv4b7L_WYp_t8FHnWULfg@mail.gmail.com>
Subject: Re: [meta-oe][thud][PATCH] packagegroup-meta-oe: drop ptest packages that do not exist
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
X-List-Received-Date: Tue, 19 Feb 2019 15:13:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/19/19 6:28 AM, Nicolas Dechesne wrote:
> On Tue, Feb 19, 2019 at 2:50 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit bbde0a3d3012da1d6be824959b0ad0a930573650)
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> ---
>>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ----
>>  1 file changed, 4 deletions(-)
> please ignore for now. I need to backport more than this one,
> actually. i will send a series instead.

are they in stable/thud-next ?

https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/thud-next
>
>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> index 08b4bbfc4..2a23a6170 100644
>> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> @@ -234,19 +234,15 @@ RDEPENDS_packagegroup-meta-oe-test ="\
>>
>>  RDEPENDS_packagegroup-meta-oe-ptest = "\
>>      zeromq-ptest \
>> -    libxml-ptest \
>> -    soci-ptest \
>>      leveldb-ptest \
>>      psqlodbc-ptest \
>>      lua-ptest \
>>      protobuf-ptest \
>> -    libdbi-ptest \
>>      rsyslog-ptest \
>>      oprofile-ptest \
>>      libteam-ptest \
>>      uthash-ptest \
>>      mcelog-ptest \
>> -    openldap-ptest \
>>      libee-ptest \
>>      numactl-ptest \
>>      poco-ptest \
>> --
>> 2.20.1
>>


