Received: from [64.62.194.115] (helo=netgate.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jim@netgate.com>) id 1HHV16-00011O-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Feb 2007 02:02:33 +0100
Received: from [192.168.2.198] (rrcs-67-52-77-54.west.biz.rr.com [67.52.77.54])
	by netgate.com (Postfix) with ESMTP id A4A0C28006B;
	Wed, 14 Feb 2007 17:02:20 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <1171495037.11033.19.camel@localhost.localdomain>
References: <1171051575.3886.12.camel@localhost.localdomain>
	<200702141311.17165.openembedded@hrw.one.pl>
	<1171489223.1692.501.camel@localhost.localdomain>
	<1171489873.11033.7.camel@localhost.localdomain>
	<45D38BB9.5070709@am.sony.com>
	<96763D62-00DF-440D-8688-E237E1CE0BB8@netgate.com>
	<45D38F2C.1030700@dominion.kabel.utwente.nl>
	<6385CB83-3092-471F-B579-BDD8A2A65133@netgate.com>
	<1171495037.11033.19.camel@localhost.localdomain>
Message-Id: <8E81BB23-A4F0-46A9-81B5-BD79290019FD@netgate.com>
From: Jim Thompson <jim@netgate.com>
Date: Wed, 14 Feb 2007 15:02:04 -1000
To: openembedded-devel@lists.openembedded.org,
	gerwin van der kruis <gerwin@vanderkruis.net>
X-Mailer: Apple Mail (2.752.3)
Subject: Re: OE Booth during fosdem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2007 01:02:33 -0000
X-Groupsio-MsgNum: 1389
Content-Type: multipart/mixed; boundary=Apple-Mail-13--79403804

--Apple-Mail-13--79403804
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed


On Feb 14, 2007, at 1:17 PM, gerwin van der kruis wrote:

> Op woensdag 14-02-2007 om 12:53 uur [tijdzone -1000], schreef Jim
> Thompson:
>
>> And I'm willing to throw cash, hardware and time at this.
>>
>> Yes, we sell WRAP boards, but I'm not looking to get a bunch-o-free
>> development out of the process.  (We sell a Gateworks ixp42x board
>> too, just to be perfectly honest.)
>>
>> Years ago, I ran (and owned) 'musenki' (google for it or look here:
>> http://he-colo.netgate.com/~jim/Musenki/.  We had build a  set of
>> Motorola 8245/8241 boards, and I'd made linux run on them.  I
>> remember spending a horrific amount of time with a (very) early
>> version of "buildroot".  OE is so much more sophisticated that I'm a
>> bit taken aback.
>>
>> The OE learning curve is still quite steep, but I think it would be
>> less steep with a) a bit more documentation and b) an EZ way to start
>> creating "little distros" that
>> run on PCs using it.
>
> I remember we had this discussion before , the problem is the
> bootloader, for example grub requires some extra handlings to get
> installed probarly.

There appears to be a decent start on "here are the set of steps"  
here: http://kbarr.net/bochs

