Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9588870F28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 04:43:56 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so9521085lan.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BELd6vnaqFpA3wM9tf+EnaAKmI6DFq1yc2NdGCskG8s=;
	b=O1vQ0JL0w0etRKHRPWHQxZq7szT4OEp7Pk5Ut2cXdEkjtlj5DXF8pLoFdu5ArY24PE
	5LaovGaegwsdmskz1rCIqzWXvDz8y5s0UAuNc6IHBn2nfRFNOuPL5Q4ASuzS2vOZEYVC
	lEg8nJCsJkLTNiToIudbAVNwH9ZHjAjlVfjPahCH1t5nD5R8dqB/OROZqNT7Abq0xx6p
	HVo4IiYRQPKRmoXGDBRHOC2zek4p0WgOrYPxY7y+S8Af8XYYR78la9bzIk9ln6BdKASZ
	/Sng04u9R4mP4wvUA/bw+onr/YKApzFXkASOVcCGLAGfd4DT4jwcCkQDrSqUU1Ppk85z
	H6Xw==
MIME-Version: 1.0
X-Received: by 10.112.159.164 with SMTP id xd4mr2454042lbb.8.1408682636781;
	Thu, 21 Aug 2014 21:43:56 -0700 (PDT)
Received: by 10.25.209.81 with HTTP; Thu, 21 Aug 2014 21:43:56 -0700 (PDT)
In-Reply-To: <20140821194854.GC3660@jama>
References: <20140821194854.GC3660@jama>
Date: Thu, 21 Aug 2014 21:43:56 -0700
Message-ID: <CANx9H-DpsQYFOAVLNG5uA2GUbowNMXMFQjqvVkD_gP=ku9hoqw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Patchwork almost clean again, but please check this list for your own changes
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
X-List-Received-Date: Fri, 22 Aug 2014 04:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2014 at 12:48 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Following changes are still pending in master-next with unresolved
> review comments:
> pick d7060f9 mplayer2: Inherit python3native
> pick 9fdb2f2 tcpslice: add recipe under tcpdump
> pick 00f8bee openldap: upgrade to 2.4.39
> pick bf9eb0b add support for opendataplane
> pick a086815 Revert "add support for opendataplane"
> pick 8cf585c xbmc: Update to v13.1
>

My WIP xbmc-13.2 _builds_, but segfaults in qemuarm:
 http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/xbmc-1=
3.2

The error before segfault is something about not being able to create GUI.
If somebody can remind me how to get a logfile out of qemu I will pastebin
it.

I won't submit a patch until it actually runs.

 --Tim

