Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5C75F7468F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 08:22:28 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id d1so7401703wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 01:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r+GOURIhkrluIfHeh8fxG8ou9Jz0/9PNepU7VCX//b0=;
	b=B9n+zLbSlmUiAjyigxyKmTDT2yWP1Opa+TUvYFwng3/ijbzSethp+Ekq4c6ej19V5X
	wwrek/lG+Y2y7rPQp+HQyVHYfgre1d8FExsGv6Zk4uXQjpnrdjiRMz+kxgTkscli9UrX
	hhy/aZKfRn/EkaQV0kfBGLm8T0FVxtbORb9VxoGOmRdR91SYZ3uhgkCPX5U5H7xipRCG
	qPSLM0HPQZjHKxOXZQPHWT9W0IUqM/+uUPD7CfNEhctmug5DRSNctKq99wAOVrkAVnQq
	7n1e+IUA9MgntkJQJUZDf6Qdunit1QZeIp9ptVB0Jlv5UVH4gM5WfWYOsig3PJEoCUXQ
	QljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r+GOURIhkrluIfHeh8fxG8ou9Jz0/9PNepU7VCX//b0=;
	b=i7R2NohpX8vDlYONe6/PhUJxWkjTUMH6wLIuT1vMzgEeT+vwu6MK6LMdv3ZvGX3WqQ
	d1jLfl2Fl+JrfYTEgJPVH+SMusbF9OXAFWDsXED8Uyj6giVxVXRpk1Z0ZrSmF2vat3YO
	ZnvdXLBkVx8HjkKVrRAqe0cEYekMru1AkwDg5fujBPFBNX7N8PxhI3Aic4oLIdzuIGzw
	UluPmD9pc0rIf7flUPnxUrL/OZ/Y8rvC1Ge5HBtWR+JHDQ01g9wYWs/aTT8WQwlKR8pP
	58Lymn7/ByaaNctO5fsHA7TYGCOe66TUnLA9AEdEGsNQFqLlWB/u3s+ct6fvWTIGJmR8
	zfFw==
X-Gm-Message-State: AElRT7H6j5MNySNNW6K1oi8V18mV1Eyz7XxYAPgeIltoeO39nJxksIY0
	qExra/Q8RdUUEocloyUOInZThepmBuOrKFacHt8=
X-Google-Smtp-Source: AIpwx49+tjd45omUyWRSNXh7TfyqLGXGeMFQT6STiTOoE3OOFwVufuX05tAX+ofpomhxj2tU9ES1NrXba4shimLL7b4=
X-Received: by 10.223.134.4 with SMTP id 4mr8743985wrv.230.1522398148824; Fri,
	30 Mar 2018 01:22:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Fri, 30 Mar 2018 01:22:28 -0700 (PDT)
In-Reply-To: <CANx9H-DrUQ4fs-8t=4F=a-WhSE56wF+nQ9J67VZSJ+VJVvDg0A@mail.gmail.com>
References: <1522267841-26264-1-git-send-email-mark.asselstine@windriver.com>
	<CA+chaQdHxcNAbn32E+otS_T_y5KCq-WUGD40ihdkfFkDRABOsg@mail.gmail.com>
	<CANx9H-DrUQ4fs-8t=4F=a-WhSE56wF+nQ9J67VZSJ+VJVvDg0A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Mar 2018 10:22:28 +0200
Message-ID: <CA+chaQfskAgYTHg76LXDYvHSdyDdeZFd47atA0yafVw14aVTWg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
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
X-List-Received-Date: Fri, 30 Mar 2018 08:22:28 -0000
Content-Type: text/plain; charset="UTF-8"

Or it doesn't need to be applied for python3-jsonpatch at all and the
SRC_URI change should be moved to python-jsonpatch_1.21.bb.

At least in my world builds I haven't seen this issue with python3-jsonpatch,
only with python-jsonpatch.



