Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4JUY-0002Hp-3z
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2012 23:01:22 +0100
Received: by lagw12 with SMTP id w12so4087427lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2012 13:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.48.200 as permitted sender)
	client-ip=10.112.48.200; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.48.200 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.48.200])
	by 10.112.48.200 with SMTP id o8mr8541159lbn.54.1330897968413 (num_hops
	= 1); Sun, 04 Mar 2012 13:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=mJQCIYgQkUAb5dLv7LgnHR1W5xwIZBPI2JrxNlwhcSo=;
	b=TJo9+VNhHzQnGH9HNL5lPi0AQoq2JWYhRft8LUtDJmUQ/whbeJiFgizZnu57DiRCgq
	6cPqSUhuJi89kJUgZb76RWo6XMTkqmjFwlmdDCAAFbJAHJZqDyyb5hTv7b//7+qfZjyK
	6llXyuJNJqh0RliHhNIbDWJ7n0GKWyjMtO82tC4FJeSbjwQkGeIDqrduH3woDSutjvS1
	B8gT5vTkOmp/GqGcBPKAHjBLjKBNzhc3s9mFstiBE6gJ4wy3zmGSffvS72fMvrwWIdYB
	zWcBNqc9a61H4y5pgIV+0bPCxd4/S1etcAHLwdTwIJ1qFbqU5rLOTBtYwN4WgcUhGhFM
	kuDw==
MIME-Version: 1.0
Received: by 10.112.48.200 with SMTP id o8mr7014338lbn.54.1330897968283; Sun,
	04 Mar 2012 13:52:48 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Sun, 4 Mar 2012 13:52:48 -0800 (PST)
Date: Sun, 4 Mar 2012 22:52:48 +0100
Message-ID: <CALbNGRR-jB0_h6u-g6KswZAQkfwUVmK4V=U_OL=GbLF3UWB1gw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: libertas seems broken since udev 180
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
X-List-Received-Date: Sun, 04 Mar 2012 22:01:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

this problem I face since a while but didn't find the time to take
care. Since udev 180 overo's wlan does not work (marvel) and  I get:

at early user space:
udevd[77]: starting version 181
Starting POSIX Message Queue File System...
Started Configuration File System                                      [  OK  ]
Started Security File System                                           [  OK  ]
Started FUSE Control File System                                       [  OK  ]
Started udev Kernel Device Manager                                     [  OK  ]
Started Lock Directory                                                 [  OK  ]
Started Runtime Directory                                              [  OK  ]
Started Media Directory                                                [  OK  ]
Started Remount API VFS                                                [  OK  ]
Started Apply Kernel Variables                                         [  OK  ]
Started Debug File System                                              [  OK  ]
Started File System Check on Root Device                               [  OK  ]
Started POSIX Message Queue File System                                [  OK  ]
Starting Remount Root FS...
Started udev Coldplug all Devices                                      [  OK  ]
_regulator_get: spi1.0 supply vcc not found, using dummy regulator
ads7846 spi1.0: touchscreen, irq 274
ads7846 spi1.0: no device detected, test read result was 0x00000000
cfg80211: Calling CRDA to update world regulatory domain
Started Remount Root FS                                                [  OK  ]
libertas_sdio: Libertas SDIO driver
libertas_sdio: Copyright Pierre Ossman

Right after login prompt:
libertas_sdio mmc1:0001:1: (unregistered net_device):
ff:ff:ff:ff:ff:ff, fw 0.0.0p0, cap 0x00000000
libertas_sdio mmc1:0001:1: (unregistered net_device): unidentified
region code; using the default (USA)
libertas_sdio mmc1:0001:1: wlan0: Marvell WLAN 802.11 adapter

and cyclic ~every 3s

libertas_sdio mmc1:0001:1: wlan0: command 0x0000 timed out
libertas_sdio mmc1:0001:1: wlan0: Timeout submitting command 0x0000



With udev 175 wlan is working properly and I get after boot prompt
(please ignore 'Network Manager Wait Online'-lines. This is for test
and it looks same with unmodified networkmanager):

Angstrom v2012.03-core - Kernel 3.0.17+

overo login: cfg80211: Calling CRDA to update world regulatory domain
Started Network Manager                                                [  OK  ]
Starting Network Manager Wait Online...
Failed to start Network Manager Wait Online                            [FAILED]
See 'systemctl status NetworkManager-wait-online.service' for details.
Starting Network Time Service...
smsc911x smsc911x.0: eth0: SMSC911x/921x identified at 0xd0808000, IRQ: 336
Started Network Time Service                                           [  OK  ]
libertas_sdio: Libertas SDIO driver
libertas_sdio: Copyright Pierre Ossman
Starting Getty on tty1...
Started Getty on tty1                                                  [  OK  ]
libertas_sdio mmc1:0001:1: (unregistered net_device):
00:19:88:20:72:5c, fw 9.70.3p14, cap 0x00000303
libertas_sdio mmc1:0001:1: wlan0: Marvell WLAN 802.11 adapter

Any suggestions where to get further information on how to solve? Is
it possible that the changed sequence causes adapter not yet started
up when reading MAC / firmware info?

Thanks in advance

Andreas


