Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.3175.1610572729089884787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 13:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VkevjIXd;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id q22so5152591eja.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Jan 2021 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cI2XPHgszISm6T2QzQZ2Tfm1nqMxmN/rvMZILAYbRVE=;
        b=VkevjIXd7PUsazvtBkqGEjdOtTN/4PbpbeD5HM66PG50uYWpyP6MeCAwYZlz9UByWL
         HM9ZrNz+kDt9kDC3MDmdr2JNQ2jAEMFGDj0RNPURGUCull3QLboC+t+y+f7Nf2XCSrhX
         QDR0hdkWlTM3sIzfRtKeQwL3viCAuxbslc3OFGVN/TPWR8fMNyuqzuCPKhweA3cUM9xT
         TQrHIv1JntIx8CychUvPhr3FbZr6YeRcO5FaixV7NwK6KHrESw/W6tP6QWs9Z5UlG/SL
         gCf4VZpo/lfYoAUsYn193MEaMDGFL/s6QipSIcmEv7HfqTxCwrbWrUl6tttw0K5Q6wer
         Pj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cI2XPHgszISm6T2QzQZ2Tfm1nqMxmN/rvMZILAYbRVE=;
        b=MrcnbMoMvwCe55Njs04oI3ITWQyuN0WJQO+tkw+2bm932EMlQn/WOY7hwraUhdBjhh
         6YXItc0t4uUrR/EEcxR0/bXNk8nQ3J2Y9u11vlxo00AlW/gpy7gW1ogQ5chuKKxDB5CX
         fB9u2Zf3Cb3eUfq4bXirWrl0YNyC3Pa+oyFviqq9vOP7Z+r9XL53iP3MFFeCpcE8wmil
         zgidS3tXU8ncKlcgRnf/aNS+l4g5fBSt9rC+agvQeH6HEhP1cJLPulkOKrYgczEZag9O
         SEScT7y35iKkmbIkc6E+SbOteim6WxMpKBuNpTHthJuvQrWqHmeUEfFSfX4k/dUEeJak
         M3xw==
X-Gm-Message-State: AOAM530D2/RLUTd0XBuDi5Wqsw7LvuxlJ3K8g6yM4Q3xJZJKpZcsk6/G
	WiIOl3l6VM/Oo8LveUiWBh5OLq8vQLSIQQKKSLA=
X-Google-Smtp-Source: ABdhPJx2EcdPvg2+cA94PK5+zZAU0rhf/QubC7GWI8Lp2Losuz+iI3W//0c/dMVUwcUjtRBu08wkjLB2qa8x1vxpebA=
X-Received: by 2002:a17:906:a015:: with SMTP id p21mr3120021ejy.49.1610572727390;
 Wed, 13 Jan 2021 13:18:47 -0800 (PST)
MIME-Version: 1.0
References: <Tx4I.1610465744315911278.fazH@lists.openembedded.org>
 <042511c7-8ad2-fa6d-2f55-bee8eb7cba7a@embed.me.uk> <CAAfyv34pbPebD9BVUTbsGcQnRTGS68sVZXFOUFuXsJCVzBXv1Q@mail.gmail.com>
 <5cd73e00-fc8f-0bb2-8985-824ae53e2083@embed.me.uk>
In-Reply-To: <5cd73e00-fc8f-0bb2-8985-824ae53e2083@embed.me.uk>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Wed, 13 Jan 2021 22:18:36 +0100
Message-ID: <CAAfyv34XLLtHh6bgR2jA9+thfNB4mk5JYP8TVZ2DT1UGa6-JsA@mail.gmail.com>
Subject: Re: [oe] Yocto recipe for scikit-learn
To: Jack Mitchell <ml@embed.me.uk>
Cc: kodali13451@gmail.com, 
	OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jack,

