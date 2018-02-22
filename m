Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBE2871AD1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 17:27:42 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id a203so2385789itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dGVLhK6okx8YotPVW/rKyur7lkJDqDUvLUD89YiMHJE=;
	b=KEHKH6uWM1Vy3qP2Hfd7LP2e7PZwtxua/vrKWsFCb/hTogvu2ry2y9pIwaHyU70LJe
	EoHJhZ+SRgGVOHkz2gyrXPCOa+NAX4xYFPKGLSb5UXGDuYAoeU1fyqRNu0iVkn3bmAwg
	4FDQTeg9BGyvRulJUkcAk//W4f3ZoKLnYCNWmkjUcj1o5KjA+4CY6aDcZJR9w3bzNZAY
	ksA0NTBo+FD6LD4sM5ZYKImmrZTn7V0OpVKXvD4hZ3cYZp7MV/tfHCCftDbgLRjCnOJ2
	zjyJMb49L1Q1T3Q9dlgcBzUqWD/qU3PrK8XU4fQ1LO3QsUDl4cncruMEFMFjYajlbYr3
	fgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dGVLhK6okx8YotPVW/rKyur7lkJDqDUvLUD89YiMHJE=;
	b=XLAx5O/GJkwB1qXaimRMbHgxzXOE2cNWGPXmhpHu51NkY/ph/hqOc3WEIA28ltAvxL
	GJcs3mJJyeM2vnXeRu/Dpc3eT8FTXVKWOJBeLzRowc6MAOiSFy4ems2ThT89nirKrSqJ
	eg/wQUtJx1xrMJJB2pD7jiNEjSQl7F4sifJF0Ql4QNCVhHtMh+2LPOBZX+EdnkWKwXxY
	75wB9QyiUm1CzQAL+OQN3bNJfMppsLjlI9XKMu+bVRhRZWXjbgPxEF+jKWOzILnquh0G
	iWsK2QiorReoqfuL+9SYLWNorcHq9ypoASk/IZG3EPkIDGk/SJQ296dBYVzB5dltf+N0
	9dJA==
X-Gm-Message-State: APf1xPAJys91vc/zWNiouIl60vUO7E2yo3V7YtixrQ/jx51B8e9OqVb8
	A7Wh/EdP9ePEtf5kZyAs5y5DdZ+fw4EMK3jqtu4=
X-Google-Smtp-Source: AG47ELvspv5YhI3YiEuOokOR46km7+PlS4R+UFkwDgJtPLb4yE36CMZONTbBLp0JJ0PuKMPqirmVVRNisA/1BLgjbNA=
X-Received: by 10.36.125.193 with SMTP id b184mr6842770itc.36.1519320463720;
	Thu, 22 Feb 2018 09:27:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.166.68 with HTTP; Thu, 22 Feb 2018 09:27:42 -0800 (PST)
In-Reply-To: <20180222170221.1887-1-Martin.Jansa@gmail.com>
References: <20180222170221.1887-1-Martin.Jansa@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 22 Feb 2018 19:27:42 +0200
Message-ID: <CABXoSoWp7E1DdcreEo1o0E9U_Hv5B15dzsSagFJTYQHH7XzvmQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCHv2] qt5-git.inc: drop nobranch=1
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
X-List-Received-Date: Thu, 22 Feb 2018 17:27:43 -0000
Content-Type: text/plain; charset="UTF-8"

Note that the Qt release branches (5.x.x) will usually disappear right
after the release, which will break the build without nobranch=1

On 22 February 2018 at 19:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> * sneaked in with:
>   commit 333949a8239dfa7788b35f1059614733e11a6a25
>   Author: Samuli Piippo <samuli.piippo@qt.io>
>   Date:   Thu Jan 26 16:54:50 2017 +0200
>
>     Upgrade to Qt 5.8
> * use 5.10.1 branch by defaut and fix QT_MODULE_BRANCH
>   in qtknx, qtmqtt, qtwebkit-examples, qtwebkit which don't
>   have 5.10.1 branch at all
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qt5-git.inc              | 6 +++---
>  recipes-qt/qt5/qtknx_git.bb             | 2 ++
>  recipes-qt/qt5/qtmqtt_git.bb            | 2 ++
>  recipes-qt/qt5/qtwebkit-examples_git.bb | 2 ++
>  recipes-qt/qt5/qtwebkit_git.bb          | 2 ++
>  5 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index 7ee0643..beba913 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -1,9 +1,9 @@
>  # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
> -# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
> +# Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
>
>  QT_MODULE ?= "${BPN}"
> -QT_MODULE_BRANCH ?= "5.10"
> -QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
> +QT_MODULE_BRANCH ?= "5.10.1"
> +QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
>
>  # each module needs to define valid SRCREV
>  SRC_URI = " \
> diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
> index 5e01e3c..fa981ab 100644
> --- a/recipes-qt/qt5/qtknx_git.bb
> +++ b/recipes-qt/qt5/qtknx_git.bb
> @@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS += "qtbase"
>
> +QT_MODULE_BRANCH = "5.10"
> +
>  SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
> diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
> index b705f7c..90c255d 100644
> --- a/recipes-qt/qt5/qtmqtt_git.bb
> +++ b/recipes-qt/qt5/qtmqtt_git.bb
> @@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS += "qtbase"
>
> +QT_MODULE_BRANCH = "5.10"
> +
>  SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
> index 3e3e4a0..114fab7 100644
> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> @@ -17,4 +17,6 @@ DEPENDS += "qtwebkit qtxmlpatterns"
>  RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
>  RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
>
> +QT_MODULE_BRANCH = "5.9"
> +
>  SRCREV = "a24c780b60d7d8bc00c4a48042cf7f32db777d55"
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
> index 5dee6a4..b23d4d6 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -87,4 +87,6 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
>  RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
>  export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
>
> +QT_MODULE_BRANCH = "5.9"
> +
>  SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

