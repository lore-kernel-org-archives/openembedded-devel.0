Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8353B607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 10:03:43 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p187so57301645wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 02:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1Q/ra17Qp9c31TyRCVzv0nXWLCDqUg4lzsfrzgNeEt0=;
	b=Fr86IrNUUU/fKvpu/ER+MYPUxy9WcpDrnhl8AaVGdz85m8BGuB8hyqGOruFZ/Nr/kW
	7pCt4+LwpsYjaELKGPy5g+r0ZXH3x8QdGMKhebc0bOV5dpEb8nvXbPObE8B+tZG97R+5
	mw3zjRXEKOJxgAiBA77rDFJPTPP0q6pivTdd84ZEq+D3jO1z6ZLqOW1C8zcIYv9vB5OI
	/AhumRNe+vf5NfZeco2Me6QB8I8Y2ImekMVzw2qtGbuD9IOXHDDS8h2jlABdvpNhZG3D
	sGi2ztwCenXqmywLS71CBKd6Jq+yy/3muHbGrisZS0qwhTvZOtoJuf+ReT8YsrVwzyCZ
	7KjQ==
MIME-Version: 1.0
X-Received: by 10.28.131.80 with SMTP id f77mr2245749wmd.0.1450433024464; Fri,
	18 Dec 2015 02:03:44 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 18 Dec 2015 02:03:44 -0800 (PST)
In-Reply-To: <D3E9F0E7-BCA4-4875-A646-51A2F9D4CC24@gmail.com>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	<87h9kcoqw5.fsf@email.parenteses.org>
	<CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
	<D00C1F8D-0789-4430-BFF0-392336C81D37@gmail.com>
	<CAP9ODKoxbai1=yE4+XBAXOrQ7-JObwGhdOc7zRcuvz6EcbwGtw@mail.gmail.com>
	<20151123202155.GA17303@jama>
	<D3E9F0E7-BCA4-4875-A646-51A2F9D4CC24@gmail.com>
Date: Fri, 18 Dec 2015 11:03:44 +0100
Message-ID: <CA+chaQdG4br=oQzGbYLMmBxWCDE-qi+NktfAKQXkq6zqeA=ufw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Fri, 18 Dec 2015 10:03:44 -0000
Content-Type: text/plain; charset=UTF-8

Sorry for delay, jenkins jobs are still running... should be finished today

On Fri, Dec 18, 2015 at 8:06 AM, Khem Raj <raj.khem@gmail.com> wrote:

> ping^1
>
> > On Nov 23, 2015, at 12:21 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > On Mon, Nov 23, 2015 at 05:25:59PM -0200, Otavio Salvador wrote:
> >> On Mon, Nov 23, 2015 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>>> On Nov 23, 2015, at 4:29 AM, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
> >>>>
> >>>> On Mon, Nov 23, 2015 at 10:13 AM, Mario Domenech Goulart
> >>>> <mario.goulart@gmail.com> wrote:
> >>>>> On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador <
> otavio@ossystems.com.br> wrote:
> >>>>>
> >>>>>> The imsettings requires xfconf to run, making it dependent of XFCE.
> It
> >>>>>> makes no sense to make meta-ruby dependent of XFCE so we move the
> >>>>>> imsettings recipe to meta-xfce and add the meta-ruby dependency
> there.
> >>>>>
> >>>>> s/dependent of/dependent on/
> >>>>
> >>>> Agreed; Martin, can you fix it when applying or do you wish me to
> send a v2?
> >>>
> >>> I have sent a patch for same last week see.
> >>>
> >>> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/72211
> >>
> >> You missed the addition of meta-ruby dependency for meta-xfce now.
> >
> > I think he didn't because ruby was moved from meta-ruby to oe-core.
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

