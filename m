Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id C2FCB6060F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 19:50:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1501703459; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=wo46PIC4U/SV6LmNc26PTSZk1QwSNz3/4t9UoO+3cpA=;
	b=nHemvZtYrtGs5FwIL30sdr73wT6bKRy4wJSez00Sd3Bx7lfGetWX+Ks6NPVzubF2d271PG0z
	VwmwBOk6E8vtpeapjwjBc+ebW59+PfpiRFVwIDsljg0xa8Navfmhr+vCNYMog2Fss0x5wAnX
	9EALt3WEIYYMq9luD3CqwxAEmzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=VE/XiVOkioYxy3vvxyaM7t/zHhNQMmUkY7/NX85bI4rz/NJXuIjz5/zQ7aDsL9cFZ9SJFW
	pOVCQvkUuv74tg4/1dZqKPmWcDLV3GkbwReYBsh2znVm5SQAf/l9tsqElaJw34sT1blY8gWc
	lxIQoulLqEKXMn7/8rWf1OxqjTZ1Q=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mxa.mailgun.org with ESMTP id 59822d22.7f63784123b0-smtp-out-n03;
	Wed, 02 Aug 2017 19:50:58 -0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id h199so29087385ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Aug 2017 12:50:57 -0700 (PDT)
X-Gm-Message-State: AIVw113J8psvsuUQybFhBDZpj1FNCVoTB9Mk5RHf58uvp397WsLYWpY6
	Jp5BRtBpGiHc1o4QQqs+TN4903MdnQ==
X-Received: by 10.36.113.70 with SMTP id n67mr6634732itc.39.1501703457458;
	Wed, 02 Aug 2017 12:50:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.198.133 with HTTP; Wed, 2 Aug 2017 12:50:56 -0700 (PDT)
In-Reply-To: <1501523550-30183-1-git-send-email-kevron.m.rees@intel.com>
References: <1501523550-30183-1-git-send-email-kevron.m.rees@intel.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 2 Aug 2017 15:50:56 -0400
X-Gmail-Original-Message-ID: <CADNbA1oGUzHJm=J3WEX6iKDj5W-TV0ojM7RoHg4R6WnOHZDtOA@mail.gmail.com>
Message-ID: <CADNbA1oGUzHJm=J3WEX6iKDj5W-TV0ojM7RoHg4R6WnOHZDtOA@mail.gmail.com>
To: Kevron Rees <kevron.m.rees@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] add recipes for autobahn and txaio
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
X-List-Received-Date: Wed, 02 Aug 2017 19:50:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 31, 2017 at 1:52 PM, Kevron Rees <kevron.m.rees@intel.com>
wrote:

> Signed-off-by: Kevron Rees <kevron.m.rees@intel.com>
> ---
>  .../python-autobahn/python3-autobahn_17.7.1.bb     | 16 ++++++++
>  .../recipes-devtools/python/python3-txaio_2.8.1.bb | 43
> ++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-autobahn/p
> ython3-autobahn_17.7.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-txaio_2.8.1.bb
>
> diff --git a/meta-python/recipes-connectivity/python-autobahn/p
> ython3-autobahn_17.7.1.bb b/meta-python/recipes-
> connectivity/python-autobahn/python3-autobahn_17.7.1.bb
> new file mode 100644
> index 0000000..644fa6c
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-autobahn/p
> ython3-autobahn_17.7.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to
> -17, Hixie-76) framework for creating WebSocket-based clients and servers. \
> +AutobahnPython also includes an implementation of WAMP (The WebSockets
> Application Messaging Protocol), a light-weight,  \
> +asynchronous RPC/PubSub over JSON/WebSocket protocol."
> +HOMEPAGE = "http://autobahn.ws/python"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = " file://autobahn/__init__.py;
> beginline=1;endline=17;md5=3efa50c72bcff15042722ebd09c54701"
> +
> +SRC_URI[md5sum] = "0458295eff8a05b09982e87125a1a2e8"
> +SRC_URI[sha256sum] = "801a318d5bf6776a60f7a93d715f83
> f7f12204b470019a339e4e7e14087c17e6"
> +
> +PYPI_PACKAGE_EXT = "tar.gz"
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} = "python3 python3-txaio"

+
> diff --git a/meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb
> b/meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb
> new file mode 100644
> index 0000000..f6b72c5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb
> @@ -0,0 +1,43 @@
> +# Recipe created by recipetool
> +# This is the basis of a recipe and may need further editing in order to
> be fully functional.
> +# (Feel free to remove these comments when editing.)
>
This should also be removed

> +
> +SUMMARY = "Compatibility API between asyncio/Twisted/Trollius"
> +HOMEPAGE = "https://github.com/crossbario/txaio"

+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best
> guesses - it is
> +# your responsibility to verify that the values are complete and correct.
> +# NOTE: License in setup.py/PKGINFO is: MIT License
>
These should be removed

> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
> +
> +SRC_URI = "https://pypi.python.org/packages/1a/e5/
> 7f9106acf4d12b6f5c30d1e654d8f0f3d7aec6fe13a4fe83895f331e10cf
> /txaio-${PV}.tar.gz"
> +SRC_URI[md5sum] = "2e36cbc6b34b5cacb1bf8a05c1ae114e"
> +SRC_URI[sha256sum] = "fe2e0e4d3a06705f86bbd351fdd1f3
> 9dae61755e44162375e024acbf32eafddb"
> +
> +S = "${WORKDIR}/txaio-${PV}"
> +
> +inherit setuptools3
> +
> +# The following configs & dependencies are from setuptools extras_require.
> +# These dependencies are optional, hence can be controlled via
> PACKAGECONFIG.
> +# The upstream names may not correspond exactly to bitbake package names.
> +#
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?= "dev twisted all"

+PACKAGECONFIG[dev] = ",,,python3-mock python3-pep8 python3-pyenchant
> python3-pytest python3-pytest-cov python3-sphinx python3-sphinx_rtd_theme
> python3-sphinxcontrib-spelling python3-tox python3-twine"
>
 I'm a little confused as to what this is trying to do since most of these
packages do not have recipes.  The default right now will not include
Twisted and zope.interface, which are required dependencies

> +PACKAGECONFIG[twisted] = ",,,python3-twisted python3-zope-interface"
> +PACKAGECONFIG[all] = ",,,python3-twisted python-zope-interface"
> +
> +# WARNING: the following rdepends are from setuptools install_requires.
> These
> +# upstream names may not correspond exactly to bitbake package names.
>
Remove cruft

> +RDEPENDS_${PN} += "python3-six"
> +
> +# WARNING: the following rdepends are determined through basic analysis
> of the
> +# python sources, and might not be 100% accurate.

+#RDEPENDS_${PN} += "python3-contextlib python3-core python3-datetime
> python3-lang python3-logging"
>
Do you want to remove this line?

> +
> +
> +do_install_append() {
> +       echo "removing licence file because why is it installed here?"
> +       rm -rf ${D}/usr/share
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

