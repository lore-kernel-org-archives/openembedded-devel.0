Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 124207F931
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 03:44:01 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id v23so11899133qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 19:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eygKfI7966aLpUB1Jg+ceYF80QVVF9AdtEpWmwkREIc=;
	b=E0Qh9/aFg20n7O7FCw8AkqQDfMX0reomdm+lB9roOXoDBPXh0yzCeFIr0qR/3SC4QI
	i1qjpw1oaQx5a0t6R1A2c5jYeVyy62EJmtODVm1nVcD7R8iIyDSHcRhm1/XB6rhoV/lt
	+ZakyFKE02YYQedYC8z8MbbERpu/EDDMNzvxyt7P8Lh9J/cohCYrwLKWTXvtnL/GFGH8
	qKH2VqwU1TAFJDtbnO0MwazmtcOUFkdoZJhq+Qbb0l5k8k0tjUa+id2KC/tU9eelnJTz
	zmKuumrzWRP105wqOFhw+midddN3GCoejKybj/ICayygBAWlIaef4096kcCAg37eYTBw
	h7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eygKfI7966aLpUB1Jg+ceYF80QVVF9AdtEpWmwkREIc=;
	b=AiZ0NCElpwBVSKve/ttW4Hwm+f4hM0u9NOgyVSiqA9qh/dFseHMFxMGTwWsBavgicx
	9Wb9wk6fp6eEZii5HTBdF4iYKDFHiAOvqO7evobdgblbyuOnFOCQE1AmiN9eWqFuTtyM
	R6qu0tw7ZmyNOAxAqxstmYGwYP4+M11691A3wnnXXbWE4nAhFiUKb0TvewpgYHZunG+S
	/2N1cTjatrz/SppUl9iVoutZlZntraHgrd6Dry6AKLjq3Jn3+E/piwxyhVD+gud7mNfF
	avkl3cGv/dZQKTluZI1qHJlR7hy6oKA/Aun8mz5e94wZOFm9Ygbe7JitaoKzmySK0Bia
	Hjpg==
X-Gm-Message-State: APjAAAVslLAblPpyKqVyzUGJx+BlFU0VOmXtg6yiixHrzOMDZZP7KMwA
	95i27PARswNfmt7DklAVgAduSgXZU1gA4iVtw/w=
X-Google-Smtp-Source: APXvYqzqtlrAft+1UcJHt3Kv3rb09JoIlswpJQIYZetc54xOLqBAW4QF/9b/SR1oZFBNImn/J7Eyfr5xGkY3qvz1BMw=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr25756762qkf.337.1575863042326; 
	Sun, 08 Dec 2019 19:44:02 -0800 (PST)
MIME-Version: 1.0
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Dec 2019 19:43:35 -0800
Message-ID: <CAMKF1spMaEKSYuz-YZGnbY1RBM3LKwvvEUUfSBHj+m_q-tjPgA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 09 Dec 2019 03:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

can you rebase on master-next since some of these parches are already there

