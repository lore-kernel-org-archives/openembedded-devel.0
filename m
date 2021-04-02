Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.12657.1617346347316369446
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 23:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ew4K9FxY;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id b7so6216405ejv.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FNNmSZhkGGR5G8hryEX3OusuE6TZP33kET9dwiuqsWI=;
        b=ew4K9FxYHY5+eAywn5fL/22wx8jcx+QJun9TjkaQJ7LZ5CWEoAeX0JUXjQEvfVIBhK
         WqAucDYI2UI1CY+6LDLhE8t4zkpSC/NIogGyDRWh0t6oZ2ySgZxGSZp9NEW1PREOYJWq
         Rbl9Hd8YHAWXuvq8SY6wm4Mf7L2DMVc8j9Ogu3ambYFJsKUY+e11rb1SwfIkYIfVr5zN
         aBzTFo3FPqbxjEA24rOTOr+eWDhmcBqpkuxrNSeoQh7xFVwudnQUFBFUnRwL0oCSXyu4
         bKPYhrd5fksBhgQJDPAcKZrMpwcaZdmeY1o07bNnE6+DQWuCQ6i5x+swsNYeR9+xGVcd
         iV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FNNmSZhkGGR5G8hryEX3OusuE6TZP33kET9dwiuqsWI=;
        b=rb0aW/lp23VbaAL+YOCp2w/Gptiy5okym9+swSlBVVtQb3YgjgF/FcE3U6qXIQXrC1
         aSSLwTqTWKAxKyULe6DpDe4r/TBtI05Z/wEw6tztqYipZTXhs9165XhWYBE3Sj5kHNDm
         52i1eZcG3aeWbfVke+ga5wbrR36ATnEtddSbz97DE7foFBxhjPHuKYvoCr6K+FIfjZZk
         w3JuaJJ+McMbFTaFQ1ldh9OgyLiWZpA2Y2ZO2Q1N4stPgEGQvC/AxBhgNOt1SufNzXDO
         BlgMt2aaJNRIr3hHXCDKtuuj8afpJMwAPeqBQz5U5VyatM2v+GNNEgbguOeOE+cP4KqA
         P2/g==
X-Gm-Message-State: AOAM533mXWNqn13djPkr6qXb1hJc3s5RUDUbW4xcpoDvfatPj6aSoKq0
	2uhdhCodCOea7ws3rgcQMcsWN3Io9+H9sZp1NoI=
X-Google-Smtp-Source: ABdhPJz/6UVrDpF3cKF7y/VHAePb3o42pitw51SeXRht3g90i9Q5M6rOJS5HzMcXRGM2pknqVvc9EYeGZTy6BduitW8=
X-Received: by 2002:a17:906:260a:: with SMTP id h10mr12877468ejc.392.1617346345171;
 Thu, 01 Apr 2021 23:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617328609.git.akuster808@gmail.com> <9336643e0270a851b2d5653bbc6570eac13da9e7.1617328609.git.akuster808@gmail.com>
In-Reply-To: <9336643e0270a851b2d5653bbc6570eac13da9e7.1617328609.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 2 Apr 2021 08:52:12 +0200
Message-ID: <CA+chaQcXL=CtcfZH3X0L2Jn2KSYNTh7oLrafO8NbPD-kUzLoOg@mail.gmail.com>
Subject: Re: [oe] [gatesgarth 14/14] python2-target-recipes-blacklist.inc: add and .inc file with conditional blacklist of target python2 recipes
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000061ff7705bef7ca81"

--00000000000061ff7705bef7ca81
Content-Type: text/plain; charset="UTF-8"

This was for meta-python2 and it's already merged there.  Please don't add
it to meta-oe.

On Fri, Apr 2, 2021 at 3:59 AM akuster <akuster808@gmail.com> wrote:

> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> * similarly like in hardknott branch where the PNBLACKLIST is added in
>   the recipes, for gatesgarth and dunfell branches I make it more
>   optional by using separate .inc file the distributions can decide to
>   include on their own (e.g. when they need python-native from here but
>   want to prevent someone accidentally depending on some target recipes
>   ending with python2 in their images).
>
>   commit 10c65fc18998d302f34634ffceaf31ab335056dd
>   Author: Martin Jansa <Martin.Jansa@gmail.com>
>   Date:   Fri Mar 12 15:44:52 2021 +0100
>
>     recipes: add conditional PNBLACKLIST in all recipes except
> python-native
>
>     * python-native is an exception because there is still e.g. chromium
> depending
>       on _native_ python and a lot of people use it in some form, once
>       https://bugs.chromium.org/p/chromium/issues/detail?id=942720
>       is resolved in stable chromium release the same will be set in
> python-native
>
>     * https://www.python.org/doc/sunset-python-2/
>     * https://python3statement.org/
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../python2-target-recipes-blacklist.inc      | 312 ++++++++++++++++++
>  1 file changed, 312 insertions(+)
>  create mode 100644
> conf/distro/include/python2-target-recipes-blacklist.inc
>
> diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc
> b/conf/distro/include/python2-target-recipes-blacklist.inc
> new file mode 100644
> index 00000000000..37eb49c5d91
> --- /dev/null
> +++ b/conf/distro/include/python2-target-recipes-blacklist.inc
> @@ -0,0 +1,312 @@
> +PNBLACKLIST[dnssec-conf] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[gateone] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[gyp-py2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[meta-python2-image-base.bb] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[meta-python2-image.bb] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[meta-python2-ptest-image.bb] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[packagegroup-meta-python2.bb] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-alembic] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-amqp] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-anyjson] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-appdirs] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-asn1crypto] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-astroid] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-atomicwrites] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-attr] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-attrs] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-automat] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-aws-iot-device-sdk-python] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-babel] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-backports-abc] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-backports-functools-lru-cache] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-backports-init] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-backports-ssl] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-bcrypt] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-beautifulsoup4] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-behave] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-bitarray] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-blinker] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-booleanpy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cachetools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-can] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-certifi] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cffi] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-chardet] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cheetah] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-click] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cmd2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-coloredlogs] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-configargparse] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-configparser] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-constantly] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-contextlib2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cpuset] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-crcmod] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cryptography] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cryptography-vectors] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cson] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-cython] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-daemon] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-daemonize] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-dateutil] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-dbus] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-dbusmock] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-decorator] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-deprecated] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-distutils-extra] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-django] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-djangorestframework] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-django-south] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-dnspython] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-docker] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-docker-pycreds] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-docutils] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-dominate] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-editor] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-engineio] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-enum34] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-epydoc] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-evdev] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-feedformatter] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-feedparser] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-babel] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-bcrypt] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-bootstrap] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-login] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-mail] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-migrate] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-nav] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-navigation] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-pymongo] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-restful] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-script] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-sijax] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-socketio] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-sqlalchemy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-uploads] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-user] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-wtf] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-flask-xstatic] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-funcsigs] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-functools32] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-future] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-futures] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-gdata] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-gevent] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-greenlet] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-grpcio] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-grpcio-tools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-gsocketpool] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-h2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-hpack] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-html5lib] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-humanfriendly] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-humanize] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-hyperframe] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-hyperlink] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-hypothesis] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-idna] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-imaging] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-importlib-metadata] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-incremental] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-inflection] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-intervals] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ipaddress] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ipy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-iso8601] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-isodate] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-isort] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-itsdangerous] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-javaobj-py3] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-jinja2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-jsmin] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-jsonpatch] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-jsonpointer] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-jsonref] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-jsonschema] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-kombu] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-lazy-object-proxy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ldap] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-license-expression] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-linecache2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-lockfile] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-lrparsing] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-lxml] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-m2crypto] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-mako] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-markupsafe] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-mccabe] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-mock] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-monotonic] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-more-itertools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-mprpc] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-msgpack] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ndg-httpsclient] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-netaddr] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-netifaces] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-networkmanager] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-networkx] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-numeric] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-packaging] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-paho-mqtt] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pam] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pamela] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-parse] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-parse-type] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-passlib] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-paste] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pathlib2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pbr] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pep8] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-periphery] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pexpect] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pika] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pint] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pip] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pluggy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ply] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pretend] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-prettytable] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-priority] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-progress] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-prompt-toolkit] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-protobuf] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-psutil] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ptyprocess] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-py] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyalsaaudio] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyasn1] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyasn1-modules] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pybind11] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pybluez] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pycodestyle] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyconnman] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pycparser] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pycrypto] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pycryptodomex] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pycurl] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pydbus] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyelftools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyephem] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyexpect] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyfirmata] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyflakes] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyflame] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pygobject] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pygpgme] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyhamcrest] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyiface] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyinotify] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyjks] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyjwt] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pylint] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pymisp] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pymongo] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pymysql] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pynetlinux] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyopenssl] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyparsing] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyparted] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyperclip] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyperf] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyrex] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyrex-native] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyro4] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyroute2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyrsistent] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyrtm] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyserial] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pysmi] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pysnmp] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pysocks] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pysqlite] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pystache] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytest] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytest-helpers-namespace] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytest-runner] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytest-tempdir] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytoml] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytun] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pytz] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyudev] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyusb] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pywbem] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyyaml] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-pyzmq] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-rdflib] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-redis] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-requests] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-requests-oauthlib] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-rfc3339-validator] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-rfc3986-validator] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-rfc3987] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-robotframework] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-robotframework-seriallibrary] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-scandir] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-scrypt] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-sdnotify] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-selectors34] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-semver] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-serpent] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-setuptools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-setuptools-scm] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-sh] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-sijax] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-simplejson] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-singledispatch] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-six] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-slip-dbus] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-smbus] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-snakefood] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-snimpy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-socketio] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-soupsieve] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-sparts] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-speaklater] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-sqlalchemy] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-sqlparse] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-statistics] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-stevedore] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-strict-rfc3339] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-subprocess32] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-systemd] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-thrift] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-toml] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-tornado] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-tornado-redis] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-tqdm] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-traceback2] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-twisted] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-twitter] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-twofish] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-txws] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-typing] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-tzlocal] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-ujson] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-unidiff] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-urllib3] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-vcversioner] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-versiontools] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-vine] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-visitor] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-vobject] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-waitress] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-wcwidth] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-webcolors] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-webdav] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-webencodings] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-websocket-client] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-werkzeug] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-which] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-whoosh] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-wrapt] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-wtforms] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-xlrd] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-xstatic] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-xstatic-font-awesome] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-yappi] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-zipp] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[python-zopeinterface] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> +PNBLACKLIST[telepathy-python] ?=
> "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2
> is out of support for long time, read
> https://www.python.org/doc/sunset-python-2/ https://python3statement.org/
> and if you really have to temporarily use this, then set
> I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
> --
> 2.17.1
>
>
> 
>
>

