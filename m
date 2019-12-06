Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id 517BC7FBEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 07:12:38 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c124so5740337qkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 23:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qkbaU8GJcql8lo3rQlmo8RJFNoLFN3/di/mLpKKJMVo=;
	b=Z/4bXya2uJm/urdNwpDrsBKvuHfVUZ9iofBW9ykaw2gK4x2i1g8JbXfVrReCEQff7u
	wvIIvgsVP7e82nubhG4YGRb2z85El4sWU8/giwWnhrK0xn5P72TjdXdmxqGEDWiOJ1wz
	Jrvj7rPTobVX1OhGavS41+mLtuTd4keLrb+yyuzK/RSCv7bQdGhVCsos5jRA/P15L6O6
	w6BK8yp38XIGF3gVt5FecIl7pQMDIxJi+aMnN0JLOD5KwL4cVDbjrgduLEecT8ZyMXYK
	P1sZpBEIPqnXqnbGx2NDAXItnosMozqPR5JQurw4oFqltfKRp2TD12OBT+vh91lqGjmo
	pfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qkbaU8GJcql8lo3rQlmo8RJFNoLFN3/di/mLpKKJMVo=;
	b=iP57/5UKe+k879EJo0B3j3BUxc3WpGB3DcZLHENbcgI9x5YSh3yMqKoHY5TJ2gn9Qj
	V0ZCc+YuG0G1F6bdT0jeZ1Dru4cnVxkCdX2FV5QElxavPl1upMgIs9qg2eNxJAdlPFUS
	GFb/63LuD3vOT813MJhWfAo0ZnjwfcVb5NNTBQKvMTBhcVYZRsYB78uw+RCkGbLcVX1C
	0551vHa4P53djjZehDj1zH7cqWAaa2EQYNdlEpe8t7lo0VfAzrwAh3z0VgDGLFXKTbp6
	049bSvkd+W6fEOQox5+Hf+MQXuu0BGonOxxVplOzCJNe2Y4ALMEhR0FutSQgOyd31c4l
	biBw==
X-Gm-Message-State: APjAAAX2+ki9kW1FYJUtKnYetFfuSbYb8ANkWt+ZS8AiBc7AE6LMkzvG
	/uukGr0Wy9bX2zNnSQuFJF6QymcAYLWzNe2dYPQ=
X-Google-Smtp-Source: APXvYqwGzbLXeX+IBOyiH+gCaD0IhZvLW4Z4/wHcE23uunmJUkA4zHTxyZ8DF6F2dq7lyCrO19t2b6QCWxMArpVAsrg=
X-Received: by 2002:a37:4cd3:: with SMTP id
	z202mr12728497qka.212.1575616358370; 
	Thu, 05 Dec 2019 23:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2019 23:12:11 -0800
Message-ID: <CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
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
X-List-Received-Date: Fri, 06 Dec 2019 07:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing below parsing errors

20:27:29 ERROR: Nothing PROVIDES 'gdm' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
DEPENDS on or otherwise requires it)
20:27:29 gdm was skipped: missing required distro feature 'systemd'
(not in DISTRO_FEATURES)
20:27:29 ERROR: Nothing PROVIDES 'gnome-settings-daemon' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
DEPENDS on or otherwise requires it)
20:27:29 gnome-settings-daemon was skipped: missing required distro
feature 'systemd' (not in DISTRO_FEATURES)
20:27:29 ERROR: Nothing PROVIDES 'mutter' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
DEPENDS on or otherwise requires it)
20:27:29 mutter was skipped: missing required distro feature 'systemd'
(not in DISTRO_FEATURES)
20:27:30 ERROR: Nothing RPROVIDES 'gdm-base' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:30 ERROR: Nothing RPROVIDES 'gnome-panel-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:30 No eligible RPROVIDERs exist for 'gnome-panel-dev'
20:27:30 ERROR: Nothing RPROVIDES 'gnome-panel' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:30 No eligible RPROVIDERs exist for 'gnome-panel'
20:27:31 ERROR: Nothing RPROVIDES 'wv' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-apps.bb
RDEPENDS on or otherwise requires it)
20:27:31 ERROR: Nothing RPROVIDES 'packagegroup-gnome-apps' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-apps.bb
RDEPENDS on or otherwise requires it)
20:27:31 No eligible RPROVIDERs exist for 'packagegroup-gnome-apps'
20:27:31 ERROR: Nothing RPROVIDES 'gnome-control-center' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:31 No eligible RPROVIDERs exist for 'gnome-control-center'
20:27:31 ERROR: Nothing RPROVIDES 'gnome-control-center-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:31 No eligible RPROVIDERs exist for 'gnome-control-center-dev'
20:27:32 ERROR: Nothing RPROVIDES 'gnome-shell' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-session/gnome-session_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:32 No eligible RPROVIDERs exist for 'gnome-shell'
20:27:32 ERROR: Nothing RPROVIDES 'gnome-settings-daemon' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-session/gnome-session_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:32 gnome-settings-daemon was skipped: missing required distro
feature 'systemd' (not in DISTRO_FEATURES)
20:27:32 ERROR: Nothing RPROVIDES 'gnome-session-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:32 No eligible RPROVIDERs exist for 'gnome-session-dev'
20:27:33 ERROR: Nothing RPROVIDES 'gnome-session' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-session/gnome-session_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:33 No eligible RPROVIDERs exist for 'gnome-session'
20:27:33 ERROR: Nothing RPROVIDES 'gnome-flashback-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:33 No eligible RPROVIDERs exist for 'gnome-flashback-dev'
20:27:33 ERROR: Nothing RPROVIDES 'gnome-flashback' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:33 No eligible RPROVIDERs exist for 'gnome-flashback'
20:27:33 ERROR: Nothing RPROVIDES 'gnome-shell-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:33 No eligible RPROVIDERs exist for 'gnome-shell-dev'
20:27:33 ERROR: Nothing RPROVIDES 'gnome-shell-extensions-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
RDEPENDS on or otherwise requires it)
20:27:33 No eligible RPROVIDERs exist for 'gnome-shell-extensions-dev'
20:27:34 ERROR: Nothing RPROVIDES 'gnome-shell-extensions' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb,
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:34 No eligible RPROVIDERs exist for 'gnome-shell-extensions'
20:27:34 ERROR: Nothing RPROVIDES 'packagegroup-gnome-desktop' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gno=
me/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
RDEPENDS on or otherwise requires it)
20:27:34 No eligible RPROVIDERs exist for 'packagegroup-gnome-desktop'