On Sun, Dec 8, 2019 at 4:39 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> V1 -> V2:
> * gjs 1.58.1 -> 1.58.3 (desperate attempt to fix mips/gobject-introspecti=
on/qemu)
> * gnome-control-center: distro-features + systemd
> * gnome-flashback: distro-features + systemd/pam
> * gnome-online-accounts: distro-features + x11
> * gnome-panel: distro-features + systemd/pam
> * gnome-session: distro-features + polkit systemd pam gobject-introspecti=
on-data
> * gnome-shell-extensions: distro-features + x11 polkit systemd pam / upst=
ream-version-is-even
> * gnome-shell distro-features + systemd pam
> * rest: --without-gnome
> * accountsservice: musl build fix
> * packagegroup-gnome-apps: add gnome-system-monitor only if polkit in dis=
tro feature
> * packagegroup-gnome-desktop: + polkit systemd pam gobject-introspection-=
data
> * some patches added to adjust required distro features (they popped up d=
uring tests)
>
> Andreas M=C3=BCller (29):
>   pinpoint: remove dead project
>   gnome-keyring: upgrade 3.28.2 -> 3.34.0
>   libgsf: upgrade 1.14.45 -> 1.14.46
>   libgnome-keyring: remove
>   gjs: initial add 1.58.3
>   gdm: re-add 3.34.1
>   gnome-shell: initial add 3.34.1
>   gnome-shell-extensions: initial add 3.34.1
>   accountsservice: initial add 0.6.55
>   rest: initial add 0.8.1
>   gnome-online-accounts: initial add 3.34.1
>   gvfs: upgrade 1.41.2 -> 1.42.1
>   grilo: initial add 0.3.10
>   gsound: initial add 1.0.2
>   gnome-control-center: re-add 3.34.1
>   gnome-session: inital add 3.34.1
>   gnome-backgrounds: initial add 3.34.0
>   metacity: upgrade 3.32.0 -> 3.34.1
>   gnome-panel: (re)add 3.34.1
>   gnome-flashback: initial add 3.34.1
>   Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
>   glfw: add features_check to inherit
>   stalonetray: Add x11 to required distro feature
>   projucer: add x11 to required distro features
>   colord-gtk: add polkit to required distro features
>   yelp: add x11 to required distro features
>   file-roller: remove nautilus from DEPENDS
>   libgdata: add x11 to required distro features
>   accountsservice: Hack musl build fix
>
> Kai Kang (1):
>   thunar: 1.8.9 -> 1.8.10
>
>  .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------
>  .../file-roller/file-roller_3.32.2.bb         |  1 -
>  .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
>  meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
>  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++
>  .../gnome-backgrounds_3.34.0.bb               | 17 +++++
>  ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
>  .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
>  .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
>  ...-agent-and-ssh-add-by-configure-opti.patch | 42 ++++++++++++
>  .../gnome-keyring/gnome-keyring_3.28.2.bb     | 44 -------------
>  .../gnome-keyring/gnome-keyring_3.34.0.bb     | 51 +++++++++++++++
>  .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 ---------
>  .../gnome-online-accounts_3.34.1.bb           | 35 ++++++++++
>  ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
>  .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
>  .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
>  .../gnome-shell-extensions_3.34.1.bb          | 29 +++++++++
>  .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
>  .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++
>  .../recipes-gnome/gsound/gsound_1.0.2.bb      | 13 ++++
>  .../gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.bb}   | 11 ++--
>  .../libgdata/libgdata_0.17.10.bb              |  5 +-
>  ...p-a-copy-paste-of-introspection.m4-m.patch |  0
>  .../{libgsf_1.14.45.bb =3D> libgsf_1.14.46.bb}  | 12 ++--
>  .../recipes-gnome/metacity/metacity_3.32.0.bb | 41 ------------
>  .../recipes-gnome/metacity/metacity_3.34.1.bb | 38 +++++++++++
>  meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 33 ++++++++++
>  meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |  5 +-
>  .../0001-musl-Hack-to-fix-build.patch         | 36 +++++++++++
>  .../0002-musl-add-missing-fgetspent_r.patch   | 46 +++++++++++++
>  .../accountsservice/accountsservice_0.6.55.bb | 33 ++++++++++
>  .../colord-gtk/colord-gtk_0.2.0.bb            |  4 ++
>  .../packagegroups/packagegroup-gnome-apps.bb  | 19 ++++++
>  .../packagegroup-gnome-desktop.bb             | 26 ++++++++
>  .../recipes-multimedia/juce/projucer.inc      |  4 +-
>  meta-oe/recipes-core/glfw/glfw_3.3.bb         |  2 +-
>  .../stalonetray/stalonetray_0.8.3.bb          |  4 +-
>  .../{thunar_1.8.9.bb =3D> thunar_1.8.10.bb}     |  7 +-
>  40 files changed, 954 insertions(+), 162 deletions(-)
>  delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file=
-installation.patch
>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-o=
n-host.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-back=
grounds_3.34.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-c=
ontrol-center/0001-Add-meson-option-to-pass-sysroot.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-c=
ontrol-center_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flashb=
ack_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_=
3.28.2.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_=
3.34.0.bb
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyri=
ng_3.12.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001=
-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34=
.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_=
3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-exte=
nsions_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34=
.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
>  create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
>  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.bb=
} (87%)
>  rename meta-gnome/recipes-gnome/libgsf/{files =3D> libgsf}/0001-configur=
e.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb =3D> libgsf_1.=
14.46.bb} (59%)
>  delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
>  create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/0001-musl-Hack-to-fix-build.patch
>  create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/0002-musl-add-missing-fgetspent_r.patch
>  create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice_0.6.55.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup=
-gnome-apps.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup=
-gnome-desktop.bb
>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.9.bb =3D> thunar_1.8.10=
.bb} (74%)
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

