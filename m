Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1BE57D68D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 14:29:22 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t28so19312195qte.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qopPyfeZ+jU4AuaSnXZO1E3EbEJLu2doXKmWfwcPuQE=;
	b=CgVVzEXh9p8c7WRwijawfaUBOtaVw594AWRkcGS31qeDykJQITDiLAK+hIX/CyeKc7
	RJWWni46xJLw+13rmds2bIZULfRNDC2l4zUvdwfFie2zP0eLhoarVDG+sDW/+me7LbtP
	42QVSzeDavUb1PVPV1jVvwrOtnFBUK+PsNpw/P4DU+dEsK1XIRkyubBihuZwDTdH4za0
	b215aVmucKEwz4FzzFWZNDfmI0qlMD6pry7NtXoTsHcxnBvyWsx3V/mhb6lsLidtOlku
	UQLIoozYtYqNQ/ZdHXAy3cn+daLdGBwkRIgGNe60MBoJHEhL9xO0J/f1bAL2X5lxmjRj
	/xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qopPyfeZ+jU4AuaSnXZO1E3EbEJLu2doXKmWfwcPuQE=;
	b=AqxExzdVEh66LY7gty0+6gOnSYfgB9/beBbTgk4sUnkI3PADEs+Ljs3p+uEbgNlpKG
	T2y8epblfpV/f1niGhApuPlEaiVWpaHbmL57uq/FOcmwte6sfWI3Com9c+bVcJZE+Son
	nwqqFAxQRezE0AguehBYQZBg13DjUNdDFVQ1FN1AyTt8nIN5iMZlf0MzBiZ6mHaR9PJR
	xCIB5AmS6draaFv5RGy4UzFHkAc3RTqDnRIyrs/fTsRRd2ZW4qCcYmT/kwYsFKOFSvXF
	SML9UXtY6ML8UctZ0JJVgf8acxcEyTGxFtUxSKCkza5eCgKbRkXDSuq8b+Fd9G0SM8NC
	44uQ==
X-Gm-Message-State: APjAAAW83BWrl2ORSpS58+FZRG81yDcO/IBt3yq/LOX6wB03zwQp+wIN
	h21LBopAJJa/oZZxqPm+S3ykghDV2Xzv90Hz+QJvTA==
X-Google-Smtp-Source: APXvYqyYVyRxNsbCc1xu/k0jLQ/AgW8u6UGtOtjcTY7cqf4WPfucRG9Xx3s8sLYcUihkbwEiBwp4ZKXx9nzwTE2eMC4=
X-Received: by 2002:a0c:81a9:: with SMTP id 38mr59346464qvd.208.1555338563549; 
	Mon, 15 Apr 2019 07:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190410043244.12131-1-raj.khem@gmail.com>
	<20190415114410.GA9707@localhost>
In-Reply-To: <20190415114410.GA9707@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 07:29:12 -0700
Message-ID: <CAMKF1sozBega6PU4PfMLohbtpEXRt_Z4r=KRCXqAjoPHXWdwDw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2] ledmon: control hard disk led for RAID arrays
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
X-List-Received-Date: Mon, 15 Apr 2019 14:29:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 4:44 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Apr 09, 2019 at 09:32:44PM -0700, Khem Raj wrote:
> >...
> > +musl does not support on_exit which is used in clean up.
> > +Instead use atexit with is supported by musl and glibc.
>
> The functions have different signatures, and this patch introduces bugs
> for cases that use the parameters of on_exit.
>
> int on_exit(void (*function)(int , void *), void *arg);
> int atexit(void (*function)(void));
>
> Example:
>
> >...
> > +-    if (on_exit(_ledmon_status, &terminate))
> > ++    if (atexit(_ledmon_status))
> >...
>
> static void _ledmon_status(int status, void *ignore)
> {
>         if (*((int *)ignore) != 0)
>                 log_info("exit status is %s.", strstatus(status));
>         else if (status != STATUS_SUCCESS)
>                 log_error("parent exit status is %s.", strstatus(status));
> }
>
> With the bogus atexit change no parameters are passed to _ledmon_status,
> and the function uses (and dereferenes) whatever garbage is currently
> in the stack/registers where function parameters are expected.


Thanks for looking into it and This is correct somehow I overlooked it i
will send a follow up to not rely on arguments for on_exit

>
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

