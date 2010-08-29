Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpmSx-0005It-HS
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 20:18:52 +0200
Received: by iwn2 with SMTP id 2so4166935iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Zc5bsGx/YHzo0KUvwiHfZVTTiGI4XYSwNi+Hn1dVuos=;
	b=BfcSOJZhgugO1Ooh/1rtdahw0WUiVLwFDuGDqiBC3O299O6xlf5GZ3N83zzUWwpxGP
	CGLuIq3GhQfyl/QZhBCNhZ2W2aR+p5BAAzbF/bAiJpLk/7DajGD3SWxl50ctQ38iCNkk
	0K4X643jAkjpPOO5Uvc4vVEYovWPWFcauD+HM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=owKzlJQCJe7Cekklt0B8rbkOyh1UQoRK25B8joES60+cAj+xIUPUTjFqz6aljeY/a0
	+YcSuiywZ7WLaffwOdsjCpYAnCCMHtyHlgE7NQ2XJ9E1NHPA5/xY1AOpTUJH7LxOzsx9
	ryBtlV+rErzgkTMcP55wRKD0kqpuRitrTBo6w=
Received: by 10.231.172.75 with SMTP id k11mr4316034ibz.4.1283105851693; Sun,
	29 Aug 2010 11:17:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 11:15:41 -0700 (PDT)
In-Reply-To: <i5das3$v2$3@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-12-git-send-email-raj.khem@gmail.com>
	<i5das3$v2$3@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 11:15:41 -0700
Message-ID: <AANLkTikE=wDnQPu5txDEL4QdOjfrD3YK1DOphAqvZZ4h@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Sun, 29 Aug 2010 18:18:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 2:56 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-08-10 22:24, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/udev/udev-compat141_141.bb | =A0 =A06 +++++-
>> =A01 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-comp=
at141_141.bb
>> index 2411fc6..c39d4cb 100644
>> --- a/recipes/udev/udev-compat141_141.bb
>> +++ b/recipes/udev/udev-compat141_141.bb
>> @@ -15,7 +15,11 @@ PACKAGES =3D "${PN} ${PN}-dbg"
>> =A0PROVIDES =3D "udev-compat"
>>
>> =A0# Need udev with udev-compat-wrapper support and nothing else.
>> -RDEPENDS_${PN} =3D "udev-compat-wrapper"
>> +RDEPENDS_${PN}_spitz =3D "udev-compat-wrapper"
>> +RDEPENDS_${PN}_akita =3D "udev-compat-wrapper"
>> +RDEPENDS_${PN}_c7x0 =3D "udev-compat-wrapper"
>> +RDEPENDS_${PN}_poodle =3D "udev-compat-wrapper"
>> +
>> =A0# Remove hotplug RPROVIDES
>> =A0RPROVIDES_${PN} =3D "udev-compat"
>
> NAK, this is a generic wrapper to use recent udev on older kernels, not
> specific to zaurus.

OK then why is this wrapper only rprovided for specific machines and
not rprovided always for every machine ?
It seems its does not do what you are saying IIUC.

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMei7DMkyGM64RGpERAlCJAKCmAKGCSfycd7te59U6LXjh2uB16wCeKAtv
> BwH22cNlpYQZPS2ohlGp7tc=3D
> =3DVWjc
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


