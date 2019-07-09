Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id EA24D745BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 18:42:06 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g18so16816708qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LOe/fPISdJSn3lgmTvkI5dHb92AOS8VaFyKAPso7a/k=;
	b=oh+zgHXjQTPqOcypQ4qjy710dHQ8RC/PnSlWGfZYQG+3eITTzpxPTkDCidSptsPclm
	d+lqHGsxofYG3LqVMP2bp+MxgedsXFc9m3/KjSJFLmZhZ1tVrIdqGB3kTP3YQU82NzlR
	wd5CbEs3Uc0kZ2Uw179GoIB7SnUXSoUMtPPOmIA1hoD1e3FKDQDBgtUO8Z2qnAkyKACo
	/UM87Y/Tb6EBs5CAvBCEdbT99KFjcAw5nlRZGujDgeLQ8ey5iNW/gYARRtZimsyi2nh+
	BsLFYRUVXmc6rb3luOzHhZGtde2eyuQoQxrkGVeOVp6NGdfI7rBr9tSi4XJMpzHxktlL
	3ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LOe/fPISdJSn3lgmTvkI5dHb92AOS8VaFyKAPso7a/k=;
	b=gbfOmr6I+gkNGaam/isyBM0O0SAA8WUEWLnkljum5GdJC+JJ5AvrGvdfGzvsYnGJto
	tUtgSoYVSf3IRzt2tCvGRJoy+NzeCEOsNafIlnHXB/rBmzQhZXT3RF3wGbFIP+XXM9+t
	YB1/AeH3+WSGbdNkj+jubp6125ZONAaL4Yg7cP7NXIMHhiL1hFHUyqMMXfDpjFasCnSL
	uVryOprTM4chglRZZCW2eMj7cFSDvZo2OHYONWfE39mOwFJyFugqUyRizCPy7kJM9yyj
	2UEY5/vChzZfVJHEpimpxC9lgoOQpnTkZ/rQk++ZLpHOQxUcDhakaB7aMGc2vkOSbGvQ
	qCHQ==
X-Gm-Message-State: APjAAAXo9NptvM2CG1VmNxDxZLunVX5g4pwTLUTESlQbCweWkv8jU8uD
	ScFopkTtdeE6abuO9B+y71iq+0VSr6Y4wTD1edU=
X-Google-Smtp-Source: APXvYqzWInF1FK3bovwtd+bUDpfR0A7dGgWrHsDz6HEcmwRtC1fbIRTi78bYghW+arh9hrA4Eqq6G8MlysprUQJFZjM=
X-Received: by 2002:a37:c81:: with SMTP id 123mr20667698qkm.474.1562697727599; 
	Tue, 09 Jul 2019 11:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <1562291023-261126-1-git-send-email-liwei.song@windriver.com>
	<32b2fbe7-f358-474a-d71a-2eb82e9b834e@intel.com>
	<5D1EB004.8080305@windriver.com> <5D1EB274.9030406@windriver.com>
In-Reply-To: <5D1EB274.9030406@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 11:41:52 -0700
Message-ID: <CAMKF1soE2ss=Y5tnYOdJUrREbD5ay5g0qm=Tn0DJgyY14vDHmA@mail.gmail.com>
To: Liwei Song <liwei.song@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] pm-graph: package the pm-graph files
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
X-List-Received-Date: Tue, 09 Jul 2019 18:42:07 -0000
Content-Type: text/plain; charset="UTF-8"

Naveen, can you take further look and suggest right solution if this
is not right

On Thu, Jul 4, 2019 at 7:14 PM Liwei Song <liwei.song@windriver.com> wrote:
>
>
>
> On 07/05/2019 10:03 AM, Liwei Song wrote:
> >
> >
> > On 07/05/2019 10:01 AM, Saini, Naveen Kumar wrote:
> >>
> >>
> >> On 7/5/19 9:43 AM, Liwei Song wrote:
> >>> package /usr/lib/pm-grap and /bin/* files created by pm-graph
> >>> to aviod "Files were installed but not shipped in any package"
> >>> error.
> >>>
> >>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> >>> ---
> >>>   meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb | 3 +++
> >>>   1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> >>> index ea12e054d3ab..00301298309e 100644
> >>> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> >>> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> >>> @@ -18,3 +18,6 @@ do_install() {
> >>>   }
> >>>     RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
> >>> +
> >>> +FILES_${PN} += "${nonarch_libdir}/pm-graph \
> >> This too not required. Please have a look at
> >> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/bitbake.conf
> >>
> >> Could you share your error !
> >
> > The error I got:
> > ERROR: pm-graph-5.3-r0 do_package: QA Issue: pm-graph: Files/directories were installed but not shipped in any package:
> >   /usr/lib
> >   /usr/lib/pm-graph
> >   /usr/lib/pm-graph/sleepgraph.py
> >   /usr/lib/pm-graph/bootgraph.py
> >   /usr/lib/pm-graph/config
> >   /usr/lib/pm-graph/config/cgskip.txt
> >   /usr/lib/pm-graph/config/freeze-callgraph.cfg
> >   /usr/lib/pm-graph/config/freeze.cfg
> >   /usr/lib/pm-graph/config/freeze-dev.cfg
> >   /usr/lib/pm-graph/config/standby-callgraph.cfg
> >   /usr/lib/pm-graph/config/standby.cfg
> >   /usr/lib/pm-graph/config/standby-dev.cfg
> >   /usr/lib/pm-graph/config/suspend-callgraph.cfg
> >   /usr/lib/pm-graph/config/suspend.cfg
> >   /usr/lib/pm-graph/config/suspend-dev.cfg
> >   /usr/lib/pm-graph/config/suspend-x2-proc.cfg
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> > pm-graph: 16 installed and not shipped files. [installed-vs-shipped]
> > ERROR: pm-graph-5.3-r0 do_package: Fatal QA errors found, failing task.
> > ERROR: pm-graph-5.3-r0 do_package:
> > ERROR: pm-graph-5.3-r0 do_package: Function failed: do_package
>
> while libdir="/usr/lib64" can be inherit, but in my case files were installed to /usr/lib/
> export nonarch_libdir="/usr/lib" can not be inherit by default, right?
>
> Thanks
> Liwei.
>
>
> >
> >
> > Thanks,
> > Liwei.
> >>> +"
> >>>
> >>
> >>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

