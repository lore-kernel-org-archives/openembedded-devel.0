Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B2E0E7F95B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 21:50:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so4010657wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/MvHlxRL1cDRNd67KfA09CdWujFYCqXrzFq9iDy5JPA=;
	b=PybHwRTAdD6jAj/cdknzblYhFGrkjbqIGOlNsjD5DlcwQnZs2o8mK6H7bGhXQUqSAx
	ntJBizR0fLq5oYMziBrT0oq6qUJMoWL5YsSetnxY1rah3/pLro5OWyuppvjdRUduvLXa
	4r4gFGuvzPQ7XR9o1SM+PTlKj2oJibcsKV8AYnAq5qkj2X+hUyzLdhOZkjFMfdGyEvu4
	imRTVQSvKJDk72MGxRgZ0gsDNRL0KYi7VgIKT/XaVebJYkCbc0+AxutpuWsv4gpyqmuc
	n7tSzb6M+ZxuaOAL2TyxzzXcEzi6X4u7TCrv4nvwsMTA0LfsDb1Oizv7ZSZEErzCx2xi
	eMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/MvHlxRL1cDRNd67KfA09CdWujFYCqXrzFq9iDy5JPA=;
	b=pR2crjGqcgCVyaqQpSikJFmTFQjE7Qpv437AbyfYbjYXsHQ0223KxlBbTOA74s+Ru0
	jVE5792JcDkeVCw8bWroY7ZIF3TnpUaL30SYEqA1r6UJsSVkiknmlXJqZ17pBq1j69Dq
	Ar6BPpGp7oj2nWliKAxFYFPSm6UvPqeT7AvNYiUkN74WhcxpiR24YoszGgZ3BjIBfe7v
	dROvZ1jel0VVzARIQDPTA286BHYytjuJhwXJEnAjtwoTT+AThQE37tV/dFz01HxiGx6N
	vWKGKiP9PaKbkl3ZUMs8GwenTJV+uW2ZIa9BBmFDY13tnPDESt96btsF6H5uXsBhqBPr
	UXCw==
X-Gm-Message-State: APjAAAV4lwYyr+4isK4FYC8RUXRQEHf/o/dP10HIj4vLA7c6UmzqiUu/
	QWtKcv1VCFPk2hiyJrktMdn6nQ0U
X-Google-Smtp-Source: APXvYqzP06SkG4icL2Kuhp92Gb/DzG/QGfg3nVdLnjyroXftPixz/V9lzuAHYyvQdVDWUYpekcd6lg==
X-Received: by 2002:adf:e64f:: with SMTP id b15mr1831301wrn.372.1572472236857; 
	Wed, 30 Oct 2019 14:50:36 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id w13sm1572374wrm.8.2019.10.30.14.50.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2019 14:50:36 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1572422730-16094-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spBXxQX9=qOhuC-zCXvx5sdehTVE7fF+whjA59unBGEjA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f6f058e1-838c-8fa2-7121-62f136d1aaab@gmail.com>
Date: Wed, 30 Oct 2019 22:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spBXxQX9=qOhuC-zCXvx5sdehTVE7fF+whjA59unBGEjA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus][PATCH] packagegroup-meta-multimedia: Remove libsquish from rdeps
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
X-List-Received-Date: Wed, 30 Oct 2019 21:50:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/30/19 10:19 PM, Khem Raj wrote:
> Thanks Armin, this patch is already in zeus
oh, so that miss fire did go out. I thought I had the README updates
applied when I issued the send-email command.


>
> On Wed, Oct 30, 2019 at 9:05 AM Armin Kuster <akuster808@gmail.com> wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> libsquish builds a static library alone which is primarily used during
>> build only. There is no runtime component to it.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
>> index 365618d..cef45f9 100644
>> --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
>> +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
>> @@ -27,7 +27,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
>>      fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
>>      opusfile gerbera libdvdcss webrtc-audio-processing \
>>      rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
>> -    ncmpc libmpd libsquish dcadec libiec61883 \
>> +    ncmpc libmpd dcadec libiec61883 \
>>      ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
>>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
>>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
>> --
>> 2.7.4
>>


