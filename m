Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.1296.1589926334517017195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 15:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ibMju0qN;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id f83so1507245qke.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bHX6WZ89kb0ys2TInIu/GSDjmDoQyl7GHnfNqBXMDfQ=;
        b=ibMju0qNi0SR0WTQknFjx0vmu40vSTsBvzM1dzQ043HoIUZb014Mztw7JkblOl/0j6
         3UewYl4XuEBA622QFUz+yeW4N5XX0RNVtdJnJBkBIs5Pu2O80jvrNvyJlqc4f/FYjPrn
         tr0W7+BwJ9jtp1T/J1UJS003be+zqm9inMkVx9Gv/2/zabaLX41bzWtaOlIkytpzfMDw
         /SzRsumFweOM2EDBczRtnQCmKFPH0gTNSRDqp7xLw4FcGcst9nPHcOYTSF/x7tPIuFdn
         aDDzbRPJq+JXq0X9Nej3h4YBSMEcZ49VDlIo5x87HLEl4UyYjQlXp652u8pHmp5MYSzJ
         iEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bHX6WZ89kb0ys2TInIu/GSDjmDoQyl7GHnfNqBXMDfQ=;
        b=k73pDg8Bmh4NY3QQd2Wm1b+a4PecYLDkCCWuRd/f3jMgEsxb1ccbteGONhzyrSjDr0
         PjqhmsRpscbqhwMXQP0VMKL1Wo4BYJ7d3Xq0E3fjpD+EzYi0pgqll3iwyRRiXpMz78hp
         R2B36cSFONBJkDRStL7gElODJLw0inA59KuVOA1zcxUzIcWFwwzLO0q1t/1/R66rJfUV
         nhrmguaZnZrKzrmpwG0fjlNVSoa/k98zg4RIq/JbHCWC+7dzzx7i3ybiD32Z3uqqgOR7
         txRTsxJmIF7/i8qiVqnZzJVPHCVHzqLEKl+kI3nG75Ekrp/fWgasn/uV684qns2oTJ8Y
         V7WA==
X-Gm-Message-State: AOAM532WiQwYSffmjmG9oqOb72nK6HQ3PUWNbEngltNoQKeO3Lq5bC2h
	cp79gl6vonQJX4hwjdC2Kgb2UrHN8KgjnFKKK2Q=
X-Google-Smtp-Source: ABdhPJwJ5eFQ7V5q9hhOMjZXowWCjNR8bUFiF8st35bq2/+6q6ZXGcvcjOGelstlwMz8nbVBzDgGjF+J+0T+ppuQtd0=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr1593473qkf.17.1589926333298;
 Tue, 19 May 2020 15:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200519214741.15068-1-joe.slater@windriver.com>
In-Reply-To: <20200519214741.15068-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 15:11:47 -0700
Message-ID: <CAMKF1sp=EPk3638AURDh3QiYE8HBs9a3EnGoCWN-UhT=+W9+xw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/1] postfix: gcc-10
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 2:48 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Add -fcommon to CCARGS to avoid multiple definition errors for uninitialized variables.
>

https://git.openembedded.org/meta-openembedded/commit/?id=d04f3a1be3a6d7f57b3cc26cb3159b1055a5ee22

should already take care of this

> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 4b9940cc7..a8d55a6c9 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -61,7 +61,7 @@ export CCARGS-sasl_class-native = ""
>  export AUXLIBS-sasl_class-native = ""
>
>  # PCRE, TLS support default
> -export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
> +export CCARGS  = "${CFLAGS} -fcommon -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
>  export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
>  export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
>
> --
> 2.26.2
>
> 