These are just new and waiting for verification build:
> pick 64ee587 ltp-ddt: update to the latest rev, bump the version
> pick f921a54 webmin: uprev from 1.620 to 1.700
> pick ac6f3ef samba: upgrade to 3.6.24
> pick ee32750 lmbench: use BPN instead of PN
> pick 77a10b9 oscam: fixed QA issue where binary was being stripped
> pick 5881aa5 python-pyparted: Add recipe
> pick 6272b4d lmbench: remove debianutils from RDEPENDS and add perl
>
> Few more are in master-next bundle on patchwork
> http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3Dboth
>
> Old reviews also with unresolved review comments:
> [meta-multimedia,1/2] xbmc: first try at making it build for non-GLES
> platforms 2013-03-11      Koen Kooi               New
> [meta-multimedia,2/2] xbmc: add patch to make 'ld-is-gold' work with
> configure  2013-03-11      Koen Kooi               New
> [meta-gnome,2/2] libnotify: update to 0.7.5 and drop libnotify3
> 2013-04-17      Andreas M=C3=BCller          New
> [v2] packagekit: Updated to 0.8.13      2013-12-16 eu@felipetonello.com
>        New
> [meta-oe,2/2] libsdl-image: Add support for libsdl-image-native
>
> If you recognize one of these, please update its status.
>
> Just to refresh the memory, here is how the patches are maintained in
> patchwork, I would appreciate more people updating status of their own
> changes:
>
> On Wed, Jan 16, 2013 at 12:49:02AM +0100, Martin Jansa wrote:
> > On Fri, Dec 14, 2012 at 12:05:07PM +0100, Martin Jansa wrote:
> > > On Fri, Dec 14, 2012 at 12:20:58AM +0100, Martin Jansa wrote:
> > >
> > > Can we fix patchwork to show bundles marked as public to public users=
?
> > >
> > > I've few bundles
> > > Name        Project Public Link     Patches Download        Delete
> > > in-test             oe
> http://patches.openembedded.org/bundle/jama/in-test/    21
> > > oe-classic  oe
> http://patches.openembedded.org/bundle/jama/oe-classic/ 61
> > > oe-classic-lic      oe
> http://patches.openembedded.org/bundle/jama/oe-classic-lic/     70
> > > 2011.03-maintenance oe
> http://patches.openembedded.org/bundle/jama/2011.03-maintenance/        1
> > > denzil              oe
> http://patches.openembedded.org/bundle/jama/denzil/     6
> > > danny               oe
> http://patches.openembedded.org/bundle/jama/danny/      5
> > > meta-handheld       oe
> http://patches.openembedded.org/bundle/jama/meta-handheld/      1
> > > meta-java   oe
> http://patches.openembedded.org/bundle/jama/meta-java/  15
> > > meta-opie   oe
> http://patches.openembedded.org/bundle/jama/meta-opie/  1
> > >
> > > But without sharing link to bundle, nobody will find it (AFAIK) maybe
> > > there is newer version of Patchwork which shows public bundles
> > > somewhere?
> > >
> > > oe-classic bundle is now marked as archived - so not listed by defaul=
t.
> > > oe-classic-lic also marked as archived and I'll apply it later today.
> > >
> > > It would be great if we agree to mark patches as archived when they
> get assigned
> > > to some bundle to keep main patchwork list relatively clean and
> layer/release
> > > maintainers can still see all patches with "New" state in
> corresponding bundle.
> > >
> > > I've also marked some patches with review comments without reply as
> > > "Changes requested" + archived. Pity that some patches had rather
> > > trivial issues, but submitter never responded with v2..
> > >
> > > And there were some patches for oe-core already applied in oe-core.. =
so
> > > marked as "Not applicable" + archived.
> >
> > Andrea just asked about this, so if someone missed this information:
> >
> > There are some bundles:
> > 2011.03-maintenance oe
> http://patches.openembedded.org/bundle/jama/2011.03-maintenance/        1
> > danny         oe      http://patches.openembedded.org/bundle/jama/danny=
/
>                     9
> > denzil                oe
> http://patches.openembedded.org/bundle/jama/denzil/                     1=
0
> > in-test               oe
> http://patches.openembedded.org/bundle/jama/in-test/
> 161
> > meta-browser  oe
> http://patches.openembedded.org/bundle/jama/meta-browser/               7
> > meta-handheld oe
> http://patches.openembedded.org/bundle/jama/meta-handheld/              2
> > meta-initramfs        oe
> http://patches.openembedded.org/bundle/jama/meta-initramfs/             1
> > meta-java     oe
> http://patches.openembedded.org/bundle/jama/meta-java/                  1=
5
> > meta-kde      oe
> http://patches.openembedded.org/bundle/jama/meta-kde/                   1
> > meta-networking       oe
> http://patches.openembedded.org/bundle/jama/meta-networking/            1=
2
> > meta-opie     oe
> http://patches.openembedded.org/bundle/jama/meta-opie/                  2
> > meta-systemd  oe
> http://patches.openembedded.org/bundle/jama/meta-systemd/               2=
5
> > meta-webserver        oe
> http://patches.openembedded.org/bundle/jama/meta-webserver/             2
> > oe-classic    oe
> http://patches.openembedded.org/bundle/jama/oe-classic/                 6=
2
> > oe-classic-lic        oe
> http://patches.openembedded.org/bundle/jama/oe-classic-lic/             7=
0
> >
> > I'm adding patches to right bundle when I'm sorting patches to
> > test them on jenkins (in-test bundle, contrib/jansa/in-test branch).
> >
> > In the process I'm marking them as "Archived" (to see what's not sorted
> in main page),
> > but because their state stays "New" you can still find them in bundles,
> e.g.
> > http://patches.openembedded.org/bundle/jama/meta-webserver/?archive=3Db=
oth
> >
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

