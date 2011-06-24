Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qa8aq-0002ss-Nq for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 17:46:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qa8XL-000762-Ui for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 17:43:15 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 17:43:15 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 17:43:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 Jun 2011 17:43:04 +0200
Message-ID: <iu2ba8$u05$1@dough.gmane.org>
References: <201106202316.47662.schnitzeltony@gmx.de>	<201106240052.59211.schnitzeltony@gmx.de>	<iu1c11$48f$1@dough.gmane.org>
	<201106241649.52323.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <201106241649.52323.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
Subject: Re: udev 171 caching working propely?
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
X-List-Received-Date: Fri, 24 Jun 2011 15:46:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-06-11 16:49, Andreas Mueller wrote:
> On Friday, June 24, 2011 08:49:00 AM Koen Kooi wrote:
>> On 24-06-11 00:52, Andreas Mueller wrote:
>>> On Thursday, June 23, 2011 11:58:53 PM Koen Kooi wrote:
>>>> On 23-06-11 22:58, Andreas Mueller wrote:
>>>>> On Tuesday, June 21, 2011 11:31:45 PM Tom Rini wrote:
>>>>>> On 06/20/2011 03:47 PM, Tom Rini wrote:
>>>>>>> On 06/20/2011 02:16 PM, Andreas Mueller wrote:
>>>>>>>> Dear OE-folks,
>>>>>>>>
>>>>>>>> Working with lastest classic oe master and angstrom it seems udev
>>>>>>>> caching is not
>>>>>>>>
>>>>>>>> working as expected. On *every* boot I get:
>>>>>>>>> Remounting root file system...
>>>>>>>>> Caching udev devnodes
>>>>>>>>> Populating dev cachemv: can't rename '/dev/shm/uname': No such file
>>>>>>>>> or directory
>>>>>>>>
>>>>>>>> I don't know why this change came in but there was a change of
>>>>>>>> storage location in Tom's commit few days ago [1]. To me it seems
>>>>>>>> that
>>>>>>>>
>>>>>>>> 1. The files created by udev (init) get lost at remount so
>>>>>>>> udev-cache (cache) is unable to find
>>>>>>>> 2. Since this error occures not only at first boot the recipe's
>>>>>>>> pkg_postinst_udev_append() seems never being executed. To check I
>>>>>>>> added a simple echo 'foo text'
>>>>>>>> in this function but 'foo text' is not found in log of first boot.
>>>>>>>>
>>>>>>>> Suggestions welcome
>>>>>>>
>>>>>>> Did udev change behaviors at some point then?  I've been using an
>>>>>>> older udev and didn't run into that problem.  I changed from /tmp to
>>>>>>> /dev/shm since we don't know that /tmp is writable at that point so
>>>>>>> we were instead getting errors there.  I wonder if we should just
>>>>>>> switch to re-creating the contents for that step?
>>>>>>
>>>>>> I've gone with this change and some quick testing on a board.
>>>>>
>>>>> Hi Tom,
>>>>>
>>>>> thanks for taking care and sorry for late response - yesterday I had
>>>>> one of these nightmares at the job...
>>>>>
>>>>> Now I tested the patch for two machines and sorry I am afraid to waste
>>>>> your time again:
>>>>>
>>>>> First machine is overo with linux-omap-psp-2.6.32 and a hub connected
>>>>> to the OTG connector. The kernel detects USB devices at a very early
>>>>> boot state long before udev starts (see end of file 'overo' attached).
>>>>> udev caching seems to work without errors.
>>>>>
>>>>> Second machine is tx28 with linux-2.6.38.5 (freescale imx28 based - I
>>>>> will send patches when stable). This shows different behaviours on
>>>>> first and all further boots (see udev-*boot attached). Problem is that
>>>>> after second boot nothing connected to USB is detected / working. By
>>>>> deleting /etc/udev/saved.* and rebooting all USB devices work fine and
>>>>> log looks similar as first boot.
>>>>>
>>>>> Before I merged your patch I know the USB devices were working properly
>>>>> on tx28. Don't misunderstand me: I think before your patch cache was
>>>>> never read. Now you fixed this and it seems reading the cache does not
>>>>> work (on my half cooked machine only?).
>>>>>
>>>>> I will have further investigations on this...
>>>>
>>>> With 171 you shouldn't need caching anymore, triggering has been sped up
>>>> considerably, could you try disable caching and see how much it impacts
>>>> your boot time?
>>>
>>> Uncached feels slower. Populating all devices takes 5-10s. Is there a
>>> simple way to create time stamps for boot messages?
>>
>> Another test would be to unload the kernel modules and do:
>>
>> killall udevd ; time ( udevadm trigger ; udevadm settle )
>>
>> That takes about 1s on my beagleboard and 3.5s on my hawkboard.
>>
>> Systemd keeps a track of it, have a look at the bright red portions of
>> the graphs:
>>
>> http://dominion.thruhere.net/koen/angstrom/systemd/beagleboardC5-ubi-201106
>> 171148.svg http://dominion.thruhere.net/koen/angstrom/systemd/hawkboard.svg
>>
>> I my case the caching wasn't needed, but if it starts taking >4s on
>> 'slow' systems and >2s on 'fast' systems it is worth considering.
>>
> News from udev-journey: 
> 
> I did modify the udev-init script so that I could see that  
> 
> | udevadm trigger ; udevadm settle 
> 
> lasted for ~10s!
> 
> That made me think (usually that is not my domain..); Why is my board so slow 
> and why refuses udev to work proper for it? Checking all written I fell over 
> udev msg in one of my previous mails
> 
> | insmod /lib/modules/2.6.38.5/kernel/drivers/usb/host/ehci-hcd.ko
> 
> So I decided to change in kernel-config
> -CONFIG_USB_HID=m
> +CONFIG_USB_HID=y
> 
> -CONFIG_USB_EHCI_HCD=m
> +CONFIG_USB_EHCI_HCD=y
> 
> This make the tx28 board now working very similar to my overo board: USB devices 
> are detected at a very early state of boot and udev is much faster now and USB 
> is working as expected. Also hotplugging seems to work.

It does make the kernel boot ±1.5s slower, but that will still give you
a big win in userspace.

> I would say it's 
> partytime but still there is
> 
> | udevd[588]: error: runtime directory '/run/udev' not writable, for now falling 
> back to '/dev/.udev'
> | <30>udevd[589]: starting version 171

We don't support /run in oe.dev yet, the oe-core version of angstrom
does since it's required for systemd support.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOBLCIMkyGM64RGpERAlYQAJ0fbU+ruFljsfkXcB2x2Uki+T4yzgCgroEa
tDe2l4nnMZAyp+Ag7tQKcEQ=
=w2Xr
-----END PGP SIGNATURE-----



