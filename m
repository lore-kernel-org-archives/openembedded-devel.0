Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 309FC74663
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:06:24 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id n64so1366744vkf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2018 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vtQ4Qi33sD+m4KuO0OZNpwtoxXwRRkU8xe4DnWDPSY8=;
	b=rHfRqKVUzY2h2YhHr+WFH0rKgz8eVGY6NvhIaNBzvkYG4AZQmNJqpdfuyuALZFHOKs
	6QLis9dWww4JP6Pe/U05dwiMUIukAernmA39udwQjneeN5ZcElUzwm7icW8czLxXJtzX
	rA0KJIvnT3e3jbJFaF3uGjXb3Y9WZpzDZFPSCZsjp+JlFIu+u1EG6bNBetp7uAMCx7G8
	w1pTYV7+tku886DHih6/McnDxZedCLmde8nAmjI0EGlZlcKjytHqUoqNHwGR+17EJfVy
	VDXRPoqyB8BuaV+Yz8me1Umq+7Up2kjkivFPKBNuECYAWESrq9PRfRCCa8SoLlxvjabu
	oX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vtQ4Qi33sD+m4KuO0OZNpwtoxXwRRkU8xe4DnWDPSY8=;
	b=Ze6IrLxy3s68QiSUwIZOzMPzPUFv8Zew8WTj8Ly/kQZ0B5olgUKILjbCyB3COTcbQp
	iHxSsQcOVkjBqJpjvxw79202ISOxXQNq1X2sGDtIMYa8Pi8LmtQ0XBymCuUGUwvutg36
	xDqJLG88lsftKeD7mDnoyWAkRReFOLrhATbM+VX43E7058OU9l7kZijgxYAr+d8kpb1H
	jnCesG1y9e5OnfXW63CYIjEUaVQdvXDdGlLLnWO4NuMYr/P1QwT0g4x94q+A/F42uqhK
	ekKqNdOeX4AFN9Qp42fAtjDZrZF2PwgrXirnHazLdtKbpVY7cuhevG6nJGxCPpUBqT7k
	PYTQ==
X-Gm-Message-State: AElRT7HX8dlQZcaVQsLDTJFjIYNI8E5lbsC5TEQyQnJSAAVqkqinOA45
	FYqO3DfOil+Iot6YYY8HPWeJwQWMHFZpHopB+Hs=
X-Google-Smtp-Source: AIpwx49yN1oWC2vcO8s+++XtI4kBevmPJHs9OgNxA0qwpiraPyaxuH0il34xGOZBm2DVlVk1jIdg0tMHbYtV0JUFGjg=
X-Received: by 10.31.48.193 with SMTP id w184mr7102585vkw.62.1522389985760;
	Thu, 29 Mar 2018 23:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <1522267841-26264-1-git-send-email-mark.asselstine@windriver.com>
	<CA+chaQdHxcNAbn32E+otS_T_y5KCq-WUGD40ihdkfFkDRABOsg@mail.gmail.com>
In-Reply-To: <CA+chaQdHxcNAbn32E+otS_T_y5KCq-WUGD40ihdkfFkDRABOsg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 30 Mar 2018 06:06:15 +0000
Message-ID: <CANx9H-DrUQ4fs-8t=4F=a-WhSE56wF+nQ9J67VZSJ+VJVvDg0A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-jsonpatch: fix do_install
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
X-List-Received-Date: Fri, 30 Mar 2018 06:06:25 -0000
Content-Type: text/plain; charset="UTF-8"

Something like:
FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonpatch:"

Will fix this. It can be in python-jsonpatch.inc (harmless for python2-,
required for python3-). DRY and KISS.

On Thu, Mar 29, 2018 at 3:03 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> This seems to break python3-jsonpatch which won't find this .patch file,
> because it's in different directory.
>
> On Wed, Mar 28, 2018 at 10:10 PM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
>
> > The following error is seen when do_install is run
> >
> > | UnicodeEncodeError: 'ascii' codec can't encode character u'\xf6' in
> > | position 16: ordinal not in range(128) ERROR: python setup.py
> > | install execution failed.
> >
> > This is reported in the upstream project as part of pull request #81
> > https://github.com/stefankoegl/python-json-patch/pull/81
> >
> > Since a release is not yet available with the required fix we must
> > apply the fix as a patch.
> >
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >  .../recipes-devtools/python/python-jsonpatch.inc   |  4 +++
> >  .../Drop-support-for-EOL-Python-3.3.patch          | 35
> > ++++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/
> > python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc
> > b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> > index e559fb1..85483df 100644
> > --- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
> > +++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> > @@ -8,5 +8,9 @@ inherit pypi
> >  SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
> >  SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8ca
> > ad7f34724cb1ea26b27547fd974f1a2153"
> >
> > +SRC_URI += " \
> > +    file://Drop-support-for-EOL-Python-3.3.patch \
> > +"
> > +
> >  RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer
> > ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
> >
> > diff --git a/meta-python/recipes-devtools/python/python-
> > jsonpatch/Drop-support-for-EOL-Python-3.3.patch b/meta-python/recipes-
> > devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
> > new file mode 100644
> > index 0000000..ccd8e12
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-
> > jsonpatch/Drop-support-for-EOL-Python-3.3.patch
> > @@ -0,0 +1,35 @@
> > +From 71bdeed8b49390ff14fe8f0434fc8a1038d89128 Mon Sep 17 00:00:00 2001
> > +From: Hugo <hugovk@users.noreply.github.com>
> > +Date: Tue, 16 Jan 2018 14:22:33 +0200
> > +Subject: [PATCH 1/4] Drop support for EOL Python 3.3
> > +
> > +Upstream-Status: Backport
> > +
> > +[MA: remove dev only files from patch]
> > +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > +
> > +---
> > + setup.py      | 2 +-
> > +
> > +diff --git a/setup.py b/setup.py
> > +index 0776c41..471c433 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -58,7 +58,6 @@ CLASSIFIERS = [
> > +     'Programming Language :: Python :: 2',
> > +     'Programming Language :: Python :: 2.7',
> > +     'Programming Language :: Python :: 3',
> > +-    'Programming Language :: Python :: 3.3',
> > +     'Programming Language :: Python :: 3.4',
> > +     'Programming Language :: Python :: 3.5',
> > +     'Programming Language :: Python :: 3.6',
> > +@@ -81,5 +80,6 @@ setup(name=PACKAGE,
> > +       package_data={'': ['requirements.txt']},
> > +       scripts=['bin/jsondiff', 'bin/jsonpatch'],
> > +       classifiers=CLASSIFIERS,
> > ++      python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
> > +       **OPTIONS
> > + )
> > +--
> > +2.7.4
> > +
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

