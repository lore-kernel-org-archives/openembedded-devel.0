Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q6l4q-0001hZ-LT
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:48:24 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q6l2r-0006c8-0Q from Tom_Rini@mentor.com ;
	Mon, 04 Apr 2011 07:46:21 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 4 Apr 2011 07:44:22 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 4 Apr 2011 07:46:20 -0700
Message-ID: <4D99D9B6.8090108@mentor.com>
Date: Mon, 4 Apr 2011 07:46:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Mickael Chazaux <mickael.chazaux@gmail.com>
References: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>	<4D657F34.5050200@mentor.com>
	<BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
In-Reply-To: <BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 04 Apr 2011 14:44:22.0912 (UTC)
	FILETIME=[C9955000:01CBF2D6]
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 04 Apr 2011 14:48:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 04/04/2011 04:21 AM, Mickael Chazaux wrote:
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

See classes/syslinux.bbclass for how we handle doing syslinux today.
Something similar should be doable for extlinux if you can't use syslinux.

-- 
Tom Rini
Mentor Graphics Corporation


