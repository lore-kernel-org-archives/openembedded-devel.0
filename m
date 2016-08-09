Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC567325A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 21:47:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1470779260; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=FHBcC4KYtVqkqrRnob2z22DG5uUtN4vCi8CR8hZXZ6Y=;
	b=OMGm14wkyiABSxfqsf4ktWeiPmJNCLDnevORBMMgE5QMBcs58/6typ8YJhME4gVVdtqarL7d
	ExPe95uuO6VxODf+DPF2f0l2h8rkRV2BomayA9jOmNJioip2sIBNQlirV8XuUEnSobGFSkVB
	ah1rf10mm/bij3ew2RIs65sKmT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=X68cs+PbfetGjVBB/b/kgNPCnD0ASk13JTEqOvPnWBG47dVWdLYCvTIYp+zFWqRgBkdZDF
	9o4uBb7VpcUAMpIGGMkJUoZ8shQ34+zNkQc0ggV7EvJIR42cc9ugF3Filjagre4mo5ZA7hw+
	49w4dJR99J2Pifs2ztHfc4Rt0iTjs=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 57aa4f7c.7f02782348f0-in06;
	Tue, 09 Aug 2016 21:47:40 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x130so23945809ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 14:47:40 -0700 (PDT)
X-Gm-Message-State: AEkoouud7jPAZgfxdxbdaPunXvMtuOzBbZOIT+lbQSZwjebij9mGZfksbLG22L5LywcULcSj71by/YFSY5RuPw==
X-Received: by 10.36.87.140 with SMTP id u134mr1618037ita.38.1470779259682;
	Tue, 09 Aug 2016 14:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Tue, 9 Aug 2016 14:47:39 -0700 (PDT)
In-Reply-To: <CALbNGRSU0OHifH7801P_k0ig+QokGA_9=Ck=UZ2JGeSAWrdKag@mail.gmail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
	<1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQeTP0PgC1bSucTyQkt0=tAC0KcEmYA1mRL0Uu+xmu4zRA@mail.gmail.com>
	<CALbNGRSU0OHifH7801P_k0ig+QokGA_9=Ck=UZ2JGeSAWrdKag@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 9 Aug 2016 17:47:39 -0400
X-Gmail-Original-Message-ID: <CADNbA1qOkceqffLgwE+xZEWafxg+wr8VsLuZGFr9fgr3EPFrQA@mail.gmail.com>
Message-ID: <CADNbA1qOkceqffLgwE+xZEWafxg+wr8VsLuZGFr9fgr3EPFrQA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/5] libmbim: update to 1.14.0
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
X-List-Received-Date: Tue, 09 Aug 2016 21:47:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

All it takes to fix it is add an inherit for bash-completion.  I can submit
a patch to fix it if you'd like.

On Tue, Aug 9, 2016 at 10:04 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Sat, Aug 6, 2016 at 9:23 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > ERROR: libmbim-1.14.0-r0 do_package: QA Issue: libmbim:
> > Files/directories were installed but not shipped in any package:
> >   /usr/share/bash-completion
> >   /usr/share/bash-completion/completions
> >   /usr/share/bash-completion/completions/mbimcli
> >
> >
> > On Sun, Jul 31, 2016 at 4:15 AM, Andreas M=C3=BCller <
> > schnitzeltony@googlemail.com> wrote:
> >
> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> ---
> >>  .../libmbim/{libmbim_1.12.2.bb =3D> libmbim_1.14.0.bb}
> |
> >> 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.12.2.bb =3D>
> >> libmbim_1.14.0.bb} (80%)
> >>
> >> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> >> b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> >> similarity index 80%
> >> rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> >> rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> >> index f1ecce5..f2b8df6 100644
> >> --- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> >> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> >> @@ -12,5 +12,5 @@ DEPENDS =3D "glib-2.0 libgudev"
> >>  inherit autotools pkgconfig
> >>
> >>  SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.
> tar.xz
> >> "
> >> -SRC_URI[md5sum] =3D "921fb5ab3f13f1e00833e009d8f3b4f6"
> >> -SRC_URI[sha256sum] =3D "949351d3e3d69b81e40a49f1d18794
> >> 4c26149e0647a415f0227ccdc112047b29"
> >> +SRC_URI[md5sum] =3D "2ed809e65c85353d3ab59e372890e549"
> >> +SRC_URI[sha256sum] =3D "ca8d52a95a18cbabae8f15f83f1572
> >> 316e888b6504f946e6645d24405127ab5b"
> >> --
> >> 2.5.5
> >>
> Cannot take care currently - it is added to my TODO stack.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

