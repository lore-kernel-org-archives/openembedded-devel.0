Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D099B6011B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:44:04 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id e190so48491717lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=oK/Ax8ZWSEMhtXY0x5YyW+gK5lTxE2KrgZLrXOuVahg=;
	b=URo91BNFa5PyCDPxQ1NKPfvgdfsE2sfx+P7jDpVV8f6kOLJBUbeYlixriKCsjE3zk5
	85P7azZ1dHthfvpgCoR0l0/pCQL6aFzml0U8cJONGLRD9Gt9i6JwZt7p20Hi7Qby1geT
	JSn4Ul1ogpBAUCNqt4bv/NK9W3lw7IpBQP7CvrpE+PdeR+pUlwWbyyyukbjyMWYUjzJu
	iTD27qlFrr6wj1uFZ1MtV8tkkaJ6Qw4k3VRI7W1EmoluSFBO1asqIAfJNZ0GuxxZtHol
	s17fmlYSN+fYddIsKpXN15CEyzN8MT42Ov+u9g9J0oHG6oJ7GHpWLjPJxlK+bJM2kWEC
	q/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=oK/Ax8ZWSEMhtXY0x5YyW+gK5lTxE2KrgZLrXOuVahg=;
	b=TAL1buuhN2QqDa3hKEah6bAPSeyhXJGEdI9gTcX2sgw2cutNbJfwbgZAgdM7xXdHtM
	H3wF8om/HAgLoCCDbwMbpakuTb4OkUIcwX5Kz/gWQMOEVqu5n3Ck3DnVVi4htNq1V2oC
	pX9vjsyC6/ue7AoYiYmWajSAtn4Fz633BsdH51x636QYapZLRGl3+PWNmlS3DoNZ3L2f
	ojgt6Vw5NRiM+z/UnKCyftf25CM91pCbYKWQiygigxD5Neng5rr9jgP+4Z8VyO50d1K8
	HElOk3lYTONz5RgtBC56XGuU7PNviZy9UYXpf4uQpcOnKzIpO1p5yK0AP80j+lt9DxWx
	KciA==
X-Gm-Message-State: AOPr4FXMpviBq3F7v2kAJmlmquiYAkPazvGAjLxuB+f7ma0DRG+OlaWrbsgSvQTAYgqKyhE7vTXuuS5X+GJ9NA==
MIME-Version: 1.0
X-Received: by 10.25.32.65 with SMTP id g62mr4630024lfg.138.1461185044279;
	Wed, 20 Apr 2016 13:44:04 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Wed, 20 Apr 2016 13:44:04 -0700 (PDT)
In-Reply-To: <20160420182528.GM16135@denix.org>
References: <1460061600-28075-1-git-send-email-denis@denix.org>
	<20160420182528.GM16135@denix.org>
Date: Wed, 20 Apr 2016 22:44:04 +0200
Message-ID: <CA+chaQfEgVEExME523XvcqQBc53U3WVuFO48s6ArMkpmt8kW8g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] ne10: use bb.debug for debug messages
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
X-List-Received-Date: Wed, 20 Apr 2016 20:44:05 -0000
Content-Type: text/plain; charset=UTF-8

When everything is at least once tested in my jenkins builds and I've time
to go through the list of pending changes.

I was away from computers almost whole previous week, so there is longer
delay now.

On Wed, Apr 20, 2016 at 8:25 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Ping. Also in master-next for over a week - how often does it get merged to
> master?
>
>
> On Thu, Apr 07, 2016 at 04:40:00PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Moreover, the messages are misleading, saying "Building for arch blah",
> > even when this recipe is not being built. It merely checks if the recipe
> > is cmaptible with the currently used architecture.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > index 4d753a0..de97982 100644
> > --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > @@ -20,10 +20,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
> >  python () {
> >      if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES',
> True).split()):
> >          d.setVar('NE10_TARGET_ARCH', 'armv7')
> > -        bb.note('Building Ne10 for armv7')
> > +        bb.debug(2, 'Building Ne10 for armv7')
> >      elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES',
> True).split()):
> >          d.setVar('NE10_TARGET_ARCH', 'aarch64')
> > -        bb.note('Building Ne10 for aarch64')
> > +        bb.debug(2, 'Building Ne10 for aarch64')
> >      else:
> >          raise bb.parse.SkipPackage("Incompatible with archs other than
> armv7 and aarch64")
> >  }
> > --
> > 2.2.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

