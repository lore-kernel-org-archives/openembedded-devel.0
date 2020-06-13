Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.16984.1592083044018639316
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 14:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sykPTN4o;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id x189so4843307iof.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 14:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LAz/hs5JtmDdszRcECWiOtZxd8NRMVnxheumynQ5cTo=;
        b=sykPTN4oyjX8kzkYQi3KcWsMvxg+4rRJYA2lU3MQJU5G2SmCVJ9g9hzlTo5sKh+xEG
         v3yA5XZAB//nzGWBj2/5qvRM71QM0Db0TjD8cKtF0BAQtPfGW/lWaJIJ2O9dXvjL2LVy
         q1pHzdo8uZJXmxhBZd/pkEFd2vec6kYVqHO/x+UVcFDKYtLMjX3aoxNrkosHU57Nd0yP
         4A9dNbKkJ8EojG6BhN4fOaJef5yreWt+4MLMSY3kaFVMbdH6RxR1y8nzxCxkTp5sjZfV
         hVy8CCWKfMwxtUgEAb5qNP1V+p7MsnnY+UQV5oiYmFS3J/LEZGSIAb7uWx/xUkX6IkkS
         En0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LAz/hs5JtmDdszRcECWiOtZxd8NRMVnxheumynQ5cTo=;
        b=Lvpu0tMupHD8Vo8iOqXONEx9nueOFpeCrI82qzHGHZtT5KHPJLOMLL85R2VI5hQu/2
         S2m6ExzvfC4A0dTXbJ9au4stbQpmjXtuczb5OHsFPI/QhU4vV3x4O7nmTG2XGJGKuGKP
         2oi79mSWCzdnx/UgYTFLaSLocgCmu2FLQKx6Jsdc0PO96L+HMHUGc4+ER5uqdue7c2os
         adnpNaahXiLYMMr6oRpTwwE28+PKk9AsTfNIOJunRdM1znPEOwsB8I2kY7BXMCon1QYy
         S2I5YEgxTh4/Ne7dVB7RxFkiGpw+UqqODCKldbmaE8QhP9+zBkY7YuJtRzn8kJeVUMZ+
         9w1A==
X-Gm-Message-State: AOAM5319S1vRqaHnOhXavO7BjODHDOPW/9mMsTeM2nOo//6sE6LYHkdM
	u84t6W87LI0H/iwcwcJJa9XiKSoyI/rQDmjY0ag=
X-Google-Smtp-Source: ABdhPJzNJoBquCs+Uvq799j7xKnDY8Ea6cxzN9WQ3/UkI7fIsDRSkjyQxR8ghqrlFMW5W4yhUNzUjGXjAfd9qdLg2GE=
X-Received: by 2002:a05:6602:2c8f:: with SMTP id i15mr20394592iow.45.1592083043516;
 Sat, 13 Jun 2020 14:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200613183729.22777-1-liu.ming50@gmail.com>
In-Reply-To: <20200613183729.22777-1-liu.ming50@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 13 Jun 2020 23:17:11 +0200
Message-ID: <CALbNGRSQfyu15mNfv54QWWyBZ6Qih3MzbBq1-GKUfJmKR0dnNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] packagegroup-basic: drop recipe
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 13, 2020 at 8:35 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> It's duplicated to packagegroup-base in OE, let's drop it.
Same packagegroup-base us a huge molloch and far from just the same as
packagegroup-basic. Please keep it.

Andreas
