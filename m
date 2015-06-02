Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7095F757BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2015 23:35:44 +0000 (UTC)
Received: by oiww2 with SMTP id w2so138006279oiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2015 16:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OX78xROjRVSI9ZpPnSMNLwHLO/iG5GlyIOhcNdvMp6E=;
	b=l1zv0oxa7+0bDDjVbjVSuQWWKO4sQx3OkXi5Y5C05akziBsvJuqVyzDtHcpsTVzt6+
	dwRxadVKJM4UxsJw9qYom5pQEeeZ6S5+Ojq3Jfdy2Ax5IpVvQhfYQ9SAI80bKiZ3TCvh
	BEIMkKVxaG4gMLiQqYm2lBriHtAOUneUjIt21stc4EnXNk2H5jsZBMmlk1BEbY+EdnUh
	wnBVrkDEFcj5lDUrCqEQ/6261/tG3I6I2WKSQWpARC1TYgI/fHTkaag3tWe7a7Mmj4Rx
	qzqrgne7Lkwrvy+Li4xdWDPJIFfS3OaeoensR+TB9VyTSn41Ii4SdRiVZEwQFaPe8lwA
	bxfw==
MIME-Version: 1.0
X-Received: by 10.182.181.103 with SMTP id dv7mr24661900obc.25.1433288145348; 
	Tue, 02 Jun 2015 16:35:45 -0700 (PDT)
Received: by 10.202.44.23 with HTTP; Tue, 2 Jun 2015 16:35:45 -0700 (PDT)
In-Reply-To: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
References: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
Date: Tue, 2 Jun 2015 16:35:45 -0700
Message-ID: <CAJ86T=V9TrY4Pv53kwWua2beRp1XhFbXt767qK+-2=NF=76bRw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
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
X-List-Received-Date: Tue, 02 Jun 2015 23:35:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 1, 2015 at 7:48 AM, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> Add xorriso v1.4.0 based on the discussions
> http://patchwork.openembedded.org/patch/91143/
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981.html
> We have tested this package with
> Montavista CGE product - http://www.mvista.com/ and
> luvOS distribution - https://01.org/linux-uefi-validation build.
> Inherit the pkgconfig to avoid the below error,
> ..
> ...
> | disabled use of O_DIRECT with input of -as cdrskin
> | luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
> configure: line 14352: syntax error near unexpected token `LIBCDIO,'
> | luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
> configure: line 14352: `    PKG_CHECK_MODULES(LIBCDIO, libcdio >= $LIBCDIO_REQUIRED)'
> ...
> ....
>
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> ---
>  .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
> new file mode 100644
> index 0000000..2f81f0d
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems \
> +into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
> +manipulation of such filesystems"

That should be DESCRIPTION, not DESCRIPTIONS.

> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +# with, without, depends, rdepends
> +#

Drop these comments.

> +PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
> +PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
> +PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr,"
> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
> +PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
> +PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
> +
> +RDEPENDS_${PN} = "tk"

tk depends on the x11 distro feature, so perhaps xorriso should do too?

> +inherit autotools-brokensep pkgconfig
> +
> +SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"

Move nearer to the top of the recipe, after LIC_FILES_CHKSUM.

See http://www.openembedded.org/wiki/Styleguide

> +do_configure_prepend () {
> +    touch NEWS
> +}
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
> +SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"

Move nearer to the top of the recipe, just after SRC_URI.

> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

