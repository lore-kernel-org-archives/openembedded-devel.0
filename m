Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id DC6CE60034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 21:43:21 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so43757909pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=iYFsOkU9gyUpJStoNe8cauubqaBIPCoZnPgEf711+dg=;
	b=LF6XIJfiR2hXbnI7m/6qijujj526mSqa7vi4PGMzs46Nqcf3NECFT+cEnaF1c+tNtl
	Mefy359z/qyVYkQsvWnL5IIiMCvTpaCNQcdT8+f3cb5nZOZuGGfOIP+fL8bTEWCgSYgg
	hmdkCjV63LjiUqKRrqIs1i0xaktaE3fPJcpcsQUYW6/sQJfsk3ZvwQv8vePlIRiHMh3k
	gGpXOKM7LDxKbQ/8IEMXbjYWbMNJp0ZRf6cIBVtOWZVSyQ2rBXSRijaMG01WwZrJCQRE
	WatoFXn6O/qGMjQd7GlxZiliXgyHx2rLmK7HSMORZS6Z0Cl4ybv9QsDO3yXjkTqeSY3m
	oa/g==
X-Received: by 10.70.128.107 with SMTP id nn11mr3779644pdb.67.1422567803052;
	Thu, 29 Jan 2015 13:43:23 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:edf9:51d3:8122:c109?
	([2601:c:a700:272f:edf9:51d3:8122:c109])
	by mx.google.com with ESMTPSA id ms9sm8704272pdb.41.2015.01.29.13.43.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jan 2015 13:43:21 -0800 (PST)
Message-ID: <54CAA977.1000303@gmail.com>
Date: Thu, 29 Jan 2015 13:43:19 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <1422475187-9011-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1422475187-9011-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH] libcap-ng: move pakage from other layers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 21:43:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Did I submit this incorrectly? I don't see it in the patch queue.

- Armin

On 01/28/2015 11:59 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Please consider this package for inclusion to meta-oe so we
> can remove it from both meta-security and meta-selinux.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   .../libcap-ng/libcap-ng/python.patch               | 39 ++++++++++++++++++++++
>   .../recipes-support/libcap-ng/libcap-ng_0.7.4.bb   | 37 ++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
>   create mode 100644 meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
>
> diff --git a/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch b/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
> new file mode 100644
> index 0000000..d82ceb4
> --- /dev/null
> +++ b/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
> @@ -0,0 +1,39 @@
> +configure.ac - Avoid an incorrect check for python.
> +Makefile.am - avoid hard coded host include paths.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +--- libcap-ng-0.6.5/configure.ac.orig	2012-01-17 13:59:03.645898989 -0600
> ++++ libcap-ng-0.6.5/configure.ac	2012-01-17 13:59:46.353959252 -0600
> +@@ -120,17 +120,8 @@
> + else
> + AC_MSG_RESULT(testing)
> + AM_PATH_PYTHON
> +-if test -f /usr/include/python${am_cv_python_version}/Python.h ; then
> +-	python_found="yes"
> +-	AC_MSG_NOTICE(Python bindings will be built)
> +-else
> +-	python_found="no"
> +-	if test x$use_python = xyes ; then
> +-		AC_MSG_ERROR([Python explicitly required and python headers found])
> +-	else
> +-		AC_MSG_WARN("Python headers not found - python bindings will not be made")
> +-	fi
> +-fi
> ++python_found="yes"
> ++AC_MSG_NOTICE(Python bindings will be built)
> + fi
> + AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
> +
> +--- libcap-ng-0.6.5/bindings/python/Makefile.am.orig	2010-11-03 12:31:59.000000000 -0500
> ++++ libcap-ng-0.6.5/bindings/python/Makefile.am	2012-01-17 14:05:50.199834467 -0600
> +@@ -24,7 +24,8 @@
> + CONFIG_CLEAN_FILES = *.loT *.rej *.orig
> + AM_CFLAGS = -fPIC -DPIC
> + PYLIBVER ?= python$(PYTHON_VERSION)
> +-INCLUDES = -I. -I$(top_builddir) -I/usr/include/$(PYLIBVER)
> ++PYINC ?= /usr/include/$(PYLIBVER)
> ++INCLUDES = -I. -I$(top_builddir) -I$(PYINC)
> + LIBS = $(top_builddir)/src/libcap-ng.la
> + pyexec_PYTHON = capng.py
> + pyexec_LTLIBRARIES = _capng.la
> diff --git a/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb b/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
> new file mode 100644
> index 0000000..2e778cb
> --- /dev/null
> +++ b/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "An alternate posix capabilities library"
> +DESCRIPTION = "The libcap-ng library is intended to make programming \
> +with POSIX capabilities much easier than the traditional libcap library."
> +HOMEPAGE = "http://freecode.com/projects/libcap-ng"
> +SECTION = "base"
> +LICENSE = "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
> +
> +SRC_URI = "http://people.redhat.com/sgrubb/${BPN}/${BP}.tar.gz \
> +	   file://python.patch"
> +
> +inherit lib_package autotools pythonnative
> +
> +SRC_URI[md5sum] = "55c57c0673b944ea1a755bcb2636dabd"
> +SRC_URI[sha256sum] = "48a2083276f9820cb92dcb05d001b30733bcbf48c14c230303cac3cd08b45b6b"
> +
> +DEPENDS += "swig-native python"
> +
> +EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
> +
> +PACKAGES += "${PN}-python"
> +
> +FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
> +FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
> +
> +BBCLASSEXTEND = "native"
> +
> +do_install_append() {
> +	# Moving libcap-ng to base_libdir
> +	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> +		mkdir -p ${D}/${base_libdir}/
> +		mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
> +		relpath=${@os.path.relpath("${base_libdir}", "${libdir}")}
> +		ln -sf ${relpath}/libcap-ng.so.0.0.0 ${D}${libdir}/libcap-ng.so
> +	fi
> +}
>

