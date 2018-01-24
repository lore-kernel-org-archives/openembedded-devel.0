Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 52B9D78688
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:53:27 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id q8so4704694itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 02:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OCVhwTOYiraS4BFCyapuGFNnGoYBpKlQ1UjvtASCVIU=;
	b=HQUVF6ueHN3a8iYVRNGqn7eFvsiUPyJFNY9fi1xECVHKu5KywZSpLMndcmfaIwAGtv
	KrZZnMjzdgIJEx/zCsVpkb0Y5IeA7TK1ofBn7ImNCdfYoIwwKYW00BVQAAWhcEMxokrq
	H5iLtNRB24C1j+LeGMaaDFKbsrEMo06VhZ6rWjMu/q6Oxac7pj7zwu7WHqm985K/wCOs
	GQnibGaHjLye7zkqNQmDOhHz6mh8V3GWneawBm6EwyY6fQeV5Sq3FTcBwEiEJbdPuMvE
	E6jMG7NZsIYXWorvnjGc5ERaM9nk82Twys2NM9riDHY44/TTkLu5gNpTr49Yzs4ull+1
	hdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OCVhwTOYiraS4BFCyapuGFNnGoYBpKlQ1UjvtASCVIU=;
	b=a8sX2PI1cmqFNbphEFJXCpSkU7TvIpuKPvvCZxu3dNUqKYaTyZ91n3bdNhH0TTcXHC
	5j3Z4LdzqjN+jM89FmZ13fV6nz6rGHKnEge85GIH9XZfIo0zIZvgLf/vPSEiHlFw3uAE
	03uBiU9Y+NoFaQwze/YtjN2oG3wePXaEzMKRh77dr1n9kkE926LA98/ZXY8nqkt0t6Gh
	NhTR5ZYjb9XZwUuuPmTHVmc1P81WoPKLsYyMi+fy/2QzPOU/VW/cGHqQxKWpFjza/xdr
	tQJP59G81sxGqQ0IvPr47Qvl39iSy8TthEajUYufZPShde97X35BIjzIL4SjfzYovXzp
	6arw==
X-Gm-Message-State: AKwxytdGHFbb8yqQnh45kXdd/JHFRPz9Yrkubakn+Iak2kvWDtC60iEb
	eJ6rSl9rCTGCDuMMffajVnrpwGoXXg8ktIwntwKn+g==
X-Google-Smtp-Source: AH8x226ww5Cv/GliIydpTyLtPqnNohIKyN8uzbtRrJy7rIA7SjasrPG2RVlbsmaRxfr7iy0Ps4R05gmwnoEY0nycQz8=
X-Received: by 10.36.85.206 with SMTP id e197mr8049905itb.124.1516791209352;
	Wed, 24 Jan 2018 02:53:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 24 Jan 2018 02:53:08 -0800 (PST)
In-Reply-To: <20180123223913.GA2786@denix.org>
References: <1516085015-89929-1-git-send-email-denis@denix.org>
	<20180123223913.GA2786@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jan 2018 10:53:08 +0000
Message-ID: <CAJTo0LZDJDT8d+bGbeMLxAFD3Jr54PTbNr4GdA3mR-msbfPJSA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-networking][PATCH] ndisc6: need to set USE_NLS="yes" to use gettext.h
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
X-List-Received-Date: Wed, 24 Jan 2018 10:53:28 -0000
Content-Type: text/plain; charset="UTF-8"

That should only be true for native recipes?

On 23 January 2018 at 22:39, Denys Dmytriyenko <denis@denix.org> wrote:

> Ping.
>
>
> On Tue, Jan 16, 2018 at 01:43:35AM -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Otherwise we can get gettext-minimal-native dependency instead, which
> does not
> > provide gettext.h header.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > index 48a83b8..58f1230 100644
> > --- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > +++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > @@ -22,6 +22,8 @@ EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
> >  LDFLAGS += "-fuse-ld=gold"
> >  TOOLCHAIN = "gcc"
> >
> > +USE_NLS = "yes"
> > +
> >  do_configure_prepend() {
> >      cp ${STAGING_DATADIR_NATIVE}/gettext/gettext.h ${S}/include
> >      ${S}/autogen.sh
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

