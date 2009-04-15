Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad@mail.asoft.ru>) id 1Lu2IX-0003Q8-Ss
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 12:24:56 +0200
Received: from localhost ([95.72.100.66]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n3FAL5oh020383
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 14:21:07 +0400
Date: Wed, 15 Apr 2009 14:21:05 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Message-ID: <20090415102105.GA17954@rainbow>
References: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
	<gqnn72$f5t$1@ger.gmane.org> <20090404090946.GA13413@rainbow>
	<be7a9f3d0904041053k38e2711akba9b549734dc87b@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0904041053k38e2711akba9b549734dc87b@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Wed, 15 Apr 2009 14:21:07 +0400 (MSD)
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.asoft.ru id
	n3FAL5oh020383
X-SA-Exim-Connect-IP: 83.222.19.8
X-SA-Exim-Mail-From: mad@mail.asoft.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] base-files: add noatime to rootfs mount	options
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
X-List-Received-Date: Wed, 15 Apr 2009 10:24:56 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:53 Sat 04 Apr     , Otavio Salvador wrote:
> On Sat, Apr 4, 2009 at 6:09 AM, Dmitry Artamonow <mad_soft@inbox.ru> wr=
ote:
> > On 13:48 Sun 29 Mar =A0 =A0 , Koen Kooi wrote:
> >> On 15-03-09 21:47, Dmitry Artamonow wrote:
> [...]
> >>> Fix it by adding noatime to rootfs mount options in fstab.
> >>
> >> Isn't 'relatime' a better option?
> >
> > Maybe yes, but we need more care in this case, because relatime has
> > been introduced in 2.6.20 [1], and there's still can be machines usin=
g
> > older kernels (judging solely by looking at the recipes in recipes/li=
nux).
> > I fear that we may break booting on these machines by passing
> > unsupported option to mount.
> >
> > [1] http://kernelnewbies.org/Linux_2_6_20#head-6804816ab4f07548635032=
afbedd3e1f4eb3d1d7
>=20
> I belive that if those machines still uses old kernels they have the
> responsability to deal with those things; besides that it is very
> common for machines to provide custom fstab files so it won't
> hurt to put a specific one to workaround it if required.

In case with default fstab - yes, probably you are right, since it can
be easily overrided by custom version for specific machine/distro.
But we need to carefully check which of the pre-existing
machine-specific fstabs can be modified to use relatime.

I've made some investigations by running this script:
 ls recipes/base-files/base-files/*/fstab | cut -d/ -f4 | \
 while read MACHINE  ; do echo $MACHINE; \
 bitbake -c setscene -n -vv virtual/kernel | grep setscene ; done
and then reformatting output by hand. Here's the results
(checked with Angstrom distro):

akita		linux-rp_2.6.26.bb
amsdelta	linux-amsdelta-2.6_2.6.16-omap2.bb
armzone-qt2410
c7x0		linux-rp_2.6.26.bb
efika		linux-rt_2.6.25.bb
ep93xx		linux_2.6.29+2.6.30-rc1.bb
epia		linux-epia_2.6.19.2.bb
gumstix-connex	gumstix-kernel_2.6.21.bb
gumstix-verdex	gumstix-kernel_2.6.21.bb
h2200		linux-handhelds-2.6_2.6.21-hh20.bb
h3600		linux-handhelds-2.6_2.6.21-hh20.bb
h3900		linux-handhelds-2.6_2.6.21-hh20.bb
h5000		linux-handhelds-2.6_2.6.21-hh20.bb
h6300		linux-h6300-omap1_2.6.16.16.bb
htcuniversal	linux-handhelds-2.6_2.6.21-hh20.bb
hx4700		linux-handhelds-2.6_2.6.21-hh20.bb
jornada56x	linux-handhelds-2.6_2.6.21-hh20.bb
jornada6xx	linux-jlime-jornada6xx_2.6.25.bb
jornada7xx	linux-jlime-jornada7xx_2.6.19rc6.bb
mtx-1		linux-mtx-1_2.4.27.bb
mtx-2		linux-mtx-2_2.4.27.bb
mx31moboard	linux_2.6.22.6.bb
netbook-pro	netbook-pro-kernel_2.6.17.bb
netvista	linux_2.6.23.bb
nokia770	linux-nokia800_2.6.18-osso40.bb
om-3d7k		linux-openmoko-devel_git.bb
om-gta01	linux-openmoko-2.6.24_git.bb
om-gta02	linux-openmoko-2.6.28_git.bb
omap5912osk	linux-omap_2.6.28.bb
openmn
openprotium
poodle		linux-rp_2.6.24.bb
simpad		linux_2.6.24.bb
slugos
spitz		linux-rp_2.6.26.bb
tosa		linux_2.6.29.bb
wrt54		linux-wrt_2.4.30.bb
xxs1500		linux-xxs1500_2.4.21.bb

As you can see there's still a lot of machines with 2.6.19, 2.6.16 and
even 2.4 kernels.

Anyway, I've redone patch by leaving out fstab for machines with
kernel <2.6.20 and also non-machine-fstabs (probably distro-specific -
openmn, openprotium, slugos, armzone-qt2410).

I'll send current version in following mail.

--=20
Best regards,
Dmitry "MAD" Artamonow



