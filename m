Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 717E260049
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 18:46:35 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id u138so18232567wmu.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 11:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pSJyDpKyclUAw+oBYWNvUo1HmsFcmFW9xcqsNCNvNqI=;
	b=rET3CmvT8Wu3mIsqUajoVge9UGT0gr5XKjjwfOBovm8fU8b+Rzau3tTLkYactwfPh4
	UB3yD6BmKZc1KKaps0iM4AbHf00GAb9pMKhyWRm0X5NksadxPhz3d7So6gL1dOfWmEQ6
	xljIpHO0ZIld/BKucnQhj7sMaPWaSQ7M2oGNGHbvLeG7dpuBydBBQa32JjDzomVPKgTt
	F0o2qDHtZF1qKEfPdpL1praB7uSDzCQh2tpemHbA22K1LcC9XcdTFyc0WcB3yT/L2IQr
	nFyYv5M8IeVo48IQMLpFiZTF1WDrNKoxN6PChFYLhrJRG5RO7t7tD4nSxN2yY8vwgF47
	nTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pSJyDpKyclUAw+oBYWNvUo1HmsFcmFW9xcqsNCNvNqI=;
	b=iYQGovuckgR6GVPIFoHiyMmRtAgMz5B3W16UecyS0owBPDZ+f9WUif3Kd1HYihLZUk
	+N1H5NAANMhkEIAFO3Tp3Zs/+WpWJVzM/LSW2Ijmy4KNLDQEyAat2p5A6N4gUujKnSH6
	Op9mIAh/wXkG2aA1Er/Wyi9W4gYviesHCa5xsXCBDVMIWaEpASHeumowCOpLwsZqjpaP
	oDf91NR0QFtaFSuaoHti06yZjzATppJQIJez6NZJEu5DjVvKlZKoHPJ23hEWvDi53bEh
	SBIXchNENcek2DSqmQTWtokmRZfkYFvpZzN10BV0pGZO3yYm0O4pUyvWwGPryKYoDIhH
	7r6A==
X-Gm-Message-State: AMCzsaVI5akvRmO3oXZpa2u27Ld1rEEv/rRa0xFnPblgJLeVl+OuPpQe
	SNZEo3lbQIBnODy6Vg+gVerPSM31AKE+kBNPpLM=
X-Google-Smtp-Source: ABhQp+Sciy/kzVfA2v00Nt30cLSE6W7/r2FcXbLC/hCl71OqMFzKHHvNRQInwtqqhas4s6lY9WePJ+AbAw7GDBbT/VI=
X-Received: by 10.28.168.83 with SMTP id r80mr6922wme.59.1508870796213; Tue,
	24 Oct 2017 11:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 24 Oct 2017 11:46:35 -0700 (PDT)
In-Reply-To: <20171024155108.20649-1-daniel@zonque.org>
References: <20171024155108.20649-1-daniel@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 Oct 2017 20:46:35 +0200
Message-ID: <CA+chaQdioSabeoRub37Lf92xJ3-3oXf6Bjg8LwMn_ya+tYTtSQ@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebengine: make test suite succeed
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
X-List-Received-Date: Tue, 24 Oct 2017 18:46:35 -0000
Content-Type: text/plain; charset="UTF-8"

Please resend with your Signed-off-by line.

On Tue, Oct 24, 2017 at 5:51 PM, Daniel Mack <daniel@zonque.org> wrote:

> Make the qtwebengine test suite succeed when Qt was built without
> accessibility features.
>
> Upstream bug report: https://bugreports.qt.io/browse/QTBUG-64015
> ---
>  ...ests-make-accessibility-tests-conditional.patch | 37
> ++++++++++++++++++++++
>  recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwebengine/
> 0005-tests-make-accessibility-tests-conditional.patch
>
> diff --git a/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
> b/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-
> tests-conditional.patch
> new file mode 100644
> index 0000000..8b82010
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-
> tests-conditional.patch
> @@ -0,0 +1,37 @@
> +From 006f08373cbaa8485311f491ab8e67433c0e9ad6 Mon Sep 17 00:00:00 2001
> +From: Daniel Mack <daniel@zonque.org>
> +Date: Tue, 24 Oct 2017 15:46:19 +0200
> +Subject: [PATCH] tests: make accessibility tests conditional
> +
> +Only test the accessibility functions if accessibility was enabled in the
> Qt
> +config.
> +---
> + tests/auto/widgets/widgets.pro | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/auto/widgets/widgets.pro b/tests/auto/widgets/widgets.
> pro
> +index 441eea0f..7bab18f0 100644
> +--- a/tests/auto/widgets/widgets.pro
> ++++ b/tests/auto/widgets/widgets.pro
> +@@ -1,7 +1,6 @@
> + TEMPLATE = subdirs
> +
> + SUBDIRS += \
> +-    qwebengineaccessibility \
> +     qwebenginedefaultsurfaceformat \
> +     qwebenginedownloads \
> +     qwebenginefaviconmanager \
> +@@ -14,6 +13,10 @@ SUBDIRS += \
> +     qwebenginesettings \
> +     qwebengineview
> +
> ++qtConfig(accessibility) {
> ++    SUBDIRS += qwebengineaccessibility
> ++}
> ++
> + contains(WEBENGINE_CONFIG, use_spellchecker):!cross_compile {
> +     !contains(WEBENGINE_CONFIG, use_native_spellchecker) {
> +         SUBDIRS += qwebenginespellcheck
> +--
> +2.13.6
> +
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> index 4bc4cdb..519ccb4 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -138,6 +138,7 @@ SRC_URI += " \
>      file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
> \
>      file://0003-Include-dependency-to-QCoreApplication-translate.patch \
>      file://0004-Force-host-toolchain-configuration.patch \
> +    file://0005-tests-make-accessibility-tests-conditional.patch \
>  "
>
>  # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/
> 56-based
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

