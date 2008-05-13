Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JvuEx-000577-0Z
	for openembedded-devel@openembedded.org; Tue, 13 May 2008 15:08:23 +0200
Received: (qmail 7005 invoked by uid 813007); 13 May 2008 13:06:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 May 2008 13:06:56 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2008 15:05:52 +0200
User-Agent: KMail/1.9.9
References: <48246A67.4030800@balister.org>
	<200805122258.40698.openembedded@haerwu.biz>
	<g0br8u$3g1$1@ger.gmane.org>
In-Reply-To: <g0br8u$3g1$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200805131505.56176.openembedded@haerwu.biz>
Subject: Re: Change ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL
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
X-List-Received-Date: Tue, 13 May 2008 13:08:24 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Tuesday, 13 of May 2008, Rolf Leggewie napisa=B3:
> Marcin Juszkiewicz wrote:
> > I vote against IMAGE_EXTRA_INSTALL. Let it live as ugly Angstrom hack
> > for breaking sane images into unsupportable ones.
>
> How would the correct way to do this look like?
>
> I regularly want to include package X for testing it out.  I don't want
> to create a new image definition every time.

Create rolf-test-image.bb which will do anything you want and also will=20
have:

IMAGE_INSTALL +=3D "${ROLF_EXTRA_IMAGE_INSTALL}"

This way you have own image which contain anything you want and is based=20
on anything you want. And it is clearly your image so you are the only=20
one who supports it.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I'm trying to decide if I should kill you or simply feign death
      until you feel awkward and leave.




