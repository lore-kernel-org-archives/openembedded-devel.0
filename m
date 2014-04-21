Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8681665CFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 17:06:47 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so3804404wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 10:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ODDRCSiwcWdWU2DW8zLOU7XwkdSh0++pLsHbaA2zrpw=;
	b=JAbxTGkGV1dsMvReyiEWNJvo1y1zhGR1iE3rToeCTXHTclABSHwpxkeHQf0MZWnZJ+
	I+obyMoQaH1pbBi3UiiTMqnAXBLh8gxeZ0zk1hjcXsJ15CtUNlXPdN0ILJKnH+Il5s10
	pZnZJGH0AUxzCdfQkBoW6lDNsE2az3jnBt0m8VSrPcYN6PmjRisJGtBmFNOSzGjdsviW
	ZfZnSR7qPAnixB+hhVvP/Y1e9cpKUYqwelY58C7VDInqDHzYK0VM7zR5scByeoICXEY6
	cYaM7mVFx/Q9KT6vcxdV8+o6gnZQaEFsu2HYfpAF9Q0jtRVo5tgYVb10Z3S98GaX2iin
	9XqA==
MIME-Version: 1.0
X-Received: by 10.180.77.165 with SMTP id t5mr14971522wiw.38.1398100008374;
	Mon, 21 Apr 2014 10:06:48 -0700 (PDT)
Received: by 10.194.135.76 with HTTP; Mon, 21 Apr 2014 10:06:48 -0700 (PDT)
In-Reply-To: <20140420142506.GS2486@jama>
References: <20140420142506.GS2486@jama>
Date: Mon, 21 Apr 2014 10:06:48 -0700
Message-ID: <CAOLEWZUgsDTU4BqRdM0sDkGrjRtU-hPVWgncvzUbfFi_CaEzHw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: meta-oe patch queue
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
X-List-Received-Date: Mon, 21 Apr 2014 17:06:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin:

From what I can tell, it looks like the gnuplot patches got in but not all
of the gd changes?  I also don't see the gpm DESTDIR patch.  Can you check
if the gd license patch made it into your queue?  There was also gpm
DESTDIR patch sent on 4 April; let me know if I need to resend.

Thanks, Steve



On Sun, Apr 20, 2014 at 7:25 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> test-dependencies run finally finished, please see found issues in
> "State of bitbake world, test-dependencies 2014-04-18" thread and
> please help with cleaning those.
>
> That unblocked me to do verification builds on jenkins and merge most
> pending patches.
>
> patchwork wasn't working correctly for few days so it's possible that
> I've missed some patches from ML (I've tried to send replies to merged
> patches again).
>
> Please double check if your pending patches are merged or at least in
> master-next.
>
> Most master-next patches have some unresolved review e-mails on ML, if
> you want to get your patch merged in daisy, please resolve them soon.
>
> Here is my list of pending changes:
> hid .. means that the build was hidden by some other failure (e.g. gnuplot
> by failing gd)
> verify .. needs to wait for another verification build
>       (now I've used only qemuarm + qemux86, qemux86-64 build will run
> tonight)
> review .. unresolved comments
> fails .. fails in some configurations - issue was reported on ML
>
> pick 5c73b58 daq: Update from 2.0.1 to 2.0.2
>   fails
> pick 480d490 gnuplot: upgrade to 4.6.5
>   hid
> pick cefd609 gnuplot: added upstream license file and updated recipe to
> match
>   hid
> pick e7bacbc eject: Fix wrong return value
>   review
> pick c17f754 fbreader: remove old, non-building version
>   review
> pick f878793 bdftopcf: add recipe
>   review
> pick 71a7c56 terminus-font: update DEPENDS
>   review bdftopcf
> pick 4bc7f0d ltrace: update to version 0.7.90
>   review
> pick de15695 iozone: update version to 414
>   fails fetch
> pick 8fd92ed mariadb: add perl to RDEPENDS
>   review koen
> pick d8e24f7 gd: update to version 2.1.0
>   review
> pick e0759f9 gd: add perl to RDEPENDS
>   review
> pick e9e94a2 gd: fix the subdir-objects error
>   review
> pick 5f1593b postgresql: add init script and enable some bindings
>   review
> pick f396e78 vim: add dependency and selinux and acl support control
>   verify
> pick c08f3eb vim: don't check acl header if acl support disabled
>   verify
> pick 64ad76a vim: add knob whether elf.h are checked
>   verify
> pick 4b1be3a gnome-themes: enables the path to the icon-name-mapping to be
> specified
>   verify
> c11f2e3 nodejs 0.8.18: update to 0.10.25
>   verify
> 9f30d08 dejagnu: recipe taken from openembedded
>   verify
> 17be66b glcompbench: Create 2012.08 version
>   verify
>
> I've sent fix for gd now, so it's possible that gnuplot + 3 from 4 gd
> patches will be
> merged today.
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

