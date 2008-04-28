Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JqbfR-0008BZ-Ek
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 00:17:49 +0200
X-ASG-Debug-ID: 1209421033-512f001a0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id DBEA64EBC6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 17:17:13 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 63zHJphGB8SGWYkb for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 17:17:13 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Mixed up STAGING_INCDIR's in uclibc.inc?
Date: Mon, 28 Apr 2008 17:17:32 -0500
User-Agent: KMail/1.9.7
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
In-Reply-To: <200804282349.46539.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200804281717.33209.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1209421033
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 22:17:49 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 28 April 2008 04:49:46 pm Holger Freyther wrote:
> On Monday 28 April 2008 21:51:05 Geoffrey Wossum wrote:

> > I think the problem is the following line in packages/uclibc/uclibc.inc:
> > EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} 'CC=3D${CC}'
> > HOSTCFLAGS=3D'-I${STAGING_INCDIR}'"
> >
> > Seems to me like that should be STAGING_INCDIR_NATIVE instead of
> > STAGING_INCDIR.  If I make that change, then everything works again.
> >
> > Does this seem correct?
>
> hmm, in autoconf terminology host is:
> "  --host=3DHOST       cross-compile to build programs to run on HOST
> [BUILD]"
>
> if uclibc has the same terminology your patch is wrong, I don't know it
> though.

Ah, autotools, my old nemesis.  How have you been?  This new plot of yours =
to=20
corrupt projects which don't use you by confusing people is indeed fiendish=
=2E =20
But then, I would expect no less of such a worthy adversary.

uClibc uses Kconfig/kbuild, which uses HOST to mean the machine we are=20
currently building on. =20

=46rom linux/Documentation/kbuild/makefiles.txt:
Kbuild supports building executables on the host for use during the
compilation stage.

Yes, it is very confusing.=20

=2D--
Geoffrey


