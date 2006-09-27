Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GSYac-0000IX-Fx
	for openembedded-devel@openembedded.org; Wed, 27 Sep 2006 14:32:38 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8RCRefd018050 for <openembedded-devel@openembedded.org>;
	Wed, 27 Sep 2006 14:27:41 +0200
Message-ID: <451A6E3A.8080502@dominion.kabel.utwente.nl>
Date: Wed, 27 Sep 2006 14:27:38 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <1156715171.5536.60.camel@localhost.localdomain>	<200608281131.31893.openembedded@hrw.one.pl>	<44F2B9FC.6040404@dominion.kabel.utwente.nl>	<44F8411B.10405@dominion.kabel.utwente.nl>
	<74d0deb30609010806q5c5c55bagfcac92228408f4c7@mail.gmail.com>
In-Reply-To: <74d0deb30609010806q5c5c55bagfcac92228408f4c7@mail.gmail.com>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	k8RCRefd018050
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2006 12:32:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> On 9/1/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Koen Kooi schreef:
>>> Marcin Juszkiewicz schreef:
>>> <snip>
>>>
>>>
>>>>> "wifi" feature need some work too. There are machines which does no=
t have
>>>>> Prism based wifi cards (so no need for hostap-utils) or do not supp=
ort
>>>>> WPA (wpa-supplicant is not needed then). h4000 has internal wifi on
>>>>> ACX100 chipset (iirc) so it need only wireless-tools to have it wor=
king
>>>>> (chipset related packages should be listed in machine config).
>>> Which leads to the question: "how should they be listed?". At the mom=
ent a lot of machines
>>> just put those modules in BOOTSTRAP_*, which isn't going to work for =
things that don't use
>>> task-bootstrap (the =C3=85ngstr=C3=B6m distribution for example). A f=
ew weeks ago I introduced the
>>> 'BOOT_MODULES' variable for that, should we add that to all machines,=
 or is there a nicer
>>> way to do that?
>> And I ask again, before wasting my time implementing it: "should we ad=
d that to all
>> machines, or is there a nicer way to do that?"
>=20
> I wonder if this shouldn't be modularized a bit, the modules could be
> assigned to different base tasks. The ipaq-pxa270.conf puts the
> following modules into BOOTMODULES_RRECOMMENDS currently:
>=20
> PXA270_MODULES =3D "g_ether g_file_storage g_serial gadgetfs pxa27x_udc=
 \
>                   snd_pcm_oss snd_mixer_oss evdev mmc_block pcmcia hidp=
 \
>                   nls_cp437 nls_iso8859-1 nls_utf8 af_key"
> HX4700_MODULES =3D "i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_au=
dio"
>=20
> g_ether, g_file_storage, g_serial and gadgetfs are already in
> task-base-usbgadget-rrecommends.
> snd_pcm_oss and snd_mixer_oss are in task-base-alsa-rrecommends.
> hidp is in task-base-bluetooth-rrecommends
>=20
> This leaves us with
>=20
> pxa27x_udc evdev mmc_block pcmcia nls_cp437 nls_iso8859-1 nls_utf8 af_k=
ey
> i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_audio
>=20
> I propose to put pxa27x_udc in task-base-usbgadget-rrecommends (similar=
 to
> task-base-irda-rrecommends containing kernel-module-pxaficp-ir).
> But what about the rest?

Yes, what about the rest?

regards,

KOen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFGm45MkyGM64RGpERAtR6AJ91iCpv7bz9KB+B6nzcesMnVDEl0gCdECqW
Zb1G9WxYfgD47NQHLAMRJbU=3D
=3DPjhG
-----END PGP SIGNATURE-----


