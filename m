Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB30744A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 19:33:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r82so346478wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MOtLxr6A4G47A0dOXErtqe/CRpbNrHqzmqrRhvZJtpg=;
	b=kINSIpoE6CRmkrMj7rS+/um5n6hgvO+UP/vmNMb19uFXw1H4L3NHVDLw0/bdFJRKSs
	DBUK3gTPnNAS6sAP5+cnfbbMCDJ3J6cS7zc1NS/L6q67VQpAaBmtrt16KVRnDqCUS1YW
	bd4IFOTgZ7Nest4Ac8Dlmtmip0MvpziVQTIDzI8apOP/ekL/KHB+3DcXBGd3rNiZ3rgu
	P03ntXsxynmbBtBUJCg90IkmIPUbqyRqZkHBLcSd4wisjzXGs6cYaHlpf7haLvZmHJX+
	N50l9MqQ5X+1OjjbBco4Jhitun0q3ygi87rF6fT+qy7FnjE5JnvLhi56ob8zZp1dpWSA
	ntdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MOtLxr6A4G47A0dOXErtqe/CRpbNrHqzmqrRhvZJtpg=;
	b=QMmhYMDNG7ivub+Uf7lmt1AatbTqzKlqYPY4NlyFeyOXD++YDQgB08Rw4+cyTDdjcn
	IEj/nMbhGnLvBDYS3dRM+3rNKje0igVexiBBBI43Rvs38CBgLzebj7TkPMo+nyTtu+pM
	AqU9vazXkyo+sBkMSs4uxuOx/Z2bstpCqVr2ft9HG0IHSldCNiCOWuKu38gcKAOVnfUU
	EUdRCy8AvO7e2rwB4buNm+lLVb3AH3SfjQgZwqHcLR4kLetbTnmDDqZqvA2dbiF5w0ca
	T9V2r9kzxu00bO/QyDQI/r52RvwX6iYypaL2T6EB4o974d14Gyu+1rccpNK9ZiAdY1Q+
	6S8A==
X-Gm-Message-State: ALQs6tA3fYhLbv7RwppkqVMplrF0QYLNgoaN8Xa5OWmxfM1o+s/6b3zf
	y9vurd15q8HO/JmgtLs7oMTo+GWB29OE5Sz0TUE=
X-Google-Smtp-Source: AIpwx49Qbu405jy06ouVm9ubelhR50eLK2jGF8uZgz494hvOHveVjRDvrOQEUiKojS3oDqyxvgzLtTwnZUgsI2aO0dk=
X-Received: by 10.28.156.4 with SMTP id f4mr1703141wme.79.1523561597763; Thu,
	12 Apr 2018 12:33:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Thu, 12 Apr 2018 12:33:17 -0700 (PDT)
In-Reply-To: <20180412190931.4057-1-daniel@zonque.org>
References: <20180412190931.4057-1-daniel@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Apr 2018 21:33:17 +0200
Message-ID: <CA+chaQeW=C8ZAhUSyNBH8r1ptnotA_o3Chj-ysNUxVSGH3sXcg@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Remove license files that were dropped in 5.9.5
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
X-List-Received-Date: Thu, 12 Apr 2018 19:33:17 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks I already have this part for qtxmlpatterns, will do the same for
qtquickcontrols.

On Thu, Apr 12, 2018 at 9:09 PM, Daniel Mack <daniel@zonque.org> wrote:

> See upstream commits:
>
>   https://code.qt.io/cgit/qt/qtquickcontrols.git/commit/?h=5.9.5&id=
> a843884697602891d21b9f9bc62603548dd6a6b8
>   https://code.qt.io/cgit/qt/qtxmlpatterns.git/commit/?h=5.9.5&id=
> 81dd12388d67f6b2be253ea831b876c8dec2dca5
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
> Martin, you can squash that into your bump commit if you wish to do so.
>
>  recipes-qt/qt5/qtquickcontrols_git.bb | 3 ---
>  recipes-qt/qt5/qtxmlpatterns_git.bb   | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
> qtquickcontrols_git.bb
> index 14b465a..c7c491d 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -4,12 +4,9 @@ require qt5-git.inc
>  LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM = " \
>      file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
> -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
> qtxmlpatterns_git.bb
> index 3787b86..7a027b4 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -6,12 +6,9 @@ HOMEPAGE = "http://www.qt.io"
>  LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM = " \
>      file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
> -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> --
> 2.14.3
>
>

