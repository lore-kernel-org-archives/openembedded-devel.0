Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nxjlh-0005jU-Be
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 18:30:50 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxjiU-00028F-Fy from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 09:27:30 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 2 Apr 2010 09:27:29 -0700
Received: from 172.30.80.132 ([172.30.80.132]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri,  2 Apr 2010 16:26:33 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	02 Apr 2010 09:26:29 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hp471c$59h$1@dough.gmane.org>
References: <E1NxKhE-0007AO-Bh@melo.openembedded.org>
	<1270159668.6277.138.camel@trini-m4400> <hp471c$59h$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Fri, 02 Apr 2010 09:26:29 -0700
Message-ID: <1270225589.7652.3.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 Apr 2010 16:27:29.0966 (UTC)
	FILETIME=[63C094E0:01CAD281]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : relocatable: Class to post-process packages for relocatability
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
X-List-Received-Date: Fri, 02 Apr 2010 16:30:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-04-02 at 09:40 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 02-04-10 00:07, Tom Rini wrote:
> > On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
> >> Module: openembedded.git
> >> Branch: rpurdie/work-in-progress
> >> Commit: 2365530efff7681fa34b2a466cf5f78acac10274
> >> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommi=
t;h=3D2365530efff7681fa34b2a466cf5f78acac10274
> >>
> >> Author: Joshua Lock <josh@linux.intel.com>
> >> Date:   Wed Mar 31 11:41:58 2010 +0100
> >>
> >> relocatable: Class to post-process packages for relocatability
> > [snip]
> >> +def rpath_replace (path, d):
> >> +    bindirs =3D bb.data.expand("${bindir} ${sbindir} ${base_sbindir} =
${base_bindir} ${libdir} ${base_libdir} ${PREPROCESS_RELOCATE_DIRS}", d).sp=
lit()
> >=20
> > Is that last variable there to let recipes add non-standard locations t=
o
> > the search path?
> >=20
> > [snip]
> >> -       required_utilities =3D "patch help2man diffstat texi2html
> > makeinfo cvs svn bzip2 tar gzip gawk md5sum"
> >> +       required_utilities =3D "patch help2man diffstat texi2html
> > makeinfo cvs svn bzip2 tar gzip gawk md5sum chrpath"
> >=20
> > How hard would it be to add a chrpath-native recipe and maybe treat thi=
s
> > like we used to treat qemu?  Don't see it in yum on my rhel5 box.
> > Thanks.
>=20
> We already have that from our previous chrpath experiments :) See
> recipes/chrpath

Great, lets rework to use that version.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


