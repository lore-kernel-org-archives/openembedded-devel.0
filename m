Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1YWG-0000gE-Fw
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 07:50:58 +0200
Received: by iwn2 with SMTP id 2so3430557iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 22:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Adt2KGKYmW0DziOhb0iMsN1vjAxjZKiAYnIkR8of5bs=;
	b=r3+0nw8O+MRt3d7s2OfZ9xIZvt0fVl9CiVJuaSnAm9rMURpoWfBJoe4zHwFE8AXLA1
	U41FptLp+Re4KXpICNjDL3X40bSSQsDSsUco7ZAhhP9D9DMK5FENITSqttwG79hoCbfl
	tsRbaisIbKaWiWFmnS0W8eEhvkioriryNONJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RXrbM19osHOpohOcFNoHaBi9Y1s/5viYdCJYOF3E/4iyJHsjXhmtTLW/h9nSTS6vBr
	3zx+ViCWKkRUeOFDVol0KN9UpGQY4tqBOIWesCWt6woLt371nHaYJf4VhtoJpvNk+hDG
	JQ6jk6IZUQmLld4SPQgmx38S7fWyrBO3L5bFY=
MIME-Version: 1.0
Received: by 10.231.146.135 with SMTP id h7mr5033119ibv.149.1285912243338;
	Thu, 30 Sep 2010 22:50:43 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 22:50:43 -0700 (PDT)
In-Reply-To: <AANLkTimSecS8ZnjrMCHYG7fY9ztxY-FmRQBFZTHBHgx4@mail.gmail.com>
References: <AANLkTimSecS8ZnjrMCHYG7fY9ztxY-FmRQBFZTHBHgx4@mail.gmail.com>
Date: Fri, 1 Oct 2010 07:50:43 +0200
Message-ID: <AANLkTi=eGy2QLJLc-N+FU6wdTUmO12+WYdMJzvyKGe4z@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: overriding files in a package
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
X-List-Received-Date: Fri, 01 Oct 2010 05:50:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/30 Cliff Brake <cliff.brake@gmail.com>:
> One thing I find myself doing is overriding files in one package with
> another package. =A0As long as the package doing the overriding was last
> in the IMAGE_INSTALL variable, this used to work. =A0Then bitbake
> started complaining about overriding packages, but that could be
> worked around by doing the following:
>
> RREPLACES_${PN} +=3D "udev"
> RREPLACES_${PN} +=3D "tzdata"
> RREPLACES_${PN} +=3D "initscripts"
>
> Now it seems that the packages no longer processed as listed in the
> IMAGE_INSTALL variable:
>
> | Configuring e2fsprogs-tune2fs.
> | Configuring svs-conf.
> | Configuring psplash.
> | Configuring tslib-tests.
> | Configuring tzdata-atlantic.
> | Configuring hplip-backend.
> | Configuring kernel-module-i2c-pxa.
> | Configuring tzdata-australia.
> | Configuring kernel-module-ftdi-sio.
> | Configuring test-gpio.
> | Configuring kernel-module-oprofile.
> | Configuring kernel-module-rtl8150.
> | Configuring xset.
> | Configuring tzdata-antarctica.
> | Configuring e2fsprogs-mke2fs.
> | Configuring tzdata-asia.
> | Configuring diag2020.
> | Collected errors:
> | =A0* resolve_conffiles: Existing conffile
> /scratch/pp/du-sw-web-builder/pp-du-oe/build/angstrom-2008/tmp/rootfs/svs=
-nand-test-image/etc/device_table
> is different from the conffile in the new package. The new conffile
> will be placed at
> /scratch/pp/du-sw-web-builder/pp-du-oe/build/angstrom-2008/tmp/rootfs/svs=
-nand-test-image/etc/device_table-opkg.
> | =A0* check_data_file_clashes: Package sysvinit wants to install file
> /scratch/pp/du-sw-web-builder/pp-du-oe/build/angstrom-2008/tmp/rootfs/svs=
-nand-test-image/etc/init.d/rc
> | =A0 =A0 =A0 But that file is already provided by package =A0* svs-conf
> | =A0* opkg_install_cmd: Cannot install package sysvinit.
> | ERROR: Function do_rootfs failed
> NOTE: package svs-nand-test-image-1.0-r0: task do_rootfs: Failed
>
> In my IMAGE_INSTALL, svs-conf is last, but its not configured last.
> Does this make sense related to recent bitbake and OE changes?
>
> Is http://sakrah.homelinux.org/node/2 the recommended solution for
> this problem going forward? =A0This looks workable, but as I'm
> overriding files in 7 packages, this gets a little tedious.
>
> Thanks,
> Cliff

It was my impression that for things like /etc/init.d/rc using
update-alternatives would be the preferred solution.

Wrt device_table: I also noticed that, no Idea why I get that or why I
didn't get it before.
Didn't have time to peek into it, bit I am interested to learn about this.

Frans


