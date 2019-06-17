Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id C16857DE38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:51:23 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id c11so5464140qkk.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 22:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CXJQi8e2RqxLXaxQv00gvVAbX5/xjddZzj8LRkWfmFA=;
	b=d2Pw45v3zH1mG1HEii9C9UN9slyrryNmlzYUeRUBb+p7HxnxCQy/P7PgAGeHgNAWbA
	xtCZl5lJCP6UEWO3ywwzCpja/zuXNczcG8cXFNAXDH6N//IMyj6yZqkCJee0O319YRU6
	jUIx8Dn7Hsu1HlgNhdz4rxf5P/uzGZVlk662/P/Ig0Mnq8AzPuNE8wncXx027ToK+KXk
	LuXP+mLSeRSgjuuF2P4aM+ZwsZnjn/l+f7p4HGkKERsNIi1HhG7SP0JIqcRBq8d6UPPh
	8LP9oknliOJxp7kxV0dfae4dtAPSN+fKeVE/KCnq3Q9N8p44+jZZHyUhK/2WCfWMBLo2
	6IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CXJQi8e2RqxLXaxQv00gvVAbX5/xjddZzj8LRkWfmFA=;
	b=Vrn6+BlTpcalnj+dS3P9M/UctesKf/ehtEitkUCD+qcSMA5b8cAcsi1ZJwQBjt77Fk
	NEMHPRUetK3UBDuPpRiacTBPnh8rrhQuHvrPhVkK8IHOkHBZ4+gAUE8Z/A9bl202Gfj0
	4Rsn1mA9OTIVokUz7/j4tO498GWGIu9qQF+oM54qcaqnVpFlCOC+BXz+T7df5Gim+OqP
	gGdtSbSK6NY8M9RvRKp1pKqMnyAGlIHKUqPciKb5oTU3LYk8JxiLh3j/67TAo78Tcblf
	HUQih06mL72BqHxOdpfla9Q3AMwBiou01MFBuB+f68f07DDYNRbKXpdbZpB+sZk+1iRJ
	Mktw==
X-Gm-Message-State: APjAAAVjpTKA83N91Lcwql+4lz71MIxgw7En0t3Q/JmmMUPlBFtY7KuL
	LM38nWP8a6Fm/j0psBvXRQ6SyeqR4nuxSIInzdXW7zcM
X-Google-Smtp-Source: APXvYqyTBqGMK8was9tZCbI2g94wxSUHEqSmAR1pVzDvXDF0Qga5vsuNEYgztwpX0tdHFn3XCnpZCzk7vJqea5itbcw=
X-Received: by 2002:a37:b0c6:: with SMTP id
	z189mr38684059qke.208.1560750684309; 
	Sun, 16 Jun 2019 22:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190601045815.30790-1-thstead@steadtechnology.co.uk>
In-Reply-To: <20190601045815.30790-1-thstead@steadtechnology.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jun 2019 22:50:58 -0700
Message-ID: <CAMKF1spavEc8viLvhVV+VbXadEmssW8LiTFpFVAEJAOJ0E1NDg@mail.gmail.com>
To: thstead <thstead@steadtechnology.co.uk>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Created recipes for python2 and python3 packages for pysnmp and its dependencies.
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
X-List-Received-Date: Mon, 17 Jun 2019 05:51:23 -0000
Content-Type: text/plain; charset="UTF-8"

this has gone stale and does not apply on top of master anymore. Can
you please rebase it and send again

