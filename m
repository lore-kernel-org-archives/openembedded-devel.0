Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC7FB72F5A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 20:25:36 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k6so35314771wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bty5szPdoGya9XL5Z43bA0Hc82lFcUPqjEaWjGRibws=;
	b=pC3RIPBsNRhtK6wlYZ1D6BtKLNF49NjvEEHCR0F7JUKhypea1DGzoOxT24P8GsW8oz
	iDQXOw1hzAN7RcKARCHJak3NEUOBZsp6xf3vq59KKoO2fVcJDJMND+JxhwfCSAUohLpS
	8qtAfE2WZiDzZtGBJoVk58+wQjVF7o8CdpCVZe2Oy+WTr1Ex9AG0cDSmq671mHYFqRBU
	cetngrX5bv8Bpl93IPBxZOTtkYVVeAEDYLQ8c9VO8jec2Zu30d+pmFgRaGk+C1ae+gL+
	02c8F7PUh9oNRCcQZnS8KjSPVu6UZMXN3B1kEfP6eGbf0v4ZoRq0aiZ5BG+Ffm7JZFh0
	JI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bty5szPdoGya9XL5Z43bA0Hc82lFcUPqjEaWjGRibws=;
	b=q+VInWH9Z+trnf3S6eyZGlfVgSRdCqmsVgbb0ErAJaqhX8Zlj4MXIa8Ehyd5V6LqQd
	0YCjUwMzf+Tn1qNbbjxMlLb+G6nvhHZ8wOIQTHL8FxY34YbZ+GqbFUfTeSK/IYNDd88V
	Hws6UL+H0c4ecZvdn5BTk7Zv9fEWz25amsEYl1azB3BiC7AHH1xLGirDsMuTv28cYxVe
	jwXbgTRNqBRW3sWIxNA4iBc8m4fenI928lBoL75J1P89GcV/kwOdrGStqTKbx2uovcZR
	C4Tz4IhokuBNxWRf4KRk4L4L30fLdn5vOCKDhrC+MGd9P+9Hyn2FE851zx5Qt7DfW8Z6
	eKpw==
X-Gm-Message-State: AFeK/H1jeFDizIWFZ338p3UeR2XS+kiELCuY+eW+Kd9Olvp1wZAJ7YkHttVILseHRcJ0NeHjMKO2z6SEeAHqkg==
X-Received: by 10.28.199.132 with SMTP id x126mr10808887wmf.37.1491251138055; 
	Mon, 03 Apr 2017 13:25:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 3 Apr 2017 13:25:07 -0700 (PDT)
In-Reply-To: <20170403183737.14791-4-Martin.Jansa@gmail.com>
References: <20170403183737.14791-1-Martin.Jansa@gmail.com>
	<20170403183737.14791-4-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Apr 2017 13:25:07 -0700
Message-ID: <CAMKF1spbteseCFOTJEKFB4b-f3JQc-_E4r88G0AFVjQUR9X2Xg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/5] uml-utilities: respect LDFLAGS not only for mconsole but for other binaries as well
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
X-List-Received-Date: Mon, 03 Apr 2017 20:25:44 -0000
Content-Type: text/plain; charset=UTF-8

This also fixes build with clang

