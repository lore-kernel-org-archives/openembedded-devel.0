Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCA6731EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 10:29:09 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id ok5so361861igc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Xfvg5ONPm9j3xLVNR7Q6QgVPL3ct2PB9WmPPRw+teoE=;
	b=yc9nZxgZJ7R087fPHelc0bDNqYuEGvGTSydHUfVsbW6I33wB0C3yAk6q4LP1GtCmbC
	mg+CkExrx5OAOixbI4+5o/Ki0qfUJSaA7qRzq4nqQFGUbp1SZXy8GAKq+DYZk2BvTL5H
	w6FrI5aH1yCs5vZz1WqS0XUWV84rq70k6NIX8O0yXcZRA15tAtrIZ0imMHBCwQum1qEj
	+kEoIIrSsJboKURKvp/Uz9A3QlHuwC1F7o8wSw384gmKQxRSGRw2tXGTQnN/lexvo0aF
	P9r61mAtiDkv7wsmkHE5RznERry8xQSzKIVvmeBjPlmncYa01DUxwVf9+nUFckWNAdoG
	g4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Xfvg5ONPm9j3xLVNR7Q6QgVPL3ct2PB9WmPPRw+teoE=;
	b=UuA4v5EMs2XMrrFcG987i8ACkHWS5g1PYiXqe8es1Rqne75oZiMaFEZfnepuBANQQW
	oEHgMPYqJOmUcyk8kig1VeJhvGqqVpg2MKSs98l69o1960rSt7wuuqepYbPHNZg3dqZa
	7FkcjT0wlR7MhRMK7wDlJAn5DUgAXekPKC3VGLvdozSs5rm4TRQ6Mw/H7LAEuo0gKK+B
	l4ihxWty7xPyVq64j7DuQv/DRoPiWN6YmlngC8HIQHnIYwRjFN5OChWF7mfSfB4K0C6n
	OqteAWV4y0fZduuS5MCWBelVF3/s4bAUAaGQRO+GAKi3PZKhV8jx0+pB6/7vE5DtfqSN
	63Ow==
X-Gm-Message-State: AG10YORP9OmESQmXwA9yy7kdnVEv5sRBPJqc7mVhdNYSTYNwyCgxM6uVWYMZpd5WWSWG9TUN7cCf5xcUgJ2Afg==
MIME-Version: 1.0
X-Received: by 10.50.126.8 with SMTP id mu8mr14712980igb.52.1455186549620;
	Thu, 11 Feb 2016 02:29:09 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 11 Feb 2016 02:29:09 -0800 (PST)
In-Reply-To: <1455185571-22165-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455185571-22165-1-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Thu, 11 Feb 2016 11:29:09 +0100
Message-ID: <CALbNGRR7jA=UvX4A9+grb=NUFf068yxY_4t55DBOKgV2n73UDw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] lua: use PV for generating Version in lua.pc
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
X-List-Received-Date: Thu, 11 Feb 2016 10:29:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 11, 2016 at 11:12 AM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
> Version in pkg-config metadata file. Instead of bumping the Version
> field in lua.pc make sure that we are future proof and update the field
> automatically with value of ${PV}.
>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>  meta-oe/recipes-devtools/lua/lua/lua.pc    | 11 -----------
>  meta-oe/recipes-devtools/lua/lua/lua.pc.in | 11 +++++++++++
>  meta-oe/recipes-devtools/lua/lua_5.3.2.bb  |  4 +++-
>  3 files changed, 14 insertions(+), 12 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/lua/lua/lua.pc
>  create mode 100644 meta-oe/recipes-devtools/lua/lua/lua.pc.in
>
> diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc b/meta-oe/recipes-devtools/lua/lua/lua.pc
> deleted file mode 100644
> index e6f8b6f096dbcf578665699d2e3570dd22088d40..0000000000000000000000000000000000000000
> --- a/meta-oe/recipes-devtools/lua/lua/lua.pc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -prefix=/usr
> -libdir=${prefix}/lib
> -includedir=${prefix}/include
> -
> -Name: Lua
> -Description: Lua language engine
> -Version: 5.2.2
> -Requires:
> -Libs: -L${libdir} -llua
> -Libs.private: -lm
> -Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc.in b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
> new file mode 100644
> index 0000000000000000000000000000000000000000..fe220160374a2a7261ed9ada91d0c8f9969bf3b6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
> @@ -0,0 +1,11 @@
> +prefix=/usr
> +libdir=${prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: Lua
> +Description: Lua language engine
> +Version: @VERSION@
> +Requires:
> +Libs: -L${libdir} -llua
> +Libs.private: -lm
> +Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> index 3fe8c3fe88ec3f1159738c6b5e421bc987df176d..7d25cf8cbda973c0707e55a34b0df33cd6e7a4ab 100644
> --- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> +++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> @@ -8,7 +8,7 @@ PR = "r0"
>
>  DEPENDS = "readline"
>  SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
> -           file://lua.pc \
> +           file://lua.pc.in \
>  "
>
>  SRC_URI[md5sum] = "33278c2ab5ee3c1a875be8d55c1ca2a1"
> @@ -41,6 +41,8 @@ do_install () {
>          'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
>          install
>      install -d ${D}${libdir}/pkgconfig
> +
> +    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
>      install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
>      rmdir ${D}${datadir}/lua/5.3
>      rmdir ${D}${datadir}/lua
> --
> 2.5.0
>
Looks good - thanks. Minor nitpick for future patches: Please use 'git
format-patch -M' or set

[diff]
    renames = true

in your .gitconfig

to reduce diff

Andreas

