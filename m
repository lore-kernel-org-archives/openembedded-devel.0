Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 56F54606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 21:20:06 +0000 (UTC)
Received: by padbj1 with SMTP id bj1so22399023pad.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2015 13:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8pq2W51q897eBS2TtVqNbBwIsrwDeJlVJHC10coJFvU=;
	b=s4fZGGHV7M81EM5pSzFuyzpEugynaQkSKussGPH1JwZbUJx+NlDtUsKJlOeOy/ZyU8
	Q4JXGZrOeOf6CAzPNT4K+0d++r8iVbM4LjEGNRV9cxtnz6Jq3OgdTdQCNBAPHk5KtieW
	4a6BhWq1uOigAMidk3MiR0Olu/Ci3LfdKg5dzDltvULc1AEyxMyTgkp/EtLPr9yRPR3D
	VN5ZbDW4YF4EbuVYdMtcXITiFb/b5exiwtVcrWDl65AuJ4cGlhj48hhGXUDCUX9eFQNR
	AfAehxmcyBjOw6zgNIBGaDr6mVfuJ/QLE8FXfySBVi3xFz3l7oWhdaAcLLuJ1SxBOE5d
	G/sQ==
MIME-Version: 1.0
X-Received: by 10.70.101.225 with SMTP id fj1mr13832187pdb.69.1424640007754;
	Sun, 22 Feb 2015 13:20:07 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Sun, 22 Feb 2015 13:20:07 -0800 (PST)
In-Reply-To: <CAK8F28nFL+h-YSRo+ydn1+_OsytChTco7UPD9aHMNSjaO36Z-g@mail.gmail.com>
References: <1424621742-17713-1-git-send-email-ashcharles@gmail.com>
	<CALbNGRR1Q_JOMPPWR21-Y0WmQGTA=r8TRDuSfRwUUsV-yh11Xw@mail.gmail.com>
	<CAK8F28nFL+h-YSRo+ydn1+_OsytChTco7UPD9aHMNSjaO36Z-g@mail.gmail.com>
Date: Sun, 22 Feb 2015 22:20:07 +0100
Message-ID: <CALbNGRTLC3TRDDOkce6VTGaiwKmKtO=PCuXJOZ7EyDMzq=X=Og@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-session: Make package MACHINE specific
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
X-List-Received-Date: Sun, 22 Feb 2015 21:20:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 22, 2015 at 9:48 PM, Ash Charles <ashcharles@gmail.com> wrote:
> Hi Andreas,
>
> Good question.  I just tried removing it and didn't see an error when
> building the package but it is not clear if this was trying to deal
> with a runtime or build-time error.  Do you happen to remember?  I
> tracked through the commit history but I think this has been in the
> recipe since it was first added.
>
> --Ash

It is a runtime error: When you start XFCE a error/warning pops up
telling something <MachineName> missing. I can't remember exactly. I
even don't know if this error comes up once on first start or on every
start. Could you give that a try? Maybe this quirk is no more
required.

Andreas

