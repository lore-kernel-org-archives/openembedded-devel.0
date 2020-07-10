Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.1593.1594343315845184541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 18:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aoobZkDp;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id z3so1761678pfn.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/DLuKaL5cQ0Thl85gYO/sIJd5XX8gySvQrNIboS+bXQ=;
        b=aoobZkDpg405YzP6fdjSEFwynKNy7ST7I+d7pS8bzp/V51y6+QEOH7VvVAVd7t0ag8
         gDgSo5hJphM2FlJOwK5M6CBCxaKazWvvpnD5UE9IdTdAc3xd3GHVovj4LAHG2fsP6n5h
         TlWygZPSMM/L9FasyqFGuJMZuaQ12RGsV4kI/+noGF+5sia/N6uEzjMvSly8/thzf1oK
         v/prfa//pRLhLSp3JXVAhV2HLqFXvCDDmEiH/Tq4pORR95psqc6rtQOr+0YjXN49CqHC
         RJVSunY0Z849oKptQ6Ibcyb0YuwyAH3XD59NvxAyLlhHKPQt1INbUV5VuE2stLOo0qpN
         j6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/DLuKaL5cQ0Thl85gYO/sIJd5XX8gySvQrNIboS+bXQ=;
        b=RyBSxWyygcm8LYTuXiRIz6NkZzT6aJOjIa0c46s5B7uTGBHkbqCZkyUBHLqQivipTH
         rkFTatFAvQOnUlkB3GvkBJTdqn7Ox9WoFxwZH4/pfq/a0D91l9J2TTVMezZ3nnyVtlcD
         4S0zR2oDVZ2W2smJsOAois5PgULzQyi2FDoyoPQar0tTapfd0uIAj+KtUz5oBDe8xQJr
         vIAIm5lBNFsp5FICgLg4dOZzsn4BmRpKR097fM/3cnFTybFbZgKb0Hh6FMRNIbOuEJ8t
         k+00CiJmWJJaNKkgDXRVmtephw96nd3c63vRNjeMNEhXGeqUDqfoOjq8r1qMPhRcoj3y
         +JrA==
X-Gm-Message-State: AOAM533SRp8psl/q2Z4JwtNTawJ3aD+3wwdxEwXDeQ5bMDJAYJ11d03n
	i/DtMFpskhKxxQ/NFVX4HxxQy7pIhUQ=
X-Google-Smtp-Source: ABdhPJyQMa5kJ5FemfI3DL66NvV01WDKFdmTXUIFail3ZG5NjWQfPLDzJJL9iiqCVxE1f5UjDB2sMA==
X-Received: by 2002:a63:de4b:: with SMTP id y11mr32753232pgi.26.1594343314759;
        Thu, 09 Jul 2020 18:08:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::c85a? ([2601:646:9200:4e0::c85a])
        by smtp.gmail.com with ESMTPSA id y198sm3997419pfg.116.2020.07.09.18.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 18:08:34 -0700 (PDT)
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: Martin Jansa <Martin.Jansa@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1593561840.git.akuster808@gmail.com>
 <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
 <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
 <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com>
Date: Thu, 9 Jul 2020 18:08:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 7/9/20 9:48 AM, Martin Jansa wrote:
> I don't have a strong opinion about this one.
> 
> It's easy enough to undo by downstream layers if they care about ABI.
> 
> At LGE we do have some prebuilt binaries which use jsoncpp, so we do
> care, but haven't updated to dunfell yet and when we do get those
> prebuilt binaries to be rebuilt, we might as well use newer jsoncpp (and
> in that case might backport this upgrade anyway even if it gets reverted
> in dunfell).
> 
> Maybe someone else will share an opinion on this as well.

I checked https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3

and it does not mention ABI change there from 1.9.2 to 1.9.3

but then I see

https://github.com/open-source-parsers/jsoncpp/commit/8b7ea09b8055df01866a5ce4142b12ed8f9f13eb

I dont know if there are API changes which means it will need porting
effors for users or is it just a relinking that is needed.

> 
> On Thu, Jul 9, 2020 at 6:06 PM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
> 
> 
> 
>     On 7/9/20 8:21 AM, Martin Jansa wrote:
>>     FYI this "small" upgrade changes ABI version from libjsoncpp22
>>     to libjsoncpp24 which might cause some issues to people who expect
>>     relatively stable ABIs in LTS dunfell.
> 
>     Well that is not good. I did look at the details but apparently I
>     failed to catch the "soversion" change.
> 
>     Would you recommend reverting this?
> 
>     -armin
>>
>>     On Wed, Jul 1, 2020 at 2:07 AM akuster <akuster808@gmail.com
>>     <mailto:akuster808@gmail.com>> wrote:
>>
>>         From: Pierre-Jean Texier <pjtexier@koncepto.io
>>         <mailto:pjtexier@koncepto.io>>
>>
>>         See full changelog
>>         https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3
>>
>>         Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io
>>         <mailto:pjtexier@koncepto.io>>
>>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>>         <mailto:raj.khem@gmail.com>>
>>         (cherry picked from commit
>>         65e124eef373680726ac045677cbec7d9080a289)
>>         Signed-off-by: Armin Kuster <akuster808@gmail.com
>>         <mailto:akuster808@gmail.com>>
>>         ---
>>          .../jsoncpp/{jsoncpp_1.9.2.bb <http://jsoncpp_1.9.2.bb> =>
>>         jsoncpp_1.9.3.bb <http://jsoncpp_1.9.3.bb>}              | 2 +-
>>          1 file changed, 1 insertion(+), 1 deletion(-)
>>          rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb
>>         <http://jsoncpp_1.9.2.bb> => jsoncpp_1.9.3.bb
>>         <http://jsoncpp_1.9.3.bb>} (93%)
>>
>>         diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>         <http://jsoncpp_1.9.2.bb>
>>         b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>         <http://jsoncpp_1.9.3.bb>
>>         similarity index 93%
>>         rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>         <http://jsoncpp_1.9.2.bb>
>>         rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>         <http://jsoncpp_1.9.3.bb>
>>         index a88410f2ff..97c6361ad8 100644
>>         --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>         <http://jsoncpp_1.9.2.bb>
>>         +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>         <http://jsoncpp_1.9.3.bb>
>>         @@ -11,7 +11,7 @@ SECTION = "libs"
>>          LICENSE = "MIT"
>>          LIC_FILES_CHKSUM =
>>         "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>>
>>         -SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
>>         +SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
>>          SRC_URI = "git://github.com/open-source-parsers/jsoncpp
>>         <http://github.com/open-source-parsers/jsoncpp>"
>>
>>          S = "${WORKDIR}/git"
>>         -- 
>>         2.17.1
>>
>>
> 
> 
> 
> 
