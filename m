Return-Path: <chris.d.garren@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id E3B857C124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 13:15:42 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id s2so7544861vsi.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s2cNesw+wvQVJQTdFxJGzjtQ0J5D5dyuDUt5WX75vPI=;
	b=Z1EW+3jVhFV+/lPOFymJI1o73+HIEsrUgevn+C/b7qAn0LB5x0QULzR2iiJY60OdKc
	rS+NMSVHibC7mF19c29p8zVJznyq3KVHE1HE/fbry61eX/ZTZmO7tRnFWrCieC/HsV7r
	Xoi1/zuh8ma3w4Mmdv3/ZdZpyEcCEdvu5heZgViRazSMNdE+KZ15BdDW472PHfXtz0GQ
	PIh+2J+v1EpY+b0jiTyyV4YRIR7Dr4blnbZGbUPlmLRPDtTWrz2L6nnI1uQZZdkz4jOV
	qoTjAXua7pQ8IMBAUBo5IF9jeVUY3+n+4HbItt0tpbbUxdvjBXefjsyZ3ZmqVB997Jgc
	VaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s2cNesw+wvQVJQTdFxJGzjtQ0J5D5dyuDUt5WX75vPI=;
	b=hssqbLq2vx4bczo7DSnaaqdw54hwiafRCom+Pm7iWlRbwGCVM9HnCVQAM8WLVu0lAp
	FZ6cITO/eWFfbiNUlzpQSOwgo7dPb0LkOZfTW83JEpVNm6kuQoppbFqWFjLclfdrWLEN
	zFQ+t4Qns9rTze93Ku6Sbhla5a7BDExT+b4n25cXwk1F/gBxcCUvaQmg4kkuFqooyeuN
	5EYLs8RyVoY8K1XtIFUu99sMDUE7VTOUa3/nqz88+eMbBof70vZtlONcF1ikNJM6I37i
	DmD7wDApy80QUvR6479tfF+kS5Y/tQTODnc95u/AdE8Dq1CtJRJiirIZyuEoO3VXTrHG
	8hEA==
X-Gm-Message-State: APjAAAVKsjdNOhlDrZpMyd03h8QALenEmwRbjbqh6QUOFKJl2LHXyQiZ
	MDPU0iNmNAcCKd4vEnKOtZ2LlfiY5HccI/JUmVg=
X-Google-Smtp-Source: APXvYqzdXazwaN05jLyQhGn00Fd6aSNUxIqJhDRSH6w3txGLh5+Bl3sUFAlJw8JQ2a9SIFs21aBuQcMsC4AYSGu6HNo=
X-Received: by 2002:a67:7a43:: with SMTP id v64mr15668245vsc.54.1554729343589; 
	Mon, 08 Apr 2019 06:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <1554487209-29330-1-git-send-email-cdgarren@indesign-llc.com>
	<CAMKF1spZ+BGWr3oPCCmdcHo-8Tr7bSbvMdW8LDpat7bgz5SdFg@mail.gmail.com>
In-Reply-To: <CAMKF1spZ+BGWr3oPCCmdcHo-8Tr7bSbvMdW8LDpat7bgz5SdFg@mail.gmail.com>
From: Chris Garren <chris.d.garren@gmail.com>
Date: Mon, 8 Apr 2019 09:15:32 -0400
Message-ID: <CAEd1+MsZBE54PHpLVNu7yBEb2=ySG11uDHBfuBfP2KUuQ5unuQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-cryptography: Add -pthread to link flags
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
X-List-Received-Date: Mon, 08 Apr 2019 13:15:43 -0000
Content-Type: text/plain; charset="UTF-8"

It looks like it was already added to the python3 recipe, so yes, it should
probably be in the .inc file. I will revise.

On Fri, Apr 5, 2019 at 4:34 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Apr 5, 2019 at 11:00 AM <chris.d.garren@gmail.com> wrote:
> >
> > From: Chris Garren <cdgarren@indesign-llc.com>
> >
> > This builds openssl which needs pthread_atfork(),
> > but it's not linked which results in runtime errors.
> >
> > Signed-off-by: Chris Garren <cdgarren@indesign-llc.com>
> > ---
> >  meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb | 2 ++
>
> We are on 2.4.1 on master, so please rebase it, secondly do we need it
> for python3
> recipe as well if so then move the fix to python-cryptography.inc
>
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/
> python-cryptography_2.1.4.bb
> > index 9c2f884..ce7b5ab 100644
> > --- a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
> > +++ b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
> > @@ -1,6 +1,8 @@
> >  inherit pypi setuptools
> >  require python-cryptography.inc
> >
> > +LDSHARED += "-pthread"
> > +
> >  SRC_URI += " \
> >      file://run-ptest \
> >  "
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

