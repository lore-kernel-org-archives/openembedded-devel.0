Received: from [217.116.0.68] (helo=misiva10.acens.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <joaquinduran@adtelecom.es>) id 1Ihw5i-0002fi-HS
	for openembedded-devel@openembedded.org; Wed, 17 Oct 2007 01:44:50 +0200
Received: (qmail 11395 invoked from network); 16 Oct 2007 23:11:38 -0000
Received: from unknown (HELO main0197.acens.priv) ([127.0.0.1])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by localhost (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@openembedded.org>; 16 Oct 2007 23:11:38 -0000
MIME-Version: 1.0
From: <joaquinduran@adtelecom.es>
To: openembedded-devel@openembedded.org
X-Origin: 213.102.65.248
Date: Wed, 17 Oct 2007 01:11:38 +0200
X-Uidl: 1192576298108551856
X-Mailer: AtMail 4.3
Subject: Using XCB library with cairo
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
X-List-Received-Date: Tue, 16 Oct 2007 23:44:50 -0000
Message-ID: <MADEUP.15FE19C197103CEF.14572@groups.io>
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dear all,=0D
=0D
Some time ago, Angstrom distribution had configured as virtual/xlib to XCB =
for some time. Then =0D
xlib was used again due to instability problems (as I remember) with XCB (I=
've all emails in =0D
computer of work but and I writting from home and I don't have access to th=
em).=0D
=0D
I think that one focus of instability could be the integration of cairo wit=
h XCB. Today I've =0D
discovered that one of the backends for cairo is XCB, but no cairo package =
builds it. I would =0D
like to test it, but one of the troubles is how the configuration options c=
ould be determined =0D
based on virtual/xlib pacakge. Currently I'm thinking in a similar solution=
 to cairo-fpu:=0D
=0D
if virtual/xlib =3D "xcb" then=0D
  EXTRA_OECONF +=3D "--disable-xlib --enable-xcb"=0D
else=0D
  EXTRA_OECONF +=3D "--enable-xlib --disable-xcb"=0D
fi=0D
=0D
is this possible? any suggestions?=0D
=0D
Thanks and Best Regards,=0D
Joaquim Duran=0D
=0D
=0D
=0D
=0D


