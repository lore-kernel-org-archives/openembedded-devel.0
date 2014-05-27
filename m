Return-Path: <diego.sueiro@gmail.com>
X-Greylist: delayed 1699 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 13:27:05 UTC
Received: from mail-we0-f179.google.com (unknown [74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 057746FA7A;
	Tue, 27 May 2014 13:27:05 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so9441354wes.38
	for <multiple recipients>; Tue, 27 May 2014 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/GvFqIHGNXZ2AzVG2ExUPofFCwXEoBxh0u8/lwBB0Fk=;
	b=hPQpK6/E2/lt6geAPuG7xdwNu3MK9wdudz11szJpdO9hfuiGuwsun/3YWPjLjVtjGZ
	pziqHiGtXTreipJf3uW97XWDevtWbzFQ2fZfuyD2NFuOShivCP39c2YCrxdGDTEnGmCL
	u4TssqEIHqEDiattuYIql5QLjxfdAFOJkmcPU4EXUFotE3y3/1nqFG8/YOz/CVei6tWd
	SM7e91HvkiPZGF73nR7WX7373v4UbZgPm4XyjaJRHK65yhqidddY+OQDNqlbnp6Dxdmy
	snfhXJxohnW6g+eHpIv0AlYuNgYcHYAdfkDNcLhlbTkOmUt/qgPHLi7v5xU5I+A9s7mK
	pb3A==
X-Received: by 10.180.74.78 with SMTP id r14mr37287798wiv.2.1401195527496;
	Tue, 27 May 2014 05:58:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.41.70 with HTTP; Tue, 27 May 2014 05:58:27 -0700 (PDT)
In-Reply-To: <OFCAC968DE.62F94A19-ONC1257CE5.00462758-C1257CE5.0046E0BC@retarus.de>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
	<CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
	<OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
	<CAMCfZKFHUTFqHyqhVPokg_vaOLswCrGx-tQw+ZrEDQ+8a6EsWQ@mail.gmail.com>
	<OFCAC968DE.62F94A19-ONC1257CE5.00462758-C1257CE5.0046E0BC@retarus.de>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 27 May 2014 09:58:27 -0300
Message-ID: <CAMCfZKESSEEGMrxc6ouekZgmSZN0c8Ds3jQ1mm07EeqyN8dX0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel-bounces@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Antwort: Re: [meta-qt5] Building and running issues on Raspberry Pi
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
X-List-Received-Date: Tue, 27 May 2014 13:27:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 27, 2014 at 9:54 AM, Felix01 Fischer <felix01.fischer@iav.de>wrote:

> First, thank you for your quick answer!
> Please find my comments inline.
>
>
> > Von: Diego Sueiro <diego.sueiro@gmail.com>
> > An: openembedded-devel@lists.openembedded.org,
> > Datum: 27.05.2014 12:41
> > Betreff: Re: [oe] [meta-qt5] Building and running issues on Raspberry Pi
> > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> >
> > On Tue, May 27, 2014 at 7:08 AM, Felix01 Fischer
> > <felix01.fischer@iav.de>wrote:
> >
> > > It's not possible to have hardware-accelerated QT on the raspberry pi
> when
> > > you are running an X11 environment, therefore I want to use eglfs
> > > directly.
> > >
> > > The raspberry pi doesn't have a mali graphics core, AFAIK.
> > >
> >
> > You are right. You should have to use userland package to get GLESv2:
> > http://git.yoctoproject.org/cgit.cgi/meta-raspberrypi/tree/recipes-
> > graphics/userland/userland_git.bb
> >
>
> I'm using this recipe and I think it's cooked into the image by default.
> Just to be sure I will do another image with userland added via local.conf
> I think if this would be missing I should get another error code, when
> trying to start a Qt Programm
>
>
> >
> > >
> > > Nevertheless, applying your patch gives me an error while compiling.
> > >
> > > "
> > > [...]/qeglfshooks_stub.cpp: In member function 'virtual void*
> > > QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const
> > > QSurfaceFormat&)':
> > > [...]/qeglfshooks_stub.cpp:256:38: error: variable
> > > 'QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const
> > > QSurfaceFormat&)::mali_native_window native_window' has initializer
> but
> > > incomplete type
> > >      static struct mali_native_window native_window = {
> > >                                       ^
> > > [...]/qeglfshooks_stub.cpp:261:1: warning: control reaches end of
> non-void
> > > function [-Wreturn-type]
> > >  }
> > >  ^
> > > make[4]: *** [.obj/qeglfshooks_stub.o] Error 1
> > > "
> > >
> > > Any suggestions?
> > >
> >
> > This patch just works for mali accelerated hardware.
> >
>
> I'm just desperate to get it working, I had no hope it would ;-)
>

You can search for a similar struct on Rpi libGLESv2 headers.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

