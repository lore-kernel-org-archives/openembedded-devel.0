Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 554BA608B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 21:04:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h14-v6so9351952wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nQdTZJdOUtK1DlfQ0BdFhNobfo/0f6nQU1KuIJ7D7cc=;
	b=c/Ezf8IC/ZIqrAvFFhC+VviKbqkJml4E7ip4T5dr5wbiaeHkrZHUzmxfShpXUZZI4V
	YzFYinUq4DohFH2qF7G0MnXfMUoMqcZJ72JmNNQKDBwGwYQMC5vwRPoU9CfpU6kyyOhZ
	SK0cr6AeD77y0zrd3x+rNBLYjaVk+IAJkAregymvgr1Gou6WfWjsmuezNWYHK3Iw2aOE
	6X+rq7Iu+4v9rOMqtNaX1DJ27IHFlJVJrI/6MxKB1otUB0a9Qi6uf4z4bu+EHICeTO82
	K8NF5am2d/kG1b/2TzJeV6CotcQIv5Q5Jumhqon4/sj60nmD9ZI7cs3aO0KmXxd8lulz
	Obwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nQdTZJdOUtK1DlfQ0BdFhNobfo/0f6nQU1KuIJ7D7cc=;
	b=MD4D29n3mfEdHgZpGC+cSjmLfn7cMON4ys+00422KY92lA1kf+gOiNGL2oUnq49dNl
	pWA4Qa6B4BmtqPh/08cPhgSMQGi4+0ub2OluTKqdbh1FFlqhEA0ydqVJ89eOUKAOJl5y
	vpRLR5IT+une0fAEcdK9ESu2se7LBkVSj8kRoMSlpoZVvSD3Y7ngmZ5N+pPuHPEmPZDw
	OAr4MZLsN89vblV0RNwDTW1Ecr+JtKAPSnWNUO3mloXe3RJ3LufZQs9tz2kU7XDoOaRM
	w66UbRzgeRksYrKOKXop9ecJ6W34yFhA5+rSvYEUh5irwheoKkNxBkYYb89ELidqRIaZ
	tCMA==
X-Gm-Message-State: AOUpUlGYTA5+1dBSFbAUZ6WevYzEw8f+j0dMGhvZABZGJ18QemOzKi2m
	5aYb7ei/tIc3EPTrQYcI5NET1ZQFw8tFn1w7uk0=
X-Google-Smtp-Source: AA+uWPxbgsaEWv+KgotZpfTkwV8YtQ0Ic1j8nJ3+paKXL6vKZpGdeI7lTxmy2TZpTJTqvafDTaBDBeBqLTexFe8j28w=
X-Received: by 2002:adf:aadb:: with SMTP id
	i27-v6mr5186277wrc.149.1533935057899; 
	Fri, 10 Aug 2018 14:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <1533682863-25087-1-git-send-email-alex.kiernan@gmail.com>
	<CADseiPmto9xeXiAmpGQ88GksoCw0qjgJzhjC=VFaxCksYdAExg@mail.gmail.com>
In-Reply-To: <CADseiPmto9xeXiAmpGQ88GksoCw0qjgJzhjC=VFaxCksYdAExg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Aug 2018 23:04:07 +0200
Message-ID: <CA+chaQfT5qC=3L4jNVS6pUHg1Us5Mg26xK9s0F+sO5oHFOjE8w@mail.gmail.com>
To: ian@boundarydevices.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: alex.kiernan@hivehome.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-m2crypto: Move swig fix to configure task
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
X-List-Received-Date: Fri, 10 Aug 2018 21:04:17 -0000
Content-Type: text/plain; charset="UTF-8"

Depending on in which order the changes are applied you might want to
remove CLEANBROKEN added in:
https://patchwork.openembedded.org/patch/153208/

On Fri, Aug 10, 2018 at 10:52 PM Ian Coolidge <ian@boundarydevices.com>
wrote:

> Thanks for this, this fixes that recipe.
>
> On Tue, Aug 7, 2018 at 4:01 PM, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
>
> > From: Alex Kiernan <alex.kiernan@hivehome.com>
> >
> > Fixes:
> >
> > | DEBUG: Executing shell function do_configure
> > ...
> > | SWIG/_m2crypto.i:10: Error: Unable to find 'gcc_macros.h'
> > | error: command 'swig' failed with exit status 1
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python-m2crypto_0.26.4.bb
> > b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> > index 272c76c..7e22163 100644
> > --- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> > +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> > @@ -27,7 +27,7 @@ export SWIG_FEATURES
> >  # Get around a problem with swig, but only if the
> >  # multilib header file exists.
> >  #
> > -do_compile_prepend() {
> > +do_configure_prepend() {
> >      ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v
> > __REGISTER_PREFIX__ | grep -v __GNUC__ \
> >         | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' >
> > SWIG/gcc_macros.h
> >      if [ "${SITEINFO_BITS}" = "64" ];then
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

