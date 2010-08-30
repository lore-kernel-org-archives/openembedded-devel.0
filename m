Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OqDMU-0004Cd-8T
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 01:01:59 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7Z005TPJT7LFI3@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	30 Aug 2010 17:00:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DF3CF14AF64; Mon,
	30 Aug 2010 18:00:42 -0400 (EDT)
Date: Mon, 30 Aug 2010 18:00:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTimnfsHbd0sWxGLBfawD9w5M4OLGWbH_gN6_9T-h@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100830220042.GC14561@denix.org>
MIME-version: 1.0
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-6-git-send-email-raj.khem@gmail.com>
	<i5dap0$v2$2@dough.gmane.org>
	<AANLkTimnfsHbd0sWxGLBfawD9w5M4OLGWbH_gN6_9T-h@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/23] meta-toolchain-arago-dvsdk.bb: Exclude from	world build.
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
X-List-Received-Date: Mon, 30 Aug 2010 23:01:59 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Sun, Aug 29, 2010 at 11:20:24AM -0700, Khem Raj wrote:
> On Sun, Aug 29, 2010 at 2:54 AM, Koen Kooi <k.kooi@student.utwente.=
nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 28-08-10 22:24, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> =A0recipes/meta/meta-toolchain-arago-dvsdk.bb | =A0 =A01 +
> >> =A01 files changed, 1 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/recipes/meta/meta-toolchain-arago-dvsdk.bb b/recipe=
s/meta/meta-toolchain-arago-dvsdk.bb
> >> index 8e5b233..6deb2bc 100644
> >> --- a/recipes/meta/meta-toolchain-arago-dvsdk.bb
> >> +++ b/recipes/meta/meta-toolchain-arago-dvsdk.bb
> >> @@ -1,3 +1,4 @@
> >> +EXCLUDE_FROM_WORLD =3D "1"
> >> =A0TOOLCHAIN_HOST_TASK =3D "task-arago-toolchain-dvsdk-host"
> >> =A0TOOLCHAIN_TARGET_TASK =3D "task-arago-toolchain-dvsdk-target"
> >>
> >
> > NAK, you're not saying why this needs to get excluded from world,=
 it
> > seems to build fine over here.
>=20
> Does not parse for me.
>=20
> NOTE: Runtime target 'ti-xdctools-sdk' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['ti-xdctools-sdk']
> NOTE: Runtime target 'task-arago-toolchain-dvsdk-host' is unbuildab=
le,
> removing...
> Missing or unbuildable dependency chain was:
> ['task-arago-toolchain-dvsdk-host', 'ti-xdctools-sdk']
> ERROR: Required build target 'meta-toolchain-arago-dvsdk' has no
> buildable providers.
> Missing or unbuildable dependency chain was:
> ['meta-toolchain-arago-dvsdk', 'task-arago-toolchain-dvsdk-host',
> 'ti-xdctools-sdk']
>=20
> What provides ti-xdctools-sdk in your case ?
>=20
> hmm if you see sdk.bbclass then you will see that it demands the
> recipes inheriting from it to be
> excluded from build it being sdk I just excluded it.

Koen, Khem,

meta-toolchain-arago-dvsdk (and corresponding ti-<blah>-sdk.bb recipe=
s) were=20
used by legacy dvsdk builds early on and never got merged into OE. Mo=
reover,=20
the legacy dvsdk support was deprecated even in the mainline Arago...
As we don't have necessary ti-<blah>-sdk.bb recipes, this meta recipe=
 can=20
safely be excluded from world or even removed completely.

--=20
Denys