--00000000000061ff7705bef7ca81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was for meta-python2 and it&#39;s already merged ther=
e.=C2=A0 Please don&#39;t add it to meta-oe.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 2, 2021 at 3:59 AM =
akuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_bl=
ank">Martin.Jansa@gmail.com</a>&gt;<br>
<br>
* similarly like in hardknott branch where the PNBLACKLIST is added in<br>
=C2=A0 the recipes, for gatesgarth and dunfell branches I make it more<br>
=C2=A0 optional by using separate .inc file the distributions can decide t=
o<br>
=C2=A0 include on their own (e.g. when they need python-native from here b=
ut<br>
=C2=A0 want to prevent someone accidentally depending on some target recip=
es<br>
=C2=A0 ending with python2 in their images).<br>
<br>
=C2=A0 commit 10c65fc18998d302f34634ffceaf31ab335056dd<br>
=C2=A0 Author: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Fri Mar 12 15:44:52 2021 +0100<br>
<br>
=C2=A0 =C2=A0 recipes: add conditional PNBLACKLIST in all recipes except p=
ython-native<br>
<br>
=C2=A0 =C2=A0 * python-native is an exception because there is still e.g. =
chromium depending<br>
=C2=A0 =C2=A0 =C2=A0 on _native_ python and a lot of people use it in some=
 form, once<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://bugs.chromium.org/p/chromium/issue=
