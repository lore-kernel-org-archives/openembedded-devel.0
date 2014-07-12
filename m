Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 878F06FE5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 20:07:57 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id n15so1831548lbi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=t+QiR6UHGwMZbZnJRpVtDlkUOXf/iCKWG/iH06IpAsk=;
	b=u21M+Vq4WJoXtRJ4OdEP10trNg32ZMSmzYHb7SiknaU0RLbDL+5OWZ/uorsk+TWLuD
	jP0PgqANc4RtKawe4uHl+jTjIVFTAt0f1wM1f1abl/bxUheY+DnoyzDe2QWmoL+qSSS5
	dG9wDMcWxCCXF3sa0n2kKTH/wEEa4xXSt34ATn7HMKS/J4T+4y0p94Wl4arBbr3hrruW
	v0dikD9srv/elNBCFaihfQnwyNilFZvdOekZNkBPIQy36WJWGGRq0ihpZgRh7WHseFdb
	dtSH9PdsJ87WUY1fKE5yYdZOxkog6KVaal0LFyXYMfXG63YEEIrNFp0D2WHtrZvt6RC7
	dHJw==
X-Received: by 10.152.20.101 with SMTP id m5mr802588lae.68.1405195678350; Sat,
	12 Jul 2014 13:07:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.168.66 with HTTP; Sat, 12 Jul 2014 13:07:37 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407120725360.20531@localhost>
References: <alpine.LFD.2.11.1407120725360.20531@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 12 Jul 2014 13:07:37 -0700
X-Google-Sender-Auth: QPx2ATn2EjBjGDJ4e-ck78eny7w
Message-ID: <CABcZAN=Qg5nqW=52SvHQ0F_jmp7Ktx6-0yq7HD8gZ1A6aAQQ_Q@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: is it "PROVIDES =" or "PROVIDES +=" for setting an alternate name?
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
X-List-Received-Date: Sat, 12 Jul 2014 20:08:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 12, 2014 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   i notice that the OE-core codebase likes to mix these two forms of
> using PROVIDES. for instance, for a number of libraries to provide
> their basename, i see stuff like:
>
> recipes-graphics/xorg-lib/libxmu_1.1.2.bb:PROVIDES = "xmu"
> recipes-graphics/xorg-lib/libice_1.0.8.bb:PROVIDES = "ice"
> recipes-graphics/xorg-lib/libxdamage_1.1.4.bb:PROVIDES = "xdamage"
> recipes-graphics/xorg-lib/libxfont_1.4.7.bb:PROVIDES = "xfont"
> recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb:PROVIDES = "xdmcp"
>
>   on the other hand, there is the occasional example of the same thing
> that uses "PROVIDES +=" instead:
>
> recipes-support/libpcre/libpcre_8.35.bb:PROVIDES += "pcre"
>
> is there a deliberate distinction made in the recipes between these
> two forms?
>

I don't think there's ever a valid reason to not use +=, unless it
explicitly wants to remove something. That said, bitbake hardcodes addition
of ${PN} to the PROVIDES list regardless of what the recipe says, so I
expect from a practical perspective there isn't a difference. That said, I
do think they should be switched to += to more accurately reflect the
intent, and to improve future compatibility (e.g. if the default PROVIDES
in bitbake.conf were to change).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

