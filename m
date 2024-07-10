Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38B4C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 12:32:50 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.13318.1720614764391276059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 05:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=ZqeeOz4p;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nClmhMy/weVtbzQUy4T2qGLlpCbt8/e5HwhW5Au7gQc=; b=ZqeeOz4pWR8pXJb34VA3Kxj43A
	MnIvQHhpqZrGI8i6cVNPb1RnzIufeSv3ylPyPZax7sUKrWKlrcRq0hHFs7r7hr7ZcXyBFGUt5lWdW
	VHfZ8kZbkzgBidXUMfTh8QWN2fe1o2Dq0uXSKx7b80Ox5i9oAkmxooV6RaOGt260jVJebtDPsQbeA
	pa82URoojXVzdat6N+/wTXI7G3p7JqJhq4ShCkhW483o0OJlXgn46gzqcWSdydM8rT9kKz5j26Wol
	g0vIcQoUijGuap773klYpQWNkH8cD5nRQlGF6VHR/It2Jov3b0vlpG0Ngyd6SxA8TgiWRJP/1bA02
	LHIcID8A==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1sRWUy-000Pz1-Hx; Wed, 10 Jul 2024 14:32:40 +0200
Received: from [2a06:4004:10df:0:6d2e:e61a:64ea:3d39] (helo=Seans-MBP.snzone.dk)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1sRWUy-000I96-2Z;
	Wed, 10 Jul 2024 14:32:40 +0200
Date: Wed, 10 Jul 2024 14:32:39 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	bartosz.golaszewski@linaro.org
Subject: Re: [oe] [PATCH v2] openocd: Enable linuxgpiod build option
Message-ID: <ej55ijthhtuy6umovujf5bay2yx7tuwghblsxlkte4xpwzi46p@a3tqfhoennqa>
References: <20240710104505.1215103-1-sean@geanix.com>
 <CAMRc=MdqzNSUWAkRw_jC+zoiUQ6DY1fXo3b8ehFxQk1sqcGC-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdqzNSUWAkRw_jC+zoiUQ6DY1fXo3b8ehFxQk1sqcGC-A@mail.gmail.com>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27332/Wed Jul 10 10:36:46 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111297

On Wed, Jul 10, 2024 at 01:11:50PM UTC, Bartosz Golaszewski wrote:
> On Wed, Jul 10, 2024 at 12:45 PM Sean Nyekjaer via
> lists.openembedded.org <sean=geanix.com@lists.openembedded.org> wrote:
> >
> > Enable the linuxgpiod via PACKAGECONFIG to allow to use swd via
> > libgpiod.
> > linuxgpiod requires libgpiod 1.x, so it's required to add
> > PREFERRED_VERSION_libgpiod = "1.%".
> >
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >
> > @Bartosz it would be nice to be able to depend on libgpiod-1.x.
> > Guess the libraries could co-exist and then the libgpiod tools could be
> > from the 2.x.
> >
> >  meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > index 559fe29ff..8c411ec5c 100644
> > --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > @@ -51,6 +51,9 @@ FILES:${PN} = " \
> >    ${bindir}/openocd \
> >    "
> >
> > +# To build with linuxgpiod it requires libgpiod 1.x.
> > +# Add PREFERRED_VERSION_libgpiod = "1.%" to local.conf
> 
> Keep this comment but add:
> 
> RDEPENDS:${PN} += "libgpiod (<= 1.6.5)"
> 
> to this recipe to avoid build-time errors when the right version of
> the library is not available.
Good idea.
> 
> Bart

Hi Bart,

I have tried:
RDEPENDS:${PN} += "libgpiod (<= 1.6.5)"
and/or
PACKAGECONFIG[linuxgpiod] = "--enable-linuxgpiod,--disable-linuxgpiod, libgpiod, libgpiod (<= 1.6.5)"

I still get buildtime errors :/

/Sean

