Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8825F60574
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:42:05 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f14-v6so10466526wre.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 22:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fwlePJPbY+3QzRJDT6jpL1p6KNhGHtzEeWt52sqWDiA=;
	b=IgSiUBFrGRPMugdMXKKJrANzi9XF89SD6s36swgTyS7pOVe0Ff3AupO7V0xtcpPAji
	yLUPpgtWx2kSEIJ3XT6682aYoHZxk97wo69qh+mtxITlsmXe7+5deD+3BKdmvvlKefiN
	n34uTZyZAJbxYsDmFWLc6S71ZAEX4GJBmABVNR8LvykzyTrH0fbaS01wEH+Pg07IKYNi
	K/p9Q6kMODfyoPcxeGvF3M3ZZ9hiOYJMpsncfPo6o1efUiKFqKncD+bMceQFd5JmoqfV
	yJ9TO65yHoB99zA9XNDpAvr977IS5UQaVO62rvUD3y13T/hKSKGfw/M4OtEN+CLgrKwW
	jMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fwlePJPbY+3QzRJDT6jpL1p6KNhGHtzEeWt52sqWDiA=;
	b=lSHd/UMVAw8ihwc1lqxOHyc4mSsywr3AkctySluSCGwyT3i7/3Ilm49EVLsNH7ybiM
	IvdlZFzKKkuRhSaELdNr9hRLlmnwq6NKxPkHMoqAzmaITzYwy8TyePnI/H1MN7n6uYpW
	EThz4/jkAy+BLSg8CnzwClr9Tjyf0d0IuBQSHMLFYEF0yiRVeex1p6XS9uYGa/J8GJaL
	yed/fxmGzyGyFxyUZ1OOiN8qFHdq7aM/0NXWJLpmi16eC9F0Ecnx+tE4ypKuArmlb9n+
	5qKupriAkh6VIykE8cUr0l84ElNSKSlIbXIi02LWCufgwr3uho2hJziaLOZHVrHBAlFF
	k1fg==
X-Gm-Message-State: ALQs6tArMiEdhpzmx1JGDNtMV9Pv7w7aFzvRw1qGkGcx5fKlTHbCDxQy
	KxfhL3VK0IaHyUaHHdE7lE/e2Ymeb/kkNIyvJVg=
X-Google-Smtp-Source: AIpwx48FeLR4011HMXTVoUPSJuZIoWwvDwIK/8QTRdSvNwC8HsJGDXDOXi9wT2wnAVa+bvEiJx8Npo/msijhnD2oBkw=
X-Received: by 10.28.156.4 with SMTP id f4mr3619423wme.79.1524116526185; Wed,
	18 Apr 2018 22:42:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 18 Apr 2018 22:42:05 -0700 (PDT)
In-Reply-To: <20180418100454.3171-1-samuli.piippo@qt.io>
References: <20180418100454.3171-1-samuli.piippo@qt.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Apr 2018 07:42:05 +0200
Message-ID: <CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@qt.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][rocko][PATCH] qtbase: use mysql_config from correct path
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
X-List-Received-Date: Thu, 19 Apr 2018 05:42:05 -0000
Content-Type: text/plain; charset="UTF-8"

Is it needed in sumo and master branches as well? If yes, then it should be
applied there first.

On Wed, Apr 18, 2018 at 12:04 PM, Samuli Piippo <samuli.piippo@qt.io> wrote:

> mysql_config from host sysroot is found first which gives wrong paths
> for cross-compilation. Use it from crosscompile path instead.
>
> Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 0e3a8ac..db6280f 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>  PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb
> xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>  PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
> +PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config
> ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
>  PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
>  PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
>  PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