On Wed, Jan 13, 2021 at 1:02 PM Jack Mitchell <ml@embed.me.uk> wrote:
>
> On 12/01/2021 16:57, Marek Belisko wrote:
> > Hi,
> >
> > On Tue, Jan 12, 2021 at 5:41 PM Jack Mitchell <ml@embed.me.uk> wrote:
> >>
> >> On 12/01/2021 15:35, kodali13451@gmail.com wrote:
> >>> I am trying to create a `yocto` `recipe` for `scikit-learn` package. It
> >>> depends on `scipy` pacakge. I was able to successfully build the `scipy`
> >>> package using : https://github.com/gpanders/meta-scipy
> >>> <https://github.com/gpanders/meta-scipy>.
> >>>
> >>> When I run `bitbake python3-scikit-learn`, i am getting the below error:
> >>> `ModuleNotFoundError: No module named 'scipy'`
> >>>
> >>> I am executing the commands in the below order.
> >>>
> >>> Once I have cloned/copied the `scipy` recipes and the patches listed in
> >>> the `meta-scipy`, i am running `bitbake python3-scipy` and the build was
> >>> successful.
> >>>
> >>> Then, I created a `recipe` file with the name
> >>> `python3-scikit-learn_0.23.2.bb
> >>> <http://python3-scikit-learn_0.23.2.bb/>` and the contents are as below.
> >>>
> >>> ```
> >>> PYPI_PACKAGE = "scikit-learn"
> >>>
> >>> LICENSE = "BSD"
> >>> LIC_FILES_CHKSUM  =
> >>> "file://PKG-INFO;beginline=8;endline=8;md5=40ee42dc5a49f1617c5c78f16c50e065"
> >>>
> >>> SRC_URI[sha256sum] =
> >>> "20766f515e6cd6f954554387dfae705d93c7b544ec0e6c6a5d8e006f6f7ef480"
> >>>
> >>> inherit pypi setuptools3
> >>>
> >>> #DEPENDS = "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
> >>> ${PYTHON_PN}-scipy ${PYTHON_PN}-joblib ${PYTHON_PN}"
> >>> DEPENDS = "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
> >>> ${PYTHON_PN}-scipy ${PYTHON_PN}"
> >>>
> >>> RDEPENDS_${PN} += "${PYTHON_PN}-numpy ${PYTHON_PN}-scipy"
> >>> ```
> >>>
> >>> When I run the `bitbake python3-scikit-learn`, i am getting this
> >>> `ModuleNotFoundError: No module named 'scipy'`
> >>>
> >>> Checked the path where the `devshell python3` is looking
> >>> (`poky/build/tmp-glibc/work/aarch64-oe-linux/python3-scikit-learn/0.23.2-r0/recipe-sysroot-native/usr/lib/python3.8/site-packages`),
> >>> and i can only see the `numpy` package there, but `scipy` package is not
> >>> there.
> >>>
> >>> `ls` command output :
> >>> ```easy_install.py
> >>>  numpy
> >>>  numpy-1.17.4-py3.8.egg-info
> >>>  pkg_resources
> >>>  __pycache__
> >>>  README.txt
> >>>  setuptools
> >>>  setuptools-45.2.0-py3.8.egg-info
> >>> ```
> >>>
> >>> Can someone point me on how to include the `python3-scipy` package, so
> >>> that it will be included/copied to the `devshell`. Or do I need to
> >>> update/fix something else.
> >>>
> >>> Appreciate any guidance on this.
> >>>
> >>
> >> I'm also working on a scikit-learn recipe, you need to create a recipe
> >> to provide python3-scipy-native as it uses this during the build
> >> process. However, even with this recipe in place and scikit-learn
> >> building, the resulting packages doesn't work due to inconsistencies in
> >> the build, with the most obvious failure looking like a 64bit -> 32bit
> >> compile error from using the native include headers in cython generated
> >> files. I'm still looking into this but if anybody else has managed to
> >> get this compiled properly I would also be interested in hearing about it.
> > Same here, I didn't manage to make a proper recipe in yocto. Some
> > advice I get on github:
> > https://github.com/scikit-learn/scikit-learn/issues/19037
> >>
> >> Regards,
> >> Jack.
> >>
> >> --
> >> Jack Mitchell, Consultant
> >> https://www.tuxable.co.uk
> >>
> >>
>
> My broken out meta-scikit-learn layer can be found at
>
> https://github.com/tuxable-ltd/meta-scikit-learn/tree/WIP
Thanks for sharing. I noticed that this layer is compatible with
gateshgarth while I'm using dunfell release.
I've added your layer but it seems I cannot compile
python3-scipy-native recipe (cannot link with Py_XXX symbols).
I'll keep everyone posted in this thread if I reach some goal. Thanks.
>
> and the issue to track the runtime issue is at
>
> https://github.com/tuxable-ltd/meta-scikit-learn/issues/1
>
> Any help with the issue would be much appreciated.
>
> --
> Jack Mitchell, Consultant
> https://www.tuxable.co.uk

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
