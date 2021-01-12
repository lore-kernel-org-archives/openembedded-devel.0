Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.11958.1610470671464183285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LjfDG9Ub;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jx16so4473488ejb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 08:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ppCcHhTtxXdjkSts/M1aAHmtudPQhA+vYzpspEDP4mc=;
        b=LjfDG9UbrnVr0nbi/M0ZYya77K3GmnC6ASH0D66YzgDse+LGe2CmR85AG/JMkcyOVx
         7/rGxhprBLOhGZNx3xwTR+/Mbj9gORv0zEFnWNZI1STxiOASid9HuoUa5bMayegiuoN+
         3PpDGhcIjEN5mSwHEdg9ZMhTZo9m2rPyJ7MkEKs9ovNHuFPcMPASTyydw1ynsgQvcFzG
         WcrgntJz26FwXNACkPW2x+6AOxPFgSN7zFQsPM29vUQtR9hAxH36FtT4UoQtg94d8O7m
         XUEyjIDoQveso6lA99vuPYZXQvl15ydftfLKzeRsMyqXqZbGRZDS6Iitc5+vfuOZCbjT
         2aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ppCcHhTtxXdjkSts/M1aAHmtudPQhA+vYzpspEDP4mc=;
        b=ALB1J0VH2JLNzdmWnT+OQKgEUAAE4PnceZ9OR5GCOJkS8iliBTSJXQcxgSs/ITHQyM
         1WZbttyIAHwRpGss4Pp6GtUwJbxX3eZcqpqO6wz4uHORELYHU43N6dLO7h1Ag2qNikVD
         59fTZPwpcAbJNx1gh/jd0H4iKdZs5BRCUjiTbsa0/8ndDL8+J3dj8zPb6FfvLqOfxxmR
         OyJHJgwN7kXU4/SDduY5aYBxqKMnNJES5k1coKjFSgQ7dkq9u2gmcG9BiijXC7Z1p9Pg
         TlO2IO0fwc08UUn21s9zKkBqgXVMC9qWZEraHiKG0pHHxVWaUkIYjTSbYbPJcus2KWl3
         Lw+Q==
X-Gm-Message-State: AOAM533derUXeGZtk2qgv7HS4KVQjt7K5wv72K8NPKBsk90vXpvbplzU
	2KXLKYhveeSzMBuzFBAjvUovi+PYVmhx2HGs/Vs=
X-Google-Smtp-Source: ABdhPJz7o8lt/FDJ65qicwOZa0EErvYyc9l8dvtMkzKw1nrdRyNgnvdJEUUJL4ziJlv4gGTtDfTYlwE3w8vnPni2xLE=
X-Received: by 2002:a17:906:a015:: with SMTP id p21mr4049418ejy.49.1610470669918;
 Tue, 12 Jan 2021 08:57:49 -0800 (PST)
MIME-Version: 1.0
References: <Tx4I.1610465744315911278.fazH@lists.openembedded.org> <042511c7-8ad2-fa6d-2f55-bee8eb7cba7a@embed.me.uk>
In-Reply-To: <042511c7-8ad2-fa6d-2f55-bee8eb7cba7a@embed.me.uk>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Tue, 12 Jan 2021 17:57:38 +0100
Message-ID: <CAAfyv34pbPebD9BVUTbsGcQnRTGS68sVZXFOUFuXsJCVzBXv1Q@mail.gmail.com>
Subject: Re: [oe] Yocto recipe for scikit-learn
To: Jack Mitchell <ml@embed.me.uk>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jan 12, 2021 at 5:41 PM Jack Mitchell <ml@embed.me.uk> wrote:
>
> On 12/01/2021 15:35, kodali13451@gmail.com wrote:
> > I am trying to create a `yocto` `recipe` for `scikit-learn` package. It
> > depends on `scipy` pacakge. I was able to successfully build the `scipy`
> > package using : https://github.com/gpanders/meta-scipy
> > <https://github.com/gpanders/meta-scipy>.
> >
> > When I run `bitbake python3-scikit-learn`, i am getting the below error:
> > `ModuleNotFoundError: No module named 'scipy'`
> >
> > I am executing the commands in the below order.
> >
> > Once I have cloned/copied the `scipy` recipes and the patches listed in
> > the `meta-scipy`, i am running `bitbake python3-scipy` and the build was
> > successful.
> >
> > Then, I created a `recipe` file with the name
> > `python3-scikit-learn_0.23.2.bb
> > <http://python3-scikit-learn_0.23.2.bb/>` and the contents are as below.
> >
> > ```
> > PYPI_PACKAGE = "scikit-learn"
> >
> > LICENSE = "BSD"
> > LIC_FILES_CHKSUM  =
> > "file://PKG-INFO;beginline=8;endline=8;md5=40ee42dc5a49f1617c5c78f16c50e065"
> >
> > SRC_URI[sha256sum] =
> > "20766f515e6cd6f954554387dfae705d93c7b544ec0e6c6a5d8e006f6f7ef480"
> >
> > inherit pypi setuptools3
> >
> > #DEPENDS = "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
> > ${PYTHON_PN}-scipy ${PYTHON_PN}-joblib ${PYTHON_PN}"
> > DEPENDS = "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
> > ${PYTHON_PN}-scipy ${PYTHON_PN}"
> >
> > RDEPENDS_${PN} += "${PYTHON_PN}-numpy ${PYTHON_PN}-scipy"
> > ```
> >
> > When I run the `bitbake python3-scikit-learn`, i am getting this
> > `ModuleNotFoundError: No module named 'scipy'`
> >
> > Checked the path where the `devshell python3` is looking
> > (`poky/build/tmp-glibc/work/aarch64-oe-linux/python3-scikit-learn/0.23.2-r0/recipe-sysroot-native/usr/lib/python3.8/site-packages`),
> > and i can only see the `numpy` package there, but `scipy` package is not
> > there.
> >
> > `ls` command output :
> > ```easy_install.py
> >  numpy
> >  numpy-1.17.4-py3.8.egg-info
> >  pkg_resources
> >  __pycache__
> >  README.txt
> >  setuptools
> >  setuptools-45.2.0-py3.8.egg-info
> > ```
> >
> > Can someone point me on how to include the `python3-scipy` package, so
> > that it will be included/copied to the `devshell`. Or do I need to
> > update/fix something else.
> >
> > Appreciate any guidance on this.
> >
>
> I'm also working on a scikit-learn recipe, you need to create a recipe
> to provide python3-scipy-native as it uses this during the build
> process. However, even with this recipe in place and scikit-learn
> building, the resulting packages doesn't work due to inconsistencies in
> the build, with the most obvious failure looking like a 64bit -> 32bit
> compile error from using the native include headers in cython generated
> files. I'm still looking into this but if anybody else has managed to
> get this compiled properly I would also be interested in hearing about it.
Same here, I didn't manage to make a proper recipe in yocto. Some
advice I get on github:
https://github.com/scikit-learn/scikit-learn/issues/19037
>
> Regards,
> Jack.
>
> --
> Jack Mitchell, Consultant
> https://www.tuxable.co.uk
>
> 
>
BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
