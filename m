Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q6kTS-0002yL-Ns
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:09:46 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q6kRU-0006Yu-Aw
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:07:44 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
References: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>
	<4D657F34.5050200@mentor.com>
	<BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
Date: Mon, 04 Apr 2011 15:07:41 +0100
Message-ID: <1301926061.14449.273.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Mon, 04 Apr 2011 14:09:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-04 at 13:21 +0200, Mickael Chazaux wrote:
> Hi,
> 
> 2011/2/23 Tom Rini <tom_rini@mentor.com>:
> > On 02/23/2011 05:48 AM, Mickael Chazaux wrote:
> >>
> >> Hi,
> >>
> >> I see there is a vmware.conf in conf/machine, but it does not generate
> >> vmdk (vmware virtual disk files) files. Here are the steps I take to
> >> do that:
> >>
> >> - create an empty file the size wanted (with dd),
> >> - format it to ext3 (mkfs.ext3 myfile)
> >> - mount it loopback (mount -o loop myfile /mnt)
> >> - untar the OE-generated rootfs in /mnt
> >> - create a /boot/extlinux.conf [1],
> >> - install extlinux in /boot (extlinux -i /mnt/boot)
> >> - umount,
> >> - convert to vmdk (using qemu-img -O vmdk myfile myfile.vmdk)
> >> - boot it in vmware.
> >>
> >> Is it possible to add a "vmdk" image to openembedded to do this
> >> automatically?
> >
> > Yes, patches would be welcome.  This would reside in conf/bitbake.conf.  See
> > the ubi/ubifs image examples for how to generate slightly complex images
> > like this.  And I would recommend adding vmdk.ext[234] as the image names
> > (and supply at least one of them, someone else might step up and do the
> > regex for the others if you don't).  Thanks!
> >
> 
> The problem is the loopback mount, which requires root privileges, and
> is required by extlinux for its installation. Is there another method?

You could avoid the loopback mount for the first steps by using
genext2fs to create the image and then tune2fs to add a journal inode.
But I can't think of any way to avoid the need for loopback when
installing extlinux (apart, obviously, from patching either extlinux
itself or fakeroot).

p.




