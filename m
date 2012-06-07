Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ScZXq-0004cK-K7
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 12:02:22 +0200
Received: by yenl13 with SMTP id l13so210479yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2012 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vjrPTWFu3XmZc4MolbF4iUIomaGP3ZDdWlDmgLgNxaM=;
	b=kid9AHZqoLLOrNwBbtH1+R+LUclpaNNQYDkhn1Frpj3wBLNuBhi7NXdH4hon1LiOCf
	gaLm8sCzgIL24TAhMvNrZSMlBd6rPVoMIqkLT0lOjAOiPJz8kA8FqUftvSn2E/HY1kMI
	k5IkKmDKHSCgwEh5VpwGEEQNBfjRPO2X0efTOPgOCfR0mUn1EHyZ0Vtv4xQkua+JI6N8
	qw63UZnAJQIGk12tMYoaSh7lSpdvcpk2q8qI+8atcWQPPUSFnrVFCKwz4AVXj4N4SJjm
	TiTu7rT5yABZAv7MlQOEjDoeeAYTz7Fl7WogKVOj0JpEnpWufp1CAN3trpZixtPHzl8w
	8KpQ==
MIME-Version: 1.0
Received: by 10.60.32.113 with SMTP id h17mr1390359oei.40.1339062713814; Thu,
	07 Jun 2012 02:51:53 -0700 (PDT)
Received: by 10.76.1.68 with HTTP; Thu, 7 Jun 2012 02:51:53 -0700 (PDT)
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 7 Jun 2012 11:51:53 +0200
Message-ID: <CALbNGRSd7cUwPbTjcaf+cJHdRrA-=+sW6fAchu0_FURkqoSUzQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce 00/15] bugfix, new panel plugins ans xfce4-mixer
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
X-List-Received-Date: Thu, 07 Jun 2012 10:02:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 2, 2012 at 2:15 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> All have been run tested on angstrom/overo
>
> Andreas M=FCller (15):
> =A0xfce4-session: add consolekit to RDEPENDS
> =A0xfce4-xkb-plugin 0.5.4.3 inital add
> =A0xfce4-wavelan-plugin: initial add 0.5.10
> =A0xfce4-places-plugin: initial add 1.3.0
> =A0xfce4-datetime-plugin: update to latest git and unbreak build with
> =A0 =A0xfce4-dev-tools 4.10.0
> =A0xfce4-diskperf-plugin: update to 2.5.3
> =A0xfce4-cpugraph-plugin: update to 1.0.2
> =A0xfce4-clipman-plugin: update to 1.2.3
> =A0xfce4-genmon-plugin: update to 3.4.0
> =A0xfce4-systemload-plugin: initial add 1.1.0
> =A0xfce4-time-out-plugin: initial add 1.0.1
> =A0xfce4-embed-plugin: initial add 1.0.0
> =A0xfce4-weather-plugin: Make it work for a while by using different
> =A0 =A0license info
> =A0xfce4-mixer: initial add 4.8.0
> =A0task-xfce-extended: add panel plugins / applications
>
> =A0.../recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb =A0| =A0 14 ++
> =A0...ugin_1.2.2.bb =3D> xfce4-clipman-plugin_1.2.3.bb} | =A0 =A04 +-
> =A0.../cpugraph/files/port-to-libxfce4ui.patch =A0 =A0 =A0 =A0| =A0102 --=
-----------
> =A0...gin_1.0.1.bb =3D> xfce4-cpugraph-plugin_1.0.2.bb} | =A0 =A06 +-
> =A0...xfce4ui.patch =3D> 0001-port-to-libxfce4ui.patch} | =A0 =A01 +
> =A0...re.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch | =A0 32 ++++
> =A0.../datetime/xfce4-datetime-plugin_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
5 +-
> =A0.../diskperf/files/port-to-libxfce4ui.patch =A0 =A0 =A0 =A0| =A0142 --=
----------------
> =A0...gin_2.3.0.bb =3D> xfce4-diskperf-plugin_2.5.3.bb} | =A0 =A06 +-
> =A0.../embed/xfce4-embed-plugin_1.0.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 12 ++
> =A0.../genmon/files/port-to-libxfce4ui.patch =A0 =A0 =A0 =A0 =A0| =A0150 =
--------------------
> =A0...lugin_3.3.1.bb =3D> xfce4-genmon-plugin_3.4.0.bb} | =A0 =A06 +-
> =A0.../places/xfce4-places-plugin_1.3.0.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A09 ++
> =A0.../systemload/xfce4-systemload-plugin_1.1.0.bb =A0 =A0| =A0 11 ++
> =A0.../time-out/xfce4-time-out-plugin_1.0.1.bb =A0 =A0 =A0 =A0| =A0 10 ++
> =A0.../wavelan/xfce4-wavelan-plugin_0.5.10.bb =A0 =A0 =A0 =A0 | =A0 =A09 =
++
> =A0.../weather/xfce4-weather-plugin_0.7.4.bb =A0 =A0 =A0 =A0 =A0| =A0 11 =
++
> =A0.../xkb/xfce4-xkb-plugin_0.5.4.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 14 ++
> =A0meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb | =A0 11 ++-
> =A0.../xfce4-session/xfce4-session_4.8.3.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
3 +-
> =A020 files changed, 147 insertions(+), 411 deletions(-)
> =A0create mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.=
0.bb
> =A0rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1=
.2.2.bb =3D> xfce4-clipman-plugin_1.2.3.bb} (69%)
> =A0delete mode 100644 meta-xfce/recipes-panel-plugins/cpugraph/files/port=
-to-libxfce4ui.patch
> =A0rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin=
_1.0.1.bb =3D> xfce4-cpugraph-plugin_1.0.2.bb} (55%)
> =A0rename meta-xfce/recipes-panel-plugins/datetime/files/{port-to-libxfce=
4ui.patch =3D> 0001-port-to-libxfce4ui.patch} (99%)
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/datetime/files/0002=
-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
> =A0delete mode 100644 meta-xfce/recipes-panel-plugins/diskperf/files/port=
-to-libxfce4ui.patch
> =A0rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin=
_2.3.0.bb =3D> xfce4-diskperf-plugin_2.5.3.bb} (55%)
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/embed/xfce4-embed-p=
lugin_1.0.0.bb
> =A0delete mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/port-t=
o-libxfce4ui.patch
> =A0rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.3=
.1.bb =3D> xfce4-genmon-plugin_3.4.0.bb} (65%)
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/places/xfce4-places=
-plugin_1.3.0.bb
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/systemload/xfce4-sy=
stemload-plugin_1.1.0.bb
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/time-out/xfce4-time=
-out-plugin_1.0.1.bb
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavel=
an-plugin_0.5.10.bb
> =A0create mode 100644 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugi=
n_0.5.4.3.bb
>
> --
> 1.7.4.4
>
This series can be pulled form

git://gitorious.org/schnitzeltony-oe-meta/meta-oe.git branch
xfce-panel-apps-update

Andreas


