Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SDIY3-0004Ty-FO
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 18:50:07 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1N0053JKUUTTX0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	29 Mar 2012 10:40:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0237A200AB; Thu,
	29 Mar 2012 11:40:05 -0400 (EDT)
Date: Thu, 29 Mar 2012 11:40:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20120329134519.GL4004@jama.jama.net>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120329154005.GF17470@denix.org>
MIME-version: 1.0
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
	<082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
	<3065bcbfb2b5c24a3e316375b0afbedadf265665.1333002899.git.Martin.Jansa@gmail.com>
	<CAAQYJAts20KyLfPtXY3wUCd8R9awthfsPue+sbw6UuWcuujW0g@mail.gmail.com>
	<20120329134519.GL4004@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-handheld][PATCH 2/2] recipes-kernel: use shared linux.inc from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 16:50:07 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Thu, Mar 29, 2012 at 03:45:19PM +0200, Martin Jansa wrote:
> On Thu, Mar 29, 2012 at 11:52:15AM +0200, Andrea Adami wrote:
> > On Thu, Mar 29, 2012 at 8:35 AM, Martin Jansa <martin.jansa@gmail=
.com> wrote:
> > > * notice that ARM_KEEP_OABI default value is now 0 instead of 1
> > > =A0but only linux-hackndev and linux-handhelds-2.6-2.6.21 had
> > > =A0CONFIG_OABI_COMPAT=3Dy in defconfigs so this shouldn't chang=
e anything
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> >=20
> > Martin,
> >=20
> > I have some concerns here, because I don't think meta-handeld sho=
uld
> > depend on meta-oe.
> > (I know udev .bbappend requires it now but talking with Paul we f=
ound
> > a better solution and udev will disappear from layer soon).
>=20
> Denis wanted linux.inc also in some smaller layer then meta-oe, so =
maybe
> we can create meta-bsp-support in meta-opememebedded repository and=
 move
> it there?
>=20
> Having linux.inc copy for each BSP is wrong.

Remind me, what was the reason to have linux.inc as a separate file i=
n the=20
first place? I mean, can we roll it back to kernel.bbclass in OE-Core=
? If not,=20
maybe it would be easier to push it as is to OE-Core, since it's much=
 cleaner=20
now?

--=20
Denys



