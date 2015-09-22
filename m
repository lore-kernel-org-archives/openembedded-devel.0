Return-Path: <pespin.shar@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 57B3F73243
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 12:00:57 +0000 (UTC)
Received: by lahg1 with SMTP id g1so9147905lah.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ng5brbtxHDMZ1WJLQQKiTZV3U6g7vihdx973RRrq8ko=;
	b=DanNd4++EHZ9nnZQPKKWAnpEm1v9Z+iwRyRgZ0aG72f3bB7QwvV3cIE8OEVFOn6spu
	rO9Bi1EGP2D8wFGlQdZUmm8T/iZpuzb6ZgYSlORjXcuA57jS0M80MGbLw3NEk/DoOs/o
	TSBJCAJRDo/8OHKZ7uTVu8O4iDkHcSW9RnMBqCxnQ2f1sJJWV3eQirOQ4rBgengsezQ6
	gSfx/nZNdwxCIRUbHEV1bWC7Ix2IWKYheukM4s24MwxXPjw5dgTZgXAvleMieNCXTKdi
	RcB6ZBJhHbBN9j963sUv1MIB92s2jdbqePP7AAKiM7ge9ANBPmZis2f6QdtGQ1CxQV4+
	eN5w==
MIME-Version: 1.0
X-Received: by 10.112.14.72 with SMTP id n8mr713106lbc.19.1442923256177; Tue,
	22 Sep 2015 05:00:56 -0700 (PDT)
Received: by 10.25.1.207 with HTTP; Tue, 22 Sep 2015 05:00:56 -0700 (PDT)
In-Reply-To: <1442921963-19530-1-git-send-email-zhenhua.luo@freescale.com>
References: <1442921963-19530-1-git-send-email-zhenhua.luo@freescale.com>
Date: Tue, 22 Sep 2015 14:00:56 +0200
Message-ID: <CAEGpDuYv+=n3HZFDSh2drU4EBH7pt_O2WkvvCftqA45ASzWTpA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] lvm2: make sure services files are installed in systemd_unitdir folder
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
X-List-Received-Date: Tue, 22 Sep 2015 12:00:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Same stuff I have been proposing in other patches lately: How about using
"systemd_system_unitdir" instead of "systemd_unitdir/system" ? You can find
it in bitbake.conf

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-09-22 13:39 GMT+02:00 Zhenhua Luo <zhenhua.luo@freescale.com>:

> Make sure the services files are installed in
> ${D}/${systemd_unitdir}/system,
> fixed the following build error:
> | sed: can't read
> .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service: No
> such file or directory
> |   sed -i -e 's:/usr/bin/true:/bin/true:g'
> .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service
>
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 2b2d8ed..1968ac9 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -39,7 +39,7 @@ do_install_append() {
>      # Install machine specific configuration file
>      install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
>      sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
> -    oe_runmake 'DESTDIR=${D}' install install_systemd_units
> +    oe_runmake 'DESTDIR=${D}'
> systemd_unit_dir=${D}/${systemd_unitdir}/system install
> install_systemd_units
>      sed -i -e 's:/usr/bin/true:${base_bindir}/true:g'
> ${D}${systemd_unitdir}/system/blk-availability.service
>  }
>
> --
> 2.4.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

