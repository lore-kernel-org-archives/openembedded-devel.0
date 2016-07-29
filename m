Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F531607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 20:02:21 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id d204so8539458oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=q01BBIzGNk5k2VQJ8SaPwUZTpCUIF8yKaDfBPaOvlhE=;
	b=szuSCjWqQ6BGYWjIB8PVEnl248fuz26YbqmwfeYWsMH/jvkFs4rdp6MlMPFYjWhjNQ
	VJq3McSjlDZ52oMqISy9StpFYTIp4tekZzyqO/CNt1j4jyssOFzFza0E1hPSioEUQs/Y
	amJ7K8niVbJfpLFFdd01zCIMVMC4JVtI5qJLjntYG1vcIW1kddsEH9kdLAkZqCZD7Gh2
	FevEpDGy58S3uiivfBLKZFtl9vynpagAz/OHtK+QDeLW5koWilNoaCXv0orY38GBMs4Q
	7BlZA2mA/QGjQO4ogXzjETSxeT1Yo2VRpkKkjoR/2JKcNNCLzy/ei5wQ+r7ibBB5O7fv
	R0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=q01BBIzGNk5k2VQJ8SaPwUZTpCUIF8yKaDfBPaOvlhE=;
	b=dZJ6N/uDHMjiYSyNpuj6D7D2Tu0+gCTmYoH1K+sienxBw973Ag6biNqkU2Nd94kZgA
	ffkt5iMrP+nSwtrdvnfsNRVZGoJVmve2y0qBlmSUm44YgBqJY7E29AFAm7m0JzJN+MSp
	wiSYZ4lMzbo178is4yy0eivwg2xFxyDeb8mGNu328vtld/vS5Wyfaa+Vrp6tHYtHeweF
	/V2KTWxEXtk5Fhjl+NcDlqnWlX36SMYF+TNbJSeEZ4ivofK8UbZG+mqWghmcJ9YyuPho
	8PFRSFlWz6ZjB8Yyh1yA7SOUWrN5yFms2ThhP0WtTvVTaj43OnLTXQ1hn+2Qwjs96j7p
	mvVg==
X-Gm-Message-State: AEkoous6WAgdx64ZQe/FRv52dI/thETctBuLGD7INVrT6Jm3aMNy8++WlRLmTXPckgcNt8EIkOXOLh2Wel9M9Q==
X-Received: by 10.157.35.194 with SMTP id t60mr23929606otb.81.1469822541800;
	Fri, 29 Jul 2016 13:02:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.171.7 with HTTP; Fri, 29 Jul 2016 13:02:21 -0700 (PDT)
In-Reply-To: <20160727125539.5p7zs2kaxf2nxbms@jama>
References: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<20160727125539.5p7zs2kaxf2nxbms@jama>
From: Cynthia Chiu <cynthia.ms.chiu@gmail.com>
Date: Fri, 29 Jul 2016 14:02:21 -0600
Message-ID: <CAFn+KXByikEDEQLaFKdmh=73kHiSr_YBK_p-v9-V=ZumxAyv_Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
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
X-List-Received-Date: Fri, 29 Jul 2016 20:02:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Thanks for your feedback. I apologize for the confusion. I have changed the
recipe to use: LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
I have tested this and it works.

I just wanted to confirm that using ${COMMON_LICENSE_DIR} is an acceptable
convention before I apply another patch.


Regards,
Cynthia Chiu

On Wed, Jul 27, 2016 at 6:55 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Jul 20, 2016 at 11:23:59AM -0600, cynthiachiu wrote:
> > Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> > ---
> >  meta-oe/recipes-extended/canopennode/canopensocket_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > index 7c58a26..1e0f7d0 100644
> > --- a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Linux CANOpen tools"
> >  DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM =
> "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> LICENSE.GPL also doesn't exist, FFW test your patches before sending
> them.
>
> Dropped from master-next until someone sends *tested* version.
>
> >  SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
> >  SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> > --
> > 1.9.1
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

