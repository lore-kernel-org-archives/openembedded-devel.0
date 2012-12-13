Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TjD9Q-0000Jh-8M
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 19:04:52 +0100
Received: by mail-ie0-f172.google.com with SMTP id c13so4460903ieb.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5wc4KAXADAhHqvx5keD9lZG1K7lUPrNQl7dgJT24Fto=;
	b=naWJBbR1YNgTQ3ceEgwRvsk8ywmrRrvpJZewirPyfsfUrgPkT2TNHmeUUpEIpC4k4S
	acU98qtPA1rMsyicNk1npmlv6Ylywj7HFvVIupu06xFSI4jz6pv3cXuKm7KrpX+lWqpa
	AlCUOW9Vt/Vy5FiqSwEqYRfb+zNdwdVIJQ1gJqw9/zGIIq5JUFI5wYm38fBW7irykS3d
	Yij/CXleIX6EGTlhMScttJIEeqMrcL1rFN/sGz4KLRA3m2WQ1+JopB+fM3OTaz4x5fpJ
	zf9SpQ1VKU5ZdNu5Lwibj2UHXMjnMAN0Q+wJe5GUa1xgCmETbURwV67CWMmxkpn392tB
	MAmg==
MIME-Version: 1.0
Received: by 10.50.104.232 with SMTP id gh8mr18101843igb.45.1355421016586;
	Thu, 13 Dec 2012 09:50:16 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Thu, 13 Dec 2012 09:50:16 -0800 (PST)
In-Reply-To: <CALbNGRT1E9u1Ti8b7yfLVp-zB_S+uqZJBGU30TuP6sGMDPkgSg@mail.gmail.com>
References: <1355222976-14461-1-git-send-email-s.stirtzel@googlemail.com>
	<CALbNGRT1E9u1Ti8b7yfLVp-zB_S+uqZJBGU30TuP6sGMDPkgSg@mail.gmail.com>
Date: Thu, 13 Dec 2012 18:50:16 +0100
Message-ID: <CALbNGRRd2_uARW2TwDs3Ui90M8gsBeGHJAPBqzRfMTzhGbVHdg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce] xfce4-session: Add depends to iceauth-native
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
X-List-Received-Date: Thu, 13 Dec 2012 18:04:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 6:58 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Dec 11, 2012 at 11:49 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> xfce4-session depends on iceauth for do_configure
>>
>> This fixes:
>> checking for iceauth... /usr/bin/iceauth
>>
>> And it fixes for X-less systems:
>> checking for iceauth... no
>> configure: error: iceauth missing, please check your X11 installation
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  .../xfce4-session/xfce4-session_4.10.0.bb          |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.b=
b b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
>> index 4df9894..136e928 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
>> @@ -2,9 +2,11 @@ DESCRIPTION =3D "xfce4-session is a session manager for=
 Xfce 4 Desktop Environment
>>  SECTION =3D "x11"
>>  LICENSE =3D "GPLv2"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23=
ef88"
>> -DEPENDS =3D "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck =
dbus dbus-glib xfconf gnome-keyring"
>> +DEPENDS =3D "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck =
dbus dbus-glib xfconf gnome-keyring iceauth-native"
>>  RDEPENDS_${PN} =3D "netbase xinit dbus-x11 iceauth consolekit upower"
>>
>> +PR =3D "r1"
>> +
>>  inherit xfce
>>
>>  SRC_URI[md5sum] =3D "4768e1a41a0287af6aad18b329a0f230"
>> --
>> 1.7.9.5
> Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Sorry, but my ACK  was too early and turns into NAK. It now tries to
run a command in native sysroot ( do a grep for ICEAUTH_CMD in
sourcedir ).

Andreas


