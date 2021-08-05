Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4114.1628131966976259232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QsdZ18+b;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id ca5so5906164pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 19:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B9fRhUeVvL2g0RJRWzd5e9lQ2RQG6GvZGRu7SjF3/es=;
        b=QsdZ18+bhw/Uhs5lzmJ0z65EuWuRJt7hxiBGyS2mDHFh5ZhI1vOvFF/96SxFXOOo/S
         yuiEQSPhWnH5YiH/z8XRQc/aBLVFb0yUSTSfpdmN5ptgLVeBOmGz/qTV8blMTPwmOQg5
         yg5XhLGSFgN7KLFJXveP8scDNbrrKyj+WWMws+C8f+GLtqdcLuIIkQ3in39CvPPzZV5c
         GLJGtUyq+LBqot9ZHede60hDiHxHcGarW1FUryt7w+XSaPxk5FIuw9w61wRL+1UiRfWQ
         C1Xp/BSGkh8dE0tIWrapVhAwL8yJsJScUXxP+oC/mcGdm5ymTukZtDaqpt8GldKZGRGr
         uJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B9fRhUeVvL2g0RJRWzd5e9lQ2RQG6GvZGRu7SjF3/es=;
        b=hXC4gcotY26boVmkZ1FHM+IYdarlDy54WUq1XfoQv1rYUEDvsI5AEaRLRuX29JZ7El
         3XkXfcG2UShuBBdklpswTe7aQdA8qJuvHMJOgvHg7HwRWx52Tyl/aXsgE/1C8+NWwGfF
         hOtojkxOPABt56ZQVySTJuEf1H7okhV59i7NTMomJWnCto4ixr0xxTE1emDhgRVIRJ+i
         pDNwF4K3a896qgnulkKjKUeNCqlPYcbElYU6ZdxzgTy2SMNCNxO8S7cUWCOJxperdttE
         BPSJVI5L5Srl2MCOazDMDM5Qi10GmsDso80xDZeFtuHwKGaOrMLF8OtJxM0dh/ClFEOC
         iJlg==
X-Gm-Message-State: AOAM5325190bMQ1lI9i6aWNrBMVkrum3bQptbMkpUQclSSumM50L6vCB
	PPZ280lblAdxFe1/QaGPmZ+pkp/4aCScGw==
X-Google-Smtp-Source: ABdhPJykIgzyuTWQZm1Ti+6rwkdJsEeQ45X1XPKCqU3/ZyTWU/9+erTKb7/rVKr29terc31xaJrpAQ==
X-Received: by 2002:a17:90a:ce07:: with SMTP id f7mr2227349pju.81.1628131966296;
        Wed, 04 Aug 2021 19:52:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:61bd:9658:157a:c74c? ([2601:646:9200:a0f0:61bd:9658:157a:c74c])
        by smtp.gmail.com with ESMTPSA id w15sm4299326pfu.89.2021.08.04.19.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 19:52:45 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: akuster808 <akuster808@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
 <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
 <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CAMKF1sqgy4PmVTbq0_Fk+=yvJgd3L4gK1h=LUX4Oz33V7F=+9Q@mail.gmail.com>
 <CO1PR11MB500946DFBAA512C2B2D597FCF1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <544feeb0-7c5b-2acf-3b12-0e0fd361fbc3@gmail.com>
Date: Wed, 4 Aug 2021 19:52:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CO1PR11MB500946DFBAA512C2B2D597FCF1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 8/4/21 7:48 PM, Yu, Mingli wrote:
> Hi Khem,
> 
> The one we want to update is the persistent archive and also send a 
> patch to master.
> 

Can we point the SRC_URI at 
https://archive.mariadb.org/${BP}/source/${BP}.tar.gz ?


> Thanks,
> ------------------------------------------------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Thursday, August 5, 2021 10:42
> *To:* Yu, Mingli <Mingli.Yu@windriver.com>
> *Cc:* akuster808 <akuster808@gmail.com>; 
> openembedded-devel@lists.openembedded.org 
> <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, Aug 4, 2021 at 7:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Armin,
>>
>> Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, but after 10.5.12 comes out, the issue will be there again if we don't upgrade timely.
>>
>> Considering the previous URL only stores the latest tar ball and the updated one stores all the tar balls. It's better use the updated one.
> 
> Dont we have some persistent archive location to point to ?
> secondly, we should put the tarballs on oe source mirror for fall back.
> 
>>
>> Thanks,
>> ________________________________
>> From: akuster808 <akuster808@gmail.com>
>> Sent: Wednesday, August 4, 2021 21:58
>> To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
>>
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> On 8/3/21 10:43 PM, Yu, Mingli wrote:
>> > Ping.
>> >
>> > Thanks,
>> >
>> > On 7/27/21 2:32 PM, Yu, Mingli wrote:
>> >> From: Mingli Yu <mingli.yu@windriver.com>
>> >>
>> >> Fixes:
>> >> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
>> >> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz 
> <https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz>,
>> >> attempting MIRRORS if available
>>
>> Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?
>>
>> -armin
>> >>
>> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> >> ---
>> >>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
>> >>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> index 2974341bf..e8ff41461 100644
>> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> @@ -4,7 +4,7 @@ SECTION = "libs"
>> >>   LICENSE = "GPLv2"
>> >>   LIC_FILES_CHKSUM =
>> >> "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311 
> <file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311>"
>> >>   -SRC_URI =
>> >> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
>> >> +SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>> >>              file://my.cnf <file://my.cnf> \
>> >>              file://mysqld.service <file://mysqld.service> \
>> >>              file://install_db.service <file://install_db.service> \
>> >>
>> >>
>> >>
>> >>
>> >>
>>
>>
>> 
>>