On Mon, Apr 3, 2017 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../uml-utilities-20040406/fix-ldflags.patch       | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
> index 05cc5371f..f4a175cdf 100644
> --- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
> +++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
> @@ -14,3 +14,91 @@
>
>   clean :
>         rm -f $(BIN) $(OBJS) *~
> +diff -uNr tools.orig/jailtest/Makefile tools/jailtest/Makefile
> +--- tools.orig/jailtest/Makefile       2017-04-03 15:56:02.068461380 +0200
> ++++ tools/jailtest/Makefile    2017-04-03 16:00:04.857449005 +0200
> +@@ -7,7 +7,7 @@
> + all : $(BIN)
> +
> + $(BIN) : $(OBJS)
> +-      $(CC) $(CFLAGS) -o $(BIN) $(OBJS)
> ++      $(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
> +
> + clean :
> +       rm -f $(BIN) $(OBJS) *~
> +diff -uNr tools.orig/moo/Makefile tools/moo/Makefile
> +--- tools.orig/moo/Makefile    2017-04-03 15:56:02.068461380 +0200
> ++++ tools/moo/Makefile 2017-04-03 15:59:56.466449432 +0200
> +@@ -10,10 +10,10 @@
> + all : $(BIN)
> +
> + uml_moo : $(uml_moo_OBJS)
> +-      $(CC) $(CFLAGS) -o $@ $($@_OBJS)
> ++      $(CC) $(CFLAGS) -o $@ $($@_OBJS) $(LDFLAGS)
> +
> + uml_mkcow : $(uml_mkcow_OBJS)
> +-      $(CC) $(CFLAGS) -o $@ $($@_OBJS)
> ++      $(CC) $(CFLAGS) -o $@ $($@_OBJS) $(LDFLAGS)
> +
> + $(uml_moo_OBJS) $(uml_mkcow_OBJS) : cow.h cow_sys.h
> +
> +diff -uNr tools.orig/port-helper/Makefile tools/port-helper/Makefile
> +--- tools.orig/port-helper/Makefile    2017-04-03 15:56:02.068461380 +0200
> ++++ tools/port-helper/Makefile 2017-04-03 15:59:41.251450208 +0200
> +@@ -7,7 +7,7 @@
> + all : $(BIN)
> +
> + $(BIN) : $(OBJS)
> +-      $(CC) $(CFLAGS) -o $(BIN) $(OBJS)
> ++      $(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
> +
> + clean :
> +       rm -f $(BIN) $(OBJS) *~
> +diff -uNr tools.orig/tunctl/Makefile tools/tunctl/Makefile
> +--- tools.orig/tunctl/Makefile 2017-04-03 15:56:02.068461380 +0200
> ++++ tools/tunctl/Makefile      2017-04-03 16:00:01.091449197 +0200
> +@@ -7,7 +7,7 @@
> + all : $(BIN)
> +
> + $(BIN) : $(OBJS)
> +-      $(CC) $(CFLAGS) -o $(BIN) $(OBJS)
> ++      $(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
> +
> + clean :
> +       rm -f $(BIN) $(OBJS) *~
> +diff -uNr tools.orig/uml_net/Makefile tools/uml_net/Makefile
> +--- tools.orig/uml_net/Makefile        2017-04-03 15:56:02.068461380 +0200
> ++++ tools/uml_net/Makefile     2017-04-03 16:00:12.449448618 +0200
> +@@ -14,7 +14,7 @@
> + all : $(BIN)
> +
> + $(BIN) : $(OBJS)
> +-      $(CC) $(CFLAGS) -o $(BIN) $(OBJS)
> ++      $(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
> +
> + clean :
> +       rm -f $(BIN) $(OBJS) *~
> +diff -uNr tools.orig/uml_router/Makefile tools/uml_router/Makefile
> +--- tools.orig/uml_router/Makefile     2017-04-03 15:56:02.068461380 +0200
> ++++ tools/uml_router/Makefile  2017-04-03 16:00:46.796446867 +0200
> +@@ -13,7 +13,7 @@
> + all : $(BIN)
> +
> + $(BIN) : $(OBJS)
> +-      $(CC) $(CFLAGS) -o $(BIN) $(OBJS)
> ++      $(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
> +
> + clean :
> +       rm -f $(BIN) $(OBJS) *~
> +diff -uNr tools.orig/watchdog/Makefile tools/watchdog/Makefile
> +--- tools.orig/watchdog/Makefile       2017-04-03 15:56:02.068461380 +0200
> ++++ tools/watchdog/Makefile    2017-04-03 15:59:45.216450006 +0200
> +@@ -7,7 +7,7 @@
> + all : $(BIN)
> +
> + $(BIN) : $(OBJS)
> +-      $(CC) $(CFLAGS) -o $(BIN) $(OBJS)
> ++      $(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
> +
> + clean :
> +       rm -f $(BIN) $(OBJS) *~
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

