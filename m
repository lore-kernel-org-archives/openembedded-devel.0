Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JdNfz-0005u1-LC
	for openembedded-devel@openembedded.org; Sun, 23 Mar 2008 11:43:43 +0100
Received: (qmail 3290 invoked by uid 813007); 23 Mar 2008 10:43:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Mar 2008 10:43:42 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Mar 2008 11:43:13 +0100
User-Agent: KMail/1.9.9
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<47E5A67B.5030809@dls.net> <47E5E7DD.4030304@dls.net>
In-Reply-To: <47E5E7DD.4030304@dls.net>
MIME-Version: 1.0
Message-Id: <200803231143.14538.openembedded@haerwu.biz>
Subject: Re: [RFC] move to opkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Mar 2008 10:43:43 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Sunday 23 of March 2008, Mike (mwester) napisa=B3:
> Here's what it has started to add to the image (there may be more than
> this):
>
> libgpg
> libgpg-error
> libcrypt
> lzo
> pth
> libassuan
> gnutls

> In the short term:
>
> A) Where are the docs on opkg?

I do not have idea is there any at all ;(

> C) How much "fat" can we trim off of opkg, and how do we do that, so
> that we don't have to throw out other niceties that users appreciate?

Someone can add "opkg-lowfat_svn.bb":

=2D-code--
require opkg_svn.bb
EXTRA_OECONF +=3D "--disable-gpg"
=2D-code--

And proper PREFERRED_PROVIDER stuff. This recipe will not fetch all those=20
libraries which you listed - only libcurl with dependencies will be=20
added.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I don't know. I don't care. And it doesn't make any difference.




