Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE384C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:48:59 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.4944.1637142537012501722
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=OqbIrubD;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from skn-laptop (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id 9E3EBE1CF6;
	Wed, 17 Nov 2021 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1637142533; bh=W+HOWbrbgZkzvUYlxZYIL7peAi6Ygxluq10I5FUBgzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OqbIrubDWEEiUXQd0hYTfcDixP9FhxmcgW5z1Ph64I0i1Y8wDtnuiyPR6OTGu8w1v
	 2jDxfe1WNlNX4dBG9/FLoyajXw7cZczQzJ40gHJvkxHaG/yAcIqByICCwmdrFQvhQh
	 1NIyEMwEsr1MjrDJ+gzSBL4fqsTtNVaYFSSBOtFv0ZZFHnUu30MadxUjsyaeUxpNrr
	 mmARhOtfSSwnXVdwjiRIoCSQKks4mtFl3vg22dHKYzf/8TpgNHUk4QoZOkgihMUBWX
	 0wSENmu/xFWE5Z0KOGXk8bsD0DKMjNBEA1ZQ6UXzd3XHWW97M6X/ceqjPqh0dDwDL0
	 eg2k/lDQYqCHQ==
Date: Wed, 17 Nov 2021 10:48:52 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, alex@linutronix.de,
	Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
Subject: Re: [oe] [meta-oe][PATCH] msgpack-cpp: fix msgpack-cpp is a header
 only library
Message-ID: <20211117094852.eh4tqflwqfzolfof@skn-laptop>
References: <20211117080956.1887223-1-sean@geanix.com>
 <20211117080956.1887223-2-sean@geanix.com>
 <CA+chaQfpssKCeLgvbqo72pz2dyqDCW+oaNv3DWo-kv1u0VONyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: 
 <CA+chaQfpssKCeLgvbqo72pz2dyqDCW+oaNv3DWo-kv1u0VONyQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 09:48:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93993

On Wed, Nov 17, 2021 at 10:28:57AM +0100, Martin Jansa wrote:
> so ALLOW_EMPTY:${PN} isn't needed, right?
> 

Yes :)
V2 is on the way

/Sean

> On Wed, Nov 17, 2021 at 9:10 AM Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > From: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
> >
> > ${PN} is empty so don't let the -dev package RDEPEND on it
> >
> > Signed-off-by: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
> > ---
> >  meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> > b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> > index ef066753d..dc8f13c26 100644
> > --- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> > +++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> > @@ -19,4 +19,8 @@ S = "${WORKDIR}/git"
> >
> >  inherit cmake pkgconfig
> >
> > +ALLOW_EMPTY:${PN} = "1"
> > +
> > +RDEPENDS:${PN}-dev = ""
> > +
> >  BBCLASSEXTEND += "native nativesdk"
> > --
> > 2.33.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#93990):
> > https://lists.openembedded.org/g/openembedded-devel/message/93990
> > Mute This Topic: https://lists.openembedded.org/mt/87115217/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> > Martin.Jansa@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

