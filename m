Received: from [62.250.3.53] (helo=relay.versatel.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1KwtZ2-0004uq-J8
	for openembedded-devel@openembedded.org; Mon, 03 Nov 2008 08:09:29 +0100
Received: from [62.58.160.127] (helo=hf-electronics.com)
	by relay.versatel.net with smtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1KwtDL-0005jd-6N
	for openembedded-devel@openembedded.org; Mon, 03 Nov 2008 07:47:03 +0100
Received: from <linux@hf-electronics.com> with PostMaster 4.3.2 (MPS);
	Mon, 03 Nov 2008 07:43:40 +100
From: "Henk Geraads" <linux@hf-electronics.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 3 Nov 2008 07:46:21 +0100
Message-ID: <NGBBLNEOGLJIIJKLFLPFMECBDKAA.linux@hf-electronics.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.6604 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Importance: Normal
Subject: Problems touchscreen on CM-X270
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
X-List-Received-Date: Mon, 03 Nov 2008 07:09:30 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I did enable the event debuging in the kernel, when i touch the touchs=
creen i've got:

system log:
	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 0, Value: 354
	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 1, Value: 479
	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 24, Value: 228
	<7>evbug.c: Event. Dev: <NULL>, Type: 0, Code: 0, Value: 0
	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 24, Value: 0
	<7>evbug.c: Event. Dev: <NULL>, Type: 0, Code: 0, Value: 0=20

Why is the device string <NULL>, in case of the mouse is the correct m=
ouse specified.

Part of the kernel bootmessages indicating that there is a touchscreen=
:
	input: Logitech USB-PS/2 Optical Mouse as /class/input/input0
	input: USB HID v1.10 Mouse [Logitech USB-PS/2 Optical Mouse] on usb-p=
xa27x-1
	usbcore: registered new interface driver usbhid
	drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
	Advanced Linux Sound Architecture Driver Version 1.0.14 (Fri Jul 20 0=
9:12:58 2007 UTC).
	pxa2xx_ac97_reset: cold reset timeout (GSR=3D0x0)
	input: UCB1400 touchscreen interface as /class/input/input1
	ALSA device list:
  #0: pxa2xx-ac97 (Philips UCB1400)

Thanks for any remarks!

Best regards,

Henk




