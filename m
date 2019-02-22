Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id CDF557CB0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:07:55 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id w4so3563525qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eyjKqXElbvlWi6QmWb6J5pILYubnn/Is8ppaRDgFo5s=;
	b=RbbSfmUro1Bd6XbqBuZAudtY0DxlpXExCmOnUKQ2RvVahrrSJvVYhWU8gZaUAPsG7I
	WzUfD7XO+b3NXKESsP95iDijN4tqQyw+H2HKOZsymDZal6qul9TUuGMlikl5wrRtCXLE
	1RVOoNMgjk1EDBha/qSqmhxOLgrL93k7sBvjNdNhMWUWC+RHRxwXMHRFvHQ27wn44wfk
	9+8Alk+3rmt8roi/J4IgO8MXhgZW71ZMbwdCHfNzQ4OXLz2/nEjl7UafN5zzXsFi0w5u
	g5A8+0FaWuYD+XzXXPw0gH9OjC1dEjmIMvoxqnrlob+bdJAsJhnJw1XNZ3nYNv52/6Ns
	6tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eyjKqXElbvlWi6QmWb6J5pILYubnn/Is8ppaRDgFo5s=;
	b=ftuCA6nDaupnaNnrzPu032S9GkiwoGLxMtlqUNyaIBYt/8Z0JIjLMHHszBRoblEcyV
	fjpiveIyuJCDVm3wSUGvwqkLFxXaoN4YFjGQuKJmM86OAasi/lTyXLX+8KVq228eGS3V
	o65WPdxGb2jvt+Wov+T5Q1/mNVfDgRiVvfXopVO3XmWAJx9/+DkeliR4omgaBjB0mUFU
	olqnd2IJrR7wsgzuc7fLWSJtE0N6VFh6FjGth76Cvq0MQwt4MDghq2qAUhfHgXBPL48j
	CGk8t/cnOMpMf8AGJH+BQbTEZRPky/CC6iXVX1WoP4vgWaSOz4woqZayoqRq+DPCAUo2
	z8sA==
X-Gm-Message-State: AHQUAubfxYvWR38kiApqBFVxnI2pVgQYIeRn35HQDAb1ljCZWvyXIiCN
	SErslTBc20oC9e3vFLztvX6FZ8OLhNU3XL6rbJM=
X-Google-Smtp-Source: AHgI3IaW7C9B0SF/fDNRkBi91CjeJdZ74iCT5TLyUdXuQ7WHG1LUsF1VhAkuUvJBYP+bUIb9ZuyBhIv+tVdDBv7nDD4=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr4138617qvj.228.1550858876392; 
	Fri, 22 Feb 2019 10:07:56 -0800 (PST)
MIME-Version: 1.0
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
	<1550652980-292761-4-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1550652980-292761-4-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 10:07:30 -0800
Message-ID: <CAMKF1soyUbWgfoDTJFCQVWhMpM10aWHnqd6Qz2E=L+MUujArRQ@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] rrdtool: upgrade 1.7.0 -> 1.7.1
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
X-List-Received-Date: Fri, 22 Feb 2019 18:07:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 12:57 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb} (98%)
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
> rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
> index ff99574..1a1ca54 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
>
>  DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
>
> -SRCREV = "bfc82d5242855628b826018479df00e0ec4e8360"
> -PV = "1.7.0"
> +SRCREV = "34e6ff6218bb0372eb545f886dec96dd3d20be47"
> +PV = "1.7.1"
>

seeing some packaging failures on qemux86/musl e.g.

ERROR: SYSTEMD_SERVICE_rrdcached value rrdcached.socket does not exist

see

https://errors.yoctoproject.org/Errors/Details/229882/


Can you take care of this as a separate fix ?

>  SRC_URI = "\
>      git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http; \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

