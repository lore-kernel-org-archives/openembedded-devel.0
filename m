Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCU2Y-0005vQ-1G
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 11:49:53 +0200
Received: by qyk27 with SMTP id 27so405589qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=va9exvaK2YLuDYUdP1BrdUFrJUSENtCsu6XdLvK/UWI=;
	b=VE5faHNWCqSpRABtZ3f2aDYvH5D1WVZH8PO5EUN/mQqdcE5f8uhVbntXbsEohjvT4O
	LsjeCd1Q2yptyOyco+C7KiD7zCyl074qCg+3lpaHHdv0wKfrPbQvm+YWX/j18ro3SFTC
	Zv3e4FD2JBUHb0Yk0AXyuMdku7693SIDyrsFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nka0vH2oZSAprMpvesOzR9rJVnx54kMId68Y1dbhNUoCVgOj1N6/z9X4+tHvTXNjvm
	jV0V3nLjFaB+vVrAf2feiqZ0jJ5liR8AHc8nwuSiiOsBUOinHLJwaGCnvKDPv94QPklb
	J7wObcGDB//a8YvmyDzqUbBBZNzFOJCEFhwZY=
Received: by 10.229.27.65 with SMTP id h1mr5022106qcc.216.1303292815123; Wed,
	20 Apr 2011 02:46:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.46.10 with HTTP; Wed, 20 Apr 2011 02:46:35 -0700 (PDT)
In-Reply-To: <1303291897.3979.14.camel@mattotaupa>
References: <cover.1303289630.git.michael.lippautz@gmail.com>
	<c7f3c39da393b9259fb84c14d99f54b734869b86.1303289630.git.michael.lippautz@gmail.com>
	<1303291897.3979.14.camel@mattotaupa>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Wed, 20 Apr 2011 11:46:35 +0200
Message-ID: <BANLkTinB5zp0yyqeM4mzENMfR-N7Sv+3WA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-meta][PATCHv2] 1/3] libnet: Clean and upgrade (see below)
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
X-List-Received-Date: Wed, 20 Apr 2011 09:49:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2011/4/20 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear Michael,
>
>
> thank you for your patches.
>
> Am Mittwoch, den 20.04.2011, 10:57 +0200 schrieb Michael Lippautz:
>> * libbnet upstream on packetfactor is dead
>> =A0 using https://github.com/sam-github/libnet instead
>> * Move to version 1.1.5
>> * Dropped patches (not needed): support-uclibc, new-autotools
>> * Added LIC_FILES_CHKSUM
>> * Removed useless do_install_append, works automatically
>> * Not building statically anymore
>> * Should be compatible with old v1.1 versions
>>
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> =A0.../libnet/libnet-1.1.5/fix-endianess-test.patch =A0 | =A0 38 +++++++=
+++++++++++++
>> =A0.../recipes-connectivity/libnet/libnet_1.1.5.bb =A0 =A0| =A0 24 +++++=
+++++++
>> =A02 files changed, 62 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.5/f=
ix-endianess-test.patch
>> =A0create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.b=
b
>
> [=85]
>
>> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-=
oe/recipes-connectivity/libnet/libnet_1.1.5.bb
>> new file mode 100644
>> index 0000000..ec426a5
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION =3D "A packet dissection and creation library"
>> +# libnet at packetfactory.net is dead
>> +HOMEPAGE =3D "https://github.com/sam-github/libnet"
>> +SECTION =3D "libs"
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D "file://README;md5=3D533bea47338d490e86744c6a0c569=
2e7"
>
> What does the README have to do with the license? I thought if there is
> not file `COPYING` =96 maybe one should be sent upstream =96 one takes th=
e
> header of the source files as for example `libnet_asn1.c` [1].

Thats true, but there are different headers (see your [1] against
[3]), and the README describes the overall situation. But there's no
licensing informating in it, thats true. Any ideas regarding the
different headers?

>
>> +DEPENDS =3D "libpcap"
>> +# There are major API changes beween libnet v1.0 and libnet v1.1
>> +PROVIDES =3D "libnet-1.1"
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
>> + =A0 =A0 =A0 =A0 =A0 file://fix-endianess-test.patch"
>> +
>> +SRC_URI[md5sum] =3D "a9bc1d75a610efcfee200d3e28d8eb8f"
>> +SRC_URI[sha256sum] =3D "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80=
d8275db994496a20d"
>> +
>> +S =3D "${WORKDIR}/${PN}-${PV}"
>
> This is the default [2] and should be dropped.

Sorry for that, I can fix that when adding the licensing information.

>
>> +
>> +inherit autotools binconfig
>> +
>> +do_configure_prepend() {
>> + =A0 =A0 =A0 =A0rm -f aclocal.m4 Makefile.am ltmain.sh
>> +}
>
>
> Thanks,
>
> Paul
>
>
> [1] https://github.com/sam-github/libnet/blob/master/libnet/src/libnet_as=
n1.c
> [2] http://docs.openembedded.org/usermanual/usermanual.html#id327409
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

[3] https://github.com/sam-github/libnet/blob/master/libnet/src/libnet_buil=
d_802.2.c

regargs,
Michael


