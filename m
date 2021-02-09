Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.13290.1612889246485321551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 08:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JlGo/KTM;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 2so9012378qvd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CvX+qososECt0A3VIb1PjHE9QoEFjWMoVdiQOd6t83Y=;
        b=JlGo/KTMAVjSOfJ+mPfSAo34jqZUU+FormDJEFh+bPsxME673yceDS7ThZrMCsJ5sq
         nZtv/Uxp+HkuJ0Jjd/QCryywa8j4o5lH8Ikj1wXLBXi/RjUhpQhSbj4RxljHxBkHjNvN
         e1qSSj93uVAUvedNJAEC90/TBEevqm3GfQUqc9YEx3QlpJOZl42FIuQe9fjwqRZxS8PA
         D48i7+Kh3yBHJklV2k8EqutyNMo+beXWpVIQ9ag2lK0LqsVzd0h/2lSIVuDvBA0ZCf9w
         pz6Sa2IQZByjPTZ5ZKLe+hvyJG4nfnhn7F7mEqMojCFjkei5HRVALMydSznoEYjF9Ak3
         /TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CvX+qososECt0A3VIb1PjHE9QoEFjWMoVdiQOd6t83Y=;
        b=McEOYGMXzb67ni1USk7VLlkNUOu7IHsbJtYv2FeUsgQbnbX3bK5U3NEK7Q1NP/x/bp
         1+ReWeeugrAVjO8Me24Jp1dnnHIRZHkRvC/51vxGQSCGzaXows2/FgeREfBlWQ2CY8W7
         O+jtD7V2/FEgV600nRnw5dswWTeQDgvz8e+fjNWVbldTx4SlnZMJELc620akLOw8DBdE
         wDZZt2VUSqohbXdbIzSBTj18nk3JTadCq2kjlQVuVYqIzSMEFtVgY7qSLzCLe8RyQlqv
         3j1k+7gPBXjcU38a7NzU4kzaGmlnWxHtFCxh3Umz1z2wbVz+K58JivJi4jOCUhfNb9c2
         cWDQ==
X-Gm-Message-State: AOAM532FOZ+qHwWR77xNfM2OMLT/oe2EuLCkg+iyTeaB5Mxpp8FyLbdc
	d4FjU5lYs0rdQilU+i+IJzMz32HSQq0Ep9A8VKw=
X-Google-Smtp-Source: ABdhPJztEdWt9P+yyeraeel9nsRC4ZyZ4fxvIAXgaCkzbEbWRktypZ1eCGz5b7xieldnFh5VdZPIaD+8NujLZb1wzOE=
X-Received: by 2002:a0c:b20d:: with SMTP id x13mr13127941qvd.19.1612889245567;
 Tue, 09 Feb 2021 08:47:25 -0800 (PST)
MIME-Version: 1.0
References: <9cd7ddd4-0eea-438d-b66d-3c0693ea5866@gmail.com>
In-Reply-To: <9cd7ddd4-0eea-438d-b66d-3c0693ea5866@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Feb 2021 08:46:59 -0800
Message-ID: <CAMKF1srQruvKChkDoqGyYO+QHJHj_ohwYoJ5NYJ71B5gM3qBjQ@mail.gmail.com>
Subject: Re: Pull request: Gatesgarth Feb 9
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied thanks

On Tue, Feb 9, 2021 at 8:28 AM akuster808 <akuster808@gmail.com> wrote:
>
> he following changes since commit 6ff4bd4f345b4e8030b9197d13097308df52157=
6:
>
>   postgresql: Update to 12.5 (2021-01-18 08:20:58 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded gatesgarth-next
>
> for you to fetch changes up to cef93b7b00e620d90a610112ee574fa60b691cf8:
>
>   openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)
>
> ----------------------------------------------------------------
> Anatol Belski (1):
>       xmlsec1: Fix configure QA error caused by host lookup path
>
> Dmitry Baryshkov (2):
>       xterm: install xterm and uxterm desktop files
>       xterm: provide virtual/x-terminal-emulator
>
> Mikko Rapeli (2):
>       flatbuffers: whitelist CVE-2020-35864
>       giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
>
> S. Lockwood-Childs (1):
>       sip3: simplify recipe
>
> S=C3=B8ren Andersen (1):
>       zram: fix sourcing of zram parameters
>
> zangrc (2):
>       iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
>       openldap: upgrade 2.4.51 -> 2.4.56
>
> zhengruoqin (1):
>       openldap: upgrade 2.4.56 -> 2.4.57
>
>  ...iusr-Compare-with-max-int-instead-of-max-.patch | 48
> ----------------------
>  ...ils_2.1.2.bb =3D> iscsi-initiator-utils_2.1.3.bb} |  3 +-
>  .../flatbuffers/flatbuffers_1.12.0.bb              |  2 +
>  .../giflib/files/CVE-2019-15133.patch              | 23 +++++++++++
>  meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb    |  7 +++-
>  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb       | 17 +++-----
>  meta-oe/recipes-extended/zram/zram/zram-swap-init  |  2 +-
>  meta-oe/recipes-graphics/xorg-app/xterm_353.bb     | 16 +++++++-
>  .../{openldap_2.4.51.bb =3D> openldap_2.4.57.bb}     |  6 +--
>  .../xmlsec1/ensure-search-path-non-host.patch      | 22 ++++++++++
>  meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb  |  1 +
>  11 files changed, 78 insertions(+), 69 deletions(-)
>  delete mode 100644
> meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeni=
scsiusr-Compare-with-max-int-instead-of-max-.patch
>  rename
> meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-ut=
ils_2.1.2.bb
> =3D> iscsi-initiator-utils_2.1.3.bb} (96%)
>  create mode 100644
> meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
>  rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb =3D>
> openldap_2.4.57.bb} (97%)
>  create mode 100644
> meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
>
>
