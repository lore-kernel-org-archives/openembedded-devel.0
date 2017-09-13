Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB8B78648
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:39:51 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id l24so18511175uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0VEh77z12LI1yokpSFpVjCIiSDYX52Mo54qOaiRFpTg=;
	b=nAyaaF+79QEaA8BoILad2yuI4v7tgpDAQeiXO3ZZZftE0WupiVZFziaM4Z9ykpVRHF
	JQTddNB9zh8neS92iTJBUzQ8ArPLNlT6nw1NrHgBl5wEO/TVKyiL7mIIHvpNuvuozSMY
	Dkyt3K1Y5VeyUYclxVRJZMyV+AK2jG8CLkMjqM1lWo/mn7RyLkTD/fbxSj3KBtXiw7pj
	WCCt4dDAaA7lP4/Lb4fFwXtS9duMfUr6td8oEZ3TcwmNJRRMUSUDDSbqg4WwxDcrhGDJ
	X+FOKDfO+RvXxO0WN2oLpy1ipQMXM0vKNaluPsjHAAtYhmpSdFni6YUDriML2LOsb0So
	KbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0VEh77z12LI1yokpSFpVjCIiSDYX52Mo54qOaiRFpTg=;
	b=UtxM6WhT7yEVSNUuYIqemSOh0I2vVV+IecwP4zucKSSwRHsGbwJnxxs+xs8ohnP4QW
	xNRsm7U0wpfhdH11UiQJXan3K9owh6v1KKJNjzFS7MjC8FgWm+JxNcG4lvJ/DUpjb2L4
	Zt+gK0b156jUlXq4a3oLyphlaYQovkKo/NoDCvVfN8zpAXRZm27bzqWUF+irY4AaHtrR
	yrKbW8TsmEud0/VKRP840prIK3MNBj3rmq7hq+GtwczJ+H7B0d+7wbCbkraWD6r6J5B4
	Z9a451Zygu/edFEaxPOin9bLKzzFgVzbFSwYRJJeS965vBH+FTe/mWs1DaK5TjQTlC6V
	W44w==
X-Gm-Message-State: AHPjjUhub7ZhxQO7Oyr1h2Vf09L5xtPIgVn/zuUHeP1TAjk7LaF6ZNE0
	JK5qx0sI3ACahxG8r3iGRdcwOnVnWasKNedr+Cc=
X-Google-Smtp-Source: ADKCNb4HHQ3vap5OZqQHcWFvW49gt9EElkH71Lc3E0ws53UdgEQAz+bVFkZIM3rSDHig1UHtQUiq4dcemDkwDGsFvQo=
X-Received: by 10.176.24.217 with SMTP id d25mr13355999uah.191.1505302793092; 
	Wed, 13 Sep 2017 04:39:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 04:39:52 -0700 (PDT)
In-Reply-To: <20170913110447.18816-1-brgl@bgdev.pl>
References: <20170913110447.18816-1-brgl@bgdev.pl>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 13:39:52 +0200
Message-ID: <CA+chaQeKGd0Q57a+4hax24Tmcv=XtWAzNazC47OBzdf4djX7fA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ceres-solver: add new recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 11:39:52 -0000
Content-Type: text/plain; charset="UTF-8"

Don't use github archives as they might get regenerated from time to time.

Why do you set PV in the recipe to 1.13.0 and the filename 1.13? Use just
one.

The FILES variable look suspicious, why are you trying to include whole
libdir and includedir? Most of it will be packaged in PN-dev anyway.

On Wed, Sep 13, 2017 at 1:04 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
>
> Ceres Solver is an open source C++ library for modeling and solving
> large, complicated optimization problems.
>
> It's often used in 3D computer vision applications.
>
> Signed-off-by: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
> ---
>  .../recipes-support/ceres-solver/ceres-solver_1.13.bb  | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ceres-solver/
> ceres-solver_1.13.bb
>
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> new file mode 100644
> index 0000000..0bfc083
> --- /dev/null
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Ceres Solver is an open source C++ library for modeling
> and solving large, complicated optimization problems."
> +AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
> +HOMEPAGE = "http://ceres-solver.org/"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
> +
> +SRC_URI = "https://github.com/ceres-solver/ceres-solver/archive/${
> PV}.tar.gz"
> +SRC_URI[md5sum] = "810f53772be2c41abff53a9c03d1e301"
> +SRC_URI[sha256] = "51ccb201b61ac71501fb6ccef158f0
> 78a750bc796ee6a271cd535cfe338202e5"
> +
> +PV = "1.13.0"
> +
> +DEPENDS = "libeigen glog"
> +
> +inherit cmake
> +
> +FILES_${PN} = "${includedir} ${libdir}"
> --
> 2.7.4
>
>

