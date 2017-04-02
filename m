Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 496FC6FF80
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Apr 2017 07:14:19 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p52so25601270wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Apr 2017 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5JCxyJsJfudtMK+RCMW1ra+WI+RtynOOdIoj0xGyTLo=;
	b=NdBU3/Odta8NbZPVvhgM3PE+pUq8V3Dbnm1v/CsDgIhnCbeMqdWjn214baS/sNdxn9
	ylDe0TQE7Zs3RKACh9oMwBBdhMNzllfsbUUClr4DfUONfxXJ27pO2lBbkMBtI+H3lHD5
	O21Vyu2yGboAwxQWYEmgkRzf8x4Ylu9FvI1AZAJIVCW4HinAN/UDFedr5LnfqiU4Q4B6
	dGqgqb1Pyktzufb5FGxii7Z2Vl4QUhCPhksHdAurqmGK60y/183a0BprLpNm9Fl7/EdJ
	n+u5e/4jptpVVwefi4tU4xEObNFBfSqFljxtRY4xRLvRxGC2OQy/R75CHTGAvnOYDW2H
	7WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5JCxyJsJfudtMK+RCMW1ra+WI+RtynOOdIoj0xGyTLo=;
	b=T99k73tMHPDB5kc9t1BMkizp7mV32J955DYOye43KXvlpqR2Xkp/RTTkE4Cx8vC6hV
	b9Jo0xQ1FDibZ0aZXmwmmzaxIDSTNGGCVqeQ/sui4xQmo9nh7nHJbqfEzGyj5WH5wxQw
	78qO/Ui61onU/wc6D5dVkGzgfNcoizZ3qTjFFGxAtlyG9BFb7SGaCJjUmm7+kQvMbkeU
	rLakUBd73Uw3kBQe+mz1cwzNNHrgWOWXuZYvNj4reKemIQGOtMWndGG6rmhbMtpvkTf5
	wdkykXnZt17zsc1ZcDQu6NeDmi54+5DLwuSQZ8siqIeUmWSDnLQqozHSkSgiPuBvtRet
	meGw==
X-Gm-Message-State: AFeK/H1Up0w3XgKUEEi51gPu0MqB+s4CfNiXQpju/ow/L8rCt+PqDhYxperyHJUgBJ+7pVQXMAFpV0WmF7GEiA==
X-Received: by 10.223.160.168 with SMTP id m37mr10271257wrm.196.1491117260707; 
	Sun, 02 Apr 2017 00:14:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sun, 2 Apr 2017 00:14:20 -0700 (PDT)
In-Reply-To: <20170331164247.5052-24-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-24-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 2 Apr 2017 09:14:20 +0200
Message-ID: <CA+chaQd0q-zkbt3887iqPszQqf-5TUcsw5c1gPPBrCh6AUBzkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 24/43] minicoredumper: Update to 2.0.0
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
X-List-Received-Date: Sun, 02 Apr 2017 07:14:22 -0000
Content-Type: text/plain; charset=UTF-8

minicoredumper-2.0.0: minicoredumper: Files/directories were installed
but not shipped in any package:
  /run
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
minicoredumper: 1 installed and not shipped files. [installed-vs-shipped]


On Fri, Mar 31, 2017 at 6:42 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Clarify licensing and switch to github for fetching
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...inicoredumper_1.0.2.bb => minicoredumper_2.0.0.bb} | 19
> +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_1.0.2.bb =>
> minicoredumper_2.0.0.bb} (64%)
>
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
> b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
> similarity index 64%
> rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
> rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
> index babe54448..f3071e39a 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
> @@ -1,17 +1,24 @@
>  SUMMARY = "minicoredumper provides an alternate core dump facility for
> Linux \
>  to allow minimal and customized crash dumps"
> -LICENSE = " LGPLv2.1 & BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=45445387350de96a0e70410470ee5cab"
> -DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux"
> +LICENSE = " LGPLv2.1 & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=709087c2ed0acda54a4d91497a889e42 \
> +                    file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5
> \
> +                    file://COPYING.LGPLv2.1;md5=
> 321bf41f280cf805086dd5a720b37785 \
> +                   "
> +DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux
> json-c"
>
>  inherit autotools pkgconfig systemd update-rc.d
>
> -SRC_URI = "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
> +SRCREV = "248019446ccf6079926efb54f8b6dd7be769bbae"
> +
> +PR .= "+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/Linutronix/minicoredumper-debian;branch=
> unstable \
>             file://minicoredumper.service \
>             file://minicoredumper.init \
>  "
> -SRC_URI[md5sum] = "5ba9d116b52a8e2fb93456260644e753"
> -SRC_URI[sha256sum] = "1b0eeb3d70dbd2ad6f2f673e4e3446
> e5dd784e132730e21d8f9dc0977e47dd9a"
> +
> +S = "${WORKDIR}/git"
>
>  SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
>  SYSTEMD_AUTO_ENABLE = "enable"
> --
> 2.12.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

