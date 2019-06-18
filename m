Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2B27D697
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:13:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k21so20888187edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FN6T7mKNv2Z1lcKJvzbpNtBp9ygGT2TX+QMcR7ThPk4=;
	b=JZQu9UReWbyn50aK6cgSSMbLtLQ0mHW4vTk7sKRfSPTW31PwYQP9U7f3S23SW/M4gv
	qgsTUEVyIgrzgy4UFUn4pJPNSPS7hQzS0cvbvL2bz0J6sKdsDmJtQjs3pVBeT47z/zXF
	hI5vqlH7QZNnbL3gi0FZLTeAFQAnxh5Kuvz+pzxbj5ml5X+cWN8Qx12Ow1L97VK/OLgD
	kybdDuMl5PQYeIW+0Ml4lyc43tbfOdzf6ejJpBwuyHgZMNV1dR5k27o7hSrwkB/oI0v2
	NA1PEvR5vQfny7c6UQyJ65sBh9dqKfOeN4g0GA/nrqLA3JtXAp4R1048PCiwKKbvH3ia
	adbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FN6T7mKNv2Z1lcKJvzbpNtBp9ygGT2TX+QMcR7ThPk4=;
	b=BgemgXiMW6kcYk+S70fjZQgKaTe6UsFOHyviDvul/w7lTwnPNDTNcPxsgWuvwbSrEu
	eHkU46BJqd79/QYFXe3NqPZDeoBg5DH+XF2FrOlp5IqYLKNwMTyboDedv4S+df3Pdq0y
	TlqCaMagMw8drUIAFczrZENl2NQ8SehtNMJvs1dlvKDYOAjB7fEg8oUMoCMlzk6APg0B
	krQc9N1F5nPiqwDhFzOKGVSuZUYwZK1BqYLK02XZ5V6s+WBZHmAMDMwuJ/qnUhTPgKbI
	dP6MYqBmfWj6sJ7RgQg9WkcW3OInpJgvPP32UZgPQo8Su5S9JgbyAIJ1YyfdsI5aja8I
	6hJg==
X-Gm-Message-State: APjAAAWkIvXR2ddancgIVKsfUD7S+pk9iGoXhHxIynD3cPvFrsd+fAsU
	MZF1d3foRDqLobBzDfeQnJH5BrXeCSje8UOyRg8=
X-Google-Smtp-Source: APXvYqx46P5XWRHFpigzgSIwkoOgDXm+zI6Tztdw8/8BHG94DRbmnOZwjZtK1skR2SUhC5PXJSxjNw/QQpafWAkuOY8=
X-Received: by 2002:aa7:df93:: with SMTP id b19mr46858104edy.153.1560852804071;
	Tue, 18 Jun 2019 03:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <1560850223-83235-1-git-send-email-naveen.kumar.saini@intel.com>
In-Reply-To: <1560850223-83235-1-git-send-email-naveen.kumar.saini@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 12:13:11 +0200
Message-ID: <CA+chaQd7MwofcXb9BTixB6+g2Q0fUFnfxGthE67GeJ_BdpveYw@mail.gmail.com>
To: Naveen Saini <naveen.kumar.saini@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] pm-graph: fix multilib build failure
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
X-List-Received-Date: Tue, 18 Jun 2019 10:13:23 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for really quick fix!

Works for me now.

Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

On Tue, Jun 18, 2019 at 11:30 AM Naveen Saini <naveen.kumar.saini@intel.com>
wrote:

> Added the generic library path used by multilib code
>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  .../0001-Makefile-fix-multilib-build-failure.patch | 89
> ++++++++++++++++++++++
>  meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb    |  5 +-
>  2 files changed, 92 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
>
> diff --git
> a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
> b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
> new file mode 100644
> index 0000000..56981d9
> --- /dev/null
> +++
> b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
> @@ -0,0 +1,89 @@
> +From 50cea8fd3c07ab27da6edce865a49339f16f3b57 Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Tue, 18 Jun 2019 17:10:15 +0800
> +Subject: [PATCH] Makefile: fix multilib build failure
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + Makefile | 50 +++++++++++++++++++++++++++-----------------------
> + 1 file changed, 27 insertions(+), 23 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8455415..4aa0786 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,30 +1,34 @@
> + # SPDX-License-Identifier: GPL-2.0
> + PREFIX                ?= /usr
> + DESTDIR               ?=
> ++BASELIB               ?=
> +
> + all:
> +       @echo "Nothing to build"
> +
> ++clean:
> ++      @echo "Nothing to clean"
> ++
> + install : uninstall
> +-      install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph
> +-      install sleepgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
> +-      install bootgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
> +-      install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/cgskip.txt
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/freeze-callgraph.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/freeze.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/freeze-dev.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/standby-callgraph.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/standby.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/standby-dev.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/suspend-callgraph.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/suspend.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/suspend-dev.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> +-      install -m 644 config/suspend-x2-proc.cfg
> $(DESTDIR)$(PREFIX)/lib/pm-graph/config
> ++      install -d  $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
> ++      install sleepgraph.py $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
> ++      install bootgraph.py $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
> ++      install -d  $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/cgskip.txt
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/freeze-callgraph.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/freeze.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/freeze-dev.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/standby-callgraph.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/standby.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/standby-dev.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/suspend-callgraph.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/suspend.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/suspend-dev.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> ++      install -m 644 config/suspend-x2-proc.cfg
> $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
> +
> +       install -d  $(DESTDIR)$(PREFIX)/bin
> +-      ln -s ../lib/pm-graph/bootgraph.py
> $(DESTDIR)$(PREFIX)/bin/bootgraph
> +-      ln -s ../lib/pm-graph/sleepgraph.py
> $(DESTDIR)$(PREFIX)/bin/sleepgraph
> ++      ln -s ../$(BASELIB)/pm-graph/bootgraph.py
> $(DESTDIR)$(PREFIX)/bin/bootgraph
> ++      ln -s ../$(BASELIB)/pm-graph/sleepgraph.py
> $(DESTDIR)$(PREFIX)/bin/sleepgraph
> +
> +       install -d  $(DESTDIR)$(PREFIX)/share/man/man8
> +       install bootgraph.8 $(DESTDIR)$(PREFIX)/share/man/man8
> +@@ -37,11 +41,11 @@ uninstall :
> +       rm -f $(DESTDIR)$(PREFIX)/bin/bootgraph
> +       rm -f $(DESTDIR)$(PREFIX)/bin/sleepgraph
> +
> +-      rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/config/*
> +-      if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph/config ] ; then \
> +-              rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph/config; \
> ++      rm -f $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config/*
> ++      if [ -d $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config ] ; then \
> ++              rmdir $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config; \
> +       fi;
> +-      rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/*
> +-      if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph ] ; then \
> +-              rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph; \
> ++      rm -f $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/*
> ++      if [ -d $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph ] ; then \
> ++              rmdir $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph; \
> +       fi;
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> index de2d46d..ea12e05 100644
> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> @@ -6,11 +6,12 @@ LICENSE  = "GPL-2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
>
>  SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
> -SRC_URI = "git://github.com/intel/pm-graph.git"
> +SRC_URI = "git://github.com/intel/pm-graph.git \
> +           file://0001-Makefile-fix-multilib-build-failure.patch"
>  S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST='(i.86|x86_64).*'
> -EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
> +EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} BASELIB=${baselib}"
>
>  do_install() {
>          oe_runmake install
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

