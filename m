Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <openembedded@hrw.one.pl>) id 1GZ3IK-0003DF-Fl
	for openembedded-devel@openembedded.org; Sun, 15 Oct 2006 12:32:36 +0200
Received: (qmail 15401 invoked by uid 813007); 15 Oct 2006 10:25:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 15 Oct 2006 10:25:56 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
Date: Sun, 15 Oct 2006 12:26:08 +0200
User-Agent: KMail/1.9.5
References: <200610142209.32403.openembedded@hrw.one.pl>
	<20061015010729.GA17887@twibble.org>
In-Reply-To: <20061015010729.GA17887@twibble.org>
MIME-Version: 1.0
Message-Id: <200610151226.09721.openembedded@hrw.one.pl>
Subject: Re: Review of revision cdf57334d92107e67da0a4fcde849921042f581a
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 10:32:36 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 15 pa=C5=BAdziernika 2006 03:07, Jamie Lenehan napisa=C5=82:
> On Sat, Oct 14, 2006 at 10:09:30PM +0200, Marcin Juszkiewicz wrote:

> > Can someone look at revision cdf57334d92107e67da0a4fcde849921042f581a
> > to check my hack?
>
> Looks wrong... you are building for arm right? With your hack and
> building on i486 I get:

>   | io_getevents.c:25: error: previous definition of =E2=80=98io_getevent=
s_0_4=E2=80=99

> I think the real problem is a typo in syscall-arm.h

> This file is added by 00_arches.patch. So updating that patch with
> the one line change above should be enough.

Thx - pushed fix into .dev tree. I will also notify Debian maintainer=20
about this (patch was taken from Debian).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 A dream to some... A nightmare to others!
                 		-- Merlin




