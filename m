Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.16000.1590163153835735141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 08:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TNdqif9U;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id o19so8619005qtr.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SQ9KpJrGp75nIirHj7cWibGbkAluE1PC9tUEz8WpVP4=;
        b=TNdqif9UbgijyA+b3IGQO1ULgVBNiGyzryeFqwH3cwzL85cc4kUPOq80nTkjIeZGBO
         DhzehCY/ilDvTkKgru2bmGyAnCNZEW3t7W+plM5FzTuERON4ucw8K4efBm6MAFi0vKTw
         +HSLdRiX1QgvFbiU68oVR3ywg/FkJVDbSUau1lgMocRuM7RS1YPHdSuu3AuUgBCDpDAD
         qeqtSEtZmDsgLkAEV4fxr5oYf4KOotCPohfwaCzIMe9n/EaqHJJDQ4bCxpzdrzlk1sxs
         E9mgPeqYalXNbFAZ3T+rY4W/UEPm3uZiLCdfNQWFUVHL42HEgCJgwVlydfbAKNVRoyHa
         V7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SQ9KpJrGp75nIirHj7cWibGbkAluE1PC9tUEz8WpVP4=;
        b=XA9ynfmfVRgfgUN61vNNIfQ28UgeXyl2uoBKvubfvnAA2UAxGPh1khho4MvjLCtpj7
         lhkMxatZpjKLApkdGD7wRKeTBRWJSlCUw9z/e76kRHLtP5FE7h+pCdbuoav3/6JjXf5W
         qVYhCZbA9loGkAcExYaBm5CIm+TvFNQrobVpzjbJ79cnzoOlg6AY9CWFP8Gcp0VRhNbO
         sBcSu2Ae4zmd5xI59jmgXQN2TdYgiipnum4LQUCBebd62U6/iUMcK1JnWjNQurXONDrs
         VqW3F7Y3fjcPK8sLcQd3U3GmBd715QN4TBkal5SxvoUwHBZ2TyAAedVo4LT3MEZbPgut
         oq7A==
X-Gm-Message-State: AOAM530MKMqkDRua7JJmFFd/RXzvJNWW3m0pMsBNTdBo/qHvfSR3MZq+
	4vsY6B8wr6Pa1uJdoNLoNKpl6v7EO4wrdNwoRx+Xvpx9JLA=
X-Google-Smtp-Source: ABdhPJxcKdIdzZXkuEPYrdwqKFNk2L6YSoPTe3bhUcTahI00vjx5TBL8CnSL66K+tfLvYRxwGAjdS0u2oTr+J6DDxAI=
X-Received: by 2002:ac8:4311:: with SMTP id z17mr15508754qtm.316.1590163152875;
 Fri, 22 May 2020 08:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br> <20200522121333.25045-3-domarys.correa@ossystems.com.br>
In-Reply-To: <20200522121333.25045-3-domarys.correa@ossystems.com.br>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 May 2020 08:58:46 -0700
Message-ID: <CAMKF1sqKE7o40GmqvShA1jX-bm-=sCtemuBq7UqEMiwGv+YnGg@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/3] python3-pyyaml: Update 5.3 -> 5.3.1
To: Domarys Correa <domarys.correa@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please rebase on top of master or master-next,

Thanks
Khem

On Fri, May 22, 2020 at 5:13 AM Domarys Correa
<domarys.correa@ossystems.com.br> wrote:
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> ---
>  .../python/python3-pyyaml_5.3.1.bb             | 18 ++++++++++++++++++
>  .../python/python3-pyyaml_5.3.bb               | 18 ------------------
>  2 files changed, 18 insertions(+), 18 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> new file mode 100644
> index 000000000..5efc2aa9e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Python support for YAML"
> +DEPENDS = "libyaml ${PYTHON_PN}-cython-native"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
> +
> +SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
> +
> +PYPI_PACKAGE = "PyYAML"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-misc \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> deleted file mode 100644
> index b5425b8c9..000000000
> --- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Python support for YAML"
> -HOMEPAGE = "http://www.pyyaml.org"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
> -DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
> -
> -PYPI_PACKAGE = "PyYAML"
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
> -SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> 
