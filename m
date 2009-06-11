Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MEjCS-0006Pf-IT
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 14:16:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id BCCB1140972D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 14:07:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PK3M9UmZCzZ3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 14:07:10 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id A197A140972B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 14:07:10 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244402413.4151.36.camel@lenovo.internal.reciva.com>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
Date: Thu, 11 Jun 2009 14:06:18 +0200
Message-Id: <1244721978.28486.107.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Subject: Re: e2fsprogs-libs failed	on	latest	org.openembedded.dev	branch
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
X-List-Received-Date: Thu, 11 Jun 2009 12:16:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> On Sun, 2009-06-07 at 21:13 +0200, Stanislav Brabec wrote:
> > 1. This path apparently mixes path elements defined by two different
> > recipes. I was under impression, that there exists some type of
> > unintended =EF=BB=BFcv_libdir inheritance between these two recipes. =
Maybe my
> > impression was incorrect, but
>=20
> There certainly shouldn't be any such inheritance.  If there is, that's
> a bug and we should fix it.
>=20
> > 2. After applying of this patch, I did not see this error any more.
> > I even tested rebuild from scratch with no error. And finally
>=20
> I suspect that was probably just coincidence.  This bug seems to be
> somewhat intermittent; I don't know exactly what's causing it, and it's
> never actually happened for me, but (re)building things in a different
> order seems to clear it up.

I can confirm it. It appeared again.

But it really looks like a cross package inheritance:

bitbake -v x11-image
fails

Let's try it separately:

bitbake -v e2fsprogs-libs
fails

Now I do following work-around, which allows me to continue:

bitbake -v util-linux-ng
succeeds

rm -rf tmp/{stamps/*,work/*,deploy/*/pstage/*}/*e2fsprogs-libs*
bitbake -v e2fsprogs-libs
Wow, it successds!

bitbake -v x11-image
It successds as well!

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



