Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFC2360043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 20:11:49 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l184so6164990lfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=1BOzoNrL3gWeveDSF4vP5mP4c7OvSddUXkFCeslP0lM=;
	b=GQtYq0fG8d7VX86C3cjq64RFNncifl4Gk2hdXPqOdrgO8voshVHG4mmlLa59oyJqwR
	TlAemOGXxgozcodX54TQXaej29s7zkErVMjnpn42+w4FlABpqxFPVcXetuGqj/QLpIqv
	t/J85Fk63E6S66CAfjBggJlZdXZxpbLHrNu3OPkpjy6KHj5kRYPfJ/8cnYccAx0A8P2y
	RcBvIHARX2/lwh4MSpQV8Ylrj4JPMUrDmC/IL554AIJIZVe1nwNIkOaEQkV2QCj+ZxdI
	4JjROOuDHFhtQjh3B7Y9G4/jc9M7vwExrPCkAEgy4JcJBSEfiHwGlbLTxM8PUZ3mHb0o
	buxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=1BOzoNrL3gWeveDSF4vP5mP4c7OvSddUXkFCeslP0lM=;
	b=QgEMSlW3tMqDnH5nrUlXzNjQl/NixStV63USHIiKR2JFpPoGs3fS/YfpWqstbD39Fx
	hMj3+togPzxt3xztF4YFhvspE7mCDvPXjZwt3bj4UmVClnlxGI0BdEUHhAhKNzkIicmm
	myY/1Tx0NNVWc2vQnzh8+TQF31o4V90xMY4MXapqMjGMvWdzU8UFZtNT69kpTVMc7rAc
	fNDwPFKw5vOe3WnFCTuyXe3C/bbPNqFPF5OyAp/Ww9dyA+HnoAk6Y18zIfokJfZStPaa
	rjnA+GA5eqvmA75Zr9ehubjacmFPkZGv67MHtACz/H0Uaa5WKhF5PYWI8LvCFC5VtMnt
	uuMQ==
X-Gm-Message-State: ALyK8tIdKlWToo9NIyXOZc3IAyntUV8D8Dx8bBfFMnV55zxmsK4mZLnj73ufKp+hdCu8uEd21DRcw/ABZKfaOw==
X-Received: by 10.25.133.87 with SMTP id h84mr3321582lfd.210.1467231108605;
	Wed, 29 Jun 2016 13:11:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.23.39 with HTTP; Wed, 29 Jun 2016 13:11:47 -0700 (PDT)
In-Reply-To: <CA+chaQcPagpczOJiiOqUxtFcDWa6MWVjhZVij6PhB1_NhfP33Q@mail.gmail.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
	<1467188567-28145-6-git-send-email-mingli.yu@windriver.com>
	<CA+chaQcPagpczOJiiOqUxtFcDWa6MWVjhZVij6PhB1_NhfP33Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 29 Jun 2016 13:11:47 -0700
Message-ID: <CANx9H-AkBLNPRSMXkHe_rspjFTcTrNaSJ=GU_1kSZy6upnXe5g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 29 Jun 2016 20:11:50 -0000
Content-Type: text/plain; charset=UTF-8

Has pypi changed it's URL format?
https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/setuptools_scm-1.11.1.tar.gz#md5=4d19b2bc9580016d991f665ac20e2e8f

is the link on pypi....

On Wed, Jun 29, 2016 at 1:04 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> ERROR: python-setuptools-scm-1.11.1-r0 do_fetch: Fetcher failure:
> Fetch command failed with exit code 8,
> output:
> https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.11.1.tar.gz
> :
> 2016-06-29 07:45:31 ERROR 404: Not Found.
>
> ERROR: python-setuptools-scm-1.11.1-r0 do_fetch: Function failed:
> Fetcher failure for URL:
> '
> https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.11.1.tar.gz
> '.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
>
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python-setuptools-scm/1.11.1-r0/temp/log.do_fetch.7515
>
>
> On Wed, Jun 29, 2016 at 10:22 AM, <mingli.yu@windriver.com> wrote:
>
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > * Add python-setuptools-scm bb as python-pytest-runner depends
> >   on python-setuptools-scm
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../python/python-setuptools-scm_1.11.1.bb             | 18
> > ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python-setuptools-scm_1.11.1.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> > python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/
> > python-setuptools-scm_1.11.1.bb
> > new file mode 100644
> > index 0000000..0b306f4
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY = "the blessed package to manage your versions by scm tags"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
> > +
> > +inherit pypi setuptools
> > +
> > +SRCNAME = "setuptools_scm"
> > +
> > +SRC_URI = "
> >
> https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> > "
> > +
> > +SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
> > +SRC_URI[sha256sum] =
> > "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
> > +
> > +S = "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +RDEPENDS_${PN} = "python-py python-setuptools python-argparse
> > python-debugger python-json"
> > +
> > +
> > --
> > 2.8.1
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

