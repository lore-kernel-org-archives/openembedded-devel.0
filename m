Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GScrx-0005Vq-IX
	for openembedded-devel@openembedded.org; Wed, 27 Sep 2006 19:06:49 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8RH1ofd009417 for <openembedded-devel@openembedded.org>;
	Wed, 27 Sep 2006 19:01:50 +0200
Message-ID: <451AAE7E.9060405@dominion.kabel.utwente.nl>
Date: Wed, 27 Sep 2006 19:01:50 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <1156715171.5536.60.camel@localhost.localdomain>	<200608281131.31893.openembedded@hrw.one.pl>	<44F2B9FC.6040404@dominion.kabel.utwente.nl>	<44F8411B.10405@dominion.kabel.utwente.nl>	<74d0deb30609010806q5c5c55bagfcac92228408f4c7@mail.gmail.com>	<451A6E3A.8080502@dominion.kabel.utwente.nl>
	<74d0deb30609270949s1137417ft1cbabcb9145360c4@mail.gmail.com>
In-Reply-To: <74d0deb30609270949s1137417ft1cbabcb9145360c4@mail.gmail.com>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Wed, 27 Sep 2006 17:06:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:

>>> I wonder if this shouldn't be modularized a bit, the modules could be
>>> assigned to different base tasks. The ipaq-pxa270.conf puts the
>>> following modules into BOOTMODULES_RRECOMMENDS currently:
>>>
>>> PXA270_MODULES = "g_ether g_file_storage g_serial gadgetfs pxa27x_udc \
>>>                   snd_pcm_oss snd_mixer_oss evdev mmc_block pcmcia hidp \
>>>                   nls_cp437 nls_iso8859-1 nls_utf8 af_key"
>>> HX4700_MODULES = "i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_audio"
>>>
>>> g_ether, g_file_storage, g_serial and gadgetfs are already in
>>> task-base-usbgadget-rrecommends.
>>> snd_pcm_oss and snd_mixer_oss are in task-base-alsa-rrecommends.
>>> hidp is in task-base-bluetooth-rrecommends
>>>
>>> This leaves us with
>>>
>>> pxa27x_udc evdev mmc_block pcmcia nls_cp437 nls_iso8859-1 nls_utf8 af_key
>>> i2c-pxa hx4700_voltage acx hx4700_acx snd_hx4700_audio
>>>
>>> I propose to put pxa27x_udc in task-base-usbgadget-rrecommends (similar to
>>> task-base-irda-rrecommends containing kernel-module-pxaficp-ir).
>>> But what about the rest?
>> Yes, what about the rest?
> 
> kernel-module-pxa27x_udc: task-base-usbgadget-rrecommends
> kernel-module-pcmcia: task-base-pcmcia-rrecommends
> 
> Compile in evdev, mmc_block, i2c-pxa and af_key and be done with it?
> 
> kernel modules could rrecommend evdev if it was
> compiled as a module, same goes for mmc_block
> (let pxamci and asic3_mmc rrecommend it) and i2c-pxa.
> 
> kernel-module-pcmcia: task-base-pcmcia-rrecommends

Looks good, please commit it :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFGq5+MkyGM64RGpERAqccAJoDj04Bkh7mkuMj2ybipNhvvjgTFACaAmrz
BHDx3B11/kSyd4QHdfB2bYw=
=NhGN
-----END PGP SIGNATURE-----


