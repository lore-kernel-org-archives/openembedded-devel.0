Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2A12765E17
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 21:22:13 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id b6so3480056yha.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 14:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=gmxbXH3bROR1nleL80lJIfsoI5DSOJoE3Mrl+5H65dQ=;
	b=V8KS4/48ptqwwxdGQfAqZaqWIQTHgY+5ji6/9VULofkyoUBX1kFWs9BR+9Gecn5ObR
	Mk7O5PoJ671l7NOw+vLxW2e3w6qQZp5D//UluUTwAk3lc6d2/9KUnSkBwhlegpLDgILr
	OOpgYDL1NYhp2wkhiRLEyWv5tacmnllsjzlYE7HrZCTBF8Jicx2TgU+zQQez6R6ji9kM
	5PsO75WPmwzZteKzLZvpdleaSn+9IbSUjibmQH1VWNSDVpEaDKeiOx0v5XvSmI5xTbNZ
	w/CR03mwQ8CwG/AZKtZZmp0s6dQonaOrBpE509cuegIYMfK8ah257zcoq8KNL5/p4//t
	bcjQ==
MIME-Version: 1.0
X-Received: by 10.236.43.98 with SMTP id k62mr18087589yhb.33.1398979334248;
	Thu, 01 May 2014 14:22:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 1 May 2014 14:22:14 -0700 (PDT)
In-Reply-To: <1398976570-3026-1-git-send-email-dv@pseudoterminal.org>
References: <1398976570-3026-1-git-send-email-dv@pseudoterminal.org>
Date: Thu, 1 May 2014 18:22:14 -0300
X-Google-Sender-Auth: zn4RbYnEzKoR4J3D9mJWvdD22kA
Message-ID: <CAP9ODKpwFmxMT1EO8jtSctxWBPus418a=OSpZicH4hd504bH=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH v3 0/4] Introduce EGL/GLES and component build patches for Chromium
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
X-List-Received-Date: Thu, 01 May 2014 21:22:18 -0000
Content-Type: text/plain; charset=UTF-8

Hello Carlos,

On Thu, May 1, 2014 at 5:36 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> This set of patches extends the chromium recipe to allow for EGL&GLESv2 based 2D rendering,
> considerably improving performance. This also adds hardware-accelerated WebGL support.
>
> Three new PACKAGECONFIG for chromium are introduced:
>
> * "component-build" : If set, Chromium is built in component mode. Each subsystem of Chromium
>   ends up in a separate shared object. The alternative is the regular mode, which links everything
>   into one big binary. Component builds are useful for development and testing, and consumes
>   significantly less RAM during building. It is essential when building Chromium on a 32-bit OS.
>
> * "use-egl" : Ordinarily, Chromium will try to use GLX and regular (= Desktop) OpenGL for 2D
>   acceleration. If that fails, software rendering is used. If use-egl is set, it will use EGL
>   instead of GLX and OpenGL ES 2.0 instead of regular OpenGL. This is very useful if the
>   target platform provides hardware acceleration for this API. Chromium will then render all 2D
>   components as well as WebGL contents with hardware acceleration, Canvas being an exception
>   (see below).
>
> * "ignore-lost-context" : Without this flag, HTML Canvas will not be accelerated, even with the
>   "use-egl" flag set. The reason for this is a conceptual problem: HTML Canvas expects the
>   backing store of the canvas to persist until the web page goes away. But if the backing store
>   is a GLES texture, then in theory the associated EGL context could get lost (for example, during
>   a power management cycle), and the texture along with it. This violates requirements for canvas.
>   So, one has to choose: either remain fully standards compliant, and have no acceleration, or
>   have acceleration, and risk losing the Canvas content. Note that context losses do not happen on
>   all platforms (they haven't been observed with Vivante GPUs for example, and internals of its
>   galcore module do not show anything that could cause a lost context). But since these recipes
>   do not depend on a specific platform, this option must be explicitely enabled.

Thanks for this. I applied them all in master branch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

