Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 404166EFA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 06:46:34 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ur14so4649448igb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8PrcyUD3fw/bxrf8LpPUpX9J0LboSh4wxxbzs6LGpEU=;
	b=Aa4wM7dxFVSBbM6VXqTN6bNfcXdvhbaZMrCrZL2U6IcT8h/tCHM2TsYvaI+DrOVQ73
	gOMc2ouF1ZqIq4kPGWzjImATSY17+mTj6OJwI/Iov7z90nWy+6sXraS7pJWy0p+Fkx0T
	ngdKZQRu+XuyJEqh97YfhNgXD9jZFSVRiIwkJqerBvaxzQT175x5L4A0RNAW4eSVK5Ja
	r9TU3t09aD4Zmuxyw0nJ4DlrjvWUyihuIMz49u9YxbTJOhN6IBywOtVcqXNrsjuUkMyG
	MrBjZoq28Nk0+MVWkZV58lLGxhguJAotsGsjV0s11zXoDG5e78JQd42SFvw+dz3XloeZ
	k+Bw==
X-Received: by 10.42.114.82 with SMTP id f18mr272140icq.56.1395038795441; Sun,
	16 Mar 2014 23:46:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Sun, 16 Mar 2014 23:46:05 -0700 (PDT)
In-Reply-To: <1395010717-15721-1-git-send-email-stephen.arnold42@gmail.com>
References: <1395010717-15721-1-git-send-email-stephen.arnold42@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Mar 2014 23:46:05 -0700
Message-ID: <CAMKF1sqb1PUs3D8n8XDyVGr6b++mHywsB5KKiMqP4E=0Q-zPqg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] updated lxdm recipe depends and build config
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
X-List-Received-Date: Mon, 17 Mar 2014 06:46:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 16, 2014 at 3:58 PM, stephen.arnold42
<stephen.arnold42@gmail.com> wrote:
> +CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
> +
> +EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb"
>  EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
>
> +do_patch_extra() {
> +    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> +}
> +
> +addtask do_patch_extra before do_configure after do_patch
> +


Please describe why these changes are needed in your commit message.
-Khem

