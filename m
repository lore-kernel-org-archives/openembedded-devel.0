Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2996E71016
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 12:57:23 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id q200so212195ykb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uaZpl+38zezTLCtOLP+o44PkaNgJNBVG1P2URCl08Bk=;
	b=cZQDMWYX0/xxihOoYHpNUwaTqdg1hWxcR3WP98k7nKcRENfPk2GVPb/QJGxaYgFA3F
	AAxJMUfi+iglbHezfEvb4nZNV1i28MpcXUI4h71+cw874fnTQ7/abxyBbhRUEk5zFB7q
	AFy9ayVL8NTaow2wo2UObxuvfn/3VhwlS0WXAM7hDnnoVAACXGnu5jMh1g3rw6NEC4SY
	lS8c5+E/3ZKykWCKTbzJe0xTfUJ5bKbND4Yh03IwjDtZ7f5PSCQ2svtdI71b4zKEIdFU
	ZTsR8jsh2L9jX4jUvbCdx2oN41ZJQO8mRrrP8j+AgHnrDaeQAOuoflHccQkvqnU9u0j1
	zL4w==
MIME-Version: 1.0
X-Received: by 10.236.30.65 with SMTP id j41mr2427106yha.105.1418129843877;
	Tue, 09 Dec 2014 04:57:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 9 Dec 2014 04:57:23 -0800 (PST)
In-Reply-To: <20141208232826.GH13319@denix.org>
References: <1415923750-17942-1-git-send-email-denis@denix.org>
	<20141124194833.GC25432@denix.org>
	<20141208232826.GH13319@denix.org>
Date: Tue, 9 Dec 2014 10:57:23 -0200
X-Google-Sender-Auth: LHY2KceR2vuNBTycWdVMsMg__tM
Message-ID: <CAP9ODKp9S0==V9=nWYD2yFGpd2K5+nBDxRwqrZN92p4h2mvV-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase_git: re-add OEQt5Toolchain to SRC_URI
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
X-List-Received-Date: Tue, 09 Dec 2014 12:57:25 -0000
Content-Type: text/plain; charset=UTF-8

The patch needs rebase; can you update it and resend? I promise to
look at it right away :D

On Mon, Dec 8, 2014 at 9:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> ping^2
>
> On Mon, Nov 24, 2014 at 02:48:33PM -0500, Denys Dmytriyenko wrote:
>> ping
>>
>> On Thu, Nov 13, 2014 at 07:09:10PM -0500, Denys Dmytriyenko wrote:
>> > From: Denys Dmytriyenko <denys@ti.com>
>> >
>> > The file is expected by do_install(), but _git version resets SRC_URI.
>> >
>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> > ---
>> >  recipes-qt/qt5/nativesdk-qtbase_git.bb | 7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> > index 96d86db..095bee7 100644
>> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> > @@ -25,13 +25,18 @@ SRC_URI += "\
>> >  # common for qtbase-native and nativesdk-qtbase
>> >  SRC_URI += " \
>> >      file://0011-Always-build-uic.patch \
>> > -"
>> > +"
>> >
>> >  # specific for nativesdk-qtbase
>> >  SRC_URI += " \
>> >      file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
>> >  "
>> >
>> > +# CMake's toolchain configuration of nativesdk-qtbase
>> > +SRC_URI += " \
>> > +    file://OEQt5Toolchain.cmake \
>> > +"
>> > +
>> >  SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
>> >
>> >  LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
>> > --
>> > 2.1.2
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

