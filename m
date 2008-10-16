Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jluebbe@lasnet.de>) id 1KqOLv-0000Xh-4Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 10:37:03 +0200
Received: from a061.apm.etc.tu-bs.de ([134.169.172.61])
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KqOGq-0002r6-8a by authid <jluebbe@lasnet.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2008 10:31:51 +0200
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jluebbe@lasnet.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224084046.5189.75.camel@ted>
References: <1223989999.29816.56.camel@polaris>
	<1223990240.29816.58.camel@polaris>  <1224062879.5189.49.camel@ted>
	<1224078120.3653.40.camel@localhost>  <1224084046.5189.75.camel@ted>
Date: Thu, 16 Oct 2008 10:31:51 +0200
Message-Id: <1224145911.31453.44.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: please check BK&MTN to GIT conversion dry-run repository
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
X-List-Received-Date: Thu, 16 Oct 2008 08:37:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2008-10-15 at 16:20 +0100, Richard Purdie wrote:
> On Wed, 2008-10-15 at 15:42 +0200, Jan L=C3=BCbbe wrote:
> > On Wed, 2008-10-15 at 10:27 +0100, Richard Purdie wrote:
> > > The original plan was to add the BKCVS later as a git tree graft rath=
er
> > > than hardcoding it into the history now in a broken form. Is it too l=
ate
> > > to do this now?
> >=20
> > It is not possible to change history in git without changing the commit
> > hashes. (so a "graft" is impossible without rebasing)
>=20
> It is possible, you just do something like:
>=20
> echo "$commit-id $graft-id" >> .git/info/grafts
>=20
> which then adds some history to the start of the tree. Look up git tree
> grafts and you'll find further information about this feature.

Oh, this is new to me :/ When i talked about importing BK history with
Holger he didn't seem to have any doubts.

> > > The BKCVS conversion still has the problems I wanted to get resolved
> > > before we did this for example:
> > >=20
> > > http://git.sicherheitsschwankung.de/?p=3Djan/oetest.git;a=3Dcommit;h=
=3D66944efa040bdf36062522c7c33413fc1e039d83
> > >=20
> > > Where two commits have been rolled into one.
> >=20
> > I tried to figure out how to solve this, but ran out of time. Adding th=
e
> > (somewhat mangled) bk history now doesn't have any disadvantages=20
>=20
> It does since we can't now add a correct version at a later date using a
> tree graft.

From what i just read about grafts, it will replace the parent
information for the specified commit. So we could still replace the
current BK import with the correct one.

Grafts are local only though.

> > and
> > still allows to find ot where the files come from. If someone figures
> > out how to do a better conversion, we can still rebase, it that is
> > desired.
>=20
> No, we don't want to ever rebase. I'd much prefer we had a graft for
> that point in time so we can just replace the history as and when we
> come up with a better version.

We could import BK again (correctly) into a separate branch and then
document how to graft it to instead of the current stuff.

--=20
Jan L=C3=BCbbe <jluebbe@lasnet.de>            http://sicherheitsschwankung.=
de
 gpg-key      1024D/D8480F2E 2002-03-20
 fingerprint  1B25 F91F 9E7B 5D4F 1282  02D6 8A83 8BE4 D848 0F2E



