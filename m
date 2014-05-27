Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (unknown [209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 14DA96FA5A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 02:43:42 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id a41so6925390yho.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 19:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=HX2hojzEk17Q1tw8inafcsqFV4vCZiHXAg+vlmWy0Gc=;
	b=DuZgHF9J/QFdbpIV0PTDmXQ/1Cke3rQvReqFV3mmhJamA7pxALn/D5xjwwmH1dQwDh
	7WisqRX5unRxEeUVfSieCNPZZ/iN9OxJnxvC+UiD3l61l7NDJFEHeYT90xasT1dR2Dnz
	lVcy3GeJSeo0Q8KuPOhr5FRlw+99nZHs71ZqPvdOA6v5xGeZqMPpj6oyoOst3a/aNcwJ
	Ta60neIY8RDV3B1kQ2b10t8HqRUuEpHpBJKGCFjFIgKpPlW0+sDB7Xu0v775XyJU8jDA
	FgZ4amkGFuWKTpg/+O4ombneNeF/AuBGISAt9Y72iAspLOVzqiij5XzzDpwEdACRzlWh
	Z5qg==
MIME-Version: 1.0
X-Received: by 10.236.185.167 with SMTP id u27mr9183973yhm.128.1401158622884; 
	Mon, 26 May 2014 19:43:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 26 May 2014 19:43:42 -0700 (PDT)
In-Reply-To: <CAK8F28=V27aeFP9cejf8cty8=_WR-uQscAKiKj4JC8DCFa0=MA@mail.gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<CAP9ODKoyYcRb7jJ9GWWvqLNCJ5Sy5fhYLL8vNG6vSRyBpmeCtw@mail.gmail.com>
	<CAK8F28mJTm+xHD8uyzF00xUpz=q7fpn4EC4Ao-tUqX-eQquZBQ@mail.gmail.com>
	<CAK8F28=V27aeFP9cejf8cty8=_WR-uQscAKiKj4JC8DCFa0=MA@mail.gmail.com>
Date: Mon, 26 May 2014 23:43:42 -0300
X-Google-Sender-Auth: ldApwneqx5duo1ZKJiLwde7LUSs
Message-ID: <CAP9ODKpAmSc4fEsRaKrynTf0n4yRiorowKdaEVo28PhFGbv9QA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 02:43:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 26, 2014 at 9:46 PM, Ash Charles <ashcharles@gmail.com> wrote:
> On Mon, May 26, 2014 at 3:09 PM, Ash Charles <ashcharles@gmail.com> wrote:
>> Okay---that makes sense.  I'll send a v2 with these fixes.
> I tried the patch below and sent it along to the upstream maintainer
> as it fixes the problem when I build locally.  When bitbaking though,
> it looks like the autotools.bbclass dispose of the $(srcdir)
> change...darn!  Any suggestions? This is readily fixed with
> autotools-brokensep....
>
> --- eject/Makefile.in   2006-06-03 18:59:08.000000000 -0700
> +++ eject/Makefile.in   2014-05-26 15:58:08.031605669 -0700
> @@ -72,7 +72,7 @@
>  eject_SOURCES = eject.c
>  volname_SOURCES = volname.c
>
> -@USE_NLS_TRUE@SUBDIRS = po
> +@USE_NLS_TRUE@SUBDIRS = $(srcdir)/po

@top_srcdir@?

>  AM_CPPFLAGS = -DDEFAULTDEVICE=\"$(DEFAULTDEVICE)\" -DGETOPTLONG
>  AM_CFLAGS = -Wall $(RPM_OPT_FLAGS)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

