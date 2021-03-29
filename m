Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.17987.1616999376730359335
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 23:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cCh86W1U;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id o5so11515061qkb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 23:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/PBFWdzuhFZVtPD+OAdo/9P73WVqjs0v8e2t0Df028=;
        b=cCh86W1U9Q948y9Jm1y8z+WmQu2N4cUqJ1KfZjxueG9ujgqX/TxsD297WGhY9nSAzd
         XUmvTX4cnIXCxjX0DRTIjoRQZ3fmFz/EBdGgWjzeWjH/YZFaEjvLZhlzLmaQk92JicK0
         lWXsTPPhpblBQGIzaSOpIdBgIcg2t1/xNzOyQTtbCb2ogBhufiLNr3Kl+v3N5qy4EtJh
         ASTZIpbfux7leBobUW7Opmjrroua6bKPtwJGGOujtGAKP+HJXySlfdgZP6Jx0Kb2vjFl
         wl5PVjrSHEfSWguvkxP2gmgYILBbmpPHRla4O6QVidAeEHZhSLqMmv2AwfGzWx30TN+2
         /IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/PBFWdzuhFZVtPD+OAdo/9P73WVqjs0v8e2t0Df028=;
        b=rUZH02UVjNJPm7xo0ostOv/mTA9XDxsIuYkaePKXuMnz1oRPOBThc+VoJbyHP6F+Bg
         TmRpr3Q84Tzn9ZwgOpjwQWEYKaftHjQOhupGj4heEP2jYcJ/154PEJdaRk3ONnPtYBgC
         Nmua9gsvhGZLcnRKWzfdf4/pla+xxaG81wm/k+YQnXe521U027XiTpxScPs3thp6m1Kd
         LQJqOJAtW4S0H0quuR18S29iFE3Q8YIIaRn2Nuur/U4ByXJSPxWth6Mmqm6spxxWqe1p
         SOhgCQl1ArR8XSySXzsMdlc837CGdZOsshGhG+3+Qp4C6MB61k0bjhi0Bpl2xL1EtpYV
         OVaQ==
X-Gm-Message-State: AOAM5334eKLQJZ0Jrqz8Z+Z5bXztFMHw29ZWj83ODdblh7VIjmx/qtwy
	Bun1yxVgt3retl7QwOODMMQajNQckw04bTNry6g=
X-Google-Smtp-Source: ABdhPJydLIPcjDAk3/ESqR/7wkF0dRxofmpJVIsw1dq0l57xnPJ1hXLgrul3gJFzfdvIvtHQqSk/O1V4Du/oQvXIKmk=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr23689288qkl.125.1616999375802;
 Sun, 28 Mar 2021 23:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210329040439.2600056-1-bgampe@digi.com> <20210329040439.2600056-5-bgampe@digi.com>
In-Reply-To: <20210329040439.2600056-5-bgampe@digi.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Mar 2021 23:29:09 -0700
Message-ID: <CAMKF1srPdXsLEYXJWfy7mU5nFmwnNA10vT0hER0C=JQq7GVadA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3 5/5] python3-uvicorn: new package
To: bgampe@digi.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seeing these errors

ERROR: Nothing RPROVIDES 'python3-typing' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb,
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-typing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-typing']
NOTE: Runtime target 'python3-uvicorn-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-uvicorn-dev',
'python3-typing']
ERROR: Nothing RPROVIDES 'python3-uvicorn' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-uvicorn'
NOTE: Runtime target 'python3-uvicorn' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-uvicorn']
ERROR: Nothing RPROVIDES 'python3-pydantic' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb,
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-pydantic'
NOTE: Runtime target 'python3-pydantic' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pydantic']
ERROR: Nothing RPROVIDES 'python3-pydantic-dev' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-pydantic-dev'
NOTE: Runtime target 'python3-pydantic-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pydantic-dev']
ERROR: Nothing RPROVIDES 'python3-fastapi-dev' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-fastapi-dev'
NOTE: Runtime target 'python3-fastapi-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-fastapi-dev']
ERROR: Nothing RPROVIDES 'python3-fastapi' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-fastapi'
NOTE: Runtime target 'python3-fastapi' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-fastapi'

On Sun, Mar 28, 2021 at 9:07 PM Ben Gampe via lists.openembedded.org
<bgampe=digi.com@lists.openembedded.org> wrote:
>
> From: Ben Gampe <bgampe@digi.com>
>
> Add recipe for python3-uvicorn: a lightning-fast ASGI server
>
> Signed-off-by: Ben Gampe <bgampe@digi.com>
> ---
>  .../packagegroups/packagegroup-meta-python.bb   |  1 +
>  .../python/python3-uvicorn_0.13.4.bb            | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index bf270df46..45f93b6dd 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-unidiff \
>      python3-uritemplate \
>      python3-urllib3 \
> +    python3-uvicorn \
>      python3-uvloop \
>      python3-vcversioner \
>      python3-versiontools \
> diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
> new file mode 100644
> index 000000000..e04dac0a1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "The lightning-fast ASGI server"
> +HOMEPAGE = "https://www.uvicorn.org/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=206119e27d6b034e7ce70d73063c82a8"
> +RDEPENDS_${PN} = "\
> +    python3-click \
> +    python3-h11 \
> +    python3-httptools \
> +    python3-typing \
> +    python3-uvloop \
> +    python3-websockets \
> +    python3-wsproto \
> +"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "3292251b3c7978e8e4a7868f4baf7f7f7bb7e40c759ecc125c37e99cdea34202"
> --
> 2.25.1
>
>
> 
>
