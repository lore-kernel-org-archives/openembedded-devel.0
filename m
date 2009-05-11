Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1M3eEP-0001rf-T7
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 00:44:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4BMblnP016368
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 23:37:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16247-03 for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 23:37:43 +0100 (BST)
Received: from [192.168.1.30] (dynamic0.rpnet.com [192.168.1.30])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4BMbdHI016362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 23:37:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200905111619.42187.marcin@juszkiewicz.com.pl>
References: <4A07EE70.2010408@gmx.net>
	<200905111619.42187.marcin@juszkiewicz.com.pl>
Date: Mon, 11 May 2009 23:37:38 +0100
Message-Id: <1242081458.5824.37.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	n4BMblnP016368
Subject: Re: python 2.6 warning
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
X-List-Received-Date: Mon, 11 May 2009 22:44:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2009-05-11 at 16:19 +0200, Marcin Juszkiewicz wrote:
> Dnia poniedzia=C5=82ek, 11 maja 2009 o 11:22:56 Robert Schuster napisa=C5=
=82(a):
> > Hi all,
> > those who are using bitbake with Python 2.6 (e.g. Ubuntu 09.04,
> > Debian sid) will notice this warning:
> >
> > /home/rschus/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the
> > sets module is deprecated
> >   import types, sets
> >
> > Is anyone from OE in the know how to fix that properly? I know its
> > only a warning but imagine an OE newbie reading this .... I would
> > like to fix it myself but even after years of contributing to OE my
> > Pyhton skills are severely limited. :|
>=20
> BitBake trunk has it fixed by me. Backporting to 1.8.x and to=20
> stable/2009 are on my todolist. And yes - it works fine with Python 2.5=
=20
> and even should with Python 2.4 which is minimal required version=20
> (should works with 2.3 but we do not support it).

It won't work with 2.3 but we don't care about 2.3, it will work with
2.4 onwards. I have no idea why we were using long deprecated stuff :/.

I've backported it to bitbake 1.8 and it seems to work along with
merging a number of fixes lurking in Poky.

I'm also intending to merge the virtual class extension stuff soon
unless anyone has a major objection (none were raised previously when I
proposed this).

Cheers,

Richard





