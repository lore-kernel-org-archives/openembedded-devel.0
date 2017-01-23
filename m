Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 06DB677225
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:24:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1485192287; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=czBjUxYAIm0EW6IdfzcKJeNsq9zgfm41NrpzAX6VUms=;
	b=KnDb1BQlVB7zdK5kzj8um/fqo+YOVEfsti4HyZ06od71jAtjmNH6FbpWkBQYShDyeClw1mhv
	wfyZ+qfrB+xy9pRvsaGb8h3EVlGQVDDB7ssYZ063Izic7qf4XlegBy78V2VtdU7QQzGfnIW4
	+Y1Z+HUIDo3HEJyruFL3vaZhbvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=qfweR4xAw/DL9L2B86k9oeTfGgO3OP3PiuwtZY5P+Hcmy3LUQCGTRcp/I5nc+vv5As41AJ
	yOdXFlzovcyJuUy870ycJPaQ7bzeTk/EDqwRV98twAX4Kx876K7rTFl94RMXcGiBJUQb+z34
	fA3RK4hCYms3zuffxPYsmpz7FcsDo=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mxa.mailgun.org with ESMTP id 58863c5e.7f16a872d130-smtp-out-n03;
	Mon, 23 Jan 2017 17:24:46 -0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id c7so71079773itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:24:46 -0800 (PST)
X-Gm-Message-State: AIkVDXLzBMAr0l40rZE7EWklrT0Lq/XVi9sbvaOOUbDW5TWb8MgWrgK3AX0sK+03TzFmggc/vWznsFKCikueGQ==
X-Received: by 10.36.108.15 with SMTP id w15mr15294732itb.73.1485192286381;
	Mon, 23 Jan 2017 09:24:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Mon, 23 Jan 2017 09:24:46 -0800 (PST)
In-Reply-To: <CAMKF1sru-NCscOLHy-qSNJEhj9kV8p8awEhsmOK2N5sMWxnGQA@mail.gmail.com>
References: <1485188858-12081-1-git-send-email-derek@asterius.io>
	<CAMKF1sru-NCscOLHy-qSNJEhj9kV8p8awEhsmOK2N5sMWxnGQA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 23 Jan 2017 12:24:46 -0500
X-Gmail-Original-Message-ID: <CADNbA1psTQ=ctFNOpbsCx4hwvzB=i-f3HYq6aJN0YwBPL3-49A@mail.gmail.com>
Message-ID: <CADNbA1psTQ=ctFNOpbsCx4hwvzB=i-f3HYq6aJN0YwBPL3-49A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-flask-bootstrap: update to version 3.3.7.1
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
X-List-Received-Date: Mon, 23 Jan 2017 17:24:48 -0000
Content-Type: text/plain; charset=UTF-8

It isn't needed.  That was a poor merge on my part.  Thanks for the catch.

On Mon, Jan 23, 2017 at 12:06 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 23, 2017 at 8:27 AM, Derek Straka <derek@asterius.io> wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  ...ask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} | 8
> ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-flask-
> bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} (51%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-flask-
> bootstrap_3.3.6.0.bb b/meta-python/recipes-devtools/python/python-flask-
> bootstrap_3.3.7.1.bb
> > similarity index 51%
> > rename from meta-python/recipes-devtools/python/python-flask-bootstrap_
> 3.3.6.0.bb
> > rename to meta-python/recipes-devtools/python/python-flask-bootstrap_
> 3.3.7.1.bb
> > index a115f23..05a02c6 100644
> > --- a/meta-python/recipes-devtools/python/python-flask-
> bootstrap_3.3.6.0.bb
> > +++ b/meta-python/recipes-devtools/python/python-flask-
> bootstrap_3.3.7.1.bb
> > @@ -1,15 +1,15 @@
> >  DESCRIPTION = "An extension that includes Bootstrap in your project,
> without any boilerplate code."
> >  LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3452e378337a5cc2092d32a140178d
> 5a"
> > +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a2106
> 19"
> >
> > -SRC_URI[md5sum] = "b8aedbe51f2bf511af955f2bc288cd8c"
> > -SRC_URI[sha256sum] = "3a7b71e22596a6d559965e05995896
> 0e0bb671adc131537a79edb491a8f31714"
> > +SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
> > +SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a
> 3f13c53e1baabb8d72b5da4545ef123ac8"
> >
> >  PYPI_PACKAGE = "Flask-Bootstrap"
> >
> >  inherit pypi setuptools
> >
> > -RDEPENDS_${PN} += "\
> > +RDEPENDS_${PN}_class-target += "\
>
> why is this change needed ?
> if its needed so that its only done for target recipes then use
> _append instead of +=
>
> >      ${PYTHON_PN}-dominate \
> >      ${PYTHON_PN}-flask \
> >      ${PYTHON_PN}-visitor \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

