Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA587F311
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 21:52:46 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id m9so7753097pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0WeQRvvRHvUgBaGOYPkn27fSSwMN/yDpTQZvRT/iisk=;
	b=dDQZ42dikVcL1W7rdjBzaAb+6P8RHtcTiIBi3ZA4iMcY3qr/umwFxwBt9lquWW7mmR
	pFzXS+PsiJzAxqwMHHzaHCFuVdAcJVGpT8zCLT9dzffBKpPRwC8kw4zOL0jQ5UxyxLjt
	BOUKzB+exfjxKE4BLjLoEGyMNdeWc7TJFSBfP+GIBEE/zKJWqHgn0sAxDE1GFx+B+KLR
	AOAdpBJMDb38C6KSw6prl9j0cf4Ly0ifdt+TzKPlVQblyuVVU263XPtPsubn0jHujOvE
	4lg9HKbV+ddZLUxjjz7a/CJTnxZ0dlrHbUEhynOxYqz8+oGg22sOsnJO2r+MzmK9XQLm
	rTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0WeQRvvRHvUgBaGOYPkn27fSSwMN/yDpTQZvRT/iisk=;
	b=dbvNvJ1P8yj8iMQV08+bU+0efIIzquUGJZ8VnF1rfAhF5PDrGaur374Yx9KKsOhlzk
	OzL+jz+aD59t+pgujMc2rnMAKSVTiww2u0rm3R5Spn+i2OVIDWCCSexesKqnAKBNtdeB
	Drn/WILRqpBR56ZLl6HKVeSIVEzyS5hfSxFtY+W1qCZ7pYGLV5+aVChf00vVRMrlrb9a
	VgS60kR0tO28/chssSgplWXLM3HKkqtdTHD9BucfijaSW4o2V6qgL2AXU4IbqtRu2D1S
	rGG0dZyLjvpWhGhshTAfL9uKHHed/dEwrLMTiHNknG9DAVpCISw8aVgjWgCcvgEwmaZh
	Ak7Q==
X-Gm-Message-State: APjAAAXsqbArfqnvyBnE8ckGFfvfHCfFkVO7z2avDHChrYMge9fSd+lN
	RiJTIdBniYekTBIgTvdN7D0=
X-Google-Smtp-Source: APXvYqwYfWUBMbxWv6SmsU2Kpl1qK/jgjfRTIRlVrmvcJyW98xHLqsfu3JUjMUQALLIsX7jrUjvj3A==
X-Received: by 2002:a17:902:20ec:: with SMTP id
	v41mr11474768plg.117.1566683567403; 
	Sat, 24 Aug 2019 14:52:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d435:11b7:8108:4569?
	([2601:202:4180:c33:d435:11b7:8108:4569])
	by smtp.gmail.com with ESMTPSA id e6sm7513758pfl.37.2019.08.24.14.52.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Aug 2019 14:52:46 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Kang Kai <Kai.Kang@windriver.com>
References: <20190821123824.17831-1-bunk@stusta.de>
	<53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
	<CAMKF1srz7wYH8AmV_38Nqb12jLDJN_mbd8PpfkGK-LY-5nE-oQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <71e003a3-e1ee-294d-da16-12a45d649350@gmail.com>
Date: Sat, 24 Aug 2019 14:52:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srz7wYH8AmV_38Nqb12jLDJN_mbd8PpfkGK-LY-5nE-oQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Sat, 24 Aug 2019 21:52:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/24/19 10:37 AM, Khem Raj wrote:
> On Fri, Aug 23, 2019 at 1:14 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/8/21 下午8:38, Adrian Bunk wrote:
>>> Remove a generated file with always changing hash from LIC_FILES_CHKSUM.
>> Why not just upgrade to version 1.20.0 which is the latest major release?
>>
> this still is useful, if its a bugfix only release, as it could be
> considered for backport to release branaches.
Warrior is @ 1.16 so I think not.
>
>> Regards,
>> Kai
>>
>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>>> ---
>>>   .../{networkmanager_1.18.0.bb => networkmanager_1.18.2.bb}   | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>   rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.0.bb => networkmanager_1.18.2.bb} (95%)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
>>> similarity index 95%
>>> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
>>> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
>>> index 9ce2d961d..b760a40c3 100644
>>> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
>>> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
>>> @@ -5,7 +5,6 @@ SECTION = "net/misc"
>>>   LICENSE = "GPLv2+"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
>>>                       file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
>>> -                    file://docs/api/html/license.html;md5=233931303ef80eded167add1f60a50c1 \
>>>   "
>>>
>>>   DEPENDS = " \
>>> @@ -31,8 +30,8 @@ SRC_URI_append_libc-musl = " \
>>>       file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
>>>       file://musl/0002-Fix-build-with-musl.patch \
>>>   "
>>> -SRC_URI[md5sum] = "c8c27116a8083bab5d5fcca0d03e988a"
>>> -SRC_URI[sha256sum] = "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6"
>>> +SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
>>> +SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
>>>
>>>   UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
>>>   UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
>>
>> --
>> Kai Kang
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


