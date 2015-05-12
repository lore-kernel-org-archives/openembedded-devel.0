Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F164D73F5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 08:53:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2015 01:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,413,1427785200"; d="scan'208";a="569978638"
Received: from dpassaue-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.139])
	by orsmga003.jf.intel.com with ESMTP; 12 May 2015 01:53:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2015 09:53:34 +0100
Message-ID: <1718915.ksCZF7gNNA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <20150511195200.GM2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
	<20150511195200.GM2400@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 08:53:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 May 2015 21:52:00 Martin Jansa wrote:
> On Mon, May 11, 2015 at 12:43:41PM -0700, Khem Raj wrote:
> > On Mon, May 11, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> 
wrote:
> > > RDEPENDS adds dependency only between do_package tasks for build time
> > > dependency you need do_configure depending on do_populate_sysroot
> > 
> > its do_build which will depend on do_package_write task in case of
> > RDEPENDS
> > and do_package_write task will then recurse further to build it.
> 
>         <section id='build-dependencies'>
>             <title>Build Dependencies</title>
> 
>             <para>
>                 BitBake uses the
>                 <link
> linkend='var-DEPENDS'><filename>DEPENDS</filename></link> variable to
> manage build time dependencies.
>                 The "deptask" varflag for tasks signifies the task of each
>                 item listed in <filename>DEPENDS</filename> that must
>                 complete before that task can be executed.
>                 Here is an example:
>                 <literallayout class='monospaced'>
>      do_configure[deptask] = "do_populate_sysroot"
>                 </literallayout>
>                 In this example, the
> <filename>do_populate_sysroot</filename> task of each item in
> <filename>DEPENDS</filename> must complete before
> <filename>do_configure</filename> can execute.
>             </para>
>         </section>
> 
> 
>         <section id='runtime-dependencies'>
>             <title>Runtime Dependencies</title>
> 
>             <para>
>                 BitBake uses the
>                 <link
> linkend='var-PACKAGES'><filename>PACKAGES</filename></link>, <link
> linkend='var-RDEPENDS'><filename>RDEPENDS</filename></link>, and <link
> linkend='var-RRECOMMENDS'><filename>RRECOMMENDS</filename></link> variables
> to manage runtime dependencies.
>             </para>
> 
>             <para>
>                 The <filename>PACKAGES</filename> variable lists runtime
>                 packages.
>                 Each of those packages can have
> <filename>RDEPENDS</filename> and <filename>RRECOMMENDS</filename> runtime
> dependencies. The "rdeptask" flag for tasks is used to signify the task of
> each item runtime dependency which must have completed before that task can
> be executed.
>                 <literallayout class='monospaced'>
>      do_package_qa[rdeptask] = "do_packagedata"
>                 </literallayout>
>                 In the previous example, the
> <filename>do_packagedata</filename> task of each item in
> <filename>RDEPENDS</filename> must have completed before
> <filename>do_package_qa</filename> can execute. </para>
>         </section>
> 
> 
> so again, RDEPENDS isn't good enough for build time dependencies

This is correct. Even an explicit RDEPENDS within the recipe does not add any 
dependency from do_configure on do_populate_sysroot, so if there is a build 
time dependency you definitely need DEPENDS as well.

I do agree though that the warning message needs improvement in order to be as 
clear as possible.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

