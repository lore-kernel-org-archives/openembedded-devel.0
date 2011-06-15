Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QWmHb-0007fq-LN
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 11:21:08 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB23.4emm.local ([::1]) with mapi; Wed, 15 Jun 2011 05:17:38 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] prelink: Added prelink-20100106, which works on ARM.
Thread-Index: AcwrOxC6qQMyGyBET7ODWtfFgEOJvQ==
Date: Wed, 15 Jun 2011 09:18:09 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02EAF4@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Wed, 15 Jun 2011 09:21:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jun 2011 22:20:18 -0500, Mark Hatle wrote:
> On 6/14/11 10:02 PM, Mark Hatle wrote:
> > Have you looked at:
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/
> >
> > As far as I'm aware, this version works properly for all of the expecte=
d
> > targets, including ARM.
> >
> > If it doesn't work, someone should submit a patch to the maintainer (me=
)
> and
> > we'll get things resolved.
> >
> > The Yocto prelinker contains both local (on-target) as well as cross-
> prelinking
> > support... (This is already integrated into oe-core)
>=20
> Forgot to note, look at the cross_prelink branch.  This is the head of tr=
ee for
> the embedded items.  The "master" is a mirror of the current SVN tree fro=
m
> Jakub
> Jelinek.
>=20
> The ld-linux... patch hunk is already there, and in a better shape then t=
he one
> proposed.  Both the ld-linux.so.2 and ld-linux.so.3 are supported.
>=20
> > --Mark

Hi,

Thanks for the link - looks like the right way to go. Would it be a waste o=
f time to copy
the oe-core prelink and elfutils to vanilla oe? I'm a little confused about=
 the relationship
between the two branches, and the status of oe-core. Should I be working wi=
th local
overlays, until things stabilise, or trying to push changes across?

James



