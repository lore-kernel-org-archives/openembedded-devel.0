Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.14462.1594397906570898418
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 09:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZY19jmc+;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id m9so2756471pfh.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 09:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OifQ/toEvFcP7K85XwXz1po/B5hoYQPKX76mfrnbghw=;
        b=ZY19jmc+lCPz4BCSjf3chxZ6Gp82r4n5hRZmp8UguQDduKJC1S+7uadVw92ip16iAG
         ++toAMiXeS6fJXviamiPu76sk7nSv84aIBgq4KfnvZSS7BIdS7c3EEBdNzml7aOfhIhM
         nb98RhLDncViq8PwWVt4EEbwfsPd8e2N4DNzmq8RIxKxArwQMVelCaMcDVS/ND5cM82H
         LAaWkfJyI7UCxFNHVOORbwR/TQks2KIvI7MOe/52AKT0xcRddkcxzNM4SaowNCze0+PA
         /gvPIdc32WhMbqEfsq5DU7z7eZRJsqik6JP4UkjIQ6Ua9BuEp0I0NtLFzUtQu2CQAfO+
         K9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OifQ/toEvFcP7K85XwXz1po/B5hoYQPKX76mfrnbghw=;
        b=es3enYemtyfzuh+nDCNBMtDdav2IXnN9vR23rnmygQVjtjDAC2JQLT8N5tAFHLWmLK
         bDci9lKc4ScDHAivTf/f4ygB/slG4gh3NP6MC68Rkea0EYPL1vh3DcSqz/e2eTdXhUmL
         XqqNTqhTDUCtwSenoSJDWJ3Rb9ryiBUeocJ2yA+0ikM6Tr+2BS56gSZHu/TSEa+W0Gv/
         zUJwsa72eOHrKZFbnfDKgTqOdT0VOBN1U3phjvLQ58hVNsrfwrqK+XNPiRV5auZEbmxe
         9UuveJllqUa9A784z2v6KWBnZG/nblLYnlr2jDmkbg8bhnW7nj79jUEKRumMPVuvI96x
         AsHw==
X-Gm-Message-State: AOAM532mFsWwnTCnpP46BLgLfLgK36Y8R8ZXb+TMtsop+jxxevtG/wc6
	GP7MBiH5MJHS+NKZUT68AK0cBcDgyt0=
X-Google-Smtp-Source: ABdhPJyO31C4L9IT4L/yZHgSi6aRT45jUsmu8OIB7moVEQn7pKoSUi8TaNbRUddGiEPTQlGAYmzIrw==
X-Received: by 2002:a63:d806:: with SMTP id b6mr29409252pgh.403.1594397905587;
        Fri, 10 Jul 2020 09:18:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:2036:8379:4d57:501b? ([2601:646:9200:4e0:2036:8379:4d57:501b])
        by smtp.gmail.com with ESMTPSA id bg6sm6003135pjb.51.2020.07.10.09.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 09:18:25 -0700 (PDT)
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: akuster808 <akuster808@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1593561840.git.akuster808@gmail.com>
 <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
 <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
 <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
 <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com>
 <1110a82f-3ba0-66e7-ac39-276b7b5ee6d5@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <ab6083eb-e8b3-d427-ecd1-146cdd960f52@gmail.com>
Date: Fri, 10 Jul 2020 09:18:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1110a82f-3ba0-66e7-ac39-276b7b5ee6d5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/10/20 8:55 AM, akuster808 wrote:
> 
> 
> On 7/9/20 6:08 PM, Khem Raj wrote:
>>
>> On 7/9/20 9:48 AM, Martin Jansa wrote:
>>> I don't have a strong opinion about this one.
>>>
>>> It's easy enough to undo by downstream layers if they care about ABI.
>>>
>>> At LGE we do have some prebuilt binaries which use jsoncpp, so we do
>>> care, but haven't updated to dunfell yet and when we do get those
>>> prebuilt binaries to be rebuilt, we might as well use newer jsoncpp (and
>>> in that case might backport this upgrade anyway even if it gets reverted
>>> in dunfell).
>>>
>>> Maybe someone else will share an opinion on this as well.
>> I checked https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3
>>
>> and it does not mention ABI change there from 1.9.2 to 1.9.3
> that what lead me to believe it was worthy of backport.
>>
>> but then I see
>>
>> https://github.com/open-source-parsers/jsoncpp/commit/8b7ea09b8055df01866a5ce4142b12ed8f9f13eb
>>
>> I dont know if there are API changes which means it will need porting
>> effors for users or is it just a relinking that is needed.
> 
> Same conclusion I came to.  Still the question is open. Should this be
> reverted?

