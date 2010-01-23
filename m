Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYm0j-0001UB-OK
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 20:51:12 +0100
Received: by bwz9 with SMTP id 9so1740388bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 11:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pIMDAXlpnbryxQhJHZ2BjoWFPT9i765tRFnN0ocKLTs=;
	b=d24pYfykQsi2pZYaM3k3TpsHLKQmYuJlbzu8ZYqpFP1zo6DUC+T+ZkUQUysHJGCuTJ
	3OWXBon4vKH71kJ5VD7kWTzDQLxOWVG3BfvKLCVYPZH8brZK9AcXsJUHizZhGVhYkuVT
	yl3tyW5JOnfA8txFAmEKANG80V0B+mO+vkNFo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lPUzNPlzmaGltR2sUP/ryQN3vDZGSnBLrbmxnzGG8GnozjPZnGcswzGfpXgENrHb8d
	goFl4ysc2ckUtRYl/eVLnoAqgGnmklrcXycxySK70Px0DcWzMlLlt5jeMIdxCDvCOUve
	QPPmmxu9W2J2Yc2h2CA28O/tjtPqQiys7QPTs=
MIME-Version: 1.0
Received: by 10.204.11.15 with SMTP id r15mr1048969bkr.40.1264276131013; Sat, 
	23 Jan 2010 11:48:51 -0800 (PST)
In-Reply-To: <hjevqo$lld$1@ger.gmane.org>
References: <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
	<hjejvh$m65$2@ger.gmane.org>
	<fca63bcf1001230308h463416adwb48db9a5bc295618@mail.gmail.com>
	<hjevqo$lld$1@ger.gmane.org>
Date: Sat, 23 Jan 2010 20:48:50 +0100
Message-ID: <fca63bcf1001231148r53784c6dhb6691e1611e88184@mail.gmail.com>
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
X-List-Received-Date: Sat, 23 Jan 2010 19:51:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

So maybe you should not submit the patch...

I would create the recipe as gpsd started up in init.d using a control
socket. But from there on i don't know how machine/gps-device specific
options should be integrated. Should they be packed into a new recipe,
i.e. gpsd-device-....? And if, how if not thorugh defaults or init.d?

regards,
Michael

2010/1/23 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-01-10 12:08, Michael Lippautz wrote:
>> Since a few parts of the .inc are quite confusing I didn't want to
>> touch it too much.
>>
>> Ofc we can start gpsd using a control socket.
>>
>> How should we then solve the problem concerning the different devices?
>> We would still need an init script that adds gps hardware to gpsd via
>> the socket and additional packages for different devices providing a
>> hardware file (containing the path) ?
>
> I have no strong opinion on that, it's just that machine specific
> initscripts (vs machine specific /etc/default/foo) are just evil :)
>
>> I am open for suggestions since an I really want to update this.
>> (Future gpsd will remove the current API to provide additional gps
>> devices support)
>
> My remarks had nothing to do with your patch (which looks fine, btw), it
> just triggered a memory about *#(@*(@ gpsd-conf.
>
> regards,
>
> Koen
>
>
>> Regards,
>> Michael
>>
>> 2010/1/23 Koen Kooi <k.kooi@student.utwente.nl>:
>> Speaking of GPSD, should we make the default config use a control socket
>> instead of hardcoding ttyS3?
>>
>> regards,
>>
>> Koen
>>
>> On 22-01-10 22:58, Michael Lippautz wrote:
>>>>>
>>>>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>>>>> ---
>>>>> =A0recipes/gpsd/gpsd.inc =A0 =A0 | =A0 =A09 ++++++---
>>>>> =A0recipes/gpsd/gpsd_2.38.bb | =A0 =A04 +++-
>>>>> =A02 files changed, 9 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
>>>>> index a917fbe..5efbe2a 100644
>>>>> --- a/recipes/gpsd/gpsd.inc
>>>>> +++ b/recipes/gpsd/gpsd.inc
>>>>> @@ -5,12 +5,14 @@ LICENSE =3D "GPL"
>>>>> =A0DEPENDS =3D "dbus-glib ncurses python"
>>>>> =A0PROVIDES =3D "virtual/gpsd"
>>>>>
>>>>> +INC_PR =3D "r0"
>>>>> +
>>>>> =A0EXTRA_OECONF =3D "--x-includes=3D${STAGING_INCDIR}/X11 \
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--x-libraries=3D${STAGING_LIBDIR} =
\
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-dbus \
>>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-python"
>>>>> +"
>>>>>
>>>>> -SRC_URI =3D "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
>>>>> +SRC_URI =3D "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=
=3Dgpsd \
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 file://gpsd-default \
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 file://gps-hardware \
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 file://gpsd"
>>>>> @@ -28,6 +30,8 @@ LDFLAGS +=3D "-L${STAGING_LIBDIR} -lm"
>>>>> =A0export STAGING_INCDIR
>>>>> =A0export STAGING_LIBDIR
>>>>>
>>>>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>>>> +
>>>>> =A0do_compile_prepend() {
>>>>> =A0 =A0 =A0export BUILD_SYS=3D"${BUILD_SYS}"
>>>>> =A0 =A0 =A0export HOST_SYS=3D"${HOST_SYS}"
>>>>> @@ -41,7 +45,6 @@ do_install_prepend() {
>>>>>
>>>>> =A0do_install_append() {
>>>>> =A0 =A0 =A0 =A0 =A0install -d ${D}/${sysconfdir}/init.d
>>>>> - =A0 =A0 =A0 =A0install -d ${D}/dev
>>>>> =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}=
/init.d/
>>>>> =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/gps-hardware ${D}/${sys=
confdir}/init.d/gps-hardware.default
>>>>> =A0 =A0 =A0 =A0 =A0install -d ${D}/${sysconfdir}/default
>>>>> diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
>>>>> index 06a5fe7..7c7a477 100644
>>>>> --- a/recipes/gpsd/gpsd_2.38.bb
>>>>> +++ b/recipes/gpsd/gpsd_2.38.bb
>>>>> @@ -1,5 +1,7 @@
>>>>> =A0require gpsd.inc
>>>>>
>>>>> -PR =3D "r2"
>>>>> +PR =3D "${INC_PR}.1"
>>>>> =A0# make attempts to link gpspacket.so without waiting for all compi=
ler tasks:
>>>>> =A0PARALLEL_MAKE =3D ""
>>>>> +
>>>>> +EXTRA_OECONF +=3D " --enable-python "
>>
>>>
>>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLWwKZMkyGM64RGpERAi5bAJ9oNZzwy8Jrl03IovVdD4Bqw2tIkQCgsW4+
> jq/K97DHKqK4b05yJv+if34=3D
> =3D33vV
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


