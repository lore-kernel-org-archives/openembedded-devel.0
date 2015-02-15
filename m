Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB43606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 21:34:27 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 9so11818539ykp.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 13:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=pFOLKODmfh3zY8Grmk4oW26xs7rB8fmJMLyI/XcC3X4=;
	b=nk9VGXRNKEyS35pT1uJsFIfGZSi1HehyxA/PzaqJIkfY0Q6GCSENnyovYKGm1SW/pY
	B18v7qA2Ww0LPKcF6BIkWtLAgfkZbO5IZMCcgmmiHz6Xo1nK/HGGgY+78MPaWubjCygG
	wWpKsIEGZVLnVLjD4RDgp8QPbO4ScOaleJZk/Y5ieK/XPD2alMwcXBJI4BLuFyVEb/Ts
	5gvqcSNFwKhFnhFtGLMhxd6LZThPnjj+qWUGhN4moTAEg4kzAxV/pqgaW+GyGrNhFp96
	sjs5YiJqilD8VfIBPEKk+wyO09S30q/F4HAdaWPsF9NxkHAGNehX9iQGRv0hKNN6Zjog
	3ySw==
MIME-Version: 1.0
X-Received: by 10.236.22.71 with SMTP id s47mr14538713yhs.37.1424036068422;
	Sun, 15 Feb 2015 13:34:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Sun, 15 Feb 2015 13:34:28 -0800 (PST)
In-Reply-To: <54DF0A5A.80700@pseudoterminal.org>
References: <54DF0A5A.80700@pseudoterminal.org>
Date: Sun, 15 Feb 2015 19:34:28 -0200
X-Google-Sender-Auth: OtWMclDgQcrdERlExvwJ8UfZ8u4
Message-ID: <CAP9ODKpqBjbbSam7+p0cvYKQUwyAsa9tK24DTo+-=uGofJs9cQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Question about RDEPENDS and RRECOMMENDS
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
X-List-Received-Date: Sun, 15 Feb 2015 21:34:28 -0000
Content-Type: text/plain; charset=UTF-8

Hello Carlos,

On Sat, Feb 14, 2015 at 6:42 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
...
> So, it would make sense to establish some sort of dependency. But how
> exactly? I thought of something like this:
>
>   RDEPENDS_gstreamer1.0-plugins-imx-imxaudio =
> "gstreamer1.0-plugins-good-audioparsers"
>   RDEPENDS_gstreamer1.0-plugins-imx-imxvpu =
> "gstreamer1.0-plugins-bad-videoparsersbad"
>
> but then I also need to add gstreamer1.0-plugins-good and
> gstreamer1.0-plugins-bad to the DEPENDS list, otherwise I get a warning
> like:
>
>   QA Issue: gstreamer1.0-plugins-imx-imxaudio rdepends on
> gstreamer1.0-plugins-good-audioparsers, but it isn't a build dependency?
> [build-deps]

> But if I add these recipes to the DEPENDS variable, then the RDEPENDS spec
> is pointless, isn't it?
> Another option would be to use RRECOMMENDS instead of RDEPENDS, but I am not
> sure if this is such a good idea.

The border line between RDEPENDS and RRECOMMENDS is very thin. The
rule that I use is basically:

 - if something requires A to run - RDEPENDS
 - if something is usually used with A installed - RRECOMMENDS
 - if something can make use of A in some cases - RSUGGESTS

As you said "It is possible to install gstreamer1.0-plugins-imx
packages without these other packages." it seems to be that the right
one is RRECOMMENDS so all users will have those installed by default
while you keep the possibility of skipping (using BAD_RECOMMENDS) for
advanced users.

Just for completeness, the QA issue about missing build-dependency is
something we should pay attention to but it may be a false positive as
in your cause you don't depends on them for building, just runtime. So
you can whitelist the warning to avoid the noise but adding the
depends would be wrong.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

