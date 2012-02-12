Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RwiQC-00049d-QT
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 00:01:28 +0100
Received: by lahc1 with SMTP id c1so3704282lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=tm7dTIS+f94amAVubbxVW5CeZWdkPMnSx/xefsWmOpI=;
	b=frIgqDgKKw/utNHiZ0LpxDVIfUagVv1I7DVJa3c2CxqCfVwaGa/fy6OW7+lxvrOSQH
	SHZeKoZu4uDSPwkb1sdHEzOeGVLov+ci5MyslVggd1W/nmpU9xHh2fO24Q+i1RAczHjB
	ecsqRag0zUbG1SzPXTPxFcP18tNsmCx6NS5HU=
MIME-Version: 1.0
Received: by 10.112.103.8 with SMTP id fs8mr4764437lbb.39.1329087199946; Sun,
	12 Feb 2012 14:53:19 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Sun, 12 Feb 2012 14:53:19 -0800 (PST)
In-Reply-To: <CALbNGRR+McF-f3fQ61EZ4fpxsLdthDP-DJ2uMLoRFJNRWmyyBA@mail.gmail.com>
References: <1328313811-12627-1-git-send-email-tworaz666@gmail.com>
	<CALbNGRRRH2QCkdpzKyHwdOzd-jPGkV2Fmhff9cD5aVBggoQS7g@mail.gmail.com>
	<4F2D01B6.90806@gmail.com>
	<CALbNGRR+McF-f3fQ61EZ4fpxsLdthDP-DJ2uMLoRFJNRWmyyBA@mail.gmail.com>
Date: Sun, 12 Feb 2012 23:53:19 +0100
Message-ID: <CALbNGRRwLdfNy_G+RRtGo8-bu9skYE6_SrHiNQMbHbYZU-rKEQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH] xfce4-power-manager: Add initial recipe for version 1.0.10.
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
X-List-Received-Date: Sun, 12 Feb 2012 23:01:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2012 at 10:26 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Sat, Feb 4, 2012 at 11:00 AM, Peter Tworek <tworaz666@gmail.com> wrote=
:
>> On 02/04/2012 03:50 AM, Andreas M=FCller wrote:
>>>
>>> On Sat, Feb 4, 2012 at 1:03 AM, Peter Tworek<tworaz666@gmail.com> =A0wr=
ote:
>>>>
>>>> Run tested on netbook pro.
>>>>
>>>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>>>> ---
>>>> =A0.../xfce4-power-manager_1.0.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 28
>>>> ++++++++++++++++++++
>>>> =A01 files changed, 28 insertions(+), 0 deletions(-)
>>>> =A0create mode 100644
>>>> meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.=
bb
>>>>
>>>> diff --git
>>>> a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.1=
0.bb
>>>> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.1=
0.bb
>>>> new file mode 100644
>>>> index 0000000..4641178
>>>> --- /dev/null
>>>> +++
>>>> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.1=
0.bb
>>>> @@ -0,0 +1,28 @@
>>>> +DESCRIPTION =3D "Power manager for the Xfce desktop environment"
>>>> +HOMEPAGE =3D
>>>> "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
>>>> +SECTION =3D "x11"
>>>> +
>>>> +LICENSE =3D "GPLv2+"
>>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552"
>>>> +
>>>> +inherit xfce
>>>> +
>>>> +DEPENDS =3D "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util
>>>> libnotify \
>>>> + =A0 =A0 =A0 =A0 =A0 libxrandr virtual/libx11 libxext xfce4-panel"
>>>> +RDEPENDS_${PN} =3D "networkmanager udisks upower polkit"
>>>> +
>>>> +EXTRA_OECONF =3D " \
>>>> + =A0 =A0--enable-polkit \
>>>> + =A0 =A0--enable-network-manager \
>>>
>>> networkmanager conflicts with conman. I don't if this makes sense to
>>> use conman with xfce (am using networkmanager too). What happens if
>>> this option is not set?
>>
>>
>> Haven't tested it (yet), but I think it should work fine without
>> networkmanager, event when it's enabled. You'll probably see some warnin=
gs
>> in you logs, saying that it can't contact it via dbus, but that should b=
e
>> it. Anyway I'll try to verify my theory...
You are right: I cross checked in source - so

Acked-by: Andreas M=FCller<schnitzeltony@googlemail.com>

Andreas


