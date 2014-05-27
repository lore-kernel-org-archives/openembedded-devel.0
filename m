Return-Path: <ashcharles@gmail.com>
X-Greylist: delayed 499 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 00:55:13 UTC
Received: from mail-ve0-f174.google.com (unknown [209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF36A6FA2C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 00:55:13 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id jw12so9901808veb.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 17:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1UpA48Oq3OU63hFemY4AwjRUUpJx5Zed9qhQDs97XkQ=;
	b=adv5iLXDpsr094GN+EtaSqN1GNyY+kVLzg7L+lisv3p6+eX6Ytvgd5VXISN65e55Y3
	t99l4/BG+Cl9DJrbbDanjb8MsxTUsrv1avMFFFr/rTdbx146JC1BSicd98JYvhTGvtFo
	MLaoy7VriT2XJz4THHwu1KwSH7dF4AFUfEatOHo7cMZR0kkFHZowSRPUI4dCgcaM858I
	fv/YGQB8AzrF41ZQ1iAxjp8F+woja4S3rbkNok011Fp0egrCwG9uJH4Bg02urSGYU+s7
	4ueEjW5ThrPlR9uvesS0v7TjpwmAWQ63tvI3Fheml8tRt34kfGTiZBRuZ+G118wMPlQe
	CU4g==
X-Received: by 10.221.42.135 with SMTP id ty7mr23838669vcb.14.1401151615109;
	Mon, 26 May 2014 17:46:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.227.67 with HTTP; Mon, 26 May 2014 17:46:25 -0700 (PDT)
In-Reply-To: <CAK8F28mJTm+xHD8uyzF00xUpz=q7fpn4EC4Ao-tUqX-eQquZBQ@mail.gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<CAP9ODKoyYcRb7jJ9GWWvqLNCJ5Sy5fhYLL8vNG6vSRyBpmeCtw@mail.gmail.com>
	<CAK8F28mJTm+xHD8uyzF00xUpz=q7fpn4EC4Ao-tUqX-eQquZBQ@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 26 May 2014 17:46:25 -0700
Message-ID: <CAK8F28=V27aeFP9cejf8cty8=_WR-uQscAKiKj4JC8DCFa0=MA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 00:55:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 26, 2014 at 3:09 PM, Ash Charles <ashcharles@gmail.com> wrote:
> Okay---that makes sense.  I'll send a v2 with these fixes.
I tried the patch below and sent it along to the upstream maintainer
as it fixes the problem when I build locally.  When bitbaking though,
it looks like the autotools.bbclass dispose of the $(srcdir)
change...darn!  Any suggestions? This is readily fixed with
autotools-brokensep....

--- eject/Makefile.in   2006-06-03 18:59:08.000000000 -0700
+++ eject/Makefile.in   2014-05-26 15:58:08.031605669 -0700
@@ -72,7 +72,7 @@
 eject_SOURCES = eject.c
 volname_SOURCES = volname.c

-@USE_NLS_TRUE@SUBDIRS = po
+@USE_NLS_TRUE@SUBDIRS = $(srcdir)/po

 AM_CPPFLAGS = -DDEFAULTDEVICE=\"$(DEFAULTDEVICE)\" -DGETOPTLONG
 AM_CFLAGS = -Wall $(RPM_OPT_FLAGS)

