Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id F268E65DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 16:16:06 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so11166089qcy.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Nov 2014 08:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=GpnhUuLCInpWnPtI/yk9bWRh9A49BfQM5EWcnj6+lks=;
	b=GBMV4KakouwkVUBVWmrwSF6uU5WXMc7bLY1m3BbBzTg0AuG9tpswSwIdOqJPSxcpET
	YOJy18vF73PrKAVS40w3iQecV1ymHxWJhw8cLN6TfsxP6arMT7BbwZmwJLLQZdZ9e5Je
	I8d5MFYfKi1f9RpU6N5tXLfMsRIYXVrVZGa3Ojy+lGnNh7vBiGtreoy+nVrQb9z9utEL
	B1eFhPZZYSHBRwXIOYAJ94vOR6H17op/ofn7l894erIm66eCAde0or+gdOnJYh1AnN0e
	cDKRG2DPFHrcEfH3g8ztgkAaqh2yC6YnM72NTMYqEEpMBdf9v4r/ldx4TW1q8NNIcQNV
	/Buw==
X-Received: by 10.229.49.131 with SMTP id v3mr11352932qcf.19.1415117766811;
	Tue, 04 Nov 2014 08:16:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.20 with HTTP; Tue, 4 Nov 2014 08:15:46 -0800 (PST)
In-Reply-To: <OF175DDA60.D6C12F59-ONC1257CEC.002DE8AF-C1257CEC.002FC18D@retarus.de>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
	<CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
	<OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
	<CAMCfZKFHUTFqHyqhVPokg_vaOLswCrGx-tQw+ZrEDQ+8a6EsWQ@mail.gmail.com>
	<OFCAC968DE.62F94A19-ONC1257CE5.00462758-C1257CE5.0046E0BC@retarus.de>
	<CAMCfZKESSEEGMrxc6ouekZgmSZN0c8Ds3jQ1mm07EeqyN8dX0A@mail.gmail.com>
	<OF684E5193.A8E8D443-ONC1257CE5.005A821E-C1257CE5.005ABDE1@retarus.de>
	<CAOLEWZWbrT3zAMNMNutv+K6BLkGywGsv6vP7jTEq239z+dRPfg@mail.gmail.com>
	<OF175DDA60.D6C12F59-ONC1257CEC.002DE8AF-C1257CEC.002FC18D@retarus.de>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 4 Nov 2014 14:15:46 -0200
Message-ID: <CAMCfZKHNqv34EwiiYfo2xzyWZdDmL85BJFFp20Nr_rqvpkKPUA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Building and running issues on Raspberry Pi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Nov 2014 16:16:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Felix,

I don't if you could get Qt5 running on Rpi.

If not I suggest you to take a look at this recipe:
https://bitbucket.org/embarcados/meta-embarcados/src/434dc81fcb7fe630c107ef172afc33ce62e335db/meta-rpi/recipes-qt/qt5/qtbase_5.3.%25.bbappend?at=daisy

Note that vc-graphics is used instead of userland:
https://bitbucket.org/embarcados/meta-embarcados/src/434dc81fcb7fe630c107ef172afc33ce62e335db/meta-rpi/conf/machine/include/rpi-default-providers.inc?at=daisy

This is my bbblayers.conf:
BBLAYERS ?= " \
  ${TOPDIR}/../poky-daisy/meta-embarcados \
  ${TOPDIR}/../poky-daisy/meta-embarcados/meta-rpi \
  ${TOPDIR}/../poky-daisy/meta-raspberrypi \
  ${TOPDIR}/../poky-daisy/meta-qt5 \
  ${TOPDIR}/../poky-daisy/meta-openembedded/meta-oe \
  ${TOPDIR}/../poky-daisy/meta \
  ${TOPDIR}/../poky-daisy/meta-yocto \
  "

All layers in daisy branch and only meta-qt5 on master.

Additionally you have to set GPU_MEM = "128" on your local.conf.

I've tested the Cinematics Experience demo and everything is working like a
charm.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

On Tue, Jun 3, 2014 at 5:41 AM, Felix01 Fischer <felix01.fischer@iav.de>
wrote:

