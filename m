Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q6kJA-0005I0-4b for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 15:59:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q6kHB-0005Uw-9P for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 15:57:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 15:57:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 15:57:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 04 Apr 2011 15:56:50 +0200
Message-ID: <incin3$3vi$1@dough.gmane.org>
References: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>	<4D657F34.5050200@mentor.com>
	<BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: VMware disk image type
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
X-List-Received-Date: Mon, 04 Apr 2011 13:59:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-04-11 13:21, Mickael Chazaux wrote:
> Hi,
> 
> 2011/2/23 Tom Rini <tom_rini@mentor.com>:
>> On 02/23/2011 05:48 AM, Mickael Chazaux wrote:
>>>
>>> Hi,
>>>
>>> I see there is a vmware.conf in conf/machine, but it does not generate
>>> vmdk (vmware virtual disk files) files. Here are the steps I take to
>>> do that:
>>>
>>> - create an empty file the size wanted (with dd),
>>> - format it to ext3 (mkfs.ext3 myfile)
>>> - mount it loopback (mount -o loop myfile /mnt)
>>> - untar the OE-generated rootfs in /mnt
>>> - create a /boot/extlinux.conf [1],
>>> - install extlinux in /boot (extlinux -i /mnt/boot)
>>> - umount,
>>> - convert to vmdk (using qemu-img -O vmdk myfile myfile.vmdk)
>>> - boot it in vmware.
>>>
>>> Is it possible to add a "vmdk" image to openembedded to do this
>>> automatically?
>>
>> Yes, patches would be welcome.  This would reside in conf/bitbake.conf.  See
>> the ubi/ubifs image examples for how to generate slightly complex images
>> like this.  And I would recommend adding vmdk.ext[234] as the image names
>> (and supply at least one of them, someone else might step up and do the
>> regex for the others if you don't).  Thanks!
>>
> 
> The problem is the loopback mount, which requires root privileges, and
> is required by extlinux for its installation. Is there another method?

If your user is in the 'disk' group it should also work. Narcissus runs
as 'www-data' and generated OMAP SD images with loopmounts, adding
'www-data' to 'disks' fixed the weird problems we were seeing (vfat loop
mounts worked, ext3 didn't0.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNmc4iMkyGM64RGpERAuygAKCk1FXClMR8xQZU99Cu7d4ZIVsXhgCeP89h
XQPhqxENu/aE+9LsE9g1R88=
=J9PL
-----END PGP SIGNATURE-----



