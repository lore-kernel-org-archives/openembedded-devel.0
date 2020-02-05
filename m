Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id EA1FF60FB4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 03:00:09 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w25so458917qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 19:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FvwYMtIhGWt0aCX4/8z3EHqwuX9kLg2dspW4E7ozyEo=;
	b=IjjykHJ5RjJwsDE1WBf2N6gdMtUc64EPL8KQanRxiZtZ77U1tHZ8CPKs7XbyymnjmP
	j3jQicOOU6bn+3I+oBMvE706QTJM06QAH6DgmhU4BXD8dxWKDR238+mPGahGMtdmjKMh
	DvVx8P6mag72fJ2YrhN3HAvJx9Ht8CJocjhL5UwiTTYZr3ewpq6EzHGf488IFGAaBg8K
	PCwRTnrINfMOr0UPfWKwqp2i9Wn0gEjxusAHwXyrDUoZS568N1yyaFZCbIMvPhMXdoV6
	nihcKmNWFlJ6NngvqxHTosbMDFjLMO4B1cVTIK/gBC2CDkHz5UicYVnrDffzG1ULKSmd
	Gq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FvwYMtIhGWt0aCX4/8z3EHqwuX9kLg2dspW4E7ozyEo=;
	b=s42hzCrLHSYs07hOLIQYhe7UdbOU8gdFIVCHQfI7ZPXD6JpSBtGNHEAkNbntFUW8Wk
	ZmSPhnruTzrpcmUx7kH2K6mC8EYb8mtZ9aybJgpxr/yydL9hJN+RRtHSUzQ4G1BbYaTi
	OdSEdbYUa2Bu4VyEJ4a3Hu82BhsW++PuREFU7iXdfmwYrsxVyQ9jZd/ywquNtWfh0+fW
	5H4a9c86cQ/OXwrQF5Ps3z5Od1iWSaC0y2cp2YTb7RuG49GdA/outfGrDzZChQp4ZqV6
	yFfYYFv8kuT2u4MBJRlvqn5aL3BARQfmfAfs6W6RM1wn2XTOLpS1v9PJf0q1+jrhQthI
	zw2A==
X-Gm-Message-State: APjAAAXhfGx08cOFVc5Q4vFHfHhDcQlUBdE5Bd+5GjkgDIg7NT9iwUPr
	X80Ip+LVEpWoxgcjYBmA2a5DCiFw1GlOjq5Dp0o=
X-Google-Smtp-Source: APXvYqwym0a96wrb5w0liNNOEgAVanBYWVZ2bFm1vHr87F8EqPYahOgrjxWoeLfHT5NEYIp4I4k3rSKokwRdNIEd1zk=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr31955935qkf.337.1580871610484; 
	Tue, 04 Feb 2020 19:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20200204234013.59800-1-max.krummenacher@toradex.com>
In-Reply-To: <20200204234013.59800-1-max.krummenacher@toradex.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2020 18:59:43 -0800
Message-ID: <CAMKF1soPE2WrRVyQBCM2FBd-qcuAVBc6Z3ibKLsPoUt2X_42Mg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
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
X-List-Received-Date: Wed, 05 Feb 2020 03:00:10 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for doing this.

On Tue, Feb 4, 2020 at 3:42 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> There seems to be no user of python-textutils python-shell python-codecs
> in the script, so these rdepends are dropped.
>

OK

> On a i.MX6 based machine smem runs with just python3-compression and
> its dependencies installed.

ok. Perhaps, it pulls in right set of rdeps indirectly?

>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  .../smem/0001-smem-convert-to-python-3.patch  | 161 ++++++++++++++++++
>  meta-oe/recipes-support/smem/smem_1.4.bb      |   7 +-
>  2 files changed, 166 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch

Perhaps using 1.5 tag would be desired since that already has py3 fixes
https://selenic.com/repo/smem/archive/1.5.tar.bz2

Or maybe we can cherry pick the patches between 1.4 tag and 1.5 tag
there are 6 or 7 patches in total [1]

https://selenic.com/repo/smem

