Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P88KB-0007uu-5v
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 11:17:50 +0200
Received: by gwb17 with SMTP id 17so1066915gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NwbrHC9oZWEeoGMT79flMUxnClZVPhXliXjZ0cCTty4=;
	b=ph4klzu3vCGd9Mhod8BXCBSGErNSZgoH9yU4YGpyuJTcNCKXfwMe74X+Y72XDW9zjn
	oQeyil9yo4XtepKSwNeXSuuM6PUE8zly0bcK4oEzqeJqpC3CvccBQJMWGWOlS8MES5/Z
	w42khiperIYFAlSQvYT+QIYhg9zxcDoN0SiKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=myn2CKXJKlbzNBu7DJuBroDduHn00lblfsie+4v6KqbhaqjDMH3+qO7opv0GyrgGzu
	4YS8gjsDf7HPdqNBtkM0iAy0eJ87RB8d67jvidp0/C4qlrAxPZ/7Wto7N4TEIwSKFAfX
	nNVnkjJ1ugCH6RepWh4iEHxHU2bZQeiqrQAjE=
MIME-Version: 1.0
Received: by 10.42.224.4 with SMTP id im4mr138281icb.168.1287479816633; Tue,
	19 Oct 2010 02:16:56 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 02:16:56 -0700 (PDT)
In-Reply-To: <20101019091229.GL3324@jama>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikTjmbYC8sg9QsNxi8Dt02sebKMkyMYG7oa5SyR@mail.gmail.com>
	<20101019091229.GL3324@jama>
Date: Tue, 19 Oct 2010 11:16:56 +0200
Message-ID: <AANLkTinK_3Ln7ht9NsdrxRC+SF=k=FabkN5dZ+zxZMfH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Tue, 19 Oct 2010 09:17:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/19 Martin Jansa <martin.jansa@gmail.com>:
> On Tue, Oct 19, 2010 at 11:00:42AM +0200, Frans Meulenbroeks wrote:
>> 2010/10/19 Martin Jansa <martin.jansa@gmail.com>:
>> > I was asked few times to cleanup old openmoko recipes.
>> >
>> > Openmoko as distribution was obsoleted on Aug 10 2010 and SHR is marke=
d as
>> > successor in that distro config.
>> >
>> > Yesterday khem asked me to fix libmokoui2 or obsolete it. We don't use
>> > libmokoui2 in SHR and seems like nobody else does
>> > http://tinderbox.openembedded.org/packages/libmokoui2/
>> >
>> > So I started to obsolete it and recipes depending on it.. and when it =
started
>> > to fall apart I've moved last remaining parts to obsolete too.
>> >
>> > Please check this patch serie if you found something usefull for you a=
nd if yes,
>> > then became maintainer for it (as nobody seems to care now).
>> >
>> > BTW: I have nothing against openmoko company/distro/recipes/machines :=
).
>> >
>>
>> Patch 9 didn't land here.
>
> It's probably because it's 3.8MB big :/ I'll attach dirstat here.
>
>> I agree with your reasoning, and reviewed the other patches and see no i=
ssues.
>
>> The only small remark is that if you plan to move to obsolete today,
>> that full removal on oct 22 is a little bit early in my eyes.
>
> Removal Date: =A0 2010-12-22

Ah, misread as 2010-10-22
guess I am becoming lysdectic :-)
patch 9 is ok by me too, so i want to extend my ack to it.

Frans
>
> it's not October, but I'm ok to postpone it to 2011-06-01 or whatever..
>
> because obsolete/nonworking recipes are not in my BBFILES mask :).
>
>> Anyway for all the patches:
>> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Thanks
>
> ----
>
> Patch 09:
>
> in short:
>
> git mv recipes/linux/linux-openmoko-2.6.2[48]* recipes/obsolete/linux/
>
> From 1578a95d9e9267e1a05f36063846d69343aca33e Mon Sep 17 00:00:00 2001
> From: Martin Jansa <Martin.Jansa@gmail.com>
> Date: Tue, 19 Oct 2010 09:52:01 +0200
> Subject: [PATCH 09/13] linux-openmoko: obsolete 2.6.24 and 2.6.28
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A026 files changed, 41361 insertions(+), 41361 deletions(-)
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0001-squashfs-w=
ith-lzma.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0002-squashfs-i=
nitrd.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0003-squashfs-f=
orce-O2.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0004-squashfs-K=
config.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/0005-squashfs-M=
akefile.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/defconfig-2.6.2=
2.5
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/defconfig-oe
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/gta01-fix-batte=
ry-class-name.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/logo_linux_clut=
224.ppm
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24/openwrt-ledtrig=
-netdev.patch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.24_git.bb
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.28/defconfig-oe.pa=
tch
> =A0delete mode 100644 recipes/linux/linux-openmoko-2.6.28_git.bb
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0001-s=
quashfs-with-lzma.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0002-s=
quashfs-initrd.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0003-s=
quashfs-force-O2.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0004-s=
quashfs-Kconfig.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/0005-s=
quashfs-Makefile.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/defcon=
fig-2.6.22.5
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/defcon=
fig-oe
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/gta01-=
fix-battery-class-name.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/logo_l=
inux_clut224.ppm
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24/openwr=
t-ledtrig-netdev.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.24_git.bb
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.28/defcon=
fig-oe.patch
> =A0create mode 100644 recipes/obsolete/linux/linux-openmoko-2.6.28_git.bb
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


