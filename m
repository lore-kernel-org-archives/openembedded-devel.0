Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DD8A9719F7;
	Sat, 11 Nov 2017 22:45:29 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t139so8773966wmt.1;
	Sat, 11 Nov 2017 14:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EcSDbIvffT3cmAZEd+kztuyy92DEgYRrf5HI7ioSa64=;
	b=swcQORrqCbWnTLef5iDqBeRSVrwWFv00uPbHC7ko1lms9FHMVgMv7M2hHfpst9MJBq
	jwY05vtHJYuvMJ4ALvgSZHYl3AlzNRoHkGJvSb8tCxrHdGWkQja3ob5ZP527EVhGLTN9
	h9B1FPeLUQ88ZRgM8mIZl2PVVvjx8C/xOG+k+7xqdmB90LaZvtox2WvL7XKPZB3IRIyM
	Xy21Wu/fE3qh7DhiyKCBkDdf4Bb564mNirnXwtqr/hOAwekaWFrp4SbZ75LMwoF7Rcaj
	mnsCx1+kkG7kPJt9LfrVGgte5lY1oAHCfy9TXakEEfxMCbdqCw/aeKpS47bP7lrladOa
	/VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EcSDbIvffT3cmAZEd+kztuyy92DEgYRrf5HI7ioSa64=;
	b=HHA2XJKX+169rs2Hi0f1ep9lO0hgRsVJ7OKApyVxJUHKQSgbgXROnqXuqeHQE0W8cP
	Oq03nz4uGLYQxUjS33SIHqohJnzC+7zDd+w6GdSOC7YxYxNly7w1F7CAuyPHEabRpNVZ
	hEXVspOBh3POQJGaONqfLcwJSpSnQUJCcnYUNIRU74cVsh7MMliwMx3PHRoxR2Km09ut
	oYlHib3ARNK7DpYcbJHMN0D41RxwFYofRS4UZSFE2UxuYWwkyJ6Z15yB+Bh+D9hmAL36
	LEHV4JzDNaxkc2ApYJyJ7RJZr+aXxOR3iyb4xGDMbw/cR7RRJrPF7s3Zr/Fd4jbA46PH
	8h1A==
X-Gm-Message-State: AJaThX4MM3p6vouaoMZBwd1OwuBZheBiCAS0mTY69Wpjb54Jrq4p6wVM
	ZCVmIT2d5dggOgKpXLOtsnyhgQekWszVo5qbOZ+JIA==
X-Google-Smtp-Source: AGs4zMZds7e5cAZQBNgD7IPVt7QwDpJ9TORrzbzrnkFqtIF/TNSoQ8avAj/KbYXP5WGGU1Co/8MhEapB5H3u/GXv69A=
X-Received: by 10.28.235.18 with SMTP id j18mr3177125wmh.50.1510440330320;
	Sat, 11 Nov 2017 14:45:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Sat, 11 Nov 2017 14:45:29 -0800 (PST)
In-Reply-To: <20171110144512.3538E233675@git.openembedded.org>
References: <151032511199.27841.6992651845996774565@git.openembedded.org>
	<20171110144512.3538E233675@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 Nov 2017 23:45:29 +0100
Message-ID: <CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 04/44: db: don't provide virtual/db
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
X-List-Received-Date: Sat, 11 Nov 2017 22:45:30 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

will you please send fix for:
ERROR: Nothing PROVIDES 'virtual/db' (but
meta-oe/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
meta-oe/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
DEPENDS on or otherwise requires it).

Thanks

On Fri, Nov 10, 2017 at 3:45 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit dcbc45aa3fe72c528fe4d47a783da4b4ed5ff38e
> Author: Ross Burton <ross.burton@intel.com>
> AuthorDate: Tue Oct 31 21:10:13 2017 +0000
>
>     db: don't provide virtual/db
>
>     As there are no alternative providers for virtual/db remove the
> PROVIDES and
>     recipes can just depend on db.
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/meta/recipes-support/db/db_5.3.28.bb
> b/meta/recipes-support/db/db_5.3.28.bb
> index fb4befb..fe71967 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -12,7 +12,6 @@ SECTION = "libs"
>  SUMMARY = "Berkeley Database v5"
>  HOMEPAGE = "http://www.oracle.com/technetwork/database/database-
> technologies/berkeleydb/overview/index.html"
>  LICENSE = "Sleepycat"
> -VIRTUAL_NAME ?= "virtual/db"
>  RCONFLICTS_${PN} = "db3"
>
>  PR = "r1"
> @@ -37,15 +36,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> ed1158e31437f4f87cdd4ab2b8613955"
>
>  inherit autotools
>
> -# Put virtual/db in any appropriate provider of a
> -# relational database, use it as a dependency in
> -# place of a specific db and use:
> -#
> -# PREFERRED_PROVIDER_virtual/db
> -#
> -# to select the correct db in the build (distro) .conf
> -PROVIDES += "${VIRTUAL_NAME}"
> -
>  # The executables go in a separate package - typically there
>  # is no need to install these unless doing real database
>  # management on the system.
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

