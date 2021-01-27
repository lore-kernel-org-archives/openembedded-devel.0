Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.15160.1611782696388833249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pCXoviZG;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id g15so2288133pjd.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RaZ/kdHCYHkR29Gb//z18BA8lydSy6JCLI4xB5x4uso=;
        b=pCXoviZG9ubOEYdIbRQsJ7g8NRWQEO331VowM6nrrHwDK6wKJHuafkAQvIZnd83DDz
         ZHSywVCM89Uj5EtL69AQwWCRSo48XnqtKfLHe+UX8m+F5qtK7n2zN1JrHMIc9REgCvGI
         rUH1an6Udt/mhJ/8LRfLKCGRF2cjJm+bwJp9XA8szVh+J53wYqiL17V9M7iqEY2KEVRi
         nX42brXb1YiUTBW7Nw5YiIZp7hvRGsLqC0im5jsNVegVIKWNU9mbKzxt4Q+ZvIaV+QR9
         43WkQ4ZONRUR2hE5T+fbQoDB6oDfV+p9sfoyce8SJJhaMtIg0HrCttFSPfZb+3RuJeNd
         DJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RaZ/kdHCYHkR29Gb//z18BA8lydSy6JCLI4xB5x4uso=;
        b=jfnORN3t0vNRWZyh17Du04szrJug0VmPrxMUifSWMyukQbr9uetfPYc5LZw6qEyRBd
         l+b8rWB2YiX82bLy6JbL4nZyKzShQE5+cNDA+Mw2EICs/T+ssEzbUuy5WiNWIOfJT03T
         3BDR1AuXSIyEnqa+NLQaLEFoDPvh/5AJPRb0HNJGXCV/Sczy0BBwgkZcDlpctNBF/l01
         4wS6LPti7qJlB1isexl20iZ1OfXakNcgkhC+U2T5rbh2QzYvQAwvy1rBCLMHD1o/Ypf9
         Tnm4ukPIbXj+/flJiYn/rayR3HYhp4PuwexCT0FPrzTN/apg8nnfpoAoaWFHszU16s1K
         DR6Q==
X-Gm-Message-State: AOAM533RgJaHaylPb4t7f2h0txx8zsWzEE3VNADvIrKaaVKezaOX21tE
	7oCKkleAFoBr378MpGAbI78r6e/rFNIxExO3sVM=
X-Google-Smtp-Source: ABdhPJzNMvIhEPa902lfATpIhilZc0mpfBQzVKraHxwFQBd2mQdSWDPwgewqbPBKyD28eYH5np/34NepP7fZYiLqxqg=
X-Received: by 2002:a17:90a:a10e:: with SMTP id s14mr7595046pjp.133.1611782695945;
 Wed, 27 Jan 2021 13:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20210112221203.14501-1-akuster808@gmail.com>
In-Reply-To: <20210112221203.14501-1-akuster808@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 27 Jan 2021 22:24:44 +0100
Message-ID: <CALbNGRSPPUcABa1m8kbiCJ3CS3drkL2BxaejaY20vxLRDOPWEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] mariadb: update to 10.4.17 for cve fixes
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 11:12 PM akuster <akuster808@gmail.com> wrote:
>
> Source: mariadb.org
> MR: 107836, 107837, 107838, 107839, 107840, 107852, 106414, 106414, 107864, 107876, 107888
> Type: Security Fix
> Disposition: Backport from mariadb.org
> ChangeID: 75fb83ced15990b94659af6e107c063d288cb037
> Description:
>
> refresh several patches
> Drop 0001-Fix-build-breakage-from-lock_guard-error-6161.patch as fix included in update
>
> Bugfix only update including these cves:
>
> 10.4.13
> CVE-2020-2752
> CVE-2020-2812
> CVE-2020-2814
> CVE-2020-2760
> CVE-2020-13249
>
> 10.4.15
> CVE-2020-15180
>
> 10.4.16
> CVE-2020-14812
> CVE-2020-14765
> CVE-2020-14776
> CVE-2020-14789
> CVE-2020-28912 (MDEV-24040)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
It seems that this causes:

| mv: cannot stat
'/home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/image/lib/security':
No such file or directory
| WARNING: /home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/temp/run.do_install.40640:1
exit 1 from 'mv
/home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/image/lib/security
/home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/image//usr/lib'
|
ERROR: Task (/home/amuller/data/oe-core/sources/meta-openembedded/meta-oe/recipes-dbs/mysql/mariadb_10.4.17.bb:do_install)
failed with exit code '1'

Cheers

Andreas
