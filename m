Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 33DE060897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 15:23:00 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id oz10so560948veb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 08:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=5g9cN0AkEQKYGWpw/7cEVAqLx/BCA9m+sF59LjhjQ0Y=;
	b=GgPjPPPC8OYzhUoBc5bETsDRxvkT3n2cS9IKPkGH+il+44VbDNmcgZskF6iZUBLHA8
	iUnz/GlYp+rVm7CK1Rq0sdDw+zn5udxd+Jijh8896tNuCfkNE2eCHUfvhcjXXoMy/G5i
	H8g9RdQJ/LY3QpvQhhmA5aKiOgFAqLJltJxAGmEgg+TtUlxCY5EU/nxLDFq+jM/HHfQ4
	iZxyrOh07n1LAyRRXnvqQcgKMEqGdalVcPLpKjkYlrb6Rye5ZKO/sj0KlNzdKcFilY0n
	QbxgLny3LIOEmct6hbpKSXZf/KV8hvU9FGsvumk1l1WXX1EjQmDMYPFsCtwXfVJZj9Xr
	e0nQ==
X-Received: by 10.58.106.77 with SMTP id gs13mr1091746veb.22.1369149780609;
	Tue, 21 May 2013 08:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Tue, 21 May 2013 08:22:40 -0700 (PDT)
In-Reply-To: <519B47B8.7090002@pseudoterminal.org>
References: <519A68E8.9080503@pseudoterminal.org>
	<CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
	<519B47B8.7090002@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 May 2013 16:22:40 +0100
Message-ID: <CAJTo0LYA6RqF32e6YTgNBqefThfqQC529DGRTwhhY+PfbEVZiA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlV20Hn7RBavh2VHWWmoEjtcKYa3+FFToBTX0Bxbk17Y2UeK++tAHRKIUddimC9jixB/YCl
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
X-List-Received-Date: Tue, 21 May 2013 15:23:00 -0000
Content-Type: text/plain; charset=UTF-8

On 21 May 2013 11:08, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> It would
> be useful to instruct Mesa to turn off its OpenGLES and EGL support, leaving
> Mesa only for GLX+Desktop OpenGL (software-rendered), if anybody really
> needs it. As an alternative, as you suggest, I could simply turn off desktop
> OpenGL, but I have the feeling that this would be better off as a user
> decision that can be configured in the local.conf file. What do you think?

You can change mesa's PACKAGECONFIG to not build egl and gles.
meta-intel does something like this because the EMGD/CDT drivers are
in the same boat.

However considering our software GL support in Mesa is currently
swrast (very very bad) and not llvmpipe (usable if you have enough
CPU, which we generally don't) you generally don't want to actually
have any OpenGL present at all.  Generally it's mesa-demos that pulls
in virtual/libgl, and in master this can be disabled.  This may be
worth a backport if someone wants to backport and test it.

Ross

