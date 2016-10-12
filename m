Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id D82CA601F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 20:26:45 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b75so8789738lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0BHQPFW5d4NeZqZkOhtha3q3bGOzhcLqnHhIlQpE4TE=;
	b=n91+8W+i4MYA8VKetKvORP+bZ5wIaTycaypGCZ/9KG0mMXM2gLMkAsy+SgacJXNy6Q
	OvgtWZjDN5gZVwnJaReA+sSrerFFSWHmqle71IwPV0fF+c50Gbv33xwXkB9VEL5DvVBQ
	hXGIdYqhht7wgJQDasjwWMeoBSJ5Z/pVzQG07oqN0IbSGoBXt5xB9ylu7robu2U35e2g
	vRQOpU7s4onmar1mnpZJsYGkYg0uDC8GQHuUbGZTvhcip+2YC3EkPbzoTkNQ/RWXClmf
	klt8zuJOJCf8D/jFyZcy+3r2RRsQZlM1mScsb2VrX96Ho9VHCFQJnPfsLxpm3+X1PWtF
	SqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0BHQPFW5d4NeZqZkOhtha3q3bGOzhcLqnHhIlQpE4TE=;
	b=L4zt4wmqFhRj+mUR1BwQHcE4nrdgLnIoScDUpuFUTBTvyFy0FkW+X6MLz4Hziq0QKn
	43yA1hQybSIN5Y3Bb984RVpxVQxP1jBpdUIPGo9DJvCyx7pzdqlHavJArC/tzL1FNZsy
	RpgjkmbMXP/6dl60lt0b6RJhvj7XR+lP7tBPFadhObL3wBhU3uqk1HN4MTxndP4y+Ar6
	l+RIocCj+pUWDa5C+ShOr/5pg6JFeLWvn1TYdWFg/alL6p5tKyu+U0DVvzE9DxBrje8D
	UEFwRmOwseF9znDhvuow3Lu8FjtoeuM9GB6EjXznMSFLRpSnvAo9etyuv8RZndES2iRs
	XGRQ==
X-Gm-Message-State: AA6/9RnpuVda0SrcOjO0vp755lSsIIVIvDleD01lMA17Vu1pkzqUQb1Lk9xZ77korkMPb0N3Wa+yzNiVl3m0PQ==
X-Received: by 10.194.146.195 with SMTP id te3mr4079748wjb.51.1476304006076;
	Wed, 12 Oct 2016 13:26:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Wed, 12 Oct 2016 13:26:45 -0700 (PDT)
In-Reply-To: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
References: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Oct 2016 22:26:45 +0200
Message-ID: <CA+chaQd6QesJQpKBtxuADbAAcYBtMs3tT-_JfqatAwip1uZOBw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: Re: [meta-oe][PATCH v2] autoconf-archive: 2012.04.07 -> 2016.09.16
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
X-List-Received-Date: Wed, 12 Oct 2016 20:26:47 -0000
Content-Type: text/plain; charset=UTF-8

Some files from this conflict with gnome-common:

ERROR: autoconf-archive-2016.09.16-r0 do_populate_sysroot: The recipe
autoconf-archive is trying to install files into a shared area when
those files already exist. Those files and their manifest location
are:
   sysroots/qemux86/usr/share/aclocal/ax_check_enable_debug.m4
 Matched in b'manifest-qemux86-gnome-common.populate_sysroot'
 sysroots/qemux86/usr/share/aclocal/ax_code_coverage.m4
 Matched in b'manifest-qemux86-gnome-common.populate_sysroot'
Please verify which recipe should provide the above files.


On Fri, Oct 7, 2016 at 5:30 PM, Matthew Barth <msbarth@linux.vnet.ibm.com>
wrote:

> Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
> ---
>  meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc    | 7
> ++++---
>  ...oconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} | 8
> +++-----
>  2 files changed, 7 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-devtools/autoconf-archive/{autoconf-
> archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} (55%)
>
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> index 9399363..2b5df70 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -1,15 +1,16 @@
> +SUMMARY = "A collection of macros for GNU Autoconf"
> +DESCRIPTION = "The autoconf-archive set of macros extend the pre-defined \
> +capabilities within the complete autoconf tool set."
>  LICENSE = "GPLv3"
>  HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
>  SECTION = "devel"
> -
>  DEPENDS += "m4-native"
>  DEPENDS_class-native = "m4-native gnu-config-native"
>  DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> -
>  RDEPENDS_${PN} = "m4 gnu-config"
>  RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>  RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>
> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/
> autoconf-archive_2016.09.16.bb
> similarity index 55%
> rename from meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2012.04.07.bb
> rename to meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> index 5baaecc..1a0470c 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2012.04.07.bb
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> @@ -1,13 +1,11 @@
>  require autoconf-archive.inc
>
> -
> -PARALLEL_MAKE = ""
> -
>  LICENSE = "GPLv2 & GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
> -SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556bf
> bbbfe432db78445ca25e0cfe2e88f96a14"
> +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
> +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a722
> 40a5e5fcd248e8444335e63beb60fabd82"
>
>  EXTRA_OECONF += "ac_cv_path_M4=m4"
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

