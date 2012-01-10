Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkZr5-0004qm-IM
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 12:27:03 +0100
Received: by lami14 with SMTP id i14so1820233lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2012 03:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=SpKlcV/yJfMlVkCDJVnLq5AkEYOQPA4t98ZL5PK2DZo=;
	b=uFpjojAVZMn+ypsukwlh3u0dRXVoqJFKzRagJJ2NFVctOsfBPp4LKPP+ix4st6/DRm
	4nOEH5+uwoXjUrpCjGL+LSOe2WQ6vFS0YKesQNwJPFtEi5ZPP4eiC6lDhDgPmmcPD7rS
	AhTFK+AQ58Tw+QIioIgIei/uTAo7nRI+bBLpo=
MIME-Version: 1.0
Received: by 10.112.85.129 with SMTP id h1mr4217976lbz.84.1326194374812; Tue,
	10 Jan 2012 03:19:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 03:19:34 -0800 (PST)
In-Reply-To: <6382f565655efb9aec552453275832a351bc7467.1326185831.git.anders@chargestorm.se>
References: <cover.1326185831.git.anders@chargestorm.se>
	<6382f565655efb9aec552453275832a351bc7467.1326185831.git.anders@chargestorm.se>
Date: Tue, 10 Jan 2012 09:19:34 -0200
X-Google-Sender-Auth: -uNJo6aV5XEGc-EBPLQlhzwlJmA
Message-ID: <CAP9ODKopWxY=-v7DX6wO=JdshpgVOWy5_P+WbYX-gyCcbXTNtQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v2 3/3] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Tue, 10 Jan 2012 11:27:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

NACK!

If you use MACHINE_FEATURES it needs to set PACKAGE_ARCH to machine too.

On Tue, Jan 10, 2012 at 07:00, Anders Darander <anders@chargestorm.se>wrote:

> If the machine lacks keyboard support, there is no need for kbd*-packages.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bbb/meta-oe/recipes-core/systemd/
> systemd_git.bb
> index 0fa61a7..7af8357 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,7 +14,7 @@ inherit gitpkgv
>  PKGV = "v${GITPKGVTAG}"
>
>  PV = "git"
> -PR = "r8"
> +PR = "r9"
>
>  inherit useradd pkgconfig autotools vala perlnative
>
> @@ -101,7 +101,7 @@ RDEPENDS_${PN} += "dbus-systemd udev-systemd"
>  # of blacklist support, so use proper modprobe from module-init-tools
>  # And pull in the kernel modules mentioned in INSTALL
>  # swapon -p is also not supported by busybox
> -RRECOMMENDS_${PN} += "kbd kbd-consolefonts \
> +RRECOMMENDS_${PN} += "${@base_contains("MACHINE_FEATURES", "keyboard",
> "kbd kbd-consolefonts", "", d)} \
>                       systemd-serialgetty \
>                       util-linux-agetty \
>                       util-linux-swaponoff \
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

