Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.12459.1628185989103425454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 10:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GKGXZByA;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id j1so10730700pjv.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Aug 2021 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=PU/0fLnzQknz814AAWuEfmDId8uAeRrIfNj6TJMmB5w=;
        b=GKGXZByALBI2bpvopdLf/jZ9lMRChX3OsIMCBUMXMwXmT8bh85s4REoe/4g3hRvsm5
         YZ9MnPaWPYh0i976xTYhvcYemeu9g0tTMw09ry2rTjYBhnfxXYOokqCS5usjsdGVsR36
         CBfgaH/A6WPaIfbcXd0AO3663xAzAmQtNjzDMmJ7WCfsL6yuCka2F99ibqcMXxi81bHf
         0xGj9Hu8DEO07hoWNX+mo80SH+KWjEWxaaqdAPdl4Z3y9KRK+9X2zXju0t/qugOhbJjg
         ErsLH4ay0LhBas+kQZU1Ym0KlAdNvQsStAHk8eiM/hr1MTmYos/Sythg0BvRBuqmeZyU
         b9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PU/0fLnzQknz814AAWuEfmDId8uAeRrIfNj6TJMmB5w=;
        b=ssC4T5NTD4bRhtjBWp4LYdM9bNMlW0sBUaTNeJ44p0sFMGMOoVyw1yaJPvIIJ7xuJM
         +qChghlNe8pkjnrncPj6c2mlj9fCyQRkmcTX8BnKw3GGpZ2uEjoapybb396OiA44mIwk
         eBWp113Aebk/z4gQqOcc4fGfph09LIB+mtGTLaNWfb3u/FuSkwWn19I8vJNzOI1tFSFS
         Y5O7iLCfZZwL6InOidNqGh+8NH40vNrccBfFIKhSZcwZMvY1jh8946lXuz+xIr994XJ3
         DzOZeergh06iu7VYpgOZ8zSQMvmQuSjG97SA7YJDvyc9fhEKTQwlWWI4hiZpiAWV078X
         3AvQ==
X-Gm-Message-State: AOAM53215Kqhreq/HKXvyVKHVKV/rTEyy53Q5PSwHicIXaPEQtJ+EvwB
	Hzao4Zsk8NvtkTbqHzens+qLjCUA1zn5hg==
X-Google-Smtp-Source: ABdhPJwowpon9tfdcNtvxzTHVxvCFvLsmmKu/nAFQePQwcwXfVkfgR0+cKuyl2/ILSoBiEnpXtlONA==
X-Received: by 2002:a17:90a:ead3:: with SMTP id ev19mr5823613pjb.229.1628185988454;
        Thu, 05 Aug 2021 10:53:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:721:4c45:79e9:6ec8? ([2601:202:4180:a5c0:721:4c45:79e9:6ec8])
        by smtp.gmail.com with ESMTPSA id b6sm10265950pjl.17.2021.08.05.10.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 10:53:07 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
To: "Yu, Mingli" <Mingli.Yu@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
 <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
 <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <d1f3385e-0264-5da0-e055-bceac26279fc@gmail.com>
Date: Thu, 5 Aug 2021 10:53:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/4/21 7:35 PM, Yu, Mingli wrote:
> Hi Armin,
>
> Though the do_fetch issue is gone after upgrade mariadb to 10.5.11,
> but after 10.5.12 comes out, the issue will be there again if we don't
> upgrade timely.
Sounds like reasonable approach.
>
> Considering the previous URL only stores the latest tar ball and the
> updated one stores all the tar balls. It's better use the updated one.
OK. thanks.
Armin
>
> Thanks,
> ------------------------------------------------------------------------
> *From:* akuster808 <akuster808@gmail.com>
> *Sent:* Wednesday, August 4, 2021 21:58
> *To:* Yu, Mingli <Mingli.Yu@windriver.com>;
> openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
>  
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 8/3/21 10:43 PM, Yu, Mingli wrote:
> > Ping.
> >
> > Thanks,
> >
> > On 7/27/21 2:32 PM, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Fixes:
> >> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
> >>
> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz
> <https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz>,
> >> attempting MIRRORS if available
>
> Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?
>
> -armin
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> index 2974341bf..e8ff41461 100644
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> @@ -4,7 +4,7 @@ SECTION = "libs"
> >>   LICENSE = "GPLv2"
> >>   LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311
> <file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311>"
> >>   -SRC_URI =
> >> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
> >> +SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> >>              file://my.cnf <file://my.cnf> \
> >>              file://mysqld.service <file://mysqld.service> \
> >>              file://install_db.service <file://install_db.service> \
> >>
> >>
> >>
> >> 
> >>
>

