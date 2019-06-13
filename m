Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 414767E8CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 23:06:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y57so404125qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 16:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gIVeyx+JYtLI/dSfcHYrnkWxkeOqUJoiqBp7XvAw5b4=;
	b=r9V4VgTodLE0ymnbrC7nKEvH/w/D+QL4AZIZV+0WwrPJd064eoHfvVn4sVsS4vokAO
	jAAynnhubC/74/yG4+08q28ROLgF0r06N2zIBpkXObOtCt74H6VHH7W/PaGwWEhSdqhL
	rybg9XGsRq53dgIlRLpf9eAy1SfVTyOOI11PBVrqnxMqVgS81lYyufgHKS6aHlC4wCs9
	av9TmHtUs30AMWCiSadu3XW4HTl24jSbyHq/CU5cAA2IsUxCXmKdoZpq+aq9I97eSamS
	1ptKVyQJPSatiypuuaaMCM7vhRGsTYBhFBUs6JwrLH/GYgemOsA8PHtTYYkEfxm5jgSZ
	mJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gIVeyx+JYtLI/dSfcHYrnkWxkeOqUJoiqBp7XvAw5b4=;
	b=Hql9l39QRANGfOn4Fdbu1Ij+gPOAjO2b3AQGa0+T1AyXVmPztI72b1+fRydJqzkzQi
	qWznB44y/lWd7iECO8uavuo29agvRmJ04hKGfsLSjqsVZr7cx/7t5p7pBccvby9G+eq3
	QZGdtGWGFHXxWTS0FpNXTpIR0Ij16WmW5yasHCJVojA9VLwPYwEHnry5Dy7zCgknAqHt
	x5HzMrnPoD1EduxixGPqlifDOnCr6YHTEkVMVB1VyHb83O4x596gcGLDkB4+PyVKoW5+
	U5H9L0dkz+JLrDYJcsGTAec9qJsw4HGA2WnYMwjJbYsFSU2hKO1qnPMiATT75M+Q888X
	G6eg==
X-Gm-Message-State: APjAAAUH01fypUW4f2jD9l0ysQZK3t9Ybs1rIVPD5KYTsbVz3/1Q6LVq
	u40Q5NM7sPSZfteWim57CVzNWoh43Aq+ARjwcXE=
X-Google-Smtp-Source: APXvYqynLJdNhYZR4PIGO/dZ08difoBZIlGsj7MMx4pmB0itrgz3m4kuN3Ijh5L3jxVvZ0gqisqeOwFMmi1OEIe/G/w=
X-Received: by 2002:ac8:e05:: with SMTP id a5mr42885522qti.53.1560467175790;
	Thu, 13 Jun 2019 16:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190530055149.48837-1-yongxin.liu@windriver.com>
In-Reply-To: <20190530055149.48837-1-yongxin.liu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jun 2019 16:05:49 -0700
Message-ID: <CAMKF1sr3nsW=Czi48++hsWs+J6Nqus8rM0mEe2Xh+Fo_9PNc2g@mail.gmail.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ndctl: v63 -> v65
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
X-List-Received-Date: Thu, 13 Jun 2019 23:06:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 11:02 PM Yongxin Liu <yongxin.liu@windriver.com> wrote:
>
> Add keyutils to DEPENDS.
> Set FILES to package /usr/share/daxctl/daxctl.conf.
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} (87%)
>
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v65.bb
> similarity index 87%
> rename from meta-oe/recipes-core/ndctl/ndctl_v63.bb
> rename to meta-oe/recipes-core/ndctl/ndctl_v65.bb
> index 61e53029b..8648ad580 100644
> --- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
> +++ b/meta-oe/recipes-core/ndctl/ndctl_v65.bb
> @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
>
>  inherit autotools-brokensep pkgconfig bash-completion systemd
>
> -SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
> +SRCREV = "ed17fd14608d8de072c8c090ffc5fcf78c4f48ff"
>  SRC_URI = "git://github.com/pmem/ndctl.git"
>
> -DEPENDS = "virtual/kernel kmod udev json-c"
> +DEPENDS = "virtual/kernel kmod udev json-c keyutils"

Please bring in the recipe for keyutils as well. Since its not in
OE-Core we should not depend
on other layers for this

>
>  S = "${WORKDIR}/git"
>
> @@ -31,3 +31,5 @@ do_configure_prepend() {
>
>  SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
>  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> +
> +FILES_${PN} += "${datadir}/daxctl/daxctl.conf"
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

