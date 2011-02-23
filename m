Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PsMUq-0002Ak-ON
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 22:43:44 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PsMTY-0004GJ-Rt from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:42:24 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 23 Feb 2011 13:42:24 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 23 Feb 2011 14:42:23 -0700
Message-ID: <4D657F34.5050200@mentor.com>
Date: Wed, 23 Feb 2011 14:42:12 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>
In-Reply-To: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>
X-OriginalArrivalTime: 23 Feb 2011 21:42:23.0679 (UTC)
	FILETIME=[8E5CA4F0:01CBD3A2]
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
X-List-Received-Date: Wed, 23 Feb 2011 21:43:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/2011 05:48 AM, Mickael Chazaux wrote:
> Hi,
>
> I see there is a vmware.conf in conf/machine, but it does not generate
> vmdk (vmware virtual disk files) files. Here are the steps I take to
> do that:
>
> - create an empty file the size wanted (with dd),
> - format it to ext3 (mkfs.ext3 myfile)
> - mount it loopback (mount -o loop myfile /mnt)
> - untar the OE-generated rootfs in /mnt
> - create a /boot/extlinux.conf [1],
> - install extlinux in /boot (extlinux -i /mnt/boot)
> - umount,
> - convert to vmdk (using qemu-img -O vmdk myfile myfile.vmdk)
> - boot it in vmware.
>
> Is it possible to add a "vmdk" image to openembedded to do this automatically?

Yes, patches would be welcome.  This would reside in conf/bitbake.conf. 
  See the ubi/ubifs image examples for how to generate slightly complex 
images like this.  And I would recommend adding vmdk.ext[234] as the 
image names (and supply at least one of them, someone else might step up 
and do the regex for the others if you don't).  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


