Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SChiP-0004Sf-7C
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 03:30:21 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1K005UDJMM0880@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	27 Mar 2012 19:20:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C183B201F9; Tue,
	27 Mar 2012 20:20:46 -0400 (EDT)
Date: Tue, 27 Mar 2012 20:20:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CAMKF1srMQNAREe-ttJR1bH-gfG1LLRZ04o8L2L_YtxZJPxJd1Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120328002046.GB17470@denix.org>
MIME-version: 1.0
References: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
	<1332853398-9501-4-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1srMQNAREe-ttJR1bH-gfG1LLRZ04o8L2L_YtxZJPxJd1Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 4/4] obexd: fix QA warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 01:30:21 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Mar 27, 2012 at 02:39:24PM -0700, Khem Raj wrote:
> On Tue, Mar 27, 2012 at 6:03 AM, Andreas M??ller
> <schnitzeltony@googlemail.com> wrote:
> > +do_install_append() {
> > + =A0 =A0# remove empty plugins dir
> > + =A0 =A0rm -rf ${D}${libdir}
> > +}
> > +
>=20
> can you use use rmdir instead so it gets flagged when the dir
> is not empty ?

Can we instead create obex-plugins in PACKAGES, even if it's empty no=
w?

--=20
Denys



