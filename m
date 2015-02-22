Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 08741606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 20:49:12 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id b16so14101200igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 12:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=bKXaOKVmP7Zpq7tZdSoIc7apvG21ctNBmqOrLxfSGf8=;
	b=eBGdxNjPWk/SA17o00ixjoDOL7DN3K1XY6fRL89+nVeFBtpg8lUNIhpa8nyguk6UNy
	cMcYVKFwxB5wR5c4wGaIHuThGowZR0+8kdA0YiMvtMxymVNrlpqLPy/0GYE/rFy3pxzU
	5LuWDLGICV5p85e54qYcSMX6gMLZfzw+Me7c2p+uURkFWujcYJ3mAWlR7bm4HrVa20rj
	xNpNA5riblMBDP3rPL4OZPpUTVxkFZOUtIbGHCkMwPgXKED2OV3huaB6E9FkkfjEDBhs
	McBrwUdlAe6zqTsZ1IXE7xO9Xl0oTZV+U0Yft32ena4XjONuWaNGXpTY0SvGDDEbYfGd
	/Ndw==
X-Received: by 10.43.34.137 with SMTP id ss9mr8466453icb.11.1424638153145;
	Sun, 22 Feb 2015 12:49:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.18.92 with HTTP; Sun, 22 Feb 2015 12:48:42 -0800 (PST)
In-Reply-To: <CALbNGRR1Q_JOMPPWR21-Y0WmQGTA=r8TRDuSfRwUUsV-yh11Xw@mail.gmail.com>
References: <1424621742-17713-1-git-send-email-ashcharles@gmail.com>
	<CALbNGRR1Q_JOMPPWR21-Y0WmQGTA=r8TRDuSfRwUUsV-yh11Xw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Sun, 22 Feb 2015 12:48:42 -0800
Message-ID: <CAK8F28nFL+h-YSRo+ydn1+_OsytChTco7UPD9aHMNSjaO36Z-g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-session: Make package MACHINE specific
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
X-List-Received-Date: Sun, 22 Feb 2015 20:49:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Good question.  I just tried removing it and didn't see an error when
building the package but it is not clear if this was trying to deal
with a runtime or build-time error.  Do you happen to remember?  I
tracked through the commit history but I think this has been in the
recipe since it was first added.

--Ash

On Sun, Feb 22, 2015 at 8:38 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Feb 22, 2015 at 5:15 PM, Ash Charles <ashcharles@gmail.com> wrote=
:
>> Because the xfce4-session recipe has a machine-specific pkg_postinst_,
>> the package itself must be considered machine specific.
>>
>> Signed-off-by: Ash Charles <ashcharles@gmail.com>
>> ---
>>  meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.b=
b b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
>> index 74289fb..f804487 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1dda=
f48b6eab6028f23ef88"
>>  DEPENDS =3D "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck =
dbus dbus-glib xfconf"
>>  RDEPENDS_${PN} =3D "netbase xinit dbus-x11 iceauth upower"
>>
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>>  inherit xfce update-alternatives
>>
>>  SRC_URI[md5sum] =3D "1757657c1d590aa6274b7b7cbba33352"
>> --
>> 2.1.0
>>
> Have you tried to remove postinst - is it still necessary?
>
> Andreas

