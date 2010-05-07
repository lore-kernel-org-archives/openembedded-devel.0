Received: from promwad.com ([83.149.69.23])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <viktar.palstsiuk@promwad.com>) id 1OALVj-0002Xy-JO
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 13:14:28 +0200
Received: from [195.222.85.229] (helo=intranet.promwad.com)
	by promwad.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <viktar.palstsiuk@promwad.com>) id 1OALRo-0008WA-Sd
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 14:10:24 +0300
Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by intranet.promwad.com with esmtpsa (TLS1.0:RSA_ARCFOUR_MD5:16)
	(Exim 4.69) (envelope-from <viktar.palstsiuk@promwad.com>)
	id 1OALRF-0007i9-2E for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 14:09:49 +0300
Received: by bwz20 with SMTP id 20so496487bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 04:09:42 -0700 (PDT)
Received: by 10.204.48.84 with SMTP id q20mr10979bkf.83.1273230582502; Fri, 07 
	May 2010 04:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.100.84 with HTTP; Fri, 7 May 2010 04:09:21 -0700 (PDT)
In-Reply-To: <n2kdfcd449c1005070221iaf3a2f3fk56de0b2c2d2f5cd2@mail.gmail.com>
References: <n2kdfcd449c1005070221iaf3a2f3fk56de0b2c2d2f5cd2@mail.gmail.com>
From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Fri, 7 May 2010 14:09:21 +0300
Message-ID: <g2zdfcd449c1005070409kc479cf1fz688eb1730a900823@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 83.149.69.23
X-SA-Exim-Mail-From: viktar.palstsiuk@promwad.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: QNeedleIndicator 0.3.1 demo app
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
X-List-Received-Date: Fri, 07 May 2010 11:14:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Here is a recipe to build QNeedleIndicator 0.3.1 demo app. It uses Qt/Embed=
ded.

$ cat qneedleindicator_0.3.1.bb

DESCRIPTION =3D "Simple needle indicator. Needle is animated and
smoothly moves until set value is reached. Animation can be disabled."
HOMEPAGE =3D "http://qt-apps.org/content/show.php/QNeedleIndicator?content=
=3D118474"
LICENSE =3D "LGPL"

inherit qt4e

PR =3D "r3"

SRC_URI =3D "http://qt-apps.org/CONTENT/content-files/118474-QNeedleIndicat=
or-${PV}.tar.gz"

SRC_URI[md5sum] =3D "9168627119f13dd6393ba349bb595f60"
SRC_URI[sha256sum] =3D
"7d8d059e8006bc351272787e22bb671fc18652da1f114219242d74545492810b"

S =3D "${WORKDIR}/QNeedleIndicator-${PV}"

do_install() {
=A0 =A0 =A0 =A0${STRIP} ${S}/QNeedleIndicator
=A0 =A0 =A0 =A0install -d ${D}/${bindir}
=A0 =A0 =A0 =A0install -m 755 ${S}/QNeedleIndicator ${D}/${bindir}
}

--
Viktar Palstsiuk


