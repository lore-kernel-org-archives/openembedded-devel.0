Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk5kl-0003BW-2S
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 02:09:30 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk5i4-0000pm-JV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 17:06:40 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 17:06:40 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 24 Feb 2010 01:06:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 18:06:38 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B847891.7030706@balister.org>
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DD5C.8050408@tycoelectronics.com> <4B8458A7.40807@balister.org>
	<19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
	<4B847891.7030706@balister.org>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 18:06:38 -0700
Message-ID: <1266973598.18176.366.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 24 Feb 2010 01:06:40.0227 (UTC)
	FILETIME=[9F0EB330:01CAB4ED]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to build g++ to run on target?
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
X-List-Received-Date: Wed, 24 Feb 2010 01:09:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 16:53 -0800, Philip Balister wrote:
>=20
> On 02/23/2010 03:09 PM, Khem Raj wrote:
> > On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister<philip@balister.org>  =
wrote:
> >> On 02/23/2010 05:51 AM, Jay Snyder wrote:
> >>>
> >>> I was able to build gcc for installation directly onto the OE target
> >>> with "bitbake gcc". "bitbake g++" gives me "nothing provides g++".
> >>>
> >>> What is the magic bitbake command to provide this?
> >>
> >> bitbake task-sdk-native, and install task-native-sdk. Anyone know why =
the
> >> task creates a package with different name?
> >
> > may be because
> >
> > task-sdk-native.bb:RPROVIDES_${PN} =3D "task-native-sdk"
>=20
> I know that :) I am curious why the renaming.

And if perhaps we couldn't get a different name altogether?  'native'
has a meaning normally that's not what it means here.
task-on-device-sdk is a bit wordy, but avoids 'native'.  Of course,
'native development' also has a meaning too.. RPROVIDES perhaps?  Or is
that just the worst of both worlds..

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


