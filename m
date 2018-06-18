Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB21F7523F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:39:25 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id a5-v6so11336474uao.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i1JIr2OM8cbuF7l0WKWC0AdCChwqcUjcJl2GeWoTrD4=;
	b=E3+Qm+m7l8UYnquQ73oBlWT14BirW1QUgsAEQlOpjZRyW/8TK2Y6wK4+gUTGtRoW30
	clj14CTUIPX9nNNUaed7J2hNv5qtT6lip/RYteV23XdwuiY0oKuNmMN2jbh6cp4q0eko
	TaOrBChu6AuhTpmcaofwnl1/eaPXPuLhf8qUL960HrBeU0gvj8FU7bdnwf5EhbveMJkQ
	I6xZYkqJOuQdP9kYyau+AHY80/MF8xyVvKS41sZxPRK7bkpwpOcmsMEHjxp45a0RGH3c
	C3OCNJ3f5hucIiGco+Gq6g3jg9NtQvMvy4Rai/pCRbqiW4f6TXy1fH241qdgcjqlk5ZQ
	G2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i1JIr2OM8cbuF7l0WKWC0AdCChwqcUjcJl2GeWoTrD4=;
	b=WtwU29DJ3P82KLscp8F/EKSyuRBYxZXjmWofA5K4FO62x/TP6/z+H+34/bsbHdTYzV
	HnSSQ66UcNOlJ+3XS1DTYr4P+SOcOeik7INHfQ0OGLNvNBeg9S41lLF+84QUROxaqkbZ
	0QJSFq8cCJNAc2SIC7SaNjI/RVqF6Mu89YgGsdQ5ZEvTIOE2G5FGINdqXvCRuNNXLiAn
	iu+1kGiOsD+KoBPSWZstGJ30gtwJ2HB8wt9OPRwyMiCmGBf5KCl5Yfxr858TjCWtG9sM
	Q+uIkWGAGKBledDtFLJPprQUZ4A8Z6JxMmY1IeQZrk6+NOGoXKh3wXGUxOj67BugPLpP
	6T8A==
X-Gm-Message-State: APt69E02+3fXy7rNWMB6uISSPw9lTTnQpnkAjr+isjIJCKCdRHsB7y/1
	+4NwLGSFqlw5aOoi2d28j1vwhMyKDMT08POH9C8=
X-Google-Smtp-Source: ADUXVKLB0iBBMJU+E/V4LjdYl8QZhu1bF7z9glYWLbJKPyXkFpTlktuPS2wgNYz+2eZHrhoA29mjj53nHGCOqqRkN9g=
X-Received: by 2002:ab0:304e:: with SMTP id
	x14-v6mr8451830ual.80.1529347166621; 
	Mon, 18 Jun 2018 11:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sowdJaFO3CH8d7wRtgPKxoc5PEYESQU3w0oHYAVOsq4og@mail.gmail.com>
	<CAPuovELz+L+8keBVWYCjFnWPSGPoTf5_X_TZpyKuGdf9bea1fg@mail.gmail.com>
In-Reply-To: <CAPuovELz+L+8keBVWYCjFnWPSGPoTf5_X_TZpyKuGdf9bea1fg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 11:39:10 -0700
Message-ID: <CAMKF1sp3Hhh3c3_xLkZ3EJHbS=fhOLk4EY+6BMzSGP+ZPHECNA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 18:39:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 11:03 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Mon, Jun 18, 2018 at 1:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Jun 18, 2018 at 9:51 AM Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> >>
> >> Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see a
> >> QA Error/Warning regarding files 'installed-vs-shipped':
> >>
> >>     ERROR: QA Issue: thunar: Files/directories were installed but not
> >>     shipped in any package:
> >>       /usr/lib
> >>       /usr/lib/systemd
> >>       /usr/lib/systemd/user
> >>       /usr/lib/systemd/user/thunar.service
> >>
> >
> > perhaps this should be moved to /lib/systemd/system
>
> Possibly but really I had to go under the assumption that the folks
> that came before me and created the recipe and completed version bumps
> have tested it in its current location (which is a valid location for
> systemd service files by the way). So my intention was to address the
> QA issue and not change the overall behavior of the recipe.
>

Thats fine.  Let me wait on Andreas to validate this approach.

> MarkA
>
> >
> >> Correct the path to the systemd service file to match what we see in
> >> other recipes which include "user" service files.
> >>
> >> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> ---
> >>
> >> This issue and patch is for master-next to match the
> >> merge status of commit eb0fe21c1535.
> >>
> >>  meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> index f03fd63..c2f6f59 100644
> >> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> @@ -21,7 +21,7 @@ FILES_${PN} += " \
> >>      ${libdir}/thunarx-3/* \
> >>      ${libdir}/xfce4/panel/plugins/* \
> >>      ${libdir}/Thunar/[Tt]hunar* \
> >> -    ${libdir}/systemd \
> >> +    ${systemd_user_unitdir} \
> >>      ${datadir}/dbus-1 \
> >>      ${datadir}/metainfo \
> >>      ${datadir}/polkit-1 \
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > ________________________http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106323.html_______________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

