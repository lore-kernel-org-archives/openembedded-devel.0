Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.7394.1622124251888140691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 07:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GQcx0J/m;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id h24so234487qtm.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Slw0s5WnrpVcb4w7KJf0CsvlhnlfxaUx21xBoljyDq0=;
        b=GQcx0J/mbJDJQinWN8azLh/Cj5xvgCIpNcMqltSosIuLp9oNgb1sMBJMoiYXoyrGOz
         DHDrNmZUoK8a1+xBgK6OxN8rzXJFWWztK/Z0gueEfzc6rNxSm7VV0PSAsKwgI/PwG6Wo
         hGJz8hORjddU8HCvCIF+D3rRyBRPo72ii0utewKG2uQP1kMtKZeR7CLDHHdIaD/b2ypk
         7nqbk/Ase8dNKZEobGvT1RGyZnDgAzY0jpQKDQEHtr5P6dkBakT/v9JUUw+rEIqqqh4P
         b6L3ou7VdCVrpnZ/LLXAdGhSVBlDKNxb30VMIPaaD/QiUCm1bzLZHEfUck089lIpMbAv
         UOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Slw0s5WnrpVcb4w7KJf0CsvlhnlfxaUx21xBoljyDq0=;
        b=T9duZhQHzB8JRqv4Vs5i+UF0gepneN422sFt2rq7EFnJ4lwTe5zy2mqckKqxukNqOM
         llMNTof3RlAI57ZyNnCI44VC2Tdncn6sZxV96ugCEp5Z+aXAizyXKh6lG2Q3cwThT5l7
         fdoT9CY/qrYlFTNU8II4qO3xbJ8gQo5fnzA/WvN9v5hZ3KnIWFMree2/luI236VBfybt
         +U9h//Tpf6pbM9YqO8rVI8tePqGuSk91kwknnfIa8SPkA1rB2fuGpCaNqB03vACLsgbS
         qGrR0bn0jG04VDvnLJ6RdmzXVLnM+ebYiun1tN20ZCf8BvUTwAzYWiFl7L9H9yZ82nHZ
         XbZw==
X-Gm-Message-State: AOAM5320px1f7wFgeEVre3//qfBM1u+9UISv7EceetgXoV5XgOsEhWiJ
	wq7EfIni4fJAOAzkYpBY2StiIiE7fSKHr8gajuA=
X-Google-Smtp-Source: ABdhPJxI9QVgX1/RgIxXoxHigNY8HDovUP/QdgXLkzsOsFABTgX8ug6Azu48Ez+KUC0C41WKDWGnvqN3H6ODT82JZe4=
X-Received: by 2002:ac8:44b1:: with SMTP id a17mr3255584qto.369.1622124250990;
 Thu, 27 May 2021 07:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210526195929.26047-1-nishaparrakat@gmail.com> <30338.1622118876976347651@lists.openembedded.org>
In-Reply-To: <30338.1622118876976347651@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 27 May 2021 07:03:44 -0700
Message-ID: <CAMKF1sq9PaBpmx7DP4ftUU=jepsX4HtQXmZ_6SvQ4jSARzh6-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
To: Nisha Parrakat <nishaparrakat@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this seems ok

On Thu, May 27, 2021 at 5:34 AM Nisha Parrakat <nishaparrakat@gmail.com> wrote:
>
> HI Khem,
> Will this be accepted ?
> I will move the android-tools patch to the meta-clang but this patch fpr p7zip shall remain here in meta-oe
>
> regards
> Nisha P
> 
>
