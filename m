Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id BEC9E7FA19
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:26:16 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id w13so11990600ilo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T1shBwbVhzXmZTyIB4UG/VtP4TMMJoRKY+IGVMJ8Uq4=;
	b=doPbXbIDoiRjFbZR7QolsmCKlcXVc4OhXOonUvUPFj1KUWa1FYQ2q200O2vZI9P7PP
	8ToCQ9RVRMhJkn19BeVP/yr76044VhK+/0bWPQIR+oS+jMH7QDrThy1509FIo183zdzW
	mWhWS7R98mjl72Krb8PKFZKLTp0XBXv7rJnh2ZfmpQhSRzTlUO8r7KguUtVYnjje0mhO
	D3oaRcHiGouxQZNH3jfzvj8cPi77trWvuD1pLTxTsP0Z37O/PtFJbpZ0oFpvCJuQsiZS
	tpBwV0c9cFo1XAjjDEVORANLXBtEcERlS4AmtXB/mTGvewiKtoFkv95pMjPOefdXLUm0
	Jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T1shBwbVhzXmZTyIB4UG/VtP4TMMJoRKY+IGVMJ8Uq4=;
	b=iysHLgakCEAHQLF1pOBtOU8Juz1P1lKTz9hOK2z0ApyVfsBshyZD+LIj0P0uWkRUlH
	WjjpHdnEvAOSwDTlNgR8sg9hlt4Hxyn6g7+39gOk8RSSEoLU/h8/mznhOEcva3xDnjER
	34JTB3u9fmMRNV7HonmFwSk2DE3/NyQlhbWbwo0oQi+3Ki7K/vHCw6Z/7p5dx6N9Cgmv
	bABD6oVw7V8NMMkyOjRZQPJj3jzY4gXcMTiqzlx6hkfBZjsADZAjBP/5CxbBHHlhugRL
	GRd4FLWLULFfffD+myDnhzyRjdBsbo0s1wFTm/1ZNT8gNjtDxSNy83i5GkSO9Xoo38yJ
	0i9A==
X-Gm-Message-State: APjAAAWaOpMqt9NkimdglbWgZDhiybzcXstRkHdvbONwJyitqpfi5ugs
	qmRTr2x7m1ryZXSaE7zr9LMVNp3a4Htv7Poj0Xg=
X-Google-Smtp-Source: APXvYqxhLi1HI0q9K21tMIwtE28ZUgFvUPPZh4U5jYAW4L+tO09z/JLTcBGuafHM3xFr4P3HWom5McB+161+N4LZ2GI=
X-Received: by 2002:a92:d30e:: with SMTP id x14mr27402500ila.108.1575879977637;
	Mon, 09 Dec 2019 00:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
	<CAMKF1spMaEKSYuz-YZGnbY1RBM3LKwvvEUUfSBHj+m_q-tjPgA@mail.gmail.com>
In-Reply-To: <CAMKF1spMaEKSYuz-YZGnbY1RBM3LKwvvEUUfSBHj+m_q-tjPgA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 9 Dec 2019 09:26:06 +0100
Message-ID: <CALbNGRRvgPKTuw4BJdPzFzjNmv4fK5UezMcNn0yHk=pv3sTKuQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v2 00/29] Gnome cleanups & desktop patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2019 08:26:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2019 at 4:44 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> can you rebase on master-next since some of these parches are already the=
re
Yes can do do that

Andreas
>
> On Sun, Dec 8, 2019 at 4:39 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> >
> > V1 -> V2:
> > * gjs 1.58.1 -> 1.58.3 (desperate attempt to fix mips/gobject-introspec=
tion/qemu)
> > * gnome-control-center: distro-features + systemd
> > * gnome-flashback: distro-features + systemd/pam
> > * gnome-online-accounts: distro-features + x11
> > * gnome-panel: distro-features + systemd/pam
> > * gnome-session: distro-features + polkit systemd pam gobject-introspec=
tion-data
> > * gnome-shell-extensions: distro-features + x11 polkit systemd pam / up=
stream-version-is-even
> > * gnome-shell distro-features + systemd pam
> > * rest: --without-gnome
> > * accountsservice: musl build fix
> > * packagegroup-gnome-apps: add gnome-system-monitor only if polkit in d=
istro feature
> > * packagegroup-gnome-desktop: + polkit systemd pam gobject-introspectio=
n-data
> > * some patches added to adjust required distro features (they popped up=
 during tests)
