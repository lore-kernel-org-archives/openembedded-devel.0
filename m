Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.23794.1630943594866399913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 08:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L6ThUTj2;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id t9so5748904qtp.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Sep 2021 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mBe0DRiWdeAcLRb364zuT1ydkOjAsTYGN5/ymU4gQqc=;
        b=L6ThUTj2uJlFZ6iYRHNZ1nyb+tQSveOpfGBOu7jJUCUP47Wrj6nm1d3ptVKGzzEzb/
         /ivO54X+E/GyLMyqwgzrL/uCmzVNSTzHGl9r6fMr6RtmTdllsqDTOMZ4LTWQ2uopvIZz
         OXaj8rd7+i2LllcaaWncK5zJ/lIj/cok1yfFdGVDxXkJsvljaQVUIu9ZrEqPL5RYuUe6
         q5srlzXeFOYTGG6HNEoqf+evq4PQn7qlx0WF9RvOzTWfUEFuvPq1Xs+qyx+d36jlqjRQ
         xdafY/8lcZbw7obSjjMz6zAmbCxyDIlgVIlmCcsW/alwKZYMJwIqRYvl/GVVgzFHVUWI
         nVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBe0DRiWdeAcLRb364zuT1ydkOjAsTYGN5/ymU4gQqc=;
        b=OZ9xicU20xlx+fb0WmyLwlis2qxtSQFqXJ0jwIPrw7jAfD8nSvJvLCl/w2xF7fUxZV
         WbKSqFN9NC2aW9MJGs+SiRDz2WDdI7HvySVaUlBkvjO2cQehJQHLV7zYIxgEglobooVe
         jQXfdwdXgLzX8cRbAL0WxZuLILngpxfolLi6KtJXIemcF4/wclAlf2Le6SoqWe9j/F7S
         8FmLgjIrZDVkdZwXb17UpN7OHgOi7LpW9ZjGcKoeP0lNroqLsM0qjoPaA0/m1K8A6aVm
         2vsjqJ46jTWUw+rUz+HjbaCn9Q8CSnpJX0EYEh+tDhbR7vs0MFLbx2/7jU6nG13nfe5L
         iN/w==
X-Gm-Message-State: AOAM530/0fJIz9LYe6GP8G2dMHjbT//GAFu8JfVQk5+O3+Yx0MhPDgPJ
	XS6lkOV+k21Hk0uUd2YL8q6qFf3CWXr4gZ2UTM0=
X-Google-Smtp-Source: ABdhPJzUdq+ph5QA34TuPqoHoOj61jLVmri9LBdc0dYqi5beiBS62U7AgdvmbxiNwpT/4hI+29bLQi0PB3/ml0618tw=
X-Received: by 2002:ac8:67d7:: with SMTP id r23mr11489290qtp.227.1630943593894;
 Mon, 06 Sep 2021 08:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <bb99eff8-23b6-63e0-4a72-505555b6074d@gmail.com>
In-Reply-To: <bb99eff8-23b6-63e0-4a72-505555b6074d@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 6 Sep 2021 08:52:47 -0700
Message-ID: <CAMKF1srXqosDdsWJyk3E6+CW7VMkrZo0d3691Cx1eabPt=3FTw@mail.gmail.com>
Subject: Re: hardknott merge request Sept 6
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Mon, Sep 6, 2021 at 7:48 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 5741b949a875b07335d4920aefa6defd13ed45c6:
>
>   gd: fix CVE-2021-38115 (2021-08-26 19:18:35 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 7bd7e1da9034e72ca4262dba55f70b2b23499aae:
>
>   dlt-daemon: update from 2.18.6 to 2.18.7 (2021-09-04 10:39:29 -0700)
>
> ----------------------------------------------------------------
> Changqing Li (1):
>       apache2: upgrade 2.4.46 -> 2.4.48
>
> Gianfranco (1):
>       dlt-daemon: update from 2.18.6 to 2.18.7
>
> Joe Slater (1):
>       nginx: fix CVE-2021-3618
>
>  meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch        |  43
> +++++++++++
>  .../dlt-daemon/{dlt-daemon_2.18.6.bb => dlt-daemon_2.18.7.bb}   |   7 +-
>  .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          |  45
> ------------
>  .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          |  49
> -------------
>  .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          |  39
> ----------
>  .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          |  35
> ---------
>  .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          |  66
> -----------------
>  .../apache2/{apache2_2.4.46.bb => apache2_2.4.48.bb}            |   9 +--
>  meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch    | 107
> ++++++++++++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb              |   2 +
>  10 files changed, 158 insertions(+), 244 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.6.bb =>
> dlt-daemon_2.18.7.bb} (93%)
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.46.bb =>
> apache2_2.4.48.bb} (96%)
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
>
