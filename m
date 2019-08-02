Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C5A337E467
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 03:17:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a27so53782732qkk.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2019 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mT8e8X0s/ydY9okwLCI+mD20Qg7oOHJOvW8w77QKab4=;
	b=hV3r0m6TfnAcBGO1kN8XnMiqKCKyhDrq4bBmtIpDeVJ8p+4BckOqZYU80ELLb+1ZqC
	QN+NWGgFrK0M5ar9NUHRXeRvu2PF1waYuDKgQCqLvm2TDmbL4uZUn1insFHcj8iKzU/O
	fSeb4B3OO6LGiAjDOkWrdNFSOmv6ygXk/Fe7GQJ1tPCR5QoVDqPUaVsGYPfVyvppaC9M
	hd4cRw1+6tQP7P2e6sOMro8Mjrr3cbHTMtRE9d8h2+5ZuiidVfgPT28HbtbXTyzcKJR4
	VINBHSEZ82ur93hPQb1O+K+kc/PKE4VYAl9SMdXUv/IGusQ6AEMhJpMMrXbkUTv0ufSa
	byMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mT8e8X0s/ydY9okwLCI+mD20Qg7oOHJOvW8w77QKab4=;
	b=XbtxwJljCsJm6W0NqfiGjOdLsBuK9Tw+QbA3Lug/pOJHobgQ79aLJ5g6QAWd3RCHdl
	ZEx6cX0/TLXEAOLKkxBmYS/a3Y3ge9W9sCpeavYyoTsAnjok9sl0OyaPIieF6BVQbQVd
	hSYF6QE+dPY3Hmlfhgv3AP0yPQH7x8Zfw6ZPu50aw1mEP8LjVgmPbDgOROWBhBrBQEhr
	lCyx9X9+BErkcTPJrELkV6UkbjNavmUtPpp6RpdPk38nUtpJaI63q80LVDtEItMoa77R
	lW5d11BSApUIE9Eg9pgcA+B3vC4nS6goDATvnSYXIz3gpv2BUuMlYUrIdP6fsW8nct05
	iAng==
X-Gm-Message-State: APjAAAWE/GbcXmet5wlhbXNXC/m1u41XGUcvWdJWf2WkhfPfaVC9Vjs6
	H2XWZw2xeEumONONbDvDm0N6qpvIZlxOBwhE96+KyRIz
X-Google-Smtp-Source: APXvYqymMvKnU2UXJdIdz42FdASEi6H78Evs33UTcVGD174IimsvHCDYnQi1jQKf5wtozjEdV96dUNgTv0o4X6zuxOo=
X-Received: by 2002:a37:4243:: with SMTP id p64mr71135573qka.9.1564715851382; 
	Thu, 01 Aug 2019 20:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190802030005.63180-1-liwei.song@windriver.com>
In-Reply-To: <20190802030005.63180-1-liwei.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Aug 2019 20:17:15 -0700
Message-ID: <CAMKF1sq4f8v4TK3y6KTU3hVB_GtMVOXz9uyDbp44EiM6g3-JXw@mail.gmail.com>
To: Liwei Song <liwei.song@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pm-graph: fix time format parse error
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
X-List-Received-Date: Fri, 02 Aug 2019 03:17:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 1, 2019 at 8:01 PM Liwei Song <liwei.song@windriver.com> wrote:
>
> Time format in dmesg has been changed from "%Y-%m-%d %H:%M:%S" to
> "%Y-%m-%dT%H:%M:%S", backport an upstream patch to fix this error.
>
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>  .../pm-graph/pm-graph/0001-bootgraph.py.patch | 32 +++++++++++++++++++
>  .../recipes-kernel/pm-graph/pm-graph_5.3.bb   |  4 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
>
> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
> new file mode 100644
> index 000000000000..79685d612abe
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-bootgraph.py.patch
> @@ -0,0 +1,32 @@
> +From 0c94e32b218c31f31a7988577fb9bec595034e7b Mon Sep 17 00:00:00 2001
> +From: Todd Brandt <todd.e.brandt@linux.intel.com>
> +Date: Fri, 10 May 2019 15:10:35 -0700
> +Subject: [PATCH] bootgraph.py: - handle boot time start grep better, the regex
> + needs more complexity
> +
> +Upstream-Status: Backport
> +

can you add the link to backport location here ?

Upstream-Status: Backport [ <detail> ]

> +Signed-off-by: Liwei Song <liwei.song@windriver.com>
> +---
> + bootgraph.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/bootgraph.py b/bootgraph.py
> +index a2b1b1897307..d7f4bd152bf1 100755
> +--- a/bootgraph.py
> ++++ b/bootgraph.py
> +@@ -333,9 +333,9 @@ def parseKernelLog():
> +                       if(not sysvals.stamp['kernel']):
> +                               sysvals.stamp['kernel'] = sysvals.kernelVersion(msg)
> +                       continue
> +-              m = re.match('.* setting system clock to (?P<t>.*) UTC.*', msg)
> ++              m = re.match('.* setting system clock to (?P<d>[0-9\-]*)[ A-Z](?P<t>[0-9:]*) UTC.*', msg)
> +               if(m):
> +-                      bt = datetime.strptime(m.group('t'), '%Y-%m-%d %H:%M:%S')
> ++                      bt = datetime.strptime(m.group('d')+' '+m.group('t'), '%Y-%m-%d %H:%M:%S')
> +                       bt = bt - timedelta(seconds=int(ktime))
> +                       data.boottime = bt.strftime('%Y-%m-%d_%H:%M:%S')
> +                       sysvals.stamp['time'] = bt.strftime('%B %d %Y, %I:%M:%S %p')
> +--
> +2.22.0
> +
> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> index ea12e054d3ab..a9f540ab8605 100644
> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
>
>  SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
>  SRC_URI = "git://github.com/intel/pm-graph.git \
> -           file://0001-Makefile-fix-multilib-build-failure.patch"
> +           file://0001-Makefile-fix-multilib-build-failure.patch \
> +           file://0001-bootgraph.py.patch \
> +"
>  S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST='(i.86|x86_64).*'
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

