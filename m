Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.75.1598373404605223774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 09:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=LbPlFgV7;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.66, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ej1-f66.google.com with SMTP id oz20so12460039ejb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhA7sCFi5JhpGCfL3cwk0maGfMk4KzuUhviUIQ3A1+Q=;
        b=LbPlFgV70aVTEGTnOkTfvk+7EMuO4QzkTVYDv1DrqVt4dd1/w8v25MLf0C+6wPSy0g
         KN3Ezq1QA33UYkvuTv3OCvbAmKp7a0YIxYVCz+MJ/pYHvvgQh9v2k8MouSK0B/RJg/U3
         7iBqnFbSG2C8tkZu/2NvRyvT7TCAQ9LTqUcT5Fu6jWFfHoaudt/MY++g0yl+cYXfHGbD
         NCFqFgEv/kAykmRYTXs45/ccDaoQEQBRKyHuYM1R+llcq6oJdKgkJr+ZGfWphOd/HeMS
         L+Sic7ezZaY4mXdUKO5Ebu+j8MkrVU9A51IHD8ZJ+n6RcJYDXnMdbnmqswWdOA2Oes64
         ipvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhA7sCFi5JhpGCfL3cwk0maGfMk4KzuUhviUIQ3A1+Q=;
        b=QSPjPbxhOez50WL4hdyApauH4+tBlUKI9mbBk30rq6itSyo62kVb7cAmRsah8GsRJE
         L80GISoVc/fRiQ8dKxmEa73NAqzGuKmMX46fKy5VUf48ahB/bJW0Yw2kEA4blDQ976H2
         7CLskH3w5UJqsfOu6ssvPSWzxjnKNyShsx+RKMHNxELWDLacclRKWZ51uIFdweeSRhtI
         OAy2cs36AUR4f2sVLkHGfPTdfrBjIrNkJySQtpcml0IwQwHEU9KAuPi8N30HRs+13bQY
         qAzqN4eg3wNsUKewUcEMsH4uyxz7xnZ+eMjPtiRkd7lyHDSdk2ycXcuThJ4XFkykH1QF
         5fog==
X-Gm-Message-State: AOAM532QQWHXNNkh8f11wlgAGZP8NNkqRW6QDwou+kQwVFHXN2juziGm
	xMJK1C6rSINuAdvvVlFnpm08W+7hgTcsjktgX/XsjQ==
X-Google-Smtp-Source: ABdhPJxXvhd8mD8smjH/ttGYaHIv/J4na14QYiN4aTSzFVEyEAgNuEfTUyTd0iEgW0tVxsS0Myl9FcWxCNBoOxIzJKA=
X-Received: by 2002:a17:906:d187:: with SMTP id c7mr11798093ejz.196.1598373402929;
 Tue, 25 Aug 2020 09:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com> <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
In-Reply-To: <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
From: "Diego" <diego.rondini@kynetics.com>
Date: Tue, 25 Aug 2020 18:36:32 +0200
Message-ID: <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Tue, Aug 25, 2020 at 5:57 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Doesn't this trigger src-uri-bad QA warning? It would be better to use git fetcher.

No warning because this is from git*lab*.

Also, this the URL of an official release tarball taken from:
https://gitlab.com/libeigen/eigen/-/releases

See also first comment here:
https://patchwork.openembedded.org/patch/161360/

Regards,
Diego Rondini


>
> On Tue, Aug 25, 2020 at 5:45 PM Diego <diego.rondini@kynetics.com> wrote:
>>
>> Bitbucket is no longer the official home of eigen, which has moved to
>> gitlab. Update SRC_URI to download releases from gitlab, fixing:
>> WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
>> https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2,
>> attempting MIRRORS if available
>>
>> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
>> ---
>>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
>> index f638848d1..9c3d962f4 100644
>> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
>> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
>> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
>>  LICENSE = "MPL-2.0"
>>  LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
>>
>> -SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
>> -SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
>> -SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
>> +SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
>> +SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
>> +SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
>>
>> -S = "${WORKDIR}/eigen-eigen-323c052e1731"
>> +S = "${WORKDIR}/eigen-${PV}"
>>
>>  inherit cmake
>>
>> --
>> 2.26.2
>>
>> 
