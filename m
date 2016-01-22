Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 619A5605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:26:35 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id b14so119662934wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 00:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=P5rRd5Cl4CuW6DkBqgJJy+pyQD8bndDaAVgETumNW4M=;
	b=xYl24GkL5cYAgGIrlpnRJVm4+3Alqj/c913dUT8vMSB3ozIg7AUDBPyJpH9mlHM3EQ
	ERN8cvzNw1ZicuWeQ7x9I/w+CWqNT6iUsh6J4FEccB3E+dn8SrVP3KP/BvHIBeBP0ZWX
	J4EndfUl1MnhZqOwDin0aFgzjLSv07fbWn7l3ptwUu6Ls31R62hyXo1XZibuMHbqxALr
	LP/4ecegXu9tzWY2kR7u4m2KfaAU2DLcUgoAP5RXPmIyN7yHzqdO9eQjUM2OmBvEViDh
	oGofd+ARdGfxUxY4Q0ijxjQRJMv6fYSDNKsk31DbBXQMpuRf36XmOXezuoPG8yL+V7D7
	KHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=P5rRd5Cl4CuW6DkBqgJJy+pyQD8bndDaAVgETumNW4M=;
	b=XIdIAVvBu9wkLpfSPrdT4USwg2A/soOtA1vxNgRAA0an1XPWPpHDZyiTnxaopurafP
	2WQCuaMARTbDpH/G+Iqd03gQBFS1qyDs2HyGZgRQIBZQTM5dkKWFysMAraj19EO+2IQH
	ufJ1KsOOvsW3EJhzv/Vlz28j6OJbm8MVIdx3ANGBuXsh3G5FMSHfB+4ijSHE4KOtuISS
	UsLMt1DXlayJ3aiH3v1ohevhOHyPGSNt+8tH1dhpl8qvoAyTRS7BrCLkO6iABARS6Wwx
	z5MW2VS3CE7ECcLEXA/KHEQkE5YTubIuvNN7lHt1a/RW4pDimtDkfgfPvtyo1eLydRyJ
	yvNg==
X-Gm-Message-State: AG10YOQ/Q/pgpFdbYfasC1aJPTJIWuyIrQePopztPIskfGHNF+9JUk792G96zIpvtZZCcI8PHJeWI3GnzkT7eg==
MIME-Version: 1.0
X-Received: by 10.28.6.213 with SMTP id 204mr2047442wmg.47.1453451195613; Fri,
	22 Jan 2016 00:26:35 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 22 Jan 2016 00:26:35 -0800 (PST)
In-Reply-To: <1453450077.2577.16.camel@gmail.com>
References: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1453450077.2577.16.camel@gmail.com>
Date: Fri, 22 Jan 2016 09:26:35 +0100
Message-ID: <CA+chaQdhrn9CcNXTde4ULwSodhsN+ajFZGXuY_wkSOcq-MUf+Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] networkmanager: Warning Fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jan 2016 08:26:36 -0000
Content-Type: text/plain; charset=UTF-8

It is correct approach to fix it.

This isn't:
RDEPENDS_${PN}-nmtui += "libnewt"

On Fri, Jan 22, 2016 at 9:07 AM, Adrian Freihofer <
adrian.freihofer@gmail.com> wrote:

> Hi
>
> This is not the right approach to fix this warning.
> Please try something like this:
> RDEPENDS_${PN}-nmtui += "libnewt"
>
> Notes:
> - I never saw this warning.
> - I would expect that pkgconfig does this automatically.
>
> Regards,
> Adrian
>
> On Thu, 2016-01-21 at 12:21 +0300, Li Xin wrote:
> > WARNING: QA Issue: networkmanager rdepends on libnewt, but it isn't a
> build dependency? [build-deps]
> >
> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb |
> 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb b/meta-oe/recipes-
> > connectivity/networkmanager/networkmanager_1.0.6.bb
> > index 1ddb66f..72b4e46 100644
> > --- a/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb
> > +++ b/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb
> > @@ -56,6 +56,7 @@ PACKAGECONFIG[wifi] =
> "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
> >  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
> >  PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
> >  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
> > +PACKAGECONFIG[libnewt] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
> >
> >  PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests
> ${PN}-bash-completion \
> >    ${PN}-nmtui ${PN}-nmtui-doc \
> > --
> > 1.8.4.2
> >
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

