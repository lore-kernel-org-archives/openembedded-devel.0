Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E81BE79B30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:20:37 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q18-v6so6979902iod.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LYdH3i65jFbegrmbSkpCdRgbMRNBDtZhnN7eiP7avlU=;
	b=0FMLWmAIHtgdlLJH9JSR6FsP+8rHm1pqNW0wQkxnvh9SalmHkzSkOFmCtXHaDQ+yfn
	vr8sROyc7Imhts2viNQi9EmuJClE03aRhuQhNZsnQmiUYjU9VbcrTcvyFeniyGgg12Kf
	SgWLewEmBEaM8NVcF//fH3DnEe0cvgHfgvux/K2nks0APkYtUo2+MY5KLEqWRKKDEq9b
	JTc8zpdz3h0+qhP42/oXtL6st97miZZ63YAWVOjoXtX5/LXjTi7PpnIaPCpcxwMiEaj7
	6/R3iroQLlNfk0PJFCO2cvuVsOE7QyHl34IyUPfCZt/gnioOa4ZYG0YyRpHfBxLBpnkY
	BmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LYdH3i65jFbegrmbSkpCdRgbMRNBDtZhnN7eiP7avlU=;
	b=G1fYTvcLqZ+V2zQeVIghwq0TxpQ1I9xzFhX9xdkaayBXOY8s+Ny96vqbwgvOwcsWi5
	BZi6vQHDQVZbtyC4B1TkXYM0id3ZJAXBskiSH2cVngCkiTmY9BGuPa5ZQkWUEu++Jix1
	ARKtwji4n8dROypQNU6ZiCRcXPBiNsq8KA/wj3uag8tjMZtiY4pRAx8hiGJ4W88yrrkF
	MHlaoe8Puj1Uu49l5effwjz0/dSwgQBFKrPOgciyYxPTVRIICYyZXlY514AREixUHVjx
	H/lj9+a5SAnH5gKzMRh3rHSdUa0n0oyn/lBMFkBFgbrGiaKeMMoWZoqdn4niEELDXQPr
	AQDA==
X-Gm-Message-State: AGRZ1gIBzrG35FDoPM/NGXmEsGFfKtf6go2kSUN4PG6fcKd+d2DSMoUw
	JsE1ksiJ0itBS99IfCskgE041tnsyu4xesODczK5cA==
X-Google-Smtp-Source: AJdET5cEej2bJuZ/b7Zg4vmqeUuuP6PkXvGOvi8Ia/cjoaEkh/fVJnOVqDBW0GVyYn8cXdFQHudRxck0ewRBHYz6jkU=
X-Received: by 2002:a6b:fb18:: with SMTP id
	h24-v6mr4124599iog.270.1540898439062; 
	Tue, 30 Oct 2018 04:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ef386b75ac95432d2fa8c4bcfcda95f16db6d555.1540830650.git.brendank310@gmail.com>
In-Reply-To: <ef386b75ac95432d2fa8c4bcfcda95f16db6d555.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:20:27 +0000
Message-ID: <CAJTo0LatXmzdtLzpHV40bA_vXORMHRM_EcVo9y0G6kePmc7sGA@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 13/16] gnome-shell: add recipe for gnome-shell.
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
X-List-Received-Date: Tue, 30 Oct 2018 11:20:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
> +SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-shell.git;protocol=http;branch=master;tag=3.30.1 \
> +           file://0001-dont-detect-python.patch \
> +           "

Tarball is preferred.

> +RDEPENDS_gnome-shell += " python3-core python3-pygobject gnome-settings-daemon gnome-bluetooth gdm "

Use ${PN} instead of gnome-shell so this works for multilib.

> +EXTRA_OEMESON += " -Dman=false -Dnetworkmanager=false "

Respecting the api-documentation DISTRO_FEATURE would be good here.
See manpages.bbclass.

> +FILES_${PN} += "${libdir}"

Almost definitely wrong.

> +FILES_${PN} += "${bindir}"

This is in FILES by default.

> +do_configure_prepend() {
> +       # Fixup the gsettings version
> +       sed -i 's^3.27.90^3.24.1^g' ${S}/meson.build

Do this as a patch so we can see *why*.

Ross

