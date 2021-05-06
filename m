Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1025.1620325715708875195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 11:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SRyKP7hE;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: romain.naour@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l14so6640368wrx.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=dkG3kTrxblvz0nCGs3YhGXInE5RinLHxYwx6jIzmZyo=;
        b=SRyKP7hEMYGxf+szi7JY38vfYXaZ+7TgVv57PtP3olBkJwna9aDoP7PoNjft0ajKC/
         LGQ984yBgOxErPQcEernX+uQY5D9ox0vuXfzbFLVYtrX+4MbJfuvXEjlmZng96L1YE7m
         FAxfaNUnLJ5T7yrpf95EhKZ8IXnIIfYyTTPLB6bsxD+kXqK2krfC/540L7sp1ee6hE6v
         K2iHAIEOJXEfhgtYUbrYKftV1Hv5CC03V6s5hqmjrBJfqmDEcnPKLaGfTyD/guRCnSxF
         edw/KdN7aTXlQ62tVsMCVukAezEebzuLZfn3HXZw/41EIQfbuDmWjbrhFifLM4tdjYMZ
         Qdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dkG3kTrxblvz0nCGs3YhGXInE5RinLHxYwx6jIzmZyo=;
        b=RG45Kw1FkMjKF+2IR4j/2PooVaqUJLVPYyUKcjN4HcUd69y0dAZlSQLY6InBJ8JdW1
         42a4bEh5pKnsiPZcWY5ayWUj3eu60adOSVQ0vtwLZCfHHZXLWjRoBAOHIWO8UEYqRNlU
         w00pxZ8PwjAXdou0iHGh/mlJKZby8abKil+ghEcT6QdjsCBnNHcFVzSb3WW+3cOFep6T
         g8SETW1fVGgGRo92Y7mCU3xHiEn05wdgMMts5MBnQms6hZbDJfAjmJUEHFLFN5O044GO
         ROB55KFuNp5v+IWdzDCP6TuG9Mjj2gB7niX7BOXq2ueQEQwUC8p8uyZnlv59rt8GRejk
         B0VA==
X-Gm-Message-State: AOAM531goq6frvFvrnQ2N4xXt7DMjndp47S1FyTljgg+F6H8kI3fhh0b
	KSQlQ2b8RKfBSGNCRJ8ONNgwVBIKVvA=
X-Google-Smtp-Source: ABdhPJw8mX8OdscMp+QnAl0ctM0fk2drsCrj5YpMTn7aiW6KpmyXJWha22WlRHZqKvw78gZovkiVTA==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr7145719wrw.108.1620325714214;
        Thu, 06 May 2021 11:28:34 -0700 (PDT)
Return-Path: <romain.naour@gmail.com>
Received: from [192.168.42.153] (pop.92-184-97-96.mobile.abo.orange.fr. [92.184.97.96])
        by smtp.gmail.com with ESMTPSA id n5sm5665797wrx.31.2021.05.06.11.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 11:28:33 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/2] poke: add recipe for version 1.2
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210505230545.2574514-1-romain.naour@gmail.com>
 <cfd7b579-09cc-6d6d-4fa6-6f1f2a31bb5b@gmail.com>
From: "Romain Naour" <romain.naour@gmail.com>
Message-ID: <b609cc76-25e2-63db-05dc-d2d1cf8163ce@gmail.com>
Date: Thu, 6 May 2021 20:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cfd7b579-09cc-6d6d-4fa6-6f1f2a31bb5b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Khem,

Le 06/05/2021 à 02:40, Khem Raj a écrit :
> Thanks for Patch Roman
> 
> Since its a new package can you also send a followup to add it to test
> packagegroup packagegroup-meta-oe-devtools in packagegroup-meta-oe.bb

Thanks for the suggestion.

See:
https://lists.openembedded.org/g/openembedded-devel/message/91178

Best regards,
Romain


> 
> On 5/5/21 4:05 PM, Romain Naour wrote:
>> Backport a patch to disable tcl/tk dependencies when gui support
>> is disabled.
>>
>> Add a local patch to workaround a path poisoning issue. Issue
>> reported upstream.
>>
>> Add another local patch when HELP2MAN is missing.
>>
>> See:
>> http://www.jemarch.net/poke-1.0-relnotes.html
>> http://www.jemarch.net/poke-1.1-relnotes.html
>> http://www.jemarch.net/poke-1.2-relnotes.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