s/detail?id=3D942720" rel=3D"noreferrer" target=3D"_blank">https://bugs.chr=
omium.org/p/chromium/issues/detail?id=3D942720</a><br>
=C2=A0 =C2=A0 =C2=A0 is resolved in stable chromium release the same will =
be set in python-native<br>
<br>
=C2=A0 =C2=A0 * <a href=3D"https://www.python.org/doc/sunset-python-2/" re=
l=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sunset-python=
-2/</a><br>
=C2=A0 =C2=A0 * <a href=3D"https://python3statement.org/" rel=3D"noreferre=
r" target=3D"_blank">https://python3statement.org/</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python2-target-recipes-blacklist.inc=C2=A0 =C2=A0 =C2=A0 | 312 +=
+++++++++++++++++<br>
=C2=A01 file changed, 312 insertions(+)<br>
=C2=A0create mode 100644 conf/distro/include/python2-target-recipes-blackl=
ist.inc<br>
<br>
diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/co=
nf/distro/include/python2-target-recipes-blacklist.inc<br>
new file mode 100644<br>
index 00000000000..37eb49c5d91<br>
--- /dev/null<br>
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc<br>
@@ -0,0 +1,312 @@<br>
+PNBLACKLIST[dnssec-conf] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[gateone] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIGR=
ATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of supp=
ort for long time, read <a href=3D"https://www.python.org/doc/sunset-python=
-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sunset=
-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferrer"=
 target=3D"_blank">https://python3statement.org/</a> and if you really have=
 to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot;y=
