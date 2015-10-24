Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id C2F9D60657
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 04:39:41 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so54682037wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 21:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iAQ6v96SW4ayyQ5bDCW8sxUiJAuJp/fGBIbmcmyXuAw=;
	b=RHKINXHqrK9dHu03DMR94PNvC+yHfMvW49a4OCqibWaIABk0s1ICIqz/QvoeBSFhTa
	RpVbwsXDHiw/TeYPi71oR2ew0iNBPeTB4Z4f95EhM/XwfWZeQ5xAh9Ag5d61oBxE3p0u
	+e+lY78E/P90tX3SDbhqd92CyKjkQU7jIgeHNcHlnmEVFwulmmeIHbzpuCRyQgQFaLyX
	jMzWW14BtGZNHuSZQoQ9VNJnTZksvHB/iVLonKbzuderuBA3cUnjFvKe+TnGSkqQQF3I
	Opfn+fDXyXeAVkMMvZEYsNvr1Vs1IsjCMFnFyUU09mFhTKUx5lRkDyqbPiLTKODMjWsQ
	L+mw==
MIME-Version: 1.0
X-Received: by 10.194.222.5 with SMTP id qi5mr8372822wjc.106.1445661580947;
	Fri, 23 Oct 2015 21:39:40 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Fri, 23 Oct 2015 21:39:40 -0700 (PDT)
In-Reply-To: <2f4be637747c4a7eb3f2d5dd7a0b8465@XCH-ALN-008.cisco.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
	<2f4be637747c4a7eb3f2d5dd7a0b8465@XCH-ALN-008.cisco.com>
Date: Fri, 23 Oct 2015 21:39:40 -0700
Message-ID: <CAJ86T=VWjYJLyF9dD6LhGFb1cVyuzxT4gSqcgGLfRsTfT6UCHQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
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
X-List-Received-Date: Sat, 24 Oct 2015 04:39:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2015 at 3:12 AM, Julien Brianceau (jbriance)
<jbriance@cisco.com> wrote:
> Hi,
>
>> It still needs some cleanup before upstream, comments are welcome.
>
> I think it would be great to take the opportunity to clarify license declaration in chromium recipes.
> Currently, LICENSE is set to BSD only for chromium recipes, through chromium.inc file.
> Archives from http://gsdview.appspot.com/chromium-browser-official contain third party source code (ffmpeg for instance) that is not BSD licensed, whereas it is compiled by the recipe.
>
> Shouldn't licenses from 3rd party code compiled by chromium be declared in the recipe as well ?

Yes, they should. The crosswalk browser recipe seems to do a pretty
good job and could be a starting point for other Chromium based
recipes.

https://github.com/crosswalk-project/meta-crosswalk/blob/master/recipes-crosswalk/crosswalk/crosswalk_12.40.295.0.bb

> Regards,
>
> Julien
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

