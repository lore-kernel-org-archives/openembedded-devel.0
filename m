Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7942.1585910032644629621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 03:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WrLhUdMP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id h15so7885176wrx.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=gNo9LD+UZJDOY/Xi2hsWT+n8msa+ZD0ttIQAur9yfD0=;
        b=WrLhUdMPtdNA46j616JpjklQnNttol61JHM7PQGX2jAWKuQq7S9VDRvYo5iTvposZm
         zogAHH0CWZ15KeSPhfzPwsK4NyAPb28Ah7jtNsdC07bOApt8+XP681CnImu/P79X7IrI
         1WUUF5S3ZDTVJzC3hUY6plD6Z75t0dshxjntQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=gNo9LD+UZJDOY/Xi2hsWT+n8msa+ZD0ttIQAur9yfD0=;
        b=PV+OCFfOKyUmsYhJStcRq9cCJfu17nd1F7yVcCtRzxB4vVNkK19pXokK7ZMJRzu2Rq
         432ua95ylipU1bTruaHmGlxQn4ExsCldKiEiEM+gWt/zK6vEHS8tDOaom+GnUD0hYcQv
         TT3GJpN6GIV1mBEN//MZvKoMyKx3dd76A5S7ywcW5EbOYNtoGWvV0ILNmKafTGIyWrPv
         SxgLxM5ivI4KpYeYEJkC4bEv5S1PRyj82ilFQxgcj6aLEQmMH07poL+7mxrPYSoCXmvp
         VO7Z8KhnifEFXMPR2EM2ALpPIdqdodS0vcfH0+UZQ0ReMHpyEIyjo15tiZlnE7PmluSa
         EpHA==
X-Gm-Message-State: AGi0PubRqs6PhW6rcrhTwS3vWNBZ5wsOMxftX8ukjIgWdd1YATB3njEt
	ag6UiK7WZ6ldnOsGZkh1jbTzIw==
X-Google-Smtp-Source: APiQypJ3tZDIHEnEqAtWvKYYsTz+uZnul+QvGXwW7Qhuk+pG4nehgCkHmhz3fUMLJwh/4ka4+oBpVg==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr8825922wrl.201.1585910031080;
        Fri, 03 Apr 2020 03:33:51 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y80sm11540065wmc.45.2020.04.03.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 03:33:50 -0700 (PDT)
Date: Fri, 3 Apr 2020 11:33:48 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: "Leon Anavi" <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 1/3] python-smbus2: Add new recipe
Message-ID: <20200403113348.21435aab@ub1910>
In-Reply-To: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
References: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Apr 2020 11:15:46 +0300
"Leon Anavi" <leon.anavi@konsulko.com> wrote:

> Drop-in replacement for smbus-cffi/smbus-python in pure Python.
> It is another implementation of the python-smbus package.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta-python/recipes-devtools/python/python-smbus2.inc | 19 +++++++++++++++++++
>  .../recipes-devtools/python/python3-smbus2_0.3.0.bb   |  2 ++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-smbus2.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-smbus2.inc b/meta-python/recipes-devtools/python/python-smbus2.inc
> new file mode 100644
> index 0000000..0bab1a4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-smbus2.inc
> @@ -0,0 +1,19 @@
> +SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
> +DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
> +HOMEPAGE = "https://github.com/kplindegaard/smbus2"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
> +SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
> +
> +CLEANBROKEN = "1"
> +
> +PYPI_PACKAGE = "smbus2"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
> +
> +RDEPENDS_${PN} += "\
> +	${PYTHON_PN}-ctypes \
> +	${PYTHON_PN}-fcntl \
> +"
> diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> new file mode 100644
> index 0000000..6149e35
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-smbus2.inc

We should be doing away with this kind of .inc file now that meta-python is
python3 only. See
https://lists.openembedded.org/g/openembedded-devel/topic/72718415.

Thanks,

-- 
Paul Barker
Konsulko Group
