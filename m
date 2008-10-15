Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Kq8GZ-0007bF-Cx
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 17:26:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9FFLJ28001396
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 16:21:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01266-04 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 16:21:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9FFKqoo001366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 16:21:01 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224078120.3653.40.camel@localhost>
References: <1223989999.29816.56.camel@polaris>
	<1223990240.29816.58.camel@polaris>  <1224062879.5189.49.camel@ted>
	<1224078120.3653.40.camel@localhost>
Date: Wed, 15 Oct 2008 16:20:46 +0100
Message-Id: <1224084046.5189.75.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m9FFLJ28001396
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
X-List-Received-Date: Wed, 15 Oct 2008 15:26:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2008-10-15 at 15:42 +0200, Jan L=C3=BCbbe wrote:
> On Wed, 2008-10-15 at 10:27 +0100, Richard Purdie wrote:
> > The original plan was to add the BKCVS later as a git tree graft rath=
er
> > than hardcoding it into the history now in a broken form. Is it too l=
ate
> > to do this now?
>=20
> It is not possible to change history in git without changing the commit
> hashes. (so a "graft" is impossible without rebasing)

It is possible, you just do something like:

echo "$commit-id $graft-id" >> .git/info/grafts

which then adds some history to the start of the tree. Look up git tree
grafts and you'll find further information about this feature.

> > The BKCVS conversion still has the problems I wanted to get resolved
> > before we did this for example:
> >=20
> > http://git.sicherheitsschwankung.de/?p=3Djan/oetest.git;a=3Dcommit;h=3D=
66944efa040bdf36062522c7c33413fc1e039d83
> >=20
> > Where two commits have been rolled into one.
>=20
> I tried to figure out how to solve this, but ran out of time. Adding th=
e
> (somewhat mangled) bk history now doesn't have any disadvantages=20

It does since we can't now add a correct version at a later date using a
tree graft.

> and
> still allows to find ot where the files come from. If someone figures
> out how to do a better conversion, we can still rebase, it that is
> desired.

No, we don't want to ever rebase. I'd much prefer we had a graft for
that point in time so we can just replace the history as and when we
come up with a better version.

Cheers,

Richard



