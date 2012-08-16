Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T1zNe-0005Ew-Gw
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 14:40:54 +0200
Received: by ghbz2 with SMTP id z2so3075172ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=z2YSzN0bjd9iFfJpYx9qL7S7+hY3ViIGx7w3z1xNaB4=;
	b=paVfLDrjnAkhogdGtUx+ToRZZ4X7JIFhvApWpIHs5J5AQRCIetCwCjGi/5JB9NjM33
	oRLLXW3qP+VFNAXha1n/zzT7awopzL5LDDhwYwWirQ2smuUypmzqlQCkejQxtGhjlZBw
	f16DYVeVC6tde5KRkvuq+dFLqiVPFYXUll/ugcZIplx2wEFvG5a9HmqtKAWER2muA5Q4
	UJi96ByUSRre6Dkjn7OXEguMp70PCw4FxlCQ+waa4Pn4W+lJoHCGgNs7WKSD8dKNwni4
	GEH4u90TNNr28d1v1SfxyHZf4Is+28Sf5xDNTHERHxNqyMuNJDzhqtlsEnZ53rUfPbLm
	lOOw==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr1176084igc.50.1345120136751; Thu,
	16 Aug 2012 05:28:56 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 16 Aug 2012 05:28:56 -0700 (PDT)
In-Reply-To: <k0indq$f96$1@ger.gmane.org>
References: <1344903048-2800-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQJHwSY5CC+c0na_nWH2mck0TjcKP87k4q=aMQKmRdvgQ@mail.gmail.com>
	<k0indq$f96$1@ger.gmane.org>
Date: Thu, 16 Aug 2012 14:28:56 +0200
Message-ID: <CALbNGRRWiP_1Zu-K6oXdiohX-jtMnYnprys39DszBPGjMZunvA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd,v2] wpa-supplicant: add systemd support
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
X-List-Received-Date: Thu, 16 Aug 2012 12:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 2:00 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 16-08-12 13:44, Andreas M=FCller schreef:
>> On Tue, Aug 14, 2012 at 2:10 AM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>> * native systemd support came in with v1.0 [1] * needs [2] to work
>>> properly * mends my wlan under control of networkmanager
>>>
>>> [1]
>>> http://hostap.epitest.fi/gitweb/gitweb.cgi?p=3Dhostap-1.git;a=3Dblob_pl=
ain;f=3Dwpa_supplicant/ChangeLog
>>>
>>>
> [2] http://patches.openembedded.org/patch/34335/
>>>
>>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com> ---
>>> .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |    3 ---
>>> .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   14
>>> ++++++++++++++ 2 files changed, 14 insertions(+), 3 deletions(-) delete
>>> mode 100644
>>> meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>>>
>>>
> create mode 100644
> meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1=
.0.bbappend
>>>
>>> diff --git
>>> a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappe=
nd
>>> b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappe=
nd
>>>
>>>
> deleted file mode 100644
>>> index 54da0ff..0000000 ---
>>> a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappe=
nd
>>>
>>>
> +++ /dev/null
>>> @@ -1,3 +0,0 @@ -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:" -
>>> -PRINC =3D "1" diff --git
>>> a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt_1.0.bbappend
>>> b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt_1.0.bbappend
>>>
>>>
> new file mode 100644
>>> index 0000000..6f62cd8 --- /dev/null +++
>>> b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt_1.0.bbappend
>>>
>>>
> @@ -0,0 +1,14 @@
>>> +PRINC =3D "2" + +inherit systemd + +SYSTEMD_PACKAGES =3D "${PN}-system=
d"
>>> +SYSTEMD_SERVICE =3D "wpa_supplicant.service" + +do_install_append () {=
 +
>>> install -d ${D}${systemd_unitdir}/system +    install -m 644
>>> ${S}/systemd/*.service ${D}${systemd_unitdir}/system +} + +#
>>> systemd.bbclass does not catch all multiple-instance-service-files
>>> +FILES_${PN}-systemd +=3D "${systemd_unitdir}/system/" -- 1.7.4.4
>>>
>> I am testing
>>
>> SYSTEMD_AUTO_ENABLE =3D "disable"
>>
>> to avoid starting at every boot. First results look good and I think a V=
3
>> will follow.
>
> wpa-supplicant should get bus-activated using the dbus.service when
> connman/networkmanager/whatever need it. Is something failing in the nm c=
ase?
>
No nothing is failing so far. I did systemctl disable
wpa_supplicant.service on the machine and everything still works. But
before sending out V3 I would like to test on a fresh image.

Andreas


