Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opbpe-0000XS-2z
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 08:57:35 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3819215iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 23:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GuRQwNqlf+qtZPJrPy8T492J1u1ml64aThu1g7oEC9s=;
	b=jwKUva+GoQb+eTn7dTiFMbU79pHAzVIfenw+n/K+Rt4ovy2cyF+s1nLIxFFB2pKxoR
	RXt75KzYMq8NCGAgkXHCHjHNMzcI0IA/GGOFxnpiseap/R07VsW/tuidD9fRbRjTJNSS
	SSUj64HR32v3LzPE1WkXROSsJ0w1vMUD8KCpo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UKqJm55DPePxAiU4EEHFl8+TAhXAzEMe6fgbONiT8BVtL7DJ2i2elSEG0q5mzIe3Hp
	X5ROZY7T7gERkizgSMF1l0V/GyBXHsl1gEbXB9v+7LHOubpcIW9BVaWvnuUf/nZ/0RBq
	U2jjzh97oQJP4iHgq+tObYF2mMd9A4MjQXeDs=
MIME-Version: 1.0
Received: by 10.231.191.74 with SMTP id dl10mr3441156ibb.157.1283065025532;
	Sat, 28 Aug 2010 23:57:05 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 23:57:05 -0700 (PDT)
In-Reply-To: <1283027073-12308-24-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-24-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 08:57:05 +0200
Message-ID: <AANLkTimhYC=YB8H_OrB3S_Dj+_cLuzzJR9h66XWvLpLt@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 23/23] recipes/tasks: Do not RDEPENDS on unavailable packages.
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
X-List-Received-Date: Sun, 29 Aug 2010 06:57:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.co

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> * Some packages are renamed so RDEPEND on those instead.
> * Some packages are removed so remove then from RDEPENDS too.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/tasks/task-mamona-base.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
5 +++--
> =A0recipes/tasks/task-mamona-python.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 +-=
--------
> =A0recipes/tasks/task-mamona-systemtap.bb =A0 =A0 =A0 =A0 | =A0 =A01 -
> =A0recipes/tasks/task-mamona-wm.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 -
> =A0recipes/tasks/task-openmoko-base.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/tasks/task-openmoko-python-devel.bb =A0 =A0| =A0 =A01 -
> =A0recipes/tasks/task-opie-apps.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/tasks/task-python-sharprom_20060425.bb | =A0 18 +++++++++-----=
----
> =A08 files changed, 15 insertions(+), 25 deletions(-)
>
> diff --git a/recipes/tasks/task-mamona-base.bb b/recipes/tasks/task-mamon=
a-base.bb
> index fa56e24..a909595 100644
> --- a/recipes/tasks/task-mamona-base.bb
> +++ b/recipes/tasks/task-mamona-base.bb
> @@ -9,14 +9,15 @@ RDEPENDS_${PN} =3D "\
> =A0 apt \
> =A0 base-files \
> =A0 base-passwd \
> - =A0bash | bash-noemu \
> + =A0bash \
> + =A0bash-noemu \
> =A0 busybox \
> =A0 bzip2 \
> =A0 coreutils \
> =A0 dpkg \
> =A0 e2fsprogs \
> =A0 e2fsprogs-badblocks \
> - =A0e2fsprogs-uuidgen \
> + =A0util-linux-ng \
> =A0 file \
> =A0 gawk \
> =A0 gawk-common \
> diff --git a/recipes/tasks/task-mamona-python.bb b/recipes/tasks/task-mam=
ona-python.bb
> index 4503627..8b19643 100644
> --- a/recipes/tasks/task-mamona-python.bb
> +++ b/recipes/tasks/task-mamona-python.bb
> @@ -18,15 +18,12 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 python-gmpy =A0 =A0 =A0 =A0\
> =A0 =A0 python-gnosis \
> =A0 =A0 python-gst \
> - =A0 =A0python-hmm \
> =A0 =A0 python-imaging \
> =A0 =A0 python-imdbpy \
> =A0 =A0 python-inotify \
> =A0 =A0 python-irclib \
> - =A0 =A0python-itools \
> =A0 =A0 python-logilab-common \
> =A0 =A0 python-libgmail \
> - =A0 =A0python-lightmediascanner \
> =A0 =A0 python-lxml =A0 =A0 =A0 =A0\
> =A0 =A0 python-mad \
> =A0 =A0 python-numarray =A0 =A0\
> @@ -48,7 +45,6 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 python-pylint \
> =A0 =A0 python-pyqt =A0 =A0 =A0 =A0\
> =A0 =A0 python-pyraf \
> - =A0 =A0python-pyreverse \
> =A0 =A0 python-pyrex \
> =A0 =A0 python-pyro \
> =A0 =A0 python-pyserial \
> @@ -63,17 +59,13 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 python-simplejson \
> =A0 =A0 python-sip \
> =A0 =A0 python-sgmlop \
> - =A0 =A0python-snmplib \
> =A0 =A0 python-soappy \
> =A0 =A0 python-spydi \
> - =A0 =A0python-spyro \
> =A0 =A0 python-sqlalchemy \
> =A0 =A0 python-sqlobject \
> =A0 =A0 python-tlslite \
> - =A0 =A0python-urwid \
> - =A0 =A0python-vmaps \
> + =A0 =A0python-twisted \
> =A0 =A0 python-vorbis \
> =A0 =A0 python-webpy \
> =A0 =A0 task-python-efl \
> - =A0 =A0twisted \
> =A0"
> diff --git a/recipes/tasks/task-mamona-systemtap.bb b/recipes/tasks/task-=
mamona-systemtap.bb
> index 84182d6..72a3622 100644
> --- a/recipes/tasks/task-mamona-systemtap.bb
> +++ b/recipes/tasks/task-mamona-systemtap.bb
> @@ -6,6 +6,5 @@ PACKAGES =3D "${PN}"
>
> =A0RDEPENDS_${PN} =3D "\
> =A0 =A0 libcap \
> - =A0 =A0systemtap \
> =A0 =A0 task-mamona-sdk \
> =A0"
> diff --git a/recipes/tasks/task-mamona-wm.bb b/recipes/tasks/task-mamona-=
wm.bb
> index 49d3a6a..e2ac612 100644
> --- a/recipes/tasks/task-mamona-wm.bb
> +++ b/recipes/tasks/task-mamona-wm.bb
> @@ -12,6 +12,5 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 libmamona-im-gtk \
> =A0 =A0 pango-module-basic-x \
> =A0 =A0 pango-module-basic-fc \
> - =A0 =A0aterm \
> =A0 =A0 midori \
> =A0"
> diff --git a/recipes/tasks/task-openmoko-base.bb b/recipes/tasks/task-ope=
nmoko-base.bb
> index b7b7b58..3c46c56 100644
> --- a/recipes/tasks/task-openmoko-base.bb
> +++ b/recipes/tasks/task-openmoko-base.bb
> @@ -11,7 +11,7 @@ inherit task
> =A0DESCRIPTION_task-openmoko-base =3D "Openmoko: Top Panel, Application L=
auncher, Application Manager"
> =A0RDEPENDS_task-openmoko-base =3D "\
> =A0 matchbox-panel-2 \
> - =A0matchbox-panel-2-applets \
> +# =A0matchbox-panel-2-applets \
> =A0# =A0matchbox-keyboard-inputmethod \
> =A0# =A0matchbox-keyboard-im \
> =A0# =A0matchbox-keyboard-applet \
> diff --git a/recipes/tasks/task-openmoko-python-devel.bb b/recipes/tasks/=
task-openmoko-python-devel.bb
> index a493183..7b375c0 100644
> --- a/recipes/tasks/task-openmoko-python-devel.bb
> +++ b/recipes/tasks/task-openmoko-python-devel.bb
> @@ -8,5 +8,4 @@ inherit task
> =A0RDEPENDS_task-openmoko-python-devel =3D "\
> =A0 task-python-efl \
> =A0 python-pygtk \
> - =A0python-lightmediascanner \
> =A0"
> diff --git a/recipes/tasks/task-opie-apps.bb b/recipes/tasks/task-opie-ap=
ps.bb
> index 2f9cc27..f791c21 100644
> --- a/recipes/tasks/task-opie-apps.bb
> +++ b/recipes/tasks/task-opie-apps.bb
> @@ -8,7 +8,7 @@ PACKAGES =3D "task-opie-apps task-opie-extra-apps"
>
> =A0RDEPENDS_task-opie-apps =3D "opie-advancedfm opie-bartender opie-calcu=
lator \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 opie-checkbook opie-clock \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0opie-console opie-dagger opie-embedd=
edkonsole \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0opie-console opie-embeddedkonsole \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 opie-euroconv opie-eye opie-ftp opie-=
gutenbrowser \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 opie-helpbrowser opie-irc opie-keypeb=
ble opie-odict \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 opie-oxygen opie-rdesktop opie-reader=
 opie-remote \
