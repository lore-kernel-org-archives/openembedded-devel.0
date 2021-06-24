Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.116.1624567782479264058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 13:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FgBmbaFY;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id r7so5872068qta.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 13:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkPEgOzR8dHbIpuoFkJNDERXM0yXkfPO9Foygi0rcbU=;
        b=FgBmbaFYm4yUXkpXy3TwR+CdWEQ97rzJKzeH+smaNexBez9z7FdTNE4YmCdK4kzyh0
         ESV68Vt47tOzETVGXDJgO7/swXgBNqvNYZWHOOpeZHLNcsWG3cylJhH/3uOzTcYOksU0
         iMu4MSrN3ovPl/0MXibdftrU4h221MlCZqI/JcHyL/dyy97ZYhUeGUHqfQQu8j1HVOI3
         CCteKHwUFJuU7YsVSM3s+kwoorCmWx6DmM2P2NwNftAoVk6oEynUJjJDO7dEZgmT1mBO
         iJ86H56lEGELlHWHWmExdFAplczNMVVhmMkqmotfTuiF3oaKFdE5DOVlxSTSfnY6XjfN
         wS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkPEgOzR8dHbIpuoFkJNDERXM0yXkfPO9Foygi0rcbU=;
        b=BX1/9hba4HiEzvGWwXLzy68HhUuhZtbqF8YIxoIG61sRqppGksCRFF/jCrgSUMx9rW
         o5E8/EWyMvM8L40CUQkLYBYulTxOBOwwE4qz0yhXZsZJ7AzXsbll6K8583JB5MP6IGFn
         ZZQkhVmJBalP+V9vBmAPW4/p6MvebdS8D/+Gx3E7s8+i7fx7wwvFymjjTcEkK3HCJNwj
         ghWNymFES5DlBGNHF7ur/uSA/tckUQGMoplh+McS1n8Y85G1zWJ7/o8lC+j+mPEzCcbN
         OXiPPEjw3Y7ufqPxQj789XHvmd+OktmbnBOfMTEcKIif1ch4IjKrQrLojafiHN8P0jZq
         WLlA==
X-Gm-Message-State: AOAM533vmlgpavpD3IuXNNnLOpZynb8oRpe98+2Qvxu4hptERmfW6xa3
	Ctyf29oJ8GLC/XHDK8cEd6qs3nQhslihX3pPUUuZjjn80Zo=
X-Google-Smtp-Source: ABdhPJyj6CcdDmP5YP+nZwpx4VdEeDPXGMiaVk5UV+7qAkzAPD+swdEsJJ9BPW4R67f7HI6katcvMjCICe8AZwIzEsY=
X-Received: by 2002:a05:622a:549:: with SMTP id m9mr6522341qtx.369.1624567781310;
 Thu, 24 Jun 2021 13:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210616182123.45393-1-sakib.sajal@windriver.com>
 <f815a254-ce73-8d36-33a1-69da5b4047c4@gmail.com> <ac751c4e-62bb-f9fb-8b01-9dc959f24fa9@windriver.com>
