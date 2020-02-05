Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id F368160AF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 16:39:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f129so3612379wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 08:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=juWRrltuWIpLYDH7AQk0dFhv2zU4HNgJtui8RrzwrSs=;
	b=neaJhnUdPetgfNM2D/aLSCXvxt2X7jbJch9l0voba6j9Gn4rUDr+nY80ij5DczBqaE
	++TOgWg1KmSFRSvB/vexe/ZIoiirRhNU/xDjph0D2+FEP1zJlZX1Wx7Ju0C76bv1PSrj
	vVvWMI0uSyzkC2zSJA8bjWm/OcBsoifwGn6ZAhHWet/92UVEMlD2oX66z87uh0dt2mOM
	KLVZCVNB/Y/mBM6My1p0+u3BqqXy/w+d+euApBHpU7B04YkCib0TNCdW1Nuq4S0vJx4m
	1MKmj942OEn3M9Yj5Xr6lnHieuOLWuYZ48hLyoHJdgk1IichdO6niMBfPze+ppcOcut8
	bZ0w==
X-Gm-Message-State: APjAAAUUPEBu+LiwO16sEYH+XYSj02MtI//uyiQ6ZK3n2MPDysY2XGvn
	i+BcCrUE0NuC/3hG9rMY1l/bSurc
X-Google-Smtp-Source: APXvYqwgx+CDH97QqyFq+0VV9bArDWPxU8ez8cNaVN40vQjGHlc6UT1ave5fj+Iy4AxoyAMUIU//2Q==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr6846526wmh.174.1580920761233; 
	Wed, 05 Feb 2020 08:39:21 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id p5sm434844wrt.79.2020.02.05.08.39.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 08:39:20 -0800 (PST)
Message-ID: <30481424b943c040c17548c73be768cc2d29f529.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 05 Feb 2020 16:39:19 +0000
In-Reply-To: <20200204234013.59800-1-max.krummenacher@toradex.com>
References: <20200204234013.59800-1-max.krummenacher@toradex.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 05 Feb 2020 16:39:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Interestingly I had been looking at this today as well...

On Wed, 2020-02-05 at 00:40 +0100, Max Krummenacher wrote:
> There seems to be no user of python-textutils python-shell python-codecs
> in the script, so these rdepends are dropped.
> 
> On a i.MX6 based machine smem runs with just python3-compression and
> its dependencies installed.

Upstream has released v1.5 with almost complete python3 support.
I'd say any patches should go on top of that.

Also, I don't think smem --source= will work with your version? Did you test that?

> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  .../smem/0001-smem-convert-to-python-3.patch  | 161 ++++++++++++++++++
>  meta-oe/recipes-support/smem/smem_1.4.bb      |   7 +-
>  2 files changed, 166 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
> 
> diff --git a/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch b/meta-oe/recipes-
> support/smem/smem/0001-smem-convert-to-python-3.patch
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

smem also imports numpy and matplotlib (for graphs etc.)

I've posted a different patch addressing all issues (I think).


Cheers,
Andre'

>  
>  PACKAGES =+ "smemcap"
>  
> -- 
> 2.20.1
> 


