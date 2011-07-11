Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qg6w0-0002cO-1k
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 05:13:24 +0200
Received: by eye27 with SMTP id 27so1188273eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 20:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Rmi1m7JzpyPWYr6vTzGovXWVe707pwFGot9MEotxyh8=;
	b=WmLJfD8Qq7ad3IEAROqeWFB4UCGhYJh5FmDSZG5OOIR1pgO01ezEw2z7wQNJM6VpIO
	AltQlhAXe4K6dGpMhY/N0TfFBBs0ojwoWrpPQ8arwpP1ipRl/ZeGlQyMgbONwZC5tK9P
	i1pe56vraTYpScd+ePSNIiuC4fYPI1/Cqh+Yc=
MIME-Version: 1.0
Received: by 10.213.13.220 with SMTP id d28mr839957eba.60.1310353290129; Sun,
	10 Jul 2011 20:01:30 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Sun, 10 Jul 2011 20:01:30 -0700 (PDT)
In-Reply-To: <1310346326.25942.37.camel@mattotaupa>
References: <CAD=GYpaP+M+HdYLTvNx668E+V1UVw3xRJrrSZbv9qGR6MkzOHA@mail.gmail.com>
	<1310346326.25942.37.camel@mattotaupa>
Date: Sun, 10 Jul 2011 22:01:30 -0500
Message-ID: <CAD=GYpZn7-XuZWWtF4iXv3ZJrGq1QJ-U1q8rSvMe_9uteBFxJw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: "Kooi, Koen" <k-kooi@ti.com>, openembedded-devel@lists.openembedded.org,
	"Kridner, Jason" <jdk@ti.com>
Subject: Re: [PATCH] pulseaudio: Switch to version version 0.9.22
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
X-List-Received-Date: Mon, 11 Jul 2011 03:13:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for your comments. Your suggestion works and is much cleaner.

I have submitted a new patch.

Thanks,
Joel

On Sun, Jul 10, 2011 at 8:05 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Joel,
>
>
> Am Samstag, den 09.07.2011, 19:39 -0500 schrieb Joel A Fernandes:
>
>> > I do not know if the commit summary is correct and if it should be
>> > prepended with ?angstrom?.
>>
>> Why do say that the commit summary is not correct? The conf file being
>> patched is for the Angstrom 2011.03 distribution.
>
> that is why it should be prepended with angstrom like it is done in
> other changes to those files.
>
> =A0 =A0 =A0 =A0$ git log conf/distro/include/angstrom*
>
>> >> This fixes all the issues noticed earlier with pulseaudio 0.9.15:
>> >> =A0* Pulseaudio keeping audio devices busy when run as per-user insta=
nce
>> >> =A0* Failure of pactl, pacmd etc to connect to the pulseaudio server
>> >
>> > Please always include links to corresponding list threads if they are
>> > available.
>> >
>> >> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>> >> ---
>> >> Notes:
>> >> * This has to go into the OpenEmbedded 2011.03-maintenance branch as =
there is no such configration file in the master branch
>> >
>> > =A0 =A0 =A0 =A0$ git grep pulse conf/distro
>> > =A0 =A0 =A0 =A0conf/distro/include/angstrom-2008-preferred-versions.in=
c:PREFERRED_VERSION_gst-pulse =A0 =A0=3D "0.9.7"
>> > =A0 =A0 =A0 =A0conf/distro/include/angstrom-2008-preferred-versions.in=
c:PREFERRED_VERSION_pulseaudio =A0 =3D "0.9.15"
>> > =A0 =A0 =A0 =A0conf/distro/include/angstrom-2010-preferred-versions.in=
c:PREFERRED_VERSION_gst-pulse =A0 =A0=3D "0.9.7"
>> > =A0 =A0 =A0 =A0conf/distro/include/angstrom-2010-preferred-versions.in=
c:PREFERRED_VERSION_pulseaudio =A0 =3D "0.9.22"
>> > =A0 =A0 =A0 =A0[?]
>> >
>> > So you your change could actually be applied to master?
>>
>> I was trying to say that the conf file involved doesn't exist in the
>> master branch
>>
>> >> =A0conf/distro/angstrom-2008.1.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 +++
>> >> =A0.../include/angstrom-2008-preferred-versions.inc =A0 | =A0 =A02 +-
>> >> =A02 files changed, 4 insertions(+), 1 deletions(-)
>> >>
>> >> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-=
2008.1.conf
>> >> index ae1ed4c..7b4f25a 100644
>> >> --- a/conf/distro/angstrom-2008.1.conf
>> >> +++ b/conf/distro/angstrom-2008.1.conf
>> >> @@ -121,6 +121,9 @@ PREFERRED_VERSION_binutils_avr32 =3D "2.17"
>> >> =A0PREFERRED_VERSION_binutils-cross_avr32 =3D "2.17"
>> >> =A0PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
>> >>
>> >> +ANGSTROM_PULSEAUDIO_VERSION =A0 =A0 =A0 =A0 =A0=3D "0.9.15"
>> >> +ANGSTROM_PULSEAUDIO_VERSION_armv7a =A0 =3D "0.9.22"
>> >> +
>> >
>> > 1. Where did you find this syntax?
>> >
>> > =A0 =A0 =A0 =A0$ git grep PULSE conf/distro/
>> >
>> > does not find anything in branch master.
>>
>> Yes, I didn't either because I was the first one to add it. :) There
>> are other variables in the same conf file that provide overrides in a
>> similar way. Why do you think is the syntax not correct?
>
> Well, since in my opinion this variable is redundant. Just change the
> versions in the file under `/include/`.
>
>> > 2. Could you add an explanation, why 0.9.22 is not used for everything
>> > and only for armv7a. Is that because of commit cce5e648 [1]?
>>
>> I'm not sure which commit causes a problem, but Koen can explain more.
>> >From what I understand, the compiler doesn't support building this
>> version of pulseaudio for armv7a. Koen?
>
> The old Linux kernel in 2008.1 does not support this for non armv7a
> according to Koen=92s answer.
>
>> >> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-gli=
b"
>> >> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
>> >> =A0PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg=
"
>> >> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc=
 b/conf/distro/include/angstrom-2008-preferred-versions.inc
