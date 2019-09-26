Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63E0F6C132
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 00:58:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n7so803461qtb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 17:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AjXamjm2/TJe5b+ptgkDxcJ6UfkCxBuoSnxidG64vFY=;
	b=njpiyLZzDMlVCPNsfEyMYigyjTPNUQNHu258drZCovol1lLvP3futTzIEr/Q/BE7qo
	Jomci2eglCTRoClTNLBBzaHfqp/h8e66ASXQNLtYoAUhpi4Q2f6VcwPf7abheUkToxcM
	aywpKh/zyfcL7Pp1NaJsfx9NDgaU83tsylQggCxvKq6pj09fit1Hk2fBCGMAzHaa4QEA
	Y8MfEmEhB3Ep3frZmtAMXSkdWty07KXqvPZBDuDf8OeuSP6a7sh2Q8kNhJLcb5GloE2f
	KNQHIDj/Z5UvHjxfhbq9EjPaejhbJBZzmXR2shlQKvVGzSKIUUWvU1iNhNiL5tSDAjTC
	WFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AjXamjm2/TJe5b+ptgkDxcJ6UfkCxBuoSnxidG64vFY=;
	b=d4QywpwmCV62+zc6WM36yxZL6/M73WZIorQeLwLb0K6bnytp25xIyU6xFh67zVpCxX
	lDMWEHCNMFDgOIuYKePRZnj6RggpN+vTfDVnb6hZAMM+lpjiGE2ZIBg3GXGiJWtBqq40
	MTIYj80QQgpoSUkKEvSrA1eZS2JmRzww2e+4//kYbTQc259Byb+yV/OVVhNmzNx2nzUb
	NKttKPNKaCf/GIhS3IycwFWf054nZ9fKn65f0JmzcDRoQ0nTbw1Ub5HpJqX2kwBCYXiT
	33WlYlJvJ3X4XO+6ds/M3a8oyxwHy3LJoMGixu0IwxhgBHyeatD3mEhMPcErK3XjAsR4
	xSmQ==
X-Gm-Message-State: APjAAAVIaDzC2vldVFag789yFdD6+tT+zTIANB8fOLeyy+W02caJH8IV
	Oh3OwgN3jZsN1r3idlP+0I26KUmDFF8Je/xeGzE3iNfhBqU=
X-Google-Smtp-Source: APXvYqx7FSmTScZo1JIel/5op88Xe8kwuOM8RdRN8LdPjOWLqGRbzs0Vm8B7iRjn7jkzZMfXfaPef59Iks980LN/Kwc=
X-Received: by 2002:ac8:e09:: with SMTP id a9mr1424292qti.88.1569459488937;
	Wed, 25 Sep 2019 17:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190925211412.23859-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190925211412.23859-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 17:57:42 -0700
Message-ID: <CAMKF1soT4E2+nm_ZJ95CiKz2LzLDj6NUDcUQXdfFt9n9nuoVyg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-oe] proj: update to 6.1.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Sep 2019 00:58:08 -0000
Content-Type: text/plain; charset="UTF-8"

I think this is causing this failure

https://errors.yoctoproject.org/Errors/Details/271996/
https://errors.yoctoproject.org/Errors/Details/271995/

On Wed, Sep 25, 2019 at 2:14 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../proj/{proj_4.9.3.bb => proj_6.1.1.bb}                   | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-navigation/proj/{proj_4.9.3.bb => proj_6.1.1.bb} (65%)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
> similarity index 65%
> rename from meta-oe/recipes-navigation/proj/proj_4.9.3.bb
> rename to meta-oe/recipes-navigation/proj/proj_6.1.1.bb
> index f45f8948d..4f53aa46b 100644
> --- a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
> @@ -6,9 +6,11 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
>
>  SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
> -SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
> -SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
> +SRC_URI[md5sum] = "9a82a3174cacf319d94360a759fbcc8a"
> +SRC_URI[sha256sum] = "5cf0a2360a28b5d724c53edbb87f3f3b14fd96001265411ac4e56f369e2d503f"
>
>  inherit autotools pkgconfig lib_package
>
> +DEPENDS = "sqlite3 sqlite3-native"
> +
>  FILES_${PN} += "${datadir}/proj"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

