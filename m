Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 71E407169F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 12:58:04 +0000 (UTC)
Received: from [70.30.87.145] (port=56470 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y9Z8b-0001Ay-UZ for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jan 2015 07:58:02 -0500
Date: Fri, 9 Jan 2015 07:57:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20150105162556.GL2484@jama>
Message-ID: <alpine.LFD.2.11.1501090756330.10695@localhost>
References: <alpine.LFD.2.11.1501050948080.16705@localhost>
	<20150105162556.GL2484@jama>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: missing trailing spaces in some "_prepend" expressions in oe-core
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
X-List-Received-Date: Fri, 09 Jan 2015 12:58:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 5 Jan 2015, Martin Jansa wrote:

> On Mon, Jan 05, 2015 at 09:58:01AM -0500, Robert P. J. Day wrote:
> >
> >   after running across a variable "_prepend" assignment that had no
> > trailing space, i did a quick grep through oe-core and ran across the
> > following, which would all seem to need that trailing space:
> >
> > $ grep -rn "DEPENDS_prepend.*[^ ]\"$" *
> > meta/classes/qt4e.bbclass:2:DEPENDS_prepend = "${QT4EDEPENDS}"
> > meta/classes/cpan_build.bbclass:27:DEPENDS_prepend = "${@cpan_build_dep_prepend(d)}"
> > meta/classes/autotools.bbclass:24:DEPENDS_prepend = "${@autotools_dep_prepend(d)}"
> > meta/classes/qt4x11.bbclass:2:DEPENDS_prepend = "${QT4DEPENDS}"
> > $
>
> e.g. QT4EDEPENDS QT4DEPENDS both end with space, so it's not causing
> any problem, but having the trailing space together with prepend is
> good.
>
> Only exception I can think of is when you really don't want to
> introduce extra space when the variable used in prepend/append is
> set to empty, but that's not an issue for DEPENDS (but important
> e.x. for tune .inc files)
>
> > and
> >
> > $ grep -rn "SRC_URI_prepend.*[^ ]\"$" *
> > meta/recipes-devtools/qemu/qemu_git.bb:10:SRC_URI_prepend = "git://git.qemu.org/qemu.git"
> > meta/recipes-devtools/qemu/qemu_2.2.0.bb:10:SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> > $
> >
> >   there may be more, i just left it at that, not sure if there's
> > something magic about those examples or whether they really should
> > have the space added, so i'll leave it with someone else to tweak.

  not sure if i replied to this already, but if someone wants to tweak
those, i'll leave it up to them. obviously, as martin suggests,
they're not actually causing problems, but i'm just a style guide kind
of guy.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

