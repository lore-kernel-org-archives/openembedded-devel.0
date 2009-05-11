Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3WSw-00042n-0L
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 16:26:50 +0200
Received: (qmail 28890 invoked by uid 813007); 11 May 2009 14:20:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 11 May 2009 14:20:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 16:19:41 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <4A07EE70.2010408@gmx.net>
In-Reply-To: <4A07EE70.2010408@gmx.net>
MIME-Version: 1.0
Message-Id: <200905111619.42187.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Mon, 11 May 2009 14:26:50 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 11 maja 2009 o 11:22:56 Robert Schuster napisa=C5=
=82(a):
> Hi all,
> those who are using bitbake with Python 2.6 (e.g. Ubuntu 09.04,
> Debian sid) will notice this warning:
>
> /home/rschus/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the
> sets module is deprecated
>   import types, sets
>
> Is anyone from OE in the know how to fix that properly? I know its
> only a warning but imagine an OE newbie reading this .... I would
> like to fix it myself but even after years of contributing to OE my
> Pyhton skills are severely limited. :|

BitBake trunk has it fixed by me. Backporting to 1.8.x and to=20
stable/2009 are on my todolist. And yes - it works fine with Python 2.5=20
and even should with Python 2.4 which is minimal required version=20
(should works with 2.3 but we do not support it).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




