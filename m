Return-Path: <ian@boundarydevices.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3947D76230
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 00:04:17 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so404753wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 17:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+aLfGoTdrMC/565gk2kagYKZOXTt3Skp3K+8t9JgtIM=;
	b=ev04r5AQEeeVwuK7EIwAJAceeIKolBeLRHRmK87YjNSjtr+HxUB7ibNvkKJMbj1ms1
	4FR5qLHb/lXghvMtXRbJNzS+xLza52ecIS0HL4CfRccBINKxbTfS873DfvLX7V83rF9R
	LS3JMRkIOmVFa5hq6QFaWABNX7biK6esT4k7jIvijCpJpCYp+RDGs0MJEsqkfF8fvvkb
	0F1k/vVtSVcIgb7Q8Jtuoybaeg4tEVsbu63IqUdVEd5KkCEHV1GZ9d7pHxwx3mmYim5Q
	L/afEW8SBKwDQ7DzYFeHE01aM5+R8ITAiL8b2XP09nqebHp65OM0s+K4g3g+EIqe5p71
	8E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=+aLfGoTdrMC/565gk2kagYKZOXTt3Skp3K+8t9JgtIM=;
	b=mgQZkYvoGMlduQFiiNSRFmTcUKGCKm41WQQPh/HW6jFjBRWHtFBpJ+37+InVusLdf3
	l62yuckrkkIQ74Vjar3kN9/a2YyXKlHh+U3xiM/XmfVnwsv6XRz8/LLT6nUd+wZ6cjRS
	qRxXp25H4NDWdIZoRI85gw7vgNNltG2xO013iuPtR8JSAa1Kc//zutYNSFnARW5tCSiv
	m0/MI101nFukVpkexjS2nyCuwVMctdx5bgJ1orOSJnQfgfP9u96UKiiNT4ZURB48vw0J
	kMBN3QZJ4CD88B11WVPxTmwRcTloeJ2hH1Fs5TR9+rXRINeD4aqXjMNHxMhA+GDjD4Ot
	ctOw==
X-Gm-Message-State: ALoCoQnbg2IyBUQi2AD4cMxpVfOZegYTGR7+H8VsKr7sOLeU7Nfno9yx6TjWMMgAPI/pWa/KGt2j
MIME-Version: 1.0
X-Received: by 10.194.63.7 with SMTP id c7mr5279086wjs.70.1446163457242; Thu,
	29 Oct 2015 17:04:17 -0700 (PDT)
Received: by 10.27.155.207 with HTTP; Thu, 29 Oct 2015 17:04:17 -0700 (PDT)
Received: by 10.27.155.207 with HTTP; Thu, 29 Oct 2015 17:04:17 -0700 (PDT)
In-Reply-To: <CA+chaQc1mdFOTS3tZK0Cx2UMo8nkQSX2OtrQGoPi_mvFg9++sw@mail.gmail.com>
References: <1446159993-15239-1-git-send-email-ian@boundarydevices.com>
	<CA+chaQc1mdFOTS3tZK0Cx2UMo8nkQSX2OtrQGoPi_mvFg9++sw@mail.gmail.com>
Date: Thu, 29 Oct 2015 17:04:17 -0700
Message-ID: <CADseiPm6-UxGCY=ekAOyZt5XAhH+0szYAWbWVN=z6AsgdFuoUw@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][jethro][PATCH] qtbase: Fix host user contamination
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 00:04:18 -0000
Content-Type: text/plain; charset=UTF-8

Ah. Yes. Sorry, didn't look at that branch. I'll switch to that, thanks!
On Oct 29, 2015 4:19 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> Isn't this fixed by:
> http://patchwork.openembedded.org/patch/105649/
> ?
>
> Which is already in master-next.
>
> On Fri, Oct 30, 2015 at 12:06 AM, Ian Coolidge <ian@boundarydevices.com>
> wrote:
>
> > The copy must not use the host user when copying for packaging.
> > Error fixed:
> > ,----
> > | WARNING: QA Issue: qtbase: /qtbase-dev/usr/lib/libqtfreetype.prl is
> > owned by
> > | uid 1000, which is the same as the user running bitbake. This may be
> due
> > to
> > | host contamination [host-user-contaminated]
> > `----
> >
> > Signed-off-by: Ian Coolidge <ian@boundarydevices.com>
> > ---
> >  recipes-qt/qt5/qtbase_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > index 4cffccf..19de7df 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -231,7 +231,7 @@ do_install_append() {
> >          cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
> >          chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
> >      fi
> > -    cp -a ${B}/lib/libqt* ${D}${libdir}
> > +    cp -r ${B}/lib/libqt* ${D}${libdir}
> >      # Remove example.pro file as it is useless
> >      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
> >
> > --
> > 1.9.1
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

