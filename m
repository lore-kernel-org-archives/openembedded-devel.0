Return-Path: <martin.jansa@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1F48A6E6B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 17:52:21 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so5472014yhn.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 09:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FSBi7MrVaky03GdLnXgrmPT3e6WbSv0fi/i4MwSZo/Q=;
	b=I6keEPh4mKmcfrilDT89xUJi0DAmOjY2malW4i/YFcGbKJjBLODq0edQLcIF3VNiF1
	WKPARJhd6hwkA56bBuhv2/7FLahfBhj2n2s4458m2RURGvBLHHblw2kl2zDU/EHM8atr
	HUDY296yNXq905jjRygIr8xhYhqKxzF4J+d8cLPIf2P2KGyfOoHk7s5r/1M+0aRywecX
	ab8V4r1xd1VsKgPimKECunHKDlZpGAbyZGP3oXKjUjwsA//8Mfre8nh/QMGtunYINlc1
	Ye98eOMLLZmS52h+ATLLoz+0PIWtPeQQFvXMVgbscJjeZvcgrh2nLbAyjcS5VDpBjj0C
	N1yQ==
MIME-Version: 1.0
X-Received: by 10.236.87.1 with SMTP id x1mr18279816yhe.51.1392054741877; Mon,
	10 Feb 2014 09:52:21 -0800 (PST)
Received: by 10.170.205.66 with HTTP; Mon, 10 Feb 2014 09:52:21 -0800 (PST)
In-Reply-To: <CALbNGRQwnmOWkUC9dTWTBHnh0odWSUm5L8s9Xz8wOK7pKtz86w@mail.gmail.com>
References: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
	<1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQwnmOWkUC9dTWTBHnh0odWSUm5L8s9Xz8wOK7pKtz86w@mail.gmail.com>
Date: Mon, 10 Feb 2014 18:52:21 +0100
Message-ID: <CA+chaQfw=d8U74hZJJtPfQuDTkQk72a2Ldma+XMo9jdFXOiuHA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch
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
X-List-Received-Date: Mon, 10 Feb 2014 17:52:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ah sorry, it wasn't included in "stable" branch of meta-qt5/qtbase which I
used to rebase for 5.2.1, I've seen your patch already, I'll integrate it
in next few days.


On Mon, Feb 10, 2014 at 12:47 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Thu, Jan 9, 2014 at 5:48 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > libraries based on cmake and depending on qt5qml failed to configure
> with:
> >
> > |   The imported target "Qt5::DBus" references the file
> > |
> > |
>  "/home/a.mueller/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/qt5/qd=
busxml2xml"
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  .../0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
> | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-dete=
rmine-pa.patch
> b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-dete=
rmine-pa.patch
> > index e3f1b72..ea3364e 100644
> > ---
> a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-dete=
rmine-pa.patch
> > +++
> b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-dete=
rmine-pa.patch
> > @@ -54,7 +54,7 @@ index 1d94715..617efa8 100644
> >       set(imported_location
> \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUF=
FIX\")
> >   !!ELSE
> >  -    set(imported_location
> \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
> > -+    set(imported_location
> \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2xml$$CMAKE_BIN_SUFFIX\")
> > ++    set(imported_location
> \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
> >   !!ENDIF
> >       _qt5_DBus_check_file_exists(${imported_location})
> >
> > --
> > 1.8.3.1
> >
> This one is back in 5.2.1. Shall I send a patch?
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

