Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.15277.1604944008170674291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GrqS5yfL;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id dj6so4470233qvb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YccDkiJloLfoNvfHuGjmgFmgDzm6c4/oWBllSnctdgw=;
        b=GrqS5yfLd1psiiXo7z7gXtnB+n7jZdg0Tc6LL7P5Ki1ji6gkQqp/W6dkUzeLr3/FM8
         zpQ9wD1Lg+nXqGuGtzEBzqsvCX/VhIQKVlxSZRjsB3JIiVGtZKg1g00Ktb+id8NBspZt
         SsN/TKM/+idOD5vFHyTTPH8fyh/EJYpxFtUG+VEU4wZMZJ855J1+tH5ngnTzlSzLWXOs
         hwaa4ABOsIUePD07JbEX4X1nGiKU4029FA4bl76PpH1JLiT9/fz7ucJF9Xgdl/vdlhL2
         KSBunTNqnbYWQ2QkikvUn2+AOiGLrs09zVzqUnML/Mz6fSkmY8eEj2EGN+nTSHBwATJJ
         ZfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YccDkiJloLfoNvfHuGjmgFmgDzm6c4/oWBllSnctdgw=;
        b=Oe3u6nxkBF36JDZFQi7pP0FHlR/ookV4uDm9R0bZAECP793VyO9g88LMIjQfAEnlaU
         mnQCF+Fo3q1DfBZETpdfHVfzxCIs9JhnYySLQ4PnBCFcnSxSmMdOwR8SvWS/MaphAy0n
         XuPmnmgQbZOnBy0GUxtBT4Ju5kJs3c1Q5EUTmZrpb5K2tACrjbY0jkNluZsrxsAX3P1A
         1Y6oEhQ3ZGMqO9HkQoFz0mkkmVHrs94Q1b1rThv25IMT6cSch0XDmAELvvPbeRA9ZAnH
         49gXofsmwQAyqp8StO5fq+tj17F3NZcDwM+4fbugWjIBteKwxsXf4icdu5iP/yA8eKt4
         2G1Q==
X-Gm-Message-State: AOAM5321x+wXS/HD8xhbrEGEUnPvWkQxDjNl8uRaDKZY8cMtoUND1Glb
	3E4pln0Tz/cy+3qNS+ELXw9KD3JPFNqDAAydD88=
X-Google-Smtp-Source: ABdhPJxGU+jv1lC44Bd4SWZT9Kf+v4WsQ+PqkLXyHf4yD1H3yH8Et1eQl42rJ+ViJ4j+oRXIYwtT7+IM+c2bSknv7cQ=
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr14820536qvf.8.1604944007202;
 Mon, 09 Nov 2020 09:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20201109165515.15900-1-greg@gpanders.com>
In-Reply-To: <20201109165515.15900-1-greg@gpanders.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 09:46:21 -0800
Message-ID: <CAMKF1sp3SgdAgWjbShceTAOtVg4=GscHV-2DsJmKiKkyQUHJxg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] Add python3-cvxopt
To: Gregory Anders <greg@gpanders.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

also add it to meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
as well.

On Mon, Nov 9, 2020 at 8:55 AM Gregory Anders <greg@gpanders.com> wrote:
>
> ---
> This depends on the SuiteSparse sparse matrix library, which I've also
> submitted a patch for.
>
>  .../python/python3-cvxopt_1.2.5.bb            | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> new file mode 100644
> index 000000000..7d01b22a1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Convex optimization package"
> +HOMEPAGE = "http://cvxopt.org"
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
> +
> +SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
> +
> +SRCREV = "1.2.5"
> +PV = "${SRCREV}"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "lapack suitesparse"
> +DEPENDS += "lapack suitesparse"
> +
> +inherit setuptools3
> +
> +export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
> --
> 2.29.2
>
>
> 
>
