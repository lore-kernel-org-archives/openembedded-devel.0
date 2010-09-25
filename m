Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzPvs-0008Fr-GC
	for openembedded-devel@openembedded.org; Sat, 25 Sep 2010 10:16:33 +0200
Received: by iwn2 with SMTP id 2so1245492iwn.6
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Sep 2010 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=UocQkCWQlKhggbe8u+sB+krrpIrfmrBcwaE6DUUlU8c=;
	b=tWxA6L16s8jCCwK7xfjb3CXfHoHy3IgsphhrOJ1rt7Mvt1qy1xq3tkykyva+wnwli/
	WHXEs9CjlgEk2jP6aMuG39Asy0XAvsk1O9FuOGD/xCV/zT9y3nxsWdBHe2fghEixQTpU
	xcnv+HuXK+AZJdrroflFzGqam3aHgrnLu6EPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=TCc/IHdKsxkO1uLXaZjjQs4lav9P+p2fqzv1RvMs8xRYs9XNAZTQLN1Lnkaigvxa7E
	GdYkXl683P8kNH7cwrR42DqvoSXLjXHhrjlse2o6fOWAtqOZkuUG/otsh8W7YKnOeAiU
	Bu7vjcpA5Mp4ctUrz4U1Y+Hj+0INrwt9UnWpE=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr5120044ibc.161.1285402585749; Sat,
	25 Sep 2010 01:16:25 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 25 Sep 2010 01:16:25 -0700 (PDT)
Date: Sat, 25 Sep 2010 10:16:25 +0200
Message-ID: <AANLkTim1GZhGNW75b3Cz7TksjO7WfjpA31DKKFmPxN7M@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RDEPENDS -> RRECOMMENDS
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
X-List-Received-Date: Sat, 25 Sep 2010 08:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

As kernel functionality can be compiled into the kernel or be a
separate module, in general one cannot assume that it is there.
Afaik this is a case where one would have to use RRECOMMENDS i.s.o. RDEPENDS

I did a quick grep on who RDEPENDS on a kernel modlue and got the list below.
Now for the kernel things people might say that the defconfig goes
with the kernel and there you know whether the module is there or not,
but for the others you do not know.
Suggested fix is to go to RRECOMMENDS. Is that correct?

Frans

batmand/batmand.inc:RDEPENDS_${PN} = "kernel-module-tun"
cfu1/cfu1-modules_2.6.bb:RDEPENDS_${PN} = "kernel-module-usbcore"
chillispot/chillispot_1.0RC3.bb:RDEPENDS_${PN} = "kernel-module-tun"
davfs2/davfs2_0.2.7.bb:RDEPENDS_${PN} = "kernel-module-coda"
davfs2/davfs2_0.2.8.bb:RDEPENDS_${PN} = "kernel-module-coda"
eciadsl/eciadsl_0.11.bb:RDEPENDS_${PN} = "bash kernel-module-n_hdlc ppp grep"
exmap-console/exmap-console.inc:RDEPENDS_exmap-console += "kernel-module-exmap"
exmap-console/exmap-console.inc:RDEPENDS_exmap-server += "kernel-module-exmap"
linux/handhelds-pxa_2.4.19-rmk6-pxa1-hh42.bb:RDEPENDS_kernel-module-h5400-audio
= "kernel-module-ak4535 kernel-module-i2c-adap-pxa"
linux/handhelds-pxa_2.4.19-rmk6-pxa1-hh42.bb:RDEPENDS_kernel-module-h3900-uda1380
= "kernel-module-uda1380 kernel-module-i2c-adap-pxa"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-sound =
"kernel-module-soundcore kernel-module-snd kernel-module-snd-timer
kernel-module-snd-pxa2xx-pcm kernel-module-snd-pxa2xx-ac97
kernel-module-snd-pcm kernel-module-snd-pcm-oss
kernel-module-snd-page-alloc kernel-module-snd-mixer-oss
kernel-module-snd-ac97-codec kernel-module-snd-ac97-bus"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-bluetooth =
"kernel-module-bluetooth kernel-module-bnep
kernel-module-gumstix-bluetooth kernel-module-hci-uart
kernel-module-l2cap kernel-module-sco kernel-module-rfcomm"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-pcmcia =
"kernel-module-pcmcia-core kernel-module-pcmcia
kernel-module-pxa2xx-core kernel-module-pxa2xx-cs "
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-ide =
"kernel-modules-pcmcia kernel-module-ide-core kernel-module-ide-cs
kernel-module-ide-disk kernel-module-ide-generic
kernel-module-firmware-class"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-ethernet =
"kernel-module-mii kernel-module-smc91x kernel-module-gumstix-smc91x"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-wireless =
"kernel-module-ieee80211 kernel-module-ieee80211-crypt
kernel-module-ieee80211-crypt-wep kernel-modules-pcmcia
kernel-module-hermes kernel-module-hostap-cs kernel-module-hostap
kernel-module-orinoco kernel-module-orinoco-cs
kernel-module-spectrum-cs"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-usb =
"kernel-module-gumstix-gadget kernel-module-g-ether
kernel-module-pxa2xx-udc "
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-mmc =
"kernel-module-mmc-core kernel-module-mmc-block kernel-module-pxamci"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-fat =
"kernel-module-vfat kernel-module-nls-base kernel-module-fat
kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
linux/linux-gumstix_2.6.15.bb:RDEPENDS_kernel-modules-nfs =
"kernel-module-nfs kernel-module-sunrpc kernel-module-lockd"
nylon/simple-firewall.bb:RDEPENDS_${PN} = "kernel-module-ipt-limit
kernel-module-ipt-tcpmss"
openvpn/openvpn.inc:RDEPENDS_${PN} = "kernel-module-tun"
shorewall/shorewall_2.0.9-monolithic.bb:RDEPENDS_${PN} = "iptables
kernel-module-ipt-multiport kernel-module-ipt-mac
kernel-module-ipt-mark kernel-module-ipt-pkttype
kernel-module-ipt-tos"
snes9x/snes9x_1.43-WIP1.bb:RDEPENDS_epia = "kernel-module-joydev"
vpnc/vpnc.inc:RDEPENDS_${PN} = "kernel-module-tun"


