Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lhhr4-000698-8G
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 11:09:34 +0100
Received: (qmail 17857 invoked by uid 813007); 12 Mar 2009 10:09:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Mar 2009 10:09:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2009 11:09:15 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.1; x86_64; ;
	)
References: <ac9c93b10903120130v5c19e5fbq224df848792f3a5f@mail.gmail.com>
In-Reply-To: <ac9c93b10903120130v5c19e5fbq224df848792f3a5f@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200903121109.16286.marcin@juszkiewicz.com.pl>
Subject: Re: do_patch fails if path starts with ./
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
X-List-Received-Date: Thu, 12 Mar 2009 10:09:34 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 12 marca 2009 o 09:30:47 Frans Meulenbroeks napisa=C5=82(a):

> When generating my (normally small) patches=20

quilt new my-new-patch.diff

> I typically do a cp file file.orig in the work dir,=20

quilt add file

> then change file and at the end do a diff -urN path/file.oirg
> path/file >file.patch

quilt refresh

> no probllems with that (although if there are recommendations to do
> things simpler/better, I'm of course open to suggestions).

cp patches/my-new-patch.diff OE/

In other words: start using quilt - life will be much easier.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




