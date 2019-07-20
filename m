Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 294597F0C2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 18:11:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r21so25743335qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 11:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qyh0yrPgj/TuJWhjOdHP2UcCDIL4ae52aH+CYIdhv6A=;
	b=AOxOMRB43YUbW/pvEgE1avbrwIovdVoDxI/B9mq2aEET1VH49wRzekhlN8Y/IhyowH
	7XwDPY87nEhgJn6ve8btBIFjyOJc+rLvIPCIx7X9ncinx+0PTVXnI0kJxBq8+UNYFEBo
	mBfnR4vLvcplRPc80ekXiSvheKCEn697FDBFgAC/s4sXaSV3RemRpE5XaLOsoPEIje20
	BjSShfagqLgH0R2Fof4n3GMPz5WQ8twlXGimGsOJ2hTpxsltVebGTqWt/450skLobmhB
	qj2Tw9jeSKDMBJIEdtvplbrMlgJK65QFGWu4/0wqUrconhfVQOLG6+L1sZA19rMMsIZ4
	k1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qyh0yrPgj/TuJWhjOdHP2UcCDIL4ae52aH+CYIdhv6A=;
	b=d7G+PFxTJxFfO+EpYveJf+l8czVwuSTAt0aO6k47K5OTwxEQmEJXNsq+d8ywgQ0dIg
	U0Rxkf/pPW+yVq8vStJFr9Pv8xxd6heTR4M+yWx8BhuBxi3n6onrKcZMH9Agos/hOQ8S
	kGKjFmrDuyT/aiQXkl01YrKgYGpUSEMNLbnYeJCq8uBdQsQz0rfPag0wwcCnAwJPZ+44
	Inr8xiuuuZ2a+kqEBpBI7uSlmfk02lWHCHlgmb7SD4MR81+E9wSMzpSomHGd4dHLuuce
	klzvipd7PuIATkX3s6deigVThmJi/K0KU8JWl6rwLHTG832kl+e5xBPOv4wE5RxKaWDc
	U9tw==
X-Gm-Message-State: APjAAAVRuvI8toy8XTI23Bb7FDn4yi1ppNqIJVSS6vfcGAoju1p61oyv
	7grJQ7C/KkjSOoDKX0eP+xLjkl8/jVouYmoarLbWcwZ6qfk=
X-Google-Smtp-Source: APXvYqz3oRaguUfd8Tg8PY1/HYCQR+YC+md7O/c9tctcJzMBtr/i11wdEEjm4dNe8HJegrN4ibN+FtenZOZF+juF+rU=
X-Received: by 2002:a37:4243:: with SMTP id p64mr21899495qka.9.1563646290821; 
	Sat, 20 Jul 2019 11:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1563602668-35526-1-git-send-email-andromeda@intel.com>
	<AA9B40170ABA1047B45E714CB2B866B706BC069D@PGSMSX103.gar.corp.intel.com>
In-Reply-To: <AA9B40170ABA1047B45E714CB2B866B706BC069D@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Jul 2019 11:11:04 -0700
Message-ID: <CAMKF1soCg3ytMiOoy63ePT+nR1kpnj8ntuNTjg0cngBKJX3NmA@mail.gmail.com>
To: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 18:11:30 -0000
Content-Type: text/plain; charset="UTF-8"

Parsing errors seen

18:07:40 ERROR: Nothing PROVIDES 'python3-dbus-native' (but
/mnt/jenkins/workspace/yocto-world/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
DEPENDS on or otherwise requires it). Close matches:
18:07:40   python3-absl-native
18:07:40   python3-gitdb-native
18:07:40   python3-six-native
.....

18:07:41 ERROR: Nothing RPROVIDES 'python3-pyatspi' (but
/mnt/jenkins/workspace/yocto-world/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
RDEPENDS on or otherwise requires it)
18:07:41 No eligible RPROVIDERs exist for 'python3-pyatspi'
18:07:41 ERROR: Nothing RPROVIDES 'python3-pyatspi-dev' (but
/mnt/jenkins/workspace/yocto-world/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
RDEPENDS on or otherwise requires it)
18:07:41 No eligible RPROVIDERs exist for 'python3-pyatspi-dev'


On Fri, Jul 19, 2019 at 11:17 PM Chan, Aaron Chun Yew
<aaron.chun.yew.chan@intel.com> wrote:
>
> From: Aaron Chan <aaron.chun.yew.chan@intel.com>
>
> pyatspi provide python3 support for Assistive Technology Service Provide Interface (AT-SPI2) protocol over Dbus.
>
> This is useful not only for Accessibility (a11y) but also provides a medium for automation of GUI testing (such as python3-dogtail).
>
> Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
> ---
>  .../recipes-devtools/python/python3-pyatspi_2.32.1.bb    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> new file mode 100644
> index 0000000..6d80c10
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Python bindings for DBus AT-SPI2 accessibility"
> +DESCRIPTION = "AT-SPI2 is a protocol over DBus, toolkit widgets use to provide content to screen readers such as Orca"
> +SECTION = "devel/python"
> +HOMEPAGE = "https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886 \
> +                    file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
> +DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
> +
> +SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=gnome-3-32"
> +SRCREV = "dc4565208fca00da06b972915a080ad3c63f640d"
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools python3native
> +
> +FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
> --
> 2.7.4
>

