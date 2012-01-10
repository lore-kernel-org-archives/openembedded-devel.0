Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkaLY-0005PB-At
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 12:58:32 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 10 Jan 2012 12:51:00 +0100
Date: Tue, 10 Jan 2012 12:50:59 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20120110115059.GD3664@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1326185831.git.anders@chargestorm.se>
	<6382f565655efb9aec552453275832a351bc7467.1326185831.git.anders@chargestorm.se>
	<CAP9ODKopWxY=-v7DX6wO=JdshpgVOWy5_P+WbYX-gyCcbXTNtQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKopWxY=-v7DX6wO=JdshpgVOWy5_P+WbYX-gyCcbXTNtQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH v2 3/3] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Tue, 10 Jan 2012 11:58:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [120110 12:20]:

> NACK!

> If you use MACHINE_FEATURES it needs to set PACKAGE_ARCH to machine too.

Thanks for noticing!

I've just submitted a v3, hopefully I've set the PACKAGE_ARCH in a
correct way. (I tried to grep through meta-oe to see how PACKAGE_ARCH is
set).

Please, let me know if I should have set PACKAGE_ARCH to something else,
or in some other way.

Cheers,
Anders

> On Tue, Jan 10, 2012 at 07:00, Anders Darander <anders@chargestorm.se>wrote:

> > If the machine lacks keyboard support, there is no need for kbd*-packages.

> > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > ---
> >  meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)

> > diff --git a/meta-oe/recipes-core/systemd/systemd_git.bbb/meta-oe/recipes-core/systemd/
> > systemd_git.bb
> > index 0fa61a7..7af8357 100644
> > --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> > +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> > @@ -14,7 +14,7 @@ inherit gitpkgv
> >  PKGV = "v${GITPKGVTAG}"

> >  PV = "git"
> > -PR = "r8"
> > +PR = "r9"

> >  inherit useradd pkgconfig autotools vala perlnative

> > @@ -101,7 +101,7 @@ RDEPENDS_${PN} += "dbus-systemd udev-systemd"
> >  # of blacklist support, so use proper modprobe from module-init-tools
> >  # And pull in the kernel modules mentioned in INSTALL
> >  # swapon -p is also not supported by busybox
> > -RRECOMMENDS_${PN} += "kbd kbd-consolefonts \
> > +RRECOMMENDS_${PN} += "${@base_contains("MACHINE_FEATURES", "keyboard",
> > "kbd kbd-consolefonts", "", d)} \
> >                       systemd-serialgetty \
> >                       util-linux-agetty \
> >                       util-linux-swaponoff \
-- 
Anders Darander
ChargeStorm AB / eStorm AB


