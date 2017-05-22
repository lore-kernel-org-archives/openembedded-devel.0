Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 17B4F60248
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 03:51:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k15so28781058wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 20:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=gOESIjZLW6IRLZqi30E9GecPM4I9s9OjQoEViEoutTM=;
	b=kHgdTqapu7zpZoSF074n5TxmDY+nYavoTJ9eWsM4o9+9Jurttn7XaUB9shnx7yhr32
	1V815h64Kc+N6a0e3s8Kn3u8H+WEGbZMI1sG8K8fPXlLHCM48ZxHZoa7RiVK+7x6lWZH
	/uMS7/5C+ofqjOxLSm2piVWegr2DeIjMFlkd74cB4GuPrCAMBe7lH3UoaEMwmIYRdNQ/
	YEMeIb6QiRoGd7rWsHoMASLaN5W0hAlLKnFdbeqjXsT5L6XCC488Uy1eRW7gXSNg0eC+
	iFWe3Brw+mJl/NZBakh60wTxebhclHVqgmt5AlHs7fn6dxO1qHQtiOlNTGI4fpPQKqcZ
	aeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=gOESIjZLW6IRLZqi30E9GecPM4I9s9OjQoEViEoutTM=;
	b=KIdr1ZKWE9Wr+1st66yJiX9XGz19DykP93mdHjfRmR2hY02ryIFWRMTVa1vSlxu4vj
	vKYtienp0YYkX8NypZhfWuMSnP0DcLuXd1PLBRdIQReObeDEnh85xCTXu4AtTsoNMAOV
	rxEfIS0QLw7Wu6chlAQf1x1jYhdyuQgfotv2zokCa8AowHYlfU2DNJzUOoy7EeZ+IG/k
	9cmwvnAykYzPgyaRlDdrJa6y2Zro5kfh6HrkZgh38klLAC3P9N07Hm5JvnaCEB7Svd6o
	10hrtdr1dyo5Q7XRXoeC1WI8srqfCWDmWAsG57ZCg2SDLqlncawKhTwqoJtpWD+8h2t3
	OKew==
X-Gm-Message-State: AODbwcCPWVmOkYfaLJDcSiLHiMOojs5spn7uFEmY1YPVR269S4awaOde
	MsCqfEvdvnHHIWZxInvJXLG1Os6g/g==
X-Received: by 10.80.143.227 with SMTP id y90mr8865417edy.131.1495425098214;
	Sun, 21 May 2017 20:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <1495394123-59799-1-git-send-email-wei.tee.ng@intel.com>
In-Reply-To: <1495394123-59799-1-git-send-email-wei.tee.ng@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2017 03:51:27 +0000
Message-ID: <CAMKF1so2vsban_5NxSnN4mfzHPeiNk30fQQbMfnWHHM7SPBLag@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, wei.tee.ng@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] dbus-daemon-proxy: inherit pkgconfig, unblacklist and set package version
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
X-List-Received-Date: Mon, 22 May 2017 03:51:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 21, 2017 at 7:26 PM <wei.tee.ng@intel.com> wrote:

> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> The pkgconfig is not found in recipes specific sysroot. Therefore
> inherit pkgconfig is added to fix it. Package version is updated
> to avoid package dbus-daemon-proxy-dbg went backwards which would
> break package feeds.
>
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
> ---
>  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> index a953ebc..4571b44 100644
> --- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> @@ -4,13 +4,15 @@ LIC_FILES_CHKSUM =
> "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1
>  DEPENDS = "dbus dbus-glib"
>  SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
>  PV = "0.0.0+gitr${SRCPV}"
> -PR = "r1"
> +PR = "r1.59"
>

Why not r2

>
>  ASNEEDED_pn-dbus-daemon-proxy = ""
>
>  SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy"
>  S = "${WORKDIR}/git"
>
> +inherit pkgconfig
> +
>  do_compile() {
>      ${CC} ${LDFLAGS} `pkg-config --cflags --libs dbus-glib-1` -o
> dbus-daemon-proxy dbus-daemon-proxy.c
>  }
> @@ -19,6 +21,3 @@ do_install() {
>      install -d ${D}${bindir}
>      install -m 0755 dbus-daemon-proxy ${D}${bindir}
>  }
> -
> -
> -PNBLACKLIST[dbus-daemon-proxy] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130613/ - the recipe will
> be removed on 2017-09-01 unless the issue is fixed"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

