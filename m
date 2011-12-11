Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitperov@gmail.com>) id 1RZbTh-0006Qt-BN
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Dec 2011 05:57:33 +0100
Received: by pbcc11 with SMTP id c11so589872pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 20:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=u4PHPj9eVjjMaWvGNMOKHIYhysSsVn8rZ0V7jyy+MEU=;
	b=H/JJLheTPtQ+ApPPF2SeZrqTe7b1tZYv624zwYnkH5ZKECvSkGUKlzFHwp/QY7xOId
	Hy/3CYQX8Dp3wN7uITVHllEz1D+jQr87e1/JKJLyTWdtX12tjXh9CngIxH3EfEMgVXbD
	rG2k9oK4klr7hWajbsuq8n0wGOz4pyHQE6x6A=
MIME-Version: 1.0
Received: by 10.68.208.162 with SMTP id mf2mr20966944pbc.0.1323579034591; Sat,
	10 Dec 2011 20:50:34 -0800 (PST)
Received: by 10.68.191.10 with HTTP; Sat, 10 Dec 2011 20:50:34 -0800 (PST)
In-Reply-To: <1323552152.25802.133.camel@mattotaupa>
References: <1323547821-19780-1-git-send-email-vitperov@gmail.com>
	<1323552152.25802.133.camel@mattotaupa>
Date: Sun, 11 Dec 2011 07:50:34 +0300
Message-ID: <CAKT91VyBTac+h6=_2_57W-1LXtBDmKFYRU_zvVKF1M8RQAi3Og@mail.gmail.com>
From: Vit <vitperov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ftplib: add initial version of recipe
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
X-List-Received-Date: Sun, 11 Dec 2011 04:57:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Dear Paul,

Thank you very much for your comments.


On Sun, Dec 11, 2011 at 1:22 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Vitaly,
>
>
> thank you for your patch.
>
> Am Sonntag, den 11.12.2011, 00:10 +0400 schrieb Vitaly Perov:
>> From: Vitaly Perov <vit@vt-tech.eu>
>
> Please add the recipe version to the commit summary (subject) and follow
> our commit policy [1][2][3].
>
> Especially your Signed-off-by line is missing. Please also add
> information how you tested that recipe.
>
>> ---
>> =A0recipes/ftplib/ftplib_3.1.bb | =A0 38 +++++++++++++++++++++++++++++++=
+++++++
>> =A01 files changed, 38 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/ftplib/ftplib_3.1.bb
>>
>> diff --git a/recipes/ftplib/ftplib_3.1.bb b/recipes/ftplib/ftplib_3.1.bb
>> new file mode 100644
>> index 0000000..1dcdb3d
>> --- /dev/null
>> +++ b/recipes/ftplib/ftplib_3.1.bb
>> @@ -0,0 +1,38 @@
>> +#! /bin/sh
>> +
>
> The shebang is not needed.
>
>> +DESCRIPTION =3D "A set of routines that implement the FTP protocol"
>> +HOMEPAGE =3D "http://nbpfaus.net/~pfau/ftplib/"
>> +LICENSE =3D "LGPLv2"
>> +
>> +PR =3D "r1"
>
> Please start with `r0` when submitting.
>
>> +
>> +#######################################################################=
###############
>
> Please remove these =93style=94 lines. They are not common. [4]
>
>> +
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> Why is that needed. Please add a comment and explain it in the commit
> message.
>
>> +
>> +SRC_URI =3D "http://nbpfaus.net/~pfau/ftplib/ftplib-${PV}-src.tar.gz"
>
> Can you talk with upstream, that they release versioned tarballs
> otherwise that will become a mess when upgraded.
>
>> +
>> +S =3D "${WORKDIR}/ftplib-${PV}"
>> +
>> +#######################################################################=
###############
>> +
>> +SRC_URI[md5sum] =3D "c6af758ccbf806b28f022a587a41d9c5"
>> +SRC_URI[sha256sum] =3D "be524e1086cfe9d86afa832e1413dde79a4e88ee8ea5325=
a87ffaaf6620a0a2b"
>> +
>> +#######################################################################=
###############
>> +do_compile() {
>> + =A0 =A0cd linux && make
>
> Are you sure that works? At least `oe-runmake` should be used. This way
> you should get not the correct target architecture since the build host
> make is used. (I could be mistaken and maybe the Makefile figures it out
> nevertheless.)
>
>> +}
>> +
>> +do_install() {
>> + =A0 =A0install -d ${D}/${libdir}
>> + =A0 =A0install -d ${D}/${includedir}
>> + =A0 =A0install -d ${D}/${bindir}
>> + =A0 =A0install -m 755 ${S}/linux/libftp.so.3.1 ${D}/${libdir}
>> + =A0 =A0install -m 755 ${S}/linux/libftp.a ${D}/${libdir}
>> + =A0 =A0install -m 644 ${S}/linux/ftplib.h ${D}/${includedir}
>> + =A0 =A0install -m 755 ${S}/linux/qftp ${D}/${bindir}
>> + =A0 =A0(cd ${D}/${libdir} && \
>> + =A0 =A0 ln -sf libftp.so.3.1 libftp.so.3 && \
>> + =A0 =A0 ln -sf libftp.so.3 libftp.so)
>> +}
>
> I do not know if the last three lines are common. But if it works,
> great!
>
>
> Thanks,
>
> Paul
>
>
> [1] http://www.openembedded.org/wiki/Category:Policy
> [2] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> [3] http://www.openembedded.org/wiki/Commit_Policy
> [4] http://www.openembedded.org/wiki/Styleguide
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


