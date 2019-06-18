Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD7877E90E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:34:31 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id d4so21206382edr.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ct5e6Co3YdL1nOVoM0x+7C0YZMPYcRoBXKgBCBdrrtg=;
	b=euFyAL5r6+bLT8JkbRuYKyk05Iaeb6PAsPIvSt3HjlmikK8iRLupbK/E5ytuuzUkAR
	1V6fN75I2mv2dPnNJdOmu93Ipp31JZHNO7XXZbqob/gH1BszVLwxpFcOdsToebWHMyHy
	CHPxWDZRF+DSicfZODrx08ZhsQN/+tu4l4Hd5/KQZV8M1DrIOadbuqV6/Rz7gV7dWoQA
	z7qcUOdrH48jq8O2FtXCaYhHUVF1FLO7pHwjTM1baxugq3OvHLqDAyVFxgpAUBD52erF
	Vgluy3A4HvdS5rxFWyJmSUGK/dTxBk7fCvrMZ6ccEE00BB4w9xuzgOVZLIRAm49AM6vS
	5SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ct5e6Co3YdL1nOVoM0x+7C0YZMPYcRoBXKgBCBdrrtg=;
	b=Xre9aCurSVk+8ebzW6cWC6NieHy8UxA18/QVnKMK7IItld/sHEfvKTeb3YFYuFzZbG
	mg9GwJK3wcoNgXBWN448yOSuS/bUa/unULaMIa6hRXiUn5Xko8ggLvvrgHkb/oyfeeQ3
	DP8qX0gRv5W4Nb78sa8wK6ipiYqghj6gM/7w326OeT7pTyNANeMaW2OBpW6m0yobQmwg
	DLhkLbV2JwwtXRW8LxUXvc9hJ975H5nq+xG7GCwzMW7y1WKH7r+xEB17qmLmYGDT40pG
	a/FCvO0rlY0l7uBya4sUFvU+HX1ETj6wTFDN0GEWkrcdmW6T6ym1hA/hwI5pezT4dZA3
	WQ7A==
X-Gm-Message-State: APjAAAU35KJzKKCG29oQIqkE92bpLFbUn0OHYUttU2XHgR1ihN1a4Qdc
	89dZma0fB6VjxeE+ZiUStq9ULWwLlmjFGruKl889CENY
X-Google-Smtp-Source: APXvYqzF2IiWUSUxiS716jLxdrWB3wxH/5lR25yhjMapSwCnJqzHTNoAl/0TtowTCCZdTdL6EZazkcdVvFU4XMiJN9w=
X-Received: by 2002:a17:906:55d4:: with SMTP id
	z20mr8671596ejp.205.1560857672281; 
	Tue, 18 Jun 2019 04:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190407130935.10670-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190407130935.10670-1-open.source@oleksandr-kravchuk.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 13:34:27 +0200
Message-ID: <CA+chaQePCd=cHgYpx1TQydMOopA9FN8WjDK2Jtn60d6J2h1cNw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] libowfat: update to 0.32
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
X-List-Received-Date: Tue, 18 Jun 2019 11:34:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, have you seen libowfat randomly failing with error: conflicting types
for 'socklen_t' ? It happens with both 0.31 and 0.32 versions.

I sometimes see this failure in world builds:

| In file included from socket/socket_recv6.c:12:
| ./havesl.h:1:13: error: conflicting types for 'socklen_t'
|     1 | typedef int socklen_t;
|       |             ^~~~~~~~~
| In file included from
libowfat/0.31-r0/recipe-sysroot/usr/include/sys/socket.h:33,
|                  from socket/socket_recv6.c:4:
| libowfat/0.31-r0/recipe-sysroot/usr/include/bits/socket.h:33:21: note:
previous declaration of 'socklen_t' was here
|    33 | typedef __socklen_t socklen_t;
|       |                     ^~~~~~~~~
| GNUmakefile:179: recipe for target 'socket_recv6.o' failed
| make: *** [socket_recv6.o] Error 1

Checking what GNUmakefile does, this really shouldn't happen, but the log
doesn't show anything useful to see why the trysl.c test failed (and caused
havesl.h to exist and contain the conflicting typedef).

I've added small patch on top of this upgrade which should make the compile
tests more verbose:
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=jansa/master&id=3d3ac51e43926ec8a3254411845fa025af6d1c2b
now I'm waiting for the build to fail again to hopefully see why.

Have you seen this before?

Cheers,

On Sun, Apr 7, 2019 at 3:09 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../ncp/{libowfat_0.31.bb => libowfat_0.32.bb}                | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb =>
> libowfat_0.32.bb} (84%)
>
> diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
> b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> similarity index 84%
> rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
> rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
> index 4b072f7e7..fba35526d 100644
> --- a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
> +++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> @@ -7,8 +7,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
>  SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
> -SRC_URI[sha256sum] =
> "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
> +SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
> +SRC_URI[sha256sum] =
> "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
>
>  EXTRA_OEMAKE = "\
>      DIET= \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

