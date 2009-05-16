Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M5PI6-0007Rc-DF
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 21:11:26 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJR00BFH3MNHWFB@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	16 May 2009 14:04:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0FC8F14AF5D; Sat,
	16 May 2009 15:03:59 -0400 (EDT)
Date: Sat, 16 May 2009 15:03:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090516190358.GA2564@denix.org>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
	<20090506223838.GA15339@denix.org>
	<1241678721.23982.71.camel@lenovo.internal.reciva.com>
	<4A033076.1080604@cbnco.com>
	<b6ebd0a50905151521v725c075dxabc2e2f20c51a327@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <b6ebd0a50905151521v725c075dxabc2e2f20c51a327@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be overridden using	GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Sat, 16 May 2009 19:11:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline
Content-transfer-encoding: quoted-printable

On Fri, May 15, 2009 at 03:21:03PM -0700, Chris Larson wrote:
> On Thu, May 7, 2009 at 12:03 PM, Michael Smith <msmith@cbnco.com> wrote:
> [snip]
> > My grub_0.97.bb could reference file://some.patch in its SRC_URI and bi=
tbake
> > could look in the next COLLECTION after failing to find it in the local=
 one.
> > In fact, I wouldn't even really need a bbfile in the overlay; just havi=
ng
> > files/menu.lst in the overlay could be enough to replace it. I guess th=
is
> > might just require some fudging to how FILESPATH is set up in base.bbcl=
ass.
>=20
> This piece is covered relatively easily by manipulating FILESPATHBASE.
>=20
> > Second, if a recipe could include a recipe of the same name and let bit=
bake
> > search for it in the next COLLECTION, overlay packages could get a lot
> > smaller. Say I need to add a private patch to grub -- my overlay
> > grub_0.97.bb, if I had one, could just look like this:
>=20
> This piece I believe I have a solution for.  I just wrote a 15 line
> .inc file that when loaded in a .conf, automatically searches any
> recipe's FILESPATH for an amend.inc, and if it exists, parses that in
> after the recipe itself is parsed, so you can amend the recipe with
> tweaks and things at the end of the parse.  So this coupled with the
> aforementioned FILESPATHBASE alterations and you should be able to
> supply overlay specific changes to a recipe without having to copy the
> recipe itself into the overlay.

Chris,

You are on the roll! This is another very welcomed feature for anyone who=
=20
manages overlays. Thanks!

--=20
Denys


