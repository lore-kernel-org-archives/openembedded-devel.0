Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLilf-0003EI-B4
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 21:50:11 +0100
Received: by iwn8 with SMTP id 8so118964iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 12:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nDZNHtJV7Y7zMmrJOPtEytZ3EhblHCfKqlamYGMZvAo=;
	b=OuDC2MU7iWRaUBsNssUErnzrnEx7JZeUXvDX1Mqk6jOyjKneykCzEwa2EQ+bdgAdyx
	DdFfJ3z77DpgyI6yeXlWgTQukbMKyUonCIm8ERRe0+EzD8f/XWMeHUw7tZXaZYjYWt8M
	xKOeTONcZ+vPOT7vBnNlncsfABBhs+bzDRRT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ErIEFnkLlvdPCOtXUID9fYLVp8PaSmjE+t7wo5KzfxyNP5/IXxI/ZnuuF4KxnOWJJ+
	/dNYyrmQnB8Kml/LiK3iXEidTgJvf8m6Rcnv6NjJ51RWdpKMUc2gMveQLm1vFfvgaNJ/
	FTnpVWWuW8nmUbcZVmAXXlUrkFKtdazQ4r//I=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr705090ibe.101.1290718137131; Thu,
	25 Nov 2010 12:48:57 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 25 Nov 2010 12:48:57 -0800 (PST)
In-Reply-To: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
References: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
Date: Thu, 25 Nov 2010 21:48:57 +0100
Message-ID: <AANLkTinBZooH6=-qHCMsV-E=UbDU2uXSOvuHe+rNhN09@mail.gmail.com>
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
Subject: Re: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Thu, 25 Nov 2010 20:50:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/25 Andrea Adami <andrea.adami@gmail.com>:
> Hello,
>
> build from scratch of console image for c7x0/armv5te leads to:
>
> ...
> Configuring sysvinit.
> Collected errors:
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-base-extended:
> =A0* <--->bluez-dtl1-workaround *.
> =A0* opkg_install_cmd: Cannot install package task-base-extended.
> =A0* resolve_conffiles: Existing conffile
> /oe/build/tmp/rootfs/console-image/etc/device_table is different from
> the conffile in the new package. The new conffile will be placed at
> /oe/build/tmp/rootfs/console-image/etc/device_table-opkg.
>
> A quick grep reveals:
>
> andrea@mizar /oe/openembedded $ grep -R bluez-dtl1-workaround .
> Binary file ./.git/index matches
> ./classes/kernel.bbclass:DEPENDS_kernel-module-dtl1-cs =3D "bluez-dtl1-wo=
rkaround"
> ./classes/kernel.bbclass:RDEPENDS_kernel-module-dtl1-cs =3D
> "bluez-dtl1-workaround"
> ./conf/machine/jornada7xx.conf:MACHINE_EXTRA_RDEPENDS =3D
> "kernel-modules bluez-dtl1-workaround"
> ./recipes/tasks/task-base.bb: =A0 =A0${@base_contains('COMBINED_FEATURES'=
,
> 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
> ./recipes/tasks/task-base.bb:# bluez-dtl1-workaround above is
> workaround for bitbake not handling DEPENDS on it in
> andrea@mizar /oe/openembedded $
>
>
> So, first doubt is: why make this mandatory for everyone having pcmcia?
> Second, why is it failing now?
>
> Any idea?
>
> Andrea
>

And the strange thing is if you build the package
bluez-dtl1-workaround manually first and after that build the image it
works.
Guess something is wrong with depends

Frans


