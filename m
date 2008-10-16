Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KqPQT-000352-Ry
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 11:45:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9G9eWGJ024385
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 10:40:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24157-07 for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 10:40:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9G9eAe1024358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 10:40:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224145911.31453.44.camel@localhost>
References: <1223989999.29816.56.camel@polaris>
	<1223990240.29816.58.camel@polaris>  <1224062879.5189.49.camel@ted>
	<1224078120.3653.40.camel@localhost>  <1224084046.5189.75.camel@ted>
	<1224145911.31453.44.camel@localhost>
Date: Thu, 16 Oct 2008 10:39:55 +0100
Message-Id: <1224149995.1603.8.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m9G9eWGJ024385
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
X-List-Received-Date: Thu, 16 Oct 2008 09:45:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-10-16 at 10:31 +0200, Jan L=C3=BCbbe wrote:
> Oh, this is new to me :/ When i talked about importing BK history with
> Holger he didn't seem to have any doubts.

I thought I'd made the idea of using a graft for this clear but
obviously not :(.

> >From what i just read about grafts, it will replace the parent
> information for the specified commit. So we could still replace the
> current BK import with the correct one.
>=20
> Grafts are local only though.

They won't get passed through a git clone? I guess that isn't a problem
as long as we do this on the master repository and document it.

> > > and
> > > still allows to find ot where the files come from. If someone figur=
es
> > > out how to do a better conversion, we can still rebase, it that is
> > > desired.
> >=20
> > No, we don't want to ever rebase. I'd much prefer we had a graft for
> > that point in time so we can just replace the history as and when we
> > come up with a better version.
>=20
> We could import BK again (correctly) into a separate branch and then
> document how to graft it to instead of the current stuff.

It is now too late to rebuild the tree without the BKCVS information?
I'd prefer not to have the wrong information hanging around if at all
possible.

Cheers,

Richard



