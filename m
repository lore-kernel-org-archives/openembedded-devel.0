Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0E4A7D40F;
	Wed, 22 May 2019 20:45:24 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id b3so2992510iob.12;
	Wed, 22 May 2019 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=niv22u49y7/cY2HmpzB7d3NP3khXVPFTk43w8HgYAsg=;
	b=u0lbDKWw3pZAnMEF85g7CrEYPjBQj/WZY3RFlPCCZEYo6LX/vzN8DJtjproc0hCKc/
	rabBGEbg/HhfvSzbCRExOC3uuQtIT5B+U+hczlfa6emx0aGOfRKGpsUQmlOZMrpwvMJA
	gHR79PhviVTFGjM3vUg+I94de+pWfAZTboYFQdv4Wr0kmOsv+HbYmXXGfitbVI0FEirj
	XFUzKsPMGAwCliHMQXsW20DMU61Kd+ehApY1/f2Y4xNtv+YLgk9yrALMQ3IPpGhuok/g
	K+I/KH7wPVtKgSsXXOR6ONZmWxuGl43Ch4mk07/K40NqcuXY7dUih+dnv50F28azxFrJ
	v0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=niv22u49y7/cY2HmpzB7d3NP3khXVPFTk43w8HgYAsg=;
	b=bSN/bPfHY9H4gTBuCxfSLNyI1ZqyZ+hqqchM8x9N7+UQFoh70DYx/xq2XjkbyKvY8W
	0zd6T/SfpLchUuXfRGQ83jqTrq4Wbt/+XbOCJcNlquCzIzmfvy7O0Zsh1xXRoiDI8e1i
	X9SN98XMUBoP3izawjqTpwSbUb4BjPojX+BVjMZTkn0CbV4pzunaRiUSWAzq1+Aswyma
	4yXTjHRJ0sBzmFibNykJOy1fn008dsO2nRer/HicF9qqhJ+5ftt9/XrtfQyB2kLSdDWr
	/mR0spPyWClGYhTtdxuiRIqboyCFpy5EXxXSL+5dUiJ6ixk6fJHoyXKqKcS776FbNIg8
	3CFw==
X-Gm-Message-State: APjAAAWg1flh+f20New89O/Y+cJoCPaqumuVT5cqKaVLOhwmUcVi5Q9C
	0B8Iyp1jVZwW0/V/W7hwD24yrsvqqhqMV6Bxs56iIo523jM=
X-Google-Smtp-Source: APXvYqwn8Il98gfYyyfQx2l/DfriOnEu8g+IPx12Vhgyk9pWZshY0j8aKyF6+3b79NgaVLXs2xynZzM7PC6dMoHUkhg=
X-Received: by 2002:a5d:9a11:: with SMTP id s17mr26194355iol.267.1558557925794;
	Wed, 22 May 2019 13:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.B6296235353@git.openembedded.org>
In-Reply-To: <20190522154956.B6296235353@git.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 22 May 2019 22:45:14 +0200
Message-ID: <CALbNGRQ7VT88mxPhnW44pEOHRhGQ_QUg4WORMCyH17Q6KfE8wg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 08/09: networkmanager: Update to 1.18.0
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
X-List-Received-Date: Wed, 22 May 2019 20:45:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
>
> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 8ac5fe0ca3d32e2cf6be7555c1f84dba9106f96c
> Author: Andrei Gherzan <andrei@gherzan.ro>
> AuthorDate: Wed May 22 14:13:45 2019 +0100
>
>     networkmanager: Update to 1.18.0
>
>     One patch was dropped (0003-dlopen-failure.patch) as a similar one was
>     merged upstream. See:
>     https://github.com/NetworkManager/NetworkManager/commit/bd4957fcd78a0e64d26459e94ab3b84c91cd6f5f
>
>     Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
Wanted to do same but did not yet because of [1]: --with-libnm-glib
was removed. That means

* PACKAGECONFIG[glib] has to go
* bbappend in meta-oe has to go
* maybe glib-2.0 must be an unconditional dependency
* please check if network-manager-applet builds (that required
PACKAGECONFIG[glib]) set in the past

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/commit/5801f89f4d1464fc15cb1d97755b73f9f68cb2e6

And if you really have nothing to do with your time - you might want
to move to meson build (please don't consider this as blocker)

Cheers

Andreas

