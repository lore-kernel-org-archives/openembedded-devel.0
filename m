Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P1QTo-0004Zm-AT
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 23:15:53 +0200
Received: by wyb35 with SMTP id 35so2443609wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 14:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=v0Hjyb/JuLoXjk9iaM7vIHm9MFILhUpsiIlprR6NOlo=;
	b=qQhX8NXLSMMvuz+qhQIfn1XLVh20kUTI9NNFm0IQ4PlzMCoWIc8wUjAWWwObm9jNwo
	ryqh96jnqSYOOH5BaBrGvIz5Nx3PNipNNlTSqIRWDqcN/bybcb0+J1hjIGAb4wxD7LNo
	+Y61TKRQNlF+k3IifLekptCtkjs1oIHHx2RZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SOmoYyIEhxqhCoNRdVp1LgguFexoYiqle9Qu8Abmb2S+jTkfsSIIY7vNTpMdwF7qUc
	7oMQTqATu4+WXPUDPht4A6wDHUKJgNtMXVl3DlbgfJfvKgvFANBkcNSTWEFy7EWs59Ng
	+A936Wt9xHEpF31iCrducsxshkvqLk/rr0pso=
MIME-Version: 1.0
Received: by 10.216.187.130 with SMTP id y2mr1285459wem.60.1285881338162; Thu,
	30 Sep 2010 14:15:38 -0700 (PDT)
Received: by 10.216.45.149 with HTTP; Thu, 30 Sep 2010 14:15:38 -0700 (PDT)
Date: Thu, 30 Sep 2010 17:15:38 -0400
Message-ID: <AANLkTimSecS8ZnjrMCHYG7fY9ztxY-FmRQBFZTHBHgx4@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: overriding files in a package
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
X-List-Received-Date: Thu, 30 Sep 2010 21:15:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

One thing I find myself doing is overriding files in one package with
another package.  As long as the package doing the overriding was last
in the IMAGE_INSTALL variable, this used to work.  Then bitbake
started complaining about overriding packages, but that could be
worked around by doing the following:

RREPLACES_${PN} += "udev"
RREPLACES_${PN} += "tzdata"
RREPLACES_${PN} += "initscripts"

Now it seems that the packages no longer processed as listed in the
IMAGE_INSTALL variable:

| Configuring e2fsprogs-tune2fs.
| Configuring svs-conf.
| Configuring psplash.
| Configuring tslib-tests.
| Configuring tzdata-atlantic.
| Configuring hplip-backend.
| Configuring kernel-module-i2c-pxa.
| Configuring tzdata-australia.
| Configuring kernel-module-ftdi-sio.
| Configuring test-gpio.
| Configuring kernel-module-oprofile.
| Configuring kernel-module-rtl8150.
| Configuring xset.
| Configuring tzdata-antarctica.
| Configuring e2fsprogs-mke2fs.
| Configuring tzdata-asia.
| Configuring diag2020.
| Collected errors:
|  * resolve_conffiles: Existing conffile
/scratch/pp/du-sw-web-builder/pp-du-oe/build/angstrom-2008/tmp/rootfs/svs-nand-test-image/etc/device_table
is different from the conffile in the new package. The new conffile
will be placed at
/scratch/pp/du-sw-web-builder/pp-du-oe/build/angstrom-2008/tmp/rootfs/svs-nand-test-image/etc/device_table-opkg.
|  * check_data_file_clashes: Package sysvinit wants to install file
/scratch/pp/du-sw-web-builder/pp-du-oe/build/angstrom-2008/tmp/rootfs/svs-nand-test-image/etc/init.d/rc
|       But that file is already provided by package  * svs-conf
|  * opkg_install_cmd: Cannot install package sysvinit.
| ERROR: Function do_rootfs failed
NOTE: package svs-nand-test-image-1.0-r0: task do_rootfs: Failed

In my IMAGE_INSTALL, svs-conf is last, but its not configured last.
Does this make sense related to recent bitbake and OE changes?

Is http://sakrah.homelinux.org/node/2 the recommended solution for
this problem going forward?  This looks workable, but as I'm
overriding files in 7 packages, this gets a little tedious.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