In-Reply-To: <ac751c4e-62bb-f9fb-8b01-9dc959f24fa9@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 24 Jun 2021 13:49:15 -0700
Message-ID: <CAMKF1so7NXVNJL3TBzAedJZinNspE3dFiCyJe-1UmUO5-PG1eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lmdb: add recipe
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 1:39 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>
> On 2021-06-16 3:47 p.m., Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On 6/16/21 11:21 AM, Sakib Sajal wrote:
> >> lmdb provides a high-performance embedded transactional
> >> database in the form of a key-value store.
> >>
> >> Recipe is ported from meta-qt5-extra layer.
> >>
> >> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >> ---
> >>   .../files/0001-Patch-the-main-Makefile.patch  | 90 +++++++++++++++++++
> >>   meta-oe/recipes-dbs/lmdb/lmdb_git.bb          | 22 +++++
> >>   2 files changed, 112 insertions(+)
> >>   create mode 100644
> >> meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
> >>   create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> >>
> >> diff --git
> >> a/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
> >> b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
> >> new file mode 100644
> >> index 000000000..9ba626101
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
> >> @@ -0,0 +1,90 @@
> >> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> >> +Date: Tue, 1 Sep 2015 22:54:31 +0200
> >> +Subject: [PATCH] Patch the main Makefile to allow for a build that
> >> complies to packaging guidelines.
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=UTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +Taken from [1]
> >> +
> >> +[1]
> >> https://src.fedoraproject.org/rpms/lmdb/raw/master/f/lmdb-make.patch
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +
> >> +diff --git a/Makefile b/Makefile
> >> +--- a/Makefile
> >> ++++ b/Makefile
> >> +@@ -26,6 +26,7 @@ OPT = -O2 -g
> >> + CFLAGS      = $(THREADS) $(OPT) $(W) $(XCFLAGS)
> >> + LDLIBS      =
> >> + SOLIBS      =
> >> ++SOVERSION   = 0.0.0
> >> + SOEXT       = .so
> >> + prefix      = /usr/local
> >> + exec_prefix = $(prefix)
> >> +@@ -38,7 +39,7 @@ mandir = $(datarootdir)/man
> >> +
> >> ########################################################################
> >> +
> >> + IHDRS       = lmdb.h
> >> +-ILIBS       = liblmdb.a liblmdb$(SOEXT)
> >> ++ILIBS       = liblmdb$(SOEXT) liblmdb$(SOEXT).$(SOVERSION)
> >> + IPROGS      = mdb_stat mdb_copy mdb_dump mdb_load
> >> + IDOCS       = mdb_stat.1 mdb_copy.1 mdb_dump.1 mdb_load.1
> >> + PROGS       = $(IPROGS) mtest mtest2 mtest3 mtest4 mtest5
> >> +@@ -49,13 +50,13 @@ install: $(ILIBS) $(IPROGS) $(IHDRS)
> >> +     mkdir -p $(DESTDIR)$(libdir)
> >> +     mkdir -p $(DESTDIR)$(includedir)
> >> +     mkdir -p $(DESTDIR)$(mandir)/man1
> >> +-    for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir); done
> >> +-    for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); done
> >> +-    for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedir); done
> >> +-    for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/man1; done
> >> ++    for f in $(IPROGS); do cp -a $$f $(DESTDIR)$(bindir); done
> >> ++    for f in $(ILIBS); do cp -a $$f $(DESTDIR)$(libdir); done
> >> ++    for f in $(IHDRS); do cp -a $$f $(DESTDIR)$(includedir); done
> >> ++    for f in $(IDOCS); do cp -a $$f $(DESTDIR)$(mandir)/man1; done
> >> +
> >> + clean:
> >> +-    rm -rf $(PROGS) *.[ao] *.[ls]o *~ testdb
> >> ++    rm -rf $(PROGS) *.[ao] *.[ls]o* *~ testdb
> >> +
> >> + test:       all
> >> +     rm -rf testdb && mkdir testdb
> >> +@@ -64,20 +65,24 @@ test:    all
> >> + liblmdb.a:  mdb.o midl.o
> >> +     $(AR) rs $@ mdb.o midl.o
> >> +
> >> +-liblmdb$(SOEXT):    mdb.lo midl.lo
> >> ++liblmdb$(SOEXT):    liblmdb$(SOEXT).$(SOVERSION)
> >> ++    rm -f $@
> >> ++    ln -s $< $@
> >> ++
> >> ++liblmdb$(SOEXT).$(SOVERSION):       mdb.lo midl.lo
> >> + #   $(CC) $(LDFLAGS) -pthread -shared -Wl,-Bsymbolic -o $@ mdb.o
> >> midl.o $(SOLIBS)
> >> +-    $(CC) $(LDFLAGS) -pthread -shared -o $@ mdb.lo midl.lo $(SOLIBS)
> >> ++    $(CC) $(LDFLAGS) -pthread -shared -Wl,-soname,$@ -o $@ mdb.lo
> >> midl.lo $(SOLIBS)
> >> +
> >> +-mdb_stat: mdb_stat.o liblmdb.a
> >> +-mdb_copy: mdb_copy.o liblmdb.a
> >> +-mdb_dump: mdb_dump.o liblmdb.a
> >> +-mdb_load: mdb_load.o liblmdb.a
> >> +-mtest:    mtest.o    liblmdb.a
> >> +-mtest2:     mtest2.o liblmdb.a
> >> +-mtest3:     mtest3.o liblmdb.a
> >> +-mtest4:     mtest4.o liblmdb.a
> >> +-mtest5:     mtest5.o liblmdb.a
> >> +-mtest6:     mtest6.o liblmdb.a
> >> ++mdb_stat: mdb_stat.o liblmdb.so
> >> ++mdb_copy: mdb_copy.o liblmdb.so
> >> ++mdb_dump: mdb_dump.o liblmdb.so
> >> ++mdb_load: mdb_load.o liblmdb.so
> >> ++mtest:    mtest.o    liblmdb.so
> >> ++mtest2:     mtest2.o liblmdb.so
> >> ++mtest3:     mtest3.o liblmdb.so
> >> ++mtest4:     mtest4.o liblmdb.so
> >> ++mtest5:     mtest5.o liblmdb.so
> >> ++mtest6:     mtest6.o liblmdb.so
> >> +
> >> + mdb.o: mdb.c lmdb.h midl.h
> >> +     $(CC) $(CFLAGS) $(CPPFLAGS) -c mdb.c
> >> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> >> b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> >> new file mode 100644
> >> index 000000000..22db6d44b
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> >> @@ -0,0 +1,22 @@
> >> +SUMMARY = "Symas Lightning Memory-Mapped Database (LMDB)"
> >> +HOMEPAGE = "http://symas.com/mdb/"
> >> +LICENSE = "OLDAP-2.8"
> >
> > We might need a copy of this license in meta-oe/licenses too.
> >
> >> +LIC_FILES_CHKSUM =
> >> "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
> >> +
> >> +SRC_URI = " \
> >> +    git://github.com/LMDB/lmdb.git;nobranch=1 \
> >> +    file://0001-Patch-the-main-Makefile.patch \
> >> +"
> >> +SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
> >> +S = "${WORKDIR}/git/libraries/liblmdb"
> >> +PV = "0.9.29"
> >
> > remove PV here and rename recipe to lmdb_0.0.29.bb
> >
> >> +
> >> +do_compile() {
> >> +    oe_runmake "CC=${CC}"
> >> +}
> >> +
> >> +do_install() {
> >> +    oe_runmake DESTDIR=${D} prefix=${prefix} libdir=${libdir}
> >> mandir=${mandir} install
> >> +    chown -R root:root ${D}${bindir}
> >> +    chown -R root:root ${D}${libdir}
> >
> > why do we need this extra chown op? Is pseudo not able to handle it?
>
> without the "chown" ops, following warning is encountered. The package
> works fine nonetheless. Any ideas on how to resolve it?
>
> WARNING: lmdb-0.9.29-r0 do_package_qa: QA Issue: lmdb:
> /usr/lib64/liblmdb.so is owned by uid 20885, which is the same as the
> user running bitbake. This may be due to host contamination
> [host-user-contaminated]
> WARNING: lmdb-0.9.29-r0 do_package_qa: QA Issue: lmdb:
> /usr/lib64/liblmdb.so.0.0.0 is owned by uid 20885, which is the same as
> the user running bitbake. This may be due to host contamination
> lmdb: /usr/bin/mdb_dump is owned by uid 20885, which is the same as the
> user running bitbake. This may be due to host contamination
> lmdb: /usr/bin/mdb_copy is owned by uid 20885, which is the same as the
> user running bitbake. This may be due to host contamination
> lmdb: /usr/bin/mdb_stat is owned by uid 20885, which is the same as the
> user running bitbake. This may be due to host contamination
>
> lmdb: /usr/bin/mdb_load is owned by uid 20885, which is the same as the
> user running bitbake. This may be due to host contamination
> [host-user-contaminated]

this seems that install in Makefile is not done right. perhaps it
should be patched to use install utility ?

>
> Sakib
>
>
> >
> > please add it to relevant test packagegroup in packagegroups-meta-oe.bb
> > as well.
> >
> >> +}
> >>
> >>
> >>
> >> 
> >>
