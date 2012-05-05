Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SQhRE-0002lu-BT
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2012 18:02:28 +0200
Received: by qcso7 with SMTP id o7so2494815qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2012 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5mkUDN7mKBAdrSyP5V1AeE1AxWxctov5a89qQxingQg=;
	b=ViJl7NiQ5/uSarumxKMsGKErFFli9CEp9A/Xq9ELS4hxQxGetLRns4g130VhXPpY54
	QI5t8g9MGdp0hDuFq4exuarjbMrYR+bHpJUyYEpiPcD3DX+TxYpZ/2KREYJo6M06c6mY
	fA4isgn8thOyY/jFWkqRaiL5e7HbynkKb2CLODhPjQDc8hEpVUL0J68q+dSL+IoGusSn
	tAbLfXhMoqjW18eUCGz7Y1zlMrjMOMRIMcKoSp3Um9h/LshNEaK9niiM5JUFX8J+yLh8
	BC/fsVwl3O/pItzN5LCbgiZxXStV6jL9yrJJKD6xc5ByGK00Ub6hr3DDcO010f0xzukW
	44rw==
MIME-Version: 1.0
Received: by 10.229.137.137 with SMTP id w9mr4694548qct.107.1336233159581;
	Sat, 05 May 2012 08:52:39 -0700 (PDT)
Received: by 10.229.217.200 with HTTP; Sat, 5 May 2012 08:52:39 -0700 (PDT)
In-Reply-To: <CAMKF1soRXCLFQLgVzCsjzJS6W-gGGAUs0AwMh0B7WtfrEEPC2A@mail.gmail.com>
References: <1336166708-14019-1-git-send-email-gizero@gmail.com>
	<CAMKF1soRXCLFQLgVzCsjzJS6W-gGGAUs0AwMh0B7WtfrEEPC2A@mail.gmail.com>
Date: Sat, 5 May 2012 17:52:39 +0200
Message-ID: <CAC+thW2rH1N-8gZ4X5spw_v0wXyWYXsPD9tYz+UmSFiiJUC7EQ@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Sat, 05 May 2012 16:02:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem and Martin,

On Fri, May 4, 2012 at 11:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, May 4, 2012 at 2:25 PM, Andrea Galbusera <gizero@gmail.com> wrote=
:
>> * based on recipe by Radoslav Kolev which was in classic
>> * updated to latest released version 3.0.2
>> * also provide an _git version with up-to-date SRCREV and
>> DEFAULT_PREFERENCE =3D "-1"
>
> You should always prefix the subject line with layername e.g.
> [meta-oe]... so you get appropriate maintainers attention

Ok!

>
> Do we really need the git version ? if not then drop it.

Thank you for reviewing. I agree with you: the stable release should
be enough. git version was included only because it was there in
classic.
I'll update and resend as v2.

>> * common part factorized as libmodbus.inc
>>
>> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
>> ---
>> =A0meta-oe/recipes-extended/libmodbus/libmodbus.inc =A0 | =A0 13 +++++++=
++++++
>> =A0.../recipes-extended/libmodbus/libmodbus_3.0.2.bb =A0| =A0 =A08 +++++=
+++
>> =A0.../recipes-extended/libmodbus/libmodbus_git.bb =A0 =A0| =A0 13 +++++=
++++++++
>> =A03 files changed, 34 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
>> =A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2=
.bb
>> =A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_git.b=
b
>>
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/=
recipes-extended/libmodbus/libmodbus.inc
>> new file mode 100644
>> index 0000000..8e0e011
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
>> @@ -0,0 +1,13 @@
>> +SUMMARY =3D "A Modbus library"
>> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast an=
d robust \
>> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, Free=
BSD, \
>> +QNX and Windows."
>> +HOMEPAGE =3D "http://www.libmodbus.org/"
>> +SECTION =3D "libs"
>> +PRIORITY =3D "optional"
>
> PRIORITY is no longer used drop it.

Good to know!

>> +LICENSE =3D "LGPLv2.1+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd255951079=
008b364516c"
>> +
>> +INC_PR =3D "r0"
>
> if you are just having 1 recipe i.e. dropping git recipe then change that
> to PR
>
>> +
>> +inherit autotools pkgconfig
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/met=
a-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>> new file mode 100644
>> index 0000000..7a99f72
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>> @@ -0,0 +1,8 @@
>> +require libmodbus.inc
>> +
>> +PR =3D "${INC_PR}.0"
>> +
>> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-$=
{PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
>> +SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e122=
04229361c029f2615"
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb b/meta-=
oe/recipes-extended/libmodbus/libmodbus_git.bb
>> new file mode 100644
>> index 0000000..793a9d6
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb
>> @@ -0,0 +1,13 @@
>> +require libmodbus.inc
>> +
>> +SRCREV =3D "23dd803f3f2b7be668408fa938e8d665249b4fba"
>> +
>> +PV =3D "3.0.2+gitr${SRCPV}"
>> +
>> +PR =3D "${INC_PR}.0"
>> +
>> +DEFAULT_PREFERENCE =3D "-1"
>> +
>> +SRC_URI =3D "git://github.com/stephane/libmodbus;branch=3Dmaster;protoc=
ol=3Dgit"
>> +S =3D "${WORKDIR}/git"
>> +
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


