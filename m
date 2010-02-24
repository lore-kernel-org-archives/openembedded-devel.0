Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NkJr5-0004ry-Ow
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 17:12:58 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NkJoO-0004Vq-R8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 08:10:08 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 24 Feb 2010 08:10:08 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 24 Feb 2010 16:10:07 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	24 Feb 2010 09:10:06 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201002241119.20053.marcin@juszkiewicz.com.pl>
References: <1266951776.18176.47.camel@trini-m4400>
	<201002241119.20053.marcin@juszkiewicz.com.pl>
Organization: Mentor Graphics Corporation
Date: Wed, 24 Feb 2010 09:10:06 -0700
Message-ID: <1267027806.18176.505.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 24 Feb 2010 16:10:08.0606 (UTC)
	FILETIME=[D5C4E7E0:01CAB56B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Wed, 24 Feb 2010 16:12:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-02-24 at 11:19 +0100, Marcin Juszkiewicz wrote:
> Dnia wtorek, 23 lutego 2010 o 20:02:56 Tom Rini napisa=C5=82(a):
> > I was about to just push this and I noticed that a number of
> > distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> > FEATURE_SUID=3Dy, but it's not actually install SUID.  And since I reca=
ll
> > some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> > it best to post the patch first and let folks speak up / ask me to drop
> > FEATURE_SUID=3Dy when I do this.  So, here's the patch:
>=20
> Ok, but does not it require /etc/something to list which applets are allo=
wed=20
> to be suid and which are not?=20
>=20
> Hm. checked sources. with FEATURE_SUID suid will be active only for "cron=
tab,=20
> dnsd, findfs, ipcrm, ipcs, login, passwd, ping, su, traceroute, vlock"=20
> commands. /etc/busybox.conf is CONFIG_FEATURE_SUID_CONFIG option.

To be clear, enabling one of those applets will force FEATURE_SUID to be
set.  FEATURE_SUID_CONFIG lets you configure who can run these SUID
programs.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


