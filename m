Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ts3W8-00045Q-9q
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 04:36:58 +0100
Received: by mail-la0-f41.google.com with SMTP id em20so14304655lab.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 19:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UVrugSlo++6aUIVpzUrHuPTZ9cApIn5CGaKHVhqoCBs=;
	b=TtaXOLYBpIrUrgLAA9TN1PO+71nycROLzUdCX2qFamoeXrUoje35R0UotpiX1aHaXG
	DhZP+QomJoWpTGnrRR2j+SyTfmiJOQ29sKa7OAH/qGYgXOAuSqp1fHZY1R0kW4qUv5vs
	dqRzTrx8PKIhYCtA8rwV4Xztw/jCIX9dtALbtYPkePkYRncX0LuI+XORtOSDg1X5dk++
	euivmkBqqVy0JWm5Um1PyjIWap+WA9h+jy6ik4hSYWm2tuK5WECHEbbD5LgQvSTDJKl5
	zQewGoB8Q3bkKbTxrljE0Vw5Ny8ONeb7b7Gq1UXGxqN8rjDP7TDot05QrgRre1Nh/dTs
	jv/g==
MIME-Version: 1.0
Received: by 10.112.87.104 with SMTP id w8mr24609939lbz.49.1357528903370; Sun,
	06 Jan 2013 19:21:43 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Sun, 6 Jan 2013 19:21:42 -0800 (PST)
In-Reply-To: <20130107014615.GD9356@windriver.com>
References: <1357449457-2669-1-git-send-email-lei.yang@windriver.com>
	<20130107014615.GD9356@windriver.com>
Date: Sun, 6 Jan 2013 22:21:42 -0500
Message-ID: <CADkTA4MVDp9iO+2U0S2_54VQwLXK-x=TMPg=6auKfmsqfE1nGA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
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
X-List-Received-Date: Mon, 07 Jan 2013 03:37:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 6, 2013 at 8:46 PM, Joe MacDonald
<Joe.MacDonald@windriver.com>wrote:

> [[meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt
> virt-test)] On 13.01.06 (Sun 13:17) lei.yang@windriver.com wrote:
>
> > From: Lei Yang <lei.yang@windriver.com>
> >
> > The netcat-openbsd in meta-virtualization layer has bugs.
> > This update version will fix "nc: Protocol no available." error.
> > As bruce point, we want to keep netcat in the meta-networking,
> > which meta-virtualization will depend on
>
> That's fine with me if that works for him, and having both netcat
> versions available is fine, I personally prefer the obsd one.  I'll keep
> an eye out for your next version with the per-recipe alternative
> priorities.
>
> I didn't notice the discussion with Bruce, though, so at the risk of
> re-stating what you guys have already agreed upon, this will mean you're
> at least going to be cloning meta-oe to use meta-virtualization.
> meta-networking isn't a standalone layer for the most part.  I maintain
> a read-only subtree project on github that is meta-networking separated
> from the rest of meta-oe, but it necessarily trails the meta-networking
> in meta-oe.
>


This all sounds good to me. I see the other thread where you've indicated
you'll
merge the obsd netcat, and like you say there, that's the important part.

The summary of the conversation (on meta-virt) was the big item I was trying
to avoid was having two supported netcat variants in different layers with
no
obvious (to the casual observer) reason why there were two layers that
contained "netcat". I didn't expect this to move to oe-dev quite so fast,
or
I would have gotten around to giving my own heads up!

There are two ideas about how to consume obsd netcat if it comes from
meta-networking, depend directly on the layer (whether it be the
meta-oe, or your read only github/standalone variant) or to use the layer
combo tools to track what you merge to meta-networking within meta-virt.

We'll just document the requirement(s) in the READMEs once everything
is nailed down.

Either approach I mention above will work, and while we do want to keep
dependencies low, I'm inclined to use the layer dependency approach, since
there are bound to be more parts of meta-networking that will be required
as the virtualization usecases progress.

Right now, I'm not too concerned about a meta-oe dependency (but I'm just
one voice), but it is good to know that there's the github option as well.
And
there's the fallback of the layer combo-tooling as well.

If anyone has experience to offer here .. it would be appreciated, since
there's
no sense causing ourselves undo pain and suffering.

Cheers,

Bruce



>
> I'm fine with the new recipe, just wanted to make sure you had all the
> information you needed.
>
> -J.
>
> >
> > Lei
> >
> > Signed-off-by: Lei Yang <lei.yang@windriver.com>
> > ---
> >  .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   29
> ++++++++++++++++++++
> >  meta-networking/recipes-support/netcat/netcat.inc  |    6 ++++
> >  .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
> >  3 files changed, 40 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-networking/recipes-support/netcat/
> netcat-openbsd_1.89.bb
> >  create mode 100644 meta-networking/recipes-support/netcat/netcat.inc
> >
> > diff --git a/meta-networking/recipes-support/netcat/
> netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/
> netcat-openbsd_1.89.bb
> > new file mode 100644
> > index 0000000..9fe406c
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> > @@ -0,0 +1,29 @@
> > +require netcat.inc
> > +DESCRIPTION = "OpenBSD Netcat"
> > +HOMEPAGE = "http://ftp.debian.org"
> > +LICENSE = "BSD-3-Clause"
> > +PR = "r0"
> > +
> > +SRC_URI =
> "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat
> \
> > +
> ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
> > +
> > +SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
> > +SRC_URI[netcat.sha256sum] =
> "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
> > +SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
> > +SRC_URI[netcat-patch.sha256sum] =
> "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
> > +
> > +S = "${WORKDIR}/${PN}-${PV}.orig"
> > +
> > +do_configure[noexec] = "1"
> > +
> > +do_compile() {
> > +     cd ${S}
> > +        while read line; do patch -p1 <debian/patches/$line; done
> <debian/patches/series
> > +     pkgrel=4
> > +     oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
> > +}
> > +
> > +do_install() {
> > +        install -d ${D}${bindir}
> > +        install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> > +}
> > diff --git a/meta-networking/recipes-support/netcat/netcat.inc
> b/meta-networking/recipes-support/netcat/netcat.inc
> > new file mode 100644
> > index 0000000..4098668
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/netcat/netcat.inc
> > @@ -0,0 +1,6 @@
> > +SECTION = "console/network"
> > +inherit update-alternatives gettext
> > +
> > +ALTERNATIVE_${PN} = "nc"
> > +ALTERNATIVE_PRIORITY = "100"
> > +
> > diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bbb/meta-networking/recipes-support/netcat/
> netcat_0.7.1.bb
> > index c5ab85d..e09202b 100644
> > --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> > +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> > @@ -1,21 +1,20 @@
> > +require netcat.inc
> >  DESCRIPTION = "GNU Netcat"
> >  HOMEPAGE = "http://netcat.sourceforge.net"
> > -SECTION = "console/network"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> >
> > -PR = "r0"
> > +PR = "r1"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
> >
> >  SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
> >  SRC_URI[sha256sum] =
> "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
> >
> > -inherit autotools update-alternatives gettext
> > +inherit autotools
> >
> >  do_install_append() {
> > -     mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> > +        install -d ${D}${bindir}
> > +        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> >  }
> >
> > -ALTERNATIVE_${PN} = "nc"
> > -ALTERNATIVE_PRIORITY = "100"
> --
> -Joe MacDonald.
> :wq
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

