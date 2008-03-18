Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JbYYr-0008Dy-Es
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 10:56:51 +0100
Received: (qmail 14299 invoked by uid 813007); 18 Mar 2008 09:56:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Mar 2008 09:56:46 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Mar 2008 10:56:42 +0100
User-Agent: KMail/1.9.9
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
In-Reply-To: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200803181056.43273.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 18 Mar 2008 09:56:51 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Tuesday 18 of March 2008, Koen Kooi napisa=B3:

> Poky just switched to opkg and removed ipkg completely, which I think
> is a good thing, but here's a less drastic patch for OE.
>
> Executive summary: you still get .ipk packages, just as before, only
> your rootfs ends up with opkg. =20

And your rootfs is built with opkg-native instead of ipkg-native.

> Things like sharprom-compat and wrt54g-oe will continue to work just=20
> as before.=20

> I'd like to apply this ASAP if there are no serious complaints.

=46ew things:

1. There is no such thing as 'opkg-utils' - we still use ipkg-utils-native
   for creating packages.

2. You missed image.bbclass change:

=2D-- a/trunk/meta/classes/image.bbclass
+++ b/trunk/meta/classes/image.bbclass
@@ -85,8 +85,6 @@ fakeroot do_rootfs () {
=20
 	insert_feed_uris=09
=20
=2D	rm -f ${IMAGE_ROOTFS}${libdir}/ipkg/lists/*
=2D=09
 	${IMAGE_PREPROCESS_COMMAND}
 	=09
 	export TOPDIR=3D${TOPDIR}

3. Meta/meta-toolchain.bb recipe also use ipkg and this also was changed
   in Poky.

4. You did not set SRCREV for opkg-sdk recipe.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    The fact that no one understands you doesn't mean you're an artist.




