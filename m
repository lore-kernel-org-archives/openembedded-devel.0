Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.9861.1592493307044962647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H4BjjD9n;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id b5so3034719pgm.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TG/Q/giLyIeuxzNAfOOOgBoWteIV9IkinI0N2sVzYPA=;
        b=H4BjjD9nV/aZ18bNEmM9oQjQU3kBXDoT81i0mRyfVQV/2eMctCpdantW5Vdvh6xc9I
         bHByUNVNADbg1Y5kBr8HO6Bx/Y+yEG59ESARlv3mjxirX5Zft3l65V8CLqBiiiFch98U
         WZZ7VahbgdcLZSsOibAd6HhmEE+I2V8w313wKGyrg8x1ROFlxmBYEdOoDe+rhKQGsksY
         a4AB5Lo9Ts5HoAUAX0ODoOOPxOKZASBOUqbtutaDBs4bXTm4xa69nh33OucVDAffI6jy
         ALI3lnHSuWeN7qlQ9gNHpJBecawqLkUKdakDUNrRMs/wX9t7CQwkKpF+E6Dbtj8jRF5U
         I7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=TG/Q/giLyIeuxzNAfOOOgBoWteIV9IkinI0N2sVzYPA=;
        b=SsYu0mBWqCd6GsuGUDuLqjVWrNkFYkhSKUiYuWstA8t6SARiqhOlxn0XGf7Z16/g2v
         1CmpGLq5meCzIYgYQSXCPHVB540TdCykyTOg0ZjO7FDKz9KqkvMOfsfCrCsW2AKebex0
         5AR7iaYXrs7tfc8vs/bpxiHowVLW/m+xl29gnzl0q2nc9JRCD/WuZDQVoXUf/viZs6jG
         UDCqNvPOaQMI8M3QfRZJjWXdGirxaMG3LLfu7sBzSIuKuKrnN5uCMyvpMexzpgee31+g
         NMTSkg36Y2QM7VtNQh0j2Tjk0rxfbzxFfOukhLTXiUzormKbYdvE9arJemdiB+huvYLO
         Jjig==
X-Gm-Message-State: AOAM530x4lLCAUEZtiAPqu3hD50w9MvmbuPHdOoSYQsH/gdjhuYmIMzZ
	8pDADNvesj3DDvA0lOfE3oA=
X-Google-Smtp-Source: ABdhPJxMny5K5ppoub8akVIhFA39/pY79gH7uQD0V7fkcEsR6FF5l1hnuk6hlxy/joSXICVQ5iN6bg==
X-Received: by 2002:aa7:9d02:: with SMTP id k2mr4075770pfp.288.1592493306344;
        Thu, 18 Jun 2020 08:15:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:88de:dadb:4f45:bd2e? ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id s21sm2837071pgg.8.2020.06.18.08.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:15:05 -0700 (PDT)
Subject: Re: [oe] [dunfell-backport meta-python PATCH 01/22] python3-argh: Add recipe version 0.26.2
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Meta-OpenEmbedded Mailing listing
 <openembedded-devel@lists.openembedded.org>,
 Domarys Correa <domarys.correa@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
 <93cc762c-be2e-ef93-7159-36bb2daf78ef@gmail.com>
 <CAP9ODKrEo6EPnrX95nkM8z5Pj1xe+KaLaUmRYxhi6A00PvOd+w@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <07a7aabc-0e7e-dd8f-ead4-6860cbd004c0@gmail.com>
Date: Thu, 18 Jun 2020 08:15:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrEo6EPnrX95nkM8z5Pj1xe+KaLaUmRYxhi6A00PvOd+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/12/20 2:00 PM, Otavio Salvador wrote:
> Em sex., 12 de jun. de 2020 às 17:56, akuster808
> <akuster808@gmail.com> escreveu:
>> On 6/12/20 11:35 AM, Otavio Salvador wrote:
>>
>> From: Domarys Correa <domarys.correa@ossystems.com.br>
>>
>> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit ae8968122461df7e1fa39138f32caa35218bb71f)
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>>
>> Am I missing the context around "dunfell-fallback" ? Was there a cover letter that would explain that I missed?
>>
>> Generally adding new packages don't fall inside a Stable branch policy.
>>
>> please clarify.
> We are moving packages from multiple layer (with even duplicated
> recipes) to meta-python. Those recipes we are adding so we could use
> labgrid. It was sent to master and I'd like to backport so we could
> later clean this up.

These changes do not qualify to be backported to Dunfell.

Thanks for submitting the request.

- Armin
>

