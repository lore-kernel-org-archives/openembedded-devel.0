Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.240.1623872849323685498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 12:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bIpTcJNY;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id h12so1662727plf.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 12:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6r4crVC97e/UDdarcGL39UxPAoFwzR1FwKVhQFEtph4=;
        b=bIpTcJNYXdsvo4r8Du0hSdRBVoWdV1kkFLXk8prcnyZe8+ZzUjB0E95YbPWxBBhz23
         nwWvLOOW7oXTEhFynvoMy188rEk4Pg+QtGKrnGHBKfRB6oY+UUJo+t4K/9ZsXfxI66ay
         QxeKqXg4QT9wI6IvbjGpq2gaWITy3FQYTBSoNCNoDsjYZWxg3WL3vvRJtK9OSvGimiKN
         s18j6GakooIlMYObSFTDqR+D3XTdvLXkj4IryUURxHQviUNELongdm35PbIE/C40sJaj
         prStlevy6jS7Q8wP41hJh08P9dMRQltIwYpOqhHqs9FFOTYD+LlqO1qO9m3gFGyd2Jc3
         zgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6r4crVC97e/UDdarcGL39UxPAoFwzR1FwKVhQFEtph4=;
        b=B1j+ZPUorgF+P4IWLJHYP60JVB9bs3/jMs/Z2Qmbyy1RWeWFxIhNQEGxFuGcgnol2a
         hBYnM3NbbXYSgC/+w5CusWygsusboPW3MM1+ZVLXagEu2uJ771OAafSRyxozt9Lq0PU2
         vMZy0hGDWfcuxot98fIytUyu3UesDQyZzWbalLrcT7JSFgOySgRhlWu8aK2VCil1dGB3
         LSvYZQk87e2mUNB4W2tlCs4LwsbSdnsiRmlD2hcc2MXo814wizC0xsR1H+xvpw+recLb
         Z2Mme9j7pc9e4s7fzAW1t2Nb9GyjOGXzLdamq6fOwhEk09a2OKsviVMIEtNKI4+gsH3p
         ukWg==
X-Gm-Message-State: AOAM531v4wtfmWS4aoD0JVdUY9zGWD/kBBnfz7hT4KUaiDfjtwWnL0Pu
	QRS0u4UlsiMwTj8ILY5fheNWT5fClN+pFg==