from my own usecase it does not matter since dunfell is still under 
porting effort and any version can be used, but others might have 
different view.

> 
> -armin
>>> On Thu, Jul 9, 2020 at 6:06 PM akuster808 <akuster808@gmail.com
>>> <mailto:akuster808@gmail.com>> wrote:
>>>
>>>
>>>
>>>      On 7/9/20 8:21 AM, Martin Jansa wrote:
>>>>      FYI this "small" upgrade changes ABI version from libjsoncpp22
>>>>      to libjsoncpp24 which might cause some issues to people who expect
>>>>      relatively stable ABIs in LTS dunfell.
>>>      Well that is not good. I did look at the details but apparently I
>>>      failed to catch the "soversion" change.
>>>
>>>      Would you recommend reverting this?
>>>
>>>      -armin
>>>>      On Wed, Jul 1, 2020 at 2:07 AM akuster <akuster808@gmail.com
>>>>      <mailto:akuster808@gmail.com>> wrote:
>>>>
>>>>          From: Pierre-Jean Texier <pjtexier@koncepto.io
>>>>          <mailto:pjtexier@koncepto.io>>
>>>>
>>>>          See full changelog
>>>>          https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3
>>>>
>>>>          Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io
>>>>          <mailto:pjtexier@koncepto.io>>
>>>>          Signed-off-by: Khem Raj <raj.khem@gmail.com
>>>>          <mailto:raj.khem@gmail.com>>
>>>>          (cherry picked from commit
>>>>          65e124eef373680726ac045677cbec7d9080a289)
>>>>          Signed-off-by: Armin Kuster <akuster808@gmail.com
>>>>          <mailto:akuster808@gmail.com>>
>>>>          ---
>>>>           .../jsoncpp/{jsoncpp_1.9.2.bb <http://jsoncpp_1.9.2.bb> =>
>>>>          jsoncpp_1.9.3.bb <http://jsoncpp_1.9.3.bb>}              | 2 +-
>>>>           1 file changed, 1 insertion(+), 1 deletion(-)
>>>>           rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb
>>>>          <http://jsoncpp_1.9.2.bb> => jsoncpp_1.9.3.bb
>>>>          <http://jsoncpp_1.9.3.bb>} (93%)
>>>>
>>>>          diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>>>          <http://jsoncpp_1.9.2.bb>
>>>>          b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>>>          <http://jsoncpp_1.9.3.bb>
>>>>          similarity index 93%
>>>>          rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>>>          <http://jsoncpp_1.9.2.bb>
>>>>          rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>>>          <http://jsoncpp_1.9.3.bb>
>>>>          index a88410f2ff..97c6361ad8 100644
>>>>          --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>>>          <http://jsoncpp_1.9.2.bb>
>>>>          +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>>>          <http://jsoncpp_1.9.3.bb>
>>>>          @@ -11,7 +11,7 @@ SECTION = "libs"
>>>>           LICENSE = "MIT"
>>>>           LIC_FILES_CHKSUM =
>>>>          "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>>>>
>>>>          -SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
>>>>          +SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
>>>>           SRC_URI = "git://github.com/open-source-parsers/jsoncpp
>>>>          <http://github.com/open-source-parsers/jsoncpp>"
>>>>
>>>>           S = "${WORKDIR}/git"
>>>>          --
>>>>          2.17.1
>>>>
>>>>
>>>
>>> 
>>>
> 
