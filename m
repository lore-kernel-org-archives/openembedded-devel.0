Received: from p3plsmtpa06-08.prod.phx3.secureserver.net ([173.201.192.109])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Q6kMp-0008Gq-Oa
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:03:02 +0200
Received: (qmail 4254 invoked from network); 4 Apr 2011 14:00:40 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa06-08.prod.phx3.secureserver.net (173.201.192.109) with
	ESMTP; 04 Apr 2011 14:00:40 -0000
Message-ID: <4D99CF0C.5020406@mwester.net>
Date: Mon, 04 Apr 2011 09:00:44 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>	<4D657F34.5050200@mentor.com>
	<BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
In-Reply-To: <BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Apr 2011 14:03:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/2011 6:21 AM, Mickael Chazaux wrote:
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

Can't you just copy or otherwise re-use the existing code for creating
ext3 images?   (I think that uses fakeroot to do the job, which avoids
loopback mounts and all the potential problems that involves.)

-Mike (mwester)


