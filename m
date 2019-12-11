Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id C04997FC84
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 04:20:22 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id q19so5175320qvy.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 20:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KZkSZZtzy38cyTGrrl/xMXXd39mvTUOR2Ce7pq0JceQ=;
	b=TgBWUDvIAN7wZCNgNtLB7aVRtK7MFK+SGtAzq8dgzO220tZvollnPk9NFfP3M4hbvZ
	CNqDkiA+lufkwWav02IRGCQE3cDvHhF8pv9wc8wAYhFxrFjD9UsaPORYSCIToDjWPhYy
	FVym1mif6dgVZw0OrvHhF3v+vNlHI84/zG7emcJdR3YGdCDv80o1XJ3IDbswDLW5uKPa
	HZQhYh27MObRXEQMa/8//2URtekodHumg1xLenBzGak/K/up4k7QnzQeQBgV7+ZcXRA8
	J8Ir5E3U/Ud5CaPQQy+wK1OvCSZqAxEbx5txHkvdw3KaSOx2OBJvHXrkUqfqasBWpc0h
	mTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KZkSZZtzy38cyTGrrl/xMXXd39mvTUOR2Ce7pq0JceQ=;
	b=ZdUuyEeFLo5/zERk3awqo+dLZpLRZdrteg0fVlWcqu29mfNuIjPZnttEX0OhAlzBxT
	1KdbsHV6Hj4gHi/RLs6EnJKwQ10ZU1i3ZPXXgWZ5BEGcM9NaVvikHF0XV3emUFb9/id0
	S02td360vE+aWDbg4XY0WrBR7O2uJ8+/OWTWVMdDP+ZJUwfXKe1KPtAqBPVPKjgyAusf
	+zR55cyCrr8gJQPIK7YjiPUs91wS1yzNuxPF8kN5AdAOwYPRdLjvX3VcKq5lCIiO3A6J
	/pdWfVH3RlYtUfujntx4V1sCJNX8R2HDnXiBv1MwHVN2IIXd7ncYRf+SLpP2zO/mRJeC
	GlAA==
X-Gm-Message-State: APjAAAV6sKZb+rnjR8Q1ds5l+/z/wmTNmMHVn1fUOH7uUTSQMvscPPzg
	ieD8c4exwf7tJ6aTvYDx9ztDDGfzOxxSqTqLUrk=
X-Google-Smtp-Source: APXvYqyYTxZ0NY48Hprkr3Lwgp7cqGBDWcdGS6n6nYsE8lg2qcMczibBXZ1eZUoXLrtnYEG+eu3F4EPwUAQT+fun+qY=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr1197374qvm.206.1576038023361; 
	Tue, 10 Dec 2019 20:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
	<CAMKF1spvn+Uqi2q4QsxajLcY0wjPN6dG3vSW-gS4=qmu2dcrbQ@mail.gmail.com>
In-Reply-To: <CAMKF1spvn+Uqi2q4QsxajLcY0wjPN6dG3vSW-gS4=qmu2dcrbQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 20:19:57 -0800
Message-ID: <CAMKF1sovYLH8_eMN6V9n2ZwqA4G2pzMFd_O_ToqVAgAca19stQ@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to version 6.0.14 and unblacklist
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
X-List-Received-Date: Wed, 11 Dec 2019 04:20:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails with clang http://errors.yoctoproject.org/Errors/Details/296908/
> I guess it needs to use KERNEL_AR
>

It really is generic issue fails with gcc too
http://errors.yoctoproject.org/Errors/Details/296946/


> On Tue, Dec 10, 2019 at 1:39 AM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > ---
> >  ...oxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} (92%)
> >
> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> > similarity index 92%
> > rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
> > rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> > index 0f8d7af3f..bd7339e1a 100644
> > --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
> > +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> > @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
> >  SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
> >      file://Makefile.utils \
> >  "
> > -SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
> > -SRC_URI[sha256sum] = "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
> > +SRC_URI[md5sum] = "2766d6f628dcd8f0bc216d0f8a2abc8e"
> > +SRC_URI[sha256sum] = "5e12b14f0c38bf195d9592d76a9e0a128df2d38cd77c26ce5b5488397715dd0c"
> >
> >  S = "${WORKDIR}/vbox_module"
> >
> > @@ -78,6 +78,3 @@ FILES_${PN} = "${base_sbindir}"
> >
> >  # autoload if installed
> >  KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
> > -
> > -PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
> > -
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

