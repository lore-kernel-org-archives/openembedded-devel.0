Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id B252079C29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:33:53 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id e17so11642479itk.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o4gxZGcF5Z6hEVHc0R3uSKGeFMn7ybRXOlXhgY8QC0k=;
	b=KA5sUDSzNQuLQID5dqHMXeP6xT8Cc1xBbSGKDVqn+a5inMvX5mkyYX8UPs1tpY1rLV
	la0Jo5x1ha/BPXfvSJ1MMDZcCvDdf5WgBXzEZyDCaVIkQbNFJLUZ9q/3SPj53OHKhD2I
	ihyKeRNwvUBBT6Aeak1ENSUgLGaXnx/iSHhIgilJlcvDbKzQBrm4Gbq/JqlynfbAAkim
	VuWVWH6/ILg3GNdAECshPI8GKqqI/V64gOPJ7NpOYX2cd/PNom0LMJUktnYgnMgskipE
	kXeLb6FI5PJG0K/iNo2TWm3pYWKS1UwoLi01dpU8+tJTN2IBvOMCb9qSwCGB67l9TTOB
	Exug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o4gxZGcF5Z6hEVHc0R3uSKGeFMn7ybRXOlXhgY8QC0k=;
	b=dy9poQ5LOyzX66b8YsPPbAoOnQBgOwSqss3uECN1RaWzbip6El+8wi/g/fAbQU1212
	uyBiIcLMFUpOJa2Lrv9dOETGrGoX0ca4SfxKjb5kmMLl8fKfBXDvjtbueQ1Lu6etItT4
	R4WzF4jrVHEvlmsbOB+E+ZDSyBt3FvyA4i+AGWMMSEBPLcs8yyXtpkMB04pDcReEBGMt
	UDXEJIxxkabWExTcrbQZBd4uecRK+oWI+kqbR8WjzkN8+eL1HTPac66sm5wrajR8SGf4
	d1roR69FEIOdEX18gA/z0qougL8p21y8mATqPmaairPikxiq5004t4yKR+W1AdYT79hM
	Yjwg==
X-Gm-Message-State: AGRZ1gITCaW5fX0AynjOE9Xppy9lWBLegYWFn2+BJi1BoUImQqmHdnqN
	y4LgtpXGVREqYtpboX1wEfz1RUMgrw+ef01arBrA60qN
X-Google-Smtp-Source: AJdET5dys7lTVsAcLiOJc/wMS6m9lY6oDTvZMy/lxT0uJCsbl+BBOVhEW21+1UBUSfYwn23BGr+MkJWa9jsbIlFbz6I=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr954397itd.26.1540899234802; 
	Tue, 30 Oct 2018 04:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<245bf6e59b04956ad91357d74a93c4ecd5326faf.1540830650.git.brendank310@gmail.com>
In-Reply-To: <245bf6e59b04956ad91357d74a93c4ecd5326faf.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:33:43 +0000
Message-ID: <CAJTo0LYZEgt3NtQHxh8GzFr6vueFFCpm7H06tH=ExGgDg6p3ag@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 09/16] gdm: add recipe for gdm (Gnome Desktop Manager)
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
X-List-Received-Date: Tue, 30 Oct 2018 11:33:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> +SRC_URI = "git://gitlab.gnome.org/GNOME/gdm.git;protocol=http;branch=master;tag=3.30.1 \

Tarball.

> +FILES_${PN} += "${systemd_system_unitdir}"

Use systemd class.

> +FILES_${PN} += "${libdir}"

Breaks library packaging.

> +do_configure_prepend() {
> +       install -d ${S}/build-aux
> +       sed -i '/AC_CHECK_FILE/d' ${S}/configure.ac

Why?  If this is needed then do it as a patch.

Ross

