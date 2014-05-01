Return-Path: <donny3000@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9C065E0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 21:14:35 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wm4so949032obc.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 14:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pWWuVieto7XxdTu0ye+Je+refrfdHKx6Z7Fu1x3TOhQ=;
	b=gqkQBAvo81T5S5DCIGBK0oYHwZPKd19IfehQsXE9kVpiEDXbTV2JnpA833PBLPaaj0
	bAT8d0uc56b6bVlATdrymvns1r7SBzjhUobBxjYhJAOUtubJVqwn89IOgUCdRzjuPmc7
	2PlCknx7l9Po57RazAEaAq7NKj4+WrbIy9PHlg0uW4JG7yphxoUi3izjX/QSsJeC+jAG
	sf2tDaDzWEYSg+n7lJSxN33fIT71+4Ern6ULM1M9xrZv6P1dOR9+30vrJ/5IqfpeBkG8
	xeZbX9wNVpOdVeoMAGDFvMdbZjWtFzZfL/axOsfa8JHQSvrAfUeYxGsAiHMpENpnvxvf
	wUuQ==
MIME-Version: 1.0
X-Received: by 10.60.37.199 with SMTP id a7mr13124560oek.41.1398978876284;
	Thu, 01 May 2014 14:14:36 -0700 (PDT)
Received: by 10.182.50.98 with HTTP; Thu, 1 May 2014 14:14:36 -0700 (PDT)
Received: by 10.182.50.98 with HTTP; Thu, 1 May 2014 14:14:36 -0700 (PDT)
In-Reply-To: <20140501210300.GU2486@jama>
References: <1398974461-3044-1-git-send-email-donald.poole@swri.org>
	<20140501210300.GU2486@jama>
Date: Thu, 1 May 2014 16:14:36 -0500
Message-ID: <CAMe6wuQkuM2-eN39BkkkNz4xPsY1r2Kz=g6dJEgN-CJrVX4X_A@mail.gmail.com>
From: Donald Poole <donny3000@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
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
X-List-Received-Date: Thu, 01 May 2014 21:14:36 -0000
Content-Type: text/plain; charset=UTF-8

Yes, I have a Qt5 application that I need to build to run on the host
machine to generated some of the target application code.
On May 1, 2014 4:03 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Thu, May 01, 2014 at 03:01:01PM -0500, Donald R. Poole, Jr. wrote:
> > From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
> >
> > Currently, if you are building native applications with Qt5, the current
> qmake5_base_do_install() method assumes an install into the image folder
> for the target. Since the native builds handle this a little differently,
> this patch should account for the native install scenario.
>
> Can you explain a bit why you're building qt5 native application? Is it
> used to build some target packages?
>
> > ---
> >  classes/qmake5_base.bbclass |   37 ++++++++++++++++++++++---------------
> >  1 file changed, 22 insertions(+), 15 deletions(-)
> >
> > diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> > index 18fdb2a..df8a59a 100644
> > --- a/classes/qmake5_base.bbclass
> > +++ b/classes/qmake5_base.bbclass
> > @@ -163,23 +163,30 @@ qmake5_base_do_configure () {
> >
> >  qmake5_base_do_install() {
> >      # Fix install paths for all
> > -    find -name "Makefile*" | xargs sed -i
> "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
> > +    if [ "${BUILD_SYS}" = "${HOST_SYS}" ] ; then
> > +        find -name "Makefile*" | xargs sed -i
> "s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> > +    else
> > +        find -name "Makefile*" | xargs sed -i
> "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
> > +    fi
> >
> >      oe_runmake install INSTALL_ROOT=${D}
> >
> > -    # everything except HostData and HostBinaries is prefixed with
> sysroot value,
> > -    # but we cannot remove sysroot override, because that's useful for
> pkg-config etc
> > -    # In some cases like QtQmlDevTools in qtdeclarative, the sed above
> does not work,
> > -    # fix them manually
> > -    if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGET}"
> ] ; then
> > -        echo "Some files are installed in wrong directory
> ${D}${STAGING_DIR_TARGET}"
> > -        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> > -        rm -rf ${D}${STAGING_DIR_TARGET}
> > -        # remove empty dirs
> > -        TMP=`dirname ${D}/${STAGING_DIR_TARGET}`
> > -        while test ${TMP} != ${D}; do
> > -            rmdir ${TMP}
> > -            TMP=`dirname ${TMP}`;
> > -        done
> > +    # Only do this for target builds. Native install work a little
> differently
> > +    if [ "${BUILD_SYS}" != "${HOST_SYS}" ] ; then
> > +        # everything except HostData and HostBinaries is prefixed with
> sysroot value,
> > +        # but we cannot remove sysroot override, because that's useful
> for pkg-config etc
> > +        # In some cases like QtQmlDevTools in qtdeclarative, the sed
> above does not work,
> > +        # fix them manually
> > +        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n
> "${STAGING_DIR_TARGET}" ] ; then
> > +            echo "Some files are installed in wrong directory
> ${D}${STAGING_DIR_TARGET}"
> > +            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> > +            rm -rf ${D}${STAGING_DIR_TARGET}
> > +            # remove empty dirs
> > +            TMP=`dirname ${D}/${STAGING_DIR_TARGET}`
> > +            while test ${TMP} != ${D}; do
> > +                rmdir ${TMP}
> > +                TMP=`dirname ${TMP}`;
> > +            done
> > +        fi
> >      fi
> >  }
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

