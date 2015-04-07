Return-Path: <ticotimo@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id CB81A73C63
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 16:11:20 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so15983727igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DDF7qcnWob+GV6PFc429RscCAbAFoiCjCtsls6fPrA8=;
	b=Y44ExPZJ70daehXNpXfdjAAIpKb+mEap46P15IPN0PIVzOg3Wt/FpnV5wL/L7sju6j
	/kPr4ZBqeiV//a1VdwazN+lMQZZy8hEcJHOfNJvypfpVa1e8T+58wJrLxjUVg2Xe0bNb
	XNfPxiZ0zjLbMfCRosPw1Cs8uhoASaTfyfCo61Z2CsYyIHWOV4hn6+qn4/aClmNMYl9m
	1T2kT+s+yhPVYJBuIWk+AENChmYLNyXG+xZO28vxJn3cpUdCJORlsMOiUUSXOSYE8lSc
	zhlpquEQeKUtpCK/Cp6f1NvAWNHy1ra4HBS3qMMaYs6TCW81GIOSYF2EXhiDGUEAl7hm
	ZjTQ==
MIME-Version: 1.0
X-Received: by 10.50.79.233 with SMTP id m9mr4893164igx.45.1428423081095; Tue,
	07 Apr 2015 09:11:21 -0700 (PDT)
Received: by 10.36.76.151 with HTTP; Tue, 7 Apr 2015 09:11:21 -0700 (PDT)
In-Reply-To: <1427494862-25016-3-git-send-email-obi@opendreambox.org>
References: <1427494862-25016-1-git-send-email-obi@opendreambox.org>
	<1427494862-25016-3-git-send-email-obi@opendreambox.org>
Date: Tue, 7 Apr 2015 09:11:21 -0700
Message-ID: <CANx9H-CZqgf7uUyjOWVWbgzEax-m7J7ZFvUsDt6dOYzPZwSWZQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/3] python-pyopenssl: Downgrade to 0.13
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
X-List-Received-Date: Tue, 07 Apr 2015 16:11:27 -0000
Content-Type: text/plain; charset=UTF-8

I have python-cryptography building. After testing on multiple
architectures and dependency checking, I will submit to ML. ETA 1 to 2 days.

--Tim

On Fri, Mar 27, 2015 at 3:21 PM, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Version 0.14 depends python-cryptography, which is
> currently unavailable in meta-openembedded.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../python-pyopenssl-0.13/x509_revoked_dup.patch      | 19
> +++++++++++++++++++
>  ...hon-pyopenssl_0.14.bb => python-pyopenssl_0.13.bb} | 11 ++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
>  rename meta-python/recipes-devtools/python/{python-pyopenssl_0.14.bb =>
> python-pyopenssl_0.13.bb} (68%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
> b/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
> new file mode 100644
> index 0000000..c386e9c
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
> @@ -0,0 +1,19 @@
> +diff -Naur pyOpenSSL-0.13.orig/OpenSSL/crypto/crl.c
> pyOpenSSL-0.13/OpenSSL/crypto/crl.c
> +--- pyOpenSSL-0.13.orig/OpenSSL/crypto/crl.c   2011-09-02
> 17:46:13.000000000 +0200
> ++++ pyOpenSSL-0.13/OpenSSL/crypto/crl.c        2015-03-26
> 20:53:08.984999223 +0100
> +@@ -3,6 +3,7 @@
> + #include "crypto.h"
> +
> +
> ++#if 0
> + static X509_REVOKED * X509_REVOKED_dup(X509_REVOKED *orig) {
> +     X509_REVOKED *dupe = NULL;
> +
> +@@ -32,6 +33,7 @@
> +     dupe->sequence = orig->sequence;
> +     return dupe;
> + }
> ++#endif
> +
> + static char crypto_CRL_get_revoked_doc[] = "\n\
> + Return revoked portion of the CRL structure (by value\n\
> diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
> b/meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
> rename to meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
> index 1f609e3..cf9d73e 100644
> --- a/meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
> +++ b/meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
> @@ -7,15 +7,16 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRCNAME = "pyOpenSSL"
>
>  DEPENDS = "openssl"
> +PE = "1"
>
> -SRC_URI = "
> http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "8579ff3a1d858858acfba5f046a4ddf7"
> -SRC_URI[sha256sum] =
> "a99db8e59c120138ad8a72eecedcc24b4510d2eed3ce48213b7e32f22cc4ee6e"
> +SRC_URI = "
> http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz
> \
> +           file://x509_revoked_dup.patch"
> +SRC_URI[md5sum] = "767bca18a71178ca353dff9e10941929"
> +SRC_URI[sha256sum] =
> "21e12b03abaa0e04ecc8cd9c251598f71bae11c9f385304234e4ea5618c6163b"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit setuptools
> +inherit distutils
>
>  PACKAGES =+ "${PN}-tests"
>  FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

