Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8EA7F2F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 17:18:18 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d15so69383393qkl.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vYkL9IyMy/qKiwcI04LrqRxFyXjCpis5T0H62jtBflw=;
	b=lGkNjc3wBovb7HZBcYUHGdGPNuSI7ncIRb681Wt1DK+KVEiLwBNYhr91e7mmYQQLRl
	AJYFyaBNcfenQU5Enp5z2JEzg1b7IySH/GU0hWw6iLF42OA94NQvk2uChVYEXdG62twY
	d0ZPOipQ/86lNMZMJdO8FJMtUFpoblPR07bYaqH2EiiK1Jn9+F9AC/Hvh5bEqq6UZZMB
	s+biseGV+YS931jLoeJZ+LSARuTI663D+7QG6wRTKpu/E8YgtBQvpp/MnuDSMVJAafNs
	mZF7jNHqh0Wxmpm4Gu9jyHe3icJJBsRprVZNSzODea+mXLwdIcYxleDC7Yf8K0GhmCkm
	q8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vYkL9IyMy/qKiwcI04LrqRxFyXjCpis5T0H62jtBflw=;
	b=UCMLU0U6xHibh+v+2imZH6fGTYp73O9XFlchPzHBBx70m5wLfbsDWcqsLoyhHKbD48
	3GFJllmkjH6qaBhNypOV1Tn/W9MuOVzhQfzmxUZL2Rg6eQMoC4dYw/7FLEIRo5xE29LF
	fW4X/4eN4amBj1BQnXkUTBsw2AiPB7dR6Tbhm/DepubINWglmKbrWEtGiTHbAhr5y82U
	uXp1Bx/x1bmLb3Bp7d40+v9X+kZq7w7QF6JXJLTmGXurk2nhNcTc0v6jdDW637DDvOL1
	qNgHWJZWUi+4y79yZgXMQ1Kn0XgAOlPQVELzYZ3inQ2srkVcT0kKy2uovYX2I+jFfGdc
	m9Fw==
X-Gm-Message-State: APjAAAUtv6Ra/N3dLhkYqdT6qF4wAsFJaIX9bzFhEv6NHu6XAI+2oFbv
	6dKN7+qE9GAXRP3Tbn4DOlS9pK7X1vp2Ld64+tM=
X-Google-Smtp-Source: APXvYqwcvTKYoYOd1xxXwNoImK8+d4BK20RX3swyCV8vh28+alX/cFsU/A/5etV7qyDTW/dvc4ICmk+B/tJVshrFq4A=
X-Received: by 2002:a37:4243:: with SMTP id p64mr2611955qka.9.1565284698876;
	Thu, 08 Aug 2019 10:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190806064731.17490-1-andrej.valek@siemens.com>
	<20190808144903.2875-1-andrej.valek@siemens.com>
In-Reply-To: <20190808144903.2875-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2019 10:17:52 -0700
Message-ID: <CAMKF1soTfo8sD5MaTGX3Duk=e8+G1VZt3OmcmQgZVr6cVygQZQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] nodejs: 10.16.0 -> 10.16.2
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
X-List-Received-Date: Thu, 08 Aug 2019 17:18:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 7:49 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> - update nodejs to active 10.x LTS release 10.16.2.
> - add python running dependency due to samples.py requirements
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../nodejs/{nodejs_10.16.0.bb => nodejs_10.16.2.bb}                 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.0.bb => nodejs_10.16.2.bb} (94%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
> index aaa1da0aa..e0eac47ae 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
> @@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
>             file://0002-Using-native-torque.patch \
>             "
>
> -SRC_URI[md5sum] = "c9a7ab43f8b50c8a4d5545de307b7540"
> -SRC_URI[sha256sum] = "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35aa9c41f761816956608"
> +SRC_URI[md5sum] = "fa70b942c5e3379ce96219fe90f50c8f"
> +SRC_URI[sha256sum] = "6cbc17795e9259dce7a8f5fd5a2e46f9e6920fb48b7d9539c5b2faa5bb5db4d8
>

its missing closing quote above.

>  S = "${WORKDIR}/node-v${PV}"
>
> @@ -100,7 +100,7 @@ do_install_append_class-target() {
>
>  PACKAGES =+ "${PN}-npm"
>  FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
> -RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils \
> +RDEPENDS_${PN}-npm = "bash python python-shell python-datetime python-subprocess python-textutils \
>      python-compiler python-misc python-multiprocessing"
>
>  PACKAGES =+ "${PN}-systemtap"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

