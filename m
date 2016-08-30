Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2F98560746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:11:43 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id f93so7863966lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=MbI5KcvxeoHkZAZOO4vJ+pQFqvBMf5fNwxWwDkC6sb0=;
	b=0qFwccM0nq7O5W0hv+BZUpEGemKEHe9hu048ZZi6VByD6KCGigvllSSpnY0GguazSn
	Cb0plZXqfOxuOsvYgow5ZlVgaRGIz4aLsC5GXdw2Edksmt0akDp4d97H9aUoJeiwsnay
	L7bUV2ziT+9Af+sQpPExSXTixpRImzKSbFMkCvOOhMsnCgiZV5alY5AfNFs0qN50/FUa
	Ki9MWLlNjxTyClqOtuuU6m1YCwhospN/8YKZUwPDYXETUtBx9/QgNztD64PBu/bFgl4U
	6I9WKoRQyJfXpzlR2Fjgyyeox2po1MJwjl4saJOjTCeFml0ov5+Q1DX/HhjFGUZgVpTr
	P31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=MbI5KcvxeoHkZAZOO4vJ+pQFqvBMf5fNwxWwDkC6sb0=;
	b=mDvM1Oq1sWSFR29X4NIQgkKzrKY7KA9Bom4hvPTfLQXQhPaCV+puwjPk0q4YMTxxv4
	bhK5+3XLVrZf5TyvfItYxlbZ7Tlf9fJbGK4zDwclABkciP1uHVy6E5vwB//vd/3gZPoh
	qggPGfzQmZp5vAnYrvo5ApAeMiCGhwflo4xx+7erXPqRB+UqM8WmqjdVbPF+OHi/x+qD
	sZSBAuPSBe1YvgVB1IjZdxdkrUGet65B9JNPAulNRHjuaMJOlehOhtXfbgn8q8omUzGq
	z++zjTeaub2e1xIFcASqDysl3sQ5rzAaFzcRftChetmEiFbLJkBFzCGLlrOzGuNzGVc8
	CJzA==
X-Gm-Message-State: AE9vXwOWJK8eOVHSPxC1JYO4W3LqYV3jwqAGZ77WPfQP6I+Pz+0FSu5VXPYEqWxIsJ72QNezD6ZvZW8DmifIFg==
X-Received: by 10.25.1.213 with SMTP id 204mr681779lfb.114.1472544703661; Tue,
	30 Aug 2016 01:11:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Tue, 30 Aug 2016 01:11:42 -0700 (PDT)
In-Reply-To: <CABcZAN=MKN8uaXcCecR9f7Rv2NAXzFutN3q9qsTKkOnjzjAQHQ@mail.gmail.com>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
	<CABcZAN=MKN8uaXcCecR9f7Rv2NAXzFutN3q9qsTKkOnjzjAQHQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Aug 2016 10:11:42 +0200
Message-ID: <CA+chaQeQfTsyAzwaV+Qtkd4tMW-Jyvh4uRigb11jmGXda+2ZvQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Tue, 30 Aug 2016 08:11:46 -0000
Content-Type: text/plain; charset=UTF-8

Are you willing to submit such change to meta-oe?

I don't use geany, so my whole motivation was just to get rid of new
warnings in world builds.

On Tue, Aug 30, 2016 at 3:02 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Mon, Aug 29, 2016 at 1:52 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > * since last changes in oe-core LICENSE variable needs to list all
> > licenses used
> >   by individual packages otherwise bitbake warning like this is shown:
> >   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
> > plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses
> > (GPLv3) that are not listed in LICENSE
> >   as possible improvement you can set LICENSE to GPLv2 to all plugins
> >   which are GPLv2-only, because now they will "inherit" both GPLv2 &
> >   GPLv3 which sucks as described here:
> >   https://www.mail-archive.com/openembedded-core@lists.
> > openembedded.org/msg81645.html
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
>
> Would be nice if we had a general way to change the inherited LICENSE as
> used by the binary packages. Adding a single indirection to package.bbclass
> to default to LICENSE_DEFAULT rather than LICENSE and defaulting
> LICENSE_DEFAULT to LICENSE would do (or similar), then this recipe could
> set LICENSE_DEFAULT to GPLv2.
>
> In the meantime..
>
> We have a bbappend in meta-mentor for this on a branch which handles it for
> this recipe reasonably, I think:
> https://github.com/MentorEmbedded/meta-mentor/pull/843/commits/d852857
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

