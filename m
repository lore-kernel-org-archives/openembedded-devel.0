Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SIR1Q-0001Z4-R1
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 22:53:40 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id B57EDEA040;
	Thu, 12 Apr 2012 23:00:44 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 4C9CA60FCC; Thu, 12 Apr 2012 22:44:17 +0200 (CEST)
Date: Thu, 12 Apr 2012 22:44:17 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120412204417.GD3256@hermes>
References: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
	<20120411125503.GB3637@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120411125503.GB3637@jama.jama.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Thu, 12 Apr 2012 20:53:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 11-Apr-12, Martin Jansa a =E9crit:
> On Wed, Apr 11, 2012 at 11:46:32PM +0200, Apelete Seketeli wrote:
> > This updates SRC_URI as the svn.openmoko.org repository is now down.
> > All the changes of this patch were picked from oe-core and brought
> > over.
> >=20
> > Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> > ---
> >  .../opkg-utils/opkg-utils/add-license-field.patch  |   39 ++++++++++=
+++++++
> >  .../opkg-utils/arfile_header_split.patch           |   10 +++++
> >  .../opkg-utils/index-ignore-filenotfound.patch     |   19 ++++++++
> >  recipes/opkg-utils/opkg-utils/mtime-int.patch      |    3 ++
> >  recipes/opkg-utils/opkg-utils/shebang.patch        |   46 ++++++++++=
++++++++++
> >  recipes/opkg-utils/opkg-utils_git.bb               |   31 ++++++++++=
+++
> >  recipes/opkg-utils/opkg-utils_svn.bb               |   27 ----------=
--
> >  7 files changed, 148 insertions(+), 27 deletions(-)
> >  create mode 100644 recipes/opkg-utils/opkg-utils/add-license-field.p=
atch
> >  create mode 100644 recipes/opkg-utils/opkg-utils/shebang.patch
> >  create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
> >  delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb
>=20
> All those patches were sent as git patches for git.yoctoproject.org.. s=
o=20
> you can ping yocto ML to apply them sooner then after 1.2 release to ma=
ke this patch
> a bit smaller :).
>=20
> See
> https://lists.yoctoproject.org/pipermail/yocto/2012-March/007851.html

Sorry for the giant patch, I wasn't sure if I should split it since
the patch files in the commit are needed for the recipe to work.

Concerning the patches sent to the yocto ML, we may have a
misunderstanding here.
This patch I sent is picked from oe-core and I would like someone to
review it and ultimately apply it to *oe-classic* (I need it for the
jlime distribution, which is only available in oe-classic for now).
It seemed to me that the yocto project is based on oe-core, so I don't
understand why I should get in touch with them to get some part of the
changes applied on their side (of oe-core, if I am not mistaken).

I probably missed some point you were trying to make, could you tell
me how to get this into oe-classic ?

Regards.
--=20
        Apelete