>> >> index b5b524a..e4b8bf1 100644
>> >> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
>> >> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
>> >> @@ -44,7 +44,7 @@ PREFERRED_VERSION_pango-native =A0 =A0 =3D "1.24.4"
>> >> =A0#PREFERRED_VERSION_pixman =A0 =A0=3D "0.13.2"
>> >> =A0PREFERRED_VERSION_pkgconfig =A0=3D "0.23"
>> >> =A0PREFERRED_VERSION_pkgconfig-native =3D "0.23"
>> >> -PREFERRED_VERSION_pulseaudio =A0 =A0 =A0 =A0 =3D "0.9.15"
>> >> +PREFERRED_VERSION_pulseaudio =A0 =A0 =A0 =A0 =3D "${ANGSTROM_PULSEAU=
DIO_VERSION}"
>> >> =A0PREFERRED_VERSION_python-pycairo =3D "1.8.0"
>> >> =A0PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
>> >> =A0PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
>> >
>> > So I would prefer, if you would change the version just in this file a=
nd
>> > such a patch could go into branch master first.
>>
>> master doesn't have a conf/distro/angstrom-2008.1.conf so I'm not sure
>> how I can create a patch for the master branch?
>
> The following change in
>
> =A0 =A0 =A0 =A0/conf/distro/include/angstrom-2008-preferred-versions.inc
>
> should be enough, should not it?
>
> =A0 =A0 =A0 =A0PREFERRED_VERSION_pulseaudio =A0 =A0 =A0 =A0 =3D "0.9.15"
> =A0 =A0 =A0 =A0+PREFERRED_VERSION_pulseaudio_armv7a =3D "0.9.22"
>
>> > Even better would be the following.
>> >
>> > 1. Package PA 0.9.23 for oe-dev. If I remember correctly I send all
>> > patches upstream and it should work for all architectures(?).
>> > 2. Prefer PA 0.9.23 for ?ngstr?m and other distributions.
>> > 3. Remove older PA versions.
>> > 4. Cherry pick these changes into branch 2011.03-maintenance.
>> >
>> > Joel, do you have time and motivation to do that?
>>
>> Motivation is there, but time isn't ;). I can make an effort to do
>> this at some point though. Thanks,
>
> As Koen answered, this plan would not work.
>
>
> Thank you for your answers,
>
> Paul
>


