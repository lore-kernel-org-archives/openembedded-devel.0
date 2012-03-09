Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5xqG-0003Xl-HC
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 12:18:36 +0100
Received: by iaag37 with SMTP id g37so1946277iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 03:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pCF33VpoXYFkHX2Px5FwRLiBiZNLUp/4s5cbQg748XI=;
	b=x/Y7rBH+UtqIzFD8suyPmaDbqMNaBbFVoVhOqLZKeLeNDIsinHiHX4MmmfYUD6z/ci
	htZv4MXPSEPTwH39YLA0e+btsAYfmdeI4u2GBDvDJZQ/WCj+OSs+jRUo6TgikFzrl0IK
	p1sSVi8lCxDCVXqr+KvNGRA5IKwXfIho6Ux8SxOTdX8/Uxyg+PJqZnqKiLuoYub+7W8R
	blNMaGBEwSHIZPA8kcumGxuTbVbWKaA/pPK9OBQKS75lLUAfHxx8TLTJbByq66DG/TJc
	mL6ud1eUdMCvlIn29mW5QrZHtYPhxKdKlVkWgooaQkzMltrA1VvfcsSPQVd699y7Fgrj
	TkCQ==
MIME-Version: 1.0
Received: by 10.50.194.193 with SMTP id hy1mr2275520igc.53.1331291396753; Fri,
	09 Mar 2012 03:09:56 -0800 (PST)
Received: by 10.42.75.137 with HTTP; Fri, 9 Mar 2012 03:09:56 -0800 (PST)
In-Reply-To: <CALbNGRR-jB0_h6u-g6KswZAQkfwUVmK4V=U_OL=GbLF3UWB1gw@mail.gmail.com>
References: <CALbNGRR-jB0_h6u-g6KswZAQkfwUVmK4V=U_OL=GbLF3UWB1gw@mail.gmail.com>
Date: Fri, 9 Mar 2012 12:09:56 +0100
Message-ID: <CALbNGRTQNbk7JR0fu1iwxZN=brys-uOvKc3jZLdfMUBvW6Z8Ew@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libertas seems broken since udev 180
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
X-List-Received-Date: Fri, 09 Mar 2012 11:18:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 4, 2012 at 10:52 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> this problem I face since a while but didn't find the time to take
> care. Since udev 180 overo's wlan does not work (marvel) and =A0I get:
>
> at early user space:
> udevd[77]: starting version 181
> Starting POSIX Message Queue File System...
> Started Configuration File System =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Started Security File System =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> Started FUSE Control File System =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> Started udev Kernel Device Manager =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> Started Lock Directory =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> Started Runtime Directory =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Started Media Directory =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Started Remount API VFS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Started Apply Kernel Variables =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> Started Debug File System =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Started File System Check on Root Device =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> Started POSIX Message Queue File System =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Starting Remount Root FS...
> Started udev Coldplug all Devices =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> _regulator_get: spi1.0 supply vcc not found, using dummy regulator
> ads7846 spi1.0: touchscreen, irq 274
> ads7846 spi1.0: no device detected, test read result was 0x00000000
> cfg80211: Calling CRDA to update world regulatory domain
> Started Remount Root FS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> libertas_sdio: Libertas SDIO driver
> libertas_sdio: Copyright Pierre Ossman
>
> Right after login prompt:
> libertas_sdio mmc1:0001:1: (unregistered net_device):
> ff:ff:ff:ff:ff:ff, fw 0.0.0p0, cap 0x00000000
> libertas_sdio mmc1:0001:1: (unregistered net_device): unidentified
> region code; using the default (USA)
> libertas_sdio mmc1:0001:1: wlan0: Marvell WLAN 802.11 adapter
>
> and cyclic ~every 3s
>
> libertas_sdio mmc1:0001:1: wlan0: command 0x0000 timed out
> libertas_sdio mmc1:0001:1: wlan0: Timeout submitting command 0x0000
>
>
>
> With udev 175 wlan is working properly and I get after boot prompt
> (please ignore 'Network Manager Wait Online'-lines. This is for test
> and it looks same with unmodified networkmanager):
>
> Angstrom v2012.03-core - Kernel 3.0.17+
>
> overo login: cfg80211: Calling CRDA to update world regulatory domain
> Started Network Manager =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> Starting Network Manager Wait Online...
> Failed to start Network Manager Wait Online =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0[FAILED]
> See 'systemctl status NetworkManager-wait-online.service' for details.
> Starting Network Time Service...
> smsc911x smsc911x.0: eth0: SMSC911x/921x identified at 0xd0808000, IRQ: 3=
36
> Started Network Time Service =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ =A0OK =A0]
> libertas_sdio: Libertas SDIO driver
> libertas_sdio: Copyright Pierre Ossman
> Starting Getty on tty1...
> Started Getty on tty1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ =A0OK =A0]
> libertas_sdio mmc1:0001:1: (unregistered net_device):
> 00:19:88:20:72:5c, fw 9.70.3p14, cap 0x00000303
> libertas_sdio mmc1:0001:1: wlan0: Marvell WLAN 802.11 adapter
>
> Any suggestions where to get further information on how to solve? Is
> it possible that the changed sequence causes adapter not yet started
> up when reading MAC / firmware info?
>
> Thanks in advance
>
Sorry for this - but any hints where I can start investigation?

Andreas


