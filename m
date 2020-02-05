Return-Path: <max.oss.09@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE1FF60C8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 16:57:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x7so3057960ljc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9m2ZqJOvnnwN/FNTWghIbFJZYA2NfXOM68BWYaCO+8c=;
	b=V7tvMKcbH5QQ3wJkD9dBdfaXFfkCPM4ECd6PH6/3GW2PdTxte4q6Nn/zZBPVcZ3oPi
	tViWW6/4fI9ouS1ev7MCcDaqWwgLnmTuCqfWVOSaXHYmZOSsXohTRJurc+1HlcLHjUb1
	DyNtmuktyzAfw/utdv3fq9YsLJJew7l/YX77ysD+s7HqOYu4ydQmUcHuqN5Et3zAh3ya
	QsZVHBty8PaG7+2NwBKJkBdvOCX5Gvw8AUK3joGANk4dcZw7PFfS773SnjoT9Swp4ctd
	k4xojqlhaFb8KYf1ygr43W9evtdM95R7T9BPVYom7KeWOYlUnvVvaVnDuH7Us/ll3Re9
	QnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9m2ZqJOvnnwN/FNTWghIbFJZYA2NfXOM68BWYaCO+8c=;
	b=nbx67Pwxvshyxqa3rTiR397XTBf+Wn7BX4eXI/t+rda4sfVtZTIiM2yvStkveKu+Hi
	pkOt2uAnKjumSX/rmhpQpKklcwRJ6yeM2pdYFNNDXsZKA9lq+WlfpniMboQknsix/CCO
	LjyBJHcP+j3cyOtwaS+00yJlBnh1c5il7Dcpe2hjHJq+EMGNk4msJwycGMj87i+IC2CN
	L0iWdHmYO29Euhj1IZBGzBKhMrhXt5IoZxOzIq6mMMqHH2ElHquWKXhW3PJfUeIaP9Ht
	RVEWJimo6keHZYOBiSAQvVPLGJJ39vWxfQyqR/l/oE7V3FRMmzd/3TkiLxfTfJCwkRPg
	vG/g==
X-Gm-Message-State: APjAAAVpRrNU/KvsMskR7PRSFXNPZq9f+ZMg+2awVrU5BrqxtMYtfVg4
	rXT2Qg9Wx9DJCHp8mFsRsZFgMTe4UBTH6CEKb9bw3Q==
X-Google-Smtp-Source: APXvYqy1X4W2HzOttq55PlcbUhsGsBIAhJMXsZPYbhYm6F2sYt9id2yignJLyFqrbHtCu+0ipIRBP6mId1Sk+naGZxE=
X-Received: by 2002:a05:651c:239:: with SMTP id
	z25mr20134865ljn.48.1580921872331; 
	Wed, 05 Feb 2020 08:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20200204234013.59800-1-max.krummenacher@toradex.com>
	<30481424b943c040c17548c73be768cc2d29f529.camel@andred.net>
In-Reply-To: <30481424b943c040c17548c73be768cc2d29f529.camel@andred.net>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 5 Feb 2020 17:57:41 +0100
Message-ID: <CAEHkU3V3HYA=um=9GGueyjGtTeizV-Sq=CKA0wEu0U0FceAmRQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] smem: use python 3
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
X-List-Received-Date: Wed, 05 Feb 2020 16:57:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

Thanks for your patch. This seems more complete and should go in in favour
of this one.

No I didn't test with --source, I only tested using smem directly on the
embedded target
which worked well for all but the charting options.
I'm aware that the charting option gracefully declines to work when the
plugins you now
added with RRECOMMEND are missing.

Max

Am Mi., 5. Feb. 2020 um 17:39 Uhr schrieb Andr=C3=A9 Draszik <git@andred.ne=
t>:

