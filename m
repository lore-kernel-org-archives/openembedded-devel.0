Return-Path: <maxi.jourdan@wanadoo.fr>
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
	[80.12.242.128])
	by mail.openembedded.org (Postfix) with ESMTP id BCFD978560
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 23:16:53 +0000 (UTC)
Received: from mail-qk0-f170.google.com ([209.85.220.170]) by mwinf5d63 with ME
	id TbGt1x0023hB8W903bGtAG; Thu, 29 Mar 2018 01:16:54 +0200
X-ME-Helo: mail-qk0-f170.google.com
X-ME-Auth: bWF4aS5qb3VyZGFuQHdhbmFkb28uZnI=
X-ME-Date: Thu, 29 Mar 2018 01:16:54 +0200
X-ME-IP: 209.85.220.170
Received: by mail-qk0-f170.google.com with SMTP id o5so4222474qki.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 16:16:53 -0700 (PDT)
X-Gm-Message-State: ALQs6tCLT5enT2JPW0knAfvoz9Hc5G47nLhrAkGk76fasNMgI3MQYi3e
	tFTcU9EG2yxjg92Xr30P/ZjocKGWHbcHTPgYdVs=
X-Google-Smtp-Source: AIpwx48i0kEdxiSskMfiGpEMNCQNvz054wM8B9eZsF7Y7UrcsC+0m6a1T5zIss3woEM849a/xAOscE2kgnzqH0mqtm4=
X-Received: by 10.55.162.66 with SMTP id l63mr8146106qke.124.1522279012719;
	Wed, 28 Mar 2018 16:16:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.39.14 with HTTP; Wed, 28 Mar 2018 16:16:52 -0700 (PDT)
In-Reply-To: <CAMKF1srJz631-vQDLwdfv+FpQbp2iqzZuCEw9DuA0od2dcQBEw@mail.gmail.com>
References: <CAHStOZ6KXHrZMVa_iydoDd-N7p_098YqJYo5hBv7Jyxx9NMOYA@mail.gmail.com>
	<CAMKF1srJz631-vQDLwdfv+FpQbp2iqzZuCEw9DuA0od2dcQBEw@mail.gmail.com>
From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Date: Thu, 29 Mar 2018 01:16:52 +0200
X-Gmail-Original-Message-ID: <CAHStOZ5fStbZNEC572HUfv7PsJaDy_KD8M6gh5WQDxojMFpTqQ@mail.gmail.com>
Message-ID: <CAHStOZ5fStbZNEC572HUfv7PsJaDy_KD8M6gh5WQDxojMFpTqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang] [PATCH] nonclangable: Add python3
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
X-List-Received-Date: Wed, 28 Mar 2018 23:16:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Sure I'll take a look. In the meantime this documents the issue.

Maxime

2018-03-29 0:56 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> Hi Maxime
>
> On Wed, Mar 28, 2018 at 3:38 PM, Maxime Jourdan <maxi.jourdan@wanadoo.fr>
> wrote:
> > While python3 will build "successfully" with clang,
> > it will silently discard a few modules in the process:
> >
> > Python build finished successfully!
> > The necessary bits to build these optional modules were not found:
> > _bz2                  _curses_panel         _dbm
> > _gdbm                 _lzma                 _sqlite3
> > _ssl                  nis                   readline
> > zlib
> >
> > The lack of these modules will generate empty packages
> > which can later break do_rootfs.
> >
>
> while this is fine, I would appreciate if you can delve a bit and see
> why these tests
> would fail with Clang and pass with gcc. It could be simple bugs in
> python itself where
> it assumes compiler == gcc
>
> > Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
> > ---
> >  conf/nonclangable.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
> > index 720b653..7d30bc1 100644
> > --- a/conf/nonclangable.conf
> > +++ b/conf/nonclangable.conf
> > @@ -58,6 +58,7 @@ TOOLCHAIN_pn-openjre-8 = "gcc"
> >  TOOLCHAIN_pn-perf = "gcc"
> >  TOOLCHAIN_pn-piglit = "gcc"
> >  TOOLCHAIN_pn-prelink = "gcc"
> > +TOOLCHAIN_pn-python3 = "gcc"
> >  # has dpkg source which does not compile
> >  TOOLCHAIN_pn-start-stop-daemon = "gcc"
> >  TOOLCHAIN_pn-syslinux = "gcc"
> > --
> > 2.16.2
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

