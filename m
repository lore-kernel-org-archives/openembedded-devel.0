Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.9241.1608806723949522388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 02:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ik4mR1rJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id qw4so2805820ejb.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Dec 2020 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6GfiYK3XsIDFicQu8HWsuVPNSPersP+i75lHWh3MHS4=;
        b=ik4mR1rJpsoZstVwgTSTR3fAXSROKzI4ncT4WR+6h32/TkfPzQPQ0N0uj+RaXLPAPc
         9LDy11OriUrHzUm/RtoT+3c0wBYBBM5rx4arVg9Q2ehfraMhuJIykjr8ITpecxBPGzFl
         lYiIJ2etk7ahiCPiTffCBTq8qwbJAWQqimmCRW1KY9epziSsrBJrH4P4mtJ1C8cU9RNR
         DRvjq9EFdY+xBrzHEjF1X2NzT6AQO/vU1EQyhbvAVdPMqry4thlJ0qYzX/zDJRDZt/N4
         KaJd+5OpZkLp4UhKqMcHQXs6SG6WNi1oyP9rl1nOhM6OkjML2xRKnKzZleD+1vyrqIFL
         TAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6GfiYK3XsIDFicQu8HWsuVPNSPersP+i75lHWh3MHS4=;
        b=cV4k1lpgzyIl7QwRVYMBWeQtkNLiUHVgYY+Qu0iWvL5hRqVSgcUYOWMzsEWXWDi6et
         yoXCnmHnXQ8QZQCKwYp7GUCeciPHkAYWDNQWmb/4WDk/ceCs+1n0bdw5WqPAXbQ5wJyn
         NruPxFOtf33Mlt7o4DtCPLdGnR3fHkgdIW5+LuFXmyfvUWuhu0DwYDNKTVVSEOB+dPcb
         uLOKv+KFRrqV2s46aRNkWJAo/eMILZ0hDVXCqBAdYNtiH96Q3q9PuABaweotHye9dB1Q
         /kLY70kZdpTZy7TFa+Xyvethimq5/sftpA1CzBVFHj0h+k8A6YaaMzO58VIrD9CFaflH
         SR4A==
X-Gm-Message-State: AOAM530DF+Jjbp3lhNoZ7EIO14Auek3GSOCB9/Vsygq5Vq7v3oe5HfwM
	Zadubt3+0M69kHtnbYdlpk+AXtsbdoKSmz/QheU=
X-Google-Smtp-Source: ABdhPJyh+63R9J8iw7/XfKSqLVDnqRqGbkQgAIvewdCrv5w+qAGNoMzMrxe4wUjYbTuiOXUPVEcXJ58/rXPJ++I3Ums=
X-Received: by 2002:a17:906:5293:: with SMTP id c19mr27936776ejm.72.1608806722272;
 Thu, 24 Dec 2020 02:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20201223031046.513846-1-dmitry.baryshkov@linaro.org> <CAMKF1srVQdu6RfOcROq6ca4ppUGpr5BOSZBDPTNKSGTLGnj8HA@mail.gmail.com>
In-Reply-To: <CAMKF1srVQdu6RfOcROq6ca4ppUGpr5BOSZBDPTNKSGTLGnj8HA@mail.gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Thu, 24 Dec 2020 13:45:11 +0300
Message-ID: <CALT56yNSY9kx=B1YMtzz9HUw48D8ujgnVRmjWEn0V-oQZ7+KAQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-tools-conf-configfs: add an alternative to anrdoid-tools-conf
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 24 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 09:34, Khem Raj <r=
aj.khem@gmail.com>:
>
> I am seeing this warning
>
> WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-devt=
ools/android-tools/android-to
> ols-conf-configfs_1.0.bb: Unable to get checksum for
> android-tools-conf-configfs SRC_URI entry android
> -gadget-setup.machine: file could not be found

Oops. Should be fixed in v2

>
> while building for qemuriscv32

--=20
With best wishes
Dmitry
