Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9758B6612D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 10:54:35 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id r79so638187wrb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cnvc4CY1Y5MvzO5LjmesGbQ3xityJFfVGph7/NrADNY=;
	b=FUpC4XwyZwaFmYo2vu4VR1GYdZaZlqTxcxKhGg0xd5d8TDoR/rEo2cjTm0zlISYE8C
	feLGgWdrquoAVbe2flXR+aEM4+k1jd+3TcYETc7emkDsQhIqlDfhg66oHTZcKw4igVds
	4MbKFaYdP8GOcHKPYjyL3MsX5ITYiPcEZioH36BmX0zSHKq4cYmkE1OB0r+8JxyjUa+D
	uxM4+YQ+lGMDC0FWG3v48E5GLYG7MC+yVMUk6ISFpdhIzzFlxe+OtxF67QVOjca9XNJL
	koIK63ywxb3K0Acx8TZldU/5tyJutrFeMZaCtde6f+E4dhVVcpx/VC5BV58x2tGcpjsP
	ritA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cnvc4CY1Y5MvzO5LjmesGbQ3xityJFfVGph7/NrADNY=;
	b=RSZxFD6YyOG9TsG4HmHFy3pcicHhWHaJ5DsBlrne5noLNZtraurO8vvbCWCBtsvN+Y
	FMBTTJiJvAqktKJDF1Or06R/+x9dIbdebiCK6xY8mCn3x1miRSDauRmMdnLI1fNzRHqi
	QLADR91QtVjmWnx/UqRUP7gvczhagPMLpyIFM0WoJLTfSOqAl88p23bmfvO++ImwFFjY
	Gh2nZvJoBUlYXLwa0NbepxefzcdDFm7LGhsQTrz0+iomEl0SMuvQlhZnUSk+apkQHPU2
	a8fvOMbcKJRU4ATG7B6JLtaE3IspJddqRkA0EF4ajJmi+642MlFtb34PSIGl7T0utYbd
	hkVw==
X-Gm-Message-State: AHPjjUgrny3ILicJngh8eZ86kpjqI3TzaPMqP9DdBE4AF0HD6zekBYm8
	B8gVdDWBftZX4EJDLTrJWgn0abaRBOwwtpyCVBzX7g==
X-Google-Smtp-Source: AOwi7QAY+x1XjPcRc4df5+M/tR7rxmr+LX44dTFFRC3ntGd3Rz2TmIoS/1qCTZqqRPL/qHix32AA4JrmT8+jinfrtI0=
X-Received: by 10.223.157.142 with SMTP id p14mr15884421wre.104.1507028076382; 
	Tue, 03 Oct 2017 03:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 03:54:35 -0700 (PDT)
In-Reply-To: <1507021847-30728-1-git-send-email-guy@guy-morand.ch>
References: <1507021847-30728-1-git-send-email-guy@guy-morand.ch>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 12:54:35 +0200
Message-ID: <CA+chaQdtmJZ6WHw7aTwOz885NYYf_dbUVn5zyfrgGDU2JLY_xQ@mail.gmail.com>
To: Guy Morand <guy@guy-morand.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] Add python pandas recipes
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
X-List-Received-Date: Tue, 03 Oct 2017 10:54:36 -0000
Content-Type: text/plain; charset="UTF-8"

We're using 4 spaces for indentation with the closing quote as first
character on separate line, I've already updated your change when
cherry-picking to master-next, so you don't need to resend, just keep this
in mind for future patches.

https://www.openembedded.org/wiki/Styleguide#Format_Guidelines

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc
b/meta-python/recipes-devtools/python/python-pandas.inc
index 2a9b381..d1f3707 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -13,11 +13,11 @@ PYPI_PACKAGE = "pandas"
 inherit pypi

 DEPENDS += " \
-  ${PYTHON_PN}-numpy-native \
-  "
+    ${PYTHON_PN}-numpy-native \
+"

 RDEPENDS_${PN} += " \
-  ${PYTHON_PN}-numpy \
-  ${PYTHON_PN}-dateutil \
-  ${PYTHON_PN}-pytz \
-  "
+    ${PYTHON_PN}-numpy \
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-pytz \
+"
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
index 7b3e60f..20973c8 100644
--- a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
+++ b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
@@ -2,6 +2,6 @@ inherit setuptools
 require python-pandas.inc

 RDEPENDS_${PN} += " \
-  ${PYTHON_PN}-json \
-  ${PYTHON_PN}-importlib \
-  "
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-importlib \
+"


On Tue, Oct 3, 2017 at 11:10 AM, Guy Morand <guy@guy-morand.ch> wrote:

> Signed-off-by: Guy Morand <guy@guy-morand.ch>
> ---
>  .../recipes-devtools/python/python-pandas.inc      | 23
> ++++++++++++++++++++++
>  .../python/python-pandas_0.20.3.bb                 |  7 +++++++
>  .../python/python3-pandas_0.20.3.bb                |  2 ++
>  3 files changed, 32 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pandas.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pandas_0.20.3.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pandas_0.20.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pandas.inc
> b/meta-python/recipes-devtools/python/python-pandas.inc
> new file mode 100644
> index 0000000..2a9b381
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pandas.inc
> @@ -0,0 +1,23 @@
> +SUMMARY  = "pandas library for high-performance data analysis tools"
> +DESCRIPTION = "pandas is an open source, BSD-licensed library providing \
> +high-performance, easy-to-use data structures and data analysis tools for
> \
> +the Python programming language."
> +HOMEPAGE = "http://pandas.pydata.org/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=66017d3134349017409386be85176145"
> +
> +SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
> +SRC_URI[sha256sum] = "a777e07633d83d546c557064201795
> 51c8e01075b53c497dcf8ae4036766bc66"
> +
> +PYPI_PACKAGE = "pandas"
> +inherit pypi
> +
> +DEPENDS += " \
> +  ${PYTHON_PN}-numpy-native \
> +  "
> +
> +RDEPENDS_${PN} += " \
> +  ${PYTHON_PN}-numpy \
> +  ${PYTHON_PN}-dateutil \
> +  ${PYTHON_PN}-pytz \
> +  "
> diff --git a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> new file mode 100644
> index 0000000..7b3e60f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> @@ -0,0 +1,7 @@
> +inherit setuptools
> +require python-pandas.inc
> +
> +RDEPENDS_${PN} += " \
> +  ${PYTHON_PN}-json \
> +  ${PYTHON_PN}-importlib \
> +  "
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
> b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
> new file mode 100644
> index 0000000..b5dd5e0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-pandas.inc
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

