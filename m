Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id E31A27FA13
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 03:10:55 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id m188so5330918qkc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 19:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dMO7nk8ku4ZmtRzl5YVHjke1wOOqAvQamjyTTx/JnvY=;
	b=ZvYFk0aJbQkgdqBkEWuulhoPewELECLcqDv91aayN+DIQFOPoXjYzt2T/xxMCNOjMd
	Ghw2vGeiv/FHxsCByw/b54WhM+5NXGZHdAZo6j2VfON0fu4i2K5hsvIXSs3FWVCtfggC
	GDraMx+OSWwIphjaE8tLwBx2YMJb6Haq5YPYQqHP3YBCnvVD09BQ7J8lJ0ujZXZldesl
	Bv9CgcG+WoR+mItilP5PUnDP93/pPLip7kCMlQIPogf9coNoFQ4Mu35oJhXB8M3D1IPF
	X07qNrLlvxnFHyXC0cGNSnePKALrBwBRZ7zqrMkSON7nIG6y3TE9TOibXeoJJq86mdF8
	vOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dMO7nk8ku4ZmtRzl5YVHjke1wOOqAvQamjyTTx/JnvY=;
	b=JrAcnLdTj7+41bfzFJPL86yBcQ2vM4Way/Ub4cDrHM89E/+l462wCojrOl19USC8Qz
	MlurBDOqecYlINXR72l6YTsO2sqQrtz5zL4jT4GfZokHKvyt4ENNmJC3L438WpBltuiE
	Z0v2mwlSXsO/u5o3ryBOaLcPf2ctyAC2HjEgqXRTFRWmSsERgR8ET7mTxWKr/U6xE16a
	s3/8HIWvAvq97lFUEEeeuvAMP++7rJuCQdj1tao2vQLf3KPCcbZvbLMd5eA32VHDPk3S
	0CzPImp0W+O6aB/U/YMztopvhXWRDeR4wIIe9FScteWFN8d+cHh2oUGWXk0BneQ1t542
	PVxQ==
X-Gm-Message-State: APjAAAVcNJayV21CbFoM0mqPMRK2s01QTXvlq22yJD2AVTMHyeIwzYzz
	9fbykO5AJFa2vuQNZzOISn/iib+pc08ZS7efizQ=
X-Google-Smtp-Source: APXvYqzn5AgHBHvJLT8K0GEdN3HJYy0nFIrWi9LNT06PcX6cW2iziejKPLFf5Eun4VGDSwlKIg8ECc5AZ1EK2E9zX/o=
X-Received: by 2002:a37:4cd3:: with SMTP id
	z202mr12075286qka.212.1575601856192; 
	Thu, 05 Dec 2019 19:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2019 19:10:45 -0800
Message-ID: <CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 06 Dec 2019 03:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 4:09 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> Once passed Khem's autobuilder there are the following desktop session
> available (yes tested - they work for me)
>
> * gnome-x11
> * gnome-wayland
> * gnome-classic (gnome2 experience: gnome-shell based)
> * gnome-flashback (gnome2 experience: gnome-flashback/metacity based / no
>   graphics acceleration required)
>

This is really good and fantastic job Andreas I have staged them in my
yoe/mut branch will let you know how it all goes



> currently there the following known issues:
>
> * GDM does not display background image - have no idea if this is a bug
> * Acivities does not display application icons for png
>
> Ahh and all this was tested with gdm and alternate / non gnome
> display-manager
> sddm because gdm does not match my needs as desktop environment collector=
.
>
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
>  create mode 100644
> meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
>  create mode 100644
> meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/
> gnome-backgrounds_3.34.0.bb
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-A=
dd-meson-option-to-pass-sysroot.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/
> gnome-control-center_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/
> gnome-flashback_3.34.1.bb
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ss=
h-agent-and-ssh-add-by-configure-opti.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/
> gnome-keyring_3.28.2.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/
> gnome-keyring_3.34.0.bb
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/
> libgnome-keyring_3.12.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/
> gnome-online-accounts_3.34.1.bb
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-=
ZONEINFO-it-tries-to-run-compiled.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/
> gnome-panel_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-session/
> gnome-session_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/
> gnome-shell-extensions_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/
> gnome-shell_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
>  create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
>  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.bb=
}
> (87%)
>  rename meta-gnome/recipes-gnome/libgsf/{files =3D>
> libgsf}/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
> (100%)
>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb =3D>
> libgsf_1.14.46.bb} (59%)
>  delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
>  create mode 100644 meta-gnome/recipes-support/accountsservice/
> accountsservice_0.6.55.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/
> packagegroup-gnome-apps.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/
> packagegroup-gnome-desktop.bb
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