On Thu, Dec 5, 2019 at 7:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, Dec 5, 2019 at 4:09 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>>
>> Once passed Khem's autobuilder there are the following desktop session
>> available (yes tested - they work for me)
>>
>> * gnome-x11
>> * gnome-wayland
>> * gnome-classic (gnome2 experience: gnome-shell based)
>> * gnome-flashback (gnome2 experience: gnome-flashback/metacity based / n=
o
>>   graphics acceleration required)
>
>
> This is really good and fantastic job Andreas I have staged them in my yo=
e/mut branch will let you know how it all goes
>
>
>>
>> currently there the following known issues:
>>
>> * GDM does not display background image - have no idea if this is a bug
>> * Acivities does not display application icons for png
>>
>> Ahh and all this was tested with gdm and alternate / non gnome display-m=
anager
>> sddm because gdm does not match my needs as desktop environment collecto=
r.
>>
>> Andreas M=C3=BCller (21):
>>   pinpoint: remove dead project
>>   gnome-keyring: upgrade 3.28.2 -> 3.34.0
>>   libgsf: upgrade 1.14.45 -> 1.14.46
>>   libgnome-keyring: remove
>>   gjs: initial add 1.58.1
>>   gdm: re-add 3.34.1
>>   gnome-shell: initial add 3.34.1
>>   gnome-shell-extensions: initial add 3.34.1
>>   accountsservice: initial add 0.6.55
>>   rest: initial add 0.8.1
>>   gnome-online-accounts: initial add 3.34.1
>>   gvfs: upgrade 1.41.2 -> 1.42.1
>>   grilo: initial add 0.3.10
>>   gsound: initial add 1.0.2
>>   gnome-control-center: re-add 3.34.1
>>   gnome-session: inital add 3.34.1
>>   gnome-backgrounds: initial add 3.34.0
>>   metacity: upgrade 3.32.0 -> 3.34.1
>>   gnome-panel: (re)add 3.34.1
>>   gnome-flashback: initial add 3.34.1
>>   Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
>>
>>  .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------
>>  .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
>>  meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
>>  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
>>  meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb    | 37 +++++++++++
>>  .../gnome-backgrounds_3.34.0.bb               | 17 +++++
>>  ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
>>  .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
>>  .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
>>  ...-agent-and-ssh-add-by-configure-opti.patch | 42 ++++++++++++
>>  .../gnome-keyring/gnome-keyring_3.28.2.bb     | 44 -------------
>>  .../gnome-keyring/gnome-keyring_3.34.0.bb     | 51 +++++++++++++++
>>  .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 ---------
>>  .../gnome-online-accounts_3.34.1.bb           | 32 ++++++++++
>>  ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
>>  .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
>>  .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
>>  .../gnome-shell-extensions_3.34.1.bb          | 27 ++++++++
>>  .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
>>  .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++
>>  .../recipes-gnome/gsound/gsound_1.0.2.bb      | 13 ++++
>>  .../gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.bb}   | 11 ++--
>>  ...p-a-copy-paste-of-introspection.m4-m.patch |  0
>>  .../{libgsf_1.14.45.bb =3D> libgsf_1.14.46.bb}  | 12 ++--
>>  .../recipes-gnome/metacity/metacity_3.32.0.bb | 41 ------------
>>  .../recipes-gnome/metacity/metacity_3.34.1.bb | 38 +++++++++++
>>  meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 28 ++++++++
>>  .../accountsservice/accountsservice_0.6.55.bb | 29 +++++++++
>>  .../packagegroups/packagegroup-gnome-apps.bb  | 20 ++++++
>>  .../packagegroup-gnome-desktop.bb             | 26 ++++++++
>>  30 files changed, 838 insertions(+), 151 deletions(-)
>>  delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-fil=
e-installation.patch
>>  create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-=
on-host.patch
>>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-bac=
kgrounds_3.34.0.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-=
control-center/0001-Add-meson-option-to-pass-sysroot.patch
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-=
control-center_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flash=
back_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring=
/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
>>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring=
_3.28.2.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring=
_3.34.0.bb
>>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyr=
ing_3.12.0.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/000=
1-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.3=
4.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session=
_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-ext=
ensions_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.3=
4.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
>>  create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
>>  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb =3D> gvfs_1.42.1.b=
b} (87%)
>>  rename meta-gnome/recipes-gnome/libgsf/{files =3D> libgsf}/0001-configu=
re.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
>>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb =3D> libgsf_1=
.14.46.bb} (59%)
>>  delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
>>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
>>  create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
>>  create mode 100644 meta-gnome/recipes-support/accountsservice/accountss=
ervice_0.6.55.bb
>>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegrou=
p-gnome-apps.bb
>>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegrou=
p-gnome-desktop.bb
>>
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

