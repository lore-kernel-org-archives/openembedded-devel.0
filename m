Return-Path: <felix01.fischer@iav.de>
Received: from mailout03.rmx.de (unknown [217.111.120.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86F176FA84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 12:54:52 +0000 (UTC)
Received: from cryptout01.retarus.com ([172.19.21.78])
	by mailout03.rmx.de (8.14.4/8.14.5/retarus.custom) with ESMTP id
	s4RCsoCf024883; Tue, 27 May 2014 14:54:50 +0200
Received: from cryptout01 (localhost [127.0.0.1])
	by cryptout01.retarus.com (Postfix) with ESMTP id 84DB53704E2;
	Tue, 27 May 2014 14:54:47 +0200 (CEST)
Received: from mailcc07.retarus.de (mailcc07.retarus.de [172.19.21.7])
	by cryptout01.retarus.com (Postfix) with SMTP id 1897A3704DB;
	Tue, 27 May 2014 14:54:47 +0200 (CEST)
In-Reply-To: <CAMCfZKFHUTFqHyqhVPokg_vaOLswCrGx-tQw+ZrEDQ+8a6EsWQ@mail.gmail.com>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
	<CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>	<OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
	<CAMCfZKFHUTFqHyqhVPokg_vaOLswCrGx-tQw+ZrEDQ+8a6EsWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel-bounces@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: CAC968DE:62F94A19-C1257CE5:00462758;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
From: Felix01 Fischer <felix01.fischer@iav.de>
Message-ID: <OFCAC968DE.62F94A19-ONC1257CE5.00462758-C1257CE5.0046E0BC@retarus.de>
Date: Tue, 27 May 2014 14:54:13 +0200
X-RouteServers: CN=SRVB02M/O=IAV;CN=SRVHUB1/O=IAV
X-MIMETrack: Serialize by Router on jaja/RetarusMail(Release 8.5.3FP3|November
	15, 2012) at 27.05.2014 14:54:21,
	Serialize complete at 27.05.2014 14:54:21
X-RMX-ID: 20140527-145421-s4RCsLAH020596-0@kdin01
X-RMX-TRACE: 2014-05-27 14:54:22 KdIn2013@kdin01/mailcc09 [0.3s]
	20140527-145421-s4RCsLAH020596-0@kdin01 0:00:00
X-RMX-TRACE: 2014-05-27 14:54:22 RmxMSO@kdin01/mailcc03 [0.0s]
	20140527-145421-s4RCsLAH020596-0@kdin01 0:00:01
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Antwort: Re: [meta-qt5] Building and running issues on Raspberry Pi
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
X-List-Received-Date: Tue, 27 May 2014 12:54:54 -0000
Content-Type: text/plain; charset="US-ASCII"

First, thank you for your quick answer!
Please find my comments inline.


> Von: Diego Sueiro <diego.sueiro@gmail.com>
> An: openembedded-devel@lists.openembedded.org, 
> Datum: 27.05.2014 12:41
> Betreff: Re: [oe] [meta-qt5] Building and running issues on Raspberry Pi
> Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> 
> On Tue, May 27, 2014 at 7:08 AM, Felix01 Fischer 
> <felix01.fischer@iav.de>wrote:
> 
> > It's not possible to have hardware-accelerated QT on the raspberry pi 
when
> > you are running an X11 environment, therefore I want to use eglfs
> > directly.
> >
> > The raspberry pi doesn't have a mali graphics core, AFAIK.
> >
> 
> You are right. You should have to use userland package to get GLESv2:
> http://git.yoctoproject.org/cgit.cgi/meta-raspberrypi/tree/recipes-
> graphics/userland/userland_git.bb
> 

I'm using this recipe and I think it's cooked into the image by default.
Just to be sure I will do another image with userland added via local.conf
I think if this would be missing I should get another error code, when 
trying to start a Qt Programm


> 
> >
> > Nevertheless, applying your patch gives me an error while compiling.
> >
> > "
> > [...]/qeglfshooks_stub.cpp: In member function 'virtual void*
> > QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const
> > QSurfaceFormat&)':
> > [...]/qeglfshooks_stub.cpp:256:38: error: variable
> > 'QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const
> > QSurfaceFormat&)::mali_native_window native_window' has initializer 
but
> > incomplete type
> >      static struct mali_native_window native_window = {
> >                                       ^
> > [...]/qeglfshooks_stub.cpp:261:1: warning: control reaches end of 
non-void
> > function [-Wreturn-type]
> >  }
> >  ^
> > make[4]: *** [.obj/qeglfshooks_stub.o] Error 1
> > "
> >
> > Any suggestions?
> >
> 
> This patch just works for mali accelerated hardware.
> 

I'm just desperate to get it working, I had no hope it would ;-)



> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?
> utm_source=assinatura_diego&utm_medium=e-
> mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

