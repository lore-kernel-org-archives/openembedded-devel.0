Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QCUYE-000224-EN
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 12:22:26 +0200
Received: from koontz.localnet ([10.115.0.175]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 20 Apr 2011 12:24:04 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 12:19:22 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <201104201007.04378.sgh@sgh.dk>
	<1303292840.3979.20.camel@mattotaupa>
In-Reply-To: <1303292840.3979.20.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104201219.22239.sgh@sgh.dk>
X-OriginalArrivalTime: 20 Apr 2011 10:24:05.0000 (UTC)
	FILETIME=[13311080:01CBFF45]
Subject: Re: Please pull 'wvstreams-fixes' of http://sgh.dk/~sgh/oe.git
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
X-List-Received-Date: Wed, 20 Apr 2011 10:22:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hej Paul

The server should be responding now.

I added the compiler error to the commit and changed the branchname.

You could consider to do :
$ git fetch http://sgh.dk/~sgh/oe.git wvstreams-fixes

the fetched HEAD will then end in the FETCH_HEAD refname.

Onsdag 20 april 2011 11:47:20 skrev Paul Menzel:
> Dear S=F8ren,
>=20
>=20
> thank you for your patch.
>=20
> Unfortunately
>=20
>         $ git remote add wvstream http://sgh.dk/~sgh/oe.git
>         $ git fetch wvstream # lasts forever/times out
>=20
> does not work.
>=20
> Naming the branch descriptively, for example =BBwvstream-fix=AB would also
> help in my opinion.
>=20
> Am Mittwoch, den 20.04.2011, 10:07 +0200 schrieb S=F8ren Holm:
> > commit 59c811aaebd84424451058f019aaa32c257e4fc1
> > Author: S=F8ren Holm <soeren.holm@mikrofyn.com>
> > Date:   Wed Apr 20 09:48:43 2011 +0200
> >=20
> >     wvstreams: Added patch to fix compilation.
>=20
> Please add an excerpt from the error message to the commit message.
>=20
> | ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const=
':
> | ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer
> | will break strict-aliasing rules ipstreams/wvunixdgsocket.cc: In
> | constructor 'WvUnixDGSocket::WvUnixDGSocket(const WvFastString&, bool,
> | int)': ipstreams/wvunixdgsocket.cc:50:32: error: 'chmod' was not
> | declared in this scope make: *** [ipstreams/wvunixdgsocket.o] Error 1
> |=20
> >  .../files/0001-Fixed-missing-header-includes.patch |   37
> >=20
> > ++++++++++++++++++++
>=20
> please turn off line wrapping for pasted sections.
>=20
> >  recipes/wvstreams/wvstreams_4.6.bb                 |    1 +
> >  2 files changed, 38 insertions(+), 0 deletions(-)
>=20
> Could next time, please also send the patches to the list. This way, our
> patch queue Patchwork [1] can keep track of it. There should be some
> kind of option.
>=20

=2D-=20
S=F8ren Holm


