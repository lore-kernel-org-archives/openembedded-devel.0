Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id E742660043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 04:44:03 +0000 (UTC)
Received: by lagz9 with SMTP id z9so19824176lag.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 21:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ek+T33mShyEugr/BYCGg07Y0bQQMpZllY8d1fK9Zo+c=;
	b=mybGePgp69YsKHVXvTFAoMcSuvdrDgV017XG3fFpeTJE9BtFezfBD6WpH2r7zmECUY
	gCqAIYq0sPC/ZAlN7aQR4xqq0Mbf5ZTbCoiVuIffT7fwsWviAhpDXnYtNT+v95aY7l/I
	HPVN5Hik4H+aAC6H//ZiqouVKQj3hxXEa3lNHLQaIHZlDBSFBDTwkg0VE/lILpCHWKsn
	1vsYhzITz2YUm+xEDRwWHklIy9DfIkT0uH4E5OEP7GPSTuOBJoVxHUpnt7UiCuzkRvDn
	Az9l6WxGLBgvmBL1Dd9NyF20Viq3bwBldVzV73JAJeK2C19NfdFvDiM+feJWod84ddog
	b5YA==
MIME-Version: 1.0
X-Received: by 10.152.87.20 with SMTP id t20mr19897054laz.80.1439441041742;
	Wed, 12 Aug 2015 21:44:01 -0700 (PDT)
Received: by 10.25.15.38 with HTTP; Wed, 12 Aug 2015 21:44:01 -0700 (PDT)
In-Reply-To: <1439412762-20356-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1439412762-20356-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Wed, 12 Aug 2015 21:44:01 -0700
Message-ID: <CANx9H-Buaf+WfvPKaeiL_r+8VAefNwdXq4QuVQ2ruZTGGivnig@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2] python-pyinotify: add recipe
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
X-List-Received-Date: Thu, 13 Aug 2015 04:44:04 -0000
Content-Type: text/plain; charset=UTF-8

Acked: Tim Orling <ticotimo@gmail.com>

On Wed, Aug 12, 2015 at 1:52 PM, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Python bindings for Linux inotify mechanism
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  .../recipes-devtools/python/python-pyinotify_0.9.6.bb   | 17
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pyinotify_0.9.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
> b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
> new file mode 100644
> index 0000000..42956ce
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
> +HOMEPAGE = "https://pypi.python.org/pypi/pyinotify"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
> +
> +RDEPENDS_${PN} += "python-threading python-io python-subprocess
> python-misc python-shell"
> +
> +SRCNAME = "pyinotify"
> +SRC_URI = "
> https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> "
> +
> +SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
> +SRC_URI[sha256sum] =
> "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

