Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.529.1587775674982867380
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 17:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm3 header.b=lUx7oymd;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.27, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D36C5C01A4
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 20:47:53 -0400 (EDT)
Received: from imap26 ([10.202.2.76])
  by compute3.internal (MEProxy); Fri, 24 Apr 2020 20:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=JxV0iB1Ty0bJYM1op7zeGwc31MjJoj9
	n3SL7IMI32oU=; b=lUx7oymduod4l8QRMEovZmQ8u4JY+BLLJUJiCe7nRRMeNPH
	bkuGliQujHMDW3whNRhyOVtc9q3luxhVTpFzcwzVq1g9hl4daMSVOir1QadOSBvB
	bJTQ3rU1ELiym56xcUCJS3pjpik6t7y4eJC+VLd6CjTya1c1zW1B508fIyuKS8Lb
	wJ5xEnG5qieV7+5Lv/iZo3TCsfdNJ/pHGgmVBMYUYffO9IplkhTeuUzvCfk7PUVM
	9DyomW/f/2X/syvsBTNdjIcURTU3MLIo5+dVYbsaROZ22AwVscbI3xAU+b5nrfmp
	KeihSHjTBOLKlkMGuKft9KcGEwwSKPsPB4hGrWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JxV0iB
	1Ty0bJYM1op7zeGwc31MjJoj9n3SL7IMI32oU=; b=fj8FQbhehWdmIyERjM/BGJ
	lKdBm5UibgZOeR9dWhLveUiPEK8IQN5epsPBLOyiYtRMVyOzz67b5Wz+EqtCdPrN
	1YqUfS2QdnqFgQmKGfo/2lo+FZ+k2OyNkmpk1iL1UV7SU5TiCteC8200An8XyM7v
	jzwyb2Le6Mx+y6xpb4DunJ26nmtsVs5tbtmT0oV/JD1gOGs7FJqXRdKAs/eG7urE
	cAXVVK3o8+HLmXvkRHZWnn4PA6QSbIOKjzXzRMQf8ky8p41KEAWWNC/9fA22nAJx
	+DnIDnk4XALWo+uv2dLjtP1b7BwcDAeXSTawulWvE5kL0yFO6UdIOxl8zyXk3VQA
	==
X-ME-Sender: <xms:uYijXtNVChUjpFgB2_ta_tXn0erfxJhX2RTNSKnEygOC-AFSuCRANg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedvgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomheptehlihhsthgrihhruceorghlihhsthgrihhrsegrlhhishht
    rghirhdvfedrmhgvqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpd
    hgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlh
    hishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:uYijXkO5ACV1SrnOmpkYxAV2dFW593CGjdmlJJvhn_48Qo2SM8V0CQ>
    <xmx:uYijXv0G1k05z8klkFD0gvyH6mxZXrCpl31inJwe_BRfQE8VZMyXTw>
    <xmx:uYijXo1Y0J0VbffElbeYNUfZL9FGxhx0bIuDr9ly0eG7Q3_gIOOH5w>
    <xmx:uYijXizGA0ZxlRJL09uoSvBGYjSBkDZwR7-8PwallCaHo1TcLu7Lkg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4255814200A2; Fri, 24 Apr 2020 20:47:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <ee033791-f139-45a9-b8b4-4cbd68962744@www.fastmail.com>
In-Reply-To: 
 <CAMKF1srb+fSYRjhBjmA+dH7HN_M+rckXJj+f5y0T8JPn4fQ1hQ@mail.gmail.com>
References: <20200424063130.386675-1-alistair@alistair23.me>
 <CAMKF1srb+fSYRjhBjmA+dH7HN_M+rckXJj+f5y0T8JPn4fQ1hQ@mail.gmail.com>
Date: Fri, 24 Apr 2020 17:39:24 -0700
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] libgit2: Update to v1.0.0
Content-Type: text/plain

On Fri, Apr 24, 2020, at 2:16 PM, Khem Raj wrote:
> This update has some issues
> 
> Fails on qemux86/clang
> https://errors.yoctoproject.org/Errors/Details/407382/

I tried to reproduce this with:

MACHINE=qemux86 TOOLCHAIN="clang"  bitbake libgit2

but it build for me. What am I missing?

> 
> for glibc/musl there is another failure which is caused by this
> 
> https://errors.yoctoproject.org/Errors/Details/407386/

I have a patch for this. I'll send it out with v2.

Alistair

> 
> On Thu, Apr 23, 2020 at 11:31 PM Alistair <alistair@alistair23.me> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> > .../libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > rename meta-oe/recipes-support/libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} (64%)
> >
> > diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> > similarity index 64%
> > rename from meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
> > rename to meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> > index 9b9c19104..fd26a0fe9 100644
> > --- a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
> > +++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> > @@ -1,12 +1,12 @@
> > SUMMARY = "the Git linkable library"
> > HOMEPAGE = "http://libgit2.github.com/"
> > LICENSE = "GPL-2.0-with-GCC-exception & MIT"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
> >
> > DEPENDS = "curl openssl zlib libssh2 libgcrypt"
> >
> > -SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
> > -SRCREV = "106a5f27586504ea371528191f0ea3aac2ad432b"
> > +SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
> > +SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
> >
> > S = "${WORKDIR}/git"
> >
> > --
> > 2.26.0
> >
> > 
> 
> 
> 
