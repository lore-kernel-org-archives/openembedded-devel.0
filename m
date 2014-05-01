Return-Path: <donny3000@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 38F5B65E47
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 20:02:56 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wp18so3941098obc.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 13:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=42zUiPCBlYYRpazFDNRy1+dL9YXfPgx75MdpZIP2S4A=;
	b=tNVFwKEOLJsdQSoet71cdtBOs21zaSdDKfDLnDQqa8Wd+S26qXZ9ngY7VHQ8lCvJDp
	fnaQbQCx2kzj9UW0gr7KCGlxa9WAqdB5oY1OHKIae80H+/igC5uBRJ/0xeKWxlBChBfN
	/8pAIVnGCHA5owa1LSEVFZEjDrrOyXPf4NfwjH91bm/+R38yDmmNB1f8hlBrrIBRfh43
	p78TUhCyyjymLmMTv+7Ws1iHTcTJDMRv2JM0mAQLW4E0aCDkGshqjI6Vs3Ntt4/O6heb
	TidWwialT8Lj6jA68f/NnNhoYaQlgHtQDxRueghMOS0t5263AbGEcTdECGrxjZB+yKZh
	xHaA==
MIME-Version: 1.0
X-Received: by 10.60.134.137 with SMTP id pk9mr12814029oeb.40.1398974577317;
	Thu, 01 May 2014 13:02:57 -0700 (PDT)
Received: by 10.182.50.98 with HTTP; Thu, 1 May 2014 13:02:57 -0700 (PDT)
In-Reply-To: <CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
References: <1398881370-12284-1-git-send-email-donny3000@gmail.com>
	<CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
Date: Thu, 1 May 2014 15:02:57 -0500
Message-ID: <CAMe6wuRNiCgQRrCL-haRyXkOoVuL=StBLbByPFs300jW8=noeQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 May 2014 20:02:57 -0000
Content-Type: text/plain; charset=UTF-8

Disregard this patch. I'm sending another patch that should cover the
native build case more completely.


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

