Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qfi6u-0001ai-Vw
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jul 2011 02:43:01 +0200
Received: by eye27 with SMTP id 27so1011394eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2011 17:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1uqAXUVLzFIo3Y7Xyyy3fDlOH+26rJ+vcnBKRI+6TnU=;
	b=ZvLuINDDmCHkV8IhK5eN5yKLEQ+zSJJL8AO8/ZDbkCuYz0DL3looAwbNYvDbZGVu50
	ukQE3yc2JTOphNe+Qjo7MtzNSkEkUi5UcvVIsRTU6/J2yri6NvYTC1470jYqm58U+na1
	ps1YpAseUhgK8z448S3iy+ktnvWzT25aYVcPA=
MIME-Version: 1.0
Received: by 10.213.2.147 with SMTP id 19mr592944ebj.136.1310258346596; Sat,
	09 Jul 2011 17:39:06 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Sat, 9 Jul 2011 17:39:06 -0700 (PDT)
Date: Sat, 9 Jul 2011 19:39:06 -0500
Message-ID: <CAD=GYpaP+M+HdYLTvNx668E+V1UVw3xRJrrSZbv9qGR6MkzOHA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
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
X-List-Received-Date: Sun, 10 Jul 2011 00:43:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for your comments.

> I do not know if the commit summary is correct and if it should be
> prepended with ?angstrom?.

Why do say that the commit summary is not correct? The conf file being
patched is for the Angstrom 2011.03 distribution.

>> This fixes all the issues noticed earlier with pulseaudio 0.9.15:
>> =A0* Pulseaudio keeping audio devices busy when run as per-user instance
>> =A0* Failure of pactl, pacmd etc to connect to the pulseaudio server
>
> Please always include links to corresponding list threads if they are
> available.
>
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>> ---
>> Notes:
>> * This has to go into the OpenEmbedded 2011.03-maintenance branch as the=
re is no such configration file in the master branch
>
> =A0 =A0 =A0 =A0$ git grep pulse conf/distro
> =A0 =A0 =A0 =A0conf/distro/include/angstrom-2008-preferred-versions.inc:P=
REFERRED_VERSION_gst-pulse =A0 =A0=3D "0.9.7"
> =A0 =A0 =A0 =A0conf/distro/include/angstrom-2008-preferred-versions.inc:P=
REFERRED_VERSION_pulseaudio =A0 =3D "0.9.15"
> =A0 =A0 =A0 =A0conf/distro/include/angstrom-2010-preferred-versions.inc:P=
REFERRED_VERSION_gst-pulse =A0 =A0=3D "0.9.7"
> =A0 =A0 =A0 =A0conf/distro/include/angstrom-2010-preferred-versions.inc:P=
REFERRED_VERSION_pulseaudio =A0 =3D "0.9.22"
> =A0 =A0 =A0 =A0[?]
>
> So you your change could actually be applied to master?

I was trying to say that the conf file involved doesn't exist in the
master branch

>> =A0conf/distro/angstrom-2008.1.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A03 +++
>> =A0.../include/angstrom-2008-preferred-versions.inc =A0 | =A0 =A02 +-
>> =A02 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-200=
8.1.conf
>> index ae1ed4c..7b4f25a 100644
>> --- a/conf/distro/angstrom-2008.1.conf
>> +++ b/conf/distro/angstrom-2008.1.conf
>> @@ -121,6 +121,9 @@ PREFERRED_VERSION_binutils_avr32 =3D "2.17"
>> =A0PREFERRED_VERSION_binutils-cross_avr32 =3D "2.17"
>> =A0PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
>>
>> +ANGSTROM_PULSEAUDIO_VERSION =A0 =A0 =A0 =A0 =A0=3D "0.9.15"
>> +ANGSTROM_PULSEAUDIO_VERSION_armv7a =A0 =3D "0.9.22"
>> +
>
> 1. Where did you find this syntax?
>
> =A0 =A0 =A0 =A0$ git grep PULSE conf/distro/
>
> does not find anything in branch master.

Yes, I didn't either because I was the first one to add it. :) There
are other variables in the same conf file that provide overrides in a
similar way. Why do you think is the syntax not correct?

>
> 2. Could you add an explanation, why 0.9.22 is not used for everything
> and only for armv7a. Is that because of commit cce5e648 [1]?

I'm not sure which commit causes a problem, but Koen can explain more.
From what I understand, the compiler doesn't support building this
version of pulseaudio for armv7a. Koen?

>
>> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
>> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
>> =A0PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg"
>> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/=
conf/distro/include/angstrom-2008-preferred-versions.inc
>> index b5b524a..e4b8bf1 100644
>> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
>> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
>> @@ -44,7 +44,7 @@ PREFERRED_VERSION_pango-native =A0 =A0 =3D "1.24.4"
>> =A0#PREFERRED_VERSION_pixman =A0 =A0=3D "0.13.2"
>> =A0PREFERRED_VERSION_pkgconfig =A0=3D "0.23"
>> =A0PREFERRED_VERSION_pkgconfig-native =3D "0.23"
>> -PREFERRED_VERSION_pulseaudio =A0 =A0 =A0 =A0 =3D "0.9.15"
>> +PREFERRED_VERSION_pulseaudio =A0 =A0 =A0 =A0 =3D "${ANGSTROM_PULSEAUDIO=
_VERSION}"
>> =A0PREFERRED_VERSION_python-pycairo =3D "1.8.0"
>> =A0PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
>> =A0PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
>
> So I would prefer, if you would change the version just in this file and
> such a patch could go into branch master first.
>

master doesn't have a conf/distro/angstrom-2008.1.conf so I'm not sure
how I can create a patch for the master branch?

> Even better would be the following.
>
> 1. Package PA 0.9.23 for oe-dev. If I remember correctly I send all
> patches upstream and it should work for all architectures(?).
> 2. Prefer PA 0.9.23 for ?ngstr?m and other distributions.
> 3. Remove older PA versions.
> 4. Cherry pick these changes into branch 2011.03-maintenance.
>
> Joel, do you have time and motivation to do that?

Motivation is there, but time isn't ;). I can make an effort to do
this at some point though. Thanks,

Regards,
Joel


