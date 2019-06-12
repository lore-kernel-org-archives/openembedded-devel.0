Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9F8E7E78D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 12:00:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so12712354ioh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6ALn9uBTwYSQjrtOcjtbV0eHgwHc/Hd91vncE3mZ4vo=;
	b=C4sh0QgFemSdJGX3TAeVbLOjXwl8bxdoQ2g2fPEHqe2CiXs93IhGvS8WX1uHvTl+w4
	3H8JacLZwI2SMsX44W+QeYO3sB5j8qnyGC40dgSfTPStKS+rGYG8W7hhTVeLcDvsG8qX
	ilqHoqM9oXlmSLckVO+yyHl/uCXMhDOe5Pahgg2H4Ix2pPEmUA/KC607nHoQcoa7TRSR
	o9GlE+4VzIU/CkuT3IZeJzoDyBe3wiaoZAPWZFKlsn6KAqevMSW7HJlDjEbgfQU2zTa+
	Q730OD867OPXaA54rXIyD2uJXjg6YHp74h0OtUmoX6CMrTvTlXToyF4Q023YG3VcosI6
	bW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6ALn9uBTwYSQjrtOcjtbV0eHgwHc/Hd91vncE3mZ4vo=;
	b=h5BC1YnFSSAUqmzjaFYVwF51FJMmAJi3XTSjZZ54b4a0mjLpUBky0jyHAeK/3CYolz
	pmDwKZW/cR1R/aulYgQ0Br7UQqcIVU1CAdA/xzIoJOEF00xJRN1VB+C4H03w5ef3+VQX
	G5vhMeJYLeEcQK8YTud1vjM9giScmY13BARI0DN/BBAgDea6AUWtmTX/nywCCB2Md5/l
	dFBhue5QWVOIABI673UpUHVsPebJq6NEsqRUPJXdBJKZQ36sPQ2SLzT1n3bMukJ04/Nu
	EZ1e2bhi44vkKcY7JRAfBIPxPn8qC3iOAp3bySDKPQ1qc1PsmpF6l6Q4aLZKEEe5a+Vb
	KkGw==
X-Gm-Message-State: APjAAAVWyt7rwFlt7EWHk7eNdxXcxzMblBqEAFqR+3UXB7o0Gj7PmEmF
	UuDKcYaV5xx1q2ooSUozeKCE+7Udty21hC/eSRg=
X-Google-Smtp-Source: APXvYqymc98PlkPM2UfFLF3oIeMDK53Fxiu3G8JGqSdTbnD/ovjdl9eBPsPcCnuDBm5d2HPOWIqm9/YrauDdpERjrlc=
X-Received: by 2002:a5e:8508:: with SMTP id i8mr25197181ioj.108.1560340802693; 
	Wed, 12 Jun 2019 05:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190612114524.96123-1-kai.kang@windriver.com>
	<20190612114818.97824-1-kai.kang@windriver.com>
In-Reply-To: <20190612114818.97824-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 12 Jun 2019 13:59:51 +0200
Message-ID: <CALbNGRSMDPnCPtpjyZQ3H8ydFrKH+_pGK4cBDb4kVNsLrag=nw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH v2 1/1] lxdm: provides fake gdmflexiserver for xfce desktop environment
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
X-List-Received-Date: Wed, 12 Jun 2019 12:00:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 12, 2019 at 1:48 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Xfce4 plugin 'actions' which stays in tray area provides a menu 'Switch
> User' but the menu grayed out. It calls whether 'dm-tool' from lightdm
> or 'gdmflexiserver' from gdm to support switch users.
>
> Since recipe gdm has been removed from meta-gnome, create a fake
> 'gdmflexiserver' which calls lxdm to make menu 'Switch User' work
> according to:
>
> https://wiki.archlinux.org/index.php/Xfce#User_switching_action_button_is_greyed_out
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver | 3 +++
>  meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend     | 7 +++++++
>  2 files changed, 10 insertions(+)
>  create mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
>  create mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
>
> diff --git a/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver b/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
> new file mode 100644
> index 000000000..4be65c0c8
> --- /dev/null
> +++ b/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +/usr/sbin/lxdm -c USER_SWITCH
> diff --git a/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend b/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
> new file mode 100644
> index 000000000..4a799a98a
> --- /dev/null
> +++ b/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
> @@ -0,0 +1,7 @@
> +FILESEXTRAPATHS_append := "${THISDIR}/${BPN}:"
> +
> +SRC_URI += "file://gdmflexiserver"
> +
> +do_install_append () {
> +    install -D -m 0755 ${WORKDIR}/gdmflexiserver ${D}${bindir}/gdmflexiserver
> +}
> --
> 2.20.0
>
Really like it. Hope I'll find some time to test in the near future. Thanks!

Andreas