X-Google-Smtp-Source: ABdhPJzvsJ2K/eVJOtpKQ3q45haTD+hLhrKdGTYoo+xwsW48Nx7hLij54bR6Hzpqzei82W5cobyTZQ==
X-Received: by 2002:a17:90a:f015:: with SMTP id bt21mr12575513pjb.37.1623872848489;
        Wed, 16 Jun 2021 12:47:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:3db2:672f:771a:8c47? ([2601:646:9200:a0f0:3db2:672f:771a:8c47])
        by smtp.gmail.com with ESMTPSA id b6sm2921216pfv.16.2021.06.16.12.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 12:47:28 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] lmdb: add recipe
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210616182123.45393-1-sakib.sajal@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f815a254-ce73-8d36-33a1-69da5b4047c4@gmail.com>
Date: Wed, 16 Jun 2021 12:47:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616182123.45393-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/16/21 11:21 AM, Sakib Sajal wrote:
> lmdb provides a high-performance embedded transactional
> database in the form of a key-value store.
> 
> Recipe is ported from meta-qt5-extra layer.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   .../files/0001-Patch-the-main-Makefile.patch  | 90 +++++++++++++++++++
>   meta-oe/recipes-dbs/lmdb/lmdb_git.bb          | 22 +++++
>   2 files changed, 112 insertions(+)
>   create mode 100644 meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>   create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> 
> diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
> new file mode 100644
> index 000000000..9ba626101
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
> @@ -0,0 +1,90 @@
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> +Date: Tue, 1 Sep 2015 22:54:31 +0200
> +Subject: [PATCH] Patch the main Makefile to allow for a build that complies to packaging guidelines.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Taken from [1]
> +
> +[1] https://src.fedoraproject.org/rpms/lmdb/raw/master/f/lmdb-make.patch
> +
> +Upstream-Status: Pending
> +
> +
> +diff --git a/Makefile b/Makefile
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -26,6 +26,7 @@ OPT = -O2 -g
> + CFLAGS	= $(THREADS) $(OPT) $(W) $(XCFLAGS)
> + LDLIBS	=
> + SOLIBS	=
> ++SOVERSION	= 0.0.0
> + SOEXT	= .so
> + prefix	= /usr/local
> + exec_prefix = $(prefix)
> +@@ -38,7 +39,7 @@ mandir = $(datarootdir)/man
> + ########################################################################
> +
> + IHDRS	= lmdb.h
> +-ILIBS	= liblmdb.a liblmdb$(SOEXT)
> ++ILIBS	= liblmdb$(SOEXT) liblmdb$(SOEXT).$(SOVERSION)
> + IPROGS	= mdb_stat mdb_copy mdb_dump mdb_load
> + IDOCS	= mdb_stat.1 mdb_copy.1 mdb_dump.1 mdb_load.1
> + PROGS	= $(IPROGS) mtest mtest2 mtest3 mtest4 mtest5
> +@@ -49,13 +50,13 @@ install: $(ILIBS) $(IPROGS) $(IHDRS)
> + 	mkdir -p $(DESTDIR)$(libdir)
> + 	mkdir -p $(DESTDIR)$(includedir)
> + 	mkdir -p $(DESTDIR)$(mandir)/man1
> +-	for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir); done
> +-	for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); done
> +-	for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedir); done
> +-	for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/man1; done
> ++	for f in $(IPROGS); do cp -a $$f $(DESTDIR)$(bindir); done
> ++	for f in $(ILIBS); do cp -a $$f $(DESTDIR)$(libdir); done
> ++	for f in $(IHDRS); do cp -a $$f $(DESTDIR)$(includedir); done
> ++	for f in $(IDOCS); do cp -a $$f $(DESTDIR)$(mandir)/man1; done
> +
> + clean:
> +-	rm -rf $(PROGS) *.[ao] *.[ls]o *~ testdb
> ++	rm -rf $(PROGS) *.[ao] *.[ls]o* *~ testdb
> +
> + test:	all
> + 	rm -rf testdb && mkdir testdb
> +@@ -64,20 +65,24 @@ test:	all
> + liblmdb.a:	mdb.o midl.o
> + 	$(AR) rs $@ mdb.o midl.o
> +
> +-liblmdb$(SOEXT):	mdb.lo midl.lo
> ++liblmdb$(SOEXT):	liblmdb$(SOEXT).$(SOVERSION)
> ++	rm -f $@
> ++	ln -s $< $@
> ++
> ++liblmdb$(SOEXT).$(SOVERSION):	mdb.lo midl.lo
> + #	$(CC) $(LDFLAGS) -pthread -shared -Wl,-Bsymbolic -o $@ mdb.o midl.o $(SOLIBS)
> +-	$(CC) $(LDFLAGS) -pthread -shared -o $@ mdb.lo midl.lo $(SOLIBS)
> ++	$(CC) $(LDFLAGS) -pthread -shared -Wl,-soname,$@ -o $@ mdb.lo midl.lo $(SOLIBS)
> +
> +-mdb_stat: mdb_stat.o liblmdb.a
> +-mdb_copy: mdb_copy.o liblmdb.a
> +-mdb_dump: mdb_dump.o liblmdb.a
> +-mdb_load: mdb_load.o liblmdb.a
> +-mtest:    mtest.o    liblmdb.a
> +-mtest2:	mtest2.o liblmdb.a
> +-mtest3:	mtest3.o liblmdb.a
> +-mtest4:	mtest4.o liblmdb.a
> +-mtest5:	mtest5.o liblmdb.a
> +-mtest6:	mtest6.o liblmdb.a
> ++mdb_stat: mdb_stat.o liblmdb.so
> ++mdb_copy: mdb_copy.o liblmdb.so
> ++mdb_dump: mdb_dump.o liblmdb.so
> ++mdb_load: mdb_load.o liblmdb.so
> ++mtest:    mtest.o    liblmdb.so
> ++mtest2:	mtest2.o liblmdb.so
> ++mtest3:	mtest3.o liblmdb.so
> ++mtest4:	mtest4.o liblmdb.so
> ++mtest5:	mtest5.o liblmdb.so
> ++mtest6:	mtest6.o liblmdb.so
> +
> + mdb.o: mdb.c lmdb.h midl.h
> + 	$(CC) $(CFLAGS) $(CPPFLAGS) -c mdb.c
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_git.bb b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> new file mode 100644
> index 000000000..22db6d44b
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Symas Lightning Memory-Mapped Database (LMDB)"
> +HOMEPAGE = "http://symas.com/mdb/"
> +LICENSE = "OLDAP-2.8"

We might need a copy of this license in meta-oe/licenses too.

> +LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
> +
> +SRC_URI = " \
> +    git://github.com/LMDB/lmdb.git;nobranch=1 \
> +    file://0001-Patch-the-main-Makefile.patch \
> +"
> +SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
> +S = "${WORKDIR}/git/libraries/liblmdb"
> +PV = "0.9.29"

remove PV here and rename recipe to lmdb_0.0.29.bb

> +
> +do_compile() {
> +    oe_runmake "CC=${CC}"
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=${D} prefix=${prefix} libdir=${libdir} mandir=${mandir} install
> +    chown -R root:root ${D}${bindir}
> +    chown -R root:root ${D}${libdir}

why do we need this extra chown op? Is pseudo not able to handle it?

please add it to relevant test packagegroup in packagegroups-meta-oe.bb 
as well.

> +}
> 
> 
> 
> 
> 
