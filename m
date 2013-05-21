Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id A42AE60897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 16:47:38 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so1103120oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2qMKoYPq2CcgffuW2JBfrWLFobQOnULyFRjSE5XY88U=;
	b=0PVCjijr0Y3zgy/IPuYc8yk8UdU0NQ+zQ+b1NqCZWXtVXhNTWIN4ONBQFqQUAojpIU
	Umrn3T8f3NGzJEkkL71qk/8lgJUpK67jb1wunRna7SaGbjTiK2e6Tr0WXtLscC5nPFwc
	XrMprQYajPV5TbkFWqRWxvNcepR2CUxuk+4EvuTTWee9SStURsF6WTHt4s7y2a0Tjecd
	IKfjvCt99UDA0ltN3jyqdbYZvo0HpiKZWGdeUocAvYyq406FrM47vu9cTJUfFjUmnyLA
	0tL10HF5PYJloSVadylPq7EbecOfZfK6gB+VhrWxuE0BXFZbrgwloa67OcWAmmjoQczF
	DIGQ==
MIME-Version: 1.0
X-Received: by 10.182.56.169 with SMTP id b9mr2059835obq.42.1369154859255;
	Tue, 21 May 2013 09:47:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 21 May 2013 09:47:39 -0700 (PDT)
In-Reply-To: <CAJTo0LYA6RqF32e6YTgNBqefThfqQC529DGRTwhhY+PfbEVZiA@mail.gmail.com>
References: <519A68E8.9080503@pseudoterminal.org>
	<CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
	<519B47B8.7090002@pseudoterminal.org>
	<CAJTo0LYA6RqF32e6YTgNBqefThfqQC529DGRTwhhY+PfbEVZiA@mail.gmail.com>
Date: Tue, 21 May 2013 13:47:39 -0300
X-Google-Sender-Auth: fsE7MPl6wJoN9dr4ZfdAhMRxUdI
Message-ID: <CAP9ODKpTA-Qo7j5CRapUCkOXHkiw1NxfBSpGb1ppgCK3w2oPpQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error message about multiple EGL / GLES providers
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
X-List-Received-Date: Tue, 21 May 2013 16:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 21, 2013 at 12:22 PM, Burton, Ross <ross.burton@intel.com>wrote:

> On 21 May 2013 11:08, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> > It would
> > be useful to instruct Mesa to turn off its OpenGLES and EGL support,
> leaving
> > Mesa only for GLX+Desktop OpenGL (software-rendered), if anybody really
> > needs it. As an alternative, as you suggest, I could simply turn off
> desktop
> > OpenGL, but I have the feeling that this would be better off as a user
> > decision that can be configured in the local.conf file. What do you
> think?
>
> You can change mesa's PACKAGECONFIG to not build egl and gles.
> meta-intel does something like this because the EMGD/CDT drivers are
> in the same boat.
>
> However considering our software GL support in Mesa is currently
> swrast (very very bad) and not llvmpipe (usable if you have enough
> CPU, which we generally don't) you generally don't want to actually
> have any OpenGL present at all.  Generally it's mesa-demos that pulls
> in virtual/libgl, and in master this can be disabled.  This may be
> worth a backport if someone wants to backport and test it.


+1

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

