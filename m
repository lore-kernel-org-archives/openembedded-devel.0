Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.11738.1618929701146137606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 07:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sYLVpD9I;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id f29so26749232pgm.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Am3/C1zEZd74nomg1ajZHEkb+n4VFJtvxBCqQ4fs0ws=;
        b=sYLVpD9IAteugUridsyJ1zSd1uVP2AyzI+zppMW5HLOkrILDPX0lOdC0XFZdgtELbr
         Gre7GSiA8DPx/ye7hdyMS63+qHNJA8xNXyEUIa6TPQkrfhsdRQ8VQCaVMUYZkxFePDe9
         yYz/In6OjTHZ01DRHNRqsrbytNbbMXDzBqBUn+KMPTUrA9D/CTBkFclRKHMBIPBnKUNz
         LvqPS8eMIuiLYp14/1S160YpkxJhm116Xx7/lH5MuUEiWI45EAZPaxCujDHOeqPl0ffy
         b+chbjTPRAmNtAgowNKtDVF1orRWLRT/VpC5DyeD068OEgV1ZjCaaW3CCrxyX6H25ile
         q4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Am3/C1zEZd74nomg1ajZHEkb+n4VFJtvxBCqQ4fs0ws=;
        b=kp2WjG/RIFab9KwLO0HSLSN7rF77e/5OIqy/feXwgDp5Ht+3Z0bDe/VS3BA0GiyfBb
         qrtPs0n2HpumaQ2Q47zJtKvM8sLMyXTvv1DIMrHY0JDWEvnWsBNKyrFPiaFk5XbJtL+k
         5lpnsWXTGST5q+qrumsoYcyj1Te4jYVsvhAD3iyK5n4rdUJXjsr1IuqQ3QHrh7wtGmWm
         Dt15QpkxNo+RUB50bJeRvXsFXXHvvGM/KSLk8MZcSAyj+eUp3mti3rbK+Zyr1nVfn6ss
         nZQLyDIL39ZrVSdCn42LnSt8/AiuB6duEAWUYQaXp3rUehmjB0Qannh3hwKI0gLv+1ag
         7ruQ==
X-Gm-Message-State: AOAM530RqBwg57+tpd3UkyMLxVkE14k2plKuSH5XBocODknBNDhU4UEb
	hdfUSEY+pSMvQGafCVOExONkrrDxh9WFfg==
X-Google-Smtp-Source: ABdhPJzeNgH8CFMqv8ivmUyEimdmHSXv1moO2yz1wL/snhSlMQ0Mb9b6K1WfT+ELMoamWl6RDe+jCw==
X-Received: by 2002:a62:8cd0:0:b029:256:a7a9:2a3a with SMTP id m199-20020a628cd00000b0290256a7a92a3amr24790195pfd.69.1618929700194;
        Tue, 20 Apr 2021 07:41:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id f135sm15558648pfa.102.2021.04.20.07.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 07:41:39 -0700 (PDT)
Subject: Re: [oe] [PATCH] understand-autobuilder: fix small typo
To: mitchdz <mitch_dz@hotmail.com>, openembedded-devel@lists.openembedded.org
References: <BYAPR04MB52088E8EDE6C00899D783BD2F5489@BYAPR04MB5208.namprd04.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <eb093fe8-6504-cf68-1b58-70765cadc6b7@gmail.com>
Date: Tue, 20 Apr 2021 07:41:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB52088E8EDE6C00899D783BD2F5489@BYAPR04MB5208.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

thanks for the patch, but its wrong mailing list for doc patches, please 
send it to docs@lists.yoctoproject.org


On 4/19/21 10:54 PM, mitchdz wrote:
> The documentation has a small typo where it has
> "wo" instead of "two".
> 
> Signed-off-by: mitchdz <mitch_dz@hotmail.com>
> ---
>   documentation/test-manual/understand-autobuilder.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
> index c158d9ce4..da17968bc 100644
> --- a/documentation/test-manual/understand-autobuilder.rst
> +++ b/documentation/test-manual/understand-autobuilder.rst
> @@ -258,7 +258,7 @@ it is inevitable that users will end up needing to heavily customise the
>   ``yocto-autobuilder-helper`` repository, particularly the
>   ``config.json`` file as they will want to define their own test matrix.
>   
> -The Autobuilder supports wo customization options:
> +The Autobuilder supports two customization options:
>   
>   -  variable substitution
>   
> 
> 
> 
> 
> 
