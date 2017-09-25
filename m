Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id A7F5C71B1D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:19:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1506377989; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=iuEj+PB/TMx19GNO0i/RvK+ffRYZ+g4ba3CWwzNbMmc=;
	b=MXPRKJn22KOGgn+8NAAQ76H7D3w6EBnuKTFpCzlm5+58mXvg7tnyMIlUpyZWIi42vJk17RHN
	pPlyGBzD96YTqivmVlJBuyyDDWC5VHDEzJYvzCZj38265JBbzDLPVtiQaXQa0mMXEcRIMkgk
	5HpTqlQ4G0whkM4DKxiIm53vfYI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=TQwuyoK+0dg4yM/6cTfuAWFzxGCB0LKQmxt2xLz08NI0txQLMdMt/mNKkEwxOwLYPWcnW3
	dFGBbpNYDLAeuNGIX7Nnn0oU2edj5vMjUjAlm4WgOEiRFI7Lx+X1j5lS8bNjItU2P3s7LmbA
	ZWa+S+PmLiv1Xl8hWYpofIxXRQKeQ=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mxa.mailgun.org with ESMTP id 59c98103.7f69441c7470-smtp-out-n01;
	Mon, 25 Sep 2017 22:19:47 -0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id d16so11130888ioj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:19:47 -0700 (PDT)
X-Gm-Message-State: AHPjjUjMVkGpOSK/4hnNYqcOj7SIrqJrIooLIcg2NxTTxSb+5RjHpq+U
	2fZEL6ctumLNwfcu1kIu4ZN4145jYzhIkHiq0J8=
X-Google-Smtp-Source: AOwi7QBSyYI43e8OcFiY9JQmV3QH7oMfSIuEn2zBnBrDv005EceuuPBQGK9Sr+d8J3pnJCOtNoabHCtv1TirsyTiS8I=
X-Received: by 10.107.164.97 with SMTP id n94mr12454208ioe.162.1506377986699; 
	Mon, 25 Sep 2017 15:19:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.180.6 with HTTP; Mon, 25 Sep 2017 15:19:46 -0700 (PDT)
In-Reply-To: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
From: Derek Straka <derek@asterius.io>
Date: Mon, 25 Sep 2017 18:19:46 -0400
X-Gmail-Original-Message-ID: <CADNbA1oKctWV7oFCMupgbL11QzhTki+LDSp1PazmP_VsLpVYzw@mail.gmail.com>
Message-ID: <CADNbA1oKctWV7oFCMupgbL11QzhTki+LDSp1PazmP_VsLpVYzw@mail.gmail.com>
To: Guy Morand <guy@guy-morand.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/3] Add python3 matplotlib
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
X-List-Received-Date: Mon, 25 Sep 2017 22:19:48 -0000
Content-Type: text/plain; charset="UTF-8"

The directory layout for the .inc and python3 recipe doesn't match the rest
of the repo.  Same for the other patches in this patchset.

On Fri, Sep 22, 2017 at 6:24 AM, Guy Morand <guy@guy-morand.ch> wrote:

> ---
>  .../python-matplotlib/files/0001-fix_setup.diff    | 13 +++++++++
>  .../python/python-matplotlib/python-matplotlib.inc | 32
> ++++++++++++++++++++++
>  .../python-matplotlib/python3-matplotlib_2.0.2.bb  |  6 ++++
>  3 files changed, 51 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-matplotlib/
> files/0001-fix_setup.diff
>  create mode 100644 meta-python/recipes-devtools/python/python-matplotlib/
> python-matplotlib.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-matplotlib/
> python3-matplotlib_2.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-
> matplotlib/files/0001-fix_setup.diff b/meta-python/recipes-
> devtools/python/python-matplotlib/files/0001-fix_setup.diff
> new file mode 100644
> index 0000000..8f1b505
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-
> matplotlib/files/0001-fix_setup.diff
> @@ -0,0 +1,13 @@
> +Index: matplotlib-2.0.2/setupext.py
> +===================================================================
> +--- matplotlib-2.0.2.orig/setupext.py
> ++++ matplotlib-2.0.2/setupext.py
> +@@ -182,7 +182,7 @@ def get_base_dirs():
> +         'gnu0': ['/usr'],
> +         'aix5': ['/usr/local'],
> +         }
> +-    return basedir_map.get(sys.platform, ['/usr/local', '/usr'])
> ++    return basedir_map.get(sys.platform, [os.environ['STAGING_LIBDIR']])
> +
> +
> + def get_include_dirs():
> diff --git a/meta-python/recipes-devtools/python/python-
> matplotlib/python-matplotlib.inc b/meta-python/recipes-
> devtools/python/python-matplotlib/python-matplotlib.inc
> new file mode 100644
> index 0000000..74dcf97
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-
> matplotlib/python-matplotlib.inc
> @@ -0,0 +1,32 @@
> +SUMMARY  = "Matplotlib produces publication quality figures"
> +DESCRIPTION = "Matplotlib is a Python 2D plotting library which produces \
> +publication quality figures in a variety of hardcopy formats and
> interactive \
> +environments across platforms. Matplotlib can be used in Python scripts,
> the \
> +Python and IPython shell, the jupyter notebook, web application servers,
> and \
> +four graphical user interface toolkits."
> +HOMEPAGE = "https://matplotlib.org/"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=
> afec61498aa5f0c45936687da9a53d74"
> +
> +PYPI_PACKAGE = "matplotlib"
> +
> +inherit pypi
> +
> +SRC_URI += "\
> +  file://0001-fix_setup.diff \
> +  "
> +
> +DEPENDS += " \
> +  ${PYTHON_PN}-numpy-native \
> +  freetype \
> +  libpng \
> +  "
> +
> +RDEPENDS_${PN} += " \
> +  ${PYTHON_PN}-numpy \
> +  ${PYTHON_PN}-dateutil \
> +  ${PYTHON_PN}-pyparsing \
> +  ${PYTHON_PN}-pytz \
> +  ${PYTHON_PN}-six \
> +  ${PYTHON_PN}-cycler \
> +  "
> diff --git a/meta-python/recipes-devtools/python/python-matplotlib/
> python3-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-
> matplotlib/python3-matplotlib_2.0.2.bb
> new file mode 100644
> index 0000000..7e309b2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-matplotlib/
> python3-matplotlib_2.0.2.bb
> @@ -0,0 +1,6 @@
> +inherit setuptools3
> +require python-matplotlib.inc
> +
> +SRC_URI[md5sum] = "061111784278bde89b5d4987014be4ca"
> +SRC_URI[sha256sum] = "0ffbc44faa34a8b1704bc108c451ec
> f87988f900ef7ce757b8e2e84383121ff1"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

