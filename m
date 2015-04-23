Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B679F73D38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 22:27:16 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so71840918ieb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jLfBSpyLgFkg2SB/p11uXfSr19x3Y3do0rQutaoGv3c=;
	b=l55Zsbv6wo5qGt0EvGUOBunaVqB+6xthnrX0IIAt1MuID8tv5UpuW+z+mF3e+jm+/f
	nQ/R1Vg3socvYT+1a8XZLUHSyxPTVcR18GTehVpnItf9271ZqVH6NofaelaNIhynfTOZ
	7rbdnWOXvWI3LTEDLa+BJtTuZkjr5hgTYVXr4MmpaARSr0nx8UqkJKK6PaCkSzELPU+3
	g7C0hpBcsrXClq1zv5dJysdxDvw6Uy2hUaHdZpq8owKxh9uWsMYooF05KQ19uDSBC8uG
	QImgr07F/uXCmdw9Uv23V+edixpSuPXtbavZHGEHv3fbXBko0fvVchL+ISieEIiWeu4E
	Id6g==
MIME-Version: 1.0
X-Received: by 10.50.35.195 with SMTP id k3mr762720igj.11.1429828038300; Thu,
	23 Apr 2015 15:27:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Thu, 23 Apr 2015 15:27:18 -0700 (PDT)
In-Reply-To: <1429827090.3418.18.camel@Saturn.local.all>
References: <87pp6u4qp6.fsf@email.parenteses.org>
	<CAP9ODKoZmUHFPE8RyQ53a2c5ANz3-hB+oNc=R3b=ukoVCpUngg@mail.gmail.com>
	<1429827090.3418.18.camel@Saturn.local.all>
Date: Thu, 23 Apr 2015 19:27:18 -0300
X-Google-Sender-Auth: 7_Z3_tAGNNMTBVHMS7BjtAVL7rM
Message-ID: <CAP9ODKpU-PBCpf=3aK9QA96WBgprqg-ACoARA58iUee5JXZF_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Building openjdk without X11 dependencies
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
X-List-Received-Date: Thu, 23 Apr 2015 22:27:21 -0000
Content-Type: text/plain; charset=UTF-8

Hello Max,

On Thu, Apr 23, 2015 at 7:11 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> <mario@ossystems.com.br> wrote:
>> > I'm under the impression building openjdk without X11 is not feasible.
>> > As far as I understand, the headless package is (or should be) generated
>> > by building openjdk with the X11 dependencies, then selecting the
>> > components which are not linked against X11 libraries and putthing them
>> > into a separate package.  Does that sound correct?
>> >
>> > Is it possible to build openjdk without X11 dependencies?
>
> My interests actually went into the other direction. Adding a
> packageconfig which re-enables xawt.

I see.

> While looking at it I tried to remove the DEPENDS on X11/GTK+ and came
> to the conclusion that you would need to heavily change the source
> tree / Makefiles to leave all the sources which include X11 (or GTK+)
> headers out of the way.

It seems like it will be necessary. More below...

> The sources react to the symbol BUILD_HEADLESS_ONLY which promised to
> keep the X11 dependencies out. However that is either broken in the
> current versions of OpenJDK or never worked at all.
> Some mailinglist post underlined that. e.g.
> http://mail.openjdk.java.net/pipermail/build-dev/2012-March/005700.html
>
> Maybe one could split openjdk-7-common and openjdk7-jre into packages
> without X11 dependencies and the rest as Mario proposes. However I don't
> know if that would lead to a working headless java installation.

The packaging splitting does not work for this case as we need to
build in a framebuffer only environment. So the build dependencies are
not available.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

