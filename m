Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 26CF477130
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 08:57:59 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so36474932wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vqlqiYg0gnR456QCxxm7njDSzehoGozfvctMRDyUbQA=;
	b=dsJKz3KOJ/8ugK8Tpj15tWF6C4/h6nW27+rJpHF/ZYDFnZTmfAZK6/Np617SQvfA7a
	8TylZFIToLSLcY7gZ5hx8AfTEIl9UTT4mL8DOnJt2LT1pWgO1moeXwr+uVL3c/vAjDlv
	tP5KQ3hPin3uVpa77s06nGt0oZLVmpApqJj0vAacU9x0rr2uR/wRGfUXdCiPFbm6OtLb
	fLaXZdhatJXEFZchLxte69TqgCv+J6JdzzO/egxY3Wuo6iwwYzKgcHxPlOdTgN68ZcrI
	i0S91y4tXu5AI8AAl4kGe1M6DrqRxJmSaiwVmtQ5HAlE16ipbhirIXjH06/0A0IrWyft
	nxKQ==
MIME-Version: 1.0
X-Received: by 10.194.209.240 with SMTP id mp16mr22464102wjc.100.1445072278942;
	Sat, 17 Oct 2015 01:57:58 -0700 (PDT)
Received: by 10.194.154.232 with HTTP; Sat, 17 Oct 2015 01:57:58 -0700 (PDT)
In-Reply-To: <1445040614-14820-1-git-send-email-ivan@gloom.home.webthatworks.it>
References: <1445040614-14820-1-git-send-email-ivan@gloom.home.webthatworks.it>
Date: Sat, 17 Oct 2015 10:57:58 +0200
Message-ID: <CA+chaQf0EsYXYJUyPn4tQ5+o9GwTMM8-fKQ7Y9OtrAqXkLAKKA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Make possible to bake meta-toolchain-qt5 without opengl
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
X-List-Received-Date: Sat, 17 Oct 2015 08:58:00 -0000
Content-Type: text/plain; charset=UTF-8

Are all these restricted to DISTRO_FEATURE opengl?

I don't think so, you probably need to enable icu in qtbase and a lot of
these will get available (with or without opengl in DISTRO_FEATURES).

On Sat, Oct 17, 2015 at 2:10 AM, Ivan Sergio Borgonovo <
ivan@gloom.home.webthatworks.it> wrote:

> From: Ivan Sergio Borgonovo <mail@webthatworks.it>
>
> ---
>  .../packagegroup-qt5-toolchain-target.bb           | 56
> +++++++++++-----------
>  1 file changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> index 41c467c..22da7a3 100644
> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> @@ -12,11 +12,11 @@ USE_RUBY = " \
>      qtquick1-dev \
>      qtquick1-mkspecs \
>      qtquick1-plugins \
> -    qtquick1-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugins',
> '', d)} \
>      qttranslations-qtquick1 \
>      qtwebkit-dev \
>      qtwebkit-mkspecs \
> -    qtwebkit-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugins',
> '', d)} \
>  "
>
>  # Requires Wayland to work
> @@ -36,9 +36,9 @@ USE_X11 = " \
>  RDEPENDS_${PN} += " \
>      packagegroup-core-standalone-sdk-target \
>      libsqlite3-dev \
> -    qt3d-dev \
> -    qt3d-mkspecs \
> -    qt3d-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-dev', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', '', d)}
> \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins', '',
> d)} \
>      qtbase-dev \
>      qtbase-fonts \
>      qtbase-mkspecs \
> @@ -48,40 +48,40 @@ RDEPENDS_${PN} += " \
>      qttranslations-qtbase \
>      qttranslations-qtconfig \
>      qttranslations-qthelp \
> -    qtconnectivity-dev \
> -    qtconnectivity-mkspecs \
> -    qtconnectivity-qmlplugins \
> -    qttranslations-qtconnectivity \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-dev',
> '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtconnectivity-mkspecs', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtconnectivity-qmlplugins', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qttranslations-qtconnectivity', '', d)} \
>      qtdeclarative-dev \
>      qtdeclarative-mkspecs \
>      qtdeclarative-plugins \
> -    qtdeclarative-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtdeclarative-qmlplugins', '', d)} \
>      qtdeclarative-staticdev \
>      qttranslations-qmlviewer \
>      qttranslations-qtdeclarative \
>      qtenginio-dev \
>      qtenginio-mkspecs \
> -    qtenginio-qmlplugins \
> -    qtgraphicaleffects-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtenginio-qmlplugins',
> '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtgraphicaleffects-qmlplugins', '', d)} \
>      qtimageformats-dev \
>      qtimageformats-plugins \
> -    qtlocation-dev \
> -    qtlocation-mkspecs \
> -    qtlocation-plugins \
> -    qtlocation-qmlplugins \
> -    qttranslations-qtlocation \
> -    qtmultimedia-dev \
> -    qtmultimedia-mkspecs \
> -    qtmultimedia-plugins \
> -    qtmultimedia-qmlplugins \
> -    qttranslations-qtmultimedia \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-dev', '',
> d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-mkspecs',
> '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-plugins',
> '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtlocation-qmlplugins', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qttranslations-qtlocation', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-dev', '',
> d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-mkspecs',
> '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-plugins',
> '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtmultimedia-qmlplugins', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qttranslations-qtmultimedia', '', d)} \
>      qtscript-dev \
>      qtscript-mkspecs \
>      qttranslations-qtscript \
>      qtsensors-dev \
>      qtsensors-mkspecs \
>      qtsensors-plugins \
> -    qtsensors-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins',
> '', d)} \
>      qtserialport-dev \
>      qtserialport-mkspecs \
>      qtsvg-dev \
> @@ -89,10 +89,10 @@ RDEPENDS_${PN} += " \
>      qtsvg-plugins \
>      qtsystems-dev \
>      qtsystems-mkspecs \
> -    qtsystems-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplugins',
> '', d)} \
>      qttools-dev \
>      qttools-mkspecs \
> -    qttools-plugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qttools-plugins', '',
> d)} \
>      qttools-staticdev \
>      qttools-tools \
>      ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '',
> d)} \
> @@ -100,11 +100,11 @@ RDEPENDS_${PN} += " \
>      ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
>      qtwebsockets-dev \
>      qtwebsockets-mkspecs \
> -    qtwebsockets-qmlplugins \
> -    qttranslations-qtwebsockets \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtwebsockets-qmlplugins', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qttranslations-qtwebsockets', '', d)} \
>      qtwebchannel-dev \
>      qtwebchannel-mkspecs \
> -    qtwebchannel-qmlplugins \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'qtwebchannel-qmlplugins', '', d)} \
>      qtxmlpatterns-dev \
>      qtxmlpatterns-mkspecs \
>      qttranslations-qtxmlpatterns \
> --
> 2.6.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

