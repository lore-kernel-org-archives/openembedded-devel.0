Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2D26B601DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:54:41 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id gd11so2380888vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BPeynd2obUlQn8bZy7HQdoSmMNcoJnuPBgeDjVyl+54=;
	b=vmCmHr6iZ4juQ6UaxIu8S0ZZqZHEdI2IrMB1DLZ+g8f+cBUSdPeNyxv808hfEr8tCv
	qm0mOgJZkbRX9t1hF7bRBS4URgYzqIgw3xyNxsvorHFPwE0IfE+ioojoLQJenRKRw65R
	oTCO/qB0+o/Gge+zqRorcofrBIM7H3lbZ5+KuggYMx64Ej16WkBeLGYEizbTl6VlGWM+
	WKPhuvjio2YeSznhv6XLYk6MjPYbYQTnNmQB0N3K78YQiP+oTHJcHxwvaFg1QxZHSNon
	npxdEFyW5uqE9s0zIEjBfUobwrtfwI6x3rWJaoNSs9mq4B+wUT3sE3C4vk3CxkWItPOe
	hZAQ==
MIME-Version: 1.0
X-Received: by 10.220.223.14 with SMTP id ii14mr5162279vcb.50.1371502481509;
	Mon, 17 Jun 2013 13:54:41 -0700 (PDT)
Received: by 10.52.19.48 with HTTP; Mon, 17 Jun 2013 13:54:41 -0700 (PDT)
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 17 Jun 2013 22:54:41 +0200
Message-ID: <CALbNGRTFJQwQq7h2emL+JCUdN6TQxpNj8Zg3mL1SiMpYHmGuXQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-oe/meta-xfce 00/15] updates and fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 20:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 7:34 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Additional note: 7+8 are preparations for latest versions of (lib)gnome-k=
eyring
> which is currently broken and I am fed up of backporting. Hope to get
> gnome-keyring update done soon.
>
> The following changes since commit b57465fc8c023b798b713766ca7d093a675218=
6b:
>
>   net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos (2013-06-10 11:18:3=
8 -0400)
>
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git updates=
-and-fixes

I spent more time on the polkit rules issue and found that:

>
> Andreas M=C3=BCller (15):
>       midori: update to 0.5.2
>       tumbler: add curl to dependencies to make build deterministic
>       tumbler: update to 0.1.29
>       poppler: update to 0.22.4
>       xfce4-xkb-plugin: update to 0.7.0 tarball
>       atkmm: add glibmm to DEPENDS
>       p11-kit: initial add 0.19.1
>       gcr: initial add 3.8.2
>       mozjs: initial add 17.0.0
>       polkit: update to 0.111
* the rights to /etc/polkit/rules.d are not working
>       networkmanager: rework settings/dependencies for polkit/consolekit
>       networkmanager: add group 'network' allowing members to change sett=
ings
* the comment is not valid for javascript
>       lxdm: remove consolekit dependencies in systemd environment and fix=
 build
>       xfce4-power-manager: rework polkit/consolekit selection and impleme=
nt polkit/systemd shutdown
>       xarchiver: update to 0.5.3 for various bugfixes
>
>  .../midori/{midori_0.5.0.bb =3D> midori_0.5.2.bb}    |    4 +-
>  meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb          |   20 +
>  .../50-org.freedesktop.NetworkManager.rules        |    8 +
>  .../networkmanager/networkmanager_0.9.8.0.bb       |   22 +-
>  ...-not-include-RequiredDefines.h-for-depend.patch |   35 +
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   35 +
>  ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 --
>  ...ession-Actually-return-TRUE-if-a-session-.patch |   46 --
>  .../polkit-0.104/obsolete_automake_macros.patch    |   23 -
>  .../{polkit-0.104 =3D> polkit}/polkit-1_pam.patch    |    0
>  .../polkit/{polkit_0.104.bb =3D> polkit_0.111.bb}    |   51 +-
>  meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb          |    2 +-
>  ...heck-only-for-ck-connector-in-case-consol.patch |   48 ++
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    6 +-
>  meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb  |   18 +
>  ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 --
>  .../{poppler_0.22.3.bb =3D> poppler_0.22.4.bb}       |    7 +-
>  .../{xarchiver_0.5.2.bb =3D> xarchiver_git.bb}       |   16 +-
>  ...xkb-plugin_git.bb =3D> xfce4-xkb-plugin_0.7.0.bb} |   13 +-
>  .../{tumbler_0.1.27.bb =3D> tumbler_0.1.29.bb}       |    6 +-
>  ...shutdown-reboot-functionality-for-systemd.patch |  677 ++++++++++++++=
++++++
>  .../xfce4-power-manager_1.2.0.bb                   |    9 +-
>  22 files changed, 926 insertions(+), 232 deletions(-)
>  rename meta-gnome/recipes-connectivity/midori/{midori_0.5.0.bb =3D> mido=
ri_0.5.2.bb} (89%)
>  create mode 100644 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/50-org.freedesktop.NetworkManager.rules
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do=
-not-include-RequiredDefines.h-for-depend.patch
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0001-Pol=
kitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0002-Pol=
kitUnixSession-Actually-return-TRUE-if-a-session-.patch
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/obsolete=
_automake_macros.patch
>  rename meta-oe/recipes-extended/polkit/{polkit-0.104 =3D> polkit}/polkit=
-1_pam.patch (100%)
>  rename meta-oe/recipes-extended/polkit/{polkit_0.104.bb =3D> polkit_0.11=
1.bb} (50%)
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-che=
ck-only-for-ck-connector-in-case-consol.patch
>  create mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-S=
plash.cc-add-cast-to-fix-build-for-enable-fi.patch
>  rename meta-oe/recipes-support/poppler/{poppler_0.22.3.bb =3D> poppler_0=
.22.4.bb} (80%)
>  rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.2.bb =3D> xarchiv=
er_git.bb} (60%)
>  rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_git.bb =3D>=
 xfce4-xkb-plugin_0.7.0.bb} (63%)
>  rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.27.bb =3D> tumbler_0.=
1.29.bb} (84%)
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001=
-Add-shutdown-reboot-functionality-for-systemd.patch
>
> --
Will send a V2 of this series

Andreas

