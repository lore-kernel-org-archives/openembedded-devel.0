Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 59F95620BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 10:08:54 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 96B3F2A309
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 12:08:54 +0200 (CEST)
Message-ID: <519B47B8.7090002@pseudoterminal.org>
Date: Tue, 21 May 2013 12:08:56 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <519A68E8.9080503@pseudoterminal.org>
	<CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
In-Reply-To: <CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 May 2013 10:08:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-21 11:45, Burton, Ross wrote:
> On 20 May 2013 19:18, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> I am currently adapting the cubox layer for dylan, and get these errors:
>>
>> ERROR: Multiple .bb files are due to be built which each provide
>> virtual/libgles1
>> ERROR: Multiple .bb files are due to be built which each provide
>> virtual/libgles2
>> ERROR: Multiple .bb files are due to be built which each provide virtual/egl
> What are the bb files that are being build?  I'm guessing mesa and
> marvell-libgfx, but can you confirm this?  If you use depexp you can
> find out what's pulling in mesa, but it's generally mesa-demos.  This
> depends on virtual/libgl that you're not providing, so it will pull in
> Mesa.
>
> If you don't have any support for "big" GL then the easiest fix is to
> take the recent patches to mesa-demos in master that let you turn off
> GL using PACKAGECONFIG options.
>
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

The collision is indeed between marvell-libgfx and mesa, I just 
verified. My case is actually quite common with embedded 3D hardware - 
EGL, OpenGL ES 1.x,2.x and OpenVG are supported, but desktop OpenGL 
isn't. I have seen this with nVidia Tegra, Vivante, PowerVR, and ARM 
Mali hardware so far. It would be useful to instruct Mesa to turn off 
its OpenGLES and EGL support, leaving Mesa only for GLX+Desktop OpenGL 
(software-rendered), if anybody really needs it. As an alternative, as 
you suggest, I could simply turn off desktop OpenGL, but I have the 
feeling that this would be better off as a user decision that can be 
configured in the local.conf file. What do you think?

