Received: from [147.162.13.20] (helo=pcimg12.dei.unipd.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bott@pcimg12.dei.unipd.it>) id 1LzWxa-0001tB-8U
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 16:09:58 +0200
Received: by pcimg12.dei.unipd.it (Postfix, from userid 1000)
	id 5D7B7806F87A; Thu, 30 Apr 2009 16:04:36 +0200 (CEST)
Date: Thu, 30 Apr 2009 16:04:36 +0200
From: Ottavio Campana <ottavio@campana.vi.it>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090430140436.GA7335@pcimg12.dei.unipd.it>
MIME-Version: 1.0
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: receipe for libmicrohttpd
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
X-List-Received-Date: Thu, 30 Apr 2009 14:10:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I wrote the receipe for libmicrohttpd, a LPGL library used to embedded a
web server in programs.

It works for me, but I'd like to have some feedback from you, if it is
good or not and if you'd like to add it to OE.

Ottavio

PR =3D "r1"
PN =3D "libmicrohttpd"
DESCRIPTION =3D "GNU libmicrohttpd is a small C library that is supposed =
to make it easy to run an HTTP server as part of another application"
HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
SECTION =3D "libs"
LICENSE =3D "LGPL"

SRC_URI =3D "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.4.1.tar.=
gz"

inherit autotools pkgconfig

do_stage() {
        oe_runmake DESTDIR=3D"${D}" install
        autotools_stage_all
}

do_qa_staging () {
}

--=20
Non c'=E8 pi=F9 forza nella normalit=E0, c'=E8 solo monotonia.


