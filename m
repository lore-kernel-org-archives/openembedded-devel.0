Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id B196B746FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:15:54 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id v17-v6so6242163ybe.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jk2C3TjETKwP7jaScMgjESgnujOCLE634WP5ZFxkpw4=;
	b=rXVSny0Z4u6B0MLNalPWF5Wxh00yy9LpnN7wFfj75ox51gS7ezyrO/IG6PDjQxbMdG
	FdAA6Spju3nos61NT0V2s4uAJ9q8hXZJ9A49jOQLCpEX07gV86Wxxlbd0F/fMBf0ctWC
	8c7e9Qc7Whcxwqko5PH11OlnQ/CdTgj4BkvyCy/wEYuwD49P7m0ObeMTLVI9Yeutj0dh
	mtVFhYQS0XrXM+h2sE6GMsdB8JnfHn8JW697Cpiu6WgUUYoZzDku7g83D9JwDRQ0od1c
	ee2ituwQDCVJx58QcEoiOmEkLx+tQoi86leHxhq5a/CpiTUNrLCU4FEQlZ3DNWujlEXH
	kTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=jk2C3TjETKwP7jaScMgjESgnujOCLE634WP5ZFxkpw4=;
	b=eH9vPkqbt1Z6rOZJnr+3tPe1jF3JUr+zuL41OJgvjJi+IJ0cCjA6eRXwQ7UYWr6wuw
	aKReGLJIlbY6OanjLNZHA7SMm6kx2dSROmhquytxf9OQyPApy8JNLKs87JToUtGz3EKr
	1SZtrhkdwB7rhuJU3V3HSX2hKNKz4eJ9Zk5nQJlDMdmj1HgV5FHkGWiEJl/lZTqLc5uu
	57qQ8AZ6tSPPLLK4+BXtpabFWMz3zPxmWjqhvHg1FPDFtQlDUBmZUOanOJaDHC22SwWl
	dmdhnPFNSGsyuYXdlrL1rEMx7+kBxYRudBANO9dWThkGyhfPtow9CuAy0Rtr9eLYTZWy
	urog==
X-Gm-Message-State: APt69E10aS7SET7luGY529QGtjJSXnn4ErdeJUWm+byG/m+bMVlyVEe2
	lrp99xK+xOIIpff6mStuVNFzf2I8d49Xbv2L1bk=
X-Google-Smtp-Source: ADUXVKKTWRsR1PTGNlJBXID1yZFfHSeOiiWJkB7GpZRKg6GsmWmkB4XlKJ5QZ6BXM4P3W/JesUTjGIg+wYx5SIDJAAM=
X-Received: by 2002:a25:cc94:: with SMTP id
	l142-v6mr2919542ybf.121.1529342155324; 
	Mon, 18 Jun 2018 10:15:55 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:bf83:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 10:15:54
	-0700 (PDT)
In-Reply-To: <1883916.pZAjriCjz1@yow-masselst-lx1>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Jun 2018 13:15:54 -0400
X-Google-Sender-Auth: SNcQLuPRReneSF6ULYpHZoZItG8
Message-ID: <CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 17:15:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 1:07 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Monday, June 18, 2018 12:51:47 PM EDT Andreas M=C3=BCller wrote:
>> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
>>
>> <mark.asselstine@windriver.com> wrote:
>> > Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] we
>> >
>> > are getting a QA Warnings/Erros for 'installed-vs-shipped':
>> >     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
>> >
>> >     Files/directories were installed but not shipped in any package:
>> >       /usr/lib64/xfce4/panel/plugins/liblauncher.la
>> >       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
>> >       ...
>> >
>> > From various OE documents the .la files should not be packaged in
>> > either the main recipe package or the -dev package unless required. So
>> > inherit 'remove-libtool' to have all the .la files cleaned up as they
>> > don't appear to be necessary.
>> >
>> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> > ---
>> >
>> > This error is currently only seen on master-next since the xfce4-panel
>> > upgrade commit is yet to make it into master. As such this fix is only
>> > applicable to master-next.
>>
>> I think it was not the upgrade -> 4.13.3 commit but later commit / same
>> series
>>
>
> Sure, I can update the commit log and send a V2 but first let's sort out =
the
> remainder.
>
>> various classes recipes: Remove FILES entries for dbg/dev packages
>> ...
>> --- a/meta-xfce/classes/xfce.bbclass
>> +++ b/meta-xfce/classes/xfce.bbclass
>> @@ -12,11 +12,3 @@ DEPENDS +=3D "intltool-native"
>>
>>  FILES_${PN} +=3D "${datadir}/icons/* ${datadir}/applications/*
>> ${libdir}/xfce4/modules/*.so*"
>>  FILES_${PN}-doc +=3D "${datadir}/xfce4/doc"
>> -
>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*.la"
>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.la"
>> ...
>>
>> My builds have remove-libtool enabled so I did not see this QA
>> warning/error.
>>
>> Isn't remove-libtool enabled by default since pyro/2.3 - so that this
>> patch is obsolete (and all the other same kind coming later)?
>
> The documentation still indicates:
> ---
> <note>
>             The <filename>remove-libtool</filename> class is not enabled =
by
>             default.
> </note>
> ---
>
> So as far as I know this still needs to be handled recipe to recipe by
> inheriting the remove-libtool class in the affected recipes. I have done
> builds without manipulating the generated local.conf which seem to confir=
m
> this but I could be wrong. Add RP who might have some guidance.
>
> MarkA

Just hit another one
---
ERROR: gtk-xfce-engine-3.2.0-r0 do_package: QA Issue: gtk-xfce-engine:
Files/directories were installed but not shipped in any package:
 /usr/lib64/gtk-3.0/3.0.0/theming-engines/libxfce.la
 /usr/lib64/gtk-2.0/2.10.0/engines/libxfce.la
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
---
Andreas, seeing as you didn't hit the 'installed-vs-shipped' QA issue
with thunar recipe I suspect the reason you didn't see this is not
related to remove-libtool but rather that you have disabled the
'installed-vs-shipped' QA check itself.

MarkA


>
>>
>> Andreas
>
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

