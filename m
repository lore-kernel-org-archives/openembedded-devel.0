Received: from mail-bw0-f65.google.com ([209.85.214.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P88Fu-0002Uc-CH
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 11:13:15 +0200
Received: by bwz12 with SMTP id 12so530320bwz.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PPIYlrhnhlJRiI68ldAeNmEmLY7EPc5TBxMpesfFu7o=;
	b=PNzrUKBz9qARRQcnmekAT/RJMGoFqVuXXsTIhXqJ8ulNHE8XTtjxBenmiE4GM5nHtG
	CftBHqOLCnoUzujdogJpNz8uu2DjdZFTfNwWydUhKfgTklUNZ5e9vdMSJBXGjJrF4o2J
	084Cn0q86YE+O6aYYNsdp3vO+Ee3uRscPnvJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nLSfJj19KyMLiIEVFbmmXY4GdW7zCL0bfcHadHs39B+5T5HbDw0mFQRo8rgQbfIP5e
	vUoPpeITS+GMTaPPFFaM7thPjWpixGuENPUzQ3k5XHCQJtKx5lG6WxnlQmvbmtcL9u91
	S73mqn5pRZdKuUwXwfUWrcpaiG8hSKJKS0984=
Received: by 10.204.134.66 with SMTP id i2mr5361845bkt.154.1287479561765;
	Tue, 19 Oct 2010 02:12:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p34sm15592346bkf.15.2010.10.19.02.12.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 02:12:40 -0700 (PDT)
Date: Tue, 19 Oct 2010 11:12:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101019091229.GL3324@jama>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikTjmbYC8sg9QsNxi8Dt02sebKMkyMYG7oa5SyR@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikTjmbYC8sg9QsNxi8Dt02sebKMkyMYG7oa5SyR@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.65
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving openmoko recipes and classes to obsolete
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
X-List-Received-Date: Tue, 19 Oct 2010 09:13:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2010 at 11:00:42AM +0200, Frans Meulenbroeks wrote:
> 2010/10/19 Martin Jansa <martin.jansa@gmail.com>:
> > I was asked few times to cleanup old openmoko recipes.
> >
> > Openmoko as distribution was obsoleted on Aug 10 2010 and SHR is marked as
> > successor in that distro config.
> >
> > Yesterday khem asked me to fix libmokoui2 or obsolete it. We don't use
> > libmokoui2 in SHR and seems like nobody else does
> > http://tinderbox.openembedded.org/packages/libmokoui2/
> >
> > So I started to obsolete it and recipes depending on it.. and when it started
> > to fall apart I've moved last remaining parts to obsolete too.
> >
> > Please check this patch serie if you found something usefull for you and if yes,
> > then became maintainer for it (as nobody seems to care now).
> >
> > BTW: I have nothing against openmoko company/distro/recipes/machines :).
> >
> 
> Patch 9 didn't land here.

It's probably because it's 3.8MB big :/ I'll attach dirstat here.

> I agree with your reasoning, and reviewed the other patches and see no issues.

> The only small remark is that if you plan to move to obsolete today,
> that full removal on oct 22 is a little bit early in my eyes.

Removal Date:   2010-12-22

it's not October, but I'm ok to postpone it to 2011-06-01 or whatever..

because obsolete/nonworking recipes are not in my BBFILES mask :).

> Anyway for all the patches:
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Thanks

----

Patch 09:

in short:

git mv recipes/linux/linux-openmoko-2.6.2[48]* recipes/obsolete/linux/

From 1578a95d9e9267e1a05f36063846d69343aca33e Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Oct 2010 09:52:01 +0200
Subject: [PATCH 09/13] linux-openmoko: obsolete 2.6.24 and 2.6.28

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 26 files changed, 41361 insertions(+), 41361 deletions(-)
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0001-squashfs-with-lzma.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0002-squashfs-initrd.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0003-squashfs-force-O2.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0004-squashfs-Kconfig.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0005-squashfs-Makefile.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/defconfig-2.6.22.5
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/defconfig-oe
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/gta01-fix-battery-class-name.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/logo_linux_clut224.ppm
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24/openwrt-ledtrig-netdev.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.24_git.bb
 delete mode 100644 recipes/linux/linux-openmoko-2.6.28/defconfig-oe.patch
 delete mode 100644 recipes/linux/linux-openmoko-2.6.28_git.bb
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0001-squashfs-with-lzma.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0002-squashfs-initrd.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0003-squashfs-force-O2.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0004-squashfs-Kconfig.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0005-squashfs-Makefile.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/defconfig-2.6.22.5
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/defconfig-oe
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/gta01-fix-battery-class-name.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/logo_linux_clut224.ppm
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/openwrt-ledtrig-netdev.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24_git.bb
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.28/defconfig-oe.patch
 create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.28_git.bb

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


