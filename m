Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPvPT-00020q-CL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 11:04:10 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPvNX-00080p-TI
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:02:08 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u5qvzljcmn1qzu@guohr-laptop-ubuntu>
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<200912300930.12895.holger+oe@freyther.de>
	<op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
	<1262164637.2553.6.camel@lenovo.internal.reciva.com>
	<op.u5qu12iemn1qzu@guohr-laptop-ubuntu>
	<1262165510.2553.9.camel@lenovo.internal.reciva.com>
	<op.u5qvzljcmn1qzu@guohr-laptop-ubuntu>
Date: Wed, 30 Dec 2009 10:02:05 +0000
Message-ID: <1262167325.2553.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 10:04:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can't just rename DISTROs arbitrarily like that since all the
overrides will go wrong.  I think most or all of your build failures are
probably due to your "micro-eglibc" distro being neither one thing or
another.

Please try building with DISTRO=3Dmicro (and not anything else that you
believe to be equivalent) and see if your situation improves.

p.

On Wed, 2009-12-30 at 17:43 +0800, Guo Hongruan wrote:
> There are lots of failure buildings due to the problem of base-file =20
> packages which I have not enumerated in my previous email.
>=20
> By the way, I have renamed the micro.conf to micro-eglibc.conf locally, s=
o =20
> that I can get to know which type of libc the distribution is using. so =20
> the micro-eglibc.conf is just the same as micro.conf in git tree.
>=20
> =E5=9C=A8 Wed, 30 Dec 2009 17:31:50 +0800=EF=BC=8CPhil Blundell <philb@gn=
u.org> =E5=86=99=E9=81=93:
>=20
> > On Wed, 2009-12-30 at 17:23 +0800, Guo Hongruan wrote:
> >> =E5=9C=A8 Wed, 30 Dec 2009 17:17:17 +0800=EF=BC=8CPhil Blundell <philb=
@gnu.org> =E5=86=99=E9=81=93:
> >>
> >> > On Wed, 2009-12-30 at 16:36 +0800, Guo Hongruan wrote:
> >> >> The micro/micro-uclibc specific check does cause the miss of the
> >> >> /etc/default directory, which is required by the following =20
> >> installation.
> >> >> So the installation of base-file failed when DISTRO=3Dmicro or
> >> >> DISTRO=3Dmicro-uclibc.
> >> >
> >> > Can you give any more details of the problem you are trying to solve=
?
> >> > Which exact installation step requires /etc/default?
> >> >
> >>
> >> See the following for details:
> >>
> >>
> >> http://tinderbox.openembedded.net/packages/392296/
> >> http://tinderbox.openembedded.net/packages/391393/
> >
> > Ah, I see.  So, it would appear that you are actually using
> > "DISTRO=3Dmicro-eglibc", rather than the micro and micro-uclibc that yo=
u
> > mentioned above.
> >
> > That DISTRO is not in the org.openembedded.dev tree so I can't test wit=
h
> > it but, if you want to stick with that setting, I would guess that you
> > probably need to modify the ${DISTRO} conditional that wraps the
> > relevant lines of the base-files do_install() method so that it
> > recognises micro-eglibc as a synonym for micro.
> >
> > p.
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20




