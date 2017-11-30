Return-Path: <gabriel.pickl@posteo.net>
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id 585D678258
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 16:34:08 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 0E84021063
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 17:34:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1512059649; bh=q1A+IaH+/a3CpaC9IUmCM7+ZyDT9WpWboNtO6qiV10s=;
	h=From:Subject:Date:To:From;
	b=GLmRTUvq6Fl2IJ5ufMJrlUdTz7XbY1lUnCtsP+1gcl+x/Yq6u7q6oPOhzTpcS4WDN
	mJQ5acCZsBzq+brbZ8u6rJBflQUDixUWbc2C/hnC2K1mcsGF5MaGJrP49bKDodaciT
	O7FvZOELCz9KiO+mUn2pIjT4AZxMVdmVgQU8XW1JvOGYJxP3dcGcTNLipEKEUYmHM9
	2B8i37lA7iGeoxSJQKThkPaB04LOIlK1ySkvLizL72icbzRX341/f7lJlMaD/gCOyY
	h6yrdhllFYno59HpbJCBw/lnS7Pxt8TfS/t4MB+Jknc/s2LjM/OvaFWaVZBn5mxy6j
	Bjt5iSEiSfNWg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 3ynjf820G1z9rxD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 17:34:08 +0100 (CET)
From: Gabriel Pickl <gabriel.pickl@posteo.net>
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
Message-Id: <569AF590-BC14-451F-873E-84622993D7D1@posteo.net>
Date: Thu, 30 Nov 2017 17:34:07 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.4.7)
Subject: [meta-openembedded] Samba update-rc.d does fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 16:34:08 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I=E2=80=99ve run into a problem using the samba recipe in =
meta-networking.
The recipe installs fine, but it is not set to autostart when I boot the =
system on my machine.

The reason: the `updatercd_postinst` call to update-rc.d fails with:

```
update-rc.d: =
<builddir>/tmp/work/raspberrypi-poky-linux-gnueabi/rpi-netbios-image/1.0-r=
0/rootfs/etc/init.d/samba.sh: file does not exist
```

I=E2=80=99ve dug a bit into the script and it seems like the samba.sh =
script really does not exist at the time `updatercd_postinst` is run, =
but does exist in the same directory after the build has completed.

This means for some reason the file gets copied to the rootfs too late, =
but I can=E2=80=99t figure out why. Does anyone have any ideas why this =
could be?

System data:
branch: morty
commit: b40116cf457b88a2db14b86fda9627fb34d56ae6
machine: raspberrypi
init system: sysv

Greetings,

Gabriel

PS: I apologize if this mail arrives more than once, I had some trouble =
subscribing to the mailing list first.=

