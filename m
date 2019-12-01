Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 30B4B7F62D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 17:35:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47QwP35PT7z4J;
	Sun,  1 Dec 2019 18:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575221704;
	bh=WNGlbrU7Ow0bFTD19DeEZMK+Fh6f39ErUB25ORa3SzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IY9TzdiH0ro1wjKkkWyrqz/3vTRLZJzipctwXVHmvgoXbpKOQiGWSDxKKP9wqVsl9
	axFyxDN1pYKplqNmhWOey+yWpy8Xu9YfA7dXADx97emxfvia7aA6AWE/ea1357jh9y
	dtlllNDK+jllvU2FmR5KUlqYHLrfxHSs05nm8UuUsvhDRpt0FDHq/61bjec2vud1jS
	tlsxlG4xM4iMzxJeqQeLD7FVqO4IDmHQy+R/qtCMP0xZCeZvpl2JxL/U9812y6h7Tz
	k0RZXwwABscEZJau0aKE9XspWoU0MMtI3TNa9J1kS5PU8KXFFVI1SiRPljumMrBE71
	68oXxyo2ZVDVZ/i7gtHTDIySdG23Dn9FUzxdMzTYdIxnQYwZi14FBWPWeotqFDVdap
	XMYdGV32yB6NjB74GqbCW/n7BEaxGIBbsjnzIWFJaTkeUZ4/g+z0tdjGkoKbybl3gc
	sfxlSVnSZ54rA6dJhk44pmlsOB/lbjIxQPD1YbHdDkzmeODcMzjyu4FE7tvOvyCWq/
	vJksdX5iYps7KP0sm3DMBSy4wCCAoaPhI6pkp/2UmXlptx4TDRhBOfK8gfZ/sMF3Cr
	jrdElYIjXywiziqldnSqeETzLmnuluG+KBoppSV00gWWlSa5zVRtDPe8w5/EwvG4ZJ
	kJda1xWe/yUD4SZjYUWE2qpo=
Date: Sun, 1 Dec 2019 19:35:01 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20191201173501.GJ4526@localhost>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/7] libgnomekbd: cleanup DEPENDS inherit gsettings / remove unused config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Dec 2019 17:35:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Dec 01, 2019 at 05:51:17PM +0100, Andreas Müller wrote:
> * DEPENDS: ... gtk+3 pulls glib-2.0
>...
> -DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
> +DEPENDS = "gtk+3 libxklavier"
>...

It is better to have explicit dependencies on everything used directly 
by the recipe.

gtk+3 -> glib-2.0 is not a dependency that is likely to go away in the
future, but in general relying on indirect dependencies tends to break
frequently.

cu
Adrian