> diff --git a/recipes/tasks/task-python-sharprom_20060425.bb b/recipes/tas=
ks/task-python-sharprom_20060425.bb
> index 16038ad..15776ea 100644
> --- a/recipes/tasks/task-python-sharprom_20060425.bb
> +++ b/recipes/tasks/task-python-sharprom_20060425.bb
> @@ -8,13 +8,20 @@ NONWORKING =3D "\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-crypto =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-gammu =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-gmpy =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-hmm =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-itools =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pybluez =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-pyreverse =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pysqlite =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pygtk =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pyqwt =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-snmplib =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-sgmlop =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-spyro =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-sword =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-vorbis"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-urwid =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-vorbis =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-vmaps"
>
> =A0RDEPENDS_${PN} =3D "\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-ao =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> @@ -23,9 +30,7 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-fnorb =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-fpconst =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-gnosis =A0 =A0 =A0 =A0 =A0 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-hmm =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-irclib =A0 =A0 =A0 =A0 =A0 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-itools =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-libgmail =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-logilab-common =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-lxml =A0 =A0 =A0 =A0 =A0 =A0 \
> @@ -45,7 +50,6 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pylint =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pyqt =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pyraf =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-pyreverse =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pyro =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pyserial =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-pyvisa =A0 =A0 =A0 =A0 =A0 \
> @@ -55,17 +59,13 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-scapy =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-scons =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-sip =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-snmplib =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-soappy =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-spydi =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-spyro =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-tlslite =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-urwid =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-vmaps =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 python-twisted =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0python-webpy =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0moin =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0plone =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 twisted =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0zope"
>
> =A0#fixme add python-egenix-mx-base if brought in from nonworking
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


