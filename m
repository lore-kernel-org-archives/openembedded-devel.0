Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id E719D6BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 07:58:03 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id y8so1459551qvk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 23:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S/OcwFKdEDhWwgo/C5gXY1RkpadPRJZ9byxeV/ZSLUE=;
	b=iJLJQFRxqXNvIO597t8UCPab3Z1cdFqwuM1s05HL9qCQHqJi7vbBThz1fWTd8vjkZQ
	ieIfCmkK3csK+P4jfN0nACjyUsWIftPxNuRoKCmL7RiL1BCEdfGj9pXtXK6AHBod+zx3
	j5bD/7WmzOrXtZWivZerkLU4aHTa10khpnwhfv932sral3HCZlW48wfWhkoJoxcSUU58
	BCqQtzx1MZMk7UNy4XTDkQtraWNOqbNrUZBUdGYzow5w/vo8X7YvMsawvJHlFwxYdODj
	TvPvAfpxlm/OSLY0B2cR6pFg3jT1IAe2wr+Y+8OsV/kFhQvJ65U/5ibjwQgqjP9wrECl
	ZuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S/OcwFKdEDhWwgo/C5gXY1RkpadPRJZ9byxeV/ZSLUE=;
	b=h/GpURIXisDWreC0goCwd8IvSKYOnDj8IqS+aF3ZMfyYf0Sf/AW++GlvsL5497epj4
	dAebNSR4pmrjEqRKIApcPwme0eeA/jereagf+N67cyzBVRlFbsRlOE/CcIR+OTXTolp/
	+oyoilDL13Cr2bppQDFcCBjdleiJAfP8kv8kSTjoGYg+0PE7SbZM1tSJ50w7ZLgahRO6
	P55vl1a3EYRfoMwHzchyfWvTg8V76JnIrdeE31aEWGfLXmM+mxjobASD/C7hOGrnj6+T
	/ZVdiy9WoiwXGwOi6czXXuFgpRJRazk+fGszfRHYBLQV/ctf7yPUEfl0Zg4qj0nbV8f/
	bKpQ==
X-Gm-Message-State: APjAAAXY0qlDaOaa/7j3DlulutSjQhldGOGLw0Y/JTy2Dv+8VIQLjeB/
	9rGla6EACvf1ojTB2tRo3bs23jOnP3QXT3XEvjg=
X-Google-Smtp-Source: APXvYqynuZSnRz3ATtSCDm2jTVtbfViHdGCDmk5S1hS7thSbJzI2ztLGRukGi4vu9snqhRyjSZ+WT/aHMW9ZYnsofQY=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr21286586qvm.206.1576396684446;
	Sat, 14 Dec 2019 23:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Dec 2019 23:57:37 -0800
Message-ID: <CAMKF1sq=oFvgEtCbSOtpgLsZZow669uqadeXmf4x3ydrPBVODg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Sun, 15 Dec 2019 07:58:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 4:09 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Once passed Khem's autobuilder there are the following desktop session
> available (yes tested - they work for me)
>
> * gnome-x11
> * gnome-wayland
> * gnome-classic (gnome2 experience: gnome-shell based)
> * gnome-flashback (gnome2 experience: gnome-flashback/metacity based / no
>   graphics acceleration required)
>
> currently there the following known issues:
>
> * GDM does not display background image - have no idea if this is a bug
> * Acivities does not display application icons for png
>
> Ahh and all this was tested with gdm and alternate / non gnome display-ma=
nager
> sddm because gdm does not match my needs as desktop environment collector=
.
>

can you share your image recipe ? perhaps we should have a reference
image anyway in meta-gnome.

> Andreas M=C3=BCller (21):
>   pinpoint: remove dead project
>   gnome-keyring: upgrade 3.28.2 -> 3.34.0
>   libgsf: upgrade 1.14.45 -> 1.14.46
>   libgnome-keyring: remove
>   gjs: initial add 1.58.1
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
>
>  .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------
>  .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
>  meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
>  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb    | 37 +++++++++++
>  .../gnome-backgrounds_3.34.0.bb               | 17 +++++
>  ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
>  .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
>  .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
>  ...-agent-and-ssh-add-by-configure-opti.patch | 42 ++++++++++++
>  .../gnome-keyring/gnome-keyring_3.28.2.bb     | 44 -------------
>  .../gnome-keyring/gnome-keyring_3.34.0.bb     | 51 +++++++++++++++
>  .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 ---------
>  .../gnome-online-accounts_3.34.1.bb           | 32 ++++++++++
>  ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
>  .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
>  .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
>  .../gnome-shell-extensions_3.34.1.bb          | 27 ++++++++
>  .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
>  .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++
>  .../recipes-gnome/gsound/gsound_1.0.2.bb      | 13 ++++
>  .../gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.bb}   | 11 ++--
>  ...p-a-copy-paste-of-introspection.m4-m.patch |  0
>  .../{libgsf_1.14.45.bb =3D> libgsf_1.14.46.bb}  | 12 ++--
>  .../recipes-gnome/metacity/metacity_3.32.0.bb | 41 ------------
>  .../recipes-gnome/metacity/metacity_3.34.1.bb | 38 +++++++++++
>  meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 28 ++++++++
>  .../accountsservice/accountsservice_0.6.55.bb | 29 +++++++++
>  .../packagegroups/packagegroup-gnome-apps.bb  | 20 ++++++
>  .../packagegroup-gnome-desktop.bb             | 26 ++++++++
>  30 files changed, 838 insertions(+), 151 deletions(-)
>  delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file=
-installation.patch
>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-o=
n-host.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
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
rvice_0.6.55.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup=
-gnome-apps.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup=
-gnome-desktop.bb
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