> Please find my comments inline
>
> > Von: Stephen Arnold <stephen.arnold42@gmail.com>
> > An: openembedded-devel@lists.openembedded.org,
> > Datum: 30.05.2014 09:21
> > Betreff: Re: [oe] Antwort: Re: Antwort: Re: [meta-qt5] Building and
> > running issues on Raspberry Pi
> > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> >
> > I haven't really played with this end of rpi graphics much, but here are
> a
> > couple of things to check.  The vc-graphics, vg-graphics-hardfp, and
> > userland packages are all involved in rpi graphics.  The first two
> conflict
> > with each other, and there appears to be init scripts involved.  It
> looks
> > like maybe both userland and one of the vc-graphics packages are
> required
> > and some initial load/init stuff has to happen?  That's about all I got,
> > please post if you get it working.  My rpi build has nice working audio
> but
> > it would be cool to have full graphics support...
> >
> >
>
> Thank you very much for your input!
> Maybe yout got me going on the right path:
>
> Going trough the meta-raspberry/recipes-bcm/vc-graphics [1]  folder I
> noticed something in line 10 in meta-raspberry/recipes-bcm/vc-graphics/
> files/egl.pc [2]
>
> "Cflags: -I${includedir}/vc -I${includedir}/interface
> -I${includedir}/interface/vcos -I${includedir}/interface/vcos/pthreads"
>
> I always had to add "-I${includedir}/interface/vcos/pthreads" manually
> (mostly via "QT_CONFIG_FLAGS += " in  local.conf) otherwise qtbase won't
> compile, because it didn't find pthreads.
>
> The commit message for egl.pc states
> "This package adds a egl.pc file for use with libEGL (it is necessary to
> specify a custom include paths for the compiler due to brokenness in the
> firmware header files)." [3]
>
> Maybe this is the root of my problems if qtbase and therefore my own
> programm and qtcinematicexperience aswell dont inherit this file and it's
> paths. Maybe my workaround has some nasty side effects.
>
> Now I have to figure out how a *.pc file works with bitbake :-)
>
> PS: I also needed to specify -device and -device-option CROSS_COMPILE= via
> QT_CONFIG_FLAGS. Maybe this should be done via meta-raspberrypi, too?
>
> Regards,
>
> Felix
>
>
>
>
> [1]
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/recipes-bcm/vc-graphics
> [2]
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/recipes-bcm/vc-graphics/files/egl.pc
> [3]
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/commit/recipes-bcm/vc-graphics/files/egl.pc?id=fac94bf7de6ee76b8ef1f74bc1dba565eeaabf2a
>
>
> > On Tue, May 27, 2014 at 9:31 AM, Felix01 Fischer
> <felix01.fischer@iav.de>
> > wrote:
> >
> > > openembedded-devel-bounces@lists.openembedded.org schrieb am
> 27.05.2014
> > > 14:58:27:
> > >
> > > > Von: Diego Sueiro <diego.sueiro@gmail.com>
> > > > An: openembedded-devel@lists.openembedded.org,
> > > > Kopie: openembedded-devel-bounces@lists.openembedded.org
> > > > Datum: 27.05.2014 15:28
> > > > Betreff: Re: [oe] Antwort: Re: [meta-qt5] Building and running
> > > > issues on Raspberry Pi
> > > > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> > > >
> > > > On Tue, May 27, 2014 at 9:54 AM, Felix01 Fischer
> > > > <felix01.fischer@iav.de>wrote:
> > > >
> > > > > First, thank you for your quick answer!
> > > > > Please find my comments inline.
> > > > >
> > > > >
> > > > > > Von: Diego Sueiro <diego.sueiro@gmail.com>
> > > > > > An: openembedded-devel@lists.openembedded.org,
> > > > > > Datum: 27.05.2014 12:41
> > > > > > Betreff: Re: [oe] [meta-qt5] Building and running issues on
> > > Raspberry Pi
> > > > > > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> > > > > >
> > > > > > On Tue, May 27, 2014 at 7:08 AM, Felix01 Fischer
> > > > > > <felix01.fischer@iav.de>wrote:
> > > > > >
> > > > > > > It's not possible to have hardware-accelerated QT on the
> raspberry
> > > pi
> > > > > when
> > > > > > > you are running an X11 environment, therefore I want to use
> eglfs
> > > > > > > directly.
> > > > > > >
> > > > > > > The raspberry pi doesn't have a mali graphics core, AFAIK.
> > > > > > >
> > > > > >
> > > > > > You are right. You should have to use userland package to get
> > > GLESv2:
> > > > > >
> http://git.yoctoproject.org/cgit.cgi/meta-raspberrypi/tree/recipes-
> > > > > > graphics/userland/userland_git.bb
> > > > > >
> > > > >
> > > > > I'm using this recipe and I think it's cooked into the image by
> > > default.
> > > > > Just to be sure I will do another image with userland added via
> > > local.conf
> > > > > I think if this would be missing I should get another error code,
> when
> > > > > trying to start a Qt Programm
> > > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > Nevertheless, applying your patch gives me an error while
> > > compiling.
> > > > > > >
> > > > > > > "
> > > > > > > [...]/qeglfshooks_stub.cpp: In member function 'virtual void*
> > > > > > > QEglFSHooks::createNativeWindow(QPlatformWindow*, const
> QSize&,
> > > const
> > > > > > > QSurfaceFormat&)':
> > > > > > > [...]/qeglfshooks_stub.cpp:256:38: error: variable
> > > > > > > 'QEglFSHooks::createNativeWindow(QPlatformWindow*, const
> QSize&,
> > > const
> > > > > > > QSurfaceFormat&)::mali_native_window native_window' has
> > > initializer
> > > > > but
> > > > > > > incomplete type
> > > > > > >      static struct mali_native_window native_window = {
> > > > > > >                                       ^
> > > > > > > [...]/qeglfshooks_stub.cpp:261:1: warning: control reaches end
> of
> > > > > non-void
> > > > > > > function [-Wreturn-type]
> > > > > > >  }
> > > > > > >  ^
> > > > > > > make[4]: *** [.obj/qeglfshooks_stub.o] Error 1
> > > > > > > "
> > > > > > >
> > > > > > > Any suggestions?
> > > > > > >
> > > > > >
> > > > > > This patch just works for mali accelerated hardware.
> > > > > >
> > > > >
> > > > > I'm just desperate to get it working, I had no hope it would ;-)
> > > > >
> > > >
> > > > You can search for a similar struct on Rpi libGLESv2 headers.
> > >
> > >
> > > Till now I don't have any success.
> > > Reading through various forums it seems to me, that with raspbian it
> is
> > > possible to get eglfs running.
> > > But I haven't found any special patch or workaround they are maybe
> using.
> > > Is there somehting special bitbake or poky does I'm not aware of?
> > > Regards,
> > > Felix
> > >
> > >
> > >
> > >
> > > >
> > > >
> > > > Regards,
> > > >
> > > > --
> > > > *dS
> > > > Diego Sueiro
> > > >
> > > > Administrador do Embarcados
> > > > www.embarcados.com.br<http://www.embarcados.com.br/?
> > > > utm_source=assinatura_diego&utm_medium=e-
> > > > mail&utm_campaign=Assinatura%20Email%20Diego>
> > > >
> > > > /*long live rock 'n roll*/
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

