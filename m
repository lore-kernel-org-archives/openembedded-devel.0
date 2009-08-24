Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Mfco4-0001Ox-Dt
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 18:54:08 +0200
Received: by fxm24 with SMTP id 24so1418898fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6bBP5Ft+N3KxUPeapmC+FhOLfi2qHu7nWuXQW9LIsg4=;
	b=iuBu5bAhcyumkXcvXPPHqd06jcL+0vSzqoaWcn2yY4Dad4E5msISwnPJfTrVoi04jE
	9/mZ1BTsMWVPBkrUmoYamRboWr4i/vo1YWCDaEnbcmqjUM5Dum7T8bBay6MQ/5qpRjnH
	o6+XlVQLoqM3z/Eh8GG81Co6JoMFmMKANWO5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=aym3RhcH8OZed72sdxwcdEaiUKHpZ4ZbfK2aPwFxd+DvyPU2JSaFaS6KGreRS6Dr+Y
	pdz6ZGGiT+WQCK4tyLDBQ0n7Bu7u6bSvIhBfAAKVdQnlLnv450EaznFwwuPZ1LQFvEJM
	GI/2larADcDQ3IFRupr9HPJpds30mO0uipF0Y=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.168.150 with SMTP id k22mr570258hbe.10.1251131781851; Mon, 
	24 Aug 2009 09:36:21 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.0908221227320.3621@juice.ott.cti.com>
References: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
	<1247540261-4537-2-git-send-email-msmith@cbnco.com>
	<1247540261-4537-3-git-send-email-msmith@cbnco.com>
	<1247540261-4537-4-git-send-email-msmith@cbnco.com>
	<Pine.LNX.4.64.0908221227320.3621@juice.ott.cti.com>
Date: Mon, 24 Aug 2009 13:36:21 -0300
X-Google-Sender-Auth: cce2eb47d1e32d46
Message-ID: <be7a9f3d0908240936w5f6816can77f35e6d14b35cb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] xorg-xserver-common: pass --enable-glx-tls
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
X-List-Received-Date: Mon, 24 Aug 2009 16:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1 from me.