es&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[gyp-py2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIGR=
ATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of supp=
ort for long time, read <a href=3D"https://www.python.org/doc/sunset-python=
-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sunset=
-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferrer"=
 target=3D"_blank">https://python3statement.org/</a> and if you really have=
 to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot;y=
es&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[<a href=3D"http://meta-python2-image-base.bb" rel=3D"noreferr=
er" target=3D"_blank">meta-python2-image-base.bb</a>] ?=3D &quot;${@bb.util=
s.contains(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#3=
9;, &#39;python2 is out of support for long time, read <a href=3D"https://w=
ww.python.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.python.org/doc/sunset-python-2/</a> <a href=3D"https://python3sta=
tement.org/" rel=3D"noreferrer" target=3D"_blank">https://python3statement.=
org/</a> and if you really have to temporarily use this, then set I_SWEAR_T=
O_MIGRATE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[<a href=3D"http://meta-python2-image.bb" rel=3D"noreferrer" t=
arget=3D"_blank">meta-python2-image.bb</a>] ?=3D &quot;${@bb.utils.contains=
(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;p=
ython2 is out of support for long time, read <a href=3D"https://www.python.=
org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.=
python.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org=
/" rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> a=
nd if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_=
TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[<a href=3D"http://meta-python2-ptest-image.bb" rel=3D"norefer=
rer" target=3D"_blank">meta-python2-ptest-image.bb</a>] ?=3D &quot;${@bb.ut=
ils.contains(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&=
#39;, &#39;python2 is out of support for long time, read <a href=3D"https:/=
/www.python.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">=
https://www.python.org/doc/sunset-python-2/</a> <a href=3D"https://python3s=
tatement.org/" rel=3D"noreferrer" target=3D"_blank">https://python3statemen=
t.org/</a> and if you really have to temporarily use this, then set I_SWEAR=
_TO_MIGRATE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[<a href=3D"http://packagegroup-meta-python2.bb" rel=3D"norefe=
rrer" target=3D"_blank">packagegroup-meta-python2.bb</a>] ?=3D &quot;${@bb.=
utils.contains(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39=
;&#39;, &#39;python2 is out of support for long time, read <a href=3D"https=
://www.python.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank=
">https://www.python.org/doc/sunset-python-2/</a> <a href=3D"https://python=
3statement.org/" rel=3D"noreferrer" target=3D"_blank">https://python3statem=
ent.org/</a> and if you really have to temporarily use this, then set I_SWE=
AR_TO_MIGRATE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MIGRA=
TE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of suppo=
rt for long time, read <a href=3D"https://www.python.org/doc/sunset-python-=
2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sunset-=
python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferrer" =
target=3D"_blank">https://python3statement.org/</a> and if you really have =
to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot;ye=
s&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-alembic] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-amqp] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-anyjson] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-appdirs] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-asn1crypto] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-astroid] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-atomicwrites] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-attr] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-attrs] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-automat] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-aws-iot-device-sdk-python] ?=3D &quot;${@bb.utils.cont=
ains(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#=
39;python2 is out of support for long time, read <a href=3D"https://www.pyt=
hon.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://=
www.python.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement=
.org/" rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</=
a> and if you really have to temporarily use this, then set I_SWEAR_TO_MIGR=
ATE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-babel] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-backports-abc] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-backports-functools-lru-cache] ?=3D &quot;${@bb.utils.=
contains(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;=
, &#39;python2 is out of support for long time, read <a href=3D"https://www=
.python.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">http=
s://www.python.org/doc/sunset-python-2/</a> <a href=3D"https://python3state=
ment.org/" rel=3D"noreferrer" target=3D"_blank">https://python3statement.or=
g/</a> and if you really have to temporarily use this, then set I_SWEAR_TO_=
MIGRATE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-backports-init] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-backports-ssl] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-bcrypt] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-beautifulsoup4] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-behave] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-bitarray] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-blinker] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-booleanpy] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cachetools] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-can] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-certifi] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cffi] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-chardet] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cheetah] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-click] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cmd2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-coloredlogs] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-configargparse] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-configparser] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-constantly] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-contextlib2] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cpuset] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-crcmod] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cryptography] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cryptography-vectors] ?=3D &quot;${@bb.utils.contains(=
&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;py=
thon2 is out of support for long time, read <a href=3D"https://www.python.o=
rg/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.p=
ython.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/=
" rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> an=
d if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_T=
O_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cson] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-cython] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-daemon] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-daemonize] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-dateutil] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-dbus] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-dbusmock] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-decorator] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-deprecated] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-distutils-extra] ?=3D &quot;${@bb.utils.contains(&#39;=
I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2=
 is out of support for long time, read <a href=3D"https://www.python.org/do=
c/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python=
.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-django] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-djangorestframework] ?=3D &quot;${@bb.utils.contains(&=
#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pyt=
hon2 is out of support for long time, read <a href=3D"https://www.python.or=
g/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.py=
thon.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/"=
 rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and=
 if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO=
_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-django-south] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-dnspython] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-docker] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-docker-pycreds] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-docutils] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-dominate] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-editor] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-engineio] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-enum34] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-epydoc] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-evdev] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-feedformatter] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-feedparser] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-babel] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-bcrypt] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-bootstrap] ?=3D &quot;${@bb.utils.contains(&#39;=
I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2=
 is out of support for long time, read <a href=3D"https://www.python.org/do=
c/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python=
.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-login] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-mail] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-migrate] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-nav] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-navigation] ?=3D &quot;${@bb.utils.contains(&#39=
;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python=
2 is out of support for long time, read <a href=3D"https://www.python.org/d=
oc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pytho=
n.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" re=
l=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-pymongo] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-restful] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-script] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-sijax] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-socketio] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-sqlalchemy] ?=3D &quot;${@bb.utils.contains(&#39=
;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python=
2 is out of support for long time, read <a href=3D"https://www.python.org/d=
oc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pytho=
n.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" re=
l=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-uploads] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-user] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-wtf] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-flask-xstatic] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-funcsigs] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-functools32] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-future] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-futures] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-gdata] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-gevent] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-greenlet] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-grpcio] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-grpcio-tools] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-gsocketpool] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-h2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MI=
GRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of su=
pport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyth=
on-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/suns=
et-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferre=
r" target=3D"_blank">https://python3statement.org/</a> and if you really ha=
ve to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot=
;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-hpack] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-html5lib] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-humanfriendly] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-humanize] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-hyperframe] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-hyperlink] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-hypothesis] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-idna] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-imaging] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-importlib-metadata] ?=3D &quot;${@bb.utils.contains(&#=
39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pyth=
on2 is out of support for long time, read <a href=3D"https://www.python.org=
/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pyt=
hon.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" =
rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and =
if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_=
PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-incremental] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-inflection] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-intervals] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ipaddress] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ipy] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-iso8601] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-isodate] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-isort] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-itsdangerous] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-javaobj-py3] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-jinja2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-jsmin] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-jsonpatch] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-jsonpointer] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-jsonref] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-jsonschema] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-kombu] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-lazy-object-proxy] ?=3D &quot;${@bb.utils.contains(&#3=
9;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pytho=
n2 is out of support for long time, read <a href=3D"https://www.python.org/=
doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pyth=
on.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" r=
el=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and i=
f you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_P=
YTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ldap] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-license-expression] ?=3D &quot;${@bb.utils.contains(&#=
39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pyth=
on2 is out of support for long time, read <a href=3D"https://www.python.org=
/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pyt=
hon.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" =
rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and =
if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_=
PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-linecache2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-lockfile] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-lrparsing] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-lxml] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-m2crypto] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-mako] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-markupsafe] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-mccabe] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-mock] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-monotonic] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-more-itertools] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-mprpc] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-msgpack] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ndg-httpsclient] ?=3D &quot;${@bb.utils.contains(&#39;=
I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2=
 is out of support for long time, read <a href=3D"https://www.python.org/do=
c/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python=
.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-netaddr] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-netifaces] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-networkmanager] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-networkx] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-numeric] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-packaging] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-paho-mqtt] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pam] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pamela] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-parse] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-parse-type] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-passlib] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-paste] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pathlib2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pbr] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pep8] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-periphery] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pexpect] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pika] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pint] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pip] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pluggy] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ply] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pretend] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-prettytable] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-priority] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-progress] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-prompt-toolkit] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-protobuf] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-psutil] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ptyprocess] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-py] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MI=
GRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of su=
pport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyth=
on-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/suns=
et-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferre=
r" target=3D"_blank">https://python3statement.org/</a> and if you really ha=
ve to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot=
;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyalsaaudio] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyasn1] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyasn1-modules] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pybind11] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pybluez] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pycodestyle] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyconnman] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pycparser] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pycrypto] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pycryptodomex] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pycurl] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pydbus] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyelftools] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyephem] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyexpect] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyfirmata] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyflakes] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyflame] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pygobject] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pygpgme] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyhamcrest] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyiface] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyinotify] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyjks] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyjwt] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pylint] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pymisp] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pymongo] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pymysql] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pynetlinux] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyopenssl] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyparsing] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyparted] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyperclip] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyperf] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyrex] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyrex-native] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyro4] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyroute2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyrsistent] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyrtm] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyserial] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pysmi] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pysnmp] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pysocks] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pysqlite] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pystache] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytest] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytest-helpers-namespace] ?=3D &quot;${@bb.utils.conta=
ins(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#3=
9;python2 is out of support for long time, read <a href=3D"https://www.pyth=
on.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.python.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.=
org/" rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a=
> and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRA=
TE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytest-runner] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytest-tempdir] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytoml] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytun] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pytz] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyudev] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyusb] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pywbem] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyyaml] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-pyzmq] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-rdflib] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-redis] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-requests] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-requests-oauthlib] ?=3D &quot;${@bb.utils.contains(&#3=
9;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pytho=
n2 is out of support for long time, read <a href=3D"https://www.python.org/=
doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pyth=
on.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" r=
el=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and i=
f you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_P=
YTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-rfc3339-validator] ?=3D &quot;${@bb.utils.contains(&#3=
9;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pytho=
n2 is out of support for long time, read <a href=3D"https://www.python.org/=
doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pyth=
on.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" r=
el=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and i=
f you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_P=
YTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-rfc3986-validator] ?=3D &quot;${@bb.utils.contains(&#3=
9;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;pytho=
n2 is out of support for long time, read <a href=3D"https://www.python.org/=
doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pyth=
on.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" r=
el=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and i=
f you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_P=
YTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-rfc3987] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-robotframework] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-robotframework-seriallibrary] ?=3D &quot;${@bb.utils.c=
ontains(&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;,=
 &#39;python2 is out of support for long time, read <a href=3D"https://www.=
python.org/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https=
://www.python.org/doc/sunset-python-2/</a> <a href=3D"https://python3statem=
ent.org/" rel=3D"noreferrer" target=3D"_blank">https://python3statement.org=
/</a> and if you really have to temporarily use this, then set I_SWEAR_TO_M=
IGRATE_TO_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-scandir] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-scrypt] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-sdnotify] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-selectors34] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-semver] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-serpent] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-setuptools] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-setuptools-scm] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-sh] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_MI=
GRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of su=
pport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyth=
on-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/suns=
et-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferre=
r" target=3D"_blank">https://python3statement.org/</a> and if you really ha=
ve to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quot=
;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-sijax] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-simplejson] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-singledispatch] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-six] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_M=
IGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of s=
upport for long time, read <a href=3D"https://www.python.org/doc/sunset-pyt=
hon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/sun=
set-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noreferr=
er" target=3D"_blank">https://python3statement.org/</a> and if you really h=
ave to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &quo=
t;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-slip-dbus] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-smbus] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-snakefood] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-snimpy] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-socketio] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-soupsieve] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-sparts] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-speaklater] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-sqlalchemy] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-sqlparse] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-statistics] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-stevedore] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-strict-rfc3339] ?=3D &quot;${@bb.utils.contains(&#39;I=
_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 =
is out of support for long time, read <a href=3D"https://www.python.org/doc=
/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.=
org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-subprocess32] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-systemd] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-thrift] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-toml] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-tornado] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-tornado-redis] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-tqdm] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-traceback2] ?=3D &quot;${@bb.utils.contains(&#39;I_SWE=
AR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is o=
ut of support for long time, read <a href=3D"https://www.python.org/doc/sun=
set-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://python3statement.org/</a> and if you r=
eally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 =
to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-twisted] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-twitter] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-twofish] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-txws] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-typing] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-tzlocal] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-ujson] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-unidiff] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-urllib3] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-vcversioner] ?=3D &quot;${@bb.utils.contains(&#39;I_SW=
EAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is =
out of support for long time, read <a href=3D"https://www.python.org/doc/su=
nset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org=
/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"=
noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you =
really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3=
 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-versiontools] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-vine] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-visitor] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-vobject] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-waitress] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-wcwidth] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-webcolors] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-webdav] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-webencodings] ?=3D &quot;${@bb.utils.contains(&#39;I_S=
WEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is=
 out of support for long time, read <a href=3D"https://www.python.org/doc/s=
unset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.or=
g/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D=
"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if you=
 really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON=
3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-websocket-client] ?=3D &quot;${@bb.utils.contains(&#39=
;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python=
2 is out of support for long time, read <a href=3D"https://www.python.org/d=
oc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.pytho=
n.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" re=
l=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-werkzeug] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR=
_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out=
 of support for long time, read <a href=3D"https://www.python.org/doc/sunse=
t-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/do=
c/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://python3statement.org/</a> and if you rea=
lly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to=
 &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-which] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-whoosh] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_T=
