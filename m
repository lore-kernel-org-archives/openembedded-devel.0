Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FAD377A48
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 09:55:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z129so2154231wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1xAyvKL41TdBRyRvNLPXet3+HR/IlPxTBicxHZUe/JQ=;
	b=RPwbSbr4QL7juCTv3InlX12lydttzJ35cY0Eox2FCFPPK19gTVrBFg7qp50l3CSBpo
	PweGdpsZM9eSQHynENTu0Y0/vVZQO5dNNWVT5n9AtIWIT8bRVR5URXGkcPohJ5X7RdZ4
	nE/EcTtc4BZFa5QZzbhQKooRjqXKxRjreOcF+DluHISxX9cl0k+fu/xZe8Lt8r53tXeN
	kNXmBNWcpMT8/p/NvfmZVFH9g79nNmTptabtJz8Up75mCWbtDXw7bOAn/ZhjIBsuhw18
	5L9KxDOTn7gLZkF5AVSeu1LFw9/pjXVwgO9A2gkLgyjadNm4WevhrsTUnDDoJPvkDaNJ
	KWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1xAyvKL41TdBRyRvNLPXet3+HR/IlPxTBicxHZUe/JQ=;
	b=pzpWcfsSrHNCcAxwgV1xye8X1bVYoig1ShOdNJbRSjLyrSRXj/QE/1pj4JPZwpGHYH
	ud5OSilKBOCTIkCFIAguqlaMgnWlkGVSRwBB1EdygEY5opp90/4GveVxJyP0tn8Cp3yT
	NDBTyPtzJJrzWJpHVyJwMA63St5eV5T1899zTmvjdBFJFJ8p1l+PqWtOf7jDXWJbHHYl
	ayrGKE14dx9v81Xi6CxERuvAkj1P5TFFYNcOuJmb/+DW77R1jkmuPO8GXGyZEj3gYPoM
	UKXBKYpBcLIzNu9ispP2pHn4p5a9g55A3llzP7sYMhfP8vRIErm/02HNYvZUvOQxeH04
	eIlQ==
X-Gm-Message-State: AN3rC/5nYLCQP0MoQe4TRwURXeR+Fj4+a/jbdUQCjXazgzlEnWpja8D6
	opkc93WzeKq7e2Es48UacDBVlhBI6A==
X-Received: by 10.80.195.17 with SMTP id a17mr2578008edb.9.1493891726916; Thu,
	04 May 2017 02:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Thu, 4 May 2017 02:55:26 -0700 (PDT)
In-Reply-To: <20170504093205.19594-1-Qi.Chen@windriver.com>
References: <20170504093205.19594-1-Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 May 2017 11:55:26 +0200
Message-ID: <CA+chaQcDd5OenuP2-imDks4ykRK6a8a4Vmu1F0WodbFas74okQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH 1/2] xfsdump: 3.1.4 -> 3.1.6
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
X-List-Received-Date: Thu, 04 May 2017 09:55:26 -0000
Content-Type: text/plain; charset=UTF-8

Have you kept the old version intentionally?

On Thu, May 4, 2017 at 11:32 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> From: Robert Yang <liezhi.yang@windriver.com>
>
> The 3.1.4 doesn't work with xfsprogs 4.7:
> | inv_files.o: In function `inv_dirpath':
> |xfsdump-3.1.4/invutil/inv_files.c:53: undefined reference to `ASSERT'
> | inv_files.o: In function `inv_fstab':
> |xfsdump-3.1.4/invutil/inv_files.c:60: undefined reference to `ASSERT'
> | inv_files.o: In function `inv_lockfile':
> |xfsdump-3.1.4/invutil/inv_files.c:67: undefined reference to `ASSERT'
> | inv_files.o: In function `inv_basepath':
> |xfsdump-3.1.4/invutil/inv_files.c:74: undefined reference to `ASSERT'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [../include/buildrules:33: xfsinvutil] Error 1
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-utils/xfsdump/xfsdump_3.1.6.bb         | 38
> ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xfsdump/
> xfsdump_3.1.6.bb
>
> diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
> b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
> new file mode 100644
> index 000000000..8f942ba7c
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "XFS Filesystem Dump Utility"
> +DESCRIPTION = "The xfsdump package contains xfsdump, xfsrestore and a \
> +               number of other utilities for administering XFS
> filesystems.\
> +               xfsdump examines files in a filesystem, determines which \
> +               need to be backed up, and copies those files to a \
> +               specified disk, tape or other storage medium."
> +HOMEPAGE = "http://oss.sgi.com/projects/xfs"
> +SECTION = "base"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490e
> cc"
> +DEPENDS = "xfsprogs attr"
> +
> +SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
> +    file://remove-install-as-user.patch \
> +"
> +SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
> +SRC_URI[sha256sum] = "7f78c11ca527477d90e5e62b0778f3
> ad96f2b71c19173044e9aca9515fff42d0"
> +
> +inherit autotools-brokensep
> +
> +PARALLEL_MAKE = ""
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gettext] = "--enable-gettext=yes,--
> enable-gettext=no,gettext"
> +
> +EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
> +
> +do_configure () {
> +    export DEBUG="-DNDEBUG"
> +    oe_runconf
> +}
> +
> +do_install () {
> +    export DIST_ROOT=${D}
> +    oe_runmake install
> +    oe_runmake install-dev
> +}
> +
> +PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

