Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id E55D17826F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:58:18 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id d124so25496745vkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iqK1OldBm0zPm/+q1kEps+FYGUDkxVhS02sshETj1lo=;
	b=DJdWzT4KIypADCysE0m4aceG82/Jbm0hJ04zYlC8pFhgZV3t9r0sOgOxQJ8LNzC6vh
	v0NmrDl5mwoOy0CM/xBqm7mx3+0EH8Xy+IXJp8iVKqHikKCZazjxP9R3+c3e2NHZAyex
	xEdVDETrCFpDEejFgIPMERQEMULRcrae8l4BWS8AijdPzj8JHkkyJP9HdMJb4p0WLiDR
	oHkE15f6vzenFcycFbVlRLMlEyS9A7EOIGWf3Y7ymFnBulFTpVYApEDh8h/AbCdSZ6q/
	0g8ZItmD5Xx7jxIKI56CR699crljvsRGufKju8m0rAa7JDZDYre3g6RYS4Un4f6ElnaI
	7rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iqK1OldBm0zPm/+q1kEps+FYGUDkxVhS02sshETj1lo=;
	b=tEsmIAUcKqq8DvCSFTO1SndWSmltyysdubDhERo4DylsFLeHGx3j09Of2wtFgFGT9R
	Q3h0wEPk8Iq9zq0RxnGVMNc9OzBYVycPMUY5v3SUV9l12yhwX76GvQTdcWuJ0pB46qFQ
	Y/DTcSQDhmHRrY9R5tMmyAuBLv3S8LIMOAaWa345HrEAOKRi+2aHR8gNcfVO5R9E+Ru3
	xXfZ7AInCal6HWv5rHdsUHE5nacPkMgkfuuaB1/aSmo56ia2d/9+IHrSw8HPEVulB1z3
	MKfBxNXHeWQ9MT/JQx/CVrBZENjvEcS/c8Ob5Yi6s72uq+AqxCW8v6T1v9xY9C0K9D0x
	krzw==
X-Gm-Message-State: AHYfb5h5h3QWFYbb92kSyDY/L/6qKyXeza1EckcO/y2GspMxbgs9M51i
	pagl32j9jE1nEkvbFmoO9pCPaqflAg==
X-Received: by 10.31.156.135 with SMTP id f129mr4124762vke.90.1502996299915;
	Thu, 17 Aug 2017 11:58:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 17 Aug 2017 11:58:19 -0700 (PDT)
In-Reply-To: <CAMKF1sq4dfkVGynh3wZ3aGhQpD9ca1OnM_tVTi+7+q5bhd0Fsg@mail.gmail.com>
References: <20170817184445.10108-1-Martin.Jansa@gmail.com>
	<20170817184445.10108-4-Martin.Jansa@gmail.com>
	<CAMKF1sq4dfkVGynh3wZ3aGhQpD9ca1OnM_tVTi+7+q5bhd0Fsg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Aug 2017 20:58:19 +0200
Message-ID: <CA+chaQej7tyhk_zAkVri-UMgoXt3qDirSPDoMXDfQ0yCGpwr7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/4] qtbase: use openssl10
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
X-List-Received-Date: Thu, 17 Aug 2017 18:58:19 -0000
Content-Type: text/plain; charset="UTF-8"

It's not good, this one was included by accident.

openssl10 is useless, see:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/140957.html

BTW: it's in jansa/master branch, will push to master-next after more
testing (in parallel with 5.9 upgrade test).

On Thu, Aug 17, 2017 at 8:47 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Aug 17, 2017 at 11:44 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * fails to build with openssl-1.1
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-qt/qt5/qtbase_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > index 2115557..0afb232 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -123,7 +123,7 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
> >  PACKAGECONFIG[gbm] = "-gbm,-no-gbm,virtual/mesa"
> >  PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
> >  PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
> > -PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl,libssl"
> > +PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl10,libssl"
>
> seems good. Push whole series into master or master-next please
>
> >  PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
> >  PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
> >  PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
> > --
> > 2.14.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

