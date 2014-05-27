Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f51.google.com (unknown [209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 62C346FA55
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 10:40:21 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q107so13601397qgd.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=A/5BZSG8PvVZHvcliQF44TbUPS6JgUqnSEdFRQaFiM0=;
	b=AvsMunH/xVykuxiDKqeR66opt1qFyPz2Il6vyWM6RieZH6GalvUr7CqqC5xMgDsz2I
	iHbKLrAv4FHEv+lkYIGky6lsZU6ebBP2DZijXzYQGI1onn+RaFlA/Vvbj5uEnlLDpsUE
	82OlIVu88l2RFwnf+//EK71I5jLJQ17Tit2X5f5rA/PfsActNNg0eKoxZUvoCoy8Zx+8
	Bhz93zeSf35FJRunOT33GxnlsSis3JvT7bvSnYekzraxqLJo65np7h36i8ZHzKfuj9U2
	4WZA2mTZ9/p3jjVDKEP5dkx6jts1UCY9jgSrNp88wnFIwSgrGAaAw1OeB2SBJdDXrA2t
	uDdg==
X-Received: by 10.224.20.72 with SMTP id e8mr39906403qab.86.1401187222127;
	Tue, 27 May 2014 03:40:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Tue, 27 May 2014 03:40:02 -0700 (PDT)
In-Reply-To: <OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
	<CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
	<OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 27 May 2014 07:40:02 -0300
Message-ID: <CAMCfZKFHUTFqHyqhVPokg_vaOLswCrGx-tQw+ZrEDQ+8a6EsWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 May 2014 10:40:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 27, 2014 at 7:08 AM, Felix01 Fischer <felix01.fischer@iav.de>wrote:

> It's not possible to have hardware-accelerated QT on the raspberry pi when
> you are running an X11 environment, therefore I want to use eglfs
> directly.
>
> The raspberry pi doesn't have a mali graphics core, AFAIK.
>

You are right. You should have to use userland package to get GLESv2:
http://git.yoctoproject.org/cgit.cgi/meta-raspberrypi/tree/recipes-graphics/userland/userland_git.bb


>
> Nevertheless, applying your patch gives me an error while compiling.
>
> "
> [...]/qeglfshooks_stub.cpp: In member function 'virtual void*
> QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const
> QSurfaceFormat&)':
> [...]/qeglfshooks_stub.cpp:256:38: error: variable
> 'QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const
> QSurfaceFormat&)::mali_native_window native_window' has initializer but
> incomplete type
>      static struct mali_native_window native_window = {
>                                       ^
> [...]/qeglfshooks_stub.cpp:261:1: warning: control reaches end of non-void
> function [-Wreturn-type]
>  }
>  ^
> make[4]: *** [.obj/qeglfshooks_stub.o] Error 1
> "
>
> Any suggestions?
>

This patch just works for mali accelerated hardware.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

