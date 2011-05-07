Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIn54-0006Jz-QO
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 21:22:22 +0200
Received: by bwz5 with SMTP id 5so3617704bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=LcYkPj1hSzmNSHaIZoeucmuW/oU96ppf/xFAlq9GnCg=;
	b=U33fCv5Gp7JhuUbMQpcaHW/t5GzGQx+eKNVV3yEjjJUmquulCtRfmPzKr9YDJX7xRf
	dqmfvRGkERZhrghKULlQxlnRM9f2xHmvXbu7z5LnjY1XMXUmBZaw4FJgEdPqIc8Yd7DM
	NFyxj3FUWxYk1UNud93B5Vm2IXUrBJlTjT/xk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=AROyNCvfTACMEPvyQuyxoxOT1Fsvb/qrKF9pu7/Z9h+G/NGMvJb6h+n75BD0ObuGVV
	ph8ywkstgfJdqwQV/Bh9O1c7Yin3evMjJXoDm5D8r6HRdG+XdBj/idLTf7KxNwMRc9Cn
	Pqm8OMGuyz49HcXWV2mfaUGY8BwSSiaatBIwA=
MIME-Version: 1.0
Received: by 10.204.36.7 with SMTP id r7mr2934450bkd.2.1304795979000; Sat, 07
	May 2011 12:19:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Sat, 7 May 2011 12:19:38 -0700 (PDT)
Date: Sat, 7 May 2011 16:19:38 -0300
X-Google-Sender-Auth: a0AzGG0d-3p6Ydv-75Uke4PmWLc
Message-ID: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe] Pull request for misc changes
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
X-List-Received-Date: Sat, 07 May 2011 19:22:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On the process of migrating our products to oe-core we have done some
changes up to now...

The following changes since commit 1325cc262c3f1e3cb5153aff98287ea8c65b15cf=
:

  gcc-4.5: add checksums (2011-05-02 11:10:30 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master

Otavio Salvador (8):
      fuse: add 2.8.5
      ntfs-3g-ntfsprogs: add 2011.4.12 recipes
      setxkbmap: add 1.2.0 version
      freerdp: add recipe based on GIT from 2009-03-29
      pixman.inc: use Xorg mirror
      p910nd: add 0.95 version
      libiconv: drop hack since gettext was being inherited
      libinih: add git recipe

 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 +++
 meta-oe/recipes-graphics/xorg-lib/pixman.inc       |    2 +-
 meta-oe/recipes-support/freerdp/freerdp.inc        |   23 +++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |   15 ++++++
 meta-oe/recipes-support/fuse/fuse_2.8.5.bb         |   32 ++++++++++++
 meta-oe/recipes-support/inih/libinih_git.bb        |   18 +++++++
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +--
 .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   25 ++++++++++
 meta-oe/recipes-support/p910nd/files/avahi         |    9 ++++
 meta-oe/recipes-support/p910nd/files/p910nd.init   |   38 +++++++++++++++
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb      |   51 ++++++++++++++++=
++++
 11 files changed, 221 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb
 create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb
 create mode 100644 meta-oe/recipes-support/inih/libinih_git.bb
 create mode 100644
meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
 create mode 100644 meta-oe/recipes-support/p910nd/files/avahi
 create mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init
 create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


