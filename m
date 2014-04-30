Return-Path: <donny3000@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 67CCE61FE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 18:18:14 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n16so2422207oag.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xs8c/MtE39uk2XJ7nv1vu8DL8sjcu5vthQyxaQKYVVo=;
	b=j9rLSbYg5gBDCP/Sn/LW0tWNJ6ca0ThgeOG3uKO/dqdx54ybIoCtUgrc9nWrsYdDs7
	G3Uyt/0AWehs0+TC+0YiUQuuFdfFkSfODhSwU45LzB+t+dWc42w+nKLjj/OvyOQjy+09
	LBRcJrlVEPjhHb4afLQsfHnVC0yHkQg36hgfIl4vuUcJk7lRK0tVtOnRyGR4yElxV2bE
	FPlPDuvG0Ry2LI1LtgBEUpTvtodbG/NVv16vVv4M8aVRjUts7cIpq4Ab2hCMIRrST1Lh
	dDIwIA+NbvU8KODtjiggMSjR7TnJJ8GK3zaZakrz1f5ohfPkyGLUEOUJ4MsUgt4XtzHh
	jSeA==
MIME-Version: 1.0
X-Received: by 10.60.42.194 with SMTP id q2mr3237930oel.66.1398881895051; Wed,
	30 Apr 2014 11:18:15 -0700 (PDT)
Received: by 10.182.50.98 with HTTP; Wed, 30 Apr 2014 11:18:15 -0700 (PDT)
In-Reply-To: <CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
References: <1398881370-12284-1-git-send-email-donny3000@gmail.com>
	<CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
Date: Wed, 30 Apr 2014 13:18:15 -0500
Message-ID: <CAMe6wuThdau=KYDLa3SaqKXpLuiAmtOMfMbNwcVDe6Et5Y7cKg@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Apr 2014 18:18:19 -0000
Content-Type: text/plain; charset=UTF-8

And yes, I did send this with git send-email.


On Wed, Apr 30, 2014 at 1:13 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

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

