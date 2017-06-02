Return-Path: <moritz.fischer@ettus.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8567F77E79
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 19:01:30 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c184so42870858lfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7FsXVzUp5vk0kLaIDEnQutWvFNhE3pfhFFcFtwPRhh8=;
	b=HBMlMXbFjM95/itANNqEhuM9tNlCC4GkdVjXZTMdZm0X9jXJiv9EfMVqaJSWrFt0Vm
	S4q4hEJIVtkKswjlDQybzRu95PBa6++LNC+TGRjbO0givE0LH+z7XkpR8wqhH63jo9a9
	oQxFDgn62eD/zkcYXnRwVCP8ppa8DLkV4NnzaOSU3Gw+KkSB6ySe/cV8GLxJStkS5py9
	tZhB4m/lsQf24JKKYMaFWFaMhmEF5YZfEOu2idJDRXBC4WcgD/HubXWQgTZ+fhLSn6kL
	BQcJ+4jZf/728gkp0vDJzH2f8Q6MJicND2Fcl/kZnGyF9a4L9+A+JLinWKCDb2C7gkwf
	NqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7FsXVzUp5vk0kLaIDEnQutWvFNhE3pfhFFcFtwPRhh8=;
	b=WHXB1GJZ4B5Pd8Mn/kHoB2ekIzk0rvykoN9ffJBUvzqCFkP710whkPruAvE1o1MIx1
	dUkUw7YxbyratzPAH+Jy8+LxJZ4Gz044Q8mzRZYP0e1iKrzXF0HowdEjhCVsy7c525hc
	WwOJgIPg1F/4ezQ+UGOoy0NaurBBNyouNOBnv64B0gqLkT86jeb0uDOKyy1OH3iYYERs
	ITI5JYmORFXdhDfXPI00UX657N0EhTfB1v1pffvnkUtIKM6RXF9ulphCA/Dg1sMqazZ1
	rzHy24ovQjt9Tjr/Y2Tj8Xv49jb4SeZ3LIbOq2juyk7umY0hRMODTnyu65+mpZcVIldG
	kyVg==
X-Gm-Message-State: AODbwcAkwdx3Ri7/PpwEEvNodrsLfcoiL25i20qIr2vkBWqA9kWifBYI
	VCDqECj7EmQL6CASc0KbMB7IRnPZF+ctxFHdMw==
X-Received: by 10.25.207.67 with SMTP id f64mr1211152lfg.95.1496430089893;
	Fri, 02 Jun 2017 12:01:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.82.141 with HTTP; Fri, 2 Jun 2017 12:01:29 -0700 (PDT)
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Fri, 2 Jun 2017 12:01:29 -0700
Message-ID: <CAAtXAHcLHiNV+74BbvMLkm1nxgQka1ybPfDgF7cxgNJ8h-jrxA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: paul.eggleton@linux.intel.com
Subject: Re: [meta-python][PATCH 1/8] python-pyudev: Add possibility to build python3-pyudev
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
X-List-Received-Date: Fri, 02 Jun 2017 19:01:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Thu, Jun 1, 2017 at 9:42 AM, Moritz Fischer <moritz.fischer@ettus.com> wrote:
> Extend recipe to support python3 as well.
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../recipes-devtools/python/python-pyudev.inc      | 22 ++++++++++++++++++++
>  .../python/python-pyudev_0.21.0.bb                 | 24 ++--------------------
>  .../python/python3-pyudev_0.21.0.bb                |  2 ++
>  3 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-pyudev.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pyudev.inc b/meta-python/recipes-devtools/python/python-pyudev.inc
> new file mode 100644
> index 0000000..7103e1b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyudev.inc
> @@ -0,0 +1,22 @@
> +SUMMARY = "A libudev binding"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> +
> +SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
> +SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
> +
> +inherit pypi
> +
> +do_configure_prepend() {
> +    sed -i "/import pyudev/d" ${S}/setup.py
> +    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
> +}
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-ctypes \
> +    ${PYTHON_PN}-contextlib \
> +    ${PYTHON_PN}-misc \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-subprocess \
> +    ${PYTHON_PN}-threading \
> +"
> diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
> index 7253f88..1ce7c44 100644
> --- a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
> +++ b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
> @@ -1,22 +1,2 @@
> -SUMMARY = "A libudev binding"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> -
> -SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
> -SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
> -
> -inherit pypi setuptools
> -
> -do_configure_prepend() {
> -    sed -i "/import pyudev/d" ${S}/setup.py
> -    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
> -}
> -
> -RDEPENDS_${PN} = "\
> -    ${PYTHON_PN}-contextlib \
> -    ${PYTHON_PN}-ctypes \
> -    ${PYTHON_PN}-misc \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-subprocess \
> -    ${PYTHON_PN}-threading \
> -"
> +require python-pyudev.inc
> +inherit setuptools
> diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> new file mode 100644
> index 0000000..1474ffa
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> @@ -0,0 +1,2 @@
> +require python-pyudev.inc
> +inherit setuptools3
> --
> 2.7.4
>

Ok, seems there was a better patch for this one earlier.
Please ignore [1/8].

Thanks,

Moritz

