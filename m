Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NlrI6-0008II-4v
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 23:07:14 +0100
Received: from [192.168.1.2] (e180134197.adsl.alicedsl.de [85.180.134.197])
	by drlauer-research.com (Postfix) with ESMTP id 07362584132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:59:32 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B8AE4F8.1000906@balister.org>
References: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
	<hmehnp$n57$1@dough.gmane.org>  <4B8AE4F8.1000906@balister.org>
Organization: Vanille-Media
Date: Sun, 28 Feb 2010 23:04:58 +0100
Message-ID: <1267394698.13054.5.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Sun, 28 Feb 2010 22:07:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 28.02.2010, 16:49 -0500 schrieb Philip Balister:
> On 02/28/2010 02:55 PM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 28-02-10 19:57, Antonio Ospite wrote:
> >> Pulseaudio versions newer than 0.9.15 don't build on ezx machines (and
> >> presumably on any armv5te), stick to this version until the problem is
> >> handled upstream and a patch is available.
> >>
> >> Cfr: http://bugs.openembedded.org/show_bug.cgi?id=5404
> >>
> >> Signed-off-by: Antonio Ospite<ospite@studenti.unina.it>
> >> ---
> >>   conf/machine/include/motorola-ezx-base.inc |    1 +
> >>   1 files changed, 1 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
> >> index 75c0f42..4d17211 100644
> >> --- a/conf/machine/include/motorola-ezx-base.inc
> >> +++ b/conf/machine/include/motorola-ezx-base.inc
> >> @@ -2,6 +2,7 @@ TARGET_ARCH = "arm"
> >>
> >>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
> >>   PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
> >> +PREFERRED_VERSION_pulseaudio = "0.9.15"
> >
> > NAK: machines have no business setting versions (except for kernels and
> > even that is debatable).
> >
> > If it doesn't build, fix your distro.
> 
> I'm with Koen here, machines may be used by other distros so forcing 
> revision selection for recipes (other than directly impact the machine) 
> has no business in machine files.

Of course one could argue that there is a bug in the OE recipes metadata
rather than the distro, since the pulseaudio recipes are known broken
for certain architectures -- however they don't contain any blacklisting
or whitelisting except for om-gta01/om-gta02 which I added when I became
aware of the problem. Antonio, lets just blacklist the broken versions
for the machines you're interested in.

:M:




