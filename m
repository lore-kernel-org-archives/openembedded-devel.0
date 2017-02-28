Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5446D72F6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:25:03 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u48so831036wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ErIuV4wKwZrldo+q7Wpzr5Vk3shznplhb+OKB9LhR5Y=;
	b=EkcdR6inBxiHxTAVARhQONI9PPiPDhsGF/XvpFaVRyOcmRCUVFzulXRknXbcAVNnAM
	lnNOIx3xuAA+tPpmhdpL+cftg2CZdrVQ3W0lT4yMs1s4G8CDiAYf/diMaT0pPbVAXVQa
	5SSTE8iRIkt49kQN/BkZakhOAJCn0kIDllrB1O8dVUJ1sw7JMXDUDYwvdRh7bN+JvZvm
	OQNI3ijqkdxQZfxKDXCS6wwLGe6Va3fCFouVi95ysAU2ONUsXWIYNGqkCuH015zAQDpH
	OmAnXu0gabAGo6oF4yCbq5IimaKXDMwP4h8CviMqUgix7ns3V126TpStjWmJ9vRldiC/
	55SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ErIuV4wKwZrldo+q7Wpzr5Vk3shznplhb+OKB9LhR5Y=;
	b=Kt1svwLJEPD7YsXqO12+DYNOMsR8XXASMjMs0tWueh3wOiuornKijfS1QfbPJcjleQ
	aBbTLwx9J/SDy1JQPDJ778lTWu2lpOW92RJPUhsQ19hK/kSxdn4wG95K7iK7vxDb4Qeg
	flW4Y28DPoEJbfoa3qQg/DiSBonnfOcwL05L1N6Rq673fgeqEDykiqOrU4cUu/1nHZlM
	0Rhs4yY1Huv7g6YCj82u41OiAz+qW3Oy6bfqVDliv+uVYz8dFsCywQnD0pmsaBa03JVa
	l1lFlkh0wzzX2wV34mjffH6pY2Xwa8iHWeNqJdRjhaxO+7+k4Zy0PCYit70gh246lblV
	wFDQ==
X-Gm-Message-State: AMke39lGikSSRDVpAdv3TCtmBGx0UbDPsaGPZORWmgmLvJSrW9lDB0IHnoPBX04XER/4D7GhaVLBRUd4pHw0KQ==
X-Received: by 10.223.154.149 with SMTP id a21mr1242012wrc.145.1488273904878; 
	Tue, 28 Feb 2017 01:25:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 28 Feb 2017 01:25:04 -0800 (PST)
In-Reply-To: <1487973956-9430-1-git-send-email-derek@asterius.io>
References: <1487973956-9430-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2017 10:25:04 +0100
Message-ID: <CA+chaQe4JwXjKwhFFG62Z3+9zrGpLfoPA+FFNqibypFQMAcrgQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: update depends to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 09:25:04 -0000
Content-Type: text/plain; charset=UTF-8

Unfortunately still fails with:

TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so:
error: undefined reference to 'uuid_compare'
TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so:
error: undefined reference to 'uuid_copy'

http://errors.yoctoproject.org/Errors/Details/134287/

On Fri, Feb 24, 2017 at 11:05 PM, Derek Straka <derek@asterius.io> wrote:

> Resolves build issue exposed by RSS
> See http://errors.yoctoproject.org/Errors/Details/130663/
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> index b4c50a2..f527237 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> @@ -15,6 +15,7 @@ inherit autotools-brokensep
>
>  PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
>
> +DEPENDS += "util-linux"
>
>  RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
>
> @@ -54,5 +55,3 @@ do_configure_prepend () {
>  do_install_append() {
>          oe_runmake 'DESTDIR=${D}' install install-dev
>  }
> -
> -PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130663/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

