Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EC6B4763F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 16:57:23 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 191so26265376wmq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=q1FI+8qZR/iVbzAuo00PCkS2RudKGyyjsexP+sY3jwk=;
	b=TqXF+YLajWRZcnGbC6unHVtkOYlAZszsVnkaDa23b1J+uQveEXyu4FqOF4sv0mW/g1
	4sD66AhY08oNUBb+jGFhzgr+xdtgZxPVDOKQ8+nxFk422+ZRaDMcfebSMDy9iHmxBHZs
	k87P7vK18VoPs3ZOg0xDAjX8weCbLn8pTNw/fxAsuwXzUJeG92DWbITjNQoHKOOTxUp5
	utWnMtf98nuP2XmicuZlMNxB3+gVNHZd0oN0omyP+lOICfq1PhJMweswBrhJ20WGPn8o
	9tSXQ1vXBm/8+m8Xzkfey/vhjNa02fXkrnZy/PMktuy/hFF3+O8XPIVRuDcxOcoye8SJ
	qSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=q1FI+8qZR/iVbzAuo00PCkS2RudKGyyjsexP+sY3jwk=;
	b=kjNzbxKJ5l1Ahgs+ihdnf0nNANOSJLdZ2bjknXUDXu17TlmFscSTsi0Nn3qzgvkK5M
	h/atx3UVoCkzOSM97SyX6PiM6ptk2/jqZGPQhIvyVmxNQOu6QfSHDFxDncBjv4/psH+8
	KVwCz8MFAjlOcVbHzCvYtTWxq4ohJCI8tbg9QonzsJKDE8tJiRQzrU0Hb3RqoJATQTIE
	7cStZeW+tJQyBMtCQCrXwwaNLz3zOIgSZoTRH7kFyAH7gLF2lsdBg6m5BbEPF0TyI/zr
	MB39g+3bV/5O8SmTHcJ2gDStc3Z7zbKC5/tXUDeh/gwtCKan/n8Va2zzMR3ML9wvOU9K
	JAnA==
X-Gm-Message-State: AD7BkJIC8mr/vIb/D8zdgQu1V/E+qRgC3PYxvZQ0ICqtfxn4Vaqy++OaKl3VnChUN7GYm8Q2OWi/FKJCOYrYjg==
MIME-Version: 1.0
X-Received: by 10.28.92.13 with SMTP id q13mr4940731wmb.43.1459529843819; Fri,
	01 Apr 2016 09:57:23 -0700 (PDT)
Received: by 10.194.102.74 with HTTP; Fri, 1 Apr 2016 09:57:23 -0700 (PDT)
In-Reply-To: <CAEaCVQjmZGJOX332YqUH8eLOAGURiKXS4-f40P6KqNE7FgZ9qQ@mail.gmail.com>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<20160401133809.GF2567@jama>
	<CAEaCVQjmZGJOX332YqUH8eLOAGURiKXS4-f40P6KqNE7FgZ9qQ@mail.gmail.com>
Date: Fri, 1 Apr 2016 18:57:23 +0200
Message-ID: <CA+chaQfbTZu=JZO2FaLLCSFZtzHpL3=x3qrA16EAWrB=Yx+Unw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Fri, 01 Apr 2016 16:57:24 -0000
Content-Type: text/plain; charset=UTF-8

Then it's probably build time dependency as the warning says, not runtime
dependency like you did.

Read what the component build does, if it checks for zlib in configure then
you really need to add it to DEPENDS not RDEPENDS_${PN}.

On Fri, Apr 1, 2016 at 6:53 PM, Eduardo Silva <eduardo@monkey.io> wrote:

> > +LIC_FILES_CHKSUM =
> "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>
> >
> > LIC_FILES_CHKSUM is relative to ${S}, so LIC_FILES_CHKSUM =
> > "file://LICENSE.. should work fine
> >
> >
> Thanks, I have updated my local copy
>
>
> > > +
> > > +RDEPENDS_${PN} = "zlib"
> >
> > If it does link with libz then the runtime dependency should be added
> > automatically by shlibs code in package.bbclass if it's not the case
> > can you add comment explaining why it needs to be added explicitly?
> >
> >
> I added that because I got a QA warning message:
>
> WARNING: QA Issue: fluentbit-dev rdepends on zlib, but it isn't a build
> dependency? [build-deps]
> WARNING: QA Issue: fluentbit rdepends on zlib, but it isn't a build
> dependency? [build-deps]
>
> what's your suggestion in this case ?
>
> best
>
>
>
> > > +
> > > +inherit cmake
> > > --
> > > 2.5.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>
>
> --
> Eduardo Silva
> Monkey Software
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