On Sat, Aug 22, 2009 at 1:27 PM, Michael Smith<msmith@cbnco.com> wrote:
>
> ... and this one?
>
> Thanks,
> Mike
>
> On Mon, 13 Jul 2009, Michael Smith wrote:
>
>> Uses the same inherit as mesa-dri, so they both get the same answer.
>>
>> Also switch to INC_PR.
>>
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
>> ---
>> =A0recipes/xorg-xserver/xorg-xserver-common.inc | =A0 =A04 +++-
>> =A0recipes/xorg-xserver/xserver-xorg_1.2.0.bb =A0 | =A0 =A02 +-
>> =A0recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb | =A0 =A02 +-
>> =A0recipes/xorg-xserver/xserver-xorg_1.4.2.bb =A0 | =A0 =A02 +-
>> =A0recipes/xorg-xserver/xserver-xorg_1.4.bb =A0 =A0 | =A0 =A02 +-
>> =A0recipes/xorg-xserver/xserver-xorg_1.5.1.bb =A0 | =A0 =A02 +-
>> =A0recipes/xorg-xserver/xserver-xorg_1.5.3.bb =A0 | =A0 =A02 +-
>> =A0recipes/xorg-xserver/xserver-xorg_1.6.1.bb =A0 | =A0 =A02 +-
>> =A08 files changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg=
-xserver/xorg-xserver-common.inc
>> index ec56515..cfd350e 100644
>> --- a/recipes/xorg-xserver/xorg-xserver-common.inc
>> +++ b/recipes/xorg-xserver/xorg-xserver-common.inc
>> @@ -2,6 +2,8 @@ HOMEPAGE =3D "http://www.x.org"
>> =A0SECTION =3D "x11/base"
>> =A0LICENSE =3D "MIT-X"
>>
>> +INC_PR =3D "r12"
>> +
>> =A0PROVIDES =3D "virtual/xserver"
>>
>> =A0DEPENDS =3D "hal fontconfig freetype flex-native lbxutil kbproto \
>> @@ -21,7 +23,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_=
PN}-${PV}.tar.bz2"
>>
>> =A0S =3D "${WORKDIR}/${XORG_PN}-${PV}"
>>
>> -inherit autotools pkgconfig
>> +inherit autotools pkgconfig glx-use-tls
>>
>> =A0EXTRA_OECONF +=3D " --enable-xcalibrate \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-kdrive \
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.2.0.bb b/recipes/xorg-x=
server/xserver-xorg_1.2.0.bb
>> index 61f73b3..50d182c 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
>> @@ -2,7 +2,7 @@ MESA_VER =3D "6.5.2"
>>
>> =A0require xorg-xserver-common.inc
>> =A0PE =3D "1"
>> -PR =3D "r4"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0export LDFLAGS +=3D " -ldl "
>>
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb b/recipes/xorg=
-xserver/xserver-xorg_1.3.0.0.bb
>> index 9d6dca4..1efea75 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
>> @@ -2,7 +2,7 @@ MESA_VER =3D "6.5.2"
>>
>> =A0require xorg-xserver-common.inc
>> =A0PE =3D "1"
>> -PR =3D "r8"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0file://glyphstr.patch;patch=3D1"
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb b/recipes/xorg-x=
server/xserver-xorg_1.4.2.bb
>> index 2c4f3d8..13cceb9 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
>> @@ -4,7 +4,7 @@ DESCRIPTION =3D "the X.Org X server"
>> =A0DEPENDS +=3D "pixman"
>> =A0RDEPENDS +=3D "hal"
>> =A0PE =3D "1"
>> -PR =3D "r11"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0file://pkgconfig_fix.patch;patch=3D1 \
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.bb b/recipes/xorg-xse=
rver/xserver-xorg_1.4.bb
>> index cb9ddcd..edd1ac0 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.4.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.4.bb
>> @@ -4,7 +4,7 @@ DESCRIPTION =3D "the X.Org X server"
>> =A0DEPENDS +=3D "pixman"
>> =A0RDEPENDS +=3D "hal"
>> =A0PE =3D "1"
>> -PR =3D "r9"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0file://pkgconfig_fix.patch;patch=3D1 \
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb b/recipes/xorg-x=
server/xserver-xorg_1.5.1.bb
>> index d4b8caf..4c2efd5 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
>> @@ -4,7 +4,7 @@ DESCRIPTION =3D "the X.Org X server"
>> =A0DEPENDS +=3D "pixman libpciaccess openssl"
>> =A0RDEPENDS +=3D "hal"
>> =A0PE =3D "1"
>> -PR =3D "r3"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0file://sysroot_fix.patch;patch=3D1"
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb b/recipes/xorg-x=
server/xserver-xorg_1.5.3.bb
>> index 74ea3c4..3969724 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
>> @@ -4,7 +4,7 @@ DESCRIPTION =3D "the X.Org X server"
>> =A0DEPENDS +=3D "pixman libpciaccess openssl"
>> =A0RDEPENDS +=3D "hal"
>> =A0PE =3D "2"
>> -PR =3D "r5"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0file://sysroot_fix.patch;patch=3D1 \
>> diff --git a/recipes/xorg-xserver/xserver-xorg_1.6.1.bb b/recipes/xorg-x=
server/xserver-xorg_1.6.1.bb
>> index f2902cf..0c5a304 100644
>> --- a/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
>> +++ b/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
>> @@ -4,7 +4,7 @@ DESCRIPTION =3D "the X.Org X server"
>> =A0DEPENDS +=3D "pixman libpciaccess openssl xineramaproto libxinerama"
>> =A0RDEPENDS +=3D "hal"
>> =A0PE =3D "2"
>> -PR =3D "r2"
>> +PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D " \
>> =A0 =A0 =A0 file://sysroot_fix.patch;patch=3D1 \
>> --
>> 1.6.3
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


