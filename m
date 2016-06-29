Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB3960043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 20:14:22 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l184so6171845lfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mWZOBWsbeMWj1olbBT1HrsXVUJXwis1vXlFJr89Elsk=;
	b=NO1DHQuI9mF8Ao6QdJ1o9MhD0uM0mzmWMRCO/UItC0ZJhqLsR1QjfaxbXZNx++tqKW
	dK/dOfDLwnkMBIUGTL8kUTiHvlCaDPtf3/YQWSbpJStsCQBWtRZbQLGnQzZG/nYoDfiS
	a+iNnS9nb84ZuJboci0aR8hLJmrELwijwXoUwCpe0mLbsf7XQnpoqRIH+efulCMijpsd
	2sMyG961o9v+NLENVyNXaIUcGwY9GGOcMejfZ7z0x2xqVvn0ljpgLg1jkvJL6McnEMW3
	ei6ur5SRIppj9Rb9QJnZPksU7HHy65rMwVfafwhaxR3z948tnzsOWlOHa8kSydYQdan8
	NZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mWZOBWsbeMWj1olbBT1HrsXVUJXwis1vXlFJr89Elsk=;
	b=WTWfbfvqODYrfSXziBtkchak7bxwwwzrerWlnu5Kp7CXpsPaVwmr74Hf7BlkYVlYPA
	SiThOVYuyBZTQ/WOgIggQZ0YFiCEQB1915IDxP7ZVnUrF1Lsu2HOe8Ixvf4kvxuEy7ne
	5e3tSI01g10h6ehSuX1BkOPA5yacGLDxaikxsBc4dYylMK5q0g7Ppcm4jJJYoZzC5QIx
	9ZJ9QprinpH4ViEY6KDeXNon5hzU8p8AAt08jw+X/ILFdOtBd48TzfX/cXxOLhRvjfy7
	wCYDBvRoX9gJMhAV9wgDF8bGYLEjllGYUNWzsmf73vKjStv3z5/GySKcmzvnqUs3Kf+Q
	4Sbw==
X-Gm-Message-State: ALyK8tKfW1/w1FW1Qxfun8XBw0wnUJbkqMK6SpSjmRor0f2GKKcXGZUe4pyaQWhYt6b9NWNfJFMPJQ1662+kVg==
X-Received: by 10.46.1.196 with SMTP id f65mr3184362lji.24.1467231263012; Wed,
	29 Jun 2016 13:14:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.160.133 with HTTP; Wed, 29 Jun 2016 13:14:22 -0700 (PDT)
In-Reply-To: <CANx9H-AkBLNPRSMXkHe_rspjFTcTrNaSJ=GU_1kSZy6upnXe5g@mail.gmail.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
	<1467188567-28145-6-git-send-email-mingli.yu@windriver.com>
	<CA+chaQcPagpczOJiiOqUxtFcDWa6MWVjhZVij6PhB1_NhfP33Q@mail.gmail.com>
	<CANx9H-AkBLNPRSMXkHe_rspjFTcTrNaSJ=GU_1kSZy6upnXe5g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Jun 2016 22:14:22 +0200
Message-ID: <CA+chaQf-DBNPS_+FNmBYk1hnt6wE_PEjS8iRF6YKWUECoLzUzA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Wed, 29 Jun 2016 20:14:25 -0000
Content-Type: text/plain; charset=UTF-8

It might be related to this:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107959.html

On Wed, Jun 29, 2016 at 10:11 PM, Tim Orling <ticotimo@gmail.com> wrote:

> Has pypi changed it's URL format?
>
> https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/setuptools_scm-1.11.1.tar.gz#md5=4d19b2bc9580016d991f665ac20e2e8f
>
> is the link on pypi....
>
> On Wed, Jun 29, 2016 at 1:04 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > ERROR: python-setuptools-scm-1.11.1-r0 do_fetch: Fetcher failure:
> > Fetch command failed with exit code 8,
> > output:
> >
> https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.11.1.tar.gz
> > :
> > 2016-06-29 07:45:31 ERROR 404: Not Found.
> >
> > ERROR: python-setuptools-scm-1.11.1-r0 do_fetch: Function failed:
> > Fetcher failure for URL:
> > '
> >
> https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.11.1.tar.gz
> > '.
> > Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in:
> >
> >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python-setuptools-scm/1.11.1-r0/temp/log.do_fetch.7515
> >
> >
> > On Wed, Jun 29, 2016 at 10:22 AM, <mingli.yu@windriver.com> wrote:
> >
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > >
> > > * Add python-setuptools-scm bb as python-pytest-runner depends
> > >   on python-setuptools-scm
> > >
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >  .../python/python-setuptools-scm_1.11.1.bb             | 18
> > > ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/python/
> > > python-setuptools-scm_1.11.1.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/
> > > python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/
> > > python-setuptools-scm_1.11.1.bb
> > > new file mode 100644
> > > index 0000000..0b306f4
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/
> > python-setuptools-scm_1.11.1.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY = "the blessed package to manage your versions by scm tags"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
> > > +
> > > +inherit pypi setuptools
> > > +
> > > +SRCNAME = "setuptools_scm"
> > > +
> > > +SRC_URI = "
> > >
> >
> https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> > > "
> > > +
> > > +SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
> > > +SRC_URI[sha256sum] =
> > > "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
> > > +
> > > +S = "${WORKDIR}/${SRCNAME}-${PV}"
> > > +
> > > +RDEPENDS_${PN} = "python-py python-setuptools python-argparse
> > > python-debugger python-json"
> > > +
> > > +
> > > --
> > > 2.8.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
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

