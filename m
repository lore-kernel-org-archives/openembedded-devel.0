Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7E1677980
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:13:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so25383275wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bw8F2rS8BWDoMuE+95aEkLz19yGCr3w7WOdYIXMpdeM=;
	b=QS1FzFQAUnrza+52j6F3rEv3rHAjnxLLXR19N+urFtW4eydTcabINKU6QkyBLjMZjk
	jhjo0Pc9/sU5sXcz82MuJygbwtK3r7SixTb3xFDieCFWAevnluWUzguwOWNcUN1XStIv
	tx5fiueI2h6eqo64dwM2iTNL62K2NFKlAdwca95ruZWILjvUs13rtGAxHDT//NfpJFjl
	a45DBO38ZYTF41IPv1a392T3gEx/g+rvdxXHERf7v22zOpVXHs8tVabqQaCQFurA/gUi
	lGcWzH9Oy+ms+anZESZBsV+vHHJK8qPHJmk0F7f9QprAu5e5+xcQZHf/4xhWWBH21vLP
	FgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bw8F2rS8BWDoMuE+95aEkLz19yGCr3w7WOdYIXMpdeM=;
	b=QCU9heI6SHljEIwD5MIS7G0vLXGNmHQHv7UN+31XCrHbnV4NZnq3OcSKkp9PaHqBbq
	5uIRTJd/cs8hE3yxF20pYY4iywI/TR7OvkwmOXQJbBencu+KsFBIN33GirB3Gt/sBkr3
	5fpnOV7gs94hrvcavasm6iDjKMFW2gz9RdTNdAgwoi3RbRQ+04VjvarkBTSFczNNpimX
	Lj9A6Ab5fCj/ZykbrFY/0S6HvRLw5vcnLAcjgsGs386e4MXRcEa6u3FDA8v9WpFDP9+g
	PCbOGxlQoO5PKXVGwAzr65OWlmnf5LvJ9OB9O5Xc/EPWBliKyioOs8KBFlyNnRMI9r7T
	4rTA==
X-Gm-Message-State: AN3rC/6J0iDY9hsutW597nooDPfSiDZLeUBMp8g5lg5Dvph+Y+GjZkvH
	jl0hvFeIHpGeO5WH3q45/no+TymoTw==
X-Received: by 10.80.173.203 with SMTP id b11mr5534316edd.110.1493129638287;
	Tue, 25 Apr 2017 07:13:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 25 Apr 2017 07:13:57 -0700 (PDT)
In-Reply-To: <CAMKF1srVm+Db5KJnJj6Z16JhM83t1=KhWhJ_9JWJ+Ef+CZFvng@mail.gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
	<20170425121114.GA28641@jama>
	<CAMKF1srVm+Db5KJnJj6Z16JhM83t1=KhWhJ_9JWJ+Ef+CZFvng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Apr 2017 16:13:57 +0200
Message-ID: <CA+chaQcHwO4RLYsEyu-p8_OjORrXxc26AWzMNT=D9MnzhDCB0w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 01/17] musicbrainz: Upgrade to 5.1.0
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
X-List-Received-Date: Tue, 25 Apr 2017 14:13:58 -0000
Content-Type: text/plain; charset=UTF-8

ok, I've squashed the fix into it and added it again to master-next, with
some of the new patches added from kraj/master branch as patchwork doesn't
work (I've later removed the last one as it doesn't work without the glibc
upgrade).

On Tue, Apr 25, 2017 at 3:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Apr 25, 2017 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Sun, Apr 23, 2017 at 10:20:42PM -0700, Khem Raj wrote:
> >> Drop uclibc specific flags
> >
> > http://errors.yoctoproject.org/Errors/Details/141292/
> >
>
> The patchset I sent yesterday has a fix for it.
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-April/112514.html
>
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb           |
> 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
> cbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
> cbrainz_git.bb
> >> index a6a4f6a8a..250c5f14e 100644
> >> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
> cbrainz_git.bb
> >> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
> cbrainz_git.bb
> >> @@ -5,17 +5,14 @@ LICENSE = "LGPLv2.1+"
> >>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=
> fbc093901857fcd118f065f900982c24"
> >>  DEPENDS = "expat neon neon-native"
> >>
> >> -PV = "5.0.1+git${SRCPV}"
> >> -PR = "r1"
> >> +PV = "5.1.0+git${SRCPV}"
> >>
> >> -SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
> >> +SRCREV = "44c05779dd996035758f5ec426766aeedce29cc3"
> >>  SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
> >>             file://allow-libdir-override.patch "
> >>
> >>  S = "${WORKDIR}/git"
> >>
> >> -LDFLAGS_prepend_libc-uclibc = " -lpthread "
> >> -
> >>  inherit cmake pkgconfig
> >>
> >>  do_configure_prepend() {
> >> --
> >> 2.12.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

