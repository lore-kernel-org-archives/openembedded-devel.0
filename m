Received: from [67.43.13.2] (helo=oceanus.site5.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1Kx0uj-00056D-B3
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Nov 2008 16:00:21 +0100
Received: from [192.114.83.142] (helo=mail.linux-boards.com)
	by oceanus.site5.com with esmtpsa (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.69) (envelope-from <mike@compulab.co.il>)
	id 1Kx0So-0002C9-FP; Mon, 03 Nov 2008 09:31:31 -0500
Received: from [10.1.1.95] (mike-pc.compulab.local [10.1.1.95])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id mA3EVOFM003323; 
	Mon, 3 Nov 2008 16:31:24 +0200
Message-ID: <490F0B3D.4040003@compulab.co.il>
Date: Mon, 03 Nov 2008 16:31:25 +0200
From: Mike Rapoport <mike@compulab.co.il>
User-Agent: Thunderbird 2.0.0.16 (X11/20080907)
MIME-Version: 1.0
To: Henk Geraads <linux@hf-electronics.com>
References: <NGBBLNEOGLJIIJKLFLPFMECBDKAA.linux@hf-electronics.com>
In-Reply-To: <NGBBLNEOGLJIIJKLFLPFMECBDKAA.linux@hf-electronics.com>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - oceanus.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Problems touchscreen on CM-X270
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
X-List-Received-Date: Mon, 03 Nov 2008 15:00:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Henk Geraads wrote:
> Hi,
> 
> I did enable the event debuging in the kernel, when i touch the touchscreen i've got:
> 
> system log:
> 	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 0, Value: 354
> 	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 1, Value: 479
> 	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 24, Value: 228
> 	<7>evbug.c: Event. Dev: <NULL>, Type: 0, Code: 0, Value: 0
> 	<7>evbug.c: Event. Dev: <NULL>, Type: 3, Code: 24, Value: 0
> 	<7>evbug.c: Event. Dev: <NULL>, Type: 0, Code: 0, Value: 0 
> 
> Why is the device string <NULL>, in case of the mouse is the correct mouse specified.

The UCB1400 driver does not set dev->phys, so that's why you see <NULL> in evbug
reports.
Try "hexdump /dev/input/eventX" and touch the touchscreen

> Part of the kernel bootmessages indicating that there is a touchscreen:
> 	input: Logitech USB-PS/2 Optical Mouse as /class/input/input0
> 	input: USB HID v1.10 Mouse [Logitech USB-PS/2 Optical Mouse] on usb-pxa27x-1
> 	usbcore: registered new interface driver usbhid
> 	drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
> 	Advanced Linux Sound Architecture Driver Version 1.0.14 (Fri Jul 20 09:12:58 2007 UTC).
> 	pxa2xx_ac97_reset: cold reset timeout (GSR=0x0)
> 	input: UCB1400 touchscreen interface as /class/input/input1
> 	ALSA device list:
>   #0: pxa2xx-ac97 (Philips UCB1400)
> 
> Thanks for any remarks!
> 
> Best regards,
> 
> Henk
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Sincerely yours,
Mike.



