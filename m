Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TG59O-00038S-GH
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2012 11:40:26 +0200
Received: by iebc13 with SMTP id c13so3224813ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2012 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fT8haszWTtpZCRN9+mNLxbbF+xjNCBP4UEuxcW/vZsg=;
	b=bEUsEROe42w2ZvryPYxx8ZyTioX6on6yxtKBHC4W3MCq8aY2bgR/33HZtqDZnY+Qyr
	zIAoDH0AqzoNvXwSrCM/3jvK4UE762b4SJucgKG3o0nZBLToM11h9GlRDYYWxWimOh53
	zndFRPAHc6TByDlKkHFnJjbmRGaByZmO+WIwlVM0pGO84QccZuHreNlzpWXI7mEVfV0e
	FPpH21/l7hBZu7UZSywwEBszRQ/EmMpvh3W+HCSSX+MKCTJkvLzOJa3mGiqxNxDOmpGn
	JlmifIxz+6Fb2F+1z4eOl4/73R68S6shGwgk0O5RwXCOdsnxqvPpO3X/jWWNAuQrvZo+
	YshA==
MIME-Version: 1.0
Received: by 10.50.33.138 with SMTP id r10mr4717033igi.31.1348478855215; Mon,
	24 Sep 2012 02:27:35 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 24 Sep 2012 02:27:35 -0700 (PDT)
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 24 Sep 2012 11:27:35 +0200
Message-ID: <CALbNGRQ2MwHjQFoYQPnnoQHwGS7e=5M3uMQJTv_vB7Nj8L1+DA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce/-oe/-multimedia 00/40] xfce-4.10 and more
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
X-List-Received-Date: Mon, 24 Sep 2012 09:40:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 4:12 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Whole patch series was run-tested on gumstix overo with lxdm and without =
dm.
>
> The following changes since commit 72335a05f2b9a47aceec9e6f3881cd72092243=
43:
>
>   xfce4-session: Don't loose xfwm4 when closing session with multiple win=
dows waiting for user input (2012-09-17 10:42:34 +0200)
>
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xfce-4.=
10
>
> Andreas M=FCller (40):
>       lxdm: initial add 1.22_git
>       xfce.bbclass: change SRC_URI calculation
>       xfce4-dev-tools: update to 4.10.0 and oe-stylize a bit
>       libxfce4util: update to 4.10.0
>       libxfce4ui: update to 4.10.0
>       garcon: update to 0.2.0
>       exo: update to 0.8.0
>       xfce-utils: remove since they are not needed anymore
>       xfconf: update to 4.10.0
>       xfce4-session: update to 4.10.0
>       xfce4-settings: update to 4.10.0 and set default themes
>       xfwm4: update to 4.10.0
>       packagegreoup-xfce-extended: only RDEPEND on themes shipped by xfwm=
4
>       packagegroup-xfce-base: no need to RDEPEND xfwm4-theme-default - xf=
wm4 does already
>       xfwm4-themes: initial add 4.10.0
>       xfce4-panel: update to 4.10.0
>       thunar: update to 1.4.0
>       xfdesktop update to 4.10.0
>       xfce4-appfinder: update to 4.10.0
>       tumbler: update to 0.1.25
>       thunar-volman: update to 0.8.0
>       gtk-xfce-engine: update to 3.0.1 and restructure
>       ristretto: update to 0.6.0
>       xfce4-wavelan-plugin: update to 0.5.11
>       xfce4-screenshooter: update to 1.8.1
>       xfce4-netload-plugin: update to 1.2.0
>       xfce4-diskperf-plugin: update to 2.5.4
>       xfce4-places-plugin: update to 1.4.0
>       xfce4-cpugraph-plugin: update to 1.0.5
>       xfce4-systemload-plugin: update to 1.1.1
>       xfce4-fsguard-plugin: initial add 1.0.1
>       xfce4-battery-plugin: initial add 1.0.5
>       packagegroup-xfce-extended: add xfce4-fsguard-plugin and xfce4-batt=
ery-plugin
>       midori: update to 0.4.6
>       libmpd: initial add 11.8.17
>       mpd: Initial add 0.17.1
>       xfce4-mpc-plugin: initial add 0.4.4
>       xfmpc: initial add 0.2.2
>       packagegroup-xfce-multimedia: initial add
>       README: add some layer dependency hints
>
>  .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |   11 +
>  .../recipes-multimedia/musicpd/mpd/mpd.conf.in     |  420 ++++++++++++++=
++
>  .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |   44 ++
>  .../midori/{midori_0.4.5.bb =3D> midori_0.4.6.bb}    |    4 +-
>  ...conf.in-blacklist-root-for-release-images.patch |   29 ++
>  meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam        |   13 +
>  meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug  |   13 +
>  meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf       |    4 +
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   62 +++
>  .../recipes-multimedia/musicpd/mpd_0.17.1.bbappend |   14 +
>  .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 +
>  .../recipes-graphics/lxdm/lxdm_git.bbappend        |   16 +
>  meta-xfce/README                                   |    6 +
>  meta-xfce/classes/xfce.bbclass                     |    7 +-
>  .../{ristretto_0.3.5.bb =3D> ristretto_0.6.3.bb}     |    7 +-
>  .../files/0001-Fix-panel-plugin-build.patch        |   43 ++
>  ...ooter_1.8.0.bb =3D> xfce4-screenshooter_1.8.1.bb} |   11 +-
>  .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |   19 +
>  .../packagegroups/packagegroup-xfce-multimedia.bb  |   10 +
>  .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb     |   15 +
>  meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb  |   13 +
>  .../battery/xfce4-battery-plugin_1.0.5.bb          |    9 +
>  ...gin_1.0.2.bb =3D> xfce4-cpugraph-plugin_1.0.5.bb} |    4 +-
>  ...gin_2.5.3.bb =3D> xfce4-diskperf-plugin_2.5.4.bb} |    4 +-
>  .../fsguard/xfce4-fsguard-plugin_1.0.1.bb          |    9 +
>  ...ugin_1.1.0.bb =3D> xfce4-netload-plugin_1.2.0.bb} |    4 +-
>  ...lugin_1.3.0.bb =3D> xfce4-places-plugin_1.4.0.bb} |    4 +-
>  ...n_1.1.0.bb =3D> xfce4-systemload-plugin_1.1.1.bb} |    4 +-
>  ...in_0.5.10.bb =3D> xfce4-wavelan-plugin_0.5.11.bb} |    4 +-
>  .../recipes-xfce/exo/exo/exo-no-tests-0.6.patch    |   12 -
>  .../recipes-xfce/exo/exo/exo-no-tests-0.8.patch    |   31 ++
>  .../exo/exo/fix-qa-desktop-type-error.patch        |  531 --------------=
------
>  .../exo/{exo_0.6.2.bb =3D> exo_0.8.0.bb}             |   15 +-
>  .../garcon/{garcon_0.1.10.bb =3D> garcon_0.2.0.bb}   |    6 +-
>  ...-a-graduent-pattern-at-each-draw-bug-8521.patch |   30 --
>  .../gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb       |   18 -
>  .../gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb       |   23 +
>  .../{libxfce4ui_4.8.1.bb =3D> libxfce4ui_4.10.0.bb}  |    6 +-
>  ...ibxfce4util_4.8.2.bb =3D> libxfce4util_4.10.0.bb} |    8 +-
>  .../packagegroups/packagegroup-xfce-base.bb        |    4 +-
>  .../packagegroups/packagegroup-xfce-extended.bb    |    9 +-
>  ...unar-volman_0.6.0.bb =3D> thunar-volman_0.8.0.bb} |    7 +-
>  .../thunar/{thunar_1.2.3.bb =3D> thunar_1.4.0.bb}    |   10 +-
>  .../{tumbler_0.1.23.bb =3D> tumbler_0.1.25.bb}       |    8 +-
>  .../recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb    |   20 -
>  .../xfce4-appfinder/xfce4-appfinder_4.10.0.bb      |   10 +
>  .../xfce4-appfinder/xfce4-appfinder_4.8.0.bb       |   12 -
>  ...ev-tools_4.8.0.bb =3D> xfce4-dev-tools_4.10.0.bb} |   11 +-
>  ...{xfce4-panel_4.8.6.bb =3D> xfce4-panel_4.10.0.bb} |   10 +-
>  ...ltiple-interactive-session-save-bug-5379.patch} |   61 +--
>  ...e4-session_4.8.3.bb =3D> xfce4-session_4.10.0.bb} |   14 +-
>  ...settingsd-use-gnome-as-default-icon-theme.patch |   29 --
>  ...ttings.xml-remove-trouble-causing-comment.patch |   31 ++
>  .../0002-xsettings.xml-Set-default-themes.patch    |   32 ++
>  ...-settings_4.8.3.bb =3D> xfce4-settings_4.10.0.bb} |    8 +-
>  .../xfconf/{xfconf_4.8.0.bb =3D> xfconf_4.10.0.bb}   |    8 +-
>  .../xfdesktop/relative-symlinks-docs.patch         |   31 --
>  .../recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb     |   12 +
>  .../recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb      |   19 -
>  .../xfwm4/{xfwm4_4.8.3.bb =3D> xfwm4_4.10.0.bb}      |    7 +-
>  60 files changed, 1000 insertions(+), 846 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.=
8.17.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/mpd.co=
nf.in
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1=
.bb
>  rename meta-oe/recipes-connectivity/midori/{midori_0.4.5.bb =3D> midori_=
0.4.6.bb} (90%)
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-=
blacklist-root-for-release-images.patch
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm_git.bb
>  create mode 100644 meta-systemd/meta-multimedia/recipes-multimedia/music=
pd/mpd_0.17.1.bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.=
service.in
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.b=
bappend
>  rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.5.bb =3D> ristret=
to_0.6.3.bb} (55%)
>  create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001=
-Fix-panel-plugin-build.patch
>  rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1=
.8.0.bb =3D> xfce4-screenshooter_1.8.1.bb} (58%)
>  create mode 100644 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.=
0.bb
>  create mode 100644 meta-xfce/recipes-multimedia/packagegroups/packagegro=
up-xfce-multimedia.bb
>  create mode 100644 meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-m=
pc-plugin_0.4.4.bb
>  create mode 100644 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
>  create mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery=
-plugin_1.0.5.bb
>  rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1=
.0.2.bb =3D> xfce4-cpugraph-plugin_1.0.5.bb} (66%)
>  rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2=
.5.3.bb =3D> xfce4-diskperf-plugin_2.5.4.bb} (66%)
>  create mode 100644 meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard=
-plugin_1.0.1.bb
>  rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.1=
.0.bb =3D> xfce4-netload-plugin_1.2.0.bb} (66%)
>  rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.3.0=
.bb =3D> xfce4-places-plugin_1.4.0.bb} (68%)
>  rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plug=
in_1.1.0.bb =3D> xfce4-systemload-plugin_1.1.1.bb} (70%)
>  rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5=
.10.bb =3D> xfce4-wavelan-plugin_0.5.11.bb} (67%)
>  delete mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
>  create mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
>  delete mode 100644 meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-er=
ror.patch
>  rename meta-xfce/recipes-xfce/exo/{exo_0.6.2.bb =3D> exo_0.8.0.bb} (67%)
>  rename meta-xfce/recipes-xfce/garcon/{garcon_0.1.10.bb =3D> garcon_0.2.0=
.bb} (53%)
>  delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don=
-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
>  delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engin=
e_2.9.0.bb
>  create mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engin=
e_3.0.1.bb
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.8.1.bb =3D> libxf=
ce4ui_4.10.0.bb} (56%)
>  rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.8.2.bb =3D> l=
ibxfce4util_4.10.0.bb} (54%)
>  rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.6.0.bb =3D>=
 thunar-volman_0.8.0.bb} (50%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.2.3.bb =3D> thunar_1.4.0.=
bb} (71%)
>  rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.23.bb =3D> tumbler_0.=
1.25.bb} (83%)
>  delete mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinde=
r_4.10.0.bb
>  delete mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinde=
r_4.8.0.bb
>  rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.8.0.bb =
=3D> xfce4-dev-tools_4.10.0.bb} (71%)
>  rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.8.6.bb =3D> xfc=
e4-panel_4.10.0.bb} (81%)
>  rename meta-xfce/recipes-xfce/xfce4-session/files/{0001-Don-t-loose-xfwm=
4-when-closing-session-with-multiple.patch =3D> 0001-Handle-multiple-intera=
ctive-session-save-bug-5379.patch} (77%)
>  rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.8.3.bb =3D>=
 xfce4-session_4.10.0.bb} (62%)
>  delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
0001-xsettings.xml-remove-trouble-causing-comment.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
0002-xsettings.xml-Set-default-themes.patch
>  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.8.3.bb =
=3D> xfce4-settings_4.10.0.bb} (50%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.8.0.bb =3D> xfconf_4.10.0=
.bb} (69%)
>  delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-s=
ymlinks-docs.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
>  delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.8.3.bb =3D> xfwm4_4.10.0.bb=
} (81%)
>
> --
> 1.7.6.5
>
ping^


