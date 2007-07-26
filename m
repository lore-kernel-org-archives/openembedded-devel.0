Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IE204-0003qB-V6
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 13:59:25 +0200
Received: (qmail 1332 invoked by uid 813007); 26 Jul 2007 11:58:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 26 Jul 2007 11:58:04 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2007 13:57:59 +0200
User-Agent: KMail/1.9.7
References: <46A88A22.5010608@dominion.kabel.utwente.nl>
In-Reply-To: <46A88A22.5010608@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200707261358.00658.openembedded@hrw.one.pl>
Subject: Re: [RFC] make building working zaurus images easier
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
X-List-Received-Date: Thu, 26 Jul 2007 11:59:25 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 26 lipca 2007, Koen Kooi napisa=B3:

> Building a working zaurus image is tedious since you have *manually*
> rename a bunch of files before the on-board flashing software will
> accept it.

+2 from me

> I therefore want to propose 2 small scripts that can be run as
> EXTRA_IMAGECMD to make life a lot easier for both developers and users:
>
> [beware of line wrapping]
>
> For c7x0:

=46or c7x0/poodle/tosa you mean ;)

=46or collie:

cd ${DEPLOY_DIR_IMAGE}
mkdir ${IMAGE_NAME}-installkit/
cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImag=
e.bin=20
cp `ls ${IMAGE_NAME}.rootfs*jffs2 | sort -b | uniq |tail -n1` ${IMAGE_NAME}=
=2Dinstallkit/initrd.bin
tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.bz2 ${DEPLOY_DIR_I=
MAGE}/${IMAGE_NAME}-installkit/
rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/

Also we should use gzip compression for installkit tarballs as this will
allow users to unpack them on devices (gzip is in busybox).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

 BSD is what you get when a bunch of Unix hackers sit down to try to port
 a Unix system to the PC. Linux is what you get when a bunch of PC hackers
 sit down and try to write a Unix system for the PC.




