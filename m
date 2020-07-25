Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.11977.1595691799435755598
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 08:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KETAQkOK;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id dm12so5512024qvb.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bNQOmoEJBlGx6PnOVuEcAqQyiKxqz6nei4PnoEHtRWU=;
        b=KETAQkOK/bN9FSB0voHhIg93e9cBGTbpsnBVP4bSBp3Z92Jbt1URVRrkrh4TP/FQ1V
         Pm27302u60Yhm2UNPnEsxoHfhPMh2sMLb6ZXi7l+77ariYDcY//A4CvJeuaIG7OdosiU
         lFr/3U+zovWH/Awc+EjudCEFtqnJL53Pi4DtyxPhPdxiM5A9RebpCGjVKtz5JcaCaZ5d
         MuKQ5syq3/0mQeNCHIQCJfZX3+EAOSPWKI/H5F6WC+Y36kvhWpjtagraXcg6LruCW2jV
         jUGJSJpMQabMIosZuBDukOTSkUCI1a5xSW8A1c0mTQlBKq5Vg5wJRgEcRkewmANPok6h
         afoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bNQOmoEJBlGx6PnOVuEcAqQyiKxqz6nei4PnoEHtRWU=;
        b=nNYtcaMV/a+suvYaVJldK2uiQQfRvWfXbOonnbYiamZD0/9FlcfhOpCJwMKUL7OAd/
         GVTz9Ln12J6iF3CeNZRbBoh+oDxojQGkGPmQzNe2TiXGvCOAwqEAvQbrm3/WjQ6+g5Yn
         c9T/GXxsBacfK7DufLNJSdbqeyW8/X7biE/svD6qN9HxQjKrL18c1rm7C09UulWGnAb7
         zisSAyTxnNAg4JM83GDi0h+Amx1DGn7dpE6NpV5FFhevEeWovGCP3CUnQLzGe9CD7nKc
         sj4/S1MYWKPCyj9Reu/72QnCd7yo5Bi3GTgDy0sv7IdOAG0X2l0ZqKjrAhSD87qc/fJU
         AbNQ==
X-Gm-Message-State: AOAM531AhV05q0kfp/+mPYDyxrmesuozeTSe/CCgq0uqHNQ4QX2ZvP5f
	cvwMyXmFAWboX0q7wk/b9U5sAxQNMIzx3rVaQiY=
X-Google-Smtp-Source: ABdhPJzXtdydFGfPfIEAX1LgMxhM0jUAPT218xs+w0o0q2k3NG23Lvp2GGmLLW6GRZWVYwGU/idWKL7gXUh6ITdwkE0=
X-Received: by 2002:ad4:43c1:: with SMTP id o1mr14319198qvs.61.1595691798473;
 Sat, 25 Jul 2020 08:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200725105726.2142880-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200725105726.2142880-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 25 Jul 2020 08:42:51 -0700
Message-ID: <CAMKF1sp3GcJHH25LjnCp=qG3L84HLqXe_wmxGy9j2-GEEVS1uw@mail.gmail.com>
Subject: Re: [PATCH][meta-oe 1/4] python3-mock: Upgrade 4.0.1 -> 4.0.2
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Leon Anavi <leon.anavi@konsulko.com>, Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"

This is already on master

On Sat, Jul 25, 2020 at 3:57 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> From: Leon Anavi <leon.anavi@konsulko.com>
>
> Upgrade 4.0.2:
>
> - Issue #39915: Ensure unittest.mock.AsyncMock.await_args_list has
>   call objects in the order of awaited arguments instead of using
>   unittest.mock.Mock.call_args which has the last value of the
>   call. Patch by Karthikeyan Singaravelan.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> index eebfcdade2..39ab6d01f5 100644
> --- a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> @@ -13,5 +13,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
>              ${PYTHON_PN}-pep8 \
>              ${PYTHON_PN}-pyflakes"
>
> -SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
> -SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
> +SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
> +SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
> --
> 2.25.1
>