> Hi,
>
> Interestingly I had been looking at this today as well...
>
> On Wed, 2020-02-05 at 00:40 +0100, Max Krummenacher wrote:
> > There seems to be no user of python-textutils python-shell python-codec=
s
> > in the script, so these rdepends are dropped.
> >
> > On a i.MX6 based machine smem runs with just python3-compression and
> > its dependencies installed.
>
> Upstream has released v1.5 with almost complete python3 support.
> I'd say any patches should go on top of that.
>
> Also, I don't think smem --source=3D will work with your version? Did you
> test that?
>
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  .../smem/0001-smem-convert-to-python-3.patch  | 161 ++++++++++++++++++
> >  meta-oe/recipes-support/smem/smem_1.4.bb      |   7 +-
> >  2 files changed, 166 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
> >
> > diff --git
> a/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
> b/meta-oe/recipes-
> > support/smem/smem/0001-smem-convert-to-python-3.patch
> > new file mode 100644
> > index 000000000..85f35be44
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
> > @@ -0,0 +1,161 @@
> > +From 5535a524f6db57c0b2e4a539db733fd9e840c97e Mon Sep 17 00:00:00 2001
> > +From: Max Krummenacher <max.krummenacher@toradex.com>
> > +Date: Mon, 3 Feb 2020 21:04:42 +0000
> > +Subject: [PATCH] smem: convert to python 3
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > +---
> > + smem | 41 ++++++++++++++++++++++-------------------
> > + 1 file changed, 22 insertions(+), 19 deletions(-)
> > +
> > +diff --git a/smem b/smem
> > +index 0cbd925..577d27b 100755
> > +--- a/smem
> > ++++ b/smem
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + #
> > + # smem - a tool for meaningful memory reporting
> > + #
> > +@@ -21,7 +21,10 @@ class procdata(object):
> > +     def _list(self):
> > +         return os.listdir(self.source + "/proc")
> > +     def _read(self, f):
> > +-        return file(self.source + '/proc/' + f).read()
> > ++        afile =3D open(self.source + '/proc/' + f)
> > ++        ret =3D afile.read()
> > ++        afile.close()
> > ++        return ret
> > +     def _readlines(self, f):
> > +         return self._read(f).splitlines(True)
> > +     def _stat(self, f):
> > +@@ -209,7 +212,7 @@ def fromunits(x):
> > +     s =3D dict(k=3D2**10, K=3D2**10, kB=3D2**10, KB=3D2**10,
> > +              M=3D2**20, MB=3D2**20, G=3D2**30, GB=3D2**30,
> > +              T=3D2**40, TB=3D2**40)
> > +-    for k,v in s.items():
> > ++    for k,v in list(s.items()):
> > +         if x.endswith(k):
> > +             return int(float(x[:-len(k)])*v)
> > +     sys.stderr.write("Memory size should be written with units, for
> example 1024M\n")
> > +@@ -240,7 +243,7 @@ def pidtotals(pid):
> > +     maps =3D pidmaps(pid)
> > +     t =3D dict(size=3D0, rss=3D0, pss=3D0, shared_clean=3D0, shared_d=
irty=3D0,
> > +              private_clean=3D0, private_dirty=3D0, referenced=3D0, sw=
ap=3D0)
> > +-    for m in maps.iterkeys():
> > ++    for m in maps.keys():
> > +         for k in t:
> > +             t[k] +=3D maps[m].get(k, 0)
> > +
> > +@@ -296,7 +299,7 @@ def showpids():
> > +         )
> > +     columns =3D options.columns or 'pid user command swap uss pss rss=
'
> > +
> > +-    showtable(pt.keys(), fields, columns.split(), options.sort or
> 'pss')
> > ++    showtable(list(pt.keys()), fields, columns.split(), options.sort
> or 'pss')
> > +
> > + def maptotals(pids):
> > +     totals =3D {}
> > +@@ -307,7 +310,7 @@ def maptotals(pids):
> > +         try:
> > +             maps =3D pidmaps(pid)
> > +             seen =3D {}
> > +-            for m in maps.iterkeys():
> > ++            for m in maps.keys():
> > +                 name =3D maps[m]['name']
> > +                 if name not in totals:
> > +                     t =3D dict(size=3D0, rss=3D0, pss=3D0, shared_cle=
an=3D0,
> > +@@ -361,7 +364,7 @@ def showmaps():
> > +         )
> > +     columns =3D options.columns or 'map pids avgpss pss'
> > +
> > +-    showtable(pt.keys(), fields, columns.split(), options.sort or
> 'pss')
> > ++    showtable(list(pt.keys()), fields, columns.split(), options.sort
> or 'pss')
> > +
> > + def usertotals(pids):
> > +     totals =3D {}
> > +@@ -383,7 +386,7 @@ def usertotals(pids):
> > +         else:
> > +             t =3D totals[user]
> > +
> > +-        for m in maps.iterkeys():
> > ++        for m in maps.keys():
> > +             for k in t:
> > +                 t[k] +=3D maps[m].get(k, 0)
> > +
> > +@@ -419,7 +422,7 @@ def showusers():
> > +         )
> > +     columns =3D options.columns or 'user count swap uss pss rss'
> > +
> > +-    showtable(pt.keys(), fields, columns.split(), options.sort or
> 'pss')
> > ++    showtable(list(pt.keys()), fields, columns.split(), options.sort
> or 'pss')
> > +
> > + def showsystem():
> > +     t =3D totalmem()
> > +@@ -460,14 +463,14 @@ def showsystem():
> > +               'area not reclaimable'))
> > +
> > +     columns =3D options.columns or 'area used cache noncache'
> > +-    showtable(range(len(l)), fields, columns.split(), options.sort or
> 'order')
> > ++    showtable(list(range(len(l))), fields, columns.split(),
> options.sort or 'order')
> > +
> > + def showfields(fields, f):
> > +     if f !=3D list:
> > +-        print "unknown field", f
> > +-    print "known fields:"
> > ++        print("unknown field", f)
> > ++    print("known fields:")
> > +     for l in sorted(fields.keys()):
> > +-        print "%-8s %s" % (l, fields[l][-1])
> > ++        print("%-8s %s" % (l, fields[l][-1]))
> > +
> > + def showtable(rows, fields, columns, sort):
> > +     header =3D ""
> > +@@ -518,10 +521,10 @@ def showtable(rows, fields, columns, sort):
> > +         return
> > +
> > +     if not options.no_header:
> > +-        print header
> > ++        print(header)
> > +
> > +     for k,r in l:
> > +-        print format % tuple([f(v) for f,v in zip(formatter, r)])
> > ++        print(format % tuple([f(v) for f,v in zip(formatter, r)]))
> > +
> > +     if options.totals:
> > +         # totals
> > +@@ -533,8 +536,8 @@ def showtable(rows, fields, columns, sort):
> > +             else:
> > +                 t.append("")
> > +
> > +-        print "-" * len(header)
> > +-        print format % tuple([f(v) for f,v in zip(formatter, t)])
> > ++        print("-" * len(header))
> > ++        print(format % tuple([f(v) for f,v in zip(formatter, t)]))
> > +
> > + def showpie(l, sort):
> > +     try:
> > +@@ -605,7 +608,7 @@ def showbar(l, columns, sort):
> > +
> > +     pl =3D []
> > +     ind =3D numpy.arange(len(l))
> > +-    for n in xrange(len(rc)):
> > ++    for n in range(len(rc)):
> > +         pl.append(pylab.bar(ind + offset + width * n,
> > +                              [x[1][rc[n]] for x in l], width,
> color=3Dgc(n)))
> > +
> > +@@ -682,7 +685,7 @@ try:
> > +         showsystem()
> > +     else:
> > +         showpids()
> > +-except IOError, e:
> > ++except IOError as e:
> > +     if e.errno =3D=3D errno.EPIPE:
> > +         pass
> > + except KeyboardInterrupt:
> > +--
> > +2.20.1
> > +
> > diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb
> b/meta-oe/recipes-support/smem/smem_1.4.bb
> > index 947c47b0f..4728e6b79 100644
> > --- a/meta-oe/recipes-support/smem/smem_1.4.bb
> > +++ b/meta-oe/recipes-support/smem/smem_1.4.bb
> > @@ -9,7 +9,10 @@ SECTION =3D "Applications/System"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> >
> > -SRC_URI =3D "http://www.selenic.com/${BPN}/download/${BP}.tar.gz"
> > +SRC_URI =3D " \
> > +    http://www.selenic.com/${BPN}/download/${BP}.tar.gz \
> > +    file://0001-smem-convert-to-python-3.patch \
> > +"
> >  SRC_URI[md5sum] =3D "fe79435c3930389bfdb560255c802162"
> >  SRC_URI[sha256sum] =3D
> "2ea9f878f4cf3c276774c3f7e2a41977a1f2d64f98d2dcb6a15f1f3d84df61ec"
> >
> > @@ -24,7 +27,7 @@ do_install() {
> >          install -m 0755 ${S}/smemcap ${D}${bindir}/
> >          install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
> >  }
> > -RDEPENDS_${PN} +=3D "python-textutils python-compression python-shell
> python-codecs"
> > +RDEPENDS_${PN} +=3D "python3-compression"
>
> smem also imports numpy and matplotlib (for graphs etc.)
>
> I've posted a different patch addressing all issues (I think).
>
>
> Cheers,
> Andre'
>
> >
> >  PACKAGES =3D+ "smemcap"
> >
> > --
> > 2.20.1
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

