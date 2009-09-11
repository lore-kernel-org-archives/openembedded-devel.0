Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MmDY8-0007kV-Hz
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 23:20:59 +0200
Received: by qw-out-1920.google.com with SMTP id 4so490090qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 14:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=xmjA0nMXUTNTzOSyLY3bevmOWK8tCbVNawUddrCN/Tw=;
	b=jxXCN0YOYqZTFhHRKd479x44iV6UiFkNiifEpvJ6iblyyDJiRlDcRyN63rTDfPowFA
	rUz4+zzj4XtHJbLqx9xThUXitxBKCpwTFun0HQDSfzBkKK0eXANAoOD2hsaIp5uB+tgH
	wWTHc/1xuM8aLB8YMB8pZp86iZiAvpTTCB7jQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ixMUlaAzOcUkrZ7CJGy9S86nWwY1a+YW3aZxgKOKojuRmC3uZFUoRflvSCO1VJNzkp
	NdYp2SSnO4DpoATbTDTmhMf1pySLfCEJQbXzp94DS96818YE7hkTzUsA2A5mT3emrvAP
	5x6stk6NjKb8WD6lt+ycq7dRHsplGtw0l28RQ=
MIME-Version: 1.0
Received: by 10.229.34.143 with SMTP id l15mr1497789qcd.80.1252704029553; Fri, 
	11 Sep 2009 14:20:29 -0700 (PDT)
In-Reply-To: <4AA9C51E.3030906@gmail.com>
References: <4AA9C51E.3030906@gmail.com>
Date: Fri, 11 Sep 2009 14:20:29 -0700
Message-ID: <19c1b8a90909111420u756a3a9bxe919f84be8f301e6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.144
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix t1lib dependency.
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
X-List-Received-Date: Fri, 11 Sep 2009 21:20:59 -0000
Content-Type: text/plain; charset=UTF-8

On 9/10/09, Graham Gower <graham.gower@gmail.com> wrote:
> Failed with:
>
> | mipsel-angstrom-linux-libtool: compile:  mipsel-angstrom-linux-gcc -c
> -isystem/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/include
> -isystem/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
> -fno-strength-reduce -DT1LIB_IDENT=\"5.0.2\"
> -DGLOBAL_CONFIG_DIR=\"/usr/share/t1lib\" xglyph.c  -fPIC -DPIC -o
> .libs/xglyph.o
> | xglyph.c:47:27: error: X11/Xaw/Label.h: No such file or directory
> | xglyph.c:48:29: error: X11/Xaw/Command.h: No such file or directory
> | xglyph.c:49:26: error: X11/Xaw/Form.h: No such file or directory
> | xglyph.c:50:28: error: X11/Xaw/Dialog.h: No such file or directory
> | xglyph.c:51:25: error: X11/Xaw/Box.h: No such file or directory
> | xglyph.c:52:28: error: X11/Xaw/Toggle.h: No such file or directory
> | xglyph.c:54:31: error: X11/Xaw/AsciiText.h: No such file or directory
> | xglyph.c:55:32: error: X11/Xaw/SimpleMenu.h: No such file or directory
> | xglyph.c:56:28: error: X11/Xaw/SmeBSB.h: No such file or directory
> | xglyph.c:57:26: error: X11/Xaw/List.h: No such file or directory
> ...
> <snip>
>
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/t1lib/t1lib_5.0.2.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/t1lib/t1lib_5.0.2.bb b/recipes/t1lib/t1lib_5.0.2.bb
> index 5da31f7..36acb77 100644
> --- a/recipes/t1lib/t1lib_5.0.2.bb
> +++ b/recipes/t1lib/t1lib_5.0.2.bb
> @@ -1,8 +1,8 @@
>  DESCRIPTION = "A Type1 Font Rastering Library"
>  SECTION = "libs"
>  PRIORITY = "optional"
> -DEPENDS = "virtual/libx11"
> -PR = "r4"
> +DEPENDS = "virtual/libx11 libxaw"
> +PR = "r5"
>  LICENSE = "LGPL GPL"
>  SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
>             file://configure.patch;patch=1 \
> --
> 1.6.0.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