> >
> > Andreas M=C3=BCller (29):
> >   pinpoint: remove dead project
> >   gnome-keyring: upgrade 3.28.2 -> 3.34.0
> >   libgsf: upgrade 1.14.45 -> 1.14.46
> >   libgnome-keyring: remove
> >   gjs: initial add 1.58.3
> >   gdm: re-add 3.34.1
> >   gnome-shell: initial add 3.34.1
> >   gnome-shell-extensions: initial add 3.34.1
> >   accountsservice: initial add 0.6.55
> >   rest: initial add 0.8.1
> >   gnome-online-accounts: initial add 3.34.1
> >   gvfs: upgrade 1.41.2 -> 1.42.1
> >   grilo: initial add 0.3.10
> >   gsound: initial add 1.0.2
> >   gnome-control-center: re-add 3.34.1
> >   gnome-session: inital add 3.34.1
> >   gnome-backgrounds: initial add 3.34.0
> >   metacity: upgrade 3.32.0 -> 3.34.1
> >   gnome-panel: (re)add 3.34.1
> >   gnome-flashback: initial add 3.34.1
> >   Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
> >   glfw: add features_check to inherit
> >   stalonetray: Add x11 to required distro feature
> >   projucer: add x11 to required distro features
> >   colord-gtk: add polkit to required distro features
> >   yelp: add x11 to required distro features
> >   file-roller: remove nautilus from DEPENDS
> >   libgdata: add x11 to required distro features
> >   accountsservice: Hack musl build fix
> >
> > Kai Kang (1):
> >   thunar: 1.8.9 -> 1.8.10
> >
> >  .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------
> >  .../file-roller/file-roller_3.32.2.bb         |  1 -
> >  .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
> >  meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
> >  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
> >  meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++
> >  .../gnome-backgrounds_3.34.0.bb               | 17 +++++
> >  ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
> >  .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
> >  .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
> >  ...-agent-and-ssh-add-by-configure-opti.patch | 42 ++++++++++++
> >  .../gnome-keyring/gnome-keyring_3.28.2.bb     | 44 -------------
> >  .../gnome-keyring/gnome-keyring_3.34.0.bb     | 51 +++++++++++++++
> >  .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 ---------
> >  .../gnome-online-accounts_3.34.1.bb           | 35 ++++++++++
> >  ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
> >  .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
> >  .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
> >  .../gnome-shell-extensions_3.34.1.bb          | 29 +++++++++
> >  .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
> >  .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++
> >  .../recipes-gnome/gsound/gsound_1.0.2.bb      | 13 ++++
> >  .../gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.bb}   | 11 ++--
> >  .../libgdata/libgdata_0.17.10.bb              |  5 +-
> >  ...p-a-copy-paste-of-introspection.m4-m.patch |  0
> >  .../{libgsf_1.14.45.bb =3D> libgsf_1.14.46.bb}  | 12 ++--
> >  .../recipes-gnome/metacity/metacity_3.32.0.bb | 41 ------------
> >  .../recipes-gnome/metacity/metacity_3.34.1.bb | 38 +++++++++++
> >  meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 33 ++++++++++
> >  meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |  5 +-
> >  .../0001-musl-Hack-to-fix-build.patch         | 36 +++++++++++
> >  .../0002-musl-add-missing-fgetspent_r.patch   | 46 +++++++++++++
> >  .../accountsservice/accountsservice_0.6.55.bb | 33 ++++++++++
> >  .../colord-gtk/colord-gtk_0.2.0.bb            |  4 ++
> >  .../packagegroups/packagegroup-gnome-apps.bb  | 19 ++++++
> >  .../packagegroup-gnome-desktop.bb             | 26 ++++++++
> >  .../recipes-multimedia/juce/projucer.inc      |  4 +-
> >  meta-oe/recipes-core/glfw/glfw_3.3.bb         |  2 +-
> >  .../stalonetray/stalonetray_0.8.3.bb          |  4 +-
> >  .../{thunar_1.8.9.bb =3D> thunar_1.8.10.bb}     |  7 +-
> >  40 files changed, 954 insertions(+), 162 deletions(-)
> >  delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-fi=
le-installation.patch
> >  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests=
-on-host.patch
> >  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_3.34.0.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome=
-control-center/0001-Add-meson-option-to-pass-sysroot.patch
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome=
-control-center_3.34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flas=
hback_3.34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyrin=
g/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
> >  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyrin=
g_3.28.2.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyrin=
g_3.34.0.bb
> >  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-key=
ring_3.12.0.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnom=
e-online-accounts_3.34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/00=
01-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.=
34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-sessio=
n_3.34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-ex=
tensions_3.34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.=
34.1.bb
> >  create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
> >  create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
> >  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.=
bb} (87%)
> >  rename meta-gnome/recipes-gnome/libgsf/{files =3D> libgsf}/0001-config=
ure.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
> >  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb =3D> libgsf_=
1.14.46.bb} (59%)
> >  delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.32.0.b=
b
> >  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.34.1.b=
b
> >  create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
> >  create mode 100644 meta-gnome/recipes-support/accountsservice/accounts=
service/0001-musl-Hack-to-fix-build.patch
> >  create mode 100644 meta-gnome/recipes-support/accountsservice/accounts=
service/0002-musl-add-missing-fgetspent_r.patch
> >  create mode 100644 meta-gnome/recipes-support/accountsservice/accounts=
service_0.6.55.bb
> >  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegro=
up-gnome-apps.bb
> >  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegro=
up-gnome-desktop.bb
> >  rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.9.bb =3D> thunar_1.8.=
10.bb} (74%)
> >
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

