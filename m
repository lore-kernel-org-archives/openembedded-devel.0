Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2861B60155
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 10:30:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2014 02:30:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,695,1384329600"; d="scan'208";a="468275604"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.212])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2014 02:30:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 21 Jan 2014 10:30:19 +0000
Message-ID: <3212511.Eev2zkePNl@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <lbdoim$e43$1@ger.gmane.org>
References: <cover.1389979930.git.paul.eggleton@linux.intel.com>
	<d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
	<lbdoim$e43$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH 1/1] aufs-util: add new recipe
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
X-List-Received-Date: Tue, 21 Jan 2014 10:30:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 18 January 2014 12:29:40 Koen Kooi wrote:
> Paul Eggleton schreef op 17-01-14 18:36:
> /recipes-utils/aufs-util/aufs-util_git.bb
> b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> 
> > new file mode 100644 index 0000000..cea3636 --- /dev/null +++
> > b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb @@ -0,0 +1,48
> > @@ +SUMMARY = "Tools for managing AUFS mounts" +SECTION = "base"
> > +HOMEPAGE = "http://http://aufs.sourceforge.net/"

Heh, noone noticed this is broken, will fix.

> > +SRCREV = "f29056fe396d56fc2a06a96312feabaebbe14c59" 
> > +SRC_URI =
> > "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.x-rcN \
> > +          file://aufs-util-don-t-strip-executables.patch \ 
> > +          file://include/linux/aufs_type.h \ 
> > +          file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch 
> > \ 
> > +"
> > +
> > +PV = "3.x-rcN+git${SRCPV}"
> 
> This is a new low for upstream versioning :/ I've looked at the git repo for
> aufs-util and it seems 3.x-rcN is identical to 3.9, could we use that for
> the aufs-utils recipe to avoid using that horrid, horrid PV above?

Right, this is upstream's fault. I did just look, and you're correct, although 
they aren't the same hash, the 3.9 and 3.x-rcN branches aren't materially 
different, so we could use 3.9 instead.

> > + +S = "${WORKDIR}/git/" + +do_configure_append () { +	if [ "${PN}" !=
> > "aufs-util-native" ]; then +		for i in ver c2sh c2tmac; do +	cp
> > ${STAGING_BINDIR_NATIVE}/aufs-util-${PV}/$i ./ +		done +	fi +}
> 
> Change to do_configure_append_class-target ?

Indeed, that would be cleaner.

> And you'll probably want a
> 
> RRECOMMENDS_${PN} = "kernel-module-aufs"
> 
> here to drag in the aufs modules.

I guess so...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

