Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EEE036FB92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 07:18:46 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id m15so1527282wgh.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 00:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Jq52sPgVqpGExv7C1BEgmWqKWdQnXCAyVSQfoOXQpRE=;
	b=JSvh3C7VxpOxGqGx3M8adBRl7PDFxBKCPplQjyX0RY01MoSxI/UiVDN8JodaBhF+2G
	N3Q4GIivkMf245wEcBeJJl+HdTe70wAcZI6fJCPpx6vkbsFgiCvOhSBfHYIFWl6+7/D8
	wDLBQzZ6kNl1zc6mqTNz3q592oEv7CqedTSh+pKDO+XZjhKmsICKejSyux42gRuiP0Sq
	xINIVsHvpwz3zOTYTQJuy8GH6w5BLTj8hOvfb9Z10GMVLvPnMuGNd2qTZ1naryIdyefg
	dGI5d8yfYmAF3LgouoIHf630rTE8hSj1r/vcqyvlLsg/+uGstTXd9HNHfH9jIV96tj8C
	xhTQ==
MIME-Version: 1.0
X-Received: by 10.180.211.45 with SMTP id mz13mr3871126wic.32.1401434326716;
	Fri, 30 May 2014 00:18:46 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Fri, 30 May 2014 00:18:46 -0700 (PDT)
In-Reply-To: <OF684E5193.A8E8D443-ONC1257CE5.005A821E-C1257CE5.005ABDE1@retarus.de>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
	<CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
	<OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
	<CAMCfZKFHUTFqHyqhVPokg_vaOLswCrGx-tQw+ZrEDQ+8a6EsWQ@mail.gmail.com>
	<OFCAC968DE.62F94A19-ONC1257CE5.00462758-C1257CE5.0046E0BC@retarus.de>
	<CAMCfZKESSEEGMrxc6ouekZgmSZN0c8Ds3jQ1mm07EeqyN8dX0A@mail.gmail.com>
	<OF684E5193.A8E8D443-ONC1257CE5.005A821E-C1257CE5.005ABDE1@retarus.de>
Date: Fri, 30 May 2014 00:18:46 -0700
Message-ID: <CAOLEWZWbrT3zAMNMNutv+K6BLkGywGsv6vP7jTEq239z+dRPfg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Antwort: Re: Antwort: Re: [meta-qt5] Building and running issues on Raspberry Pi
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
X-List-Received-Date: Fri, 30 May 2014 07:18:47 -0000
Content-Type: text/plain; charset=UTF-8

I haven't really played with this end of rpi graphics much, but here are a
couple of things to check.  The vc-graphics, vg-graphics-hardfp, and
userland packages are all involved in rpi graphics.  The first two conflict
with each other, and there appears to be init scripts involved.  It looks
like maybe both userland and one of the vc-graphics packages are required
and some initial load/init stuff has to happen?  That's about all I got,
please post if you get it working.  My rpi build has nice working audio but
it would be cool to have full graphics support...


On Tue, May 27, 2014 at 9:31 AM, Felix01 Fischer <felix01.fischer@iav.de>
wrote:

> openembedded-devel-bounces@lists.openembedded.org schrieb am 27.05.2014
> 14:58:27:
>
> > Von: Diego Sueiro <diego.sueiro@gmail.com>
> > An: openembedded-devel@lists.openembedded.org,
> > Kopie: openembedded-devel-bounces@lists.openembedded.org
> > Datum: 27.05.2014 15:28
> > Betreff: Re: [oe] Antwort: Re: [meta-qt5] Building and running
> > issues on Raspberry Pi
> > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> >
> > On Tue, May 27, 2014 at 9:54 AM, Felix01 Fischer
> > <felix01.fischer@iav.de>wrote:
> >
> > > First, thank you for your quick answer!
> > > Please find my comments inline.
> > >
> > >
> > > > Von: Diego Sueiro <diego.sueiro@gmail.com>
> > > > An: openembedded-devel@lists.openembedded.org,
> > > > Datum: 27.05.2014 12:41
> > > > Betreff: Re: [oe] [meta-qt5] Building and running issues on
> Raspberry Pi
> > > > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> > > >
> > > > On Tue, May 27, 2014 at 7:08 AM, Felix01 Fischer
> > > > <felix01.fischer@iav.de>wrote:
> > > >
> > > > > It's not possible to have hardware-accelerated QT on the raspberry
> pi
> > > when
> > > > > you are running an X11 environment, therefore I want to use eglfs
> > > > > directly.
> > > > >
> > > > > The raspberry pi doesn't have a mali graphics core, AFAIK.
> > > > >
> > > >
> > > > You are right. You should have to use userland package to get
> GLESv2:
> > > > http://git.yoctoproject.org/cgit.cgi/meta-raspberrypi/tree/recipes-
> > > > graphics/userland/userland_git.bb
> > > >
> > >
> > > I'm using this recipe and I think it's cooked into the image by
> default.
> > > Just to be sure I will do another image with userland added via
> local.conf
> > > I think if this would be missing I should get another error code, when
> > > trying to start a Qt Programm
> > >
> > >
> > > >
> > > > >
> > > > > Nevertheless, applying your patch gives me an error while
> compiling.
> > > > >
> > > > > "
> > > > > [...]/qeglfshooks_stub.cpp: In member function 'virtual void*
> > > > > QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&,
> const
> > > > > QSurfaceFormat&)':
> > > > > [...]/qeglfshooks_stub.cpp:256:38: error: variable
> > > > > 'QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&,
> const
> > > > > QSurfaceFormat&)::mali_native_window native_window' has
> initializer
> > > but
> > > > > incomplete type
> > > > >      static struct mali_native_window native_window = {
> > > > >                                       ^
> > > > > [...]/qeglfshooks_stub.cpp:261:1: warning: control reaches end of
> > > non-void
> > > > > function [-Wreturn-type]
> > > > >  }
> > > > >  ^
> > > > > make[4]: *** [.obj/qeglfshooks_stub.o] Error 1
> > > > > "
> > > > >
> > > > > Any suggestions?
> > > > >
> > > >
> > > > This patch just works for mali accelerated hardware.
> > > >
> > >
> > > I'm just desperate to get it working, I had no hope it would ;-)
> > >
> >
> > You can search for a similar struct on Rpi libGLESv2 headers.
>
>
> Till now I don't have any success.
> Reading through various forums it seems to me, that with raspbian it is
> possible to get eglfs running.
> But I haven't found any special patch or workaround they are maybe using.
> Is there somehting special bitbake or poky does I'm not aware of?
> Regards,
> Felix
>
>
>
>
> >
> >
> > Regards,
> >
> > --
> > *dS
> > Diego Sueiro
> >
> > Administrador do Embarcados
> > www.embarcados.com.br<http://www.embarcados.com.br/?
> > utm_source=assinatura_diego&utm_medium=e-
> > mail&utm_campaign=Assinatura%20Email%20Diego>
> >
> > /*long live rock 'n roll*/
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

