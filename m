Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E6B3D620A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 16:57:28 +0000 (UTC)
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id A0DAA2A308
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 18:57:29 +0200 (CEST)
Message-ID: <519BA779.8090706@pseudoterminal.org>
Date: Tue, 21 May 2013 18:57:29 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <519A68E8.9080503@pseudoterminal.org>
	<CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
	<519B47B8.7090002@pseudoterminal.org>
	<CAJTo0LYA6RqF32e6YTgNBqefThfqQC529DGRTwhhY+PfbEVZiA@mail.gmail.com>
In-Reply-To: <CAJTo0LYA6RqF32e6YTgNBqefThfqQC529DGRTwhhY+PfbEVZiA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 May 2013 16:57:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2013 05:22 PM, Burton, Ross wrote:
> On 21 May 2013 11:08, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> It would
>> be useful to instruct Mesa to turn off its OpenGLES and EGL support, leaving
>> Mesa only for GLX+Desktop OpenGL (software-rendered), if anybody really
>> needs it. As an alternative, as you suggest, I could simply turn off desktop
>> OpenGL, but I have the feeling that this would be better off as a user
>> decision that can be configured in the local.conf file. What do you think?
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
>
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Good point. It would also discourage people from using compositing 
managers which render using desktop OpenGL, then wondering why the 3D 
effects are so awfully slow. Same goes for stuff like Enlightenment 
Evas, which uses by default the desktop GL backend instead of the GLES one.

