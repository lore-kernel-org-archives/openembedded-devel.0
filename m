Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ro5NG-0004LD-Q2
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 04:42:46 +0100
Received: by lags15 with SMTP id s15so74169lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Rk6nhv3yNuc8LoPiDtbKVlux1/2XzaDd/n8OpBYUu0g=;
	b=wnU3d2f9XYaIcElfY2m4IW4kBWwrTEW1OQxmVCWMWdcT1QeE4LEuXYsncJ1I+6U5Nu
	RQfCOEoQ5SMAA/j31yQsgGMew9b/AWyDzeMvyM3pBGM3eZGzfbWyB5zw/CjT1wBdJ6v/
	Lflf8qBit6HrlSPhVhaV+Y/3P+KuBv74iFVp8=
MIME-Version: 1.0
Received: by 10.112.23.5 with SMTP id i5mr7031612lbf.92.1327030506707; Thu, 19
	Jan 2012 19:35:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.30.135 with HTTP; Thu, 19 Jan 2012 19:35:06 -0800 (PST)
In-Reply-To: <5742b631d5ac1f4d075fbd5f0caa1ef190989342.1327002701.git.anders@chargestorm.se>
References: <cover.1327002701.git.anders@chargestorm.se>
	<5742b631d5ac1f4d075fbd5f0caa1ef190989342.1327002701.git.anders@chargestorm.se>
Date: Fri, 20 Jan 2012 01:35:06 -0200
X-Google-Sender-Auth: -c1AnzoiGeHY7TkyR1EUOYeMkrQ
Message-ID: <CAP9ODKp_fP8xtAZFZdL3QSgET5Ez7kPHjP2vQ1sk3SsR4NDLeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v4 1/2] systemd: split out systemd-analyze
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 03:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Jan 19, 2012 at 17:53, Anders Darander <anders@chargestorm.se>wrote:

> Split systemd-analyze to a separate package, to remove the implicit
> dependency on python. (At least the rpm-packaging backend created a
> run-time dependency on python).
>
> Add an RDEPENDS_${PN}-analyze on python-dbus, as this is required for
> systemd-analyze to work.
>
> Add an RRECOMMENDS_${PN}-analyze on python-pycairo, as the plot command
> in systemd-analyze requires this package.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-core/systemd/systemd_git.bb |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bbb/meta-oe/recipes-core/systemd/
> systemd_git.bb
> index bdaaf16..0fa61a7 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,7 +14,7 @@ inherit gitpkgv
>  PKGV = "v${GITPKGVTAG}"
>
>  PV = "git"
> -PR = "r7"
> +PR = "r8"
>
>  inherit useradd pkgconfig autotools vala perlnative
>
> @@ -57,11 +57,15 @@ do_install() {
>        ln -s ${base_bindir}/systemd ${D}/init
>  }
>
> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
>
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "-r lock"
>
> +FILES_${PN}-analyze = "${bindir}/systemd-analyze"
> +RDEPENDS_${PN}-analyze = "python-dbus"
> +RRECOMMENDS_${PN}-analyze = "python-pycairo"
> +
>  FILES_${PN}-initramfs = "/init"
>  RDEPENDS_${PN}-initramfs = "${PN}"
>
> --
> 1.7.8.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

