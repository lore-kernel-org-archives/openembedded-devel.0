Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBBE7D0B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 21:42:43 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c26so10535176qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 14:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f10IIsld+05CNLmK6CSlsTbxgKPFvalJzb1XT7xLTWY=;
	b=vEeZg8BoeDJKuK6dJx7Cbn8yy3A+csyEyHrDHaZlXbROtzUPcADumAO1GxIq+EILjN
	WddOFno6nquPFWGDyV1kjCmCXQCa/e65MDu/Cbhlsu/x1eZMEfkcvGHMrYWDB1OEhFyz
	1On/4sjWnfRyjfy//C0a/pIHUp97KeSKFFtKO7jSWn0Py6bkQ45mZxXbXh59BJs/cAO0
	O0nZuiMSkdHym4NKadso4Djdx9a/NZNZrYW72bvns1ymT2vpVN2mj1J8r9CD2EpUrLL7
	IjLTP80pBkmtY3Td1+VLBgGkK2u2Pi+U3eox2OdGhBpK9oo1CuSC9m0sjkE7rpr0mQk5
	0VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f10IIsld+05CNLmK6CSlsTbxgKPFvalJzb1XT7xLTWY=;
	b=SWKzxMzIzM7wgWnqnbyJLbpBg07Ujy/dUaWRkNgtV1v4tpCLOpUN1DPGIJgfwKcVkj
	ghN805G7A7MLWRwH4/QARRLc07Xg1bo7A4AaPg/cKOSW4kkkxyvHxYMD3HNaeqNeoAhU
	WOMcLp00n2jcvuoI8aDX7IqmxnTAX6wesBCmQswHMzTIE0DDx3U+KtTsN9iM+tq7nGsW
	a820aSvxYpcB6Ag3hKGPfPail71lj/XVhCi8rd8uZw9viKV9ZfSw/PqeHcGmgl7bMbub
	BEx5D3UR3Fz7wi7fi+PDRutCjXcxJei1Sxn8ZMvpn8S5fAkBRrf5UarXFoxcbYZ7M4Vm
	csIg==
X-Gm-Message-State: APjAAAUD2xODVh7htTczIuitohHQ/RhDnrYW4i+sz2GwWsFEm60MECby
	Xc3+TOOFACo9yF2kkdN1hThaP1dsxbVGLKgUpQs=
X-Google-Smtp-Source: APXvYqxj+FQtf/sdr2PLoTGOKjGkjEf5qzKBaS+i6RFUV5ywARF3/NvNhNCYVpJjJSFay6gIshAIiUCDSC+MVqVxAxA=
X-Received: by 2002:ac8:411b:: with SMTP id q27mr1063201qtl.53.1572558164404; 
	Thu, 31 Oct 2019 14:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191031024158.14123-1-zangrc.fnst@cn.fujitsu.com>
	<803afae6-a6b4-63e7-1554-c562099bb740@cn.fujitsu.com>
In-Reply-To: <803afae6-a6b4-63e7-1554-c562099bb740@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2019 03:38:31 -0700
Message-ID: <CAMKF1srEv0kNFaL6FpLU2h6egonPW5te62+etbQDspiwgRofQQ@mail.gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-simplejson: enable native and nativesdk
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
X-List-Received-Date: Thu, 31 Oct 2019 21:42:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 2:45 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> I found that native and nativesdk are enabled in the bb file in the
> meta-python/recipe-devtools directory, but some do not. I want to unify
> them to enable native and nativesdk. Do you think this is okay?


I would say do it on need bases alone

>
>
> On 10/31/19 10:41 AM, Zang Ruochen wrote:
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >   meta-python/recipes-devtools/python/python-simplejson.inc | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc
> b/meta-python/recipes-devtools/python/python-simplejson.inc
> > index 3d36f9608..5592eaf3d 100644
> > --- a/meta-python/recipes-devtools/python/python-simplejson.inc
> > +++ b/meta-python/recipes-devtools/python/python-simplejson.inc
> > @@ -21,3 +21,5 @@ FILES_${PN}-tests+= " \
> >       ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
> >       ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
> >   "
> > +
> > +BBCLASSEXTEND = "native nativesdk"
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

