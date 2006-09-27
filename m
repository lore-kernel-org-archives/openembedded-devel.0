Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GScgG-0005Jx-G1
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 18:54:44 +0200
Received: by py-out-1112.google.com with SMTP id i75so321741pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2006 09:49:48 -0700 (PDT)
Received: by 10.35.131.4 with SMTP id i4mr1172362pyn;
	Wed, 27 Sep 2006 09:49:41 -0700 (PDT)
Received: by 10.35.96.4 with HTTP; Wed, 27 Sep 2006 09:49:41 -0700 (PDT)
Message-ID: <74d0deb30609270949s1137417ft1cbabcb9145360c4@mail.gmail.com>
Date: Wed, 27 Sep 2006 18:49:41 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <451A6E3A.8080502@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200608281131.31893.openembedded@hrw.one.pl>
	<44F2B9FC.6040404@dominion.kabel.utwente.nl>
	<44F8411B.10405@dominion.kabel.utwente.nl>
	<74d0deb30609010806q5c5c55bagfcac92228408f4c7@mail.gmail.com>
	<451A6E3A.8080502@dominion.kabel.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
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
X-List-Received-Date: Wed, 27 Sep 2006 16:54:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 9/27/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> pHilipp Zabel schreef:
> > On 9/1/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Koen Kooi schreef:
> >>> Marcin Juszkiewicz schreef:
> >>> <snip>
> >>>
> >>>
> >>>>> "wifi" feature need some work too. There are machines which does no=
t have
> >>>>> Prism based wifi cards (so no need for hostap-utils) or do not supp=
ort
> >>>>> WPA (wpa-supplicant is not needed then). h4000 has internal wifi on
> >>>>> ACX100 chipset (iirc) so it need only wireless-tools to have it wor=
king
> >>>>> (chipset related packages should be listed in machine config).
> >>> Which leads to the question: "how should they be listed?". At the mom=
ent a lot of machines
> >>> just put those modules in BOOTSTRAP_*, which isn't going to work for =
things that don't use
> >>> task-bootstrap (the =C5ngstr=F6m distribution for example). A few wee=
ks ago I introduced the
> >>> 'BOOT_MODULES' variable for that, should we add that to all machines,=
 or is there a nicer
> >>> way to do that?
> >> And I ask again, before wasting my time implementing it: "should we ad=
d that to all
> >> machines, or is there a nicer way to do that?"
> >
> > I wonder if this shouldn't be modularized a bit, the modules could be
> > assigned to different base tasks. The ipaq-pxa270.conf puts the
> > following modules into BOOTMODULES_RRECOMMENDS currently:
> >
> > PXA270_MODULES =3D "g_ether g_file_storage g_serial gadgetfs pxa27x_udc=
 \
> >                   snd_pcm_oss snd_mixer_oss evdev mmc_block pcmcia hidp=
 \
> >                   nls_cp437 nls_iso8859-1 nls_utf8 af_key"
> > HX4700_MODULES =3D "i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_au=
dio"
> >
> > g_ether, g_file_storage, g_serial and gadgetfs are already in
> > task-base-usbgadget-rrecommends.
> > snd_pcm_oss and snd_mixer_oss are in task-base-alsa-rrecommends.
> > hidp is in task-base-bluetooth-rrecommends
> >
> > This leaves us with
> >
> > pxa27x_udc evdev mmc_block pcmcia nls_cp437 nls_iso8859-1 nls_utf8 af_k=
ey
> > i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_audio
> >
> > I propose to put pxa27x_udc in task-base-usbgadget-rrecommends (similar=
 to
> > task-base-irda-rrecommends containing kernel-module-pxaficp-ir).
> > But what about the rest?
>
> Yes, what about the rest?

kernel-module-pxa27x_udc: task-base-usbgadget-rrecommends
kernel-module-pcmcia: task-base-pcmcia-rrecommends

Compile in evdev, mmc_block, i2c-pxa and af_key and be done with it?

kernel modules could rrecommend evdev if it was
compiled as a module, same goes for mmc_block
(let pxamci and asic3_mmc rrecommend it) and i2c-pxa.

kernel-module-pcmcia: task-base-pcmcia-rrecommends

regards
Philipp


