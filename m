Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 30BB371C0F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jan 2018 01:37:20 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l64so10870571qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 17:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RNqs0wstLHT1yNYG+N+pupm5k3PEFkNjVDZ7JTwIjYE=;
	b=Pxh0PT/2Jt1u40yNkf8lewMCrjCG9f0ZlsFwISu0QyE/KexbqnT/0gdH8JUkEgyvrp
	0d71uetv2holNdvD0HLIh/m//HZb4XjJy4rlzfKyk0D5DzVqOSACM+u9v5LfOVjI0+gu
	PVIzWfGHYQEobfKqLepcbdjXJBzkrPcepgcb6hO4f67Ha8/jyEvLjHLk83GV5s+aKSfV
	DkcfkCON4XaZ0auYVbQOPVgH85nf3Dn6HbSUj2qiCiDX5AOEPg4yhMydSiPcAiB4N8n3
	7EAeWEAUih+3WpD5d692qhWyHf1oyz30m3upuXCMHpDUDAhIt7tQ2Bvdw0FGJS4ysv/c
	LYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RNqs0wstLHT1yNYG+N+pupm5k3PEFkNjVDZ7JTwIjYE=;
	b=UD5yLkrrTTNrrQNGohAZGo8jYsZwQZV82Mlqqy2S7RoTeqMeWRToMTQ3tOAAfDm+yB
	HmJDMxWyp9rNues3A0Dch0WZkf5vXl78G1Re7KYCeY5uXo6MyLmXYOTqk2ZbYgW+bZQ/
	NRrV4gBfb7BZ4Zo5Tmt0ZnCiSS/rUortqMuHIOFrm/7fVp5INTh01grjyL+pBGL6XAKp
	vN7nwatUyMMGazG/AcS1Ywy9AknlaC/6h8P0M/VPMWIR4CbaLm5FWORM8GSPqP7YrsMa
	YJhR+7RtYT5cVzVu0f24CR/acivcEMDD5T9nsYkaqLZxhjS9ll5cFL6dnkoOuH+/1e7p
	lSug==
X-Gm-Message-State: AKwxytditL1EkIC0yfVaoDJuPKw2F79+9Td6KLTil0b6keaInsifRk19
	Qii20t6tPW8oqzAL+/lp+8VPaRZhFYYP6m/1v3kKDQ==
X-Google-Smtp-Source: ACJfBosv9jCbc15YecPuKNHElMO5TyP0hSc8OSAec8oCNVkFdZd1ShmLQMd1jUl26XqzhxlInS6QYrvHmQBfhLIlcik=
X-Received: by 10.55.78.143 with SMTP id c137mr41303073qkb.122.1515807441391; 
	Fri, 12 Jan 2018 17:37:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.42.86 with HTTP; Fri, 12 Jan 2018 17:37:20 -0800 (PST)
In-Reply-To: <1515807236-28679-1-git-send-email-liu.ming50@gmail.com>
References: <1515807236-28679-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sat, 13 Jan 2018 02:37:20 +0100
Message-ID: <CALatG=5Xygg2uf2uPksYkbWOQ3ZAY6zaqiR23X0DHA-Eox=W2A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Jose.DiazdeGrenu@digi.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: Re: [meta-qt5] [PATCH] nativesdk-qtbase: drop fakeroot task do_generate_qt_environment_file
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
X-List-Received-Date: Sat, 13 Jan 2018 01:37:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Jose:

I encountered a same environment-setup.d conflict issue, it could be fixed
by this patch per my test.

//Ming Liu



2018-01-13 2:33 GMT+01:00 <liu.ming50@gmail.com>:

> From: Ming Liu <liu.ming50@gmail.com>
>
> Move the implementation to do_install, this fixes a following issue:
> | Error: Transaction check error:
> | file ..environment-setup.d conflicts between attempted installs of
> | nativesdk-cmake-3.7.2-r0.x86_64_nativesdk and
> | nativesdk-qtbase-tools-5.8.0+git0+49dc9aa409-r0.x86_64_nativesdk
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> index 33be99e..98e35cc 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -169,9 +169,7 @@ do_install() {
>      # Fix up absolute paths in scripts
>      grep -lr /usr/bin/python ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
>          xargs -r sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env python,'
> -}
>
> -fakeroot do_generate_qt_environment_file() {
>      mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
>      script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
>
> @@ -200,6 +198,4 @@ fakeroot do_generate_qt_environment_file() {
>      sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
>  }
>
> -addtask generate_qt_environment_file after do_install before do_package
> -
>  SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
> --
> 2.7.4
>
>

