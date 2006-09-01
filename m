Received: from [64.233.162.200] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GJAdw-0002S2-30
	for openembedded-devel@openembedded.org; Fri, 01 Sep 2006 17:09:16 +0200
Received: by nz-out-0102.google.com with SMTP id v1so666020nzb
	for <openembedded-devel@openembedded.org>;
	Fri, 01 Sep 2006 08:06:53 -0700 (PDT)
Received: by 10.35.49.4 with SMTP id b4mr800548pyk;
	Fri, 01 Sep 2006 08:06:52 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Fri, 1 Sep 2006 08:06:52 -0700 (PDT)
Message-ID: <74d0deb30609010806q5c5c55bagfcac92228408f4c7@mail.gmail.com>
Date: Fri, 1 Sep 2006 17:06:52 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <44F8411B.10405@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200608281131.31893.openembedded@hrw.one.pl>
	<44F2B9FC.6040404@dominion.kabel.utwente.nl>
	<44F8411B.10405@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Fri, 01 Sep 2006 15:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 9/1/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Koen Kooi schreef:
> > Marcin Juszkiewicz schreef:
> > <snip>
> >
> >
> >>> "wifi" feature need some work too. There are machines which does not =
have
> >>> Prism based wifi cards (so no need for hostap-utils) or do not suppor=
t
> >>> WPA (wpa-supplicant is not needed then). h4000 has internal wifi on
> >>> ACX100 chipset (iirc) so it need only wireless-tools to have it worki=
ng
> >>> (chipset related packages should be listed in machine config).
> >
> > Which leads to the question: "how should they be listed?". At the momen=
t a lot of machines
> > just put those modules in BOOTSTRAP_*, which isn't going to work for th=
ings that don't use
> > task-bootstrap (the =C5ngstr=F6m distribution for example). A few weeks=
 ago I introduced the
> > 'BOOT_MODULES' variable for that, should we add that to all machines, o=
r is there a nicer
> > way to do that?
>
> And I ask again, before wasting my time implementing it: "should we add t=
hat to all
> machines, or is there a nicer way to do that?"

I wonder if this shouldn't be modularized a bit, the modules could be
assigned to different base tasks. The ipaq-pxa270.conf puts the
following modules into BOOTMODULES_RRECOMMENDS currently:

PXA270_MODULES =3D "g_ether g_file_storage g_serial gadgetfs pxa27x_udc \
                  snd_pcm_oss snd_mixer_oss evdev mmc_block pcmcia hidp \
                  nls_cp437 nls_iso8859-1 nls_utf8 af_key"
HX4700_MODULES =3D "i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_audio"

g_ether, g_file_storage, g_serial and gadgetfs are already in
task-base-usbgadget-rrecommends.
snd_pcm_oss and snd_mixer_oss are in task-base-alsa-rrecommends.
hidp is in task-base-bluetooth-rrecommends

This leaves us with

pxa27x_udc evdev mmc_block pcmcia nls_cp437 nls_iso8859-1 nls_utf8 af_key
i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_audio

I propose to put pxa27x_udc in task-base-usbgadget-rrecommends (similar to
task-base-irda-rrecommends containing kernel-module-pxaficp-ir).
But what about the rest?

cheers
Philipp


