Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA4E755F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 18:10:56 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so68106100igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 11:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=b7tPffPVXglX6QxdCp0luIYwvaCZvzqZHIofKUSictw=;
	b=Fdw+BpBhEvdTulpLnESCmilo2smsYZONS83ODe8V5UpS3rOj/iIxKZEv0j11oEujDO
	Im0HW9winR2RXqoY0lpQpmoaMAcK+eq+jhXtunq4pyF78rS6PBFAH9PEg7hW9zG+OhWK
	HiUOVbuzSuuO2epeKcLTSjICBBoinb1IfUNp0dMNP9c37+b9pLXhiuLsmLfvzlwDBvqr
	U9e69q8IMCntBdQnxC5eyjYl2q1M9vGJ17qKsvIJ9NVGzN2mBiGudSsBDwx+oFWT/nAr
	mVyzPaqaIxYm732JsWFAJMr/spS7+MscqhFzKcabLLktFHNMOjPmiqoejDssAgBKDei/
	aGdQ==
X-Received: by 10.42.83.212 with SMTP id i20mr30122038icl.91.1433182257795;
	Mon, 01 Jun 2015 11:10:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Mon, 1 Jun 2015 11:10:27 -0700 (PDT)
In-Reply-To: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
References: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jun 2015 11:10:27 -0700
Message-ID: <CAMKF1spR8ScXYM2pViEaY1=7DcXLcdKTxCKfQw_P-QETpgsWOw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
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
X-List-Received-Date: Mon, 01 Jun 2015 18:10:59 -0000
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
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +# with, without, depends, rdepends
> +#
> +PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
> +PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
> +PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr,"
> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
> +PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
> +PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
> +
> +RDEPENDS_${PN} = "tk"
> +
> +inherit autotools-brokensep pkgconfig

would be good if it did not need brokensep but probably its ok to have
it done as a follow up.

> +
> +SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +do_configure_prepend () {
> +    touch NEWS
> +}
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
> +SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

