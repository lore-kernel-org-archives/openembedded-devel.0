Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.462.1590535001123791814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 16:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fWk44Ayh;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id a23so17753520qto.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 16:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3e+ov5TsysJbyOvCsP+CGdYBkh35hvNcg90wDUQETGg=;
        b=fWk44AyhOuMbDKerdRIsGkT0jr09TaVVFA09METrilKVqXNfwzVlkEbjVUBQ0xqjaO
         N4ePD6PIHRxV31vNLvCxaq7cIQfbIGZ76nt1WKdkTV9CDBpAJXjFs8L62CyuejYtraMs
         t9X/eVAogHLiiSHhoMiSvmM1DJveWD/qPk7vlTrE5wDbcG1Tj2sdk/kCsjMO2cInV6as
         94Rmnaajh33nXj+t7x2UFKUF5n84XU6I8Z1ST3BvpYPJ1gd3cY9VO3WPvqrNpuDDn3eb
         BLWcEqqgw1Uoujm3XaMtYzY6gXe3GjaOERv+iKhMeBfSQGxj4rOuMSMpR9hm/o8CdqTB
         kD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3e+ov5TsysJbyOvCsP+CGdYBkh35hvNcg90wDUQETGg=;
        b=AAKmBj0BmGIfPLN7WJuCTjNony+I0hwA9YkAMjx+Ms3TRSHB7745pB4+fv6o/p4A/3
         +KM/VGtUZ2056BtByyVx0eMdtZEKlh3pJsknF5ILmtfukUNqlv1CkmKcwtkNZhzQPzr9
         LS4SbJG9hL57Cdd3EjtkZo6mn+mQqMX2SY0FY8BNuZAD5a4CWwENrU8o2PkfNi28SWdl
         5WJPIOuMtwyr87/ia3mSXThB+ysXczAFALdoJOXpDJ3pG9C5T2R91sjGF+/Dqq81XXiz
         3rY1TVaBJgpsOZKD3JFWAGCS4wHgGq1CEKnRs1IuqYtwrud1li6gvtEcxfUUSjyL95e5
         0o8w==
X-Gm-Message-State: AOAM530bbXUx9Z81N+rhpROOZ44MbDN0fTni6j0rB0ptFdZ60PMwEAd2
	oAFSA1B6V2jnsKHZA5Uex25GisqMs6Y00nLgIAKXB8Ki
X-Google-Smtp-Source: ABdhPJzwK1uMc0hxjtjBQ0td3Aw6v6J38+6WI9vVKh1G5rby9hBll3S/7YPOs456Y2Sfhqg6O7MGHEolhQQd98YCx/M=
X-Received: by 2002:ac8:5148:: with SMTP id h8mr1295043qtn.316.1590535000151;
 Tue, 26 May 2020 16:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <1590514812-29021-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1590514812-29021-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 May 2020 16:16:14 -0700
Message-ID: <CAMKF1spiZ5EwNB0j51kDpgOxCZMpT0_ZO2ZArvvfO3wvZvf-aw@mail.gmail.com>
Subject: Re: [oe] [OE-core] [PATCH] python3-pycairo:upgrade 1.19.0 -> 1.19.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

send to oe-core ml please.

On Tue, May 26, 2020 at 1:40 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python3-pycairo_1.19.0.bb => python3-pycairo_1.19.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pycairo_1.19.0.bb => python3-pycairo_1.19.1.bb} (84%)
>
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
> similarity index 84%
> rename from meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> rename to meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
> index 8f60834c17..34c8543bce 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
> @@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
>  SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
>
> -SRC_URI[md5sum] = "38b84416021640b01250c8f8ec4c52d4"
> -SRC_URI[sha256sum] = "4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738ed464fe4efa0612d19c"
> +SRC_URI[md5sum] = "59bc5c5d1debc3af0f6791af9d612551"
> +SRC_URI[sha256sum] = "2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84"
>
>  S = "${WORKDIR}/pycairo-${PV}"
>
> --
> 2.17.1
>
>
>
> 
