Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C32FD77E23
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Apr 2017 07:16:01 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u18so25549285wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Apr 2017 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=owQfy3UrSoGW+yRXA/t0+Qz2X1TngEQhsP79G4btmoA=;
	b=qpLlqMjZLrW7MGO6JTtD5FeQvHaVeHZ6GlP7P3hX27ZAldLQT+YOfwNt6PyURN9MdJ
	xAqpi5O69Zg0C4FrWHbHQ+24z01CdEEDSLWFFQfYU+yVes618g/I7loTSaERHoereZY7
	ZqK2w8F7PGAhV0HyLS/2mZpAxmJYbRsSb0DRAs0v+v/FcQebWx9xMtjChZOw1yw3RMgl
	iNwK1gb8QPH50cze9mV+kggZbSqUWDuazgc6K3gowmKe62bXxIZ9sWr2P8kN8OzUtsUm
	uBqkV9/GhlEvdpkheBIqmo7h21RH8ovl4BQUxSkE3hc9Hnap+QFaAUGySR9nK6lpyHq3
	KjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=owQfy3UrSoGW+yRXA/t0+Qz2X1TngEQhsP79G4btmoA=;
	b=hC46i0KsoeCoMR4JN+z4vjt9DxFUkgn2jzxSDHSRHxA3s0QXPGwJcKXCmRE528x9Kt
	Yc5G4B1frWoXcb00gpEk+9JcOCOPa5+JSsusC+F/78H2wAdEQwbjTwmE7TYqVuVZNpie
	yC5kGNj+T5vYQgOvYxxGMkAiHwRZ1VLnIFxwJ1jdJiSZdsVtZdaTjO5siE/E2kcswRcv
	qboPKcGS35TluU+LmXfaGyFYkjDQRE7sjLkGSR72jp5G7kdcimsyUAPIsqX+Gh0gGHEQ
	yMeCCnEXy70NR9f3tXqgNqk246rRT/T6mRsM0rcJbjr16i+OJu9pctvDJ9ELn+88QWWc
	Fhww==
X-Gm-Message-State: AFeK/H0h0cyKnyyO3H1wHS9KU1QvmZiNUmfcXwgP2+Xw9oNaSKml1L0Z1nvJ6y2nRwugbdfejGRiZERgkQ1wJg==
X-Received: by 10.223.160.168 with SMTP id m37mr10277642wrm.196.1491117362847; 
	Sun, 02 Apr 2017 00:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sun, 2 Apr 2017 00:16:02 -0700 (PDT)
In-Reply-To: <20170331164247.5052-37-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-37-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 2 Apr 2017 09:16:02 +0200
Message-ID: <CA+chaQcAuBazrqCgVBwcLspbmkT2q08JvXMmXBUjXnpjK9Teiw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 37/43] xarchiver: Fix build with security flags turned on
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
X-List-Received-Date: Sun, 02 Apr 2017 07:16:02 -0000
Content-Type: text/plain; charset=UTF-8

../../git/src/window.c:234:52: error: incompatible type for argument 4
of 'gtk_message_dialog_new'
  dialog = gtk_message_dialog_new (window,mode,type,"%s",button,message1);
                                                    ^~~~

http://errors.yoctoproject.org/Errors/Details/138844/


On Fri, Mar 31, 2017 at 6:42 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...formatting-string-to-printf-like-function.patch | 43
> ++++++++++++++++++++++
>  meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb  |  4 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-
> proper-formatting-string-to-printf-like-function.patch
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-
> proper-formatting-string-to-printf-like-function.patch
> b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-
> proper-formatting-string-to-printf-like-function.patch
> new file mode 100644
> index 000000000..2d7eb9a5d
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-
> proper-formatting-string-to-printf-like-function.patch
> @@ -0,0 +1,43 @@
> +From baf93ea9acf845c5455d577ac19a6f680dac3d2d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 30 Mar 2017 11:22:42 -0700
> +Subject: [PATCH] Add proper formatting string to printf-like functions
> +
> +Avoids potential security holes and makes compiler happy
> +
> +| ../../../../../../../workspace/sources/xarchiver/src/window.c:236:72:
> error: format string is not a string literal (potentially insecure)
> [-Werror,-Wformat-security]
> +|         gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG
> (dialog),message2);
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/window.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/window.c b/src/window.c
> +index ca2f69f..3b10e2c 100644
> +--- a/src/window.c
> ++++ b/src/window.c
> +@@ -231,9 +231,9 @@ int xa_show_message_dialog (GtkWindow *window,int
> mode,int type,int button,const
> + {
> +       int response;
> +
> +-      dialog = gtk_message_dialog_new (window,mode,type,button,
> message1);
> ++      dialog = gtk_message_dialog_new (window,mode,type,"%s",button,
> message1);
> +       gtk_dialog_set_default_response (GTK_DIALOG
> (dialog),GTK_RESPONSE_NO);
> +-      gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG
> (dialog),message2);
> ++      gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG
> (dialog),"%s",message2);
> +       response = gtk_dialog_run (GTK_DIALOG (dialog));
> +       gtk_widget_destroy (GTK_WIDGET (dialog));
> +       return response;
> +@@ -511,7 +511,7 @@ void xa_list_archive (GtkMenuItem *menuitem,gpointer
> data)
> +                       g_fprintf (stream,_("Comment:\n"));
> +                       if (bp)
> +                               g_fprintf(stream,"</b><pre>");
> +-                      g_fprintf (stream,archive[idx]->comment->str);
> ++                      g_fprintf (stream,"%s",archive[idx]->
> comment->str);
> +                       if (bp)
> +                               g_fprintf(stream,"</pre>");
> +                       g_fprintf (stream,"\n");
> +--
> +2.12.1
> +
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> index ca299223d..ea34a52c1 100644
> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 94d55d512a9ba36caa9b7df079bae19f"
>
>  DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
>
> -SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master"
> +SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master \
> +           file://0001-Add-proper-formatting-string-to-printf-like-function.patch
> \
> +           "
>  SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
>  PV = "0.5.3"
>  S = "${WORKDIR}/git"
> --
> 2.12.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

