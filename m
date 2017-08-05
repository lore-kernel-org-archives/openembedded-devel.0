Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 78F9F71A32
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Aug 2017 00:04:08 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id x10so11260378vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 17:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mwZEN28bhIo+7qyVNMhbSYrGZxBQP22AdKEozR+G5+s=;
	b=CrK88M1pfUwS0Oju0mcVyQPxUBKqCUCogMhtrY84B2YJxvN1F/8pCo0XN3XNQNQtmQ
	qyu8hx09JVaLAJp6YczTZqH1NmyVKNsqMCIqCHlzyNwFDzf6hW7maGrbv+dTsxnoj/VR
	WxNw8eFeoGHqlaWNIa3V3H51FtkKIMoG3WHpKiFxp5/oFp+0vf9zwVXXkl90XeQON+IP
	PgSr28PtndqmPKIExyr0x8haN7OOusKcHpJBskLx8spXR0uC1sic3ip/tTYZr/XqgFRR
	sNFuecu9zauRXthcdFsAKVSi33OalndE/SlBq8GPXV+86btgel/7MCF1tbnITNR6cE/0
	5Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mwZEN28bhIo+7qyVNMhbSYrGZxBQP22AdKEozR+G5+s=;
	b=VZpMCoupMdc2WRnogeKyBRfCgk4RRCNGd7USmEFMZIYwkys3CM4XNs0lly3nAtIb3B
	h/AEeZRT33Y1g+qTD+TmULW9iRnmjGVX+prg7Q/aYrXc9g05yoeYsrNJK/7YhvrqSVQB
	omENrT+EwOtZDsqclHjn5GejOUpJPQ0pfBjmjW3wG/ymiMktDyKQ5OsPE/aUMfJKdr2r
	g+6wLG+bKyXhBWYgHwVySnNd6D32clzka+rvXufa+bbcZSF9t8sThE+zmp3HZrLIOKKx
	z704XtCBEf5rsXNT1iTtRKzClXUQcc9pjkqAAqnVa671r9nuXnR5qLgjz2GjCfseAEc9
	3BSw==
X-Gm-Message-State: AHYfb5jSy9pV/cMOxVVo9s+Duz7CgKwOiAc0Ew3sxmDu8aF2Gi56jrJG
	HPpo25pTlWcfEvjzQ88s6kkN+TSmQw==
X-Received: by 10.31.92.2 with SMTP id q2mr2504820vkb.170.1501891449275; Fri,
	04 Aug 2017 17:04:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Fri, 4 Aug 2017 17:04:08 -0700 (PDT)
In-Reply-To: <CA++8a_DgbopF2ssWZpNN9kgRiJyYS1gEtf4FuggBevsp=rL1tQ@mail.gmail.com>
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
	<CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
	<CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
	<CAMKF1soVgTtENN2DG_ESg02coXAtjzuWn=jMt3ydhz_HdLfXbA@mail.gmail.com>
	<CA++8a_DgbopF2ssWZpNN9kgRiJyYS1gEtf4FuggBevsp=rL1tQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 5 Aug 2017 02:04:08 +0200
Message-ID: <CALbNGRT1bnpRLb0L4hok3UV8Qci9MxVTByWL5T-WGiP8D1gFow@mail.gmail.com>
To: Diana Thayer <garbados@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Sat, 05 Aug 2017 00:04:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 5, 2017 at 1:12 AM, Diana Thayer <garbados@gmail.com> wrote:
> Great! Here's the PR <https://github.com/kraj/meta-openwrt/pull/22>.
>
> Attempting to run `TCLIBC=musl MACHINE=qemux86 bitbake core-image-sato`
> still fails with this error:
>
> ```
> ERROR: iptables-1.6.1-r0 do_patch: Command Error: 'quilt --quiltrc
> /home/garbados/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/iptables/1.6.1-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch 600-shared-libext.patch
> patching file extensions/GNUmakefile.in
> Hunk #1 succeeded at 50 (offset 1 line).
> Hunk #2 succeeded at 87 (offset 1 line).
> Hunk #3 succeeded at 114 (offset 1 line).
> Hunk #4 succeeded at 123 (offset 1 line).
> Hunk #5 succeeded at 146 (offset 1 line).
> patching file iptables/Makefile.am
> Hunk #1 succeeded at 8 (offset 2 lines).
> Hunk #2 FAILED at 15.
> Hunk #3 FAILED at 42.
> 2 out of 3 hunks FAILED -- rejects in file iptables/Makefile.am
> Patch 600-shared-libext.patch does not apply (enforce with -f)
600-shared-libext.patch does not apply any more. It is part of
meta-openwrt [1]. Have no idea what this patch is trying to
fix/enhance - Khem?

[1] https://github.com/kraj/meta-openwrt/blob/master/recipes-tweaks/iptables/iptables/600-shared-libext.patch

Andreas