>
> diff --git a/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch b/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
> new file mode 100644
> index 000000000..85f35be44
> --- /dev/null
> +++ b/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
> @@ -0,0 +1,161 @@
> +From 5535a524f6db57c0b2e4a539db733fd9e840c97e Mon Sep 17 00:00:00 2001
> +From: Max Krummenacher <max.krummenacher@toradex.com>
> +Date: Mon, 3 Feb 2020 21:04:42 +0000
> +Subject: [PATCH] smem: convert to python 3
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> +---
> + smem | 41 ++++++++++++++++++++++-------------------
> + 1 file changed, 22 insertions(+), 19 deletions(-)
> +
> +diff --git a/smem b/smem
> +index 0cbd925..577d27b 100755
> +--- a/smem
> ++++ b/smem
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + #
> + # smem - a tool for meaningful memory reporting
> + #
> +@@ -21,7 +21,10 @@ class procdata(object):
> +     def _list(self):
> +         return os.listdir(self.source + "/proc")
> +     def _read(self, f):
> +-        return file(self.source + '/proc/' + f).read()
> ++        afile = open(self.source + '/proc/' + f)
> ++        ret = afile.read()
> ++        afile.close()
> ++        return ret
> +     def _readlines(self, f):
> +         return self._read(f).splitlines(True)
> +     def _stat(self, f):
> +@@ -209,7 +212,7 @@ def fromunits(x):
> +     s = dict(k=2**10, K=2**10, kB=2**10, KB=2**10,
> +              M=2**20, MB=2**20, G=2**30, GB=2**30,
> +              T=2**40, TB=2**40)
> +-    for k,v in s.items():
> ++    for k,v in list(s.items()):
> +         if x.endswith(k):
> +             return int(float(x[:-len(k)])*v)
> +     sys.stderr.write("Memory size should be written with units, for example 1024M\n")
> +@@ -240,7 +243,7 @@ def pidtotals(pid):
> +     maps = pidmaps(pid)
> +     t = dict(size=0, rss=0, pss=0, shared_clean=0, shared_dirty=0,
> +              private_clean=0, private_dirty=0, referenced=0, swap=0)
> +-    for m in maps.iterkeys():
> ++    for m in maps.keys():
> +         for k in t:
> +             t[k] += maps[m].get(k, 0)
> +
> +@@ -296,7 +299,7 @@ def showpids():
> +         )
> +     columns = options.columns or 'pid user command swap uss pss rss'
> +
> +-    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
> ++    showtable(list(pt.keys()), fields, columns.split(), options.sort or 'pss')
> +
> + def maptotals(pids):
> +     totals = {}
> +@@ -307,7 +310,7 @@ def maptotals(pids):
> +         try:
> +             maps = pidmaps(pid)
> +             seen = {}
> +-            for m in maps.iterkeys():
> ++            for m in maps.keys():
> +                 name = maps[m]['name']
> +                 if name not in totals:
> +                     t = dict(size=0, rss=0, pss=0, shared_clean=0,
> +@@ -361,7 +364,7 @@ def showmaps():
> +         )
> +     columns = options.columns or 'map pids avgpss pss'
> +
> +-    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
> ++    showtable(list(pt.keys()), fields, columns.split(), options.sort or 'pss')
> +
> + def usertotals(pids):
> +     totals = {}
> +@@ -383,7 +386,7 @@ def usertotals(pids):
> +         else:
> +             t = totals[user]
> +
> +-        for m in maps.iterkeys():
> ++        for m in maps.keys():
> +             for k in t:
> +                 t[k] += maps[m].get(k, 0)
> +
> +@@ -419,7 +422,7 @@ def showusers():
> +         )
> +     columns = options.columns or 'user count swap uss pss rss'
> +
> +-    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
> ++    showtable(list(pt.keys()), fields, columns.split(), options.sort or 'pss')
> +
> + def showsystem():
> +     t = totalmem()
> +@@ -460,14 +463,14 @@ def showsystem():
> +               'area not reclaimable'))
> +
> +     columns = options.columns or 'area used cache noncache'
> +-    showtable(range(len(l)), fields, columns.split(), options.sort or 'order')
> ++    showtable(list(range(len(l))), fields, columns.split(), options.sort or 'order')
> +
> + def showfields(fields, f):
> +     if f != list:
> +-        print "unknown field", f
> +-    print "known fields:"
> ++        print("unknown field", f)
> ++    print("known fields:")
> +     for l in sorted(fields.keys()):
> +-        print "%-8s %s" % (l, fields[l][-1])
> ++        print("%-8s %s" % (l, fields[l][-1]))
> +
> + def showtable(rows, fields, columns, sort):
> +     header = ""
> +@@ -518,10 +521,10 @@ def showtable(rows, fields, columns, sort):
> +         return
> +
> +     if not options.no_header:
> +-        print header
> ++        print(header)
> +
> +     for k,r in l:
> +-        print format % tuple([f(v) for f,v in zip(formatter, r)])
> ++        print(format % tuple([f(v) for f,v in zip(formatter, r)]))
> +
> +     if options.totals:
> +         # totals
> +@@ -533,8 +536,8 @@ def showtable(rows, fields, columns, sort):
> +             else:
> +                 t.append("")
> +
> +-        print "-" * len(header)
> +-        print format % tuple([f(v) for f,v in zip(formatter, t)])
> ++        print("-" * len(header))
> ++        print(format % tuple([f(v) for f,v in zip(formatter, t)]))
> +
> + def showpie(l, sort):
> +     try:
> +@@ -605,7 +608,7 @@ def showbar(l, columns, sort):
> +
> +     pl = []
> +     ind = numpy.arange(len(l))
> +-    for n in xrange(len(rc)):
> ++    for n in range(len(rc)):
> +         pl.append(pylab.bar(ind + offset + width * n,
> +                              [x[1][rc[n]] for x in l], width, color=gc(n)))
> +
> +@@ -682,7 +685,7 @@ try:
> +         showsystem()
> +     else:
> +         showpids()
> +-except IOError, e:
> ++except IOError as e:
> +     if e.errno == errno.EPIPE:
> +         pass
> + except KeyboardInterrupt:
> +--
> +2.20.1
> +
> diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
> index 947c47b0f..4728e6b79 100644
> --- a/meta-oe/recipes-support/smem/smem_1.4.bb
> +++ b/meta-oe/recipes-support/smem/smem_1.4.bb
> @@ -9,7 +9,10 @@ SECTION = "Applications/System"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -SRC_URI = "http://www.selenic.com/${BPN}/download/${BP}.tar.gz"
> +SRC_URI = " \
> +    http://www.selenic.com/${BPN}/download/${BP}.tar.gz \
> +    file://0001-smem-convert-to-python-3.patch \
> +"
>  SRC_URI[md5sum] = "fe79435c3930389bfdb560255c802162"
>  SRC_URI[sha256sum] = "2ea9f878f4cf3c276774c3f7e2a41977a1f2d64f98d2dcb6a15f1f3d84df61ec"
>
> @@ -24,7 +27,7 @@ do_install() {
>          install -m 0755 ${S}/smemcap ${D}${bindir}/
>          install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
>  }
> -RDEPENDS_${PN} += "python-textutils python-compression python-shell python-codecs"
> +RDEPENDS_${PN} += "python3-compression"
>
>  PACKAGES =+ "smemcap"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

