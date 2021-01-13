Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.409.1610561827114085608
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 10:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o+MymYBC;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id d11so1187491qvo.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Jan 2021 10:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FtHdJ/B59bPZicFZln9KZ7t7Obvp33sTzPxdXGIGUIw=;
        b=o+MymYBC8KMPVDNBDTy8xGolE5Lw5gM2I8qJn4cFSYvIAbQX0zT9Kp5FEqdJD4rbR0
         mei6lqlWpiSAH5udoOadjDA44JrsO5JHfIR+lqH83gt5R7NsPl9S4QVrN5nPpmq/y0Sl
         XozQgRwKm7yKLgvxoqNSkRX5sl2DgXRC5QP18yLnO4GykARKOuhNRf8sqSfcLeOeEVul
         nB4mlc8esj+UNsaG8BY5YVDUFQWoKeigvsQAzbH02bfSauhbiTcV/vTsPuAzbTP6FmIR
         W1wVwi6jDrmucH6wlSZ4t89hW1cg0cn/G2eG1XMBorvcYm8lHjPAuA96MOBGi7eD1mVV
         9NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtHdJ/B59bPZicFZln9KZ7t7Obvp33sTzPxdXGIGUIw=;
        b=aPx1Gg9wXJB4uOmg/R0K+ica7MGOzyABEBW9a3azEhaZQ4KgrbY8bKZNrHOVGREh5S
         s8WaVW6pAwpCZ4Wtcdyzq6h7+D0j/YsFX31UO1T8DEZWU0vm4OXFWm5xD7CQJVXxqJHV
         m9qjlzkksWh+AerPfHnz7iIJz2XzFZ+VmQGoxRqN6SnjjF1JVnyQ1JYqqs8wh+a/NDiX
         UH7v8EX28PlwJUWqHzUeov585J0+qg5LrEVARBP7FTXPmYVIFHTCAU8D0/jaTFq0iVqt
         JphYoVjuhmWtz6zBilulBfiNeWOpIlPdx+3miMnnQQYmA/gEi3lcV976fKzK+cHXtD+2
         bqEw==
X-Gm-Message-State: AOAM531DGZMLqTGxPJKkoAWkm+U8IpAzAMg5bXdYL7nGlIGIZfZKGq+a
	DkBPK8VKUDjM3p6EKQyZDWwtBxSZkdp3EAidxm0=
X-Google-Smtp-Source: ABdhPJweL5ZLsKB/htbIzN079OehPtNDdPOhGa9Hyr0h7R5twbsWCR1A3sS9CB212F4rofpiAHsGgiuFD6jApSNkAj4=
X-Received: by 2002:a0c:c688:: with SMTP id d8mr3522188qvj.8.1610561826142;
 Wed, 13 Jan 2021 10:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20210113031744.2245509-1-andrew@aj.id.au> <CAMKF1spY5Q-q15JUrVmdz28cQqncynzOWEfE=17dKt2ZRvPk1w@mail.gmail.com>
In-Reply-To: <CAMKF1spY5Q-q15JUrVmdz28cQqncynzOWEfE=17dKt2ZRvPk1w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 13 Jan 2021 10:16:40 -0800
Message-ID: <CAMKF1spPBxUOFbzdv7Hx7xX9XXS5Z16A0=xA20nF07qVrEtR-g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] meta-python: Add hexdump package
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

also fails in package task
https://errors.yoctoproject.org/Errors/Details/540931/

On Tue, Jan 12, 2021 at 7:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Please add it in packagegroup-meta-python as well
>
> On Tue, Jan 12, 2021 at 7:18 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> The hexdump package appears to be abandoned, but it's used as the
>> dependency of another project I'm packaging.
>>
>> Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  .../python/python3-hexdump_3.3.bb             | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
>> new file mode 100644
>> index 000000000000..eb4bf994d4f4
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "view/edit your binary with any text editor"
>> +
>> +# The homepage listed on pypi is [1] but the repository has been removed.
>> +# Instead, set the homepage to pypi.
>> +#
>> +# [1] https://bitbucket.org/techtonik/hexdump/
>> +HOMEPAGE = "https://pypi.org/project/hexdump/"
>> +
>> +LICENSE = "PD"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
>> +
>> +PYPI_PACKAGE_EXT = "zip"
>> +
>> +inherit pypi distutils3
>> +
>> +SRC_URI[sha256sum] = "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
>> +
>> +S = "${WORKDIR}"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.27.0
>>
>>
>> 
>>
