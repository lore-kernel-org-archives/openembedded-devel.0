Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Si0bj-0005EV-89
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 11:56:51 +0200
Received: by yenl13 with SMTP id l13so1276388yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=noAVkmomnSGtfL/b6l+lXWvgogh0LTo/dXtMoO/cJ1E=;
	b=RNLWf5/hgPYIbhVJAnozEq7KpOwkgAeXbgRx9iEioXIHV39ss0pSpB7fqVpzRBESSy
	guLk6E7Z4dKE5kZ6Ic5aOVd8wM5ytjxm1YCKodgWsiY8nhWI+9TD+yrrjDdUhEOw/AP3
	DOTWPWp10WSaGdqo757ePoCJ3pHT/7ooVA7W4ZOvqv0pdnlUibmsn83pqaiU9vK9GETn
	tYx8SF/fUCdiwwykHYhsArGA3WrG9Nd8MVIrW+js4oiXmCxjcQxhoOYoWDIAinI9XHFi
	Fb9NdsRYO+9FH6vryzt7995eaThI5PLmmUZFFyj045U+gHV2bLSOZvqaydzhpOTOzQ0S
	nXGg==
MIME-Version: 1.0
Received: by 10.236.180.40 with SMTP id i28mr1707575yhm.22.1340358363814; Fri,
	22 Jun 2012 02:46:03 -0700 (PDT)
Received: by 10.236.161.37 with HTTP; Fri, 22 Jun 2012 02:46:03 -0700 (PDT)
In-Reply-To: <CAC+thW3xN4uDw3V=zVeXLugO_-77c82Wk0M+wxTUMqA9pqYefA@mail.gmail.com>
References: <1340352411-20305-1-git-send-email-gizero@gmail.com>
	<20120622082038.GM9352@jama.jama.net>
	<CAC+thW3xN4uDw3V=zVeXLugO_-77c82Wk0M+wxTUMqA9pqYefA@mail.gmail.com>
Date: Fri, 22 Jun 2012 11:46:03 +0200
Message-ID: <CA+chaQcB-vYOpP_MsJqLrJ1GDXT8VsVsZtbTj7cPmG1nPLdFXA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libmodbus: update to 3.0.3
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
X-List-Received-Date: Fri, 22 Jun 2012 09:56:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 11:20 AM, Andrea Galbusera <gizero@gmail.com> wrote=
:
> Hi Martin,
>
> On Fri, Jun 22, 2012 at 10:20 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> On Fri, Jun 22, 2012 at 10:06:51AM +0200, Andrea Galbusera wrote:
>>> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
>>> ---
>>> =C2=A0.../recipes-extended/libmodbus/libmodbus_3.0.2.bb =C2=A0| =C2=A0 =
16 ----------------
>>> =C2=A0.../recipes-extended/libmodbus/libmodbus_3.0.3.bb =C2=A0| =C2=A0 =
16 ++++++++++++++++
>>> =C2=A02 files changed, 16 insertions(+), 16 deletions(-)
>>> =C2=A0delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3=
.0.2.bb
>>> =C2=A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3=
.0.3.bb
>>
>> Please use -M when sending patches like this, so it's easier for review.
>>
>> Also when you're at it, you can simplify URL like this:
>> s%libmodbus/libmodbus-${PV}%${BPN}/${BP}%
>
> Thank you for reviewing. I wasn't aware of -M... still a newbie of
> patch workflow. ;-)
> Going to update my 'oe patch howto' notes and re-submitting.

To make your 'oe patch howto' even better add 2 more items:

1) when sending v2 fill in Message-ID when git send-email asks for it:
  Message-ID to be used as In-Reply-To for the first email?
  in original patch you had:
  Message-Id: <1340352411-20305-1-git-send-email-gizero@gmail.com>
  so 1340352411-20305-1-git-send-email-gizero@gmail.com
  this way v2 is in the same thread as original patch
2) after sending v2 update patchwork:
  http://patchwork.openembedded.org/project/oe/list/?q=3Dlibmodbus
  marking v1 as supperseeded

Cheers,

>
>>
>> Cheers,
>>
>>>
>>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/me=
ta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>>> deleted file mode 100644
>>> index 03b7fcc..0000000
>>> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>>> +++ /dev/null
>>> @@ -1,16 +0,0 @@
>>> -SUMMARY =3D "A Modbus library"
>>> -DESCRIPTION =3D "libmodbus is a C library designed to provide a fast a=
nd robust \
>>> -implementation of the Modbus protocol. It runs on Linux, Mac OS X, Fre=
eBSD, \
>>> -QNX and Windows."
>>> -HOMEPAGE =3D "http://www.libmodbus.org/"
>>> -SECTION =3D "libs"
>>> -
>>> -LICENSE =3D "LGPLv2.1+"
>>> -LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd25595107=
9008b364516c"
>>> -
>>> -SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-=
${PV}.tar.gz"
>>> -
>>> -inherit autotools pkgconfig
>>> -
>>> -SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
>>> -SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12=
204229361c029f2615"
>>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb b/me=
ta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
>>> new file mode 100644
>>> index 0000000..e6dde2c
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
>>> @@ -0,0 +1,16 @@
>>> +SUMMARY =3D "A Modbus library"
>>> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast a=
nd robust \
>>> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, Fre=
eBSD, \
>>> +QNX and Windows."
>>> +HOMEPAGE =3D "http://www.libmodbus.org/"
>>> +SECTION =3D "libs"
>>> +
>>> +LICENSE =3D "LGPLv2.1+"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd25595107=
9008b364516c"
>>> +
>>> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-=
${PV}.tar.gz"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +SRC_URI[md5sum] =3D "b5042d833c6c132e6fb2551af133a342"
>>> +SRC_URI[sha256sum] =3D "6fc7cf91f7293e522afde6ae5fc605c6cd7bdca4ee2ec9=
53db5bb91158ab8677"
>>> --
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


