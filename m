Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 292AD7CFEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 03:06:47 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id z17so1156891qts.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tpbjZ6oVZsDQYfvDXUEXoWStc4bRH2pUGfw3dG/y8ms=;
	b=c5kG4krLiADjYVKJ6vOnkUMktbDXZf0pXuFn4DSONOKupdDibPu8xVW3Y0xuMBww4/
	giGusr5Vjy0746jDlnGS9NDN+1S/v1lA7mpNHv18yty1h3Yirp5i3/5NBQt4ZLy8IAt8
	VZa4CHSR8mmQxsmCqYpj58x0VybRNuTkbwG012IM10WOGeAAsBOPTwtmo9rx/YNZMc8j
	IzRxUrnOKD56nspR3laBLFbGLR08y84X2X2FG3ykrI79y04bP4AlBMZobweZYmVE2IDX
	LHYTQ+8mzfiXNqobmTPOznatsOoyhKoMI0kwZps1U8TRQf5mRXbbawsePM2qJZZo6FZd
	fkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tpbjZ6oVZsDQYfvDXUEXoWStc4bRH2pUGfw3dG/y8ms=;
	b=kIlvH3f/K/eVe8Q5waAzAW3uwIqS5QDjjxL9PFfBWhwEYKg43lvWJxQKRP8EhtHV2w
	mydIxxNW4iQstDr11Dx+EHadbf2pXRVir2B0P9yV7Jewt8uk79/KT5NBDJj29tJ7x+7v
	Lzjaey5HD3KFRLS0Lp7+4bcqSMny1yHuL4tUVVjEGF4CSv8ku40ZomQf9Uk+kIDFHTEh
	MEKqRN7I4SxfWOFlXhyomamNZF59c+ZGGgOxiFAqLv/V6VGQ0siC9E6gdlUnOc6U9htJ
	tWcU3imsvyR2frAGTUXAT/NsZA1h4S8/kEyNUjNLwU/6MqIwG59tMS2PEjF1IJwtEasl
	Mfaw==
X-Gm-Message-State: APjAAAX0ZeLyVpGLHwtuz+VqfhCaUIPnOOu3QFimwNs4xv1vh5+iTF53
	5Pk/QDuODqwzPO0MunSzmDcB/2jvyc8WjLbZnfZRdmyJ
X-Google-Smtp-Source: APXvYqzu6Q3mzscNbX0OFsPPgKLEEYc2l33ADoICtizl5OQJEZkQPjBvX3OtpIEEVUMVgKR39e7Ka6k39XX8PalQTUo=
X-Received: by 2002:a0c:c988:: with SMTP id b8mr32614402qvk.33.1554865607725; 
	Tue, 09 Apr 2019 20:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <1554711980-84676-1-git-send-email-liwei.song@windriver.com>
In-Reply-To: <1554711980-84676-1-git-send-email-liwei.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 20:06:20 -0700
Message-ID: <CAMKF1soPqLNFBv_UxyMTVfZYjZwC_D5maGtO4u2NbKe0PijSSw@mail.gmail.com>
To: Liwei Song <liwei.song@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ledmon: control hard disk led for RAID arrays
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
X-List-Received-Date: Wed, 10 Apr 2019 03:06:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 8, 2019 at 1:29 AM Liwei Song <liwei.song@windriver.com> wrote:
>
> Enable LED support for Intel Virtual RAID On CPU.
>
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>  meta-oe/recipes-bsp/ledmon/ledmon_git.bb | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon_git.bb
>
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> new file mode 100644
> index 000000000000..14d70e51f5cc
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Intel(R) Enclosure LED Utilities"
> +
> +DESCRIPTION = "The utilities are designed primarily to be used on storage servers \
> + utilizing MD devices (aka Linux Software RAID) for RAID arrays.\
> +"
> +HOMEPAGE = "https://github.com/intel/ledmon"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +"
> +
> +DEPENDS = " systemd sg3-utils"

inheriting systemd below will add the dependency too so please remove
it from DEPENDS

secondly, it fails to build on musl



> +
> +inherit systemd
> +
> +SYSTEMD_SERVICE_${PN} = "ledmon.service"
> +
> +SRC_URI = "git://github.com/intel/ledmon;branch=master \
> +"
> +
> +SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
> +
> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
> +
> +S = "${WORKDIR}/git"
> +EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
> +
> +do_install_append() {
> +       install -d ${D}/${systemd_unitdir}/system
> +       oe_runmake  DESTDIR=${D}  install
> +       oe_runmake  DESTDIR=${D}${systemd_unitdir}/system  install-systemd
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

