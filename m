Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAD77D3A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 01:28:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 201so81260879qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b4/IWWT5C8oyaKJlaJCr6sOShycQoOktYF3MsfXOWjk=;
	b=Y922DVYDkzVQBBqShOEG0RVmVJNnGZk0TlBK+QFh0MLDr3ARUFPtogZHnhtkWOLz4W
	29U7Fwu6lkIrpjff+KD4eWpXerOpKC4iByeICbIEdbny9aR64pRbq3XaGEQoW8fSCJEs
	i17MeEhQozrd3EsEKIkPWa1yrlQalARhTY6g+xhSkHgr/8kRd6fxGZ4sWy5Wnj+0iGXG
	LgJZUSrTAuEkjXbirn/HRhYbRSzkwx0OzpR5W96O/wZ4LYJRpPAQ+ob1ZT8gWqSjVh6a
	5xsUcSvkqwakDVIbEnZy9fRffDZI/DzqeDduU9aTXPYcHe8gTJVFoiEH4WZHk33c7EUT
	F8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b4/IWWT5C8oyaKJlaJCr6sOShycQoOktYF3MsfXOWjk=;
	b=dGtCVFzvlrrTnhw6p+jKF34cGwHvulhitzc67NQlje/VUjqDFUD8EqleADG1mkHjyl
	ZCLy2ZzfVE6NDJXCi4Z7naaE575h3Z6RuGHdIZ7TJoF6rVKOT6EIE4XNynq8lJB+4qaN
	4yxADhySNqShiSCgFM78y2+Fc7Ehxa0gBXA8AkfgNowPGyUPe5Ssbyjnnh8G67DZCudQ
	3NxxoeZxFDTuUlNFc2kDAowAWxzOdUC3kbLLCq9eXY/UJ11nd7sgp1IN+aA1mfsTzdsi
	mrgiZFaH3wXBVUDlu6Esih84sjE1GtW1LaF1u4pcfMWrVII0gsVml8IWp+iKdSI3qTWW
	e+bQ==
X-Gm-Message-State: APjAAAUpWbqzZN20Z+rtlWW6NuXX65XNB0oozH+1UlKUC5EogGOYIHuX
	GtDzVBZcSTiJ9LK1Ob2zwg7WnK/GnJhp7fC98gI=
X-Google-Smtp-Source: APXvYqy6fqn0i/Ga3e79/WI3ce5SE6BU+jA3OQ5z/GWfThbSIdbll9oGfbT41VutkcHrG+KvrRGNOKwM5rGiNOIqlTc=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr36181571qkg.337.1565746111255; 
	Tue, 13 Aug 2019 18:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190813051518.27073-1-dan.callaghan@opengear.com>
In-Reply-To: <20190813051518.27073-1-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 18:28:05 -0700
Message-ID: <CAMKF1sqX0ZQHNczqZDbJKSEzBjkCgrQ273vBNXV0RSyLX+yUvA@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-pystemd: add new recipe
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
X-List-Received-Date: Wed, 14 Aug 2019 01:28:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 12, 2019 at 10:15 PM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> This library provides wrappers around the systemd DBus API for
> manipulating systemd services.
>
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  .../recipes-devtools/python/python3-pystemd_0.6.0.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
> new file mode 100644
> index 000000000..6c6e9ad5d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Python bindings for interacting with systemd over DBus"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI[md5sum] = "c5472be419f53f53f5da089ca8c981c0"
> +SRC_URI[sha256sum] = "b1fc072c87e3766711f64caf86fd633dca393e20c8a0a37a5058dd70a21d8a14"
> +
> +DEPENDS = "systemd"

We have to also check for systemd in REQUIRED_DISTRO_FEATURE
or else it can cause errors e.g.

ERROR: Nothing PROVIDES 'systemd' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'systemd' (not in
DISTRO_FEATURES)



> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

