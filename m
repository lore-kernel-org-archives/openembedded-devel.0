Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.3487.1632255435016961981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 13:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmKTlaEw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id 5so207805plo.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 13:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=wqrEEAsELNk7Q8ZWaAUOl5gs84lRFfG77Zp0eO0b5q4=;
        b=TmKTlaEwsqIrQ9/WnCw1ya58bjsIdEfXkPMp4HIznpyTsMS8azkSdWxrsxJnsIDrfX
         2QP5q+GbNruPChao6Ll4qhi/xH1nmHSwbeZbj+HafZb0cWERgVLey0q5Icbrksv0FnEM
         KwZu3cvHWss87RdmI7hPAyyuCJGVS/C+ycLkpqvl6UZhvMB8wS04v9HxXcsTgKm/YdIF
         xsa3mefraaDyEEfSlqcVqGQy0OUPEUDCUR8edGamVzk+0btsVRFayQr3p9gXZG2/V2x4
         dVQKz5+pbwSxssZVECTa0/8kXtJS9hhFbXguNAsBeyHFIy3aQMcrguu6XuJNPiJ23Fbv
         ZjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=wqrEEAsELNk7Q8ZWaAUOl5gs84lRFfG77Zp0eO0b5q4=;
        b=W/yS28kNweLcPJJVQpoZCPpzRzlCezRSEQUq6sU/nCYJV8xu68TK0zQVRfuY9iJQaj
         TSV546H77alStGg+AT3BnfmKy1GtpOVGuYlMNLknXh4ElajVBnBsviNUSJFrGHFd4Fuh
         zWywkYy1L4M67qqqExfUeNPKwlRyNtoc09KFz6cIi+xihZZi7d59ikwNJCfHtTkF1TDC
         yWAM9KQgqtcfmy3E76V3rcAstGqr7afmAjgASJ4MJXZfSwgKV+598dv+eMwgxls0/vhs
         QmSH7KN7RIKaQE53tKn1A1m0GECfaouWINmReVl2fWm+/zW2afLYj4Z84q5KAZ6BbRFM
         boXw==
X-Gm-Message-State: AOAM533E60AfDJeHIPBcJhzzcwjww1YkNvMymoe9S1Lwrlblzlbg/vOZ
	qn7ChVDXWQQAcC86/JQJ3ef3E2cn3rRZrg==
X-Google-Smtp-Source: ABdhPJyh+41yrP6rQXiIx4jkgzLjjHKt0sdI4eCqWcIKwvGr/DDTKEBmbCR9KP5aQOHUC2erSKsPbw==
X-Received: by 2002:a17:902:b093:b029:12c:843:b55a with SMTP id p19-20020a170902b093b029012c0843b55amr28664769plr.83.1632255434297;
        Tue, 21 Sep 2021 13:17:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:786d:b045:bb6c:50ab? ([2601:646:9200:a0f0:786d:b045:bb6c:50ab])
        by smtp.gmail.com with ESMTPSA id o2sm34791pgc.47.2021.09.21.13.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 13:17:14 -0700 (PDT)
Message-ID: <72739a53-f954-409f-f763-d5ea4e67775f@gmail.com>
Date: Tue, 21 Sep 2021 13:17:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [oe] [meta-networking][PATCH 1/2] rp-pppoe: Add configure cached variable via recipe
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210921172931.3132388-1-raj.khem@gmail.com>
 <CAAnfSTsph=Kk8Rqthz07M0D6mu6Os51jxjoWiVS4kw79Z_z5=g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <CAAnfSTsph=Kk8Rqthz07M0D6mu6Os51jxjoWiVS4kw79Z_z5=g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/21 11:15 AM, Ross Burton wrote:
> On Tue, 21 Sept 2021 at 18:29, Khem Raj <raj.khem@gmail.com> wrote:
>> +EXTRA_OECONF:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', 'rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=normal}', 'rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}', d)}"
> 
> I think CACHED_CONFIGUREVARS was intended to be used for this, for
> what it's worth.
> 

I have changed to use CACHED_CONFIGUREVARS in staged patch on master-next

> Ross
> 
