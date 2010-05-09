Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1OAwQv-0007S7-D3
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 04:39:58 +0200
Received: by qyk33 with SMTP id 33so4213490qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 19:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KAvCjrawMiYduvl3XyYUtODcy4r3etEJulfLDiH1/X8=;
	b=qhlaJEoBkQRbRo+L5+WyFq1RY7xLZDXCQC0H2TvW1you0FLHBrg5sWlrSs+Qb82Ehy
	z9J5HYkRx8PpJKRRN9eRINskJsnUIAxi0xdtFpQMFMx5LOy7+91EHuiNXBTaLp397qUe
	pp9V+vglkBvyTlLn2iaNTZi3SEmO3AagOohSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qqm7pFdcpiVIeqMhVKY6toI8sGYXkg2o4Na5pgRh03ToLf2OmLDQ9QdiUxVuijih76
	JHg6jzhUPZKPQaTYnbVNrKzgP+pf6y7i3Q+tbsiGdNKBJsYULjofKu2qPhBS+/LfiiJw
	Nh8nKsE01XxkEm6ErDp0c/sTCvnF2EMpP6MZo=
MIME-Version: 1.0
Received: by 10.229.239.148 with SMTP id kw20mr1720467qcb.10.1273372565926; 
	Sat, 08 May 2010 19:36:05 -0700 (PDT)
Received: by 10.229.24.149 with HTTP; Sat, 8 May 2010 19:36:05 -0700 (PDT)
In-Reply-To: <20100509020054.GA7586@gmail.com>
References: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
	<20100509020054.GA7586@gmail.com>
Date: Sat, 8 May 2010 19:36:05 -0700
Message-ID: <j2ia7f8874a1005081936v8724e1bet8aa6389fc75c1e5d@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] slugos-image: fix opkg-cl hanging on installing device tables
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 May 2010 02:39:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 8, 2010 at 7:00 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (08/05/10 18:24), Henry von Tresckow wrote:
> > opkg-cl was hanging during slugos image builds due to opkg-cl waiting for
> an answer for overwriting the device tables.
> > adding " -force-defaults" to IPKG_ARGS allows the image to build
> >
> > Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> > ---
> >  recipes/images/slugos-image.inc |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes/images/slugos-image.inc
> b/recipes/images/slugos-image.inc
> > index 6a4b7b9..809459c 100644
> > --- a/recipes/images/slugos-image.inc
> > +++ b/recipes/images/slugos-image.inc
> > @@ -23,3 +23,5 @@ IMAGE_LINGUAS = ""
> >  IMAGE_PREPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/?Image*;"
> >
> >  inherit image
> > +
> > +IPKG_ARGS += " -force-default"
>
> hmm when I look at the sources of opkg in .dev I dont see -force-default
> option
> am I missing something.
>
> -Khem


I think slugos still uses an older version of opkg:

slugos:

 henry@FozzieBear:~/oe/slug/tmp/work/nslu2be-linux-gnueabi/slugos-image-1.0-r1/slugos-image-1.0$
opkg-cl --version
 opkg version 0.1.6

angstrom:
henry@FozzieBear:~/oe/dev/tmp/work/poodle-angstrom-linux-gnueabi/console-image-1.0-r0/console-image-1.0$
opkg-cl --version
opkg version 0.1.8



>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Henry von Tresckow (hvontres)