(I've only recently discovered this.)

> I also experimented a bit with disk on modules which were much
> faster than the compact flash and much cheaper as well.

Its hard to beat $9 (what we pay for 128MB CF), but if you know of a  
source, I'm all ears.

> I think if you write a script which automate the installation of for
> example grub and than copies automatically the files over to cf you  
> are
> finished , I did it once long time ago for an embedded voip pabx.

I once made 'lilo' work with a buildroot-based system.  The makefile  
is attached.

I never could get 'grub' to do the same thing, though I prefer grub  
to lilo.

> As Koen said I am working on x86 projects like wifi-radio (with a
> mini-itx board and some small additions) a set top box and a thin
> client.So we are working on it !!

Is the wifi-radio tree available anywhere?

> I will have a look if I still can find the software I made that time
> for putting the image directly on the flash (I wrote it to produce  
> some
> goods)

thanks

Jim


--Apple-Mail-13--79403804
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name=cfimage.mk
Content-Disposition: attachment;
	filename=cfimage.mk

#############################################################
#
# Build the root filesystem image for/on compact flash
# with thanks to snapgear for inspiration
#
#############################################################

CFDIR=$(BUILD_DIR)/cfimage

# rebuild the ext2root image, then become root to finish up
cfimage-setup: $(IMAGE).ext2.gz
	mkdir -p $(CFDIR)
	@echo '********************************************************'
	@echo '********************************************************'
	@echo '********************************************************'
	@echo '** Time to make the final compact flash image.        **'
	@echo '** For this you need to be "root". You will also need **'
	@echo '** a kernel with the loopback device enabled and ext2 **'
	@echo '** filesystem support.  Enter the root password below **'
	@echo '** if asked,  or an invalid password to abort.        **'
	@echo '********************************************************'
	@echo '********************************************************'
	@echo '********************************************************'
	@echo ''
	su root -c "$(MAKE) cfimage-real" < /dev/tty > /dev/tty 2>&1

# the number of 512 byte blocks in config partition (4096 = 2Mb)
CONFIG     = 4960

# Make a lilo bootable compact flash image based on paramters passed in
.PHONY: extimage
extimage: lilo
	#create/zero out master boot record image
	dd if=/dev/zero of=$(CFDIR)/mbr.img bs=512 count=1
	#create a partition map in the image
	echo -e "1,`expr $(CYLS) \\* $(HEADS) \\* $(SECTORS) - $(CONFIG) - 1`,L,*\n,,,-" | \
		sfdisk -uS -C $(CYLS) -H $(HEADS) -S $(SECTORS) $(CFDIR)/mbr.img
	trap "cd $(CFDIR); umount $(CFDIR)/pre.mnt; umount $(CFDIR)/post.mnt; sleep 1; \
				rm -rf $(CFDIR)/pre.mnt $(CFDIR)/post.mnt" 0; 
	#create/zero out post.img image
	dd if=/dev/zero of=$(CFDIR)/post.img bs=512 \
			count=`expr $(CYLS) \\* $(HEADS) \\* $(SECTORS) - 1 - $(CONFIG)`
	#make post.img an ext2 filesystem, then an ext3 filesystem
	/sbin/mke2fs -F -m0 -v $(CFDIR)/post.img
	/sbin/tune2fs -i 0 -j $(CFDIR)/post.img
	#remove existing mounts
	rm -rf $(CFDIR)/pre.mnt $(CFDIR)/post.mnt
	#remake mount points
	mkdir $(CFDIR)/pre.mnt $(CFDIR)/post.mnt
	cp $(IMAGE).ext2.gz $(CFDIR)/
	gunzip -c $(CFDIR)/$(IMAGE_NAME).ext2.gz > $(CFDIR)/pre.img
	mount -t ext2 -o loop $(CFDIR)/pre.img $(CFDIR)/pre.mnt
	mount -t ext2 -o loop $(CFDIR)/post.img $(CFDIR)/post.mnt
	(cd $(CFDIR)/pre.mnt; tar cf - .) | (cd $(CFDIR)/post.mnt; tar xf -)
	mkdir -p $(CFDIR)/post.mnt/boot
	#do some setup for lilo (put kernel in image, add lilo.conf)
	cp -a $(LINUX_KERNEL) $(CFDIR)/post.mnt/boot/vmlinuz
	cp -a $(SOURCE_DIR)/$(SYSTEM_NAME)/lilo.conf $(CFDIR)/post.mnt/etc/lilo.conf
	echo "#Device Bios    Sectors Heads   Cyls    Start" > $(CFDIR)/disktab
	echo "0x70`mount|grep post.img|sed 's?.*loop=/dev/loop\([0-9]\).*$$?\1?'`	0x80	$(SECTORS)	$(HEADS)	$(CYLS) 1" >> $(CFDIR)/disktab
	chmod -R go-w $(CFDIR)/post.mnt
	chgrp -hR root $(CFDIR)/post.mnt
	chown -hR root $(CFDIR)/post.mnt
	cp $(SOURCE_DIR)/$(SYSTEM_NAME)/lilo-build.conf $(CFDIR)
	chown -hR root $(CFDIR)/lilo-build.conf
	( cd $(CFDIR); \
	$(STAGING_DIR)/bin/lilo -s /dev/null -C $(CFDIR)/lilo-build.conf -f $(CFDIR)/disktab; \
	)
	dd if=/dev/zero of=$(CFDIR)/conf.img bs=512 count=`expr $(CONFIG)`
	/sbin/mke2fs -F -m0 -v $(CFDIR)/conf.img
	/sbin/tune2fs -i 0 -j $(CFDIR)/conf.img
	# rm -rf $(CFDIR)/conf.mnt
	# mkdir $(CFDIR)/conf.mnt
	# mount -t ext3 -o loop $(CFDIR)/conf.img $(CFDIR)/conf.mnt
	# XXX stuff /conf here

	rm -f $(CFDIR)/disktab
	cat $(CFDIR)/mbr.img $(CFDIR)/post.img $(CFDIR)/conf.img | gzip -9 > $(IMG)
	ls -l $(CFDIR)/mbr.img $(CFDIR)/post.img $(CFDIR)/conf.img $(IMG)
	trap "cd $(CFDIR); umount $(CFDIR)/pre.mnt; umount $(CFDIR)/post.mnt; $(CFDIR)/conf.mnt sleep 1; \
				rm -rf $(CFDIR)/pre.mnt $(CFDIR)/post.mnt $(CFDIR)/conf.mnt" 0; 
	#$(ROOTDIR)/tools/cksum -b -o 2 $(IMG) >> $(IMG)

#############################################################################
# make images for various sizes of compact flash,  check your geometry,
# you may need to add your own here,  remove any your don't want built from
# the cfimage target
extimage-64MB:
	$(MAKE) extimage HEADS=2 SECTORS=62 CYLS=1009 IMG=$(IMAGE_DIR)/$(SYSTEM_NAME)-cf-64MB.img.gz

extimage-128MB:
	$(MAKE) extimage HEADS=2 SECTORS=62 CYLS=2018 IMG=$(IMAGE_DIR)/$(SYSTEM_NAME)-cf-128MB.img.gz

#stuff you have to be root for :(
cfimage-real: extimage-64MB extimage-128MB

#stuff we can do while NOT root
cfimage: cfimage-setup

cfimage-clean:
	#rm -f pre.img post.img lilo
	rm -f $(IMAGE_DIR)/$(SYSTEM_NAME)-cf-*.img.gz

cfimage-dirclean:
	rm -rf $(GENEXT2_DIR)

.PHONY: cfimage extimage-64MB extimage-128MB
#############################################################################


--Apple-Mail-13--79403804--
