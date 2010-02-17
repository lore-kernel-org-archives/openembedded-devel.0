Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NhqQ2-00048T-R5
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 21:22:50 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NhqNR-0001ET-8A from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 12:20:05 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 17 Feb 2010 12:20:04 -0800
Received: from 172.30.80.84 ([172.30.80.84]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Feb 2010 20:18:52 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	17 Feb 2010 13:18:52 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Nhfko-0005KL-8Z@melo.openembedded.org>
References: <E1Nhfko-0005KL-8Z@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Wed, 17 Feb 2010 13:18:51 -0700
Message-ID: <1266437931.5691.30.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Feb 2010 20:20:04.0504 (UTC)
	FILETIME=[97211980:01CAB00E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : opkg-native: bump to r522 to get a fix to remove duplicate messages from do_rootfs logs
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
X-List-Received-Date: Wed, 17 Feb 2010 20:22:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-02-17 at 08:59 +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 74501117c261f743c76ae3c2988cbcfdc141cf3a
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D74501117c261f743c76ae3c2988cbcfdc141cf3a
>=20
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Tue Feb 16 13:08:53 2010 +0100
>=20
> opkg-native: bump to r522 to get a fix to remove duplicate messages from =
do_rootfs logs

I'd like to RFC that we do something like:
OPKGREV ?=3D "522"
SRCREV_pn-opkg ?=3D "${OPKGREV}"
SRCREV_pn-opkg-native ?=3D "${OPKGREV}"
SRCREV_pn-opkg-sdk ?=3D "${OPKGREV}"

And if -nogpg or what have you is broken, it either gets fixed or the
distribution takes advantage of that ?=3D.  It seems a bit silly,
especially given the nature of the fixes, to split things up like this.
Heck, assuming 521 -> 522 is the patch from RP, the original report was
for on target opkg, not do_rootfs, even if it's the same bug that's been
there since shortly after ipkg -> opkg transition.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


