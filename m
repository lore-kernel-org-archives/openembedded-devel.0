Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OUEpe-0002ND-Et
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 10:09:16 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 7138246CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 12:04:20 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Jul 2010 12:04:19 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>
In-Reply-To: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007011204.19864.khimov@altell.ru>
X-Altell-MailScanner-ID: 7138246CB.A4364
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} Disable multilib in gcc recipes
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
X-List-Received-Date: Thu, 01 Jul 2010 08:09:16 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 01 =D0=B8=D1=8E=D0=BB=D1=8F 2010=
 11:14:26 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> I would like to propose to remove building multilib with gcc recipes.
> It creates problems
> and we do not package correct bits on some platforms. As we tend to
> build toolchains keeping in mind the machine it is targetting I think
> multilib is not that significant

One of the things I've thought of when working on amd64 multilib series. IM=
O=20
it makes sense to make "--disable-multilib" a default and then only enable =
it=20
for "multilib" override. I've just couldn't accurately estimate the potenti=
al=20
impact for other platforms to propose it.

BTW, I plan to revive it and bring into oe.dev, we're regulary doing multil=
ib=20
amd64 builds there.


