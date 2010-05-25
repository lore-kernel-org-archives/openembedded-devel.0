Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OGqEg-0006go-8O
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 11:16:47 +0200
Received: by fxm9 with SMTP id 9so828593fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rhklVaXTKhd1FVYF9rFewvEmxOM8dRkk1EcOYcgF+VQ=;
	b=G+ZGAqQXBPsWpOZ3lbCZdqk0AYJBCDrMb87Ogc98RxduDxQsFXKcTM/tNSZulMxCEM
	8Gb/HQabnfD88BKfYfim+940yzM9uoAzbpCpnfA6QCtoAn+SycxK5FDhGXM+trBp90vy
	4RIZPSTg+p59ECedTLGEEVoew3yipu4Q7r0wM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MkcBvxndlTtNOp5ZRe3RhMhhEdrPJTQcAgQdmRFpdvEoi1wXnuBm6dWA3hBIuEjBE+
	C2Nik9CzGgfwbY5jKMrDO4PJWpqe/LLi82q1lu90GiohfwmlhQLl88JjaR2PVgFZryRd
	3NtTSkEmKLK+RQo6P7lWyYlhxArAHCKL5wOEs=
MIME-Version: 1.0
Received: by 10.204.126.84 with SMTP id b20mr2409207bks.61.1274778683175; Tue, 
	25 May 2010 02:11:23 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Tue, 25 May 2010 02:11:23 -0700 (PDT)
In-Reply-To: <htftsf$ilt$1@dough.gmane.org>
References: <1274770197-13394-1-git-send-email-raj.khem@gmail.com>
	<htftsf$ilt$1@dough.gmane.org>
Date: Tue, 25 May 2010 11:11:23 +0200
Message-ID: <AANLkTin5VBoB7K2n6JakiKoN2kfIF9JFgB4_3Ut3-z5n@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils
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
X-List-Received-Date: Tue, 25 May 2010 09:17:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> > * Main purpose of the patch was to fix the problem where udev-utils was
> >   needed to be in root file system just to get udevadm binary. So this
> >   binary is moved into udev package instead.
> >
> > * Use INC_PR
> >
> > * Use udev.inc in all recipes.
> >
> > * All udev recipes built udev_151 and udev_124 runs fine too.
>
> I explicitly didn't use udev.inc in udev 151 because it made the recipe
> very hard to read. It would make more sense to do a udev-1xx.inc based
> on udev 151 and use that for future recipes.
>
> The udevadm packaging change looks good, but it's only needed for udev
> >124 if I read the udev changelogs correctly.
>
> regards,
>
> Koen
>

Could you upload this patch to the git respiratory? Or this is just
non-official change?

I'm trying now to compile base-image on angstrom distro and I got error from
udev_151.bb recipe. May be your patch will help with this...

This is what I got:

Does anyone met with this error? Sorry if it's not a right place to post.


Kind Regards,
Grzegorz

#########################################
| checking for GLIB... configure: error: Package requirements (glib-2.0 >=
2.7.0 gobject-2.0 >= 2.7.0) were not met:
|
| Package file
'/home/grzesiek/tele/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/pkgconfig/glib-2.0.pc'
appears to be empty
| Package 'glib-2.0' has no Name: field
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables GLIB_CFLAGS
| and GLIB_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
NOTE: Task failed:
/home/grzesiek/tele/tmp/work/armv5te-angstrom-linux-gnueabi/udev-151-r9/temp/log.do_configure.18550
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/grzesiek/tele/openembedded/recipes/udev/udev_151.bbdo_configure
failed