O_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out o=
f support for long time, read <a href=3D"https://www.python.org/doc/sunset-=
python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/=
sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"noref=
errer" target=3D"_blank">https://python3statement.org/</a> and if you reall=
y have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &=
quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-wrapt] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-wtforms] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-xlrd] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-xstatic] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_=
TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out =
of support for long time, read <a href=3D"https://www.python.org/doc/sunset=
-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc=
/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://python3statement.org/</a> and if you real=
ly have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to =
&quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-xstatic-font-awesome] ?=3D &quot;${@bb.utils.contains(=
&#39;I_SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;py=
thon2 is out of support for long time, read <a href=3D"https://www.python.o=
rg/doc/sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.p=
ython.org/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/=
" rel=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> an=
d if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_T=
O_PYTHON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-yappi] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO=
_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of=
 support for long time, read <a href=3D"https://www.python.org/doc/sunset-p=
ython-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/s=
unset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://python3statement.org/</a> and if you really=
 have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &q=
uot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-zipp] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEAR_TO_=
MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is out of =
support for long time, read <a href=3D"https://www.python.org/doc/sunset-py=
thon-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/doc/su=
nset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"norefer=
rer" target=3D"_blank">https://python3statement.org/</a> and if you really =
have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to &qu=
ot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[python-zopeinterface] ?=3D &quot;${@bb.utils.contains(&#39;I_=
SWEAR_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 i=
s out of support for long time, read <a href=3D"https://www.python.org/doc/=
sunset-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.o=
rg/doc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=
=3D"noreferrer" target=3D"_blank">https://python3statement.org/</a> and if=
 you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PY=
THON3 to &quot;yes&quot;&#39;, d)}&quot;<br>
+PNBLACKLIST[telepathy-python] ?=3D &quot;${@bb.utils.contains(&#39;I_SWEA=
R_TO_MIGRATE_TO_PYTHON3&#39;, &#39;yes&#39;, &#39;&#39;, &#39;python2 is ou=
t of support for long time, read <a href=3D"https://www.python.org/doc/suns=
et-python-2/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/d=
oc/sunset-python-2/</a> <a href=3D"https://python3statement.org/" rel=3D"no=
referrer" target=3D"_blank">https://python3statement.org/</a> and if you re=
ally have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 t=
o &quot;yes&quot;&#39;, d)}&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000061ff7705bef7ca81--
