Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.280.1591847064129535523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 20:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WolZQQO6;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id q8so4340590qkm.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 20:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pXn52hyYAYLsF8uNfNUHNV2NkSdm3dgkSQgT850XH6M=;
        b=WolZQQO6Hx0xNVsParDAsxm6KX8hQHMRWAKiOImd7eZBZl4bmUABuzAxNYTDod6W7o
         c3tU/39+8ehPMPnnHBSCJN2llnJ6VNjGSP7Z0xxk7R2qJQyWYZn8Ghr0Lx9J7Zcuj263
         rhaZ13pYHh1RO8y3ArI7702Hx/RJJLX2Dzt9bOkBvmuosrNK+4HHHJ3QFxwovgahasy/
         GbvXzaA/FwMROWJ+R4aVtTf/aAfoJde/YAAhlNwkbGmeFlClCo5nD6jsFI8RzojNV3mH
         ULtAYeQ94yN0qWkn7JccX5exrRWPuGZWqLwjgO5atk4fzqROhxQ0d/t5PfKeyM3NlAXP
         bPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pXn52hyYAYLsF8uNfNUHNV2NkSdm3dgkSQgT850XH6M=;
        b=VQI9BuogNR+eBZCT2k6T6yiYdadCyOCz7WSpxUKVkD/Mw3dR7768PTdCpbFywDXj/b
         tRfp48HNnWiImiUJRCu1LBcbdaA2Li5Cct2I7s9eOP8FtJFlngss6Y+IoYwyx6ICROVG
         WTHghTGQ1o0XLLikIL/0N1ggFUff9Qh/neI0XRoQpeRE+hOVo91dEeUY5TtVMZH0Yo81
         hmh3aB8GhS8CZW+vIjJRcGfgiBziaONiTulYc80qSkeAx3xo5jNjSQ6hu3tZuqQAt5iZ
         RudoUOHrqOjv3lCN4AZhke5wSOQn3ZdOMhBu3jWPJPynNetJ+DkCSVg9CybmBTpmnNNf
         Oizg==
X-Gm-Message-State: AOAM531ATr+GVy2cZvxluUXDMWud1FWmM8cq8keY/au6arrE1pcPw3ke
	wc5cespimqT2VcQCP/tSKATFnwVPfj9D/44Y0rU=
X-Google-Smtp-Source: ABdhPJzf30YMW1hVNYREPaRysPdqyhVA5K8kv4wvYjSE5Gk+L9IusMZHX5TfkRi2D40KTHcoY+oQaEydox/IF3FSLIY=
X-Received: by 2002:a37:e215:: with SMTP id g21mr6398440qki.165.1591847063089;
 Wed, 10 Jun 2020 20:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200611020739.37612-1-Qi.Chen@windriver.com>
In-Reply-To: <20200611020739.37612-1-Qi.Chen@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Jun 2020 20:43:56 -0700
Message-ID: <CAMKF1sr7rjynL-AqpjV85Joq2=boXDnRHNeH2vHbSiMrP2k1Sg@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH] python-django: set CVE_PRODUCT to be django
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 10, 2020 at 7:08 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-django.inc | 2 ++
>  1 file changed, 2 insertions(+)
>

Can you rebase it on top of master-next please ?

> diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
> index 54c77c827..3f8c19fb5 100644
> --- a/meta-python/recipes-devtools/python/python-django.inc
> +++ b/meta-python/recipes-devtools/python/python-django.inc
> @@ -29,3 +29,5 @@ RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-unixadmin \
>      ${PYTHON_PN}-xml \
>  "
> +
> +CVE_PRODUCT = "django"
> --
> 2.17.1
>
> 
