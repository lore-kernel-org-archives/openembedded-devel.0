Return-Path: <andre.draszik@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0070731C2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 10:52:58 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id h190so2866143ith.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 03:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=ir9PvZiOxJbmiA3XFC4IyEb9FD/gpjkVN1fR+bHDBlw=;
	b=cFmLZy7sLPlogS5+I07scdYbHsar+VzAdI/gomA9Mj1urUEWu1PfBZ+MYE/uEOkxJo
	kCbFAc1daTK6Nr0bYvR/JsLFjAr23NPuojw+57toItPhBqnchKDr7DWpm8p/dvc0zjjV
	E2Sl7lnQMxe+DK+XAE3uggShQjXqlDWmsfqbpng4fdN5leLuqzRsa2tM5RHpRqcRiOXz
	nlbb1aFJgIHlvKLR0ZUOXTyj/LnTwYrtMQTHDzkwL4GPTW0HlJwWqTKzDFdsjhXlg1dA
	p3U7Blp6gXoGqxN7Cq6kqUtdQpTQQk9FSiF6SLqBgLoqXIF9ZvmK1vklowMS8jZ9d5Lf
	QOEQ==
X-Gm-Message-State: ALyK8tKjB9eEItEB4kAHIDVKO43KIAHvHJOQX3G2cGV9D1zzdndhvYz5F3nto6hg9iGZeA==
X-Received: by 10.36.34.14 with SMTP id o14mr26904097ito.11.1468666379108;
	Sat, 16 Jul 2016 03:52:59 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182]) by smtp.gmail.com with ESMTPSA id
	f129sm5008324ioe.35.2016.07.16.03.52.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jul 2016 03:52:58 -0700 (PDT)
Received: by mail-io0-f182.google.com with SMTP id m101so124454422ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 03:52:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.35.129 with SMTP id j123mr9050993ioj.4.1468666378056;
	Sat, 16 Jul 2016 03:52:58 -0700 (PDT)
Received: by 10.64.24.74 with HTTP; Sat, 16 Jul 2016 03:52:57 -0700 (PDT)
Received: by 10.64.24.74 with HTTP; Sat, 16 Jul 2016 03:52:57 -0700 (PDT)
In-Reply-To: <CABcZANna5ip=FF0NknkneG6pj6w3SvKyrRdP+zmK+vMJgGbnxA@mail.gmail.com>
References: <1468587261-18160-1-git-send-email-git@andred.net>
	<1468587261-18160-2-git-send-email-git@andred.net>
	<CABcZANna5ip=FF0NknkneG6pj6w3SvKyrRdP+zmK+vMJgGbnxA@mail.gmail.com>
Date: Sat, 16 Jul 2016 11:52:57 +0100
X-Gmail-Original-Message-ID: <CAKUP++vemmXt5ReFHCavtHN4Ha_8AD2g7t0Vt=-N5XwvoVWD8g@mail.gmail.com>
Message-ID: <CAKUP++vemmXt5ReFHCavtHN4Ha_8AD2g7t0Vt=-N5XwvoVWD8g@mail.gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Sat, 16 Jul 2016 10:53:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 Jul 2016 3:35 pm, "Christopher Larson" <clarson@kergoth.com> wrote:
>
> On Fri, Jul 15, 2016 at 5:54 AM, <git@andred.net> wrote:
>
> > From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> >
> > c-ares doesn't build if the distro has enabled usage of the
> > security_flags.inc file as it is picky about what is placed
> > into CPPFLAGS and CFLAGS. It complains and errors out if any
> > preprocessor options appear in CFLAGS.
> >
> > Fix this by providing an additional include file that is
> > require'd from conf/layer.conf.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> >
>
> This commit message is a little misleading. The fact that you added a .in=
c
> isn't what fixed the problem, the move of the defines from CFLAGS to
> CPPFLAGS was.

Well, I copied that part of the commit message from the commit that added a
similar .inc file to to meta-oe. I'll rewrite it.

A.

