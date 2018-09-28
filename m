Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id E8B5D799C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 15:26:21 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id e17-v6so4863236oib.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9fMhCyWuwaA2PxRJ5mHuNmkjIxF/syuLe5lA0eeB/ik=;
	b=lsWr1fSKD72Drs8E5YVed/6nra9jOIw3ww3/zJo17ej73t/hE1cikpMSfChAc/g7eQ
	WpF+70dOI2zyvkNw/0hUX9f/7Qkt+DLaaQSjignygeSlTWio3VonDxfmUbxjIYdLeYT4
	biVbAhE42syqvAr7SKrQkgxpxFvwqMV14C2q05eaPFEBqRWNT2O24YdGCC77rw8m2LGK
	1xKEO4H4gSpmyLGvA2PxvfHRuKZzzQd0se2RP+rf8rTPUNloMm6ixZ1ZZZPbOjpHXl0t
	Xchqc/C3D7XdnCLbIle6JxcMhxLpCdjX6+YvlYsrvpeFWtCbhPogOfGljaATg1I9+YO8
	fipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9fMhCyWuwaA2PxRJ5mHuNmkjIxF/syuLe5lA0eeB/ik=;
	b=AElAMzatbrAGmOzhGHU2dQUNDytpYmMM4toQlzSeOScohdumFFVHYk0OfwJ8eLx7pp
	0Wo5wlFkTHApH5/kW65XfS7E+4fSQwqL1FurCgSQiu2xvWnbZ9yks/zZuTg2U4nmWMG6
	wGDcXIcazAGsI7NPyxnxt4dpexyjQGduFr1N6Dg4bLR/1Nr2Cxnq+HvTgVNarre1ahZc
	u9JrNa6q/tuRHplmA4ETJusLcR7vWuQZxVRcP39TIUiGhYRUkQPpCL5CP7Okod8b6BBg
	V2M3hMuWdQ7kjjYJwa169tT6qNl+7IW1pbEtkHvzziUO/uWZeWoGysJROcTdvL0gimtw
	k6vg==
X-Gm-Message-State: ABuFfoh94gisDn2MHqezdpaMiU2ylvFt4J/uaWjBgN/7ogFS8iY5+BRf
	yi/DwKZLb440d7frasyKNutjuLDe57uCsagggaM=
X-Google-Smtp-Source: ACcGV603gCShiBtDs80cRcfTdpfAUj5m10bUb5bkG+GpG7Ktm3xN4A4xIopmpuEeaGpX1xIvsw69YiMHvYdU/DA0R8A=
X-Received: by 2002:aca:c00a:: with SMTP id q10-v6mr5509876oif.4.1538148382853;
	Fri, 28 Sep 2018 08:26:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:684a:0:0:0:0:0 with HTTP; Fri, 28 Sep 2018 08:26:22
	-0700 (PDT)
In-Reply-To: <5bae4634.1c69fb81.9e934.4f05@mx.google.com>
References: <5bae4634.1c69fb81.9e934.4f05@mx.google.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 28 Sep 2018 17:26:22 +0200
Message-ID: <CALbNGRRzTMgObShEYvhePn2gCSA7CmgiZ3wCEpcov6ssnJLJgw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe sumo-next pull reatest
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
X-List-Received-Date: Fri, 28 Sep 2018 15:26:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 28, 2018 at 5:18 PM, Armin Kuster <akuster808@gmail.com> wrote:
> The following changes since commit be79b8b111a968efdbe5e1482d0c246d0b24763e:
>
>   fuse: CVE-2018-10906 (2018-08-26 11:03:11 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded sumo-next
>
> for you to fetch changes up to 2bb21ef27c4b0c9d52d30b3b2c5a0160fd02b966:
>
>   poppler: Update to 0.64 (2018-09-27 08:49:10 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>       grpc: move it from oe to networking layer
>
> Khem Raj (2):
>       gedit: Add dep on python-six-native
>       poppler: Update to 0.64
^ Why this update in stable release?
>
> Martin Jansa (2):
>       libqb: Fix build with gold
>       openocd: prevent fetching git submodules during do_configure
>
> Nicolas Dechesne (1):
>       meta-multimedia: fixup LAYERDEPENDS
>
> Paul Eggleton (1):
>       protobuf: make python-protobuf dependency optional and default to off
>
> Sinan Kaya (1):
>       dnsmasq: CVE-2017-15107
>
> Takuro Ashie (1):
>       uim: Fix SRC_URI
>
>  meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |   6 +-
>  meta-multimedia/conf/layer.conf                    |   2 +-
>  ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch |   0
>  ....txt-Fix-libraries-installation-for-Linux.patch |   0
>  ...s.txt-Find-c-ares-in-target-sysroot-alone.patch |   0
>  .../recipes-devtools/grpc/grpc_1.8.5.bb            |   0
>  .../recipes-support/dnsmasq/dnsmasq_2.78.bb        |   1 +
>  .../dnsmasq/files/CVE-2017-15107.patch             | 263 +++++++++++++++++++++
>  meta-oe/recipes-devtools/openocd/openocd_git.bb    |  26 +-
>  .../recipes-devtools/protobuf/protobuf_3.5.1.bb    |   7 +-
>  meta-oe/recipes-extended/libqb/libqb_1.0.3.bb      |   8 +
>  ...ists.txt-Add-libpoppler-to-link-along-wit.patch |  29 +++
>  .../{poppler_0.63.0.bb => poppler_0.64.0.bb}       |  18 +-
>  meta-oe/recipes-support/uim/uim_1.8.6.bb           |   2 +-
>  14 files changed, 339 insertions(+), 23 deletions(-)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb (100%)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
>  rename meta-oe/recipes-support/poppler/{poppler_0.63.0.bb => poppler_0.64.0.bb} (76%)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