On Fri, Mar 30, 2018 at 8:06 AM, Tim Orling <ticotimo@gmail.com> wrote:

> Something like:
> FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonpatch:"
>
> Will fix this. It can be in python-jsonpatch.inc (harmless for python2-,
> required for python3-). DRY and KISS.
>
>
> On Thu, Mar 29, 2018 at 3:03 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> This seems to break python3-jsonpatch which won't find this .patch file,
>> because it's in different directory.
>>
>> On Wed, Mar 28, 2018 at 10:10 PM, Mark Asselstine <
>> mark.asselstine@windriver.com> wrote:
>>
>> > The following error is seen when do_install is run
>> >
>> > | UnicodeEncodeError: 'ascii' codec can't encode character u'\xf6' in
>> > | position 16: ordinal not in range(128) ERROR: python setup.py
>> > | install execution failed.
>> >
>> > This is reported in the upstream project as part of pull request #81
>> > https://github.com/stefankoegl/python-json-patch/pull/81
>> >
>> > Since a release is not yet available with the required fix we must
>> > apply the fix as a patch.
>> >
>> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> > ---
>> >  .../recipes-devtools/python/python-jsonpatch.inc   |  4 +++
>> >  .../Drop-support-for-EOL-Python-3.3.patch          | 35
>> > ++++++++++++++++++++++
>> >  2 files changed, 39 insertions(+)
>> >  create mode 100644 meta-python/recipes-devtools/
>> > python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc
>> > b/meta-python/recipes-devtools/python/python-jsonpatch.inc
>> > index e559fb1..85483df 100644
>> > --- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
>> > +++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
>> > @@ -8,5 +8,9 @@ inherit pypi
>> >  SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
>> >  SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8ca
>> > ad7f34724cb1ea26b27547fd974f1a2153"
>> >
>> > +SRC_URI += " \
>> > +    file://Drop-support-for-EOL-Python-3.3.patch \
>> > +"
>> > +
>> >  RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer
>> > ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-
>> > jsonpatch/Drop-support-for-EOL-Python-3.3.patch b/meta-python/recipes-
>> > devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
>> > new file mode 100644
>> > index 0000000..ccd8e12
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python-
>> > jsonpatch/Drop-support-for-EOL-Python-3.3.patch
>> > @@ -0,0 +1,35 @@
>> > +From 71bdeed8b49390ff14fe8f0434fc8a1038d89128 Mon Sep 17 00:00:00 2001
>> > +From: Hugo <hugovk@users.noreply.github.com>
>> > +Date: Tue, 16 Jan 2018 14:22:33 +0200
>> > +Subject: [PATCH 1/4] Drop support for EOL Python 3.3
>> > +
>> > +Upstream-Status: Backport
>> > +
>> > +[MA: remove dev only files from patch]
>> > +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> > +
>> > +---
>> > + setup.py      | 2 +-
>> > +
>> > +diff --git a/setup.py b/setup.py
>> > +index 0776c41..471c433 100644
>> > +--- a/setup.py
>> > ++++ b/setup.py
>> > +@@ -58,7 +58,6 @@ CLASSIFIERS = [
>> > +     'Programming Language :: Python :: 2',
>> > +     'Programming Language :: Python :: 2.7',
>> > +     'Programming Language :: Python :: 3',
>> > +-    'Programming Language :: Python :: 3.3',
>> > +     'Programming Language :: Python :: 3.4',
>> > +     'Programming Language :: Python :: 3.5',
>> > +     'Programming Language :: Python :: 3.6',
>> > +@@ -81,5 +80,6 @@ setup(name=PACKAGE,
>> > +       package_data={'': ['requirements.txt']},
>> > +       scripts=['bin/jsondiff', 'bin/jsonpatch'],
>> > +       classifiers=CLASSIFIERS,
>> > ++      python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
>> > +       **OPTIONS
>> > + )
>> > +--
>> > +2.7.4
>> > +
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

