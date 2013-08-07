Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8034C605F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2013 20:46:14 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id h1so4136475oag.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2013 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=T55ZtY+JJYxozGqHdUTpYNJZoEPcVu6tL/OTYibEGXg=;
	b=fAmLb4+Pa2EAyo19IOGuIM0dyLqHBWfMR2jftgDIt+p3cu947NVVGiEKnhRXsp7jqZ
	AR8gG3dpAMkUNFzy9IXXFqMp3iIm23kytVESwXcVzBasvXulocBUAPfGjO1w2OIUR97O
	HZxIYOgMHHneLTHafOSJLvc5JsW1rMHmqAZuZGpYnyPAhWBDkB3h5luVMgOSrNs0UE3u
	fJAsM3agvL/oMHLVvlSXGwxxKBWb8qGgnX0fXlWFeR2bRYOIFWeGjpjHUJqe/1wCKlxz
	k3y2NlmIx4sFQVuV5c9KpPLsVMPfztugrvzpDkRI2YN+RKMn4AMIjs+vTaJ3YVvT5C+b
	shiw==
MIME-Version: 1.0
X-Received: by 10.60.96.131 with SMTP id ds3mr1985939oeb.50.1375908374794;
	Wed, 07 Aug 2013 13:46:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 7 Aug 2013 13:46:14 -0700 (PDT)
In-Reply-To: <CAFpw0gJVRD0bYmFCuH=rUtG6fBHJH7eiwzjxOq5R_Wjg5e0crQ@mail.gmail.com>
References: <CAFpw0gJVRD0bYmFCuH=rUtG6fBHJH7eiwzjxOq5R_Wjg5e0crQ@mail.gmail.com>
Date: Wed, 7 Aug 2013 17:46:14 -0300
X-Google-Sender-Auth: Cb3nY8ufT4McjI0FF5BSxYS13V0
Message-ID: <CAP9ODKrFJqF5qWTy=mTHNZJRpEVAORQyNYgOoDggf3WW0vM3sA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Building a MinGW SDK
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
X-List-Received-Date: Wed, 07 Aug 2013 20:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 6, 2013 at 4:52 PM, Francois Retief <fgretief@gmail.com> wrote:
> Hi,
>
> I have been struggling for the last week trying to get a MinGW based SDK
> going.
>
> After a long struggle I found that the PREFERRED_PROVIDER for libc-for-gcc
> had to change:
>
> PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?=
> "nativesdk-mingw-w64-runtime"
>
> I am now at a point where the libc-for-gcc is compiled using the
> mingw-w32-crt files, but I am don't know the exact path were OpenEmbedded
> want's the libc-for-gcc libraries to go.
>
> Using the i586-linux SDK as reference, it looks like it should be in
>
> ${TMPDIR}/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32
>
> But the gcc does not pick up the crtbegin.o/crtend.o files from there when
> building the libgcc library.
>
> Has anyone experience setting up GCC for a SDK under OpenEmbedded?
>
> I really need some advice.

I think the better list for this would be OE-Core. By the way, I also
have interest on it :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