On Fri, May 31, 2019 at 9:58 PM thstead <thstead@steadtechnology.co.uk> wrote:
>
> Created Python2 and Python 3 packages for:
> - pysnmp
> - ply
> - pysmi
>
> Signed-off-by: thstead <thstead@steadtechnology.co.uk>
> ---
>  meta-python/recipes-devtools/python/python-ply.inc | 17 ++++++++++++++
>  .../recipes-devtools/python/python-ply_3.10.bb     | 18 ++-------------
>  .../recipes-devtools/python/python-pysmi.inc       | 19 +++++++++++++++
>  .../recipes-devtools/python/python-pysmi_0.1.2.bb  | 21 ++---------------
>  .../recipes-devtools/python/python-pysnmp.inc      | 21 +++++++++++++++++
>  .../recipes-devtools/python/python-pysnmp_4.4.9.bb | 27 +++-------------------
>  .../recipes-devtools/python/python3-ply_3.10.bb    |  3 +++
>  .../recipes-devtools/python/python3-pysmi_0.1.2.bb |  3 +++
>  .../python/python3-pysnmp_4.4.9.bb                 |  5 ++++
>  9 files changed, 75 insertions(+), 59 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-ply.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-pysmi.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-pysnmp.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-ply_3.10.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-python/recipes-devtools/python/python-ply.inc
> new file mode 100644
> index 000000000..8e61efa79
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-ply.inc
> @@ -0,0 +1,17 @@
> +SUMMARY = "Python Lex and Yacc"
> +DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
> +HOMEPAGE = "https://pypi.python.org/pypi/ply"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
> +
> +SRCNAME = "ply"
> +
> +SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
> +SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> diff --git a/meta-python/recipes-devtools/python/python-ply_3.10.bb b/meta-python/recipes-devtools/python/python-ply_3.10.bb
> index 8e61efa79..6f5c4e6c8 100644
> --- a/meta-python/recipes-devtools/python/python-ply_3.10.bb
> +++ b/meta-python/recipes-devtools/python/python-ply_3.10.bb
> @@ -1,17 +1,3 @@
> -SUMMARY = "Python Lex and Yacc"
> -DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/ply"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
> -
> -SRCNAME = "ply"
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
> -SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>  inherit setuptools
> +require python-ply.inc
> +
> diff --git a/meta-python/recipes-devtools/python/python-pysmi.inc b/meta-python/recipes-devtools/python/python-pysmi.inc
> new file mode 100644
> index 000000000..12ba0c68a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pysmi.inc
> @@ -0,0 +1,19 @@
> +SUMMARY = "SNMP SMI/MIB Parser"
> +DESCRIPTION = "A pure-Python implementation of SNMP/SMI MIB \
> +  parsing and conversion library. Can produce PySNMP MIB modules. \
> +"
> +HOMEPAGE = "https://pypi.python.org/pypi/pysmi"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d8b1bbadd635f187dee74d999a8c67b8"
> +
> +SRCNAME = "pysmi"
> +
> +SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "f8754e9ed75698cc16b40f125df85b12"
> +SRC_URI[sha256sum] = "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> index aa234dd70..2fe56ca04 100644
> --- a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> @@ -1,22 +1,5 @@
> -SUMMARY = "SNMP SMI/MIB Parser"
> -DESCRIPTION = "A pure-Python implementation of SNMP/SMI MIB \
> -  parsing and conversion library. Can produce PySNMP MIB modules. \
> -"
> -HOMEPAGE = "https://pypi.python.org/pypi/pysmi"
> -SECTION = "devel/python"
> -
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d8b1bbadd635f187dee74d999a8c67b8"
> -
> -SRCNAME = "pysmi"
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "f8754e9ed75698cc16b40f125df85b12"
> -SRC_URI[sha256sum] = "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>  inherit setuptools
> +require python-pysmi.inc
>
>  RDEPENDS_${PN} = "python-ply"
> +
> diff --git a/meta-python/recipes-devtools/python/python-pysnmp.inc b/meta-python/recipes-devtools/python/python-pysnmp.inc
> new file mode 100644
> index 000000000..9b67f6bc7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pysnmp.inc
> @@ -0,0 +1,21 @@
> +SUMMARY = "A pure-Python SNMPv1/v2c/v3 library"
> +DESCRIPTION = "SNMP v1/v2c/v3 engine and apps written in pure-Python. \
> +  Supports Manager/Agent/Proxy roles, scriptable MIBs, asynchronous \
> +  operation (asyncio, twisted, asyncore) and multiple transports.\
> +"
> +HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
> +
> +SRCNAME = "pysnmp"
> +
> +SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "6d1b514997326bed18f1ae1510f6b1c9"
> +SRC_URI[sha256sum] = "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
> +
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +RDEPENDS_${PN} += "python-pycrypto"
> diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> index 9ff4df2c9..c36d69b6a 100644
> --- a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> +++ b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> @@ -1,26 +1,5 @@
> -SUMMARY = "A pure-Python SNMPv1/v2c/v3 library"
> -DESCRIPTION = "SNMP v1/v2c/v3 engine and apps written in pure-Python. \
> -  Supports Manager/Agent/Proxy roles, scriptable MIBs, asynchronous \
> -  operation (asyncio, twisted, asyncore) and multiple transports.\
> -"
> -HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
> -
> -SRCNAME = "pysnmp"
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "6d1b514997326bed18f1ae1510f6b1c9"
> -SRC_URI[sha256sum] = "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
> -
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>  inherit setuptools
> +require python-pysnmp.inc
> +
> +RDEPENDS_${PN} += "python-pyasn1 python-pysmi"
>
> -RDEPENDS_${PN} += "python-pycrypto \
> -                   python-pyasn1 \
> -                   python-pysmi \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-ply_3.10.bb b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
> new file mode 100644
> index 000000000..401dd0df5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-ply.inc
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb b/meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb
> new file mode 100644
> index 000000000..829f16682
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-pysmi.inc
> +RDEPENDS_${PN} = "python3-ply"
> diff --git a/meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.bb b/meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.bb
> new file mode 100644
> index 000000000..046d3e5d0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.bb
> @@ -0,0 +1,5 @@
> +inherit setuptools3
> +require python-pysnmp.inc
> +
> +RDEPENDS_${PN} += "python3-pyasn1 python3-pysmi"
> +
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

