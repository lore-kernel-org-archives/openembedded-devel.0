Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1NWbIj-0003Cf-6o
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 21:00:48 +0100
Received: by fxm4 with SMTP id 4so266397fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 11:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=3NLmlwd8CucrHEEIhJWPrR/HaboiG6jQZUnZgH0pjV0=;
	b=HOJCPwKb+zPHMySGaTNchWk7mr90WXrEcwm49Q6+Ff0aygNDPmfgPkr6nuD+ATwezF
	V7OpsIjd64nHEDwXkzqYcBwJ/KRvSy/WeulYF7VZiKU/EwsTlZRPBAQgO0vRI9perJrV
	a5E66BhxtySh9QyhLtNoOPyUPFYCRII5LAmZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=rtbB9z59oC/EqaidbstONmGW7yPrwfv5synw9xOylWJ+4BqLeD8dtzJdnyy4KtaD0j
	YlnAWs2IhtMnAIBNkKO2wz5Ys3HuG/YOISogRi9dJSzGJ4TWCJkN4Q5fHgUdvjIvfyzh
	y0cAMOqPrIVId4sm08Emr9PtYuub7/bZlFLJE=
Received: by 10.223.3.81 with SMTP id 17mr6209688fam.102.1263758311488;
	Sun, 17 Jan 2010 11:58:31 -0800 (PST)
Received: from is.home (95-29-176-93.broadband.corbina.ru [95.29.176.93])
	by mx.google.com with ESMTPS id 13sm1839726fxm.9.2010.01.17.11.58.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 11:58:30 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 22:58:25 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.30-std-def-alt15; KDE/4.3.4; i686; ; )
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172013.06010.marcin@juszkiewicz.com.pl>
In-Reply-To: <201001172013.06010.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <201001172258.25258.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: jay4mail@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and 	tosa
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
X-List-Received-Date: Sun, 17 Jan 2010 20:00:48 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello!
> Dnia niedziela, 17 stycznia 2010 o 15:06:19 Andrea Adami napisa=C5=82(a):
> > Reading the post about gnu-tar I remember we talked about a new way to
> > install 2.6 kernels and images on Zaurus.
>=20
> Any way is good but I hope that there still be a way to install OE build
> results on SharpROM based Zaurus.

You can boot old 2.4 based ROM's with kexecboot too. I have reports of=20
success booting of Cacko e.g.

> What about this (note that I do not track kexecboot work):
>=20
> - make updater.sh which will flash kexecboot kernel and reboot
> - let kexecboot initramfs checks for CARD/sysupdate.sh
> - CARD/sysupdate.sh will update rootfs/kernel etc and reboot
>=20
> sysupdate.sh name is chosen to allow updater.sh (for crappy bootloader)
>  and real update script to be on same card. This way you can update any
>  Zaurus nevermind what kind of OS it had before. And as kexecboot kernel
>  will have our nand split table inside anything can be done in
>  sysupdate.sh script (formating / and /home for example or installing
>  them from card images etc).

We should not update kernel while using kexecboot. We can only update distr=
o=20
(rootfs with kernel inside) in NAND.
I'm not sure that we have too much ordinary users who will flash to NAND=20
instead of external SD/CF. Advanced user can boot from console-image from S=
D=20
and 'flash' by hands according to some README/wiki instructions. Or we can=
=20
provide special NAND-installer image for this.

But anyway having something like legacy-updater.bb is good idea.

=2D-=20
Yuri Bushmelev


