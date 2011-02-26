Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PtPOQ-0000kV-J7
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 20:01:26 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id B1FEF1D360AA; Sat, 26 Feb 2011 19:59:59 +0100 (CET)
Date: Sat, 26 Feb 2011 19:59:59 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110226185959.GC10042@ibawizard.net>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<1298745578.3818.7.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1298745578.3818.7.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to	fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 19:01:26 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Phil Blundell <philb@gnu.org> [2011-02-26 18:39:38]:

> On Sat, 2011-02-26 at 18:44 +0100, Petr =A9tetiar wrote:
> > cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
>=20
> Are you really using POSIX.1e caps on micro?  If yes then I guess this
> is fine, though it would be interesting to know what the code size
> impact is.

I don't use micro at all, I've just added it as another test target for
2011.03 release and the build of console-image failed on libcap2 so I've =
tried
to fix it. That's all behind it.

-- ynezz


