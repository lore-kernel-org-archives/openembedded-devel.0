Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 29FE761085
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:08:56 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n17so16111304qtv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I3/bbISkp42v5ubYI031GjKRQPo5ya6IPAnjGVlHJIs=;
	b=bRz8KJPWDEUzzOawi4Wcu9og8KHu1Rfa/PtuGWuLUvAI+hhlJDTH54gw/gfUdCDlmh
	aCIqHCRY8V877ePyAq//T9qGt3EnZUu7aaAXz4G114w7QF4RXhdFZvRBXtBX2wa8215T
	XlYhPgVFffPaHsNrtdvaas/2sQWMfZdGHykS2WIFxJf+XCgj3/rETRw64oYXldyLAk3H
	5ysEZLyXzDnNtIAlATRGr53+BZiwFVxqYusb+7HNYabegoEeUisCLGGX6fqk/7uFBc5i
	oGpzWzkDE/CHiKjU4+rBpwO3ZmjYX9gDW2hITr6MqSVIpgLYVnnj1V9uweeznoEeD8U4
	GBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I3/bbISkp42v5ubYI031GjKRQPo5ya6IPAnjGVlHJIs=;
	b=Fep+iYokRzvDaa8lihaqJw/u4AjWRs/HBsedJnGG5alXxrwn1SktNkJhECIPhJaTV0
	x4K8uzGZsjxLfKmbIzZwIXo3vnIZfrGcO+1oRn76d8muXwhhdgRgUygjoLp1QI9A2LvV
	bKwVOTG0tvg4MxdJiFRAv/B2RvbEq4wvae63eEhz0S1WyHfmaQDzy51R26Yn6UeIvNxD
	cUTs0dt5ASaEyUuKGqna7YZEUKqKHk2SUNFxjVBkyNbiDo9n3STkyRrtU87QMauujSfj
	yaessDD4051VilLpXmSyApK5qnr55xNuG5viWufH0xU0ai53oJcs9ksSPdxPu56wAWWG
	uhtQ==
X-Gm-Message-State: APjAAAW5D715KI3ujz5AXFu8NsHYeBz8NDSESDpcVQigg+Txby+g2yQD
	X/bpBW8NfKDjBcXO6rsfb2lPsarIS2S4etGubHQ=
X-Google-Smtp-Source: APXvYqzwS/OqYGjCsUcy64en8jp22oghKWwULESgo1vOT8PORf/lEx2fvg+bF7zoIKk4EElW8f6FOD6j/+fGrqBYOyA=
X-Received: by 2002:ac8:1a19:: with SMTP id v25mr20277564qtj.146.1582078137529;
	Tue, 18 Feb 2020 18:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20200219005058.2921658-1-raj.khem@gmail.com>
	<20200219005058.2921658-2-raj.khem@gmail.com>
	<C0207330DF60C5409302EC78C3FE68F303443370@PGSMSX101.gar.corp.intel.com>
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F303443370@PGSMSX101.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2020 18:08:31 -0800
Message-ID: <CAMKF1spLkd+RQA0Jyv0b402AgPhm06zNE6oh-QopJhsr1ZNu3A@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] pm-graph: Renamed from analyze-suspend
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
X-List-Received-Date: Wed, 19 Feb 2020 02:08:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 5:40 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> Is this different from the one that is already in meta-oe?
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/pm-graph
>

These are duplicates, thanks for pointing out, I will move the
PROVIDES part to pm-graph and other
goodies from the recipe and delete analyze-suspend


> Thanks,
>
> Anuj
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Wednesday, February 19, 2020 08:51 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-oe][PATCH 2/4] pm-graph: Renamed from analyze-suspend
> >
> > Moved to tip to get py3 support
> > Point SRC_URI to new location
> > Adjust for name changes
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../pm-graph_5.5.bb}                                 | 12 ++++++++----
> >  .../packagegroups/packagegroup-meta-oe.bb            |  2 +-
> >  2 files changed, 9 insertions(+), 5 deletions(-)  rename meta-oe/recipes-
> > benchmark/{analyze-suspend/analyze-suspend_5.5.bb => pm-graph/pm-
> > graph_5.5.bb} (74%)
> >
> > diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
> > b/meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
> > similarity index 74%
> > rename from meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
> > rename to meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
> > index bb0aad3413..4f6f3bd40c 100644
> > --- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
> > +++ b/meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
> > @@ -1,4 +1,4 @@
> > -SUMMARY = "Analyze Suspend"
> > +SUMMARY = "Analyze Suspend/Resume"
> >  DESCRIPTION = "analyze-suspend is a tool for system developers to visualize \  the
> > activity between suspend and resume, allowing them to identify \  inefficiencies and
> > bottlenecks."
> > @@ -14,10 +14,11 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> >  #   - CONFIG_FUNCTION_TRACER=y
> >  #   - CONFIG_FUNCTION_GRAPH_TRACER=y
> >
> > -RDEPENDS_${PN} += "python-core python-datetime python-stringold"
> > +RDEPENDS_${PN} += "python3-core python3-datetime python3-stringold"
> >
> > -SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
> > -SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
> > +PV .= "+git${SRCPV}"
> > +SRC_URI = "git://github.com/intel/pm-graph;protocol=https"
> > +SRCREV = "3a8cd2fa9aee3afbc7f7e844885ffdcfaf5a1097"
> >
> >  S = "${WORKDIR}/git"
> >
> > @@ -27,3 +28,6 @@ do_install() {
> >  }
> >
> >  BBCLASSEXTEND = "native"
> > +
> > +RPROVIDES_${PN} = "analyze-suspend"
> > +
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-
> > oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index bad4aa769e..3933619add 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -46,7 +46,7 @@ RDEPENDS_packagegroup-meta-oe = "\  "
> >
> >  RDEPENDS_packagegroup-meta-oe-benchmarks = "\
> > -    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
> > +    pm-graph dhrystone iperf2 linpack phoronix-test-suite \
> >      tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
> >      libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
> >      nbench-byte tinymembench \
> > --
> > 2.25.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

