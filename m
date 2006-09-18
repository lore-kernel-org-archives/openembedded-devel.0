Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <openembedded@hrw.one.pl>) id 1GPEaK-0007jN-BQ
	for openembedded-devel@openembedded.org; Mon, 18 Sep 2006 10:34:36 +0200
Received: (qmail 4076 invoked by uid 813007); 18 Sep 2006 08:30:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Sep 2006 08:30:30 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2006 10:30:26 +0200
User-Agent: KMail/1.9.4
References: <ad39a30f0609180015wc6ba838vff48fef6d7d41f7d@mail.gmail.com>
In-Reply-To: <ad39a30f0609180015wc6ba838vff48fef6d7d41f7d@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200609181030.27487.openembedded@hrw.one.pl>
Subject: Re: opie-freetype issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 08:34:36 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 18 wrze=B6nia 2006 09:15, Leon Zhang napisa=B3:

> hey, I am trying to fix the bug about opie-freetype. I found that the
> current package can't install anything into "tmp/work/armv5te-linux/
> opie- freetype-1.2.2-r0/install/". So, I write a patch which
> add "do_install" function to install something into the directory.=20


pushed in eea65847cfef3a7ff53e70dcfed248b5ad86b7fb

> Hmm, I don't know why, it pakcaged contents into *libfreetypefactory*
> instead of *opie-freetype*. So, why ?

debian.bbclass renaming - I disabled it.

=2D-=20
JID: hrw-jabber.org
Sharp Zaurus C-760 (OZ 3.5.x)
OpenEmbedded/OpenZaurus/OPIE developer

                    If it happens, it must be possible.


