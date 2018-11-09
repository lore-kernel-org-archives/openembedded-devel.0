Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id B6A806BD68
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:31:45 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id w204so1821117qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OkPTjTCJGtknreymjN/S4xN1XUnfktTTn1Rq1msSQaU=;
	b=XsmIwKHFQNZj/lmwF1MxoZO91tI158zN50N6d4HDxwN/1WsmR5XjDEl4yfAaHdjqgA
	eeYj2RfhkjZpLHkAfVD/1gsmz33iSvZT5lD8bzeymt8h+yXhbc7/wP0oNReUA7vYmxMA
	IIErsVT798T/Qj+NKcD23HolSKk5oMjB384YAuo6XKQJOkW8fHf0E9choSNeBr3lGGy0
	2wog92WnQBYOSj3gyCz/vrqimpGr4tTlEk0bl9+UYYO1RwsLzo5NfZxww7Kb34jHmY57
	0S2nGAEie6Y3CZ5h4t///Xph+7+jyyXyovV8Lq9tRnq9LRllPi2s8o2rASQ5fvwH7EkF
	+DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OkPTjTCJGtknreymjN/S4xN1XUnfktTTn1Rq1msSQaU=;
	b=HiAgovj3oJDvV2uTWyr/HFhXqBekYzV6OrL9zujG4GME6d5GuhRu9xgCpixinmHQfo
	OPLrqvbYvjfL73BdWQWZjHZgflu6w/eLdGhROZ67l6gu7Q+LawiJer9P1FDis3ugFYZW
	Zzad44J0/fIG0UbNrjPeJsQ4unEOAHQF0gRYEV3X2ANc8I0xNYHQ6OSGkoLJju5//3/Q
	TJOpy2XnCdS0vqzn5Wt83n+1GdfJvs9+6HNNmpZO1+mKwFXcKIEl8UQOSeBAgWdvEQq6
	FgivDDZ5iGF5DWOaj3XKWUuYWrdwkdk4S04s8t3udUWz4Stv9v7bnvGYfAZiV2qW6oI0
	3MOQ==
X-Gm-Message-State: AGRZ1gKEaBhDP9zwUnH3S4nRp4LLiK4afVNG3WbVqgVdGV866gsAOEWT
	YpDgD331GROJ9IzLqJbmwEE8ovGIvLQn82jwo4Y=
X-Google-Smtp-Source: AJdET5cCGpMioGfiAbZLTSIj7waGZpcoQYWZOsxM5UviEmy1atFVlMZ2qyvCGM7qstRR0h/MeGXcrt4cbBdWrXnrumc=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr8756301qvd.224.1541773906306; 
	Fri, 09 Nov 2018 06:31:46 -0800 (PST)
MIME-Version: 1.0
References: <af5d8ef579cd4b05978c66c78d17e82e@indesign-llc.com>
In-Reply-To: <af5d8ef579cd4b05978c66c78d17e82e@indesign-llc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Nov 2018 06:31:20 -0800
Message-ID: <CAMKF1spZtLV-OvgdcMMZcx1b9m__68SO+aPtiynHC-mrBtD7JQ@mail.gmail.com>
To: cdgarren@indesign-llc.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Chromium missing DEPENDS
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
X-List-Received-Date: Fri, 09 Nov 2018 14:31:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 9, 2018 at 4:59 AM Garren, Chris D.
<cdgarren@indesign-llc.com> wrote:
>
> I'm working on building an image with chromium for a Variscite VAR-SOM-MX=
6-SOLO. I previously was able to build an image for the DART-6UL successful=
ly with chromium included. When I changed machines, I started getting an er=
ror during the do_configure step of chromium-x11:
>
> ERROR: chromium-x11-69.0.3497.100-r0 do_configure: Function failed: do_co=
nfigure (log file is located at /home/cdgarren/yocto/build/tmp/work/cortexa=
9hf-neon-mx6qdl-poky-linux-gnueabi/chromiu
> m-x11/69.0.3497.100-r0/temp/log.do_configure.79809)
> ERROR: Logfile of failure stored in: /home/cdgarren/yocto/build/tmp/work/=
cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/chromium-x11/69.0.3497.100-r0/tem=
p/log.do_configure.79809
> Log data follows:
> | DEBUG: Executing shell function do_configure
> | ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned no=
n-zero exit code.
> |     pkgresult =3D exec_script(pkg_config_script, args, "value")
> |                 ^----------
> | Current dir: /home/cdgarren/yocto/build/tmp/work/cortexa9hf-neon-mx6qdl=
-poky-linux-gnueabi/chromium-x11/69.0.3497.100-r0/chromium-69.0.3497.100/ou=
t/Release/
> | Command: python /home/cdgarren/yocto/build/tmp/work/cortexa9hf-neon-mx6=
qdl-poky-linux-gnueabi/chromium-x11/69.0.3497.100-r0/chromium-69.0.3497.100=
/build/config/linux/pkg-config.py atk atk-bridge-2.0
> | Returned 1.
> | stderr:
> |
> | Package atk-bridge-2.0 was not found in the pkg-config search path.
> | Perhaps you should add the directory containing `atk-bridge-2.0.pc'
> | to the PKG_CONFIG_PATH environment variable
> | No package 'atk-bridge-2.0' found
> | Could not run pkg-config.
> |
> | See //build/config/linux/atk/BUILD.gn:20:1: whence it was called.
> | pkg_config("atk_base") {
> | ^-----------------------
> | See //ui/views/BUILD.gn:686:24: which caused the file to be included.
> |           configs +=3D [ "//build/config/linux/atk" ]
> |                        ^-------------------------
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/cdga=
rren/yocto/build/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/chromiu=
m-x11/69.0.3497.100-r0/temp/log.do_configure.79809)
> ERROR: Task (/home/cdgarren/yocto/sources/meta-browser/recipes-browser/ch=
romium/chromium-x11_69.0.3497.100.bb:do_configure) failed with exit code '1=
'
>
> Any ideas what might be causing this?
>

try adding  at-spi2-atk to DEPENDS


> Thanks,
>
> Chris Garren
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

