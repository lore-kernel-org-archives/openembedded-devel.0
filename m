Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lk8iP-0001HB-U3
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 04:14:48 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGQ002XOGYJG9N0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	18 Mar 2009 22:13:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F3E046B83A8; Wed,
	18 Mar 2009 23:13:30 -0400 (EDT)
Date: Wed, 18 Mar 2009 23:13:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20090319020125.GA27595@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090319031330.GB27595@denix.org>
MIME-version: 1.0
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BEF545.4040608@dls.net> <20090317192619.GA15734@denix.org>
	<f46da1cf0903181725y177da239y9970995168a677b7@mail.gmail.com>
	<20090319020125.GA27595@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier	agreement
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
X-List-Received-Date: Thu, 19 Mar 2009 03:14:51 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Mar 18, 2009 at 10:01:25PM -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 18, 2009 at 05:25:11PM -0700, Theodore A. Roth wrote:
> > On Tue, Mar 17, 2009 at 12:26 PM, Denys Dmytriyenko <denis@denix.=
org> wrote:
> > > On Mon, Mar 16, 2009 at 07:56:37PM -0500, Mike (mwester) wrote:
> > >>
> > >> Denys Dmytriyenko wrote:
> > >> > Renaming packages/ directory to recipes/, as one of the seve=
ral structural
> > >> > changes, was proposed by Koen[1] and agreed/approved by many=
. Since Koen
> > >> > currently doesn't have time/ability to do the change, and so=
me people are
> > >> > too eager to wait any longer, he asked me to do it. Please a=
ck/nack.
> > >>
> > >> Ack. =A0 But can you please tag the revision immediately prece=
eding the
> > >> commit of this change so we have some easy-to-reference point[=
*] in the
> > >> history?
> > >
> > > Done. mv-packages-to-recipes-pre and mv-packages-to-recipes-pos=
t are the tags
> > > applied right before and right after the change.
> > >
> >=20
> > Is the packages directory supposed to be empty now? There are sti=
ll a
> > few subdirs left:
> >=20
> >=20
> > roth@dorkboy:~/dev/OE/openembedded/packages$ ls -1
> > automake/
> > blueprobe/
> > busybox/
> > coreutils/
> > gnome/
> > gpe-gallery/
> > pkgconfig/
> > pyneo/
> > qt4/
> > udev/
>=20
> Those are empty directories (unless you have uncommited changes in =
them).=20
> That is because git only keeps track of files, not directories. A s=
imple=20
> rename of a single directory resulted in thousands of renames of in=
dividual=20
> files. When you did "git pull" all the files were moved, leaving th=
e old=20
> hierarchy empty. It should be safe to remove by "rm -r packages" - =
if there=20
> are still files there, rm will fail. And if you do a fresh "git clo=
ne", there=20
> will be no packages/ directory there.

Argh, the above "rm -r packages" is not safe, as it won't fail removi=
ng files.=20
Please use this command instead:
find packages -depth -type d -empty -exec rmdir {} \;

> > I will generate a patch to the usermanual to note the new recipes
> > directory.
>=20
> Thanks for taking care of the documentation.
>=20
> > I am curious is the old packages will still be kept around
> > or if it will be completely removed. If kept, how would it be
> > described versus the recipes dir?
>=20
> Now recipes/ directory name represents its contents. Packages are n=
ormally=20
> generated by running/processing recipes. But they are placed inside=
 DEPLOY_DIR=20
> and I'm not sure there is any need in packages/ directory in the re=
pository.

--=20
Denys



