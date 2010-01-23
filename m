Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYdtQ-00076f-Su
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 12:11:07 +0100
Received: by bwz9 with SMTP id 9so1590828bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 03:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DAWMvHDp6LdeHDBI8+I98wrI/usyQsJ0d2YPYluLRIA=;
	b=Uk30wkQVHvZEXZJn/9C2oir3a5wEvnM5kec40or4mYRVV5PcTSxDSCBaaKEl9rzGUa
	Ym6mxH2YB2ezj0gKeYzwEls+Sieg+mmLyCR9/cJUYJQow40SDHFtWMQs6JsR+sggI+nh
	xVoQWMbYWW0/4NIXcE/POVNoNzHVMpkwDDFQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uO6QBYnX4ERF/pjWgossb+cav5RSlxFdCtPLW3+pOoIHqO2QYPhpv2xzww+MVzuVIR
	v+3BJj1QOl3HCzowB/CYx3EOLO+cN1l8UvG/05gB/KZ4hYLNI3f4/CqATkskv7HhbTZh
	CyK5BBGrzPIRjv9NhQPuIeWOSsIqDNYsJM7tM=
MIME-Version: 1.0
Received: by 10.204.175.81 with SMTP id w17mr1143346bkz.125.1264244926348; 
	Sat, 23 Jan 2010 03:08:46 -0800 (PST)
In-Reply-To: <hjejvh$m65$2@ger.gmane.org>
References: <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
	<hjejvh$m65$2@ger.gmane.org>
Date: Sat, 23 Jan 2010 12:08:46 +0100
Message-ID: <fca63bcf1001230308h463416adwb48db9a5bc295618@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Sat, 23 Jan 2010 11:11:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Since a few parts of the .inc are quite confusing I didn't want to
touch it too much.

Ofc we can start gpsd using a control socket.

How should we then solve the problem concerning the different devices?
We would still need an init script that adds gps hardware to gpsd via
the socket and additional packages for different devices providing a
hardware file (containing the path) ?

I am open for suggestions since an I really want to update this.
(Future gpsd will remove the current API to provide additional gps
devices support)

Regards,
Michael

2010/1/23 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Speaking of GPSD, should we make the default config use a control socket
> instead of hardcoding ttyS3?
>
> regards,
>
> Koen
>
> On 22-01-10 22:58, Michael Lippautz wrote:
>>
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> =A0recipes/gpsd/gpsd.inc =A0 =A0 | =A0 =A09 ++++++---
>> =A0recipes/gpsd/gpsd_2.38.bb | =A0 =A04 +++-
>> =A02 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
>> index a917fbe..5efbe2a 100644
>> --- a/recipes/gpsd/gpsd.inc
>> +++ b/recipes/gpsd/gpsd.inc
>> @@ -5,12 +5,14 @@ LICENSE =3D "GPL"
>> =A0DEPENDS =3D "dbus-glib ncurses python"
>> =A0PROVIDES =3D "virtual/gpsd"
>>
>> +INC_PR =3D "r0"
>> +
>> =A0EXTRA_OECONF =3D "--x-includes=3D${STAGING_INCDIR}/X11 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--x-libraries=3D${STAGING_LIBDIR} \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-dbus \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-python"
>> +"
>>
>> -SRC_URI =3D "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
>> +SRC_URI =3D "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=3Dg=
psd \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://gpsd-default \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://gps-hardware \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://gpsd"
>> @@ -28,6 +30,8 @@ LDFLAGS +=3D "-L${STAGING_LIBDIR} -lm"
>> =A0export STAGING_INCDIR
>> =A0export STAGING_LIBDIR
>>
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +
>> =A0do_compile_prepend() {
>> =A0 =A0 =A0export BUILD_SYS=3D"${BUILD_SYS}"
>> =A0 =A0 =A0export HOST_SYS=3D"${HOST_SYS}"
>> @@ -41,7 +45,6 @@ do_install_prepend() {
>>
>> =A0do_install_append() {
>> =A0 =A0 =A0 =A0 =A0install -d ${D}/${sysconfdir}/init.d
>> - =A0 =A0 =A0 =A0install -d ${D}/dev
>> =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/in=
it.d/
>> =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/gps-hardware ${D}/${syscon=
fdir}/init.d/gps-hardware.default
>> =A0 =A0 =A0 =A0 =A0install -d ${D}/${sysconfdir}/default
>> diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
>> index 06a5fe7..7c7a477 100644
>> --- a/recipes/gpsd/gpsd_2.38.bb
>> +++ b/recipes/gpsd/gpsd_2.38.bb
>> @@ -1,5 +1,7 @@
>> =A0require gpsd.inc
>>
>> -PR =3D "r2"
>> +PR =3D "${INC_PR}.1"
>> =A0# make attempts to link gpspacket.so without waiting for all compiler=
 tasks:
>> =A0PARALLEL_MAKE =3D ""
>> +
>> +EXTRA_OECONF +=3D " --enable-python "
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLWtMyMkyGM64RGpERAtmDAJ9WqnRXPxe1NX6+HWg4hfPxTYd1bACffpoW
> SG0ttXz5eVQUTE1J7X6vF5Q=3D
> =3D+Wfg
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


