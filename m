Return-Path: <ticotimo@gmail.com>
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2877CDC1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 05:04:27 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id j184so568789vsd.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 22:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KAhg6pi8NunL6bNHL5Ba8kskByqRTcDjdJQSWSniyO0=;
	b=ZAiAJnU6izgSkpAWbfYhqRLsK21/VD+WP4MPSEqrTHUZ/vnwoNf9q/GoKD33/xcxbU
	8+p9/f9Lo3GIZAueIhSAk7hL9xWVp6j7ruHczA4bCopwY0V+A7RUma64KgeIACnVdxKZ
	Asap4GS+sdKtg6lIURC7EE5F2ZPAA94Q1RvbaleTRm7iJjYDDtG/2g0WfgYGxytjMTVg
	xOfg12YhNPg9pFucogi8JBcI+GbrAEQhHtfj6RADcwiVMuYcQC4UP3wEcEbY3u1fYJ3m
	itFvC6FAjKZ2Es+vtIc88xKs7qLRK1MjKiTJ6b7CpNEJTqOhbgEZ38yGQrwdwcO/btL6
	Z+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KAhg6pi8NunL6bNHL5Ba8kskByqRTcDjdJQSWSniyO0=;
	b=tI9dvM4nDrpIMFo5M68yNjKB8XXN7JJ7v4ojL4VqHBCtwvBPJw+t3n73nNmQn7aB3Q
	jtIkXYYts/maRZuIfwFvoZePgqvB6qAZJx93/8+7AX8BfKa3ARskVVuUNbTsada9rST6
	oBHEwfKQXAs1Aq1OEBNRX+keR82EA+g40hNhPpL9+Evk+lMTuD8qd1KnkJ0lqKxmMqXP
	VLglltKbgYQZS+XdARd7ot5WS9vKDqhxRJOrnhEm5POP0ZAE+uVBsyy4TpluNe3FSxf8
	MCe0mBu7si08KprvKQ4wM9qKLD+5j3FPKwmuGMSJoZ/SyCLMcJsFL7Pc53SS4suuzfN3
	9JqA==
X-Gm-Message-State: APjAAAVw5GsbgWN4wJDjeu6y+mI3ajXu1j4ezaRaOI2LTBtVrP/ikjqc
	dDcR6trVtzz1DU30PiLwrWxU5y1AbwC9pBHEokc=
X-Google-Smtp-Source: APXvYqxn5+UJ1PeYi+P7iGIDWDsih7q6fK9dsnEouwoRrp8lNkeL1uJFpxne7gkNcKOuvEY3N47tANINxtVtaaFLoI8=
X-Received: by 2002:a67:ce8f:: with SMTP id c15mr28190867vse.213.1553835868509;
	Thu, 28 Mar 2019 22:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190329044956.32426-1-alistair@alistair23.me>
In-Reply-To: <20190329044956.32426-1-alistair@alistair23.me>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 28 Mar 2019 22:04:17 -0700
Message-ID: <CANx9H-BkM_B=C14448U_+yOLPEVwBCVYCa-uX-ENY+XnThLQGw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Alistair Francis <alistair@alistair23.me>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] meta-python: Initial commit of Python3 OBDII module
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
X-List-Received-Date: Fri, 29 Mar 2019 05:04:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2019 at 9:50 PM Alistair Francis <alistair23@gmail.com>
wrote:

> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  meta-python/recipes-devtools/python/python-obd.inc       | 9 +++++++++
>  meta-python/recipes-devtools/python/python3-obd_0.7.0.bb | 2 ++


Latest version. Ack.


>  2 files changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-obd.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-obd_0.7.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-obd.inc
> b/meta-python/recipes-devtools/python/python-obd.inc
> new file mode 100644
> index 000000000..f2caf6491
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-obd.inc
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "A python module for handling realtime sensor data from
> OBD-II vehicle ports"
> +HOMEPAGE = "https://github.com/brendan-w/python-OBD"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM =
> "file://README.rst;md5=2988a5e913eb105fa08011135c4157d4"


Readmes tend to change in ways not really useful from license standpoint.
Why not just use the LICENSE file provided in the repo? Or is it not
included in the tarball?

>
> +
> +SRC_URI[md5sum] = "93e04f825e13b7ebc97d06b6a6407807"
> +SRC_URI[sha256sum] =
> "4b1bac95df2faac571ebf444778e4d736d050d8ed7049023c0fc929a520eba6d"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
> b/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
> new file mode 100644
> index 000000000..578e38d3a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-obd.inc


A python2 version should be trivial, although we should be moving towards
python 3 only... so I am ok with leaving python 2 up to someone who needs
it.


> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

