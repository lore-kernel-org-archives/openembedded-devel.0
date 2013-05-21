Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id BE8A56148D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 10:51:41 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id 12so291641vbf.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=mG9HL4mAft/FtXABPIBRtSIPV00+edRVW+cMzWztrC0=;
	b=l7BxlX+hevo+ept/hZEQan9Y+nluhvzE30GhMt/oizGJgLEddocIZ5MTIVgzKdJ2+/
	R33xTUVwgGejWhokUfqIOea7Q0SLSkZsxef52xoCcwHxTYx14Th9Rq/4DFcKynGjk+Wn
	q+LfcJIsfNfS1+piyDJRjOdGPBMOk0OnVbtb7t8M201UiTND5qCWijWbpjSQZB1UczxE
	qwN/yBibEC+c02F1QDr3+JsG79o9POabU5DwjVucXnvcPALgQSJZwIJ3giNG0UwwvMV6
	8qBrxV/I+NfNfJN4Nihk2squvA9ZB0zPVKoktawCUzfkycARcY3FRr+6X1BmBqzEwlv4
	NOjg==
X-Received: by 10.52.32.37 with SMTP id f5mr562487vdi.28.1369133502180; Tue,
	21 May 2013 03:51:42 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Tue, 21 May 2013 03:51:22 -0700 (PDT)
In-Reply-To: <519B47B8.7090002@pseudoterminal.org>
References: <519A68E8.9080503@pseudoterminal.org>
	<CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
	<519B47B8.7090002@pseudoterminal.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 21 May 2013 11:51:22 +0100
X-Google-Sender-Auth: 3l5Hhjw3PBwK2hEDd0btGdgcth8
Message-ID: <CANyK_8dG48EhyBC7Ju+iMr9gU6t42H24MGYhH5uBB7tZD=a4hg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 21 May 2013 10:51:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 May 2013 11:08, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> On 2013-05-21 11:45, Burton, Ross wrote:
>>
>> On 20 May 2013 19:18, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>>>
>>> I am currently adapting the cubox layer for dylan, and get these errors:
>>>
>>> ERROR: Multiple .bb files are due to be built which each provide
>>> virtual/libgles1
>>> ERROR: Multiple .bb files are due to be built which each provide
>>> virtual/libgles2
>>> ERROR: Multiple .bb files are due to be built which each provide
>>> virtual/egl
>>
>> What are the bb files that are being build?  I'm guessing mesa and
>> marvell-libgfx, but can you confirm this?  If you use depexp you can
>> find out what's pulling in mesa, but it's generally mesa-demos.  This
>> depends on virtual/libgl that you're not providing, so it will pull in
>> Mesa.
>>
>> If you don't have any support for "big" GL then the easiest fix is to
>> take the recent patches to mesa-demos in master that let you turn off
>> GL using PACKAGECONFIG options.
>>
>> Ross
>
>
> The collision is indeed between marvell-libgfx and mesa, I just verified. My
> case is actually quite common with embedded 3D hardware - EGL, OpenGL ES
> 1.x,2.x and OpenVG are supported, but desktop OpenGL isn't. I have seen this
> with nVidia Tegra, Vivante, PowerVR, and ARM Mali hardware so far. It would
> be useful to instruct Mesa to turn off its OpenGLES and EGL support, leaving
> Mesa only for GLX+Desktop OpenGL (software-rendered), if anybody really
> needs it. As an alternative, as you suggest, I could simply turn off desktop
> OpenGL, but I have the feeling that this would be better off as a user
> decision that can be configured in the local.conf file. What do you think?
>

This also crops up when building for raspberrypi with the
meta-raspberrypi layer. The errors I see in a `bitbake world` are
(with paths shortened):

ERROR: Multiple .bb files are due to be built which each provide
virtual/egl (.../openembedded-core/meta/recipes-graphics/mesa/mesa_9.0.2.bb
.../meta-raspberrypi/recipes-graphics/userland/userland_git.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
virtual/libgles2
(.../openembedded-core/meta/recipes-graphics/mesa/mesa_9.0.2.bb
.../meta-raspberrypi/recipes-graphics/userland/userland_git.bb).
 This usually means one provides something the other doesn't and should.

It's not really something I've looked into much (I don't know the full
list of things mesa provides) but if there's a solution for other
platforms I could have a look at doing a similar thing in
meta-raspberrypi.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

