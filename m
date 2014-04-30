Return-Path: <donny3000@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id DEE4C60DDF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 18:16:55 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id i4so1690033oah.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NLrsRQqRsd6TredQNTcU4Qx/lS0lGIjSboOtrnmopCI=;
	b=nGbQy0JaoEs0k7mhD8vKk/wS3XSIj4uRN9o+C6/ck7tNWdduglPyN2y3QsrfM0yDbS
	JeuyFVArZT7CSY0z2AgbXL4oVzarweWjtRzRL6Co6ITkarxxNiXastkC1rGjTe4574pr
	DVpCAnKx/+hjG0Me5c6eK94BBQDC6J70Fpy1VeKjNil9ex2el5IsvJOsQNZurtu/YJ4m
	tkGN8+fv/OwNn3GEKEjNU0k1lfxDEXDwCOet5qGsNs60NO5N1FpvkM6GIZf0Rd1jlvGN
	5Ua+iUFs9YAqHi/8XVsQlPkJA8Rb5gSF3GSSwBJZacq8HOv1DP5NHkzIuk9VL1Q/xbXz
	Nv8g==
MIME-Version: 1.0
X-Received: by 10.60.60.132 with SMTP id h4mr2701628oer.77.1398881816641; Wed,
	30 Apr 2014 11:16:56 -0700 (PDT)
Received: by 10.182.50.98 with HTTP; Wed, 30 Apr 2014 11:16:56 -0700 (PDT)
Received: by 10.182.50.98 with HTTP; Wed, 30 Apr 2014 11:16:56 -0700 (PDT)
In-Reply-To: <CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
References: <1398881370-12284-1-git-send-email-donny3000@gmail.com>
	<CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
Date: Wed, 30 Apr 2014 13:16:56 -0500
Message-ID: <CAMe6wuSU2CrtiMUJY3RZBW_FFoAYQaW5=8Ceb23ct4aymVqynA@mail.gmail.com>
From: Donald Poole <donny3000@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qmake4_base.bbclass: Add staging directory for native builds
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
X-List-Received-Date: Wed, 30 Apr 2014 18:16:59 -0000
Content-Type: text/plain; charset=UTF-8

Sorry, I meant to say Qt5 to match the code.
On Apr 30, 2014 1:13 PM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:

> On Wed, Apr 30, 2014 at 3:09 PM, Donald R. Poole, Jr.
> <donny3000@gmail.com> wrote:
> > From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
>
> Did you send with git send-email?
>
> The shortlog and code does not agree. You cite qt4 and change qt5 ;)
>
> > When building a basic Qt5 native application, the build fails on the
> do_install task as a result of the  variable being empty. This causes the
> copy command in the test block to fail because it is trying to copy files
> from/to itself.
> > ---
> >  classes/qmake5_base.bbclass |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> > index 2db0fa3..18fdb2a 100644
> > --- a/classes/qmake5_base.bbclass
> > +++ b/classes/qmake5_base.bbclass
> > @@ -171,7 +171,7 @@ qmake5_base_do_install() {
> >      # but we cannot remove sysroot override, because that's useful for
> pkg-config etc
> >      # In some cases like QtQmlDevTools in qtdeclarative, the sed above
> does not work,
> >      # fix them manually
> > -    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
> > +    if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGET}"
> ] ; then
> >          echo "Some files are installed in wrong directory
> ${D}${STAGING_DIR_TARGET}"
> >          cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> >          rm -rf ${D}${STAGING_DIR_TARGET}
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

